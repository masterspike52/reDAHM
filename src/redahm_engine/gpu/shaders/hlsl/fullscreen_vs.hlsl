#include "host_common.hlsli"

// One triangle covering the viewport. Value0..3 map it into the source
// texture: uv = base_uv * (Value0, Value1) + (Value2, Value3).
FullscreenVertex main(uint vertex_id : SV_VertexID)
{
    float2 base_uv = float2((vertex_id << 1) & 2, vertex_id & 2);
    FullscreenVertex output;
    output.Position = float4(base_uv * float2(2.0, -2.0) + float2(-1.0, 1.0), 0.0, 1.0);
    output.TexCoord = base_uv * float2(HOST(Value0), HOST(Value1)) + float2(HOST(Value2), HOST(Value3));
    return output;
}
