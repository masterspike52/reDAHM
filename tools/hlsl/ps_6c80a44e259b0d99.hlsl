// ps_6c80a44e259b0d99.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040B00 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c9); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_7 : register(c6); // float
float4 UniformScalar_8 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 color2 : COLOR2; // r8
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
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r1.xy);
    ps = 1.0 / r5.w;
    r6.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r6.zw = r6.yz * r6.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = r10.w - 0.5;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = saturate(r5.w * 0.0001);
    r6.x = ps;
    r6.xy = r6.xy * abs(r9.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r8.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r3.y = tex2D(ShadowTexture, r0.xy).x;
    r7.xz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r7.y = tex2D(Texture2D_1, r1.xy).x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = r2.z;
    r3.x = float((UniformScalar_9.x >= 1.0));
    ps = 0.1 + ps;
    r1.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r6.x = ps;
    r6.yzw = r6.yzw * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r7.w = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    ps = rsqrt(abs(r7.w));
    r10.xyz = r1.xyz * r10.xyz;
    r1.w = ps;
    r1.xyz = r10.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = 1.0 - r6.x;
    r7.w = float((UniformScalar_9.x > 1.0));
    r0.w = ps;
    ps = UniformVector_2.x * r6.y;
    r8.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = UniformVector_2.y * r6.z;
    r9.xyz = r1.www * r2.xyz;
    r6.y = ps;
    ps = UniformVector_2.z * r6.w;
    r5.xy = r0.ww * ModShadowGroupColor.xy;
    r6.z = ps;
    ps = (-1.0) - -r6.z;
    r5.xyz = -r5.xyz + 1.0;
    r6.w = ps;
    r6.xyz = r6.wxy * r5.zzz;
    ps = 1.0 + r6.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r5.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r5.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r8.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r8.w = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r8.www * r4.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.w = dot(r6.zxy, r4.zxy);
    r11.xyz = r6.xzy * r6.www;
    r4.xyz = r11.xyz * 2.0 - r4.xzy;
    ps = UniformScalar_8.x * r7.y;
    r6.w = saturate(dot(r9.zxy, r4.yxz));
    r4.x = ps;
    ps = log2(r6.w);
    r0.xyz = r10.xyz * r0.xyz;
    r7.y = ps;
    ps = UniformScalar_7.x * r7.y;
    r6.w = saturate(dot(r6.zxy, r9.zxy));
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.xyz = r7.yxz * float3(15.0, 0.875, 0.875);
    r4.w = ps;
    r4.yz = r7.yz * r5.xy + 0.125;
    r7.yz = r4.xy * r4.wz;
    r6.xyz = r7.zzz * r2.xyz + ModShadowColor.xyz;
    r3.z = (r7.w > 0.0) ? 0.0 : r7.y;
    r7.yz = r3.xy * r3.zy;
    r8.xyz = r7.zzz * r8.xyz;
    ps = pow(2.0, r7.x);
    r7.yzw = r1.xyz + r7.yyy;
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r8.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
