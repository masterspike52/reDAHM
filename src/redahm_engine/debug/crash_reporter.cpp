// Crash reports.
//
// The runtime's own exception handler serves the faults it expects (GPU write
// watches on physical memory) and passes on the rest after one log line, after
// which the process used to vanish. This unhandled-exception filter takes those
// over:
//  - the faulting code, named through the generated PPCFuncMappings table when
//    it is a recompiled function (its .pdata start is the table's host
//    pointer), so a Release build without a PDB still says sub_XXXXXXXX;
//  - for an access violation, the guest address it touched;
//  - the registers and the call chain, unwound from the fault's own context
//    through the .pdata unwind information;
//  - the same chain again with PDB names, when a PDB is next to the exe;
//  - crash_<date>_<time>.dmp in the logs folder, then a dialog.
// Everything the report needs (the table, the paths, symbol setup) is prepared
// at install; the crash path only reads it.

#include "redahm_engine/debug/crash_reporter.h"

#include <algorithm>
#include <atomic>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <exception>
#include <filesystem>
#include <string>
#include <typeinfo>
#include <vector>

#include <rex/logging.h>
#include <rex/ppc/func.h>
#include <rex/runtime.h>

#include "redahm_engine/redahm_logging.h"

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#include <dbghelp.h>

#pragma comment(lib, "dbghelp.lib")

