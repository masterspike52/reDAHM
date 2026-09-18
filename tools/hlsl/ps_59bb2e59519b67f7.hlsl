// ps_59bb2e59519b67f7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10040C00 00000A0A 00000000 0000914A 007F03FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A1 0000F9A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
//   interpolator: r9 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
    float4 color1 : COLOR1; // r8
    float4 color2 : COLOR2; // r9
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
    float4 r8 = In.color1;
    float4 r9 = In.color2;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.x = r1.w * UniformVector_2.x;
    r8.w = 1.0 / ModShadowAccumResolution.y;
    r7.x = -r1.z + 1.0;
    r7.z = 1.0 / r6.w;
    ps = ScreenPositionScaleBias.x * r7.z;
    r7.w = dot(r3.zxy, r3.zxy);
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r8.z = ps;
    ps = rsqrt(abs(r7.w));
    r0.zw = r8.zw * abs(r10.xy);
    r8.z = ps;
    ps = ScreenPositionScaleBias.y * r7.z;
    r7.w = dot(r5.zxy, r5.zxy);
    r8.w = ps;
    r4.zw = r8.yw * r6.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.w));
    r9.xyw = r8.zzz * r3.xyz;
    r7.z = ps;
    ps = UniformVector_2.y * r7.x;
    r2.xyw = r7.zzz * r5.xyz;
    r8.y = ps;
    ps = (-0.5) + r8.x;
    r5.xy = r9.xy * -r2.xy;
    r7.x = ps;
    ps = (-0.5) + r8.y;
    r4.xy = float2((r8.xy >= 0.5));
    r7.z = ps;
    ps = 1.0 - r7.y;
    r7.xw = r7.xz - r8.xy;
    r7.z = saturate(ps);
    r5.zw = r7.xw * r4.xy + r8.xy;
    r7.xyw = r5.zwx + r5.zwy;
    r9.xyz = tex2D(LightAttenuationTexture, r4.zw).xyz;
    r2.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r10.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r12 = tex2D(Texture2D_2, r7.xy);
    r5 = tex2D(Texture2D_1, r1.xy);
    ps = r5.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 - r7.x;
    r8.x = r5.w * UniformScalar_0.x;
    r8.y = ps;
    r6.xyz = r8.yyy * UniformVector_1.xyz + r8.xxx;
    ps = log2(r7.z);
    r8.w = saturate(r8.z * r3.z);
    r7.x = ps;
    r8.x = r2.w * 2.0 - r2.w;
    ps = 0.1 - -r3.z;
    r8.y = dot(r4.xyy, float3(1.0, 1.0, 1.0));
    r7.y = ps;
    r7.z = (r8.y == 0.0) ? r12.x : r12.y;
    ps = 5.0 * r7.y;
    r8.yz = r8.yy + float2(-3.0, -2.0);
    r7.y = saturate(ps);
    r7.z = (r8.z == 0.0) ? r12.z : r7.z;
    r7.z = (r8.y == 0.0) ? r12.w : r7.z;
    r8.z = saturate(r9.w * r8.x + r7.w);
    r11.zw = -r7.yz + 1.0;
    r8.xy = -r11.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r8.z);
    r7.yzw = r11.wxy * float3(2.5, 0.875, 0.875);
    r10.w = ps;
    r1 = r10 * float4(0.5, 0.5, 0.5, 15.0);
    r4.xy = r7.zw * r8.xy + 0.125;
    ps = (-0.5) + r7.y;
    r8.xyz = r1.xyz * r5.www;
    r0.w = saturate(ps);
    r3.xyz = r8.xyz * UniformScalar_1.xxx + r6.xyz;
    r5.xyz = r5.xyz * 2e+01 + r8.xyz;
    ps = r4.x * r4.y;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    r8.y = ps;
    ps = r4.z * r4.z;
    r1.xyz = r5.xyz - r2.xyz;
    r9.w = ps;
    ps = pow(2.0, r1.w);
    r3.xyz = r3.xyz * r0.www;
    r8.x = ps;
    r7.yzw = r8.yyy * r7.yzw + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r8.xyz = r3.xyz * r8.xxx;
    r7.x = ps;
    r1.xyz = r1.xyz * r0.www + r2.xyz;
    ps = pow(2.0, r7.x);
    r9.xyz = r9.www * r9.xyz;
    r7.x = ps;
    r9.xyz = r9.xzy * r7.xxx;
    r0.xyz = r1.xyz * r0.xyz;
    r8.xy = r0.xy * r8.ww + r8.xy;
    r8.z = r0.z * r8.w + r8.z;
    r8.xyz = r9.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.ywz;
    oC0.xyz = r7.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
