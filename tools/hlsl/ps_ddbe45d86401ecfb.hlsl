// ps_ddbe45d86401ecfb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040900 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
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
sampler2D ModShadowAccumTexture : register(s2);

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
    r1.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r2 = tex2D(Texture2D_0, r0.xy).wxyz;
    r7.x = max(UniformScalar_0.x, 0.0001);
    ps = r1.z;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r0.z = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = r2.x;
    r9.xy = r7.yz * 0.875;
    r0.w = ps;
    ps = r2.x;
    r4.xyz = r4.xyz * LightColor.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r5.xyw = r5.xyz * r2.yzw;
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r8.xyz = r0.zzz * r1.zxy;
    r1.w = ps;
    ps = 5.0 * r0.x;
    r3.xyz = r1.www * r3.zxy;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r3.yz = -r3.yz;
    r0.x = ps;
    r3.x = r3.x * 2.0 - r3.x;
    r7.yz = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r7.yz = r9.xy * r7.yz + 0.125;
    ps = UniformVector_1.x * r0.y;
    r0.x = saturate(dot(r8.yzx, r3.yzx));
    r3.z = ps;
    ps = log2(r0.x);
    r3.x = saturate(r0.z * r1.z);
    r7.w = ps;
    ps = UniformVector_1.y * r2.x;
    r1.xz = r7.xy * r7.wz;
    r3.w = ps;
    r0.xyz = r1.zzz * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r1.z = r5.w * r3.x;
    r3.y = ps;
    ps = UniformVector_1.z * r0.w;
    r1.xy = r3.zw * r3.yy;
    r5.z = ps;
    r1.xyz = r5.xyz * r3.xxy + r1.xyz;
    r1.xyz = r4.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
