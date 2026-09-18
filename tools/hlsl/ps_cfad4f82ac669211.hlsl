// ps_cfad4f82ac669211.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c8); // float2
float4 SpotDirection : register(c7); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.y = 1.0 / r4.w;
    r5.zw = r5.yy * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r9.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6 = tex2D(Texture2D_1, r0.xy).wxyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = UniformScalar_0.x;
    r3.w = dot(r1.zxy, r1.zxy);
    r0.y = 0.0001;
    r5.w = r1.z + 0.1;
    r9.x = max(r0.x, r0.y);
    ps = 5.0 * r5.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r1.w = saturate(ps);
    ps = 1.0 - r5.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = saturate(ps);
    ps = r6.x;
    r4.w = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r0.xyz = r9.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r4.w));
    r7.xyw = r7.xyz * r6.yzw;
    r4.w = ps;
    ps = rsqrt(abs(r3.w));
    r10.xyz = r4.www * r3.xyz;
    r3.x = ps;
    ps = rsqrt(abs(r5.z));
    r3.xyz = r3.xxx * r1.xyz;
    r5.z = ps;
    ps = UniformVector_1.z * r5.w;
    r11.xyz = r5.zzz * -SpotDirection.xyz;
    r7.z = ps;
    ps = 0.875 * r5.x;
    r5.w = dot(r0.zxy, r0.zxy);
    r9.y = ps;
    ps = log2(r0.w);
    r5.z = -r1.w + 1.0;
    r5.x = ps;
    r1.yz = -r5.zz * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r11.zxy, r2.zxy);
    r5.w = ps;
    ps = 0.875 * r5.y;
    r2.xyz = r0.xyz * r5.www;
    r9.z = ps;
    ps = r6.x;
    r0.x = saturate(dot(r2.zxy, r3.zxy));
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r5.w = dot(r2.zxy, r10.zxy);
    r0.z = ps;
    ps = UniformVector_1.y * r6.x;
    r2.xyz = r2.xzy * r5.www;
    r0.w = ps;
    r6.xyz = r2.xyz * 2.0 - r10.xzy;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = saturate(dot(r3.zxy, r6.yxz));
    r5.y = ps;
    ps = log2(r5.w);
    r6.w = r7.w * r0.x;
    r1.x = ps;
    ps = -SpotAngles.x - -r5.z;
    r6.xyz = r9.xyz * r1.xyz;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r1.xy = r6.yz + 0.125;
    r0.y = ps;
    ps = SpotAngles.y * r5.x;
    r6.yz = r0.zw * r0.yy;
    r1.z = saturate(ps);
    ps = pow(2.0, r5.y);
    r5.xw = r1.xz * r1.yz;
    r6.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.yzw = r7.xyz * r0.xxy + r6.yzw;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
