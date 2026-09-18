#include "host_common.hlsli"

struct ImGuiPixelInput
{
    float4 Position : SV_Position;
    float4 Color : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

float4 main(ImGuiPixelInput input) : SV_Target
{
    Texture2D<float4> source = g_Texture2D[HOST(TextureSlot)];
    return source.SampleLevel(g_Samplers[HOST(SamplerSlot)], input.TexCoord, 0.0) * input.Color;
}
