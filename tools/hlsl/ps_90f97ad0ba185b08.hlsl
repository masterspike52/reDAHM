// ps_90f97ad0ba185b08.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.xyw = tex2D(Texture2D_0, r5.xy).xyw;
    r8.xy = r0.wz * UniformVector_3.xy;
    r11.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = r4.w;
    r5.z = r1.z + 0.1;
    r12.xy = r5.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.x = saturate(r5.z * 5.0);
    r6.z = saturate(ps);
    ps = 1.0 / r4.w;
    r5.x = -r5.x + 1.0;
    r12.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r5.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -r6.xzy + 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r4.xy = r5.xy * abs(r7.xy);
    r11.x = ps;
    r5.xy = r11.yz * r12.ww + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r9.xyz = tex2D(Texture2D_2, r8.xy).xyz;
    r13.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = UniformVector_4.x * UniformVector_4.w;
    r6.w = dot(r1.zxy, r1.zxy);
    r8.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r5.y = dot(r2.zxy, r2.zxy);
    r8.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r0.xyz = r0.xyz * r2.www;
    r8.z = ps;
    r12.z = r13.z * 2.0 - 1.0;
    r4.xw = r13.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r5.x = saturate(-r5.y + 1.0);
    r6.w = ps;
    r13.xyz = r8.xzy * UniformVector_5.xzy - r8.xzy;
    r8.yzw = r13.xyz * r9.xxx + r8.xzy;
    ps = rsqrt(abs(r5.z));
    r1.yzw = r6.www * r1.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r3.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = log2(r5.x);
    r13.xyz = r5.yyy * -SpotDirection.xyz;
    r5.x = ps;
    r5.y = dot(r13.zxy, r2.zxy);
    r12.xy = r11.xx * r12.xy + r4.xw;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r2.xyz = r12.xyz * UniformVector_2.xyz;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5.z = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r0.xyz = r0.xzy * r6.www;
    r5.z = ps;
    ps = -UniformVector_0.x;
    r2.xyz = r2.xyz * r5.zzz;
    ps = 1.0 + ps;
    r5.z = dot(r2.zxy, r3.zxy);
    r1.x = ps;
    ps = (-1.0) + r5.w;
    r12.xyz = r2.xzy * r5.zzz;
    r4.w = ps;
    r5.xzw = r12.xyz * 2.0 - r3.xzy;
    ps = -SpotAngles.x - -r5.y;
    r5.z = saturate(dot(r1.wyz, r5.zxw));
    r5.x = ps;
    ps = log2(r5.z);
    r6.w = saturate(dot(r2.zxy, r1.wyz));
    r4.x = ps;
    ps = SpotAngles.y * r5.x;
    r4.xyz = r4.xyz * float3(15.0, 0.875, 0.875);
    r5.w = saturate(ps);
    r5.xyz = r4.yzw * r6.xzy + float3(0.125, 0.125, 1.0);
    r6.x = (r11.x > 0.0) ? r5.z : 1.0;
    r8.x = (r11.x >= 0.0) ? r6.x : 1.0;
    ps = -UniformVector_0.y;
    r5.xw = r5.xw * r5.yw;
    r5.xyz = r5.xxx * r10.xyz + ModShadowColor.xyz;
    ps = 1.0 + ps;
    r6.xyz = r8.xwz * r9.xyz;
    r1.y = ps;
    ps = -UniformVector_0.z;
    r6.xyz = r6.xyz * r8.yxx;
    ps = 1.0 + ps;
    r2.xyz = r6.xyz * UniformScalar_5.xxx;
    r1.z = ps;
    r1.xyz = r2.xyz * r1.xyz;
    ps = pow(2.0, r4.x);
    r3.xyz = -r2.xyz + r7.xyz;
    r6.x = ps;
    r2.xyz = r3.xyz * UniformScalar_5.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
