// ps_1ef10ea2d4a8ac3f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040C00 00000506 00000000 00003CA5 001F001F 00000001 00003050 00003151 0000F256 00007357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale[3] : register(c9); // float3[3]
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c12); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r8.yzw = tex2D(LightMapTextures_2, r0.xy).xyz;
    r9.yzw = tex2D(LightMapTextures_0, r0.xy).xyz;
    r7.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1 = tex2D(Texture2D_1, r1.xy);
    ps = -UniformVector_0.x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r11.x = ps;
    ps = -UniformVector_0.y;
    r2.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r12.xyz = r1.xyz * UniformVector_1.xyz;
    r11.y = ps;
    r10.xyz = r5.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r2.x));
    r5.xyz = r1.xyz * 0.05;
    r2.x = ps;
    r5.xyz = r5.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.w));
    r2.xyz = r2.xxx * r3.xyz;
    r0.w = ps;
    ps = -UniformVector_0.z;
    r3.xyz = r0.www * r4.xyz;
    ps = 1.0 + ps;
    r0.w = dot(r10.zxy, r10.zxy);
    r11.z = ps;
    ps = rsqrt(abs(r0.w));
    r4.xyz = r12.xyz * r11.xyz;
    r0.w = ps;
    r1.xyz = r10.yxz * r0.www;
    r6.x = dot(r3.zxy, r1.zyx);
    r0.w = dot(r1.zyx, r2.zxy);
    r3.xyz = r1.yzx * r0.www;
    r2.xyz = r3.xyz * 2.0 - r2.xzy;
    r3 = r6.xxyz * float4(-0.5, 0.5, 0.875, 0.875) + float4(0.5, 0.5, 0.125, 0.125);
    ps = r3.z * r3.w;
    r6.xy = abs(r3.xy) * abs(r3.xy);
    r0.w = ps;
    r3.xyz = r0.www * r0.xyz + ModShadowColor.xyz;
    r0.xz = r4.yx * r6.yy;
    r11.x = saturate(dot(r1.zyx, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = 0.57735026 * r1.z;
    r11.z = saturate(dot(r1.zyx, float3(0.57735026, 0.70710677, -0.4082483)));
    r10.z = ps;
    ps = 0.8164966 * r1.x;
    r0.w = saturate(dot(r2.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    r10.w = ps;
    ps = 0.57735026 * r2.y;
    r3.w = saturate(dot(r2.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    r10.x = ps;
    ps = 0.8164966 * r2.z;
    r6 = r4.xzyz * r6.xxxy;
    r10.y = ps;
    ps = OpacityOverride.x;
    r11.yw = saturate(r10.wy + r10.zx);
    r0.y = saturate(ps);
    ps = log2(r3.w);
    r12.xyz = r11.xyz * r11.xyz;
    r10.x = ps;
    ps = log2(r0.w);
    r9.x = r12.y * r9.y;
    r10.z = ps;
    ps = log2(r11.w);
    r8.x = r12.z * r8.y;
    r10.y = ps;
    ps = 1.0 - r0.y;
    r1.xyz = r10.xyz * 16.0;
    r0.w = ps;
    ps = pow(2.0, r1.z);
    r10 = r8.yzwx * LightMapScale[2].xyzx;
    r0.y = ps;
    ps = pow(2.0, r1.x);
    r8.xyz = r10.xzy * r0.yyy;
    r0.y = ps;
    ps = r12.x;
    r0.w = float((r0.w >= 0.004));
    ps = r7.x * ps;
    r9 = r9 * LightMapScale[0].xxyz;
    r7.w = ps;
    r7 = r7 * LightMapScale[1].xyzx;
    r11.xy = r7.yz * r12.xx;
    r11.zw = r9.zw * r12.yy;
    ps = UpperSkyColor.x * r0.z;
    r12.xy = r10.yz * r12.zz;
    r1.x = ps;
    ps = pow(2.0, r1.y);
    r10.xyz = r7.xzy * r0.yyy;
    r4.w = ps;
    ps = UpperSkyColor.y * r0.x;
    r9 = r9.ywzx * r4.wwwx;
    r1.y = ps;
    ps = r6.w;
    r7.yz = r12.xy * r4.yz;
    r0.x = ps;
    ps = r10.w;
    r9.xyz = r9.xzy * r1.www;
    r9.y = dot(r11.zx, r4.yy) + r9.y;
    r9.z = dot(r11.wy, r4.zz) + r9.z;
    ps = r4.x * ps;
    r0.y = r9.w + r9.x;
    r7.x = ps;
    r9.x = r7.w * r4.x + r0.y;
    r9.xyz = r10.xyz * r1.www + r9.xzy;
    ps = UpperSkyColor.z * r0.x;
    r7.xyz = r9.xzy + r7.xyz;
    r1.z = ps;
    r0.xyz = r8.xzy * r1.www + r7.xyz;
    r0.xyz = r6.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r0.xyz + r1.xyz;
    r0.xyz = r4.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    r0.xyz = r5.xyz + r0.xyz;
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
