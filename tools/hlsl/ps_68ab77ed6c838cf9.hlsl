// ps_68ab77ed6c838cf9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 357 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000594 10041100 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.w = r5.w - 4e+02;
    r1.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r1.z));
    r0.z = r2.z + 0.1;
    r2.w = ps;
    ps = 0.00022222222 * r0.w;
    r1.zw = r1.xy * UniformVector_1.xy;
    r3.w = saturate(ps);
    ps = 5.0 * r0.z;
    r8.xyz = r2.www * r4.xyz;
    r3.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r0.w = r3.w * (-0.025);
    r0.z = ps;
    r9.xy = r8.xy * r0.ww + r1.zw;
    r3.z = r9.y * r0.z;
    ps = 0.0001 * r5.w;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r3.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r10.yzw = -r3.zxy + 1.0;
    r10.x = ps;
    r3.yz = r10.yx * UniformVector_2.yx;
    r3.x = r3.z * r9.x;
    r12 = tex2D(Texture2D_1, r3.xy);
    r3.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = r1.xy * 6.0;
    r4.y = ps;
    ps = trunc(UniformScalar_1.x);
    r9.zw = r1.xy * UniformVector_6.xy;
    r3.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = -r1.y + 1.0;
    r4.z = ps;
    r0.w = (r3.z == 0.0) ? r12.x : r12.y;
    ps = UniformVector_2.y * r0.z;
    r11.zw = r5.xy * ScreenPositionScaleBias.xy;
    r3.y = ps;
    ps = r4.y;
    r13 = r3.xyzz + float4(-0.5, -0.5, -3.0, -2.0);
    ps = abs(r6.x) * ps;
    r7.xy = float2((r3.xy >= 0.5));
    r4.x = ps;
    ps = 1.0 / r5.w;
    r11.xy = r13.xy - r3.xy;
    r7.z = ps;
    r0.z = (r13.w == 0.0) ? r12.z : r0.w;
    r3.w = (r13.z == 0.0) ? r12.w : r0.z;
    r0.zw = r11.zw * r7.zz + ScreenPositionScaleBias.wz;
    r3.yz = r11.xy * r7.xy + r3.xy;
    ps = r4.z;
    r3.x = r3.w + 0.25;
    ps = abs(r6.y) * ps;
    r3.xyw = r3.yzx + r3.yzw;
    r4.y = ps;
    r15.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r5.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r4 = tex2D(Texture2D_1, r3.xy);
    r11 = tex2D(Texture2D_4, r0.xy);
    r16.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r1.zw).xyw;
    r1.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r0.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r12.xyz = r0.xyw * 2.0 - 1.0;
    r9.xw = r1.xy * 2.0 - 1.0;
    r13.zw = r14.xy * 2.0 - 1.0;
    r0.x = r14.z * r1.z;
    r1.w = dot(r2.zxy, r2.zxy);
    r14.xyz = UniformVector_5.xzy * 2e+01;
    r0.z = float((UniformScalar_4.x >= 1.0));
    r1.x = float((UniformScalar_4.x > 1.0));
    r6.xyz = r6.xyz * 2.0 - 1.0;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? r16.xyz : 1.0;
    r11.xyz = r11.xyz * r11.www;
    r1.xyz = (-abs(r0.zzz) >= 0.0) ? 1.0 : r1.yxz;
    r11.xyz = r14.xzy * r11.xyz;
    r0.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    ps = r0.z;
    r16.xyz = r6.xyz * UniformVector_4.xyz;
    ps = -r11.x + ps;
    r7.x = dot(r7.xyy, float3(1.0, 1.0, 1.0));
    r2.w = ps;
    r0.z = (r7.x == 0.0) ? r4.x : r4.y;
    r2.w = saturate(r2.w + r11.x);
    r14.xy = -r16.xy * r2.ww + r16.xy;
    r7.yz = -r10.zz * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r1.w));
    r3.w = saturate(r3.w - r0.x);
    r1.w = ps;
    ps = UniformScalar_5.x * r3.z;
    r5.xyz = r5.xyz * LightColor.xyz;
    r9.y = ps;
    ps = UniformScalar_5.x * r3.y;
    r6.xyz = r1.www * r2.xyz;
    r9.z = ps;
    ps = UniformScalar_5.x * r1.y;
    r9.yz = r9.zy * r1.xz;
    r1.w = ps;
    ps = r1.w;
    r13 = r13 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r3.x * ps;
    r2.yz = r9.xw + r13.zw;
    r9.x = ps;
    r9.xyz = r9.xyz + UniformScalar_6.xxx;
    r7.yz = r13.xy * r7.yz;
    r13 = r7.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r0.z = (r13.y == 0.0) ? r4.z : r0.z;
    ps = r13.z * r13.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = ps;
    r4.xyz = r1.www * r17.xyz + ModShadowColor.xyz;
    r16.w = (r13.x == 0.0) ? r4.w : r0.z;
    r0.z = max(r16.w, 0.0);
    ps = (-1.0) - -r0.x;
    r0.y = min(r0.z, 0.3);
    r2.x = ps;
    ps = 1.0 - r2.w;
    r0.xz = -r16.zw + 1.0;
    r1.w = ps;
    ps = 3.3333333 * r0.y;
    r9.xyz = r9.xyz * r1.www;
    r0.y = ps;
    r13 = r0.yyxy * r2.xywz;
    ps = 2.5 * r0.z;
    r13.z = r16.z + r13.z;
    r1.w = ps;
    ps = r13.x;
    r2.xyz = r3.www * r15.xyz;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r13.xy = r14.xy + r13.yw;
    r3.w = ps;
    r11.xyz = r1.yxz * r3.xyz + r11.xyz;
    r0.xyz = -r12.xyz + r13.xyz;
    r1.w = saturate(r1.w * r3.w - 0.5);
    r0.xy = r0.xy * r1.ww + r12.xy;
    r0.z = r0.z * r1.w - 2.0;
    r1.xyz = r11.xyz - r2.xyz;
    r1.xyz = r1.xyz * r1.www + r2.xyz;
    r0.z = r0.w * 2.0 + r0.z;
    r0.xyz = r0.zxy * r10.www;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r10.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r10.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r2.xyz = r9.xyz * r1.www;
    r0.x = ps;
    r3.xyz = r0.yzw * r0.xxx;
    r0.x = dot(r3.zxy, r8.zxy);
    r0.xyz = r3.xyz * r0.xxx;
    r0.xyz = r0.xyz * 2.0 - r8.xyz;
    r0.x = saturate(dot(r6.zxy, r0.zxy));
    ps = log2(r0.x);
    r1.xyz = r1.xyz * r7.xyz;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r3.zyx, r6.zyx));
    r0.x = ps;
    r0.xyz = r2.xyz * r0.xxx;
    r0.xy = r1.xy * r0.ww + r0.xy;
    r0.z = r1.z * r0.w + r0.z;
    r0.xyz = r5.xyz * r0.xyz;
    r0.xyz = r0.xzy * r4.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
