// ps_3a64324cc40c217d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000002E8 10040F00 00000506 00000000 00003CA5 001F001F 00000001 00003050 00003151 0000F256 00007357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale[3] : register(c8); // float3[3]
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c11); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D LightMapTextures_0 : register(s1);
sampler2D LightMapTextures_1 : register(s2);
sampler2D LightMapTextures_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r1.xy * 2e+01;
    r1.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r1.x = ps;
    r6.xy = r1.xy * abs(r5.xy);
    r1.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r14.xyz = tex2D(LightMapTextures_2, r0.xy).xyz;
    r5.xyz = tex2D(LightMapTextures_0, r0.xy).zxy;
    r8.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r2.xyz = tex2D(Texture2D_0, r2.xy).yxz;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r0.x = saturate(ps);
    r7.xyz = r2.yxz * 0.5 + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r0.y = dot(r4.zxy, r4.zxy);
    r14.w = ps;
    ps = 1.0 - r0.x;
    r15.zw = r8.xy * 0.875;
    r0.w = ps;
    ps = LightMapScale[0].x * r5.y;
    r10.xyz = r14.xyz * LightMapScale[2].xyz;
    r11.x = ps;
    ps = LightMapScale[0].y * r5.z;
    r12.xyz = r1.xyz * LightMapScale[1].xyz;
    r11.y = ps;
    ps = LightMapScale[0].z * r5.x;
    r8.yzw = r6.yzx * r2.yxz;
    r11.z = ps;
    ps = rsqrt(abs(r0.y));
    r1.xyz = r1.zxy * 0.3333333;
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r9.zw = r0.xx * float2(-0.5, 0.5);
    r1.w = ps;
    ps = LightMapScale[1].x * r1.y;
    r0.xyz = r14.zxy * 0.3333333;
    r14.x = ps;
    ps = LightMapScale[2].x * r0.y;
    r3.xyz = r1.www * r3.xyz;
    r9.x = ps;
    ps = LightMapScale[2].y * r0.z;
    r0.w = float((r0.w >= 0.004));
    r9.y = ps;
    ps = LightMapScale[2].z * r0.x;
    r15.xy = r9.zw * r4.zz;
    r9.z = ps;
    ps = LightMapScale[1].y * r1.z;
    r9.xyz = r9.xyz * r2.yxz;
    r14.y = ps;
    r5.w = r3.z * 2.0 - r3.z;
    ps = LightMapScale[1].z * r1.x;
    r4 = -r3.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r14.z = ps;
    ps = r4.x + r4.z;
    r3 = r5.yzxw * float4(0.3333333, 0.3333333, 0.3333333, 0.57735026);
    r5.x = ps;
    ps = r4.y + r4.z;
    r1 = r15 + float4(0.5, 0.5, 0.125, 0.125);
    r5.z = ps;
    ps = r1.z * r1.w;
    r0.z = saturate(r4.w + r3.w);
    r0.x = ps;
    ps = abs(r1.x) * abs(r1.x);
    r4 = r14 * r2.yxzz;
    r5.y = ps;
    ps = abs(r1.y) * abs(r1.y);
    r5.xz = saturate(r5.zx + r3.ww);
    r5.w = ps;
    r1.xyz = r0.xxx * r13.xyz + ModShadowColor.xyz;
    ps = log2(r5.z);
    r0.xy = r8.zy * r5.ww;
    r8.x = ps;
    ps = log2(r0.z);
    r13 = r8.ywzw * r5.yyyw;
    r8.y = ps;
    ps = log2(r5.x);
    r5.z = r13.w * UpperSkyColor.z;
    r8.z = ps;
    ps = UpperSkyColor.x * r0.y;
    r3.xyz = r3.xyz * LightMapScale[0].xyz;
    r5.x = ps;
    ps = UpperSkyColor.y * r0.x;
    r8.xyw = r8.xyz * 16.0;
    r5.y = ps;
    r0.xyz = r13.xzy * LowerSkyColor.xyz + r5.xyz;
    ps = pow(2.0, r8.x);
    r5.xyz = r3.xzy * r2.yzx;
    r1.w = ps;
    ps = pow(2.0, r8.y);
    r3.yzw = r12.xzy * r1.www;
    r1.w = ps;
    ps = pow(2.0, r8.w);
    r8.xyz = r11.xzy * r1.www;
    r1.w = ps;
    ps = AmbientColorAndSkyFactor.x * r2.y;
    r10.xyz = r10.xzy * r1.www;
    r3.x = ps;
    r0.xyz = r10.xzy * 0.21952 + r0.xyz;
    r0.xyz = r9.xzy * r6.yxz + r0.xzy;
    r0.xyz = r4.xyz * r6.yzx + r0.xzy;
    r0.xyz = r8.xzy * 0.21952 + r0.xyz;
    r0.xyz = r5.xyz * r6.yxz + r0.xzy;
    r0.xyz = r3.ywz * 0.21952 + r0.xzy;
    ps = AmbientColorAndSkyFactor.y * r2.x;
    r0.z = r0.z + r4.w;
    r3.y = ps;
    r0.xy = r3.xy * r6.yz + r0.xy;
    r0.xyz = r7.xyz + r0.xyz;
    ps = -r2.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
