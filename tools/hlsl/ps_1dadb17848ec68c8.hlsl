// ps_1dadb17848ec68c8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c9); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r2.zw = UniformVector_1.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = max(UniformScalar_8.x, 0.0001);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_3, r2.zw).xyz;
    r2.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.x = tex2D(Texture2D_2, r0.xy).x;
    r0.z = dot(r3.zxy, r3.zxy);
    r0.y = dot(r1.zxy, r1.zxy);
    r8.xyz = r4.xyz * r6.xyz - r4.xyz;
    ps = rsqrt(abs(r0.y));
    r7.xy = r5.xy * 0.875;
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r0.w = saturate(r0.y * r1.z);
    r1.w = ps;
    ps = r1.z;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 - r0.x;
    r2.xyz = r2.xzy * LightColor.xzy;
    r10.w = ps;
    ps = 5.0 * r0.z;
    r10.xyz = r9.xyz * r0.xxx;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r3.xzw = r1.www * r3.yxz;
    r0.z = ps;
    r9.xyz = r8.xyz * UniformScalar_0.xxx + r4.xyz;
    r4.xyz = r9.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = -r3.z;
    r8.xyz = r0.yyy * r1.zxy;
    r0.y = ps;
    r0.x = r3.w * 2.0 - r3.w;
    r3.zw = -r0.zz * ModShadowGroupColor.xy + 1.0;
    ps = -r3.x;
    r1 = r10 * r9.xyzz;
    r0.z = ps;
    r3.xy = r10.ww * r9.xy + r1.xy;
    r7.xy = r7.xy * r3.zw + 0.125;
    r0.x = saturate(dot(r8.yzx, r0.yzx));
    ps = log2(r0.x);
    r3.z = r1.z + r1.w;
    r7.w = ps;
    r1.xy = r7.xz * r7.yw;
    r0.xyz = r1.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.y);
    r3.xyz = r3.xyz * r5.xyz;
    r1.x = ps;
    r1.xyz = r4.xzy * r1.xxx;
    r1.y = r3.z * r0.w + r1.y;
    r1.xz = r3.xy * r0.ww + r1.xz;
    r1.xyz = r2.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
