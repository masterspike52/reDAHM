// ps_ff38f7e4c9c35427.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 363 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005AC 10041200 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r5.w;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r1.z = r5.w - 4e+02;
    r7.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r1.w = r2.z + 0.1;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r7.xw = saturate(r1.wz * float2(5.0, 0.00022222222));
    r0.z = ps;
    ps = (-0.025) * r7.w;
    r1.zw = r1.xy * UniformVector_1.xy;
    r2.w = ps;
    ps = 1.0 - r7.x;
    r9.xyz = r0.zzz * r4.xyz;
    r0.z = ps;
    r1.zw = r9.xy * r2.ww + r1.zw;
    ps = 1.0 - r7.z;
    r4.x = r1.w * r0.w;
    r2.w = ps;
    r4.yz = r0.zz * ModShadowGroupColor.xy;
    ps = 1.0 / UniformVector_1.x;
    r17.yzw = -r4.xyz + 1.0;
    r17.x = ps;
    r4.yz = r17.yx * UniformVector_2.yx;
    r4.x = r4.z * r1.z;
    r11 = tex2D(Texture2D_1, r4.xy);
    r4.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.zw = r1.xy * 6.0;
    r7.x = ps;
    ps = trunc(UniformScalar_1.x);
    r12.xy = r1.xy * UniformVector_6.xy;
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = -r1.y + 1.0;
    r7.y = ps;
    r0.w = (r4.z == 0.0) ? r11.x : r11.y;
    ps = UniformVector_2.y * r0.z;
    r8.zw = r5.xy * ScreenPositionScaleBias.xy;
    r4.y = ps;
    ps = r7.x;
    r14 = r4.xyzz + float4(-0.5, -0.5, -3.0, -2.0);
    ps = abs(r6.x) * ps;
    r13.xy = float2((r4.xy >= 0.5));
    r0.z = ps;
    ps = 1.0 / r5.w;
    r8.xy = r14.xy - r4.xy;
    r13.z = ps;
    r0.w = (r14.w == 0.0) ? r11.z : r0.w;
    r4.w = (r14.z == 0.0) ? r11.w : r0.w;
    r5.xy = r8.zw * r13.zz + ScreenPositionScaleBias.wz;
    r4.yz = r8.xy * r13.xy + r4.xy;
    ps = r7.y;
    r4.x = r4.w + 0.25;
    ps = abs(r6.y) * ps;
    r4.xyw = r4.yzx + r4.yzw;
    r0.w = ps;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r1.zw).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7 = tex2D(Texture2D_1, r4.xy);
    r11 = tex2D(Texture2D_4, r0.xy);
    r16.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.xyw = tex2D(Texture2D_2, r10.zw).xyw;
    r0.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r6.xyw = tex2D(Texture2D_0, r1.zw).xyz;
    r0.z = dot(r3.zxy, r3.zxy);
    r12.xyz = r6.xyw * 2.0 - 1.0;
    r1.yz = r0.xy * 2.0 - 1.0;
    r10.zw = r14.xy * 2.0 - 1.0;
    r14.xyz = r15.xyz * 2.0 - 1.0;
    r0.x = r14.w * r0.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r15.xyz = UniformVector_5.xzy * 2e+01;
    r1.x = float((UniformScalar_4.x >= 1.0));
    r0.y = float((UniformScalar_4.x > 1.0));
    r3.xyz = (-abs(r0.yyy) >= 0.0) ? r16.xyz : 1.0;
    ps = 1.0 - r0.z;
    r11.xyz = r11.xyz * r11.www;
    r0.y = saturate(ps);
    r3.xyz = (-abs(r1.xxx) >= 0.0) ? 1.0 : r3.yxz;
    ps = log2(r0.y);
    r11.xyz = r15.xzy * r11.xyz;
    r0.z = ps;
    r0.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    ps = r0.y;
    r14.xyz = r14.xyz * UniformVector_4.xyz;
    ps = -r11.x + ps;
    r15.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r0.y = (r15.x == 0.0) ? r7.x : r7.y;
    r1.x = saturate(r1.x + r11.x);
    r13.xy = -r14.xy * r1.xx + r14.xy;
    ps = rsqrt(abs(r0.w));
    r4.w = saturate(r4.w - r0.x);
    r0.w = ps;
    ps = UniformScalar_5.x * r4.z;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r13.z = ps;
    ps = UniformScalar_5.x * r4.y;
    r6.xyz = r0.www * r2.xyz;
    r13.w = ps;
    ps = UniformScalar_5.x * r3.y;
    r2.yz = r13.wz * r3.xz;
    r0.w = ps;
    ps = r0.w;
    r18 = r10 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r4.x * ps;
    r1.zw = r1.yz + r18.zw;
    r2.x = ps;
    r10.xyz = r2.xyz + UniformScalar_6.xxx;
    r15.yz = r18.xy * r17.zw;
    r15 = r15.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r0.y = (r15.y == 0.0) ? r7.z : r0.y;
    ps = r15.z * r15.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r2.xyz = r0.www * r16.xyz + ModShadowColor.xyz;
    r14.w = (r15.x == 0.0) ? r7.w : r0.y;
    r0.y = max(r14.w, 0.0);
    ps = (-1.0) - -r0.x;
    r0.y = min(r0.y, 0.3);
    r1.y = ps;
    ps = 1.0 - r1.x;
    r0.xw = -r14.zw + 1.0;
    r3.w = ps;
    ps = 3.3333333 * r0.y;
    r10.xyz = r10.xyz * r3.www;
    r0.y = ps;
    r1 = r0.yyxy * r1.yzxw;
    ps = 2.5 * r0.w;
    r1.z = r14.z + r1.z;
    r3.w = ps;
    ps = r1.x;
    r8.xyz = r4.www * r8.xyz;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r1.xy = r13.xy + r1.yw;
    r4.w = ps;
    r11.xyz = r3.yxz * r4.xyz + r11.xyz;
    r1.xyz = -r12.xyz + r1.xyz;
    r0.y = saturate(r3.w * r4.w - 0.5);
    r1.xy = r1.xy * r0.yy + r12.xy;
    r0.x = r1.z * r0.y - 2.0;
    r3.xyz = r11.xyz - r8.xyz;
    r8.xyz = r3.xyz * r0.yyy + r8.xyz;
    r1.z = r6.w * 2.0 + r0.x;
    r1.xyz = r1.zxy * r2.www;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r2.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r2.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r3.xyz = r10.xyz * r0.yyy;
    r0.x = ps;
    r4.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r4.zxy, r9.zxy);
    r0.xyw = r4.xyz * r0.xxx;
    r0.xyw = r0.xyw * 2.0 - r9.xyz;
    r0.x = saturate(dot(r6.zxy, r0.wxy));
    ps = log2(r0.x);
    r1.yzw = r8.xyz * r7.xyz;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.z;
    r0.y = r0.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r4.zyx, r6.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r3.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r5.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r2.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
