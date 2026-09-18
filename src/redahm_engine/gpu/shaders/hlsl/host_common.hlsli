#ifndef REDAHM_HOST_COMMON_HLSLI
#define REDAHM_HOST_COMMON_HLSLI

// Matches redahm::gpu::HostPushConstants. D3D12 binds it as root constants at
// b3 space4; Vulkan shares one push constant range with the guest shaders, which
// own bytes [0, 24), so this block starts at 24.
#ifdef __spirv__
struct HostConstants
{
    [[vk::offset(24)]] uint TextureSlot;
    uint SamplerSlot;
    float Value0;
    float Value1;
    float Value2;
    float Value3;
    float Value4;
    float Value5;
    uint TextureSlot1;
    uint TextureSlot2;
    uint TextureSlot3;
    uint Flags;
    float4 Row0;
    float4 Row1;
    float4 Row2;
};
[[vk::push_constant]] ConstantBuffer<HostConstants> g_Host;
#define HOST(name) g_Host.name
#else
cbuffer HostConstants : register(b3, space4)
{
    uint TextureSlot;
    uint SamplerSlot;
    float Value0;
    float Value1;
    float Value2;
    float Value3;
    float Value4;
    float Value5;
    uint TextureSlot1;
    uint TextureSlot2;
    uint TextureSlot3;
    uint Flags;
    float4 Row0;
    float4 Row1;
    float4 Row2;
};
#define HOST(name) name
#endif

Texture2D<float4> g_Texture2D[] : register(t0, space0);
SamplerState g_Samplers[] : register(s0, space3);

struct FullscreenVertex
{
    float4 Position : SV_Position;
    float2 TexCoord : TEXCOORD0;
};

#endif
