// ps_424be5b63922380c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r0.xy);
    ps = (-0.5) + r11.w;
    r6.x = UniformVector_2.z * (-1.0);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r0.wz * UniformVector_8.xy;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r8.y = ps;
    r0.xyz = r9.zxy * 2.0 - 1.0;
    ps = 1.0 / r4.w;
    r8.xy = r8.xy * abs(r7.xy);
    r0.w = ps;
    r6.xyw = r6.yzx * r0.wwx;
    ps = 0.0001 * r4.w;
    r7.xy = r6.xy + ScreenPositionScaleBias.wz;
    r6.z = saturate(ps);
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r14.xyz = tex2D(Texture2D_4, r5.zw).xyz;
    r12.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_7.x * UniformVector_7.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r13.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r3.w = float((UniformScalar_19.x >= 1.0));
    r13.y = ps;
    ps = UniformVector_7.z * UniformVector_7.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r13.z = ps;
    ps = r1.z;
    r1.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    r8.xy = r12.xy * 2.0 - 1.0;
    ps = 1.0 - r5.y;
    r4.w = float((UniformScalar_19.x > 1.0));
    r5.x = saturate(ps);
    r15.xyz = (-abs(r4.www) >= 0.0) ? r14.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r5.z = saturate(r5.z * 5.0);
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r14.xyz = r13.xyz * r11.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.y));
    r11.xyz = r1.www * r3.zxy;
    r5.y = ps;
    ps = UniformVector_2.z * r0.x;
    r13.xyz = r5.yyy * -SpotDirection.xyz;
    r1.w = ps;
    r3.xyz = (-abs(r3.www) >= 0.0) ? 1.0 : r15.xyz;
    ps = log2(r5.x);
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.yzw = r14.xyz * r3.xyz;
    r6.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = dot(r13.zxy, r2.zxy);
    r6.y = ps;
    r12.w = (r11.x >= 0.0) ? r1.w : r6.w;
    r6.yzw = -r6.zxy + 1.0;
    ps = UniformScalar_1.x * r6.y;
    r2.xy = r12.zw - 1.0;
    r6.x = ps;
    r2.zw = r2.yx * r6.yy + 1.0;
    r0.xy = r6.xx * r8.xy + r0.yz;
    r0.xy = r0.xy * UniformVector_2.xy;
    ps = r5.w;
    r2.xy = r0.xy * r6.yy;
    r0 = (r6.xyyy > 0.0) ? r2.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r8 = (r6.xyyy >= 0.0) ? r0 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r1.x * ps;
    r5.z = dot(r8.wyz, r8.wyz);
    r3.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.xyw = r3.yzw * r8.xxx;
    r5.y = ps;
    r2.xyz = r0.xyw * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r5.z));
    r0.z = saturate(r5.y * SpotAngles.y);
    r5.y = ps;
    ps = r5.w;
    r3.yzw = r8.yzw * r5.yyy;
    ps = r1.y * ps;
    r8.xyz = r3.yzw * TwoSidedSign.xxx;
    r3.y = ps;
    ps = r5.w;
    r5.y = dot(r8.zxy, r11.xyz);
    ps = r1.z * ps;
    r5.yzw = r8.xzy * r5.yyy;
    r3.z = ps;
    r5.yzw = r5.yzw * 2.0 - r11.yxz;
    r5.y = saturate(dot(r3.zxy, r5.zyw));
    ps = log2(r5.y);
    r1.xyz = r0.xyw * r10.xyz;
    r9.z = ps;
    r5.yzw = r9.zxy * float3(15.0, 0.875, 0.875);
    r0.xy = r5.zw * r6.zw + 0.125;
    ps = pow(2.0, r5.y);
    r5.z = saturate(dot(r8.zxy, r3.zxy));
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xyz = r2.zxy * r5.yyy;
    r5.y = ps;
    r6.yz = r1.xy * r5.zz + r6.yz;
    r6.w = r1.z * r5.z + r6.x;
    ps = pow(2.0, r5.y);
    r5.xw = r0.xz * r0.yz;
    r6.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
