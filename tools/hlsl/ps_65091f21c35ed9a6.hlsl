// ps_65091f21c35ed9a6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / r4.w;
    r5.xy = UniformVector_2.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r13.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r5.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r0.xy).zxy;
    r11.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.x = tex2D(Texture2D_3, r0.xy).x;
    ps = r1.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r3.w = ps;
    ps = UniformScalar_9.x;
    r5.w = float((UniformScalar_1.x >= UniformScalar_0.x));
    r6.z = ps;
    ps = 0.0001;
    r1.w = float((UniformScalar_1.x > UniformScalar_0.x));
    r6.w = ps;
    ps = max(r6.z, r6.w);
    r6.y = dot(r2.zxy, r2.zxy);
    r8.w = ps;
    ps = 1.0 - r6.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.z = saturate(ps);
    ps = 1.0 - r6.x;
    r11.xy = r11.xy * 0.875;
    r10.w = ps;
    ps = UniformVector_1.x * r5.y;
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = UniformVector_1.y * r5.z;
    r10.xyz = r10.xyz * r6.xxx;
    r0.z = ps;
    ps = UniformVector_1.z * r5.x;
    r12.xyz = r13.xyz * r8.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r0.x));
    r5.x = saturate(r3.w * 5.0);
    r5.y = ps;
    ps = 1.0 - r5.x;
    r0.x = saturate(r5.y * r1.z);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r8.xyz = r5.yyy * r1.zxy;
    r6.w = ps;
    r5.xyz = (-abs(r1.www) >= 0.0) ? r13.xyz : r12.xyz;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r6.www * r3.xyz;
    r6.y = ps;
    ps = -r1.x;
    r12.xyz = r6.yyy * -SpotDirection.xyz;
    r3.y = ps;
    r3.x = r1.z * 2.0 - r1.z;
    r5.xzw = (-abs(r5.www) >= 0.0) ? r13.xyz : r5.xyz;
    ps = -r1.y;
    r5.y = dot(r12.zxy, r2.zxy);
    r3.z = ps;
    r6.xy = -r6.xx * ModShadowGroupColor.xy + 1.0;
    r6.yw = r11.xy * r6.xy + 0.125;
    ps = -SpotAngles.x - -r5.y;
    r1.xyz = -r0.yzw + r5.xzw;
    r5.x = ps;
    r5.yzw = r1.zxy * UniformScalar_1.xxx + r0.wyz;
    r0.yzw = r5.zwy * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = SpotAngles.y * r5.x;
    r1 = r10 * r5.zwyy;
    r6.x = saturate(ps);
    ps = r1.z + r1.w;
    r5.y = saturate(dot(r8.yzx, r3.yzx));
    r8.z = ps;
    r8.xy = r10.ww * r5.zw + r1.xy;
    ps = log2(r5.y);
    r5.xw = r6.yx * r6.wx;
    r7.w = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = log2(r6.z);
    r1 = r8 * r7;
    r6.x = ps;
    ps = pow(2.0, r1.w);
    r6.x = r6.x * LightColorAndFalloffExponent.w;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r0.yzw * r6.yyy;
    r6.x = ps;
    r6.yz = r1.xy * r0.xx + r6.yz;
    r6.w = r1.z * r0.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
