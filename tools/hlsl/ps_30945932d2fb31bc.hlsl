// ps_30945932d2fb31bc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 369 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005C4 10041500 0000080A 00000000 00006908 003F00FF 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.xy * 6.0;
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r12.z = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = -r1.y + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = r5.w - 4e+02;
    r6.y = ps;
    r12.yw = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r11.xy = r7.xz * abs(r8.xy);
    r6.z = ps;
    ps = r2.z;
    r0.zw = r0.xy * UniformScalar_0.xx;
    ps = 0.1 + ps;
    r1.zw = r1.xy * UniformVector_7.xy;
    r6.w = ps;
    ps = 5.0 * r6.w;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r4.w = saturate(ps);
    ps = 0.00022222222 * r6.x;
    r7.xz = r1.xy * UniformVector_1.xy;
    r12.x = saturate(ps);
    ps = 1.0 / r5.w;
    r8.xyz = r6.zzz * r4.xyz;
    r6.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.xyz = r12.xyw * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    r10.xy = r8.xy * r9.xx + r7.xz;
    ps = UniformVector_2.x * r6.y;
    r4.xyz = r10.wyz * r6.zxz;
    r6.x = ps;
    ps = r6.x;
    r7.xz = -r4.yw + 1.0;
    ps = r10.x * ps;
    r12.yw = r7.xy * UniformVector_2.yy;
    r12.x = ps;
    r6 = r12 - 0.5;
    r18 = float4((r12.xywz >= 0.5));
    ps = ScreenPositionScaleBias.w + r4.z;
    r6 = r6.xywz - r12.xywz;
    r7.x = ps;
    r6 = r6.xywz * r18.xywz + r12;
    ps = ScreenPositionScaleBias.z + r4.x;
    r6 = r6 + r6;
    r7.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r17.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r15 = tex2D(Texture2D_1, r6.xy).wyxz;
    r19 = tex2D(Texture2D_1, r6.zw);
    r11.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r20.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r21.xyz = tex2D(Texture2D_8, r1.zw).xyz;
    r13.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r12 = tex2D(Texture2D_6, r0.xy);
    r7.xyw = tex2D(Texture2D_3, r0.zw).wxy;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r5.w;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = saturate(ps);
    ps = (-1.0) + r7.x;
    r6.y = float((UniformScalar_5.x >= 1.0));
    r10.z = ps;
    ps = 1.0 - r6.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r10.w = ps;
    ps = 1.0 - r6.x;
    r0.w = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    ps = r12.w;
    r5.zw = r13.xy + r13.xy;
    r6.w = ps;
    ps = r7.y + r7.y;
    r6.z = float((UniformScalar_5.x > 1.0));
    r5.x = ps;
    r13.xyz = (-abs(r6.zzz) >= 0.0) ? r21.xyz : 1.0;
    r20.xyz = r20.xyz * 2.0 - 1.0;
    r3.xyw = r11.xzy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r6.z = r9.w * r13.w;
    r0.w = ps;
    ps = r7.w + r7.w;
    r2.xyz = r0.www * r2.xyz;
    r5.y = ps;
    r13.w = r20.z * UniformVector_4.z - r3.y;
    r13.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r13.xzy;
    ps = log2(r6.x);
    r0.w = r10.w * UniformScalar_1.x;
    r6.y = ps;
    ps = UniformScalar_6.x * r6.w;
    r5 = r5 - 1.0;
    r11.w = ps;
    r6.xw = r0.ww * r5.xy + r20.xy;
    r6.xw = r6.xw * UniformVector_4.xy - r3.xw;
    ps = (-1.0) - -r6.z;
    r10.x = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    ps = r5.z;
    r10.y = dot(r18.wzz, float3(1.0, 1.0, 1.0));
    r1.w = (r10.y == 0.0) ? r19.x : r19.y;
    r7.w = (r10.x == 0.0) ? r15.z : r15.y;
    ps = r9.y + ps;
    r18 = r10.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r9.y = ps;
    r7.w = (r18.y == 0.0) ? r15.w : r7.w;
    r1.w = (r18.z == 0.0) ? r19.z : r1.w;
    r15.z = (r18.w == 0.0) ? r19.w : r1.w;
    r7.w = (r18.x == 0.0) ? r15.x : r7.w;
    r9.x = r7.w * 2.0 - r6.z;
    ps = ModShadowGroupColor.x * r7.z;
    r7.w = max(r15.z, 0.0);
    r15.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r14.x = min(r7.w, 0.3);
    r15.y = ps;
    ps = r5.w;
    r7.yzw = -r15.zyx + 1.0;
    ps = r9.z + ps;
    r5.xyz = r14.yxz * float3(0.875, 3.3333333, 0.875);
    r9.z = ps;
    r14.xy = r5.yy * r9.yz + r6.xw;
    r15.yzw = r5.yxz * r7.xwz + float3(1.0, 0.125, 0.125);
    ps = r12.w;
    r15.x = abs(r15.y) * abs(r15.y);
    r6.x = ps;
    ps = 1.0 - r6.x;
    r10.xy = r15.xz * r15.xw;
    r6.w = ps;
    r0.xyz = r10.yyy * r0.xyz + ModShadowColor.xyz;
    ps = UniformVector_5.x * r6.w;
    r9.yz = r10.xz * r10.xw;
    r3.y = ps;
    ps = UniformVector_5.y * r6.w;
    r14.zw = r9.xz + float2(1.25, 1.0);
    r3.z = ps;
    r6.x = (r0.w > 0.0) ? r14.w : 1.0;
    r16.w = (r0.w >= 0.0) ? r6.x : 1.0;
    ps = r14.z;
    r5 = r16 * r12;
    ps = -r6.z + ps;
    r13.xyz = r5.xzy * r13.xyz;
    r6.x = saturate(ps);
    ps = r13.x;
    r12.xyz = r6.xxx * r17.xyz;
    ps = r16.w * ps;
    r5.yz = r13.zy * r5.ww;
    r6.x = ps;
    ps = 2.5 * r7.y;
    r5.x = r6.x * r12.w;
    r5.w = ps;
    r13.xyz = r5.xyz * r15.yyy - r12.xyz;
    r6.z = saturate(r5.w * r15.y - 0.5);
    r7.xy = r14.xy * r6.zz + r3.xw;
    r3.x = r13.w * r6.z - 2.0;
    r12.xyz = r13.xyz * r6.zzz + r12.xyz;
    ps = UniformVector_5.z * r6.w;
    r1.xyz = r12.xyz * r1.xyz;
    r3.w = ps;
    r3 = r3 + r11.zwww;
    r5.xyz = r5.xyz * UniformScalar_7.xxx + r3.yzw;
    r7.z = r3.x + r11.z;
    r7.xyz = r7.zxy * r10.www;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r10.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r3.xyz = (r10.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r9.yyy * r5.xyz;
    r6.x = ps;
    r3.xyz = r3.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r8.zxy);
    r5.xyz = r3.xyz * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r6.x = saturate(dot(r2.zxy, r5.zxy));
    ps = log2(r6.x);
    r7.yzw = r7.xyz * r6.zzz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r6.z = r6.x * 15.0;
    r6.x = ps;
    ps = pow(2.0, r6.z);
    r7.x = saturate(dot(r3.zyx, r2.zyx));
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r7.yzw * r6.yyy;
    r6.x = ps;
    r6.yz = r1.xy * r7.xx + r6.yz;
    r6.w = r1.z * r7.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
