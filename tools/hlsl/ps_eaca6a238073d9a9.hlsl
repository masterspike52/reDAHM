// ps_eaca6a238073d9a9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040C00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r6.xy = UniformVector_1.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.zz * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    r5.xy = r7.xy * abs(r5.xy);
    r4.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.x = tex2D(Texture2D_2, r0.xy).x;
    r0.y = dot(r1.zxy, r1.zxy);
    r12.xyz = r6.xyz * r7.xyz - r6.xyz;
    ps = rsqrt(abs(r0.y));
    r9.xy = r5.xy * 0.875;
    r4.w = ps;
    r3.w = saturate(r4.w * r1.z);
    ps = r1.z;
    r6.w = max(UniformScalar_8.x, 0.0001);
    ps = 0.1 + ps;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = 1.0 - r0.z;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = saturate(ps);
    ps = 1.0 - r0.x;
    r0.y = dot(r3.zxy, r3.zxy);
    r10.w = ps;
    ps = 5.0 * r0.w;
    r10.xyz = r8.xyz * r0.xxx;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r8.xyz = r4.www * r1.zxy;
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r11.xyz = r0.zzz * -SpotDirection.xyz;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r0.yzw = r0.yyy * r3.zxy;
    r1.x = ps;
    r6.xyz = r12.xyz * UniformScalar_0.xxx + r6.xyz;
    r3.xyz = r6.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r0.x = r0.y * 2.0 - r0.y;
    ps = -r0.z;
    r0.y = dot(r11.zxy, r2.zxy);
    r0.z = ps;
    r1.xy = -r1.xx * ModShadowGroupColor.xy + 1.0;
    ps = -r0.w;
    r2 = r10 * r6.xyzz;
    r0.w = ps;
    r6.xy = r10.ww * r6.xy + r2.xy;
    r1.yz = r9.xy * r1.xy + 0.125;
    ps = -SpotAngles.x - -r0.y;
    r0.z = saturate(dot(r8.yzx, r0.zwx));
    r0.x = ps;
    ps = r2.z + r2.w;
    r1.x = saturate(r0.x * SpotAngles.y);
    r6.z = ps;
    ps = log2(r0.z);
    r0.xw = r1.yx * r1.zx;
    r5.w = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    ps = log2(r1.w);
    r2 = r6 * r5;
    r1.x = ps;
    ps = pow(2.0, r2.w);
    r1.x = r1.x * LightColorAndFalloffExponent.w;
    r1.y = ps;
    ps = pow(2.0, r1.x);
    r1.yzw = r3.xyz * r1.yyy;
    r1.x = ps;
    r1.yz = r2.xy * r3.ww + r1.yz;
    r1.w = r2.z * r3.w + r1.w;
    r1.xyz = r1.yzw * r1.xxx;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
