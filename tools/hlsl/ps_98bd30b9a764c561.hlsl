// ps_98bd30b9a764c561.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040C00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r7.yz = r6.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r6.yw = r0.wz * UniformVector_5.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = saturate(r4.w * 0.0001);
    r6.x = ps;
    ps = (-0.5) + r5.x;
    r6.xz = r6.xz * abs(r8.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r8.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r9.y = tex2D(Texture2D_2, r0.xy).x;
    r6.xz = tex2D(ModShadowAccumTexture, r6.xz).xy;
    r4.yzw = tex2D(LightAttenuationTexture, r7.yz).xyz;
    r10.xyz = tex2D(Texture2D_4, r6.yw).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r5.yz).xyw;
    r4.x = float((UniformScalar_14.x >= 1.0));
    r6.w = float((UniformScalar_14.x > 1.0));
    r6.y = dot(r3.zxy, r3.zxy);
    ps = r1.z;
    r7.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r7.z = float((UniformScalar_13.x >= 1.0));
    r5.x = ps;
    r9.xz = r12.xy * 2.0 - 1.0;
    ps = 5.0 * r5.x;
    r7.w = float((UniformScalar_13.x > 1.0));
    r5.z = saturate(ps);
    r5.xyw = r0.zxy * 2.0 - 1.0;
    r0.xyz = (-abs(r7.www) >= 0.0) ? r10.xyz : 1.0;
    r10.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r0.xyz;
    ps = UniformVector_2.z * r5.x;
    r0.xyz = r4.yzw * r2.www;
    r12.w = ps;
    ps = rsqrt(abs(r7.y));
    r5.z = -r5.z + 1.0;
    r7.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4.yzw = r7.yyy * r1.xyz;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xy = r12.zw - 1.0;
    r7.z = ps;
    r7.yzw = -r7.xyz + 1.0;
    r12.zw = r1.yx * r7.yy + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    r5.xy = r7.xx * r9.xz + r5.yw;
    r5.xy = r5.xy * UniformVector_2.xy;
    ps = UniformVector_4.x * UniformVector_4.w;
    r12.xy = r5.xy * r7.yy;
    r1.x = ps;
    r5 = (r7.xyyy > 0.0) ? r12.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r9.x = (r7.x >= 0.0) ? r5.x : 1.0;
    r5.yzw = (r7.yyy >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.y));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r6.yyy * r3.xyz;
    r5.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r5.yzw = r5.yzw * r5.xxx;
    r1.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r5.x = dot(r5.wyz, r3.zxy);
    r1.z = ps;
    ps = -UniformVector_0.x;
    r12.xyz = r5.yzw * r5.xxx;
    r3.xyz = r12.xyz * 2.0 - r3.xyz;
    ps = 1.0 + ps;
    r6.y = saturate(dot(r4.wyz, r3.zxy));
    r5.x = ps;
    ps = log2(r6.y);
    r1.xyz = r1.xyz * r11.xyz;
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r5.w = saturate(dot(r5.wyz, r4.wyz));
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.yxz * float3(15.0, 0.875, 0.875);
    r5.y = ps;
    r4.yz = r6.yz * r7.zw + 0.125;
    ps = -UniformVector_0.y;
    r5.y = r5.y * UniformScalar_10.x;
    ps = 1.0 + ps;
    r1.w = r5.y * r9.x;
    r5.y = ps;
    ps = -UniformVector_0.z;
    r7 = r1 * r10.xyzx;
    ps = 1.0 + ps;
    r1 = r7 * r9.xxxy;
    r5.z = ps;
    r7.xyz = r1.xyz * r5.xyz;
    r4.w = (r6.w > 0.0) ? 0.0 : r1.w;
    r5.xyz = -r1.xyz + r8.xyz;
    r5.xyz = r5.xyz * UniformScalar_15.xxx + r1.xyz;
    r1.xyz = r5.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    r6.yz = r4.xy * r4.wz;
    r5.xyz = r6.zzz * r2.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r1.xyz + r6.yyy;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r7.xy * r5.ww + r6.xy;
    r6.z = r7.z * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
