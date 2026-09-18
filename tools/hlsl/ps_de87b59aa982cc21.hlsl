// ps_de87b59aa982cc21.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003D8 10040D00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_13 : register(c11); // float
float4 UniformScalar_14 : register(c12); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r0.xy * UniformScalar_0.xx;
    r7.y = ps;
    ps = 1.0 / r5.w;
    r7.xz = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r1.zw = r7.xz * r6.xx + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r0.zw = r1.xy * UniformVector_5.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = float((UniformScalar_14.x > 1.0));
    r7.x = ps;
    ps = (-0.5) + r6.x;
    r7.xy = r7.xy * abs(r8.xy);
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r8.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r10.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r9.w = tex2D(Texture2D_2, r0.xy).x;
    r7.xz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r1.yzw = tex2D(Texture2D_4, r0.zw).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_0, r6.yz).xyw;
    r9.x = float((UniformScalar_14.x >= 1.0));
    ps = r5.w;
    r7.y = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r6.z = float((UniformScalar_13.x >= 1.0));
    r1.x = saturate(ps);
    ps = r2.z;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    r9.yz = r13.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r6.y = saturate(-r6.w + 1.0);
    r0.w = ps;
    ps = 5.0 * r6.x;
    r2.w = float((UniformScalar_13.x > 1.0));
    r6.x = saturate(ps);
    r0.xyz = r0.zxy * 2.0 - 1.0;
    r1.yzw = (-abs(r2.www) >= 0.0) ? r1.yzw : 1.0;
    r5.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r1.yzw;
    ps = UniformVector_2.z * r0.x;
    r1.yzw = UniformVector_4.xyz * UniformVector_4.www;
    r13.w = ps;
    ps = 1.0 - r6.x;
    r11.xyz = r1.yzw * r11.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r7.y));
    r12.xyz = r0.www * r2.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = log2(r6.y);
    r1.yzw = r6.xxx * -SpotDirection.xyz;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.w = dot(r1.wyz, r3.zxy);
    r1.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r13.zw - 1.0;
    r1.z = ps;
    r1.yzw = -r1.xyz + 1.0;
    r3.zw = r2.yx * r1.yy + 1.0;
    ps = UniformScalar_1.x * r1.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r1.x = ps;
    r6.yz = r1.xx * r9.yz + r0.yz;
    r6.yz = r6.yz * UniformVector_2.xy;
    r3.xy = r6.yz * r1.yy;
    r0 = (r1.xyyy > 0.0) ? r3.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r9.z = (r1.x >= 0.0) ? r0.x : 1.0;
    r0.xyz = (r1.yyy >= 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r6.y = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r6.y));
    r6.z = r6.w - SpotAngles.x;
    r6.y = ps;
    r3.xyz = r0.xyz * r6.yyy;
    r6.y = dot(r3.zxy, r4.zxy);
    r0.xyz = r3.xyz * r6.yyy;
    r0.xyz = r0.xyz * 2.0 - r4.xyz;
    r6.y = saturate(dot(r12.zxy, r0.zxy));
    ps = log2(r6.y);
    r9.y = saturate(r6.z * SpotAngles.y);
    r7.y = ps;
    ps = UniformScalar_9.x * r7.y;
    r0.xyw = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r0.z = saturate(dot(r3.zxy, r12.zxy));
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r7.xyz = r7.xzy * float3(0.875, 0.875, 15.0);
    r6.w = ps;
    r6.yz = r7.xy * r1.zw + 0.125;
    ps = r6.y * r6.z;
    r11.w = r6.w * r9.z;
    r6.y = ps;
    r6.yzw = r6.yyy * r0.xyw + ModShadowColor.xyz;
    r1 = r11 * r5.xyzx;
    r1 = r1 * r9.zzzw;
    r0.xyw = r1.xyz * r2.xyz;
    r9.z = (r7.w > 0.0) ? 0.0 : r1.w;
    r2.xyz = -r1.xyz + r10.xyz;
    r1.xyz = r2.xyz * UniformScalar_15.xxx + r1.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xy = r9.xy * r9.zy;
    r6.x = ps;
    r1.xyz = r1.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    ps = pow(2.0, r7.z);
    r1.xyz = r1.xyz + r7.xxx;
    r7.z = ps;
    ps = pow(2.0, r6.x);
    r7.xzw = r1.xyz * r7.zzz;
    r6.x = ps;
    r0.xy = r0.xy * r0.zz + r7.xz;
    r0.z = r0.w * r0.z + r7.w;
    r0.xyz = r0.xyz * r6.xxx;
    r0.xyz = r0.xyz * r8.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
