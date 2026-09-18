#include "host_common.hlsli"

// D3DDevice_Resolve of the depth-stencil surface into a depth texture, which
// the renderer stores as single-channel float color.
float4 main(FullscreenVertex input) : SV_Target
{
    Texture2D<float4> source = g_Texture2D[HOST(TextureSlot)];
    float depth = source.SampleLevel(g_Samplers[HOST(SamplerSlot)], input.TexCoord, 0.0).r;
    return float4(depth, 0.0, 0.0, 1.0);
}
