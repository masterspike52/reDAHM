#include "host_common.hlsli"

// BinkDrawFrame: one Bink frame from its Y, cR and cB planes (and the optional
// alpha plane), the conversion Bink's own runtime-compiled pixel shader does.
//
// TextureSlot, TextureSlot1..3: the Y, cR, cB and A planes.
// Row0..2: the tor/tog/tob rows Bink uploads to c0..c2.
// Value4: consts.x (the constant term's weight). Value5: the frame's alpha.
// Flags bit 0: the alpha plane is present.
float4 main(FullscreenVertex input) : SV_Target
{
    SamplerState s = g_Samplers[HOST(SamplerSlot)];
    float4 c;
    c.x = g_Texture2D[HOST(TextureSlot)].SampleLevel(s, input.TexCoord, 0.0).x;
    c.y = g_Texture2D[HOST(TextureSlot1)].SampleLevel(s, input.TexCoord, 0.0).x;
    c.z = g_Texture2D[HOST(TextureSlot2)].SampleLevel(s, input.TexCoord, 0.0).x;
    c.w = HOST(Value4);

    float4 p;
    p.x = dot(HOST(Row0), c);
    p.y = dot(HOST(Row1), c);
    p.z = dot(HOST(Row2), c);
    p.w = HOST(Value5);
    if (HOST(Flags) & 1)
        p.w *= g_Texture2D[HOST(TextureSlot3)].SampleLevel(s, input.TexCoord, 0.0).x;
    return p;
}
