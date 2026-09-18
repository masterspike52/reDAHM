// ps_c887cf5322b6f1bc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041300 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ShadowTexture : register(s9);
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r1.xy);
    ps = (-0.5) + r11.w;
    r7.xy = r1.wz * 6.0;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r12.z = tex2D(ShadowTexture, r0.xy).x;
    r6.yzw = tex2D(Texture2D_2, r1.wz).wxy;
    r0.xyz = tex2D(Texture2D_2, r7.xy).xyw;
    r13.xy = r1.xy * UniformScalar_0.xx;
    ps = r1.w;
    r7.xy = r1.wz * UniformVector_6.xy;
    ps = UniformVector_2.x * ps;
    r7.zw = r1.wz * UniformVector_1.xy;
    r16.y = ps;
    ps = -r1.z;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r6.x = r5.w - 4e+02;
    r14.y = ps;
    ps = 1.0 / r5.w;
    r9.xy = r5.xy * ScreenPositionScaleBias.xy;
    r2.w = ps;
    r10.xy = r9.xy * r2.ww + ScreenPositionScaleBias.wz;
    r12.yw = r0.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r16.zw = r6.zw + r6.zw;
    r0.w = ps;
    ps = 0.00022222222 * r6.x;
    r9.xyz = r0.www * r4.xyz;
    r12.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r0.xyw = r12.xyw * float3(-0.025, 0.5, 0.5);
    r12.w = ps;
    r12.xy = r9.xy * r0.xx + r7.zw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xw = r12.yz * r12.wz;
    r7.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r14.x = -r4.x + 1.0;
    r14.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xzw = r14.zxy * UniformVector_2.xyy;
    r7.w = ps;
    ps = r6.x;
    r7.zw = r7.zw * abs(r8.xy);
    ps = r12.x * ps;
    r4.xy = r6.zw - 0.5;
    r16.x = ps;
    ps = r4.x;
    r18.zw = float2((r6.zw >= 0.5));
    ps = -r6.z + ps;
    r15 = r16.zwxy + float4(-1.0, -1.0, -0.5, -0.5);
    r14.z = ps;
    ps = r4.y;
    r18.xy = float2((r16.xy >= 0.5));
    ps = -r6.w + ps;
    r14.xy = r15.zw - r16.xy;
    r14.w = ps;
    r8.xz = r14.xy * r18.xy + r16.xy;
    r8.yw = r14.zw * r18.zw + r6.zw;
    r16 = r8 + r8;
    r10.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    r14.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r17 = tex2D(Texture2D_1, r16.zw);
    r19 = tex2D(Texture2D_1, r16.xy);
    r12.xyz = tex2D(Texture2D_0, r12.xy).xyz;
    r7.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r16.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r13.xy).wxy;
    ps = 0.0001 * r5.w;
    r1.w = dot(r2.zxy, r2.zxy);
    r13.y = saturate(ps);
    ps = r2.z;
    r6.w = float((UniformScalar_5.x >= 1.0));
    ps = 0.1 + ps;
    r7.w = float((UniformScalar_5.x > 1.0));
    r6.x = ps;
    r14.zw = r1.yz * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r13.x = saturate(ps);
    r4.xyz = r16.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.z;
    r6.y = r0.z * r6.y;
    r6.x = saturate(ps);
    r7.xyz = (-abs(r7.www) >= 0.0) ? r7.xyz : 1.0;
    r5.xzw = (-abs(r6.www) >= 0.0) ? 1.0 : r7.xyz;
    ps = (-1.0) - -r6.y;
    r7.xyz = r12.zxy + float3(-1.0, 0.0, 0.0);
    r15.z = ps;
    ps = log2(r6.x);
    r7.yzw = r7.yzx + r12.xyz;
    r7.x = ps;
    r3.w = r4.z * UniformVector_4.z - r7.w;
    ps = (-1.0) + r7.y;
    r16.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r3.x = ps;
    ps = (-1.0) + r7.z;
    r6.zw = -r13.xy + 1.0;
    r3.y = ps;
    ps = UniformScalar_1.x * r6.w;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r11.xyz = r16.xyz * r11.xyz;
    r16.y = ps;
    r4.yz = r6.xx * r14.zw + r4.xy;
    r3.xy = r4.yz * UniformVector_4.xy - r3.xy;
    r4.yz = r18.zw * 2.0 + r18.xy;
    r2.w = (r4.y == 0.0) ? r19.x : r19.y;
    r0.z = (r4.z == 0.0) ? r17.x : r17.y;
    ps = ModShadowGroupColor.y * r6.z;
    r18 = r4.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r16.z = ps;
    r0.z = (r18.z == 0.0) ? r17.z : r0.z;
    r2.w = (r18.y == 0.0) ? r19.z : r2.w;
    r14.z = (r18.x == 0.0) ? r19.w : r2.w;
    r16.x = (r18.w == 0.0) ? r17.w : r0.z;
    ps = r15.x;
    r0.z = max(r16.x, 0.0);
    ps = r0.y + ps;
    r14.w = min(r0.z, 0.3);
    r15.x = ps;
    ps = r15.y;
    r0.xyz = -r16.xyz + 1.0;
    ps = r0.w + ps;
    r4.xyz = r14.xyw * float3(0.875, 0.875, 3.3333333);
    r15.y = ps;
    r3.yz = r4.zz * r15.xy + r3.xy;
    ps = 2.5 * r0.x;
    r14.xy = r4.xy * r0.yz;
    r5.y = ps;
    r8.w = r4.z * r15.z + 1.0;
    ps = abs(r8.w) * abs(r8.w);
    r0.xyz = r14.xyz + float3(0.125, 0.125, 0.25);
    r0.w = ps;
    ps = r0.w * r0.w;
    r2.w = r0.z + r14.z;
    r0.w = ps;
    ps = r2.w;
    r11.xyz = r11.xyz * r5.xzw;
    ps = -r6.y + ps;
    r4.xy = r0.xw * r0.yw;
    r5.x = saturate(ps);
    r0.xyz = r4.xxx * r13.xyz + ModShadowColor.xyz;
    ps = (-1.0) + r1.x;
    r5 = r5.xxxy * r8;
    r3.x = ps;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r0.w = saturate(r5.w - 0.5);
    r6.y = ps;
    r7.x = r3.w * r0.w + r7.w;
    r7.yz = r3.yz * r0.ww - 1.0;
    r3.yz = r12.xy * 2.0 + r7.yz;
    r3.w = r7.x * TwoSidedSign.x - TwoSidedSign.x;
    r7.w = r3.w * r6.w + TwoSidedSign.x;
    r7.xyz = r3.xyz * r6.www + float3(1.0, 0.0, 0.0);
    r7.xyz = (r6.xww > 0.0) ? r7.xyz : float3(1.0, 0.0, 0.0);
    r7.w = (r6.w > 0.0) ? r7.w : TwoSidedSign.x;
    r3.z = (r6.w >= 0.0) ? r7.w : TwoSidedSign.x;
    r3.xyw = (r6.wwx >= 0.0) ? r7.yzx : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r7.xyz = r11.xyz * r3.www;
    r6.x = ps;
    r8.xyz = r7.xyz * r8.www - r5.xyz;
    r7.xyz = r7.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = pow(2.0, r6.y);
    r4.xyz = r4.yyy * r7.xyz;
    r7.x = ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.yzw = r6.xxx * r2.xyz;
    r7.yzw = r4.www * r10.xyz;
    r6.x = dot(r3.zxy, r3.zxy);
    r2.xyz = r8.xyz * r0.www + r5.xyz;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r2.xyz * r1.xyz;
    r6.x = ps;
    r2.xyz = r3.xyz * r6.xxx;
    r3.xyz = r2.xyz * TwoSidedSign.xxx;
    r6.x = dot(r3.zxy, r9.zxy);
    r2.xyz = r3.xzy * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r9.xzy;
    r6.x = saturate(dot(r6.wyz, r2.yxz));
    ps = log2(r6.x);
    r2.xyz = r4.xyz * r0.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.xyz = r7.ywz * r7.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r3.zxy, r6.wyz));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
