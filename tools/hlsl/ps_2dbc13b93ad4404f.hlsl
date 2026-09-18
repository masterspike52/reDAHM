// ps_2dbc13b93ad4404f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 264 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000420 10040E00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.zw = r0.xy * UniformScalar_0.xx;
    r7.w = ps;
    ps = r14.w;
    r7.xy = r0.xy * UniformScalar_7.xx;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r7.z = ps;
    ps = (-0.5) + r0.w;
    r6.xy = r7.zw * abs(r6.xy);
    r0.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r8.x = tex2D(Texture2D_4, r7.xy).x;
    r8.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = tex2D(Texture2D_0, r1.zw).xyw;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.w = UniformScalar_6.x - UniformScalar_5.x;
    ps = r1.y;
    r1.z = -UniformScalar_5.x + 1.0;
    r1.w = saturate(ps);
    ps = r2.z;
    r7.xy = r1.xy * UniformVector_4.xy;
    ps = 0.1 + ps;
    r1.x = dot(r2.zxy, r2.zxy);
    r1.y = ps;
    r9.z = r10.z * 2.0 - 1.0;
    r9.xy = r6.xy * 2.0 - 1.0;
    r7.zw = r10.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r10.x = saturate(r1.y * 5.0);
    r1.x = ps;
    ps = 1.0 / r0.w;
    r1.y = r1.z - r1.w;
    r0.w = ps;
    ps = r1.y;
    r4.w = dot(r4.zxy, r4.zxy);
    ps = r0.w * ps;
    r2.xyw = r1.xxx * r2.xyz;
    r10.y = saturate(ps);
    ps = r5.w;
    r1.xw = -r10.xy + 1.0;
    ps = 0.0001 * ps;
    r11.yz = r1.xx * ModShadowGroupColor.xy;
    r11.x = saturate(ps);
    r1.xyz = -r11.yxz + 1.0;
    ps = UniformScalar_1.x * r1.y;
    r10.xyz = r10.yyy * r14.xyz;
    r2.z = ps;
    r9.xy = r2.zz * r9.xy + r7.zw;
    r9.xyz = r9.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r4.w));
    r0.w = dot(r9.zxy, r9.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r0.w));
    r4.xyz = r4.www * r4.xyz;
    r0.w = ps;
    r13.xyz = r9.xyz * r0.www;
    r0.w = dot(r13.zxy, r4.zxy);
    r9.xyz = r13.xzy * r0.www;
    r4.xyz = r9.xyz * 2.0 - r4.xzy;
    r0.w = saturate(dot(r2.wxy, r4.yxz));
    ps = log2(r0.w);
    r9.zw = r5.xy * ScreenPositionScaleBias.xy;
    r8.y = ps;
    r4.xyw = r8.zwy * float3(0.875, 0.875, 15.0);
    r8.yz = r4.xy * r1.xz;
    r12.yzw = r8.xyz + float3(0.5, 0.125, 0.125);
    r6.w = r1.w * r12.y;
    ps = 1.0 / r5.w;
    r9.xy = r6.zw + float2(-1.0, -0.5);
    r0.w = ps;
    r5.xy = r9.zw * r0.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r8.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r0.z));
    r0.y = float((UniformScalar_10.x >= 1.0));
    r0.x = ps;
    ps = 1.0 - r0.z;
    r0.w = float((UniformScalar_10.x > 1.0));
    r0.z = saturate(ps);
    r7.xyz = (-abs(r0.www) >= 0.0) ? r7.xyz : 1.0;
    r7.xyz = (-abs(r0.yyy) >= 0.0) ? 1.0 : r7.xyz;
    ps = log2(r0.z);
    r0.xyw = r0.xxx * -SpotDirection.xyz;
    r0.z = ps;
    r0.y = dot(r0.wxy, r3.zxy);
    r3.xyz = r6.xyz * r14.xyz - r10.xyz;
    ps = -SpotAngles.x - -r0.y;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = SpotAngles.y * r0.x;
    r1.w = saturate(dot(r13.zxy, r2.wxy));
    r12.x = saturate(ps);
    r2.xy = r12.xz * r12.xw;
    r0.xyw = r2.yyy * r11.xyz + ModShadowColor.xyz;
    r2.w = saturate(r9.y * 5.0000005);
    r3.xyz = r2.www * r3.xyz + r10.xyz;
    r1.x = r9.x * r1.y + 1.0;
    r1.x = (r2.z > 0.0) ? r1.x : 1.0;
    r3.xyz = r8.xyz * r3.xyz;
    r3.xyz = r3.xyz * r7.xyz;
    r1.x = (r2.z >= 0.0) ? r1.x : 1.0;
    r3.xyz = r3.xyz * r1.xxx;
    ps = LightColorAndFalloffExponent.w * r0.z;
    r2.yzw = r3.xyz * r6.xyz;
    r0.z = ps;
    ps = pow(2.0, r4.w);
    r5.xyz = -r3.xyz + r5.xyz;
    r1.x = ps;
    r3.xyz = r5.xyz * UniformScalar_11.xxx + r3.xyz;
    r3.xyz = r3.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = pow(2.0, r0.z);
    r1.xyz = r3.xyz * r1.xxx;
    r0.z = ps;
    r1.xy = r2.yz * r1.ww + r1.xy;
    r1.z = r2.w * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.zzz;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xyz * r2.xxx;
    r0.xyz = r1.xyz * r0.xyw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
