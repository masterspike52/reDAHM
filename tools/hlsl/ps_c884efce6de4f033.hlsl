// ps_c884efce6de4f033.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003D8 10041100 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_4, r0.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r8.x;
    r5.xz = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = float((UniformScalar_5.x >= 0.0));
    r6.x = ps;
    ps = (-0.5) + r5.y;
    r6.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    r17 = tex2D(Texture2D_2, r0.xy);
    r6.xyw = tex2D(Texture2D_3, r5.xz).xyz;
    ps = r4.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r8.x = saturate(ps);
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r6.z = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = UniformVector_3.x;
    r14.xyz = UniformVector_4.xzy * 2e+01;
    ps = 2e+01 * ps;
    r4.w = float((UniformScalar_8.x >= 1.0));
    r16.x = ps;
    ps = UniformVector_3.z;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r5.w = float((UniformScalar_8.x > 1.0));
    r16.y = ps;
    ps = UniformVector_3.y;
    r5.z = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r5.x = r1.z + 0.1;
    r16.z = ps;
    ps = 5.0 * r5.x;
    r15.xyz = r8.yzw * UniformScalar_9.xxx;
    r12.x = saturate(ps);
    r10.xyz = (-abs(r5.www) >= 0.0) ? r6.xyw : 1.0;
    ps = 1.0 - r5.z;
    r6.xyw = r17.xzy * r17.www;
    r3.w = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r13.xyz = r13.xzy * r13.www;
    r4.x = ps;
    r5.xyw = r12.zyw * 2.0 - 1.0;
    ps = UniformVector_2.x * r5.y;
    r4.xyz = r4.xxx * r1.xyz;
    r12.y = ps;
    ps = UniformVector_2.y * r5.x;
    r13.xyz = r16.xyz * r13.xyz;
    r12.z = ps;
    ps = rsqrt(abs(r5.z));
    r6.xyw = r14.xyz * r6.xyw;
    r5.x = ps;
    r10.xyz = (-abs(r4.www) >= 0.0) ? 1.0 : r10.xyz;
    ps = log2(r3.w);
    r14.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r1.xyz = r15.xyz * r10.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.z * r5.w;
    r5.y = dot(r14.zxy, r2.zxy);
    r12.w = ps;
    r2.xyz = (abs(r0.www) > 0.0) ? r13.xzy : r6.xwy;
    r13.xyz = (-abs(r0.www) >= 0.0) ? r6.yxw : r13.yxz;
    r13.xyz = (-abs(r1.www) >= 0.0) ? r6.yxw : r13.xyz;
    ps = rsqrt(abs(r6.z));
    r5.zw = -r12.xw + 1.0;
    r6.z = ps;
    r6.xyw = (abs(r1.www) > 0.0) ? r2.yzx : r6.wyx;
    r2.xyz = r10.xyz * r8.yzw + r6.wxy;
    ps = ModShadowGroupColor.x * r5.z;
    r10.xyz = r6.zzz * r3.xyz;
    r8.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.z = saturate(dot(r13.zxy, float3(0.59, 0.11, 0.3)));
    r8.z = ps;
    ps = r5.w;
    r0.w = dot(r6.ywx, float3(0.11, 0.3, 0.59));
    ps = r6.z * ps;
    r5.z = r0.w - r6.w;
    r3.z = ps;
    ps = r5.z;
    r3.xy = -r12.yz * r6.zz;
    ps = r6.w + ps;
    r6.xyz = r12.wyz + r3.zxy;
    r8.w = saturate(ps);
    ps = (-1.0) - -r6.x;
    r8 = -r8.wxyz + 1.0;
    r6.w = ps;
    r6.xyz = r6.wyz * r8.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r8.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r8.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.z = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.z));
    r2.xyz = r2.xyz * r11.xyz;
    r5.z = ps;
    r3.xyz = r6.xyz * r5.zzz;
    r5.z = dot(r3.zxy, r10.zxy);
    r6.xyz = r3.xyz * r5.zzz;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = saturate(dot(r4.zxy, r6.zxy));
    r5.z = ps;
    ps = log2(r5.w);
    r6.xyz = r1.xyz * r8.xxx;
    r9.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r1.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    r5.x = ps;
    r1.xy = r1.xy * r8.zw + 0.125;
    ps = pow(2.0, r1.z);
    r5.y = saturate(dot(r3.zyx, r4.zyx));
    r5.w = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.zxy * r5.www;
    r1.z = saturate(ps);
    r6.yz = r2.xy * r5.yy + r6.yz;
    r6.w = r2.z * r5.y + r6.x;
    ps = pow(2.0, r5.z);
    r5.xw = r1.xz * r1.yz;
    r6.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
