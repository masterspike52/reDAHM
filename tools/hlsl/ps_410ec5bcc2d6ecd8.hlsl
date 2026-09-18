// ps_410ec5bcc2d6ecd8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041500 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
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
    r10.xyz = r1.www * r4.xyz;
    r1.w = saturate(ps);
    ps = 5.0 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r1.z = saturate(ps);
    ps = (-0.025) * r1.w;
    r9.xyz = UniformVector_5.xyz * 2e+01;
    r0.z = ps;
    r15.xy = r10.xy * r0.zz + r7.xy;
    r7.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r18.x = r1.x * UniformVector_2.x;
    r13.y = UniformScalar_2.x * UniformVector_6.y;
    r13.w = UniformVector_6.y * UniformScalar_5.x;
    ps = 1.0 / UniformVector_1.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r16.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.y = UniformScalar_1.x * UniformVector_4.x;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.z = UniformVector_4.x * UniformScalar_4.x;
    r4.w = ps;
    ps = rsqrt(abs(r0.z));
    r8.xy = r4.xw * abs(r6.xy);
    r0.w = ps;
    r14.zw = r1.xy * 6.0;
    ps = -r1.y;
    r12.xy = r1.xy * UniformVector_7.xy;
    ps = 1.0 + ps;
    r15.zw = r5.xy * ScreenPositionScaleBias.xy;
    r16.y = ps;
    ps = UniformVector_6.x * r4.y;
    r19.xyz = r7.xyw + r7.xyw;
    r13.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.xyz = r0.www * -SpotDirection.xyz;
    r2.w = ps;
    ps = 1.0 / r5.w;
    r0.w = dot(r6.zxy, r3.zxy);
    r3.x = ps;
    r6.xy = r15.zw * r3.xx + ScreenPositionScaleBias.wz;
    r16.x = -r15.y * r2.w + 1.0;
    ps = UniformVector_6.x * r4.z;
    r18.yzw = r16.yxz * UniformVector_2.yyx;
    r13.z = ps;
    ps = r18.w;
    r17 = r13 + r0.xyxy;
    ps = r15.x * ps;
    r4.xyz = r18.zxy - 0.5;
    r19.w = ps;
    r16.z = float((r19.w >= 0.5));
    r3.xzw = float3((r18.zxy >= 0.5));
    r4.xyz = r4.xzy - r18.zyx;
    ps = -SpotAngles.x - -r0.w;
    r13 = r19 + float4(-1.0, -1.0, -1.0, -0.5);
    r0.w = ps;
    r18.yzw = r4.xzy * r3.xzw + r18.zxy;
    ps = SpotAngles.y * r0.w;
    r16.x = r13.w - r19.w;
    r16.y = saturate(ps);
    r4.xy = r16.xy * r16.zy;
    r18.x = r19.w + r4.x;
    r18 = r18.zwxy + r18.zwxy;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r15.xyz = tex2D(Texture2D_6, r15.xy).xyz;
    r14.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8 = tex2D(Texture2D_1, r18.xy);
    r20 = tex2D(Texture2D_1, r18.zw);
    r19 = tex2D(Texture2D_4, r17.xy);
    r21 = tex2D(Texture2D_5, r17.zw);
    r12.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r4.xzw = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyw = tex2D(Texture2D_2, r14.zw).xyw;
    r7.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    ps = r5.w;
    r1.x = float((UniformScalar_8.x >= 1.0));
    ps = 0.0001 * ps;
    r17.zw = r7.xy + r7.xy;
    r18.z = saturate(ps);
    r14.zw = r0.xy * 2.0 - 1.0;
    ps = 1.0 - r0.z;
    r0.y = float((UniformScalar_8.x > 1.0));
    r0.x = saturate(ps);
    ps = r0.w;
    r5.xyz = r11.xyz * UniformScalar_9.xxx;
    r12.xyz = (-abs(r0.yyy) >= 0.0) ? r12.xyz : 1.0;
    ps = r7.z * ps;
    r0.yzw = r21.xyz * r21.www;
    r1.y = ps;
    r0.yzw = r19.xyz * r19.www + r0.yzw;
    r12.xyz = (-abs(r1.xxx) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r0.x);
    r3.y = r1.y - 1.0;
    r0.x = ps;
    r19.xyz = r5.xyz * r12.xyz + UniformScalar_10.xxx;
    ps = r4.x + r4.x;
    r9.xyz = r9.xyz * r0.yzw;
    r5.x = ps;
    ps = r4.z + r4.z;
    r0.y = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r5.y = ps;
    ps = r4.w + r4.w;
    r0.y = r0.y - r9.x;
    r5.z = ps;
    ps = r0.y;
    r3.z = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r3.x = r3.x * 2.0 + r16.z;
    r0.z = (r3.x == 0.0) ? r20.x : r20.y;
    r0.y = (r3.z == 0.0) ? r8.x : r8.y;
    ps = r9.x + ps;
    r16 = r3.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r3.x = saturate(ps);
    r0.y = (r16.z == 0.0) ? r8.z : r0.y;
    r0.z = (r16.y == 0.0) ? r20.z : r0.z;
    r5.w = (r16.x == 0.0) ? r20.w : r0.z;
    r1.x = (r16.w == 0.0) ? r8.w : r0.y;
    ps = 1.0 - r3.x;
    r3.z = max(r1.x, 0.0);
    r2.w = ps;
    ps = 1.0 - r1.x;
    r8 = r5 + float4(-1.0, -1.0, -1.0, 0.25);
    r1.x = ps;
    ps = r8.w;
    r3.w = dot(r2.zxy, r2.zxy);
    ps = r5.w + ps;
    r0.yzw = r8.xzy * UniformVector_4.xzy;
    r5.x = ps;
    r4.zw = -r0.yw * r3.xx + r0.yw;
    ps = rsqrt(abs(r3.w));
    r1.y = saturate(r5.x - r1.y);
    r0.y = ps;
    ps = 1.0 - r1.z;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r1.z = ps;
    ps = r3.z;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r3.z = ps;
    ps = 0.3;
    r5.xyz = r0.yyy * r2.xyz;
    r3.w = ps;
    ps = ModShadowGroupColor.x * r1.z;
    r14 = r14 * float4(0.875, 0.875, 0.5, 0.5);
    r18.x = ps;
    ps = ModShadowGroupColor.y * r1.z;
    r7.xyz = r19.xyz * r2.www;
    r18.y = ps;
    ps = min(r3.z, r3.w);
    r2.xyw = -r18.xyz + 1.0;
    r0.y = ps;
    ps = 3.3333333 * r0.y;
    r17.xy = r14.xy * r2.xy;
    r14.y = ps;
    ps = 1.0 - r0.z;
    r17 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r14.x = ps;
    ps = r17.x * r17.y;
    r3.zw = r17.zw + r14.zw;
    r1.w = ps;
    r2.xyz = r1.www * r16.xyz + ModShadowColor.xyz;
    ps = 2.5 * r1.x;
    r14 = r14.yyxy * r3.zwxy;
    r1.w = ps;
    ps = r0.z;
    r3.xyz = r1.yyy * r15.xyz;
    ps = r14.z + ps;
    r1.y = r14.w + 1.0;
    r14.z = ps;
    ps = r1.y * r1.x;
    r14.xy = r4.zw + r14.xy;
    r0.z = ps;
    ps = r1.w * r1.y;
    r4.xzw = -r13.xyz + r14.xyz;
    r0.y = ps;
    ps = (-0.5) + r0.y;
    r0.w = float((r0.z > 0.9));
    r0.z = saturate(ps);
    r1.xy = r4.xz * r0.zz + r13.xy;
    r9.xyz = r9.xyz * r0.www - r3.xyz;
    r0.y = r4.w * r0.z - 2.0;
    r1.z = r7.w * 2.0 + r0.y;
    r9.xyz = r12.xyz * r11.xyz + r9.xyz;
    r9.xyz = r9.xyz * r0.zzz + r3.xyz;
    r1.xyz = r1.zxy * r2.www;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r2.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r2.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.y));
    r3.xyz = r7.xyz * r0.zzz;
    r0.y = ps;
    r7.xyz = r1.xyz * r0.yyy;
    r0.y = dot(r7.zxy, r10.zxy);
    r0.yzw = r7.xyz * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r10.xyz;
    r0.y = saturate(dot(r5.zxy, r0.wyz));
    ps = log2(r0.y);
    r1.yzw = r9.xyz * r8.xyz;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r7.zyx, r5.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r3.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r4.yyy;
    r0.xyz = r0.xzy * r2.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
