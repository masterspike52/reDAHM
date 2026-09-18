// ps_64cb71fdc1e69530.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040B00 00000A0A 00000000 0000914A 007F03FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A1 0000F9A2
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

float4 LightColor : register(c8); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.x = r1.w * UniformVector_2.x;
    r8.z = 1.0 / ModShadowAccumResolution.y;
    r8.x = -r1.z + 1.0;
    r7.z = 1.0 / r6.w;
    ps = ScreenPositionScaleBias.x * r7.z;
    r7.y = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = r3.z + 0.1;
    r8.y = ps;
    ps = rsqrt(abs(r7.y));
    r8.zw = r8.yz * abs(r10.xy);
    r8.y = ps;
    ps = ScreenPositionScaleBias.y * r7.z;
    r7.y = dot(r5.zxy, r5.zxy);
    r9.y = ps;
    r0.zw = r9.xy * r6.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.y));
    r9.xyw = r8.yyy * r3.xyz;
    r7.y = ps;
    ps = UniformVector_2.y * r8.x;
    r4.xyw = r7.yyy * r5.xyz;
    r7.y = ps;
    ps = (-0.5) + r7.x;
    r2.xy = r9.xy * -r4.xy;
    r2.z = ps;
    ps = (-0.5) + r7.y;
    r5.xy = float2((r7.xy >= 0.5));
    r2.w = ps;
    r2.zw = r2.zw - r7.xy;
    r2.zw = r2.zw * r5.xy + r7.xy;
    r2.xyw = r2.zwx + r2.zwy;
    r9.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r6 = tex2D(Texture2D_2, r2.xy);
    r2.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r11.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r10 = tex2D(Texture2D_1, r1.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r4.xy = r7.xy * 0.875;
    ps = 5.0 * r7.w;
    r8.w = saturate(r8.y * r3.z);
    r7.y = saturate(ps);
    ps = r10.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 - r7.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    ps = r10.w;
    r1.xyz = r11.xyz * 0.5;
    r7.z = ps;
    ps = UniformScalar_0.x * r7.z;
    r3.xyz = r1.xyz * r10.www;
    r7.x = ps;
    r7.xzw = r7.www * UniformVector_1.xyz + r7.xxx;
    r1.xyz = r3.xyz * UniformScalar_1.xxx + r7.xzw;
    r7.x = r4.w * 2.0 - r4.w;
    r3.xyz = r10.xyz * 2e+01 + r3.xyz;
    ps = 1.0 - r7.y;
    r3.xyz = r3.xyz - r2.xyz;
    r7.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r7.y = dot(r5.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r0.w = (r7.y == 0.0) ? r6.x : r6.y;
    ps = ModShadowGroupColor.y * r7.z;
    r7.yw = r7.yy + float2(-2.0, -3.0);
    r5.z = ps;
    r7.y = (r7.y == 0.0) ? r6.z : r0.w;
    r5.x = (r7.w == 0.0) ? r6.w : r7.y;
    r7.w = saturate(r9.w * r7.x + r2.w);
    ps = log2(r7.w);
    r7.xyz = -r5.xyz + 1.0;
    r7.w = ps;
    r4.xy = r4.xy * r7.yz + 0.125;
    r7.xy = r7.xw * float2(2.5, 15.0);
    r7.zw = r4.xz * r4.yz;
    r8.xyz = r7.zzz * r8.xyz + ModShadowColor.xyz;
    ps = (-0.5) + r7.x;
    r9.xyz = r7.www * r9.xyz;
    r7.z = saturate(ps);
    r1.xyz = r1.xyz * r7.zzz;
    r2.xyz = r3.xyz * r7.zzz + r2.xyz;
    ps = pow(2.0, r7.y);
    r0.xyz = r2.xyz * r0.xyz;
    r7.x = ps;
    r7.xyz = r1.xyz * r7.xxx;
    r7.xy = r0.xy * r8.ww + r7.xy;
    r7.z = r0.z * r8.w + r7.z;
    r7.xyz = r9.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r7.xyz = r7.xzy * r8.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
