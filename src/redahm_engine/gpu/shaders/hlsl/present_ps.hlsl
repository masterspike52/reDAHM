#include "host_common.hlsli"

// The guest front buffer is already display-encoded, so present is a copy.
float4 main(FullscreenVertex input) : SV_Target
{
    Texture2D<float4> source = g_Texture2D[HOST(TextureSlot)];
    float4 color = source.SampleLevel(g_Samplers[HOST(SamplerSlot)], input.TexCoord, 0.0);
    return float4(color.rgb, 1.0);
}
