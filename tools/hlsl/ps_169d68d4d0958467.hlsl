// ps_169d68d4d0958467.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040B00 0000090A 00000000 00008929 003F01FF 00000001 0000F050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.y = r0.w * UniformVector_2.x;
    r7.w = 1.0 / ModShadowAccumResolution.y;
    r6.w = -r0.z + 1.0;
    r6.z = 1.0 / r5.w;
    r7.y = dot(r2.zxy, r2.zxy);
    r7.x = ScreenPositionScaleBias.x * r6.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.z = 1.0 / ModShadowAccumResolution.x;
    r3.xy = r7.zw * abs(r9.xy);
    r1.w = rsqrt(abs(r7.y));
    r7.z = dot(r4.zxy, r4.zxy);
    r7.y = ScreenPositionScaleBias.y * r6.z;
    r1.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.z));
    r7.xyw = r1.www * r2.zyx;
    r6.z = ps;
    ps = UniformVector_2.y * r6.w;
    r8.xyw = r6.zzz * r4.xyz;
    r6.z = ps;
    ps = (-0.5) + r6.y;
    r4.xy = r7.wy * -r8.xy;
    r3.z = ps;
    ps = (-0.5) + r6.z;
    r10.zw = float2((r6.yz >= 0.5));
    r3.w = ps;
    r3.zw = r3.zw - r6.yz;
    r4.zw = r3.zw * r10.zw + r6.yz;
    r6.yzw = r4.zwx + r4.zwy;
    r8.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r4.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r11 = tex2D(Texture2D_2, r6.yz);
    r9 = tex2D(Texture2D_1, r0.xy);
    ps = 1.0 - r6.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = saturate(ps);
    ps = r9.w;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r0.w = r9.w * UniformScalar_0.x;
    r6.x = ps;
    r3.xyz = r6.xxx * UniformVector_1.xyz + r0.www;
    ps = log2(r7.z);
    r7.w = saturate(r1.w * r2.z);
    r6.x = ps;
    r5.x = r8.w * 2.0 - r8.w;
    ps = 0.1 - -r2.z;
    r7.z = dot(r10.zww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r8.w = (r7.z == 0.0) ? r11.x : r11.y;
    ps = 5.0 * r6.y;
    r7.yz = r7.zz + float2(-3.0, -2.0);
    r6.y = saturate(ps);
    r7.z = (r7.z == 0.0) ? r11.z : r8.w;
    r6.z = (r7.y == 0.0) ? r11.w : r7.z;
    r7.z = saturate(r7.x * r5.x + r6.w);
    r10.zw = -r6.yz + 1.0;
    r7.xy = -r10.zz * ModShadowGroupColor.xy + 1.0;
    ps = log2(r7.z);
    r6.yzw = r10.wxy * float3(2.5, 0.875, 0.875);
    r4.w = ps;
    r7.xy = r6.zw * r7.xy + 0.125;
    ps = r7.x * r7.y;
    r2 = r4 * float4(0.5, 0.5, 0.5, 15.0);
    r7.x = ps;
    r4.xyz = r2.xyz * r9.www;
    r3.xyz = r4.xyz * UniformScalar_1.xxx + r3.xyz;
    r4.xyz = r9.xyz * 2e+01 + r4.xyz;
    r7.xyz = r7.xxx * r5.yzw + ModShadowColor.xyz;
    ps = (-0.5) + r6.y;
    r2.xyz = r4.xyz - r1.xyz;
    r8.w = saturate(ps);
    ps = pow(2.0, r2.w);
    r3.xyz = r3.xyz * r8.www;
    r6.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.yzw = r3.xyz * r6.yyy;
    r6.x = ps;
    r1.xyz = r2.xyz * r8.www + r1.xyz;
    ps = pow(2.0, r6.x);
    r0.xyz = r1.xyz * r0.xyz;
    r6.x = ps;
    r6.yz = r0.xy * r7.ww + r6.yz;
    r6.w = r0.z * r7.w + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r8.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
