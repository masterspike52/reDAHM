#include "host_common.hlsli"

struct ImGuiVertexInput
{
    [[vk::location(0)]] float2 Position : POSITION;
    [[vk::location(1)]] float2 TexCoord : TEXCOORD0;
    [[vk::location(2)]] float4 Color : COLOR0;
};

struct ImGuiVertexOutput
{
    float4 Position : SV_Position;
    float4 Color : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

// Value0/1 scale and Value2/3 translate pixel coordinates into clip space.
ImGuiVertexOutput main(ImGuiVertexInput input)
{
    ImGuiVertexOutput output;
    output.Position = float4(input.Position * float2(HOST(Value0), HOST(Value1)) +
                             float2(HOST(Value2), HOST(Value3)), 0.0, 1.0);
    output.Color = input.Color;
    output.TexCoord = input.TexCoord;
    return output;
}
