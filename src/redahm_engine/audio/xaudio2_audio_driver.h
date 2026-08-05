#pragma once

#include <windows.h>
#include <xaudio2.h>

#include <functional>
#include <mutex>
#include <queue>
#include <stack>

#include <rex/audio/audio_driver.h>

namespace xaudio2 {

    class XAudio2AudioDriver : public rex::audio::AudioDriver, public IXAudio2VoiceCallback {
    public:
        XAudio2AudioDriver(rex::memory::Memory* memory, IXAudio2* xaudio2,
            uint8_t device_channels,
            std::function<void()> on_buffer_completed);
        ~XAudio2AudioDriver() override;

        bool Initialize();
        void Shutdown();

        void SubmitFrame(uint32_t frame_ptr) override;

        STDMETHOD_(void, OnBufferEnd)(void* buffer_context) override;
        STDMETHOD_(void, OnBufferStart)(void* buffer_context) override {}
        STDMETHOD_(void, OnLoopEnd)(void* buffer_context) override {}
        STDMETHOD_(void, OnStreamEnd)() override {}
        STDMETHOD_(void, OnVoiceError)(void* buffer_context, HRESULT error) override {}
        STDMETHOD_(void, OnVoiceProcessingPassEnd)() override {}
        STDMETHOD_(void, OnVoiceProcessingPassStart)(UINT32 bytes_required) override {}

    private:
        static constexpr int frame_frequency_ = 48000;
        static constexpr uint8_t frame_channels_ = 6;
        static constexpr size_t channel_samples_ = 256;
        static constexpr size_t frame_samples_ = channel_samples_ * frame_channels_;

        IXAudio2* xaudio2_ = nullptr;
        IXAudio2SourceVoice* source_voice_ = nullptr;
        uint8_t device_channels_ = frame_channels_;
        std::function<void()> on_buffer_completed_;

        std::mutex frames_mutex_;
        std::queue<float*> frames_queued_;
        std::stack<float*> frames_unused_;
    };

}  // namespace xaudio2