namespace redahm::crash {

namespace {

constexpr u64 kGuestAddressSpace = 0x100000000ull;
constexpr int kMaxFrames = 48;

// Set by the first report; a fault inside a report, or the abort that ends
// the terminate handler, goes straight to dying.
std::atomic_flag g_reporting = ATOMIC_FLAG_INIT;

struct GuestFunction {
  uintptr_t host;
  u32 guest;
};
// PPCFuncMappings by host address.
std::vector<GuestFunction> g_guest_functions;
std::filesystem::path g_log_dir;
bool g_symbols = false;

void PrepareGuestFunctions() {
  if (!g_guest_functions.empty())
    return;
  for (const PPCFuncMapping* m = PPCFuncMappings; m->host; ++m)
    g_guest_functions.push_back({reinterpret_cast<uintptr_t>(m->host), u32(m->guest)});
  std::sort(g_guest_functions.begin(), g_guest_functions.end(),
            [](const GuestFunction& a, const GuestFunction& b) { return a.host < b.host; });
}

// The recompiled guest function whose code starts at `start`, or 0.
u32 GuestFunctionAt(uintptr_t start) {
  auto it = std::lower_bound(g_guest_functions.begin(), g_guest_functions.end(), start,
                             [](const GuestFunction& f, uintptr_t v) { return f.host < v; });
  return it != g_guest_functions.end() && it->host == start ? it->guest : 0;
}

std::string ModuleOf(uintptr_t address, uintptr_t& base) {
  HMODULE module = nullptr;
  base = 0;
  if (!GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
                              GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                          reinterpret_cast<LPCWSTR>(address), &module)) {
    return "?";
  }
  base = reinterpret_cast<uintptr_t>(module);
  char path[MAX_PATH] = {};
  GetModuleFileNameA(module, path, MAX_PATH);
  const char* slash = std::strrchr(path, '\\');
  return slash ? slash + 1 : path;
}

// A code address as module+offset, plus the guest function it belongs to.
std::string Describe(uintptr_t pc) {
  uintptr_t base = 0;
  std::string text = fmt::format("{:#018x} {}+{:#x}", pc, ModuleOf(pc, base), pc - base);
  DWORD64 image_base = 0;
  if (const RUNTIME_FUNCTION* fn = RtlLookupFunctionEntry(pc, &image_base, nullptr)) {
    const uintptr_t start = uintptr_t(image_base) + fn->BeginAddress;
    if (const u32 guest = GuestFunctionAt(start))
      text += fmt::format("  sub_{:08X}+{:#x}", guest, pc - start);
  }
  return text;
}

std::string SymbolOf(uintptr_t pc) {
  alignas(SYMBOL_INFO) char buffer[sizeof(SYMBOL_INFO) + 512] = {};
  auto* symbol = reinterpret_cast<SYMBOL_INFO*>(buffer);
  symbol->SizeOfStruct = sizeof(SYMBOL_INFO);
  symbol->MaxNameLen = 511;
  DWORD64 displacement = 0;
  if (!SymFromAddr(GetCurrentProcess(), pc, &displacement, symbol))
    return "?";
  return fmt::format("{}+{:#x}", symbol->Name, displacement);
}

// The fault's call chain: each frame's return address, found through the
// unwind information the way the OS itself unwinds; a frame without any
// (a leaf, or a jump to a bad address) returns to the address at the stack top.
std::vector<uintptr_t> Unwind(const CONTEXT& fault) {
  std::vector<uintptr_t> frames;
  CONTEXT context = fault;
  for (int i = 0; i < kMaxFrames && context.Rip; ++i) {
    frames.push_back(context.Rip);
    DWORD64 image_base = 0;
    const RUNTIME_FUNCTION* fn = RtlLookupFunctionEntry(context.Rip, &image_base, nullptr);
    if (fn) {
      void* handler_data = nullptr;
      DWORD64 establisher = 0;
      RtlVirtualUnwind(UNW_FLAG_NHANDLER, image_base, context.Rip, const_cast<RUNTIME_FUNCTION*>(fn),
                       &context, &handler_data, &establisher, nullptr);
    } else {
      if (!context.Rsp || (context.Rsp & 7))
        break;
      context.Rip = *reinterpret_cast<const DWORD64*>(context.Rsp);
      context.Rsp += 8;
    }
  }
  return frames;
}

std::string ThreadName() {
  PWSTR wide = nullptr;
  std::string name = "?";
  if (SUCCEEDED(GetThreadDescription(GetCurrentThread(), &wide)) && wide) {
    const int n = WideCharToMultiByte(CP_UTF8, 0, wide, -1, nullptr, 0, nullptr, nullptr);
    if (n > 1) {
      name.assign(size_t(n - 1), '\0');
      WideCharToMultiByte(CP_UTF8, 0, wide, -1, name.data(), n, nullptr, nullptr);
    }
    LocalFree(wide);
  }
  return name;
}

const char* ExceptionName(DWORD code) {
  switch (code) {
    case EXCEPTION_ACCESS_VIOLATION:
      return "access violation";
    case EXCEPTION_ILLEGAL_INSTRUCTION:
      return "illegal instruction";
    case EXCEPTION_STACK_OVERFLOW:
      return "stack overflow";
    case EXCEPTION_INT_DIVIDE_BY_ZERO:
      return "integer divide by zero";
    case EXCEPTION_IN_PAGE_ERROR:
      return "in-page error";
    default:
      return "exception";
  }
}

std::filesystem::path WriteMinidump(EXCEPTION_POINTERS* pointers) {
  SYSTEMTIME t;
  GetLocalTime(&t);
  const std::filesystem::path path =
      g_log_dir / fmt::format("crash_{:04}{:02}{:02}_{:02}{:02}{:02}.dmp", t.wYear, t.wMonth,
                              t.wDay, t.wHour, t.wMinute, t.wSecond);
  const HANDLE file = CreateFileW(path.c_str(), GENERIC_WRITE, 0, nullptr, CREATE_ALWAYS,
                                  FILE_ATTRIBUTE_NORMAL, nullptr);
  if (file == INVALID_HANDLE_VALUE)
    return {};
  MINIDUMP_EXCEPTION_INFORMATION info{};
  info.ThreadId = GetCurrentThreadId();
  info.ExceptionPointers = pointers;
  info.ClientPointers = FALSE;
  // The guest address space is gigabytes of reservation; only memory the
  // threads point at goes in.
  const auto type = MINIDUMP_TYPE(MiniDumpWithIndirectlyReferencedMemory | MiniDumpWithThreadInfo |
                                  MiniDumpWithUnloadedModules);
  const bool written = MiniDumpWriteDump(GetCurrentProcess(), GetCurrentProcessId(), file, type,
                                         pointers ? &info : nullptr, nullptr, nullptr);
  CloseHandle(file);
  return written ? path : std::filesystem::path{};
}

void ShowDialog(const std::string& summary, const std::filesystem::path& dump) {
  std::string text = "redahm hit a fatal error and has to close.\n\n" + summary;
  text += "\n\nThe details are at the end of the newest log in the logs folder";
  text += dump.empty() ? "." : ", with a crash dump:\n" + dump.string();
  const int n = MultiByteToWideChar(CP_UTF8, 0, text.c_str(), -1, nullptr, 0);
  std::wstring wide(size_t(n > 0 ? n : 1), L'\0');
  MultiByteToWideChar(CP_UTF8, 0, text.c_str(), -1, wide.data(), n);
  MessageBoxW(nullptr, wide.c_str(), L"redahm crashed",
              MB_OK | MB_ICONERROR | MB_TOPMOST | MB_SETFOREGROUND);
}

LONG WINAPI UnhandledException(EXCEPTION_POINTERS* pointers) {
  if (g_reporting.test_and_set(std::memory_order_acq_rel))
    return EXCEPTION_EXECUTE_HANDLER;
  const EXCEPTION_RECORD& record = *pointers->ExceptionRecord;
  const CONTEXT& context = *pointers->ContextRecord;
  const uintptr_t pc = uintptr_t(record.ExceptionAddress);

  RDAHM_ERROR("================ redahm crash ================");
  RDAHM_ERROR("{} ({:#010x}) on thread {} ({})", ExceptionName(record.ExceptionCode),
              u32(record.ExceptionCode), GetCurrentThreadId(), ThreadName());
  RDAHM_ERROR("at {}", Describe(pc));
  std::string summary = fmt::format("{} at {}", ExceptionName(record.ExceptionCode), Describe(pc));
  if (record.ExceptionCode == EXCEPTION_ACCESS_VIOLATION && record.NumberParameters >= 2) {
    const ULONG_PTR operation = record.ExceptionInformation[0];
    const u64 address = record.ExceptionInformation[1];
    const char* verb = operation == 0 ? "read" : operation == 1 ? "write" : "execute";
    RDAHM_ERROR("{} of {:#018x}", verb, address);
    const auto* runtime = rex::Runtime::instance();
    const u64 membase = runtime ? u64(runtime->virtual_membase()) : 0;
    if (membase && address >= membase && address < membase + kGuestAddressSpace) {
      RDAHM_ERROR("guest address {:#010x}", u32(address - membase));
      summary += fmt::format("\n{} of guest address {:#010x}", verb, u32(address - membase));
    }
  }
  RDAHM_ERROR("rax {:016x} rbx {:016x} rcx {:016x} rdx {:016x}", context.Rax, context.Rbx,
              context.Rcx, context.Rdx);
  RDAHM_ERROR("rsi {:016x} rdi {:016x} rbp {:016x} rsp {:016x}", context.Rsi, context.Rdi,
              context.Rbp, context.Rsp);
  RDAHM_ERROR("r8  {:016x} r9  {:016x} r10 {:016x} r11 {:016x}", context.R8, context.R9,
              context.R10, context.R11);
  RDAHM_ERROR("r12 {:016x} r13 {:016x} r14 {:016x} r15 {:016x}", context.R12, context.R13,
              context.R14, context.R15);
  const std::vector<uintptr_t> frames = Unwind(context);
  RDAHM_ERROR("call chain:");
  for (size_t i = 0; i < frames.size(); ++i)
    RDAHM_ERROR("  [{:2}] {}", i, Describe(frames[i]));
  rex::FlushLogging();

  const std::filesystem::path dump = WriteMinidump(pointers);
  RDAHM_ERROR("minidump: {}", dump.empty() ? std::string("not written") : dump.string());
  rex::FlushLogging();

  // PDB names last: loading the PDB is the slowest and most fragile step.
  if (g_symbols) {
    RDAHM_ERROR("call chain, with symbols:");
    for (size_t i = 0; i < frames.size(); ++i)
      RDAHM_ERROR("  [{:2}] {}", i, SymbolOf(frames[i]));
  }
  RDAHM_ERROR("==============================================");
  rex::FlushLogging();

  ShowDialog(summary, dump);
  return EXCEPTION_EXECUTE_HANDLER;
}

std::string TypeName(const std::type_info& type) {
  return type.name();
}

[[noreturn]] void Terminate() {
  if (g_reporting.test_and_set(std::memory_order_acq_rel))
    std::_Exit(3);
  std::string detail = "std::terminate with no active exception";
  if (std::exception_ptr active = std::current_exception()) {
    try {
      std::rethrow_exception(active);
    } catch (const std::exception& e) {
      detail = fmt::format("uncaught {}: {}", TypeName(typeid(e)), e.what());
    } catch (...) {
      detail = "uncaught exception of a non-std type";
    }
  }
  RDAHM_ERROR("================ redahm crash ================");
  RDAHM_ERROR("{} on thread {} ({})", detail, GetCurrentThreadId(), ThreadName());
  RDAHM_ERROR("==============================================");
  rex::FlushLogging();
  ShowDialog(detail, {});
  std::abort();
}

}  // namespace

