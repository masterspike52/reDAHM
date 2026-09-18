// ps_fa0cca16c0f2a566.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r1.xy * UniformScalar_0.xx;
    r7.w = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r0.zw = r7.xy * r6.xx + ScreenPositionScaleBias.wz;
    ps = r10.w;
    r7.xy = r1.wz * UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    ps = (-0.5) + r6.x;
    r7.zw = r7.zw * abs(r8.xy);
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r3.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r0.zw = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r12.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r6.yzw = tex2D(Texture2D_1, r6.yz).wxy;
    ps = r5.w;
    r0.y = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r1.w = dot(r2.zxy, r2.zxy);
    r5.x = saturate(ps);
    ps = r2.z;
    r11.xyz = UniformVector_1.xyz * UniformVector_1.www;
    ps = 0.1 + ps;
    r1.x = float((UniformScalar_4.x >= 1.0));
    r6.x = ps;
    r8.xy = r6.zw * 2.0 - 1.0;
    ps = (-1.0) + r6.y;
    r1.y = float((UniformScalar_4.x > 1.0));
    r7.z = ps;
    ps = 5.0 * r6.x;
    r5.yzw = r7.wxy + float3(-2.0, 0.0, 0.0);
    r6.y = saturate(ps);
    r6.xzw = (-abs(r1.yyy) >= 0.0) ? r12.xyz : 1.0;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? 1.0 : r6.xzw;
    ps = 1.0 - r6.y;
    r10.xyz = r11.xyz * r10.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r1.w));
    r7.xyw = r5.zwy + r7.xyw;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r6.xxx * r2.xyz;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r1.xyz = r10.xyz * r1.xyz;
    r5.z = ps;
    ps = (-1.0) + r7.x;
    r5.yzw = -r5.xyz + 1.0;
    r6.x = ps;
    r6.zw = r7.wz * r5.yy + 1.0;
    ps = (-1.0) + r7.y;
    r5.x = r5.y * UniformScalar_1.x;
    r6.y = ps;
    r6.xy = r5.xx * r8.xy + r6.xy;
    ps = -UniformVector_0.x;
    r6.xy = r6.xy * r5.yy;
    r6 = (r5.xyyy > 0.0) ? r6.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r10 = (r5.xyyy >= 0.0) ? r6 : float4(1.0, 0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r10.wyz, r10.wyz);
    r6.y = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r1.xyz * r10.xxx;
    r6.z = ps;
    r1.xyz = r7.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r6.zzz * r4.xyz;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r10.yzw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r4.zxy, r8.zxy);
    r6.z = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r4.xyz * r6.xxx;
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r2.zxy, r8.zxy));
    r6.w = ps;
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r6.yzw;
    r0.y = ps;
    r6.xyw = r0.ywz * float3(15.0, 0.875, 0.875);
    r0.yz = r6.wy * r5.zw + 0.125;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r7.xy = r7.xy * r6.ww + r6.xy;
    r7.z = r7.z * r6.w + r6.z;
    r6.xw = r0.yx * r0.zx;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r3.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
