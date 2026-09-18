#include "host_common.hlsli"

// D3DDevice_Resolve of a color target. Value4 is the resolve exponent bias
// multiplier (2^bias from the resolve flags).
float4 main(FullscreenVertex input) : SV_Target
{
    Texture2D<float4> source = g_Texture2D[HOST(TextureSlot)];
    float4 color = source.SampleLevel(g_Samplers[HOST(SamplerSlot)], input.TexCoord, 0.0);
    return float4(color.rgb * HOST(Value4), color.a);
}