std::string GuestCallChain(int max_frames) {
  PrepareGuestFunctions();
  CONTEXT context = {};
  RtlCaptureContext(&context);
  std::string chain;
  int count = 0;
  for (const uintptr_t pc : Unwind(context)) {
    DWORD64 image_base = 0;
    const RUNTIME_FUNCTION* fn = RtlLookupFunctionEntry(pc, &image_base, nullptr);
    if (!fn)
      continue;
    const uintptr_t start = uintptr_t(image_base) + fn->BeginAddress;
    const u32 guest = GuestFunctionAt(start);
    if (!guest)
      continue;
    chain += fmt::format("{}sub_{:08X}+{:#x}", chain.empty() ? "" : " <- ", guest, pc - start);
    if (++count >= max_frames)
      break;
  }
  return chain.empty() ? "(no guest frames)" : chain;
}

void InstallTerminateHandler() {
  std::set_terminate(&Terminate);
}

void InstallCrashReporter() {
  PrepareGuestFunctions();
  // Where the runtime writes its logs (a logs folder in the working folder).
  std::error_code error;
  g_log_dir = std::filesystem::current_path(error) / "logs";
  std::filesystem::create_directories(g_log_dir, error);
  // Deferred: the PDB loads only if a report asks for a name.
  SymSetOptions(SYMOPT_UNDNAME | SYMOPT_DEFERRED_LOADS | SYMOPT_FAIL_CRITICAL_ERRORS);
  g_symbols = SymInitialize(GetCurrentProcess(), nullptr, TRUE) != FALSE;
  SetUnhandledExceptionFilter(&UnhandledException);
  RDAHM_INFO("[crash] reporter installed ({} recompiled functions, symbols {})",
             g_guest_functions.size(), g_symbols ? "available" : "unavailable");
}

}  // namespace redahm::crash
