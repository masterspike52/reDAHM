#pragma once

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <xaudio2.h>
#include <wrl/client.h>

#include <rex/audio/audio_system.h>

namespace xaudio2 {

    class XAudio2AudioSystem : public rex::audio::AudioSystem {
    public:
        explicit XAudio2AudioSystem(rex::runtime::FunctionDispatcher* function_dispatcher);
        ~XAudio2AudioSystem() override;

        static std::unique_ptr<rex::system::IAudioSystem> Create(
            rex::runtime::FunctionDispatcher* dispatcher);

    protected:
        void Initialize() override;

        rex::X_STATUS CreateDriver(size_t index, rex::thread::Semaphore* semaphore,
            rex::audio::AudioDriver** out_driver) override;
        void DestroyDriver(rex::audio::AudioDriver* driver) override;

    private:
        Microsoft::WRL::ComPtr<IXAudio2> xaudio2_;
        IXAudio2MasteringVoice* mastering_voice_ = nullptr;
        bool com_initialized_ = false;
    };

}  // namespace xaudio2