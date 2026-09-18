// ps_9b200fdf96bc8081.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040E00 0000070A 00000000 000064E7 001F007F 00000001 00003050 0000F151 0000F256 00007357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r8.yzw = tex2D(LightMapTextures_2, r0.xy).xyz;
    r9.yzw = tex2D(LightMapTextures_0, r0.xy).xyz;
    r11.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r10.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r6 = tex2D(Texture2D_1, r1.xy);
    ps = -UniformVector_0.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r5.w = dot(r4.zxy, r4.zxy);
    r13.x = ps;
    ps = -UniformVector_0.y;
    r0.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r14.xyz = r6.xyz * UniformVector_1.xyz;
    r13.y = ps;
    r12.xyz = r0.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r0.yzw = r6.xyz * 0.05;
    r0.x = ps;
    r7.xyz = r0.yzw * UniformVector_1.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r0.xxx * r3.xyz;
    r5.w = ps;
    ps = -UniformVector_0.z;
    r1.xyz = r5.www * r4.xyz;
    ps = 1.0 + ps;
    r5.w = dot(r12.zxy, r12.zxy);
    r13.z = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r14.xyz * r13.xyz;
    r5.w = ps;
    r6.xyz = r12.yxz * r5.www;
    r10.x = dot(r1.zxy, r6.zyx);
    r5.w = dot(r6.zyx, r0.zxy);
    r1.xyz = r6.yzx * r5.www;
    r0.xyz = r1.xyz * 2.0 - r0.xzy;
    r1 = r10.xxyz * float4(-0.5, 0.5, 0.875, 0.875) + float4(0.5, 0.5, 0.125, 0.125);
    ps = r1.z * r1.w;
    r4.xy = abs(r1.xy) * abs(r1.xy);
    r5.w = ps;
    r1.xyz = r5.www * r5.xyz + ModShadowColor.xyz;
    r5.xy = r3.yx * r4.yy;
    r10.x = saturate(dot(r6.zyx, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = 0.57735026 * r6.z;
    r10.z = saturate(dot(r6.zyx, float3(0.57735026, 0.70710677, -0.4082483)));
    r12.z = ps;
    ps = 0.8164966 * r6.x;
    r5.w = saturate(dot(r0.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    r12.w = ps;
    ps = 0.57735026 * r0.y;
    r0.w = saturate(dot(r0.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    r12.x = ps;
    ps = 0.8164966 * r0.z;
    r4 = r3.xzyz * r4.xxxy;
    r12.y = ps;
    ps = OpacityOverride.x;
    r10.yw = saturate(r12.wy + r12.zx);
    r5.z = saturate(ps);
    ps = log2(r0.w);
    r12.xyz = r10.xyz * r10.xyz;
    r0.x = ps;
    ps = log2(r5.w);
    r9.x = r12.y * r9.y;
    r0.z = ps;
    ps = log2(r10.w);
    r8.x = r12.z * r8.y;
    r0.y = ps;
    ps = 1.0 - r5.z;
    r6.xyz = r0.xyz * 16.0;
    r5.w = ps;
    ps = pow(2.0, r6.z);
    r10 = r8.yzwx * LightMapScale[2].xyzx;
    r5.z = ps;
    ps = pow(2.0, r6.x);
    r8.xyz = r10.xzy * r5.zzz;
    r5.z = ps;
    ps = r12.x;
    r5.w = float((r5.w >= 0.004));
    ps = r11.x * ps;
    r9 = r9 * LightMapScale[0].xxyz;
    r11.w = ps;
    r0 = r11 * LightMapScale[1].xyzx;
    r11.xy = r0.yz * r12.xx;
    r11.zw = r9.zw * r12.yy;
    ps = UpperSkyColor.x * r5.y;
    r12.xy = r10.yz * r12.zz;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r10.xyz = r0.xzy * r5.zzz;
    r3.w = ps;
    ps = UpperSkyColor.y * r5.x;
    r9 = r9.ywzx * r3.wwwx;
    r6.y = ps;
    ps = r4.w;
    r0.yz = r12.xy * r3.yz;
    r5.x = ps;
    ps = r10.w;
    r9.xyz = r9.xzy * r6.www;
    r9.y = dot(r11.zx, r3.yy) + r9.y;
    r9.z = dot(r11.wy, r3.zz) + r9.z;
    ps = r3.x * ps;
    r5.y = r9.w + r9.x;
    r0.x = ps;
    r9.x = r0.w * r3.x + r5.y;
    r9.xyz = r10.xyz * r6.www + r9.xzy;
    ps = UpperSkyColor.z * r5.x;
    r0.xyz = r9.xzy + r0.xyz;
    r6.z = ps;
    r5.xyz = r8.xzy * r6.www + r0.xyz;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xyz;
    r5.xyz = r5.xyz + r6.xyz;
    r5.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r5.xyz;
    r5.xyz = r7.xyz + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
