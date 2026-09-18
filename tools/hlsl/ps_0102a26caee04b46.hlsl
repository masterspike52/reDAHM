// ps_0102a26caee04b46.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10040E00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = -r0.z + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r5.y * UniformVector_2.y;
    r6.y = ps;
    ps = r14.w;
    r6.zw = r0.wz * 6.0;
    r5.z = ps;
    ps = (-0.5) + r5.z;
    r6.xy = r6.xy * abs(r8.xy);
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    r7.w = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r7.x = ps;
    ps = (-0.5) + r5.y;
    r5.zw = float2((r5.xy >= 0.5));
    r7.y = ps;
    r7.xy = r7.xy - r5.xy;
    r5.xy = r7.xy * r5.zw + r5.xy;
    r5.xy = r5.xy + r5.xy;
    r13 = tex2D(Texture2D_1, r5.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = tex2D(Texture2D_2, r6.zw).xyw;
    r7.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = r1.z;
    r8.xy = r0.wz * UniformVector_7.xy;
    ps = 0.1 + ps;
    r10.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = r4.w;
    r8.zw = r0.wz * UniformVector_1.xy;
    r11.z = r9.z * r7.z - 1.0;
    ps = (-4e+02) + ps;
    r12.zw = r9.xy + r9.xy;
    r5.y = ps;
    ps = 0.875 * r6.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r6.z));
    r7.yz = r7.xy + r7.xy;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r6.xxx * r3.xyz;
    r6.w = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r7.x = dot(r5.zww, float3(1.0, 1.0, 1.0));
    r6.x = saturate(ps);
    r5.x = (r7.x == 0.0) ? r13.x : r13.y;
    ps = 1.0 - r6.w;
    r3 = r7.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.z = ps;
    r5.x = (r3.y == 0.0) ? r13.z : r5.x;
    r7.z = (r3.x == 0.0) ? r13.w : r5.x;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = max(r7.z, 0.0);
    r7.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.z = min(r5.x, 0.3);
    r7.y = ps;
    ps = 0.875 * r6.y;
    r7 = -r7 + 1.0;
    r10.w = ps;
    ps = r7.z;
    r12.xy = r10.xw * r7.xy;
    r5.x = ps;
    ps = 2.5 * r5.x;
    r5.yw = r6.xz * float2(-0.025, 3.3333333);
    r9.w = ps;
    r6.xy = r9.xy * r5.yy + r8.zw;
    r13 = r12 + float4(0.125, 0.125, -1.0, -1.0);
    r11.xy = r13.zw * 0.5 + r3.zw;
    r3.w = r5.w * r11.z + 1.0;
    ps = 1.0 / r4.w;
    r10.x = abs(r3.w) * abs(r3.w);
    r10.w = ps;
    r5.xyz = r10.yzx * r10.wwx;
    r6.zw = r5.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r1.w = tex2D(Texture2D_4, r0.xy).x;
    r4.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r8.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r4.w = dot(r1.zxy, r1.zxy);
    r0.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.xyz = r6.xyw * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r0.xyz = r0.xyz * r14.xyz;
    r0.w = saturate(ps);
    r2.xyz = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.w));
    r10.xyz = r2.xyz * UniformVector_4.xyz;
    r2.x = ps;
    ps = log2(r0.w);
    r2.xyz = r2.xxx * r1.xyz;
    r5.x = ps;
    ps = -r6.z;
    r0.w = r13.x * r13.y;
    r7.xyz = r0.www * r12.xyz + ModShadowColor.xyz;
    r1.xy = r5.ww * r11.xy + r10.xy;
    r5.w = saturate(r9.w * r3.w - 0.5);
    ps = r10.z + ps;
    r1.xy = r1.xy - r6.xy;
    r1.z = ps;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w - 2.0;
    r6.z = r6.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.www;
    ps = 1.0 + r6.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r7.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r7.w = r5.z * r5.z;
    r5.y = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r6.zxy, r9.zxy);
    r10.xyz = r6.xyz * r5.yyy;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    r5.y = saturate(dot(r2.zxy, r9.zxy));
    ps = log2(r5.y);
    r6.x = saturate(dot(r6.zyx, r2.zyx));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r5.z = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r5.y;
    r0.w = ps;
    r0 = r0 * r8.xyzx;
    r6.yzw = r0.xyz * r3.www - r4.xyz;
    r0.xyz = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r0.xyz = r0.www * r1.www + r0.xyz;
    r6.yzw = r6.yzw * r5.www + r4.xyz;
    r6.yzw = r6.yzw * r1.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r7.www * r0.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r0.xyz = r0.xyz * r5.www;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
