// ps_f49f56694a0b936f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040D00 00000506 00000000 00003CA5 001F001F 00000001 00003050 00003151 0000F256 00007357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
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
sampler2D Texture2D_1 : register(s1);
sampler2D LightMapTextures_0 : register(s2);
sampler2D LightMapTextures_1 : register(s3);
sampler2D LightMapTextures_2 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = -UniformVector_0.zxy + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r9.yzw = tex2D(LightMapTextures_0, r0.xy).xyz;
    r13.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r8.yzw = tex2D(LightMapTextures_2, r0.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7 = tex2D(Texture2D_1, r1.xy);
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r4.zxy, r4.zxy);
    r0.yzw = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.z));
    r5.xyz = r2.yzx * r7.xyz;
    r0.x = ps;
    r1.xyz = r0.xxx * r3.xyz;
    ps = rsqrt(abs(r1.w));
    r0.x = dot(r0.wyz, r0.wyz);
    r1.w = ps;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r1.www * r4.xyz;
    r0.x = ps;
    r0.xyz = r0.zyw * r0.xxx;
    r10.x = saturate(dot(r0.zyx, float3(0.57735026, -0.70710677, -0.4082483)));
    r10.z = saturate(dot(r0.zyx, float3(0.57735026, 0.70710677, -0.4082483)));
    r11.x = dot(r3.zxy, r0.zyx);
    ps = 0.57735026 * r0.z;
    r0.w = dot(r0.zyx, r1.zxy);
    r4.z = ps;
    ps = 0.8164966 * r0.x;
    r3.xyz = r0.yzx * r0.www;
    r4.w = ps;
    r1.xyz = r3.xyz * 2.0 - r1.xzy;
    r0 = r11.yxzx * float4(0.875, -0.5, 0.875, 0.5) + float4(0.125, 0.5, 0.125, 0.5);
    ps = r0.x * r0.z;
    r0.yw = abs(r0.yw) * abs(r0.yw);
    r0.x = ps;
    r3.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    ps = 0.57735026 * r1.y;
    r0.xz = r5.yx * r0.ww;
    r4.x = ps;
    ps = 0.8164966 * r1.z;
    r6 = r5.xzyz * r0.yyyw;
    r4.y = ps;
    r10.yw = saturate(r4.wy + r4.zx);
    r5.yzw = r10.xyz * r10.xyz;
    r13.w = r5.y * r13.x;
    r0.y = saturate(dot(r1.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    r9.x = r5.z * r9.y;
    r12 = r9 * LightMapScale[0].xxyz;
    ps = log2(r0.y);
    r11.x = r12.x * r7.x;
    r9.x = ps;
    ps = r5.w;
    r0.y = saturate(dot(r1.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    ps = r8.y * ps;
    r1 = r13 * LightMapScale[1].xyzx;
    r8.x = ps;
    ps = log2(r0.y);
    r4.x = r1.w * r7.x;
    r9.z = ps;
    ps = OpacityOverride.x;
    r8 = r8 * LightMapScale[2].xxyz;
    r0.y = saturate(ps);
    ps = log2(r10.w);
    r4.w = r8.x * r7.x;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r4.yz = r7.xy * AmbientColorAndSkyFactor.xy;
    r1.w = ps;
    ps = UpperSkyColor.x * r0.z;
    r10.xyz = r9.xyz * 16.0;
    r5.x = ps;
    ps = UpperSkyColor.y * r0.x;
    r9.xy = r1.yz * r5.yy;
    r5.y = ps;
    ps = r6.w;
    r9.zw = r8.zw * r5.ww;
    r0.x = ps;
    ps = pow(2.0, r10.x);
    r11.yz = r12.zw * r5.zz;
    r0.z = ps;
    ps = pow(2.0, r10.y);
    r1.xyz = r1.xzy * r0.zzz;
    r0.z = ps;
    ps = UpperSkyColor.z * r0.x;
    r12.xyz = r12.ywz * r0.zzz;
    r5.z = ps;
    ps = r11.y;
    r0.xzw = r12.xzy * r7.www;
    ps = r7.y * ps;
    r1 = r1.xzyw * r7.wwwz;
    r11.y = ps;
    ps = r11.z;
    r9 = r9 * r7.yzyz;
    ps = r7.z * ps;
    r4 = r4 * r2.yyzy;
    r11.z = ps;
    r0.xzw = r11.xyz * r2.yzx + r0.xzw;
    ps = r0.x;
    r9 = r9 * r2.zxzx;
    ps = r4.x + ps;
    r0.zw = r0.zw + r9.xy;
    r0.x = ps;
    ps = pow(2.0, r10.z);
    r0.xzw = r0.xzw + r1.xyz;
    r3.w = ps;
    ps = r0.x;
    r8.xyz = r8.ywz * r3.www;
    ps = r4.w + ps;
    r0.zw = r0.zw + r9.zw;
    r0.x = ps;
    r0.xzw = r8.yxz * r7.www + r0.wxz;
    r0.xzw = r6.xzy * LowerSkyColor.xyz + r0.zwx;
    ps = 1.0 - r0.y;
    r1.xyz = r0.xzw + r5.xyz;
    r0.x = ps;
    ps = r1.z;
    r0.w = float((r0.x >= 0.004));
    ps = r1.w + ps;
    r0.xy = r1.xy + r4.yz;
    r0.z = ps;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r0.xyz = r0.xyz * r3.xyz;
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
