#include <algorithm>

#include "xaudio2_audio_driver.h"

#include <rex/assert.h>
#include <rex/audio/conversion.h>
#include <rex/logging.h>


namespace xaudio2 {

    XAudio2AudioDriver::XAudio2AudioDriver(rex::memory::Memory* memory, IXAudio2* xaudio2,
        uint8_t device_channels,
        std::function<void()> on_buffer_completed)
        : AudioDriver(memory),
        xaudio2_(xaudio2),
        device_channels_(device_channels),
        on_buffer_completed_(std::move(on_buffer_completed)) {
    }

    XAudio2AudioDriver::~XAudio2AudioDriver() {
        assert_true(frames_queued_.empty());
        assert_true(frames_unused_.empty());
    }

    bool XAudio2AudioDriver::Initialize() {
        WAVEFORMATEX fmt = {};
        fmt.wFormatTag = WAVE_FORMAT_IEEE_FLOAT;
        fmt.nChannels = device_channels_;
        fmt.nSamplesPerSec = frame_frequency_;
        fmt.wBitsPerSample = 32;
        fmt.nBlockAlign = fmt.nChannels * (fmt.wBitsPerSample / 8);
        fmt.nAvgBytesPerSec = fmt.nSamplesPerSec * fmt.nBlockAlign;
        fmt.cbSize = 0;

        HRESULT hr = xaudio2_->CreateSourceVoice(&source_voice_, &fmt, 0, 1.0f, this);
        if (FAILED(hr)) {
            REXAPU_ERROR("XAudio2: CreateSourceVoice failed: {:08X}", static_cast<uint32_t>(hr));
            return false;
        }

        hr = source_voice_->Start(0);
        if (FAILED(hr)) {
            REXAPU_ERROR("XAudio2: Start failed: {:08X}", static_cast<uint32_t>(hr));
            source_voice_->DestroyVoice();
            source_voice_ = nullptr;
            return false;
        }

        return true;
    }

    void XAudio2AudioDriver::Shutdown() {
        if (source_voice_) {
            source_voice_->Stop(0);
            source_voice_->FlushSourceBuffers();
            source_voice_->DestroyVoice();
            source_voice_ = nullptr;
        }
        std::unique_lock<std::mutex> guard(frames_mutex_);
        while (!frames_unused_.empty()) {
            delete[] frames_unused_.top();
            frames_unused_.pop();
        }
        while (!frames_queued_.empty()) {
            delete[] frames_queued_.front();
            frames_queued_.pop();
        }
    }

    void XAudio2AudioDriver::SubmitFrame(uint32_t frame_ptr) {
        const auto input_frame = memory_->TranslateVirtual<float*>(frame_ptr);

        float* converted;
        {
            std::unique_lock<std::mutex> guard(frames_mutex_);
            if (frames_unused_.empty()) {
                converted = new float[frame_samples_];
            }
            else {
                converted = frames_unused_.top();
                frames_unused_.pop();
            }
        }

        switch (device_channels_) {
        case 2:
            rex::audio::conversion::sequential_6_BE_to_interleaved_2_LE(
                converted, input_frame, channel_samples_);
            break;
        case 6:
            rex::audio::conversion::sequential_6_BE_to_interleaved_6_LE(
                converted, input_frame, channel_samples_);
            break;
        default:
            assert_unhandled_case(device_channels_);
            break;
        }

        {
            std::unique_lock<std::mutex> guard(frames_mutex_);
            frames_queued_.push(converted);
        }

        XAUDIO2_BUFFER buffer = {};
        buffer.AudioBytes = static_cast<UINT32>(channel_samples_ * device_channels_ * sizeof(float));
        buffer.pAudioData = reinterpret_cast<const BYTE*>(converted);
        buffer.pContext = converted;

        if (source_voice_) {
            HRESULT hr = source_voice_->SubmitSourceBuffer(&buffer);
            if (FAILED(hr)) {
                REXAPU_ERROR("XAudio2: SubmitSourceBuffer failed: {:08X}", static_cast<uint32_t>(hr));
                std::unique_lock<std::mutex> guard(frames_mutex_);
                frames_queued_.pop();
                frames_unused_.push(converted);
            }
        }
    }

    STDMETHODIMP_(void) XAudio2AudioDriver::OnBufferEnd(void* buffer_context) {
        auto* buffer = static_cast<float*>(buffer_context);
        {
            std::unique_lock<std::mutex> guard(frames_mutex_);
            if (!frames_queued_.empty() && frames_queued_.front() == buffer) {
                frames_queued_.pop();
            }
            frames_unused_.push(buffer);
        }
        if (on_buffer_completed_) {
            on_buffer_completed_();
        }
    }

}  // namespace xaudio2