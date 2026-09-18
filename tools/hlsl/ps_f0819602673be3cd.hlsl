// ps_f0819602673be3cd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 291 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000048C 10041000 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_5, r0.xy).wxyz;
    ps = (-0.5) + r8.x;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r10.x = r1.x * UniformVector_2.x;
    r9.xy = r1.xy * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    r10.zw = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r10.y = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r12.xyw = r10.zyw * float3(0.5, -0.025, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r10.zw = r7.xy * r12.yy;
    r10.y = ps;
    r4.xy = r10.xy - 0.5;
    r0.zw = float2((r10.xy >= 0.5));
    ps = r1.z;
    r4.xy = r4.xy - r10.xy;
    ps = abs(r6.x) * ps;
    r9.zw = r4.xy * r0.zw;
    r4.x = ps;
    ps = r1.w;
    r10 = r10.zwxy + r9;
    ps = abs(r6.y) * ps;
    r1.zw = r10.zw + r10.zw;
    r4.y = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r11 = tex2D(Texture2D_1, r1.zw);
    r9.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    r13.xyz = r4.xyw * 2.0 - 1.0;
    ps = r9.x + r9.x;
    r14.xy = r5.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = r9.y + r9.y;
    r15.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r15.z = ps;
    r0.z = (r15.x == 0.0) ? r11.x : r11.y;
    ps = r1.x;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = UniformVector_6.x * ps;
    r11.xy = r15.zw + r12.xw;
    r1.z = ps;
    r0.z = (r15.y == 0.0) ? r11.z : r0.z;
    r0.z = (r15.x == 0.0) ? r11.w : r0.z;
    ps = r1.y;
    r0.w = max(r0.z, 0.0);
    ps = UniformVector_6.y * ps;
    r12.x = min(r0.w, 0.3);
    r1.w = ps;
    ps = 1.0 / r5.w;
    r15.xyz = r12.yxz * float3(0.875, 3.3333333, 0.875);
    r0.w = ps;
    r1.xy = r15.yy * r11.xy - r13.xy;
    r14.zw = r6.xy * UniformVector_4.xy + r1.xy;
    r1.xy = r14.xy * r0.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r1.xyz = tex2D(Texture2D_6, r1.zw).xyz;
    r16.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    ps = UniformVector_5.x * UniformVector_5.w;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r12.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r0.x = dot(r3.zxy, r3.zxy);
    r12.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.y = dot(r2.zxy, r2.zxy);
    r12.z = ps;
    r3.xyz = r16.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r8.x = r7.w * r9.w - 1.0;
    ps = 0.1 - -r2.z;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r0.w = saturate(r0.w * 5.0);
    r0.y = ps;
    ps = 1.0 - r0.x;
    r12.xyz = r12.xyz * r8.yzw;
    r0.x = saturate(ps);
    r12.w = r6.z * UniformVector_4.z - r13.z;
    ps = log2(r0.x);
    r6.xyz = r0.yyy * r2.xyz;
    r0.x = ps;
    ps = r5.w;
    r0.yz = -r0.zw + 1.0;
    ps = 0.0001 * ps;
    r2.yz = r0.zz * ModShadowGroupColor.xy;
    r2.x = saturate(ps);
    ps = 2.5 * r0.y;
    r8.yzw = -r2.zyx + 1.0;
    r1.w = ps;
    r5.yzw = r15.yxz * r8.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r5.y) * abs(r5.y);
    r1.xyz = r12.xyz * r1.xyz;
    r5.x = ps;
    r12.xyz = r1.xyz * r5.yyy - r11.xyz;
    r2.w = saturate(r1.w * r5.y - 0.5);
    r1.xy = r14.zw * r2.ww + r13.xy;
    r1.z = r12.w * r2.w - 2.0;
    r2.xyz = r12.xyz * r2.www + r11.xyz;
    r5.xy = r5.xz * r5.xw;
    r0.yzw = r5.yyy * r10.xyz + ModShadowColor.xyz;
    r1.z = r4.w * 2.0 + r1.z;
    r1.xyz = r1.zxy * r8.www;
    ps = 1.0 + r1.x;
    r2.xyz = r2.xyz * r9.xyz;
    r1.w = ps;
    r1.xyz = (r8.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.yzw = (r8.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.x * r5.x;
    r1.x = dot(r1.wyz, r1.wyz);
    r3.w = ps;
    ps = rsqrt(abs(r1.x));
    r3.xyz = r3.www * r3.xyz;
    r1.x = ps;
    r1.yzw = r1.yzw * r1.xxx;
    r1.x = dot(r1.wyz, r7.zxy);
    r5.xyz = r1.yzw * r1.xxx;
    r5.xyz = r5.xyz * 2.0 - r7.xyz;
    r1.x = saturate(dot(r6.zxy, r5.zxy));
    ps = log2(r1.x);
    r3.xyz = r3.xyz * r2.www;
    r1.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.x = r1.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r1.x);
    r1.w = saturate(dot(r1.wzy, r6.zyx));
    r1.x = ps;
    ps = pow(2.0, r0.x);
    r1.xyz = r3.xyz * r1.xxx;
    r0.x = ps;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.xxx;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.ywz;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
