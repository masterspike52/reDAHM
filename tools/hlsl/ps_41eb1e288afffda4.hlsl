// ps_41eb1e288afffda4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041100 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
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

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = -r1.y + 1.0;
    r1.z = ps;
    r7.zw = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r2.z + 0.1;
    r1.w = ps;
    ps = r5.w;
    r10.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r0.z));
    r6.w = r14.w - 0.5;
    r0.z = ps;
    ps = 0.00022222222 * r6.y;
    r9.xyz = r0.zzz * r4.xyz;
    r6.y = saturate(ps);
    ps = 5.0 * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.z = saturate(ps);
    ps = (-0.025) * r6.y;
    r4.x = r1.x * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.x;
    r4.zw = r9.xy * r6.ww;
    r4.y = ps;
    r6.xw = r4.xy - 0.5;
    r13.xy = float2((r4.xy >= 0.5));
    ps = r1.z;
    r6.xw = r6.xw - r4.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.xw * r13.xy;
    r0.z = ps;
    ps = r1.w;
    r15 = r4.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.xw = r15.zw + r15.zw;
    r0.w = ps;
    r16.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r17 = tex2D(Texture2D_1, r6.xw);
    r8.xyz = tex2D(Texture2D_3, r7.zw).xyw;
    ps = 0.0001 * r5.w;
    r7.xy = r1.xy * 6.0;
    r6.x = saturate(ps);
    r11.xzw = tex2D(Texture2D_2, r7.xy).wxy;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r12.xyz = r4.xyw * 2.0 - 1.0;
    r7.xyw = r7.xyz * 2.0 - 1.0;
    ps = r11.z + r11.z;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    ps = r11.w + r11.w;
    r1.zw = r8.xy + r8.xy;
    r1.y = ps;
    r1 = r1 - 1.0;
    r11.zw = -r6.xz + 1.0;
    ps = r10.x + r10.x;
    r6.x = r11.z * UniformScalar_1.x;
    r6.y = ps;
    r6.xz = r6.xx * r1.zw + r7.xy;
    r0.zw = r6.xz * UniformVector_4.xy - r12.xy;
    ps = r10.y + r10.y;
    r6.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r7.z = (r6.x == 0.0) ? r17.x : r17.y;
    r6 = r6.xxyz + float4(-2.0, -3.0, -1.0, -1.0);
    r1.xy = r1.xy * 0.5 + r6.zw;
    r6.x = (r6.x == 0.0) ? r17.z : r7.z;
    r7.x = (r6.y == 0.0) ? r17.w : r6.x;
    r6.x = max(r7.x, 0.0);
    r16.x = min(r6.x, 0.3);
    ps = 1.0 / r5.w;
    r6.yzw = r16.xyz * float3(3.3333333, 0.875, 0.875);
    r6.x = ps;
    r13.xy = r6.yy * r1.xy + r0.zw;
    r0.zw = r13.zw * r6.xx + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.w = tex2D(Texture2D_5, r0.xy).x;
    r10.xyz = tex2D(Texture2D_7, r15.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r7.z = dot(r2.zxy, r2.zxy);
    r1.z = ps;
    r7.y = r11.x * r10.w - 1.0;
    ps = rsqrt(abs(r7.z));
    r11.x = r8.z - 1.0;
    r7.z = ps;
    ps = 1.0 - r6.x;
    r5.xyz = r1.xyz * r14.xyz;
    r6.x = saturate(ps);
    r5.w = r7.w * UniformVector_4.z - r12.z;
    ps = log2(r6.x);
    r3.xyz = r7.zzz * r2.xyz;
    r6.x = ps;
    r7.zw = r11.ww * ModShadowGroupColor.xy;
    r7.xzw = -r7.xwz + 1.0;
    r6.yzw = r6.yzw * r7.ywz + float3(1.0, 0.125, 0.125);
    ps = abs(r6.y) * abs(r6.y);
    r1.x = r6.z * r6.w;
    r11.y = ps;
    r1.xyz = r1.xxx * r0.xyz + ModShadowColor.xyz;
    r0.xz = r11.xy * r11.zy;
    ps = 1.0 + r0.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = ps;
    ps = 2.5 * r7.x;
    r14.xyz = r5.xyz * r0.yyy;
    r14.w = ps;
    r2.xyz = r14.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r5.xyz = r14.xyz * r6.yyy - r10.xyz;
    r6.w = saturate(r14.w * r6.y - 0.5);
    r7.xy = r13.xy * r6.ww + r12.xy;
    r10.xyz = r5.xyz * r6.www + r10.xyz;
    r6.y = r5.w * r6.w - 2.0;
    r7.z = r4.w * 2.0 + r6.y;
    r7.xyz = r7.zxy * r11.zzz;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r11.zzz > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r5.xyz = (r11.zzz >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.y));
    r7.yzw = r10.xyz * r8.xyz;
    r6.y = ps;
    r5.xyz = r5.xyz * r6.yyy;
    r6.y = dot(r5.zxy, r9.zxy);
    r8.xyz = r5.xyz * r6.yyy;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    r6.y = saturate(dot(r3.zxy, r8.zxy));
    ps = log2(r6.y);
    r7.x = saturate(dot(r5.zyx, r3.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r1.w = ps;
    ps = pow(2.0, r1.w);
    r6.z = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r0.y = r6.y * r0.y;
    r0.xw = r0.yz * r0.wz;
    r0.xyz = r2.xyz + r0.xxx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xyz = r0.www * r0.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.z);
    r0.xyz = r0.xyz * r6.www;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r0.xyz * r6.yyy;
    r6.x = ps;
    r6.yz = r7.yz * r7.xx + r6.yz;
    r6.w = r7.w * r7.x + r6.w;
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
