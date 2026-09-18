// ps_f742e5903a43a5cd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040D00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = In.color2;
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
    r7.xy = r0.xy * UniformScalar_0.xx;
    r5.z = ps;
    ps = 1.0 / r4.w;
    r5.yw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r5.yw * r5.xx + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r6.xy = r0.wz * UniformVector_5.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.w = float((UniformScalar_14.x > 1.0));
    r5.y = ps;
    ps = (-0.5) + r5.x;
    r5.yz = r5.yz * abs(r8.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r10.y = tex2D(Texture2D_2, r0.xy).x;
    r5.yw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r10.xzw = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r13.xyz = tex2D(Texture2D_4, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r7.xy).xyw;
    r8.x = float((UniformScalar_14.x >= 1.0));
    ps = r4.w;
    r7.y = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r5.x = r1.z + 0.1;
    r7.x = saturate(ps);
    ps = UniformVector_4.x * UniformVector_4.w;
    r5.z = float((UniformScalar_13.x >= 1.0));
    r0.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r7.z = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r8.yz = r12.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r6.w = saturate(-r6.w + 1.0);
    r7.z = ps;
    ps = 5.0 * r5.x;
    r7.w = float((UniformScalar_13.x > 1.0));
    r5.x = saturate(ps);
    r6.xyz = r6.zxy * 2.0 - 1.0;
    r4.xyz = (-abs(r7.www) >= 0.0) ? r13.xyz : 1.0;
    r4.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r4.xyz;
    ps = UniformVector_2.z * r6.x;
    r11.xyz = r0.xyz * r11.xyz;
    r12.w = ps;
    ps = 1.0 - r5.x;
    r0.xyz = r10.xzw * r2.www;
    r5.z = ps;
    ps = rsqrt(abs(r7.y));
    r1.xyz = r7.zzz * r1.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.xyz = r5.xxx * r3.xyz;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r2.xy = r12.zw - 1.0;
    r7.z = ps;
    r7.yzw = -r7.xyz + 1.0;
    r12.zw = r2.yx * r7.yy + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    r5.xz = r7.xx * r8.yz + r6.yz;
    r5.xz = r5.xz * UniformVector_2.xy;
    r12.xy = r5.xz * r7.yy;
    r12 = (r7.xyyy > 0.0) ? r12.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r10.x = (r7.x >= 0.0) ? r12.x : 1.0;
    r6.xyz = (r7.yyy >= 0.0) ? r12.yzw : float3(0.0, 0.0, 1.0);
    ps = log2(r6.w);
    r5.x = dot(r6.zxy, r6.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r5.z = r5.z * LightColorAndFalloffExponent.w;
    r5.x = ps;
    r6.yzw = r6.xyz * r5.xxx;
    ps = -UniformVector_0.x;
    r5.x = dot(r6.wyz, r3.zxy);
    ps = 1.0 + ps;
    r8.yzw = r6.yzw * r5.xxx;
    r6.x = ps;
    r3.xyz = r8.yzw * 2.0 - r3.xyz;
    ps = pow(2.0, r5.z);
    r5.x = saturate(dot(r1.zxy, r3.zxy));
    r5.z = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xzy * r5.zzz;
    r5.z = ps;
    ps = UniformScalar_9.x * r5.z;
    r6.w = saturate(dot(r6.wyz, r1.zxy));
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r5.xyw = r5.ywz * float3(0.875, 0.875, 15.0);
    r5.z = ps;
    r8.yz = r5.xy * r7.zw + 0.125;
    ps = -UniformVector_0.y;
    r5.z = r5.z * UniformScalar_10.x;
    ps = 1.0 + ps;
    r11.w = r5.z * r10.x;
    r6.y = ps;
    ps = -UniformVector_0.z;
    r7 = r11 * r4.xyzx;
    ps = 1.0 + ps;
    r1 = r7 * r10.xxxy;
    r6.z = ps;
    r7.xyz = r1.xyz * r6.xyz;
    r8.w = (r3.w > 0.0) ? 0.0 : r1.w;
    r6.xyz = -r1.xyz + r9.xyz;
    r6.xyz = r6.xyz * UniformScalar_15.xxx + r1.xyz;
    r1.xyz = r6.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    r6.xy = r8.xy * r8.wz;
    r5.xyz = r6.yyy * r2.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r6.xyz = r1.xyz + r6.xxx;
    r5.w = ps;
    r6.xyz = r6.xyz * r5.www;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
