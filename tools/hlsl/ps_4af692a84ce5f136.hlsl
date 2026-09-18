// ps_4af692a84ce5f136.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040900 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r2.xy).zxy;
    r2.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0 = tex2D(Texture2D_1, r0.xy).xywz;
    r7.x = max(UniformScalar_0.x, 0.0001);
    ps = r1.z;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.z = r0.z * UniformVector_1.z;
    r2.w = ps;
    ps = 0.875 * r2.x;
    r5.xyw = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = 0.875 * r2.y;
    r5.xyw = r5.xyw * r0.xyw;
    r7.z = ps;
    r2.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r0.x = saturate(r2.w * 5.0);
    r1.w = ps;
    ps = 1.0 - r0.x;
    r8.xyz = r1.www * r1.xyz;
    r2.w = ps;
    ps = rsqrt(abs(r3.w));
    r1.w = dot(r2.zxy, r2.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.w));
    r1.xyz = r1.xxx * r3.xyz;
    r1.w = ps;
    r3.xy = -r2.ww * ModShadowGroupColor.xy + 1.0;
    r7.yz = r7.yz * r3.xy + 0.125;
    ps = LightColor.x * r4.y;
    r3.xyz = r2.xyz * r1.www;
    r2.x = ps;
    ps = LightColor.y * r4.z;
    r1.w = dot(r3.zxy, r1.zxy);
    r2.y = ps;
    ps = r0.z;
    r9.xyz = r3.xzy * r1.www;
    r0.y = ps;
    r1.xyz = r9.xyz * 2.0 - r1.xzy;
    ps = UniformVector_1.x * r0.y;
    r1.y = saturate(dot(r8.zxy, r1.yxz));
    r1.x = ps;
    ps = log2(r1.y);
    r3.x = saturate(dot(r3.zxy, r8.zxy));
    r7.w = ps;
    ps = UniformVector_1.y * r0.z;
    r1.zw = r7.yx * r7.zw;
    r1.y = ps;
    r0.xyz = r1.zzz * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r1.z = r5.w * r3.x;
    r3.y = ps;
    ps = LightColor.z * r4.x;
    r1.xy = r1.xy * r3.yy;
    r2.z = ps;
    r1.xyz = r5.xyz * r3.xxy + r1.xyz;
    r1.xyz = r2.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
