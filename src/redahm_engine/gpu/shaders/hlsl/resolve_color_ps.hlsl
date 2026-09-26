#include "host_common.hlsli"

// D3DDevice_Resolve of a color target. Value4 is the resolve exponent bias
// multiplier (2^bias from the resolve flags) and Row0 is the source surface's
// per-channel ceiling: the EDRAM formats saturate where the host float surface
// they render into does not, so the clamp the hardware applies to every blend
// result lands here, on the one read the rest of the frame sees.
float4 main(FullscreenVertex input) : SV_Target
{
    Texture2D<float4> source = g_Texture2D[HOST(TextureSlot)];
    float4 color = min(source.SampleLevel(g_Samplers[HOST(SamplerSlot)], input.TexCoord, 0.0),
                       HOST(Row0));
    return float4(color.rgb * HOST(Value4), color.a);
}
