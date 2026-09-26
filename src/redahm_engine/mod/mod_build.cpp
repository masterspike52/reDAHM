// Packages built from the mods' package edits.
//
// A mod edits packages two ways besides shipping whole files:
//   .PackagePatch files beside where the package lives
//     (KronosGame/CookedXenon/IS_Gorta.xxx.PackagePatch), each made against
//     the game's original package;
//   texture packs: a .TFCMapping anywhere in the mod with the .tfc files its
//     entries name ("LocalMips_0.tfc") beside it, replacing textures by object
//     path in whichever packages hold them.
// Each package a mod edits is built once into mods/_generated, uncompressed:
// the game's original (TFC Installer backups first, since an installed mod
// leaves the game folder edited), then every enabled mod in order, where a
// mod's whole copy of the package starts over from that copy and its patch and
// texture pack apply on top. A package whose last word is a mod's whole copy
// isn't built; the copy is served as it is.
//
// The build is keyed on the enabled mods, every file in them and every
// package in the game folder (sizes and times); mods/_generated/manifest.txt
// keeps the key and what was built, and a matching key reuses it. A build
// reads each package's header to find the texture packs' targets, then
// builds in parallel.

#include "redahm_engine/mod/mod_build.h"

#include <algorithm>
#include <atomic>
#include <cctype>
#include <chrono>
#include <fstream>
#include <functional>
#include <iterator>
#include <mutex>
#include <set>
#include <sstream>
#include <thread>
#include <unordered_map>
#include <unordered_set>

#include "redahm_engine/mod/mod_packages.h"
#include "redahm_engine/redahm_logging.h"

