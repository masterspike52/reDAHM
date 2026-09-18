// ps_3bc5297a35ff3665.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.zw = UniformVector_2.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r4.xy = r8.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r13.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_4, r5.zw).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.z = tex2D(Texture2D_3, r0.xy).x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformScalar_9.x;
    r6.x = float((UniformScalar_1.x >= UniformScalar_0.x));
    r7.x = ps;
    ps = 0.0001;
    r5.w = dot(r1.zxy, r1.zxy);
    r7.y = ps;
    ps = r1.z;
    r0.w = float((UniformScalar_1.x > UniformScalar_0.x));
    ps = 0.1 + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r3.w = ps;
    ps = 0.875 * r5.x;
    r0.xyz = r11.xyz * UniformVector_1.xyz;
    r7.z = ps;
    ps = 0.875 * r5.y;
    r8.xyz = r8.xyz * r5.zzz;
    r7.w = ps;
    ps = rsqrt(abs(r1.w));
    r5.x = saturate(r3.w * 5.0);
    r5.y = ps;
    ps = 1.0 - r5.x;
    r10.xyz = r13.xyz * r10.xyz;
    r5.x = ps;
    r12.xyz = (-abs(r0.www) >= 0.0) ? r13.xyz : r10.xyz;
    ps = rsqrt(abs(r5.w));
    r3.xyw = r5.yyy * r3.xzy;
    r5.w = ps;
    ps = -r3.x;
    r11.xyz = r5.www * r1.zxy;
    r10.y = ps;
    r10.x = r3.y * 2.0 - r3.y;
    r12.xyz = (-abs(r6.xxx) >= 0.0) ? r13.xyz : r12.xyz;
    r5.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.xy = r7.zw * r5.xy + 0.125;
    ps = -r3.w;
    r3.xyz = -r0.xyz + r12.xyz;
    r10.z = ps;
    ps = max(r7.x, r7.y);
    r6.x = saturate(dot(r11.yzx, r10.yzx));
    r3.w = ps;
    r3.xyz = r3.xyz * UniformScalar_1.xxx + r0.xyz;
    ps = 1.0 - r5.z;
    r5.x = r5.x * r5.y;
    r8.w = ps;
    r5.xyz = r5.xxx * r6.yzw + ModShadowColor.xyz;
    r6.yzw = r3.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = log2(r6.x);
    r7 = r8 * r3.xyzz;
    r4.w = ps;
    ps = r7.z + r7.w;
    r0.xyz = r9.xyz * r2.www;
    r3.z = ps;
    r3.xy = r8.ww * r3.xy + r7.xy;
    r2 = r3 * r4;
    ps = pow(2.0, r2.w);
    r5.w = saturate(r5.w * r1.z);
    r6.x = ps;
    r6.xyz = r6.ywz * r6.xxx;
    r6.y = r2.z * r5.w + r6.y;
    r6.xz = r2.xy * r5.ww + r6.xz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
