// ps_7cdfdfde9ae076b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10000400 00000004 00000000 000040A5 001F001F 00000021 00003050 00003151 0000F252 0000F353 0000F456
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c3); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord6 : TEXCOORD6; // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord6;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1 = r0.xyyx * float4(2e+01, 2e+01, 1.0, 1.0) - 0.5;
    r0.xw = r1.yy * float2(-0.0015926529, -0.99999875) + 0.5;
    r0.yz = r1.zz * float2(0.9999997, 0.0007963267) + 0.5;
    r0.yz = r1.xx * float2(0.0007963267, -0.9999997) + r0.yz;
    r0.xw = r1.ww * float2(-0.99999875, 0.0015926529) + r0.xw;
    r0.x = tex2D(Texture2D_0, r0.xw).x;
    r0.y = tex2D(Texture2D_0, r0.yz).x;
    r0.yz = r0.yy + float2(-0.003921569, 0.0);
    r0.xy = r0.yz + r0.xx;
    r0.zw = r0.yy * IndividualVelocityScale.xy;
    r1.xy = r0.zw * r4.xy;
    r0.z = dot(r1.xy, r1.xy) + 0.0;
    r0.z = max(r0.z, 1.0);
    r0.z = rsqrt(abs(r0.z));
    r0.yz = r1.yx * r0.zz;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.x = saturate(abs(r0.z));
    ps = abs(r0.y);
    r0.zw = float2((r0.zy > 0.0));
    r0.y = saturate(ps);
    r0 = r0 * float4(0.49, 0.49, 0.5, 0.5);
    r0.xy = r0.xy + r0.zw;
    r0.xy = max(r0.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r0.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