namespace redahm::mods {

namespace {

namespace fs = std::filesystem;
using Clock = std::chrono::steady_clock;

constexpr std::string_view kBuildVersion = "redahm-mods-2";
constexpr std::string_view kManifest = "manifest.txt";
constexpr std::string_view kPackageFolder = "KronosGame\\CookedXenon";
constexpr std::string_view kBackupsFolder = "TFCInstallerBackups";
constexpr std::string_view kBackupSuffix = "Backup";

std::string Lower(std::string text) {
  std::transform(text.begin(), text.end(), text.begin(),
                 [](unsigned char c) { return char(std::tolower(c)); });
  return text;
}

std::string GamePath(const fs::path& relative) {
  std::string path = relative.generic_string();
  std::replace(path.begin(), path.end(), '/', '\\');
  return path;
}

bool EndsWith(const std::string& text, std::string_view suffix) {
  return text.size() >= suffix.size() &&
         Lower(text.substr(text.size() - suffix.size())) == Lower(std::string(suffix));
}

std::optional<Bytes> ReadFile(const fs::path& path) {
  std::ifstream in(path, std::ios::binary);
  if (!in)
    return std::nullopt;
  return Bytes(std::istreambuf_iterator<char>(in), {});
}

bool WriteFile(const fs::path& path, const Bytes& data) {
  std::error_code error;
  fs::create_directories(path.parent_path(), error);
  std::ofstream out(path, std::ios::binary | std::ios::trunc);
  out.write(reinterpret_cast<const char*>(data.data()), std::streamsize(data.size()));
  return bool(out);
}

uint64_t Fnv(uint64_t hash, std::string_view text) {
  for (unsigned char c : text) {
    hash ^= c;
    hash *= 1099511628211ull;
  }
  return hash;
}

std::string Stamp(const fs::path& path) {
  std::error_code error;
  const auto size = fs::file_size(path, error);
  const auto time = fs::last_write_time(path, error).time_since_epoch().count();
  return std::to_string(size) + ":" + std::to_string(time);
}

// Runs fn(i) for i in [0, count) on up to eight threads (a package can
// unpack to hundreds of megabytes).
void ParallelFor(size_t count, const std::function<void(size_t)>& fn) {
  std::atomic<size_t> next{0};
  const unsigned workers = std::max(1u, std::min(std::thread::hardware_concurrency(), 8u));
  std::vector<std::thread> threads;
  for (unsigned w = 0; w < workers; ++w) {
    threads.emplace_back([&] {
      for (size_t i; (i = next.fetch_add(1)) < count;)
        fn(i);
    });
  }
  for (auto& t : threads)
    t.join();
}

struct ModEdits {
  std::map<std::string, fs::path> patches;  // lower-cased package game path
  std::map<std::string, fs::path> whole;    // the mod's own copies of packages
  std::vector<fs::path> mappings;
  std::vector<fs::path> remappings;  // *.IdRemappings.xml
};

ModEdits CollectEdits(const ModSource& mod) {
  ModEdits edits;
  std::error_code error;
  for (auto it = fs::recursive_directory_iterator(mod.dir, error);
       !error && it != fs::recursive_directory_iterator(); it.increment(error)) {
    if (!it->is_regular_file())
      continue;
    const std::string name = it->path().filename().string();
    if (EndsWith(name, ".TFCMapping")) {
      edits.mappings.push_back(it->path());
      continue;
    }
    if (EndsWith(name, ".IdRemappings.xml")) {
      edits.remappings.push_back(it->path());
      continue;
    }
    const fs::path relative = fs::relative(it->path(), mod.root, error);
    if (error || relative.empty() || *relative.begin() == "..")
      continue;
    const std::string game_path = GamePath(relative);
    if (EndsWith(name, ".PackagePatch"))
      edits.patches[Lower(game_path.substr(0, game_path.size() - 13))] = it->path();
    else if (EndsWith(name, ".xxx"))
      edits.whole[Lower(game_path)] = it->path();
  }
  return edits;
}

// The TFC Installer's backups of the packages it edited: lower-cased game
// path -> the original.
std::map<std::string, fs::path> InstallerBackups(const fs::path& game_root) {
  std::map<std::string, fs::path> backups;
  std::error_code error;
  const fs::path folder = game_root / std::string(kBackupsFolder);
  for (auto it = fs::directory_iterator(folder, error);
       !error && it != fs::directory_iterator(); it.increment(error)) {
    const fs::path game = it->path() / "Game";
    if (!fs::is_directory(game, error))
      continue;
    for (auto f = fs::recursive_directory_iterator(game, error);
         !error && f != fs::recursive_directory_iterator(); f.increment(error)) {
      const std::string name = f->path().filename().string();
      if (!f->is_regular_file() || !EndsWith(name, kBackupSuffix))
        continue;
      const std::string game_path = GamePath(fs::relative(f->path(), game, error));
      backups.emplace(Lower(game_path.substr(0, game_path.size() - kBackupSuffix.size())), f->path());
    }
  }
  return backups;
}

struct GamePackage {
  std::string game_path;
  fs::path original;  // the backup, else the game's file
};

std::vector<GamePackage> GamePackages(const fs::path& game_root,
                                      const std::map<std::string, fs::path>& backups) {
  std::vector<GamePackage> packages;
  std::error_code error;
  const fs::path folder = game_root / fs::path(std::string(kPackageFolder));
  for (auto it = fs::directory_iterator(folder, error);
       !error && it != fs::directory_iterator(); it.increment(error)) {
    if (!it->is_regular_file() || !EndsWith(it->path().filename().string(), ".xxx"))
      continue;
    const std::string game_path = GamePath(fs::relative(it->path(), game_root, error));
    const auto backup = backups.find(Lower(game_path));
    packages.push_back({game_path, backup != backups.end() ? backup->second : it->path()});
  }
  std::sort(packages.begin(), packages.end(),
            [](const auto& a, const auto& b) { return a.game_path < b.game_path; });
  return packages;
}

std::string BuildKey(const std::vector<ModSource>& mods, const std::vector<GamePackage>& packages) {
  uint64_t hash = Fnv(14695981039346656037ull, kBuildVersion);
  for (const ModSource& mod : mods) {
    hash = Fnv(hash, "mod:" + mod.name + ":" + mod.root.string());
    std::vector<std::string> lines;
    std::error_code error;
    for (auto it = fs::recursive_directory_iterator(mod.dir, error);
         !error && it != fs::recursive_directory_iterator(); it.increment(error)) {
      if (it->is_regular_file())
        lines.push_back(GamePath(fs::relative(it->path(), mod.dir, error)) + "=" + Stamp(it->path()));
    }
    std::sort(lines.begin(), lines.end());
    for (const auto& line : lines)
      hash = Fnv(hash, line);
  }
  for (const GamePackage& p : packages)
    hash = Fnv(hash, p.game_path + "=" + p.original.string() + "=" + Stamp(p.original));
  char text[24];
  std::snprintf(text, sizeof(text), "%016llx", static_cast<unsigned long long>(hash));
  return text;
}

std::map<std::string, BuiltFile> ReadManifest(const fs::path& generated, const std::string& key) {
  std::map<std::string, BuiltFile> built;
  std::ifstream in(generated / std::string(kManifest));
  std::string line;
  if (!std::getline(in, line) || line != key)
    return {};
  while (std::getline(in, line)) {
    if (line.empty())
      continue;
    const fs::path host = generated / fs::path(line);
    std::error_code error;
    if (!fs::is_regular_file(host, error))
      return {};
    built[Lower(line)] = {host, line};
  }
  return built;
}

void WriteManifest(const fs::path& generated, const std::string& key,
                   const std::map<std::string, BuiltFile>& built) {
  std::ofstream out(generated / std::string(kManifest), std::ios::trunc);
  out << key << "\n";
  for (const auto& [lower, file] : built)
    out << file.game_path << "\n";
}

}  // namespace

std::map<std::string, BuiltFile> BuildPackages(const std::vector<ModSource>& mods,
                                               const fs::path& game_root,
                                               const fs::path& generated) {
  std::vector<ModEdits> edits;
  bool any = false;
  for (const ModSource& mod : mods) {
    edits.push_back(CollectEdits(mod));
    any = any || !edits.back().patches.empty() || !edits.back().mappings.empty();
  }
  if (!any)
    return {};

  const auto backups = InstallerBackups(game_root);
  if (!backups.empty())
    RDAHM_WARN("[mods] the game folder holds TFC Installer edits; building from its {} backed-up "
               "originals. Restore them to play without these mods.",
               backups.size());
  const std::vector<GamePackage> packages = GamePackages(game_root, backups);
  const std::string key = BuildKey(mods, packages);
  if (auto built = ReadManifest(generated, key); !built.empty()) {
    RDAHM_INFO("[mods] {} edited packages unchanged since the last build", built.size());
    return built;
  }

  const auto start = Clock::now();
  std::error_code error;
  fs::remove_all(generated, error);
  fs::create_directories(generated, error);

  // Texture packs, in mod order, with each mod's ID remappings (object paths
  // that name another object in a given package).
  std::vector<std::vector<std::unique_ptr<TexturePack>>> packs(mods.size());
  std::vector<std::unordered_map<std::string, std::unordered_set<std::string>>> remaps(mods.size());
  for (size_t m = 0; m < mods.size(); ++m) {
    for (const fs::path& file : edits[m].remappings) {
      if (const auto bytes = ReadFile(file)) {
        for (auto& [package, ids] : ReadIdRemappings(std::string(bytes->begin(), bytes->end())))
          remaps[m][package].insert(ids.begin(), ids.end());
      }
    }
    for (const fs::path& mapping : edits[m].mappings) {
      auto pack = std::make_unique<TexturePack>();
      const auto bytes = ReadFile(mapping);
      const PatchResult loaded = bytes ? LoadTexturePack(*bytes, *pack) : PatchResult{false, "unreadable"};
      if (!loaded.ok) {
        RDAHM_ERROR("[mods] '{}': {}: {}", mods[m].name, mapping.filename().string(), loaded.error);
        continue;
      }
      std::set<std::string> tfcs;
      for (const auto& [path, entry] : pack->entries)
        tfcs.insert(entry.tfc);
      for (const std::string& name : tfcs) {
        fs::path file;
        for (const auto& candidate : fs::directory_iterator(mapping.parent_path(), error)) {
          if (Lower(candidate.path().stem().string()) == name &&
              Lower(candidate.path().extension().string()) == ".tfc")
            file = candidate.path();
        }
        if (auto tfc = file.empty() ? std::nullopt : ReadFile(file))
          pack->tfcs[name] = std::move(*tfc);
        else
          RDAHM_ERROR("[mods] '{}': {} names {}.tfc, which isn't beside it", mods[m].name,
                      mapping.filename().string(), name);
      }
      RDAHM_INFO("[mods] '{}': texture pack {} with {} textures{}", mods[m].name,
                 mapping.filename().string(), pack->entries.size(),
                 pack->skipped_external
                     ? fmt::format(" ({} with external TFC mips skipped: not supported)",
                                   pack->skipped_external)
                     : std::string());
      packs[m].push_back(std::move(pack));
    }
  }

  // Which packages each pack touches, from their headers.
  std::vector<std::vector<bool>> touched(packages.size());
  bool has_packs = false;
  for (const auto& list : packs)
    has_packs = has_packs || !list.empty();
  if (has_packs) {
    ParallelFor(packages.size(), [&](size_t i) {
      std::vector<bool> hits(mods.size(), false);
      if (const auto file = ReadFile(packages[i].original)) {
        if (const auto paths = TexturePaths(*file)) {
          const std::string lower = Lower(packages[i].game_path);
          for (size_t m = 0; m < mods.size(); ++m) {
            const auto remap = remaps[m].find(lower);
            for (const auto& pack : packs[m]) {
              for (const std::string& path : *paths) {
                if (pack->entries.count(path) &&
                    (remap == remaps[m].end() || !remap->second.count(path))) {
                  hits[m] = true;
                  break;
                }
              }
            }
          }
        }
      }
      touched[i] = std::move(hits);
    });
  }

  // The packages to build, in the game's list order.
  struct Job {
    const GamePackage* package;
    std::vector<bool> texture_mods;
  };
  std::vector<Job> jobs;
  std::unordered_map<std::string, size_t> by_path;
  for (size_t i = 0; i < packages.size(); ++i) {
    const std::string lower = Lower(packages[i].game_path);
    bool wanted = false;
    for (size_t m = 0; m < mods.size(); ++m)
      wanted = wanted || edits[m].patches.count(lower) || (has_packs && touched[i][m]);
    if (!wanted)
      continue;
    by_path[lower] = jobs.size();
    jobs.push_back({&packages[i], has_packs ? touched[i] : std::vector<bool>(mods.size(), false)});
  }
  for (size_t m = 0; m < mods.size(); ++m) {
    for (const auto& [lower, patch] : edits[m].patches) {
      if (!by_path.count(lower))
        RDAHM_WARN("[mods] '{}': {} patches a package the game doesn't have", mods[m].name,
                   patch.filename().string());
    }
  }

  std::mutex built_mutex;
  std::map<std::string, BuiltFile> built;
  std::atomic<int> failed{0}, textures{0};
  ParallelFor(jobs.size(), [&](size_t j) {
    const Job& job = jobs[j];
    const std::string lower = Lower(job.package->game_path);
    // Where the package's last whole copy comes from, and whether anything
    // edits it after that.
    size_t start_mod = 0;
    bool from_copy = false;
    for (size_t m = 0; m < mods.size(); ++m) {
      if (edits[m].whole.count(lower)) {
        start_mod = m;
        from_copy = true;
      }
    }
    bool edited = false;
    for (size_t m = start_mod; m < mods.size(); ++m)
      edited = edited || edits[m].patches.count(lower) || job.texture_mods[m];
    if (!edited)
      return;
    const fs::path source = from_copy ? edits[start_mod].whole.at(lower) : job.package->original;
    const auto file = ReadFile(source);
    auto image = file ? DecompressPackage(*file) : std::nullopt;
    if (!image) {
      RDAHM_ERROR("[mods] couldn't read {}", source.string());
      ++failed;
      return;
    }
    for (size_t m = start_mod; m < mods.size(); ++m) {
      if (const auto patch = edits[m].patches.find(lower); patch != edits[m].patches.end()) {
        const auto bytes = ReadFile(patch->second);
        const PatchResult applied = bytes ? ApplyPackagePatch(*image, *bytes) : PatchResult{false, "unreadable"};
        if (!applied.ok) {
          RDAHM_ERROR("[mods] '{}': {} not applied: {}", mods[m].name,
                      patch->second.filename().string(), applied.error);
          ++failed;
        }
      }
      if (job.texture_mods[m]) {
        const auto remap = remaps[m].find(lower);
        const std::unordered_set<std::string>* excluded =
            remap != remaps[m].end() ? &remap->second : nullptr;
        for (const auto& pack : packs[m]) {
          const int count = ApplyTexturePack(*image, *pack, excluded);
          if (count < 0) {
            RDAHM_ERROR("[mods] '{}': texture pack not applied to {}", mods[m].name,
                        job.package->game_path);
            ++failed;
          } else {
            textures += count;
          }
        }
      }
    }
    const fs::path out = generated / fs::path(job.package->game_path);
    if (!WriteFile(out, *image)) {
      RDAHM_ERROR("[mods] couldn't write {}", out.string());
      ++failed;
      return;
    }
    std::lock_guard lock(built_mutex);
    built[lower] = {out, job.package->game_path};
  });

  WriteManifest(generated, key, built);
  const double seconds = std::chrono::duration<double>(Clock::now() - start).count();
  RDAHM_INFO("[mods] built {} packages ({} textures replaced) in {:.1f} s{}", built.size(),
             textures.load(), seconds,
             failed ? fmt::format(", {} problems (see above)", failed.load()) : std::string());
  return built;
}

}  // namespace redahm::mods
