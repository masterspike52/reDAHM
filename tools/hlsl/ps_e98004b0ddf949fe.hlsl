// ps_e98004b0ddf949fe.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_2, r0.xy).xzyw;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xz = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r8.w;
    r6.xy = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.z = saturate(r4.w * 0.0001);
    r6.z = ps;
    ps = (-0.5) + r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10 = tex2D(Texture2D_1, r0.xy);
    r6.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r0.yzw = tex2D(LightAttenuationTexture, r5.xz).xyz;
    ps = -UniformVector_0.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r11.xyz = UniformVector_3.xyz * 2e+01;
    r12.x = ps;
    ps = -UniformVector_0.y;
    r6.w = float((UniformScalar_3.x >= 1.0));
    ps = 1.0 + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r12.y = ps;
    ps = -UniformVector_0.z;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.x = r1.z + 0.1;
    r12.w = ps;
    ps = 5.0 * r5.x;
    r5.z = float((UniformScalar_3.x > 1.0));
    r0.x = saturate(ps);
    ps = r8.z;
    r2.xyz = r0.yzw * r2.www;
    r5.w = ps;
    r6.xyz = (-abs(r5.zzz) >= 0.0) ? r6.xyz : 1.0;
    ps = rsqrt(abs(r5.y));
    r0.yzw = r10.xyz * r10.www;
    r2.w = ps;
    r5.xyz = r7.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r2.www * r1.xyz;
    r1.x = ps;
    ps = UniformScalar_4.x * r5.w;
    r10.xyz = r1.xxx * r3.xyz;
    r1.x = ps;
    ps = UniformScalar_4.x * r8.y;
    r0.yzw = r11.xyz * r0.yzw;
    r1.y = ps;
    r6.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r6.yxz;
    ps = UniformVector_2.x * r5.y;
    r11.yz = r1.xy * r6.xz;
    r6.w = ps;
    r1.xyz = r6.yxz * r8.xzy + r0.yzw;
    ps = UniformVector_2.y * r5.z;
    r5.w = dot(r0.wyz, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = UniformVector_2.z * r5.x;
    r5.w = r5.w - r0.y;
    r6.z = ps;
    ps = 1.0 - r6.z;
    r0.y = saturate(r5.w + r0.y);
    r5.x = ps;
    ps = r5.x;
    r1.xyz = r1.xyz * r12.xyw;
    ps = r0.y * ps;
    r5.xz = -r0.yx + 1.0;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r0.xy = -r6.wx * r0.yy;
    r12.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.xyz = r6.zwx + r0.zxy;
    r12.y = ps;
    ps = (-1.0) - -r0.x;
    r3.xyz = -r12.xyz + 1.0;
    r0.w = ps;
    ps = UniformScalar_4.x * r6.y;
    r0.xyw = r0.yzw * r3.zzz;
    r5.y = ps;
    ps = r5.y;
    r0.z = r0.w + 1.0;
    r6.xyz = (r3.zzz > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r3.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r8.x * ps;
    r5.y = dot(r0.zxy, r0.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r11.xyz + UniformScalar_5.xxx;
    r5.y = ps;
    r0.xyz = r0.xyz * r5.yyy;
    r5.y = dot(r0.zxy, r10.zxy);
    r8.xyz = r0.xyz * r5.yyy;
    r8.xyz = r8.xyz * 2.0 - r10.xyz;
    r5.y = saturate(dot(r7.zxy, r8.zxy));
    ps = log2(r5.y);
    r6.xyz = r6.xyz * r5.xxx;
    r9.x = ps;
    r5.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r0.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r3.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r2.xzy * r6.xzy;
    r6.xyz = r6.xyz * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
