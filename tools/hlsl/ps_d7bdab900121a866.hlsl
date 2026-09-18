// ps_d7bdab900121a866.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 333 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000534 10041100 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_9 : register(c11); // float
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
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r7 = In.color1;
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

    r10 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.y + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r2.z + 0.1;
    r7.z = ps;
    ps = r5.w;
    r12.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r7.x));
    r6.w = r10.w - 0.5;
    r7.x = ps;
    ps = 0.00022222222 * r6.x;
    r11.xyz = r7.xxx * r4.xyz;
    r6.x = saturate(ps);
    ps = 5.0 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.x;
    r4.x = r1.x * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r11.xy * r6.ww;
    r4.y = ps;
    r6.zw = r4.xy - 0.5;
    r9.xy = float2((r4.xy >= 0.5));
    ps = r7.y;
    r6.zw = r6.zw - r4.xy;
    ps = abs(r8.x) * ps;
    r12.zw = r6.zw * r9.xy;
    r7.x = ps;
    ps = r7.z;
    r13 = r4.zwxy + r12;
    ps = abs(r8.y) * ps;
    r6.zw = r13.zw + r13.zw;
    r7.y = ps;
    r8.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7 = tex2D(Texture2D_1, r6.zw);
    ps = 0.0001 * r5.w;
    r0.zw = r1.xy * 6.0;
    r6.z = saturate(ps);
    r12.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r4.xyz = tex2D(Texture2D_2, r1.xy).xwy;
    r14.w = r12.z * r4.y - 1.0;
    r0.zw = r12.xy * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r1.yz = r1.xy * UniformVector_7.xy;
    r4.y = ps;
    ps = r4.z + r4.z;
    r4.x = dot(r9.xyy, float3(1.0, 1.0, 1.0));
    r4.z = ps;
    r6.w = (r4.x == 0.0) ? r7.x : r7.y;
    ps = r0.x;
    r4 = r4.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r14.xy = r0.zw * 0.5 + r4.zw;
    r6.w = (r4.y == 0.0) ? r7.z : r6.w;
    r6.w = (r4.x == 0.0) ? r7.w : r6.w;
    ps = UniformScalar_0.x * ps;
    r7.x = max(r6.w, 0.0);
    r0.z = ps;
    ps = r7.x;
    r4.yz = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    ps = 0.3;
    r7.xzw = -r6.wyz + 1.0;
    r1.w = ps;
    ps = min(r1.x, r1.w);
    r6.xy = r7.zz * ModShadowGroupColor.xy;
    r8.x = ps;
    ps = 1.0 - r6.y;
    r12.xzw = r8.yzx * float3(0.875, 0.875, 3.3333333);
    r14.z = ps;
    r1.xw = r12.zw * r14.zw + float2(0.125, 1.0);
    ps = 1.0 / r5.w;
    r4.x = abs(r1.w) * abs(r1.w);
    r4.w = ps;
    ps = r0.y;
    r6.yzw = r4.yzx * r4.wwx;
    ps = UniformScalar_0.x * ps;
    r4.xy = r6.yz + ScreenPositionScaleBias.wz;
    r0.w = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r8.y = tex2D(Texture2D_5, r0.xy).x;
    r9.xyz = tex2D(Texture2D_7, r1.yz).xyz;
    r8.xzw = tex2D(Texture2D_0, r13.xy).xyz;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    r17.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = dot(r3.zxy, r3.zxy);
    r7.y = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r7.y));
    r16.zw = r0.yz + r0.yz;
    r0.w = ps;
    ps = 1.0 - r6.y;
    r10.xyz = r17.xyz * r10.xyz;
    r7.y = saturate(ps);
    r17.xyz = r13.xyz * 2.0 - 1.0;
    r13.xyz = r8.xzw * 2.0 - 1.0;
    r12.z = r17.z * UniformVector_4.z - r13.z;
    ps = log2(r7.y);
    r2.xyz = r0.www * r2.xyz;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 2.5 * r7.x;
    r16.y = r12.x * r6.x;
    r16.x = ps;
    ps = UniformScalar_1.x * r7.w;
    r16.yzw = r16.yzw + float3(0.125, -1.0, -1.0);
    r6.x = ps;
    r1.yz = r6.xx * r16.zw + r17.xy;
    r12.xy = r1.yz * UniformVector_4.xy - r13.xy;
    r6.xy = r16.xy * r1.wx;
    r1.xyz = r6.yyy * r15.xyz + ModShadowColor.xyz;
    r12.xy = r12.ww * r14.xy + r12.xy;
    ps = (-1.0) + r0.x;
    r7.y = saturate(r6.x - 0.5);
    r12.w = ps;
    r0.xy = r12.xy * r7.yy + r13.xy;
    r8.xz = r12.wz * r7.wy + float2(1.0, -2.0);
    r0.z = r8.w * 2.0 + r8.z;
    r0.xyz = r0.zxy * r7.www;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r7.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r7.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r6.y));
    r6.x = r6.w * r6.w;
    r6.y = ps;
    r0.xyz = r0.xyz * r6.yyy;
    r6.y = dot(r0.zxy, r11.zxy);
    r12.xyz = r0.xyz * r6.yyy;
    r11.xyz = r12.xyz * 2.0 - r11.xyz;
    r6.y = saturate(dot(r2.zxy, r11.zxy));
    ps = log2(r6.y);
    r0.x = saturate(dot(r0.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r6.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r10.w = r6.y * r8.x;
    r2 = r10 * r9.xyzx;
    r2 = r2 * r8.xxxy;
    r0.yzw = r2.xyz * r1.www - r5.xyz;
    r8.xyz = r2.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r2.xyz = r8.xyz + r2.www;
    r0.yzw = r0.yzw * r7.yyy + r5.xyz;
    r0.yzw = r0.yzw * r3.xyz;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r2.xyz = r6.xxx * r2.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.w);
    r7.xyz = r2.xyz * r7.yyy;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r7.xyz * r6.yyy;
    r6.x = ps;
    r6.yz = r0.yz * r0.xx + r6.yz;
    r6.w = r0.w * r0.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r1.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
