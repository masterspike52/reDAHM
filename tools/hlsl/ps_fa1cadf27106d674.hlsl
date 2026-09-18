// ps_fa1cadf27106d674.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040B00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    r9.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.z));
    r4.xy = r6.xy * abs(r8.xy);
    r5.w = ps;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.z));
    r7.xyw = r5.www * r1.xyz;
    r5.z = ps;
    ps = UniformVector_2.y * r5.x;
    r6.xyz = r5.zzz * r3.xyz;
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r3.xy = r7.xy * -r6.xy;
    r3.z = ps;
    ps = (-0.5) + r5.x;
    r4.zw = float2((r5.yx >= 0.5));
    r3.w = ps;
    r3.zw = r3.zw - r5.yx;
    r3.zw = r3.zw * r4.zw + r5.yx;
    r5.xyz = r3.zwx + r3.zwy;
    r3.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r11 = tex2D(Texture2D_2, r5.xy);
    r8.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9 = tex2D(Texture2D_1, r0.xy);
    r5.x = dot(r2.zxy, r2.zxy);
    r0.y = -r9.w + 1.0;
    ps = 1.0 - r5.x;
    r0.x = r9.w * UniformScalar_0.x;
    r6.w = saturate(ps);
    r10.xyz = r0.yyy * UniformVector_1.xyz + r0.xxx;
    ps = log2(r6.w);
    r8.xyz = r8.xyz * r2.www;
    r5.x = ps;
    r6.x = r6.z * 2.0 - r6.z;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r5.w = saturate(r5.w * r1.z);
    r0.w = ps;
    ps = r1.z;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r1.x = dot(r4.zww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r1.z = (r1.x == 0.0) ? r11.x : r11.y;
    ps = 5.0 * r5.x;
    r1.xy = r1.xx + float2(-2.0, -3.0);
    r5.x = saturate(ps);
    r1.x = (r1.x == 0.0) ? r11.z : r1.z;
    r5.y = (r1.y == 0.0) ? r11.w : r1.x;
    r7.w = saturate(r7.w * r6.x + r5.z);
    r4.zw = -r5.xy + 1.0;
    r1.xy = -r4.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r7.w);
    r5.xyz = r4.wxy * float3(2.5, 0.875, 0.875);
    r7.w = ps;
    r7 = r7 * float4(0.5, 0.5, 0.5, 15.0);
    r4.xy = r5.yz * r1.xy + 0.125;
    r1.xyz = r7.xyz * r9.www;
    r2.xyz = r1.xyz * UniformScalar_1.xxx + r10.xyz;
    r1.xyz = r9.xyz * 2e+01 + r1.xyz;
    ps = r4.x * r4.y;
    r7.xyz = r8.xzy * r0.www;
    r0.w = ps;
    r6.xyz = r0.www * r6.yzw + ModShadowColor.xyz;
    ps = (-0.5) + r5.x;
    r1.xyz = r1.xyz - r3.xyz;
    r6.w = saturate(ps);
    ps = pow(2.0, r7.w);
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r1.xyz = r1.xyz * r6.www + r3.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r7.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
