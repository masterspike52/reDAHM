// ps_822058fbc4f25187.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040D00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
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
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r0.w * UniformVector_2.x;
    r6.x = ps;
    ps = 1.0 / r4.w;
    r5.x = -r0.z + 1.0;
    r5.w = ps;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r5.ww * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r7.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.z));
    r8.xy = r6.xy * abs(r8.xy);
    r7.w = ps;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.z));
    r4.xyz = r7.www * r1.zxy;
    r5.z = ps;
    ps = UniformVector_2.y * r5.x;
    r6.xyw = r5.zzz * r3.xyz;
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r3.xy = r4.yz * -r6.xy;
    r5.z = ps;
    ps = (-0.5) + r5.x;
    r11.zw = float2((r5.yx >= 0.5));
    r5.w = ps;
    r5.zw = r5.zw - r5.yx;
    r3.zw = r5.zw * r11.zw + r5.yx;
    r5.xyz = r3.zwx + r3.zwy;
    r3.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r12 = tex2D(Texture2D_2, r5.xy);
    r9 = tex2D(Texture2D_1, r0.xy);
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r7.xyz = r7.xyz * r2.www;
    r5.w = ps;
    ps = 1.0 - r5.x;
    r3.w = -r9.w + 1.0;
    r0.w = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r6.z = r9.w * UniformScalar_0.x;
    r1.w = ps;
    r6.xyz = r3.www * UniformVector_1.xyz + r6.zzz;
    ps = log2(r0.w);
    r13.xyz = r1.www * -SpotDirection.xyz;
    r5.x = ps;
    r6.w = r6.w * 2.0 - r6.w;
    ps = 5.0 * r5.w;
    r5.y = dot(r13.zxy, r2.zxy);
    r2.x = saturate(ps);
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.w = dot(r11.zww, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r5.w = (r1.w == 0.0) ? r12.x : r12.y;
    ps = -SpotAngles.x - -r5.y;
    r2.yz = r1.ww + float2(-3.0, -2.0);
    r5.x = ps;
    r5.w = (r2.z == 0.0) ? r12.z : r5.w;
    r2.y = (r2.y == 0.0) ? r12.w : r5.w;
    r5.w = saturate(r4.x * r6.w + r5.z);
    ps = SpotAngles.y * r5.x;
    r11.zw = -r2.xy + 1.0;
    r4.z = saturate(ps);
    r4.xy = -r11.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r5.w);
    r5.xyz = r11.wxy * float3(2.5, 0.875, 0.875);
    r10.w = ps;
    ps = (-0.5) + r5.x;
    r2 = r10 * float4(0.5, 0.5, 0.5, 15.0);
    r6.w = saturate(ps);
    r4.xy = r5.yz * r4.xy + 0.125;
    ps = pow(2.0, r0.w);
    r5.yzw = r2.xyz * r9.www;
    r5.x = ps;
    r6.xyz = r5.yzw * UniformScalar_1.xxx + r6.xyz;
    r5.yzw = r9.xyz * 2e+01 + r5.yzw;
    ps = r4.x * r4.y;
    r7.xyz = r7.xzy * r5.xxx;
    r5.x = ps;
    ps = r4.z * r4.z;
    r2.xyz = r5.yzw - r3.xyz;
    r5.w = ps;
    ps = pow(2.0, r2.w);
    r4.xyz = r6.xyz * r6.www;
    r6.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = r7.w;
    r6.xyz = r4.xyz * r6.xxx;
    r2.xyz = r2.xyz * r6.www + r3.xyz;
    ps = r1.z * ps;
    r0.xyz = r2.xyz * r0.xyz;
    r6.w = saturate(ps);
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
