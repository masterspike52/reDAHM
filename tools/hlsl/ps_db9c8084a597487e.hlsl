// ps_db9c8084a597487e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040D00 00000606 00000000 00005CC6 003F003F 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c9); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord3 : TEXCOORD3; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord3;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = dot(r5.zxy, r5.zxy);
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = UniformVector_1.xyz * 0.3333333;
    r3.y = ps;
    r3.xy = r3.xy * abs(r6.xy);
    r3.xz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r7.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r3.y = saturate(ps);
    ps = 1.0 - r3.y;
    r4.w = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r4.w));
    r12.xyz = r6.xyz * UniformVector_1.xyz;
    r3.y = ps;
    ps = 0.875 * r3.x;
    r4.xyw = r3.yyy * r4.xyz;
    r4.z = ps;
    r4.w = r4.w * 2.0 - r4.w;
    ps = rsqrt(abs(r7.w));
    r9 = -r4.xxyy * float4(-0.70710677, 0.70710677, 0.8164966, -0.4082483);
    r4.y = ps;
    ps = r9.x + r9.w;
    r8.xyz = r10.xyz * r0.xyz;
    r4.x = ps;
    ps = r9.y + r9.w;
    r11.xyz = r4.ywy * float3(-0.5, 0.57735026, 0.5);
    r4.y = ps;
    ps = 0.875 * r3.z;
    r9.xy = saturate(r4.xy + r11.yy);
    r4.w = ps;
    ps = log2(r9.x);
    r3.x = saturate(r9.z + r11.y);
    r11.y = ps;
    ps = log2(r3.x);
    r4.xy = r11.xz * r5.zz;
    r11.z = ps;
    ps = log2(r9.y);
    r4 = r4 + float4(0.5, 0.5, 0.125, 0.125);
    r11.w = ps;
    ps = r4.z * r4.w;
    r9.xyz = r10.xyz * r1.xyz;
    r3.x = ps;
    ps = abs(r4.x) * abs(r4.x);
    r10.xyz = r10.xyz * r2.xyz;
    r11.x = ps;
    ps = abs(r4.y) * abs(r4.y);
    r5.xyz = r11.yzw * 16.0;
    r11.y = ps;
    r4.yzw = r3.xxx * r13.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.x);
    r3.xy = r12.yx * r11.yy;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r12 = r12.xzyz * r11.xxxy;
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r11.z = r12.w * UpperSkyColor.z;
    r5.z = ps;
    ps = UpperSkyColor.x * r3.y;
    r4.x = float((r6.w >= 0.004));
    r11.x = ps;
    ps = UpperSkyColor.y * r3.x;
    r5.xyz = r5.zxy * 0.21952;
    r11.y = ps;
    r11.xyz = r12.xzy * LowerSkyColor.xyz + r11.xyz;
    r2.xyz = r5.xxx * r2.xyz + r11.xyz;
    r2.xyz = r10.xzy * r6.xzy + r2.xzy;
    r2.xyz = r9.xyz * r6.xyz + r2.xzy;
    r0.xyz = r5.zzz * r0.xyz + r2.xyz;
    r0.xyz = r8.xyz * r6.xyz + r0.xyz;
    r0.xyz = r5.yyy * r1.xzy + r0.xzy;
    r0.xyz = r7.xyz * r6.xyz + r0.xzy;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    ps = -r3.w;
    r0.xyz = r0.xyz * r4.yzw;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r4.x + r3.w;
    r0.xyz = r1.xyz * r4.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
