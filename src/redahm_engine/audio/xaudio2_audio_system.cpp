#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include "xaudio2_audio_system.h"
#include "xaudio2_audio_driver.h"

#include <rex/logging.h>
#include <rex/types.h>

namespace xaudio2 {

    XAudio2AudioSystem::XAudio2AudioSystem(rex::runtime::FunctionDispatcher* function_dispatcher)
        : AudioSystem(function_dispatcher) {
    }

    XAudio2AudioSystem::~XAudio2AudioSystem() {
        if (mastering_voice_) {
            mastering_voice_->DestroyVoice();
            mastering_voice_ = nullptr;
        }
        if (com_initialized_) {
            CoUninitialize();
            com_initialized_ = false;
        }
    }

    std::unique_ptr<rex::system::IAudioSystem> XAudio2AudioSystem::Create(
        rex::runtime::FunctionDispatcher* dispatcher) {
        return std::make_unique<XAudio2AudioSystem>(dispatcher);
    }

    void XAudio2AudioSystem::Initialize() {
        // COM must be initialized on this thread before XAudio2Create.
        // AudioSystem calls Initialize() from the audio worker thread.
        HRESULT hr = CoInitializeEx(nullptr, COINIT_MULTITHREADED);
        if (FAILED(hr) && hr != RPC_E_CHANGED_MODE) {
            REXAPU_ERROR("XAudio2: CoInitializeEx failed: {:08X}", static_cast<uint32_t>(hr));
            return;
        }
        // Only call CoUninitialize if we were the ones who initialized COM.
        // RPC_E_CHANGED_MODE means it was already initialized; S_FALSE means
        // it was already initialized on this thread with the same model.
        com_initialized_ = (hr == S_OK);

        AudioSystem::Initialize();

        hr = XAudio2Create(xaudio2_.GetAddressOf(), 0, XAUDIO2_DEFAULT_PROCESSOR);
        if (FAILED(hr)) {
            REXAPU_ERROR("XAudio2Create failed: {:08X}", static_cast<uint32_t>(hr));
            return;
        }

        hr = xaudio2_->CreateMasteringVoice(&mastering_voice_);
        if (FAILED(hr)) {
            REXAPU_ERROR("XAudio2: CreateMasteringVoice failed: {:08X}", static_cast<uint32_t>(hr));
            xaudio2_.Reset();
            return;
        }
    }

    rex::X_STATUS XAudio2AudioSystem::CreateDriver(size_t index, rex::thread::Semaphore* semaphore,
        rex::audio::AudioDriver** out_driver) {
        if (!xaudio2_) {
            return static_cast<rex::X_STATUS>(0xC0000001L);  // X_STATUS_UNSUCCESSFUL
        }

        uint8_t device_channels = 6;
        if (mastering_voice_) {
            XAUDIO2_VOICE_DETAILS details = {};
            mastering_voice_->GetVoiceDetails(&details);
            if (details.InputChannels < 6) {
                device_channels = 2;
            }
        }

        auto on_completed = [semaphore]() {
            semaphore->Release(1, nullptr);
            };

        auto* driver = new XAudio2AudioDriver(memory_, xaudio2_.Get(),
            device_channels,
            std::move(on_completed));
        if (!driver->Initialize()) {
            delete driver;
            return static_cast<rex::X_STATUS>(0xC0000001L);  // X_STATUS_UNSUCCESSFUL
        }

        *out_driver = driver;
        return static_cast<rex::X_STATUS>(0x00000000L);  // X_STATUS_SUCCESS
    }

    void XAudio2AudioSystem::DestroyDriver(rex::audio::AudioDriver* driver) {
        auto* d = static_cast<XAudio2AudioDriver*>(driver);
        d->Shutdown();
        delete d;
    }

}  // namespace xaudio2