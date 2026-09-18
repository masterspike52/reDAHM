// ps_646c16887361dd66.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10041500 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_8, r0.xy);
    r0.w = r5.w - 4e+02;
    ps = r2.z;
    r7.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r1.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r1.z = r11.w - 0.5;
    r1.w = ps;
    ps = 0.00022222222 * r0.w;
    r9.xyz = r1.www * r4.xyz;
    r1.w = saturate(ps);
    ps = 5.0 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r1.z = saturate(ps);
    ps = (-0.025) * r1.w;
    r2.w = float((UniformScalar_8.x >= 1.0));
    r0.z = ps;
    r13.xy = r9.xy * r0.zz + r7.xy;
    r7.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r15.x = r1.x * UniformVector_2.x;
    ps = 0.0001 * r5.w;
    r10.y = -r1.y + 1.0;
    r4.w = saturate(ps);
    r14.y = UniformScalar_2.x * UniformVector_6.y;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = UniformScalar_1.x * UniformVector_4.x;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = UniformVector_4.x * UniformScalar_4.x;
    r4.y = ps;
    ps = 1.0 / r5.w;
    r8.xy = r4.xy * abs(r6.xy);
    r4.y = ps;
    ps = UniformVector_6.y;
    r6.xy = r1.xy * 6.0;
    ps = UniformScalar_5.x * ps;
    r6.zw = r1.xy * UniformVector_7.xy;
    r14.w = ps;
    ps = UniformVector_6.x * r0.z;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r14.x = ps;
    ps = UniformVector_6.x * r0.w;
    r12.xyz = r7.xyw + r7.xyw;
    r14.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r5 = r14 + r0.xyxy;
    r4.x = ps;
    r4.xyz = r13.zwy * r4.yyx;
    ps = 1.0 / UniformVector_1.x;
    r10.xw = -r4.zw + 1.0;
    r10.z = ps;
    r15.yzw = r10.yxz * UniformVector_2.yyx;
    ps = r15.w;
    r14.xyz = r15.zxy - 0.5;
    ps = r13.x * ps;
    r19.xyz = float3((r15.xzy >= 0.5));
    r12.w = ps;
    r19.w = float((r12.w >= 0.5));
    r16.xyz = r14.xzy - r15.zyx;
    r14 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    ps = ScreenPositionScaleBias.w + r4.x;
    r16.w = r14.w - r12.w;
    r0.z = ps;
    r12.x = r16.w * r19.w + r12.w;
    r12.yzw = r16.xzy * r19.yxz + r15.zxy;
    ps = ScreenPositionScaleBias.z + r4.y;
    r12 = r12.zwxy + r12.zwxy;
    r0.w = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r16.xyz = tex2D(Texture2D_6, r13.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r17 = tex2D(Texture2D_1, r12.xy);
    r20 = tex2D(Texture2D_1, r12.zw);
    r15 = tex2D(Texture2D_4, r5.xy);
    r21 = tex2D(Texture2D_5, r5.zw);
    r12.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r0.yzw = tex2D(Texture2D_3, r0.xy).xzy;
    r6.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r5.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r13.xyz = UniformVector_5.xyz * 2e+01;
    ps = r5.x + r5.x;
    r0.x = dot(r3.zxy, r3.zxy);
    r18.z = ps;
    r8.zw = r6.xy * 2.0 - 1.0;
    ps = 1.0 - r0.x;
    r1.x = float((UniformScalar_8.x > 1.0));
    r0.x = saturate(ps);
    ps = r6.w;
    r6.xyz = r11.xyz * UniformScalar_9.xxx;
    r12.xyz = (-abs(r1.xxx) >= 0.0) ? r12.xyz : 1.0;
    ps = r5.z * ps;
    r3.xyz = r21.xyz * r21.www;
    r1.y = ps;
    r3.xzw = r15.xyz * r15.www + r3.xyz;
    r12.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r0.x);
    r3.y = r1.y - 1.0;
    r0.x = ps;
    r6.xyz = r6.xyz * r12.xyz + UniformScalar_10.xxx;
    ps = r0.y + r0.y;
    r13.xyz = r13.xyz * r3.xzw;
    r15.x = ps;
    ps = r0.w + r0.w;
    r1.x = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r15.y = ps;
    ps = r0.z + r0.z;
    r0.y = r1.x - r13.x;
    r15.z = ps;
    ps = r0.y;
    r3.z = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r3.x = r19.y * 2.0 + r19.w;
    r0.z = (r3.x == 0.0) ? r20.x : r20.y;
    r0.y = (r3.z == 0.0) ? r17.x : r17.y;
    ps = r13.x + ps;
    r19 = r3.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r3.x = saturate(ps);
    r0.y = (r19.z == 0.0) ? r17.z : r0.y;
    r0.z = (r19.y == 0.0) ? r20.z : r0.z;
    r15.w = (r19.x == 0.0) ? r20.w : r0.z;
    r1.x = (r19.w == 0.0) ? r17.w : r0.y;
    ps = 1.0 - r1.x;
    r2.w = max(r1.x, 0.0);
    r1.x = ps;
    ps = 1.0 - r1.z;
    r17 = r15 + float4(-1.0, -1.0, -1.0, 0.25);
    r1.w = ps;
    r3.zw = -r1.ww * ModShadowGroupColor.xy + 1.0;
    ps = r17.w;
    r1.z = dot(r2.zxy, r2.zxy);
    ps = r15.w + ps;
    r0.yzw = r17.xzy * UniformVector_4.xzy;
    r4.w = ps;
    r15.xy = -r0.yw * r3.xx + r0.yw;
    ps = rsqrt(abs(r1.z));
    r1.y = saturate(r4.w - r1.y);
    r1.z = ps;
    ps = r5.y + r5.y;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r18.w = ps;
    ps = 1.0 - r3.x;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = ps;
    ps = r2.w;
    r5.xyz = r1.zzz * r2.xyz;
    r2.x = ps;
    ps = 0.3;
    r8 = r8 * float4(0.875, 0.875, 0.5, 0.5);
    r2.y = ps;
    ps = min(r2.x, r2.y);
    r6.xyz = r6.xyz * r0.yyy;
    r0.y = ps;
    ps = 3.3333333 * r0.y;
    r18.xy = r8.xy * r3.zw;
    r8.y = ps;
    ps = 1.0 - r0.z;
    r2 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r8.x = ps;
    ps = r2.x * r2.y;
    r3.zw = r2.zw + r8.zw;
    r1.z = ps;
    r2.xyz = r1.zzz * r17.xyz + ModShadowColor.xyz;
    ps = 2.5 * r1.x;
    r8 = r8.yyxy * r3.zwxy;
    r1.z = ps;
    ps = r0.z;
    r3.xyz = r1.yyy * r16.xyz;
    ps = r8.z + ps;
    r1.y = r8.w + 1.0;
    r8.z = ps;
    ps = r1.y * r1.x;
    r8.xy = r15.xy + r8.xy;
    r0.y = ps;
    ps = r1.z * r1.y;
    r8.xyw = -r14.xyz + r8.xyz;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r0.y = float((r0.y > 0.9));
    r0.z = saturate(ps);
    r1.xy = r8.xy * r0.zz + r14.xy;
    r8.xyz = r13.xyz * r0.yyy - r3.xyz;
    r0.y = r8.w * r0.z - 2.0;
    r1.z = r7.w * 2.0 + r0.y;
    r8.xyz = r12.xyz * r11.xyz + r8.xyz;
    r8.xyz = r8.xyz * r0.zzz + r3.xyz;
    r1.xyz = r1.zxy * r10.www;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r10.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r10.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.y));
    r3.xyz = r6.xyz * r0.zzz;
    r0.y = ps;
    r6.xyz = r1.xyz * r0.yyy;
    r0.y = dot(r6.zxy, r9.zxy);
    r0.yzw = r6.xyz * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r9.xyz;
    r0.y = saturate(dot(r5.zxy, r0.wyz));
    ps = log2(r0.y);
    r1.yzw = r8.xyz * r7.xyz;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r6.zyx, r5.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r3.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r2.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
