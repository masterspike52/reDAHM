// ps_d168394f6020e2f8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_19 : register(c10); // float
float4 UniformScalar_20 : register(c11); // float
float4 UniformScalar_21 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_7 : register(c6); // float4
float4 UniformVector_8 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r1.xy).xywz;
    ps = (-0.5) + r11.z;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r7.x = tex2D(ShadowTexture, r0.xy).x;
    r6.xy = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xy = r1.wz * UniformVector_8.xy;
    r6.z = ps;
    ps = 1.0 / r5.w;
    r7.yz = r5.xy * ScreenPositionScaleBias.xy;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyw = r7.yzx * r7.wwx;
    r6.w = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r7.xy = r0.xy + ScreenPositionScaleBias.wz;
    r0.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r6.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r1.xyz = tex2D(Texture2D_4, r3.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    r11.z = saturate(r5.w * 0.0001);
    ps = 0.1 - -r2.z;
    r1.w = UniformVector_2.z * (-1.0);
    r6.x = ps;
    r6.y = dot(r2.zxy, r2.zxy);
    r7.w = float((UniformScalar_19.x > 1.0));
    r5.xyz = (-abs(r7.www) >= 0.0) ? r1.xyz : 1.0;
    ps = rsqrt(abs(r6.y));
    r10.xy = r6.zw * 0.875;
    r6.y = ps;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    r3.xyz = r6.yyy * r2.xyz;
    ps = 5.0 * r6.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = saturate(ps);
    ps = r12.x + r12.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r10.z = ps;
    ps = r12.y + r12.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r10.w = ps;
    ps = UniformVector_2.z * r7.x;
    r2.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r6.y = ps;
    ps = r1.w;
    r7.w = float((UniformScalar_19.x >= 1.0));
    ps = r7.x * ps;
    r8.xyz = r2.xyz * r11.xyw;
    r6.x = ps;
    r2.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r5.xyz;
    ps = rsqrt(abs(r6.w));
    r6.z = -r6.z + 1.0;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xyz = r6.www * r4.zxy;
    r11.x = ps;
    r12.w = (r5.x >= 0.0) ? r6.y : r6.x;
    ps = ModShadowGroupColor.y * r6.z;
    r4.xy = r12.zw - 1.0;
    r11.y = ps;
    ps = r8.x;
    r6.yzw = -r11.zxy + 1.0;
    r4.zw = r4.yx * r6.yy + 1.0;
    ps = r2.x * ps;
    r10.xy = r10.xy * r6.zw;
    r2.x = ps;
    ps = UniformScalar_1.x * r6.y;
    r10 = r10 + float4(0.125, 0.125, -1.0, -1.0);
    r6.x = ps;
    r4.xy = r6.xx * r10.zw + r7.yz;
    ps = r8.y;
    r7.x = r10.x * r10.y;
    r7.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    ps = r2.y * ps;
    r4.xy = r4.xy * UniformVector_2.xy;
    r2.y = ps;
    ps = r8.z;
    r4.xy = r4.xy * r6.yy;
    r4 = (r6.xyyy > 0.0) ? r4.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r6.xyyy >= 0.0) ? r4 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r2.z * ps;
    r7.w = dot(r6.wyz, r6.wyz);
    r2.z = ps;
    r4.xyz = r2.xyz * r6.xxx;
    r2.xyz = r4.xyz * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r0.www * r0.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.yzw = r6.xyz * TwoSidedSign.xxx;
    r6.x = dot(r6.wyz, r5.xyz);
    r8.xyz = r6.ywz * r6.xxx;
    r5.xyz = r8.xyz * 2.0 - r5.yxz;
    r6.x = saturate(dot(r3.zxy, r5.yxz));
    ps = log2(r6.x);
    r1.xyz = r4.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wyz, r3.zxy));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
