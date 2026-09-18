// ps_30f86ddbfc454a95.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10040E00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c19); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r11.xy = r0.xy * UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r5.xy = r5.xy * abs(r8.xy);
    r6.y = ps;
    r5.zw = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r13.yzw = tex2D(Texture2D_7, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xw = tex2D(Texture2D_5, r0.xy).xy;
    r6.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r11.xyz = tex2D(Texture2D_0, r11.xy).xyz;
    r5.xz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.y = tex2D(Texture2D_4, r0.xy).x;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r6.w = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r5.w = r1.z + 0.1;
    r3.w = ps;
    r7.w = r5.y * UniformScalar_9.x + UniformScalar_10.x;
    ps = 0.875 * r5.x;
    r12.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r13.x = ps;
    r11.xyz = r11.xyz * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r14.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r6.x = ps;
    ps = r8.x + r8.w;
    r0.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = 5.0 * r5.w;
    r7.xyz = r7.xyz * r2.www;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r6.yz = r6.yz * 4.0;
    r0.w = ps;
    r0.xyz = (-abs(r3.www) >= 0.0) ? UniformVector_4.xyz : r14.xyz;
    r2.xyz = (-abs(r3.www) >= 0.0) ? UniformVector_6.xyz : r12.xyz;
    r12.xyz = (-abs(r1.www) >= 0.0) ? r12.xyz : r2.xyz;
    r2.yzw = (-abs(r1.www) >= 0.0) ? r14.xyz : r0.xyz;
    ps = 1.0 - r5.x;
    r0.xyz = r13.yzw + r13.yzw;
    r5.w = ps;
    ps = (-2.0) + r6.y;
    r1.xyz = r0.www * r1.xyz;
    r2.x = ps;
    ps = (-2.0) + r6.z;
    r8.xyz = r2.yzw * r8.xxx;
    r2.y = ps;
    ps = (-1.0) + r6.x;
    r12.xyz = r12.xyz * r8.www;
    r2.z = ps;
    ps = 1.0 - r5.y;
    r2.xyz = r2.xyz - r11.xyz;
    r5.y = ps;
    ps = 0.875 * r5.z;
    r6.xyz = r5.yyy * r4.xyz;
    r13.y = ps;
    r5.xy = -r5.ww * ModShadowGroupColor.xy + 1.0;
    r5.yz = r13.xy * r5.xy + 0.125;
    r6.xyz = r12.xyz * r4.xyz + r6.xyz;
    r2.xyz = r2.xyz * UniformScalar_2.xxx + r11.xyz;
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    r6.xyz = r8.xyz * r4.xyz + r6.xyz;
    r0.xyz = r6.xyz * r0.xyz - r6.xyz;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r5.www * r3.xyz;
    r5.x = ps;
    ps = UniformScalar_15.x;
    r2.xyz = r2.xyz * r5.xxx;
    ps = -UniformScalar_14.x + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    r5.w = r0.w * UniformScalar_2.x + UniformScalar_14.x;
    r0.xyz = r0.xyz * UniformScalar_2.xxx + r6.xyz;
    r6.xyz = r0.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r0.xyz - UniformVector_2.xyz;
    r5.x = ps;
    r0.xyz = r0.xyz * r7.www + UniformVector_2.xyz;
    r2.xyz = r2.xyz * r5.xxx;
    ps = r5.w;
    r5.x = dot(r2.zxy, r4.zxy);
    r3.x = ps;
    ps = 0.0001;
    r8.xyz = r2.xzy * r5.xxx;
    r3.y = ps;
    r4.xyz = r8.xyz * 2.0 - r4.xzy;
    ps = max(r3.x, r3.y);
    r5.x = saturate(dot(r1.zxy, r4.yxz));
    r5.w = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r10.xyz;
    r5.x = ps;
    ps = 4e+02 * r5.x;
    r6.w = saturate(dot(r2.zxy, r1.zxy));
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r5.xw = r5.yw * r5.zx;
    r0.w = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r6.xyz = r0.www * UniformScalar_8.xxx + r6.xyz;
    ps = pow(2.0, r5.w);
    r6.xyz = r6.xyz * r7.www;
    r5.w = ps;
    r6.xyz = r6.xyz * r5.www;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
