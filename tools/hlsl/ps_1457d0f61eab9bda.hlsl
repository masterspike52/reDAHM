// ps_1457d0f61eab9bda.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = 1.0 / r4.w;
    r6.yz = r0.xy * UniformVector_1.xy;
    r9.x = ScreenPositionScaleBias.x * r5.z;
    r1.w = r1.z + 0.1;
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = 1.0 / ModShadowAccumResolution.y;
    ps = ScreenPositionScaleBias.y * r5.z;
    r5.xy = r5.xy * abs(r7.xy);
    r9.y = ps;
    r5.zw = r9.xy * r4.xy + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(Texture2D_3, r6.yz).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r6.yz).xyz;
    r12.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r5.w = tex2D(Texture2D_2, r0.xy).x;
    r6.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = max(UniformScalar_5.x, 0.0001);
    ps = 0.875 * r5.x;
    r5.z = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    ps = 0.875 * r5.y;
    r6.yzw = r6.yzw + r6.yzw;
    r11.y = ps;
    ps = UniformVector_2.x * r5.w;
    r0.xyz = r12.xyz * r2.www;
    r2.x = ps;
    r2.yzw = r7.xyw * 2.0 - 1.0;
    ps = r4.z + r4.z;
    r7.xy = r4.xy * 4.0;
    r7.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = saturate(r1.w * 5.0);
    r5.y = ps;
    ps = 1.0 - r5.x;
    r4.xyz = r5.yyy * r1.xyz;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1.xyz = r7.xyw + float3(-2.0, -2.0, -1.0);
    r5.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r1.xyz - r2.yzw;
    r5.y = ps;
    r1.xyz = r1.xyz * UniformScalar_2.xxx + r2.yzw;
    ps = UniformVector_2.y * r5.w;
    r7.xyw = -r5.xyw + 1.0;
    r2.y = ps;
    r7.xy = r11.xy * r7.xy + 0.125;
    ps = UniformVector_2.z * r5.w;
    r0.w = dot(r1.zxy, r1.zxy);
    r2.z = ps;
    ps = rsqrt(abs(r0.w));
    r5.yzw = r7.www * r10.xyz;
    r5.x = ps;
    r5.yzw = r2.xyz * r10.xyz + r5.yzw;
    r6.yzw = r5.yzw * r6.yzw - r5.yzw;
    r2.xyz = r1.xyz * r5.xxx;
    ps = rsqrt(abs(r6.x));
    r5.x = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    r5.yzw = r6.yzw * UniformScalar_2.xxx + r5.yzw;
    r6.yzw = r5.yzw * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.xxx * r3.xyz;
    r5.x = ps;
    r3.xyz = r2.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r1.zxy);
    r2.xyz = r3.xzy * r5.xxx;
    r1.xyz = r2.xyz * 2.0 - r1.xzy;
    r5.x = saturate(dot(r4.zxy, r1.yxz));
    ps = log2(r5.x);
    r1.xyz = r5.wyz * r9.zxy;
    r7.w = ps;
    r2.xy = r7.xz * r7.yw;
    r5.xyz = r2.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.y);
    r5.w = saturate(dot(r3.zxy, r4.zxy));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r1.yz * r5.ww + r6.xy;
    r6.z = r1.x * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
