// ps_da7efcddb4fa7235.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040C00 00000606 00000000 00005CC6 003F003F 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c8); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r3.y = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.x = dot(r5.zxy, r5.zxy);
    r7.y = ps;
    r6.xy = r7.xy * abs(r6.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r8.xyz = r0.xyz * 0.07317333;
    r9.xyz = r1.xyz * 0.07317333;
    r10.xyz = r2.xyz * 0.07317333;
    ps = rsqrt(abs(r3.y));
    r7.zw = r7.xy * 0.875;
    r0.w = ps;
    ps = OpacityOverride.x;
    r4.xyz = r0.www * r4.xyz;
    r0.w = saturate(ps);
    r7.y = r4.z * 2.0 - r4.z;
    ps = rsqrt(abs(r3.x));
    r12 = -r4.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r7.x = ps;
    ps = r12.x + r12.z;
    r4.yzw = -ModShadowColor.xyz + 1.0;
    r3.x = ps;
    ps = r12.y + r12.z;
    r11.xyz = r7.xyx * float3(-0.5, 0.57735026, 0.5);
    r3.y = ps;
    ps = 1.0 - r0.w;
    r3.xy = saturate(r3.xy + r11.yy);
    r4.x = ps;
    ps = log2(r3.x);
    r6.w = saturate(r12.w + r11.y);
    r11.y = ps;
    ps = log2(r6.w);
    r7.xy = r11.xz * r5.zz;
    r11.z = ps;
    ps = log2(r3.y);
    r7 = r7.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    r11.w = ps;
    ps = r7.y * r7.z;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r3.x = ps;
    ps = abs(r7.x) * abs(r7.x);
    r12.xyz = r5.xyz * 0.21952;
    r11.x = ps;
    ps = abs(r7.w) * abs(r7.w);
    r7.xyz = r11.zyw * 16.0;
    r11.y = ps;
    r4.yzw = r3.xxx * r4.yzw + ModShadowColor.xyz;
    ps = pow(2.0, r7.x);
    r3.xy = r12.yx * r11.yy;
    r7.x = ps;
    ps = pow(2.0, r7.y);
    r12 = r12.xzyz * r11.xxxy;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r11.z = r12.w * UpperSkyColor.z;
    r7.z = ps;
    ps = UpperSkyColor.x * r3.y;
    r4.x = float((r4.x >= 0.004));
    r11.x = ps;
    ps = UpperSkyColor.y * r3.x;
    r7.xyz = r7.zxy * 0.21952;
    r11.y = ps;
    r11.xyz = r12.xzy * LowerSkyColor.xyz + r11.xyz;
    r2.xyz = r7.xxx * r2.xyz + r11.xyz;
    r2.xyz = r10.xzy * r5.xzy + r2.xzy;
    r2.xyz = r9.xyz * r5.xyz + r2.xzy;
    r0.xyz = r7.yyy * r0.xyz + r2.xyz;
    r0.xyz = r8.xyz * r5.xyz + r0.xyz;
    r0.xyz = r7.zzz * r1.xzy + r0.xzy;
    r0.xyz = r6.xyz * r5.xyz + r0.xzy;
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
