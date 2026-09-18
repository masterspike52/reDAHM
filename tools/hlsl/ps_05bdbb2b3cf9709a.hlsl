// ps_05bdbb2b3cf9709a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041000 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_15 : register(c18); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D Texture2D_5 : register(s4);
sampler2D Texture2D_6 : register(s5);
sampler2D Texture2D_7 : register(s6);
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / r4.w;
    r5.xy = r0.xy * UniformVector_1.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r6.xy = r6.xy * abs(r8.xy);
    r4.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r11.xyz = tex2D(Texture2D_6, r5.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r9.xzw = tex2D(Texture2D_7, r0.xy).xyz;
    r13.xy = tex2D(Texture2D_5, r0.xy).xy;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r6.w = dot(r3.zxy, r3.zxy);
    r16.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r15.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r16.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.z = r1.z + 0.1;
    r16.z = ps;
    r4.w = r5.x * UniformScalar_9.x + UniformScalar_10.x;
    r12.xyz = r10.xzy * 2.0 - 1.0;
    ps = r6.z + r6.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = r13.x + r13.y;
    r5.y = dot(r1.zxy, r1.zxy);
    r9.y = ps;
    ps = 5.0 * r5.z;
    r10.xyz = r9.xzw + r9.xzw;
    r9.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r6.xy = r6.xy * 4.0;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r7.xyz = r7.xyz * r2.www;
    r5.x = saturate(ps);
    r2.xyz = (-abs(r7.www) >= 0.0) ? UniformVector_4.xyz : r15.xyz;
    r14.xyz = (-abs(r7.www) >= 0.0) ? UniformVector_6.xyz : r16.xyz;
    r14.xyz = (-abs(r5.www) >= 0.0) ? r16.xyz : r14.xyz;
    r15.xyz = (-abs(r5.www) >= 0.0) ? r15.xyz : r2.xyz;
    ps = log2(r5.x);
    r5.yzw = r5.yyy * r1.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r2.xz = -r9.xy + 1.0;
    r6.w = ps;
    ps = (-2.0) + r6.x;
    r9.xyz = r6.www * r3.xyz;
    r3.x = ps;
    ps = (-2.0) + r6.y;
    r1.xyz = r15.xyz * r13.xxx;
    r3.y = ps;
    ps = (-1.0) + r6.z;
    r13.xyz = r14.xyz * r13.yyy;
    r3.z = ps;
    r2.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    r3.xyz = -r12.xyz + r3.xzy;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.yzw = r2.zzz * r11.xyz;
    r6.x = ps;
    r6.yzw = r13.xyz * r11.xyz + r6.yzw;
    r3.xyz = r3.xzy * UniformScalar_2.xxx + r12.xzy;
    ps = pow(2.0, r6.x);
    r5.x = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    r6.yzw = r1.xyz * r11.xyz + r6.yzw;
    r1.xyz = r6.yzw * r10.xyz - r6.yzw;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r7.xzy * r6.xxx;
    r5.x = ps;
    ps = UniformScalar_15.x;
    r3.xyz = r3.xzy * r5.xxx;
    ps = -UniformScalar_14.x + ps;
    r6.x = dot(r3.yxz, r3.yxz);
    r1.w = ps;
    r5.x = r1.w * UniformScalar_2.x + UniformScalar_14.x;
    r6.yzw = r1.xyz * UniformScalar_2.xxx + r6.yzw;
    r1.xyz = r6.yzw * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = rsqrt(abs(r6.x));
    r6.yzw = r6.yzw - UniformVector_2.xyz;
    r6.x = ps;
    r3.xyz = r3.xzy * r6.xxx;
    r6.x = dot(r3.zxy, r9.zxy);
    ps = r5.x;
    r10.xyz = r3.xzy * r6.xxx;
    r2.z = ps;
    r9.xyz = r10.xyz * 2.0 - r9.xzy;
    ps = 0.0001;
    r5.x = saturate(dot(r5.wyz, r9.yxz));
    r2.w = ps;
    ps = log2(r5.x);
    r5.w = saturate(dot(r3.zxy, r5.wyz));
    r4.z = ps;
    ps = max(r2.z, r2.w);
    r5.xyz = r4.xzy * float3(0.875, 4e+02, 0.875);
    r6.x = ps;
    r2.xy = r5.xz * r2.xy + 0.125;
    ps = r2.x * r2.y;
    r6 = r6 * r4.zwww;
    r5.x = ps;
    r2.xyz = r6.yzw + UniformVector_2.xyz;
    ps = pow(2.0, r5.y);
    r0.xyz = r2.xyz * r0.xyz;
    r5.y = ps;
    r1.xyz = r5.yyy * UniformScalar_8.xxx + r1.xyz;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r1.xyz * r4.www;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
