// ps_b71f9aacd7d6a9ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003D8 10040D00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r2.z + 0.1;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    r6.yz = r6.yz * abs(r8.xy);
    r13.y = ps;
    r10.zw = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r8.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    ps = 1.0 / r5.w;
    r6.z = -r1.z + 1.0;
    r7.y = ps;
    r7.xz = r1.xy * UniformVector_3.xy;
    r13.zw = r1.xy + 0.5;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.w = dot(r2.zxy, r2.zxy);
    r8.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r7.yw = r7.yy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r11.xy = r7.yw * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.y));
    r5.xyz = r6.www * r2.xyz;
    r10.x = ps;
    r2.xyw = r10.xxx * r4.xyz;
    ps = UniformVector_2.y * r6.z;
    r6.w = dot(r8.zxy, r8.zxy);
    r13.x = ps;
    r7.yw = float2((r13.xy >= 0.5));
    ps = rsqrt(abs(r6.w));
    r6.yz = r13.xy - 0.5;
    r6.w = ps;
    ps = r6.z;
    r8.xyz = r8.xyz * r6.www;
    ps = -r13.y + ps;
    r6.w = dot(r8.zxy, r2.wxy);
    r6.z = ps;
    ps = r6.y;
    r12.xyz = r8.xzy * r6.www;
    r12.xyz = r12.xyz * 2.0 - r2.xwy;
    ps = -r13.x + ps;
    r6.y = saturate(dot(r5.zxy, r12.yxz));
    r6.w = ps;
    ps = log2(r6.y);
    r12.xy = r6.zw * r7.wy;
    r10.y = ps;
    r10 = r10.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    r12.zw = r10.zz * r4.xy;
    r6.yz = r12.zw + 0.5;
    r6.yz = r6.yz + r1.xy;
    r4 = r13.yxzw + r12;
    r0.zw = r4.xy + r4.xy;
    r2.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r7.x = tex2D(Texture2D_3, r7.xz).x;
    r11 = tex2D(Texture2D_2, r0.zw);
    r6.w = tex2D(Texture2D_1, r6.yz).w;
    r1 = tex2D(Texture2D_1, r1.xy);
    r0.yzw = tex2D(Texture2D_1, r4.zw).xyz;
    ps = 5.0 * r6.x;
    r6.y = dot(r3.zxy, r3.zxy);
    r7.z = saturate(ps);
    ps = 1.0 - r6.y;
    r4.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r6.z = saturate(ps);
    ps = rsqrt(abs(r6.y));
    r0.yzw = r0.yzw * 0.15;
    r6.x = ps;
    r4.yzw = r4.xyz * r1.xyz - r0.yzw;
    ps = log2(r6.z);
    r4.x = -r6.w + 1.0;
    r6.z = ps;
    ps = r2.w;
    r12.yzw = r6.xxx * -SpotDirection.xyz;
    r12.x = ps;
    ps = 0.0;
    r6.y = dot(r12.wyz, r3.zxy);
    r12.y = ps;
    r6.w = r4.x * r1.w + r6.w;
    ps = max(r12.x, r12.y);
    r7.y = dot(r7.wyy, float3(1.0, 1.0, 1.0));
    r7.w = ps;
    r3.xyz = r4.yzw * r1.www + r0.yzw;
    r4.xyz = r3.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r0.w = (r7.y == 0.0) ? r11.x : r11.y;
    ps = -SpotAngles.x - -r6.y;
    r0.yz = -r7.wz + 1.0;
    r6.x = ps;
    ps = log2(abs(r0.y));
    r7.xyw = r7.yyx + float3(-3.0, -2.0, 1.0);
    r7.z = ps;
    r6.y = (r7.y == 0.0) ? r11.z : r0.w;
    ps = SpotAngles.y * r6.x;
    r7.z = r7.z * UniformScalar_4.x;
    r0.y = saturate(ps);
    ps = pow(2.0, r7.z);
    r11.xy = r0.zz * ModShadowGroupColor.xy;
    r11.z = ps;
    r6.y = (r7.x == 0.0) ? r11.w : r6.y;
    ps = r7.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = -r11.z + ps;
    r1.yzw = -r11.xyz + 1.0;
    r4.w = ps;
    r0.zw = r10.xy * r1.yz + 0.125;
    ps = pow(2.0, r10.w);
    r0.xyz = r0.zxy * r0.wxy;
    r1.x = ps;
    r1 = r4 * r1.xxxw;
    r7.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r2.w = r1.w * r6.w;
    r3.xyz = r3.xyz * r9.xyz;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r6.w = saturate(dot(r8.zxy, r5.zxy));
    r6.x = ps;
    r1.xy = r3.xy * r6.ww + r1.xy;
    r1.z = r3.z * r6.w + r1.z;
    ps = pow(2.0, r6.x);
    r2.xyz = r0.yyy * r2.xyz;
    r6.x = ps;
    ps = 1.0 - r6.y;
    r2.xyz = r2.xzy * r6.xxx;
    r1.w = ps;
    r6 = r2.wxzy * r1.wxyz;
    ps = r6.x;
    r6.yzw = r6.yzw * LightColorAndFalloffExponent.xyz;
    r6.x = ps;
    ps = (-0.5) - -r6.x;
    r6.yzw = r6.ywz * r0.zzz;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.xyz = r6.ywz * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
