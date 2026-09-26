#include "host_common.hlsli"

// A scaled texture brought back to its guest size, for draws into targets that
// stay at their guest size (the bloom chain). Value4 is the resolution scale:
// the source texels per guest texel. Colour averages every source texel under
// the guest texel, weighted by how much of it the texel covers, so a scale of
// 1.5 splits the texels it straddles. Flags bit 0 takes the source texel at
// the guest texel's centre instead, for depth, which must not average across
// silhouettes.
float4 main(FullscreenVertex input) : SV_Target
{
    Texture2D<float4> source = g_Texture2D[HOST(TextureSlot)];
    uint width, height;
    source.GetDimensions(width, height);
    const int2 last = int2(width, height) - 1;
    const float scale = HOST(Value4);
    const float2 texel = floor(input.Position.xy);
    if (HOST(Flags) & 1)
        return source.Load(int3(min(int2((texel + 0.5) * scale), last), 0));

    const float2 begin = texel * scale;
    const float2 end = begin + scale;
    float4 sum = 0.0;
    float total = 0.0;
    for (int y = int(begin.y); y < int(ceil(end.y)); ++y)
    {
        const float wy = min(end.y, y + 1.0) - max(begin.y, float(y));
        for (int x = int(begin.x); x < int(ceil(end.x)); ++x)
        {
            const float w = wy * (min(end.x, x + 1.0) - max(begin.x, float(x)));
            sum += source.Load(int3(min(int2(x, y), last), 0)) * w;
            total += w;
        }
    }
    return sum / total;
}
