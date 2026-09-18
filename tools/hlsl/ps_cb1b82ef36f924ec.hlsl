// ps_cb1b82ef36f924ec.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040B00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.yy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.xy = r5.xy * abs(r8.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_3, r0.xy).yxz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r5.w = float((UniformScalar_1.x > 0.0));
    r6.w = ps;
    ps = -ModShadowColor.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r0.w = dot(r1.zxy, r1.zxy);
    r7.x = ps;
    ps = r1.z;
    r1.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.z;
    r11.xy = r10.xy * 0.875;
    r5.y = saturate(ps);
    r10.xyz = r6.xyz * 2.0 - 1.0;
    ps = 5.0 * r5.x;
    r6.xyz = r7.www * UniformVector_3.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r9.xyz = -r8.xyz + r9.xyz;
    r1.w = ps;
    r9.xyz = r9.xyz * UniformScalar_0.xxx + r8.xyz;
    ps = rsqrt(abs(r0.w));
    r8.xyz = r1.www * r3.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r5.z));
    r3.xyz = r0.www * r1.xyz;
    r5.z = ps;
    r6.xyz = r7.yyy * UniformVector_2.xyz + r6.xyz;
    ps = 1.0 - r5.x;
    r1.xyz = r5.zzz * -SpotDirection.xyz;
    r7.y = ps;
    ps = log2(r5.y);
    r5.x = dot(r10.zxy, r10.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r5.y = dot(r1.zxy, r2.zxy);
    r5.x = ps;
    r6.xyz = r7.zzz * UniformVector_1.xyz + r6.xyz;
    r7.yz = -r7.yy * ModShadowGroupColor.xy + 1.0;
    r7.zw = r11.xy * r7.yz + 0.125;
    r6.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r6.xyz;
    ps = -ModShadowColor.y;
    r1.xyz = r10.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.w = saturate(dot(r1.zxy, r3.zxy));
    r7.y = ps;
    ps = -ModShadowColor.z;
    r5.x = dot(r1.zxy, r8.zxy);
    r6.yzw = (-abs(r6.www) >= 0.0) ? 1.0 : r6.xyz;
    ps = 1.0 + ps;
    r6.x = r7.z * r7.w;
    r7.z = ps;
    r7.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    ps = UniformScalar_5.x * r6.y;
    r1.xyz = r1.xzy * r5.xxx;
    r2.x = ps;
    ps = UniformScalar_5.x * r6.z;
    r10.xyz = r9.xyz * r6.yzw;
    r2.y = ps;
    ps = UniformScalar_5.x * r6.w;
    r0.xyz = r10.xyz * r0.xyz;
    r2.z = ps;
    r6.xyz = r2.xyz * r9.xyz;
    r1.xyz = r1.xyz * 2.0 - r8.xzy;
    ps = -SpotAngles.x - -r5.y;
    r1.z = saturate(dot(r3.zxy, r1.yxz));
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r1.x = r1.z * r1.z;
    r1.y = saturate(ps);
    ps = LightColorAndFalloffExponent.w * r5.z;
    r5.xy = r1.xy * r1.zy;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r6.xyz = r6.xyz * r5.xxx;
    r5.z = ps;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r6.xyz * r5.zzz;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.yyy;
    r5.xyz = r5.xzy * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
