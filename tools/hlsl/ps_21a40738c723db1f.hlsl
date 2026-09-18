// ps_21a40738c723db1f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041100 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
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

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = -r1.y + 1.0;
    r11.x = ps;
    r8.xy = r1.xy * 6.0;
    r8.zw = r1.xy * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = r2.z + 0.1;
    r11.y = ps;
    ps = r5.w;
    r10.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r9.zw = r7.xy * r1.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r2.w));
    r1.w = r14.w - 0.5;
    r2.w = ps;
    ps = 0.00022222222 * r0.w;
    r7.xyz = r2.www * r4.xyz;
    r4.x = saturate(ps);
    ps = 5.0 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r4.y = saturate(ps);
    ps = (-0.025) * r4.x;
    r12.x = r1.x * UniformVector_2.x;
    r0.z = ps;
    ps = UniformVector_2.y * r1.z;
    r12.zw = r7.xy * r0.zz;
    r12.y = ps;
    r0.zw = r12.xy - 0.5;
    r4.zw = float2((r12.xy >= 0.5));
    ps = r11.x;
    r0.zw = r0.zw - r12.xy;
    ps = abs(r6.x) * ps;
    r10.zw = r0.zw * r4.zw;
    r0.z = ps;
    ps = r11.y;
    r10 = r12.zwxy + r10;
    ps = abs(r6.y) * ps;
    r1.zw = r10.zw + r10.zw;
    r0.w = ps;
    r6.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r12.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r8.zw).xyz;
    r0.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r15 = tex2D(Texture2D_1, r1.zw);
    r10.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r8.xy).xyw;
    r8.xzw = tex2D(Texture2D_2, r1.xy).wxy;
    ps = 0.0001 * r5.w;
    r9.xy = r0.xy * UniformScalar_0.xx;
    r8.y = saturate(ps);
    r1.xyw = tex2D(Texture2D_3, r9.xy).xyw;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = -ModShadowColor.x;
    r1.z = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = -ModShadowColor.y;
    r3.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = 1.0 + ps;
    r14.xyz = r3.xyz * r14.xyz;
    r5.y = ps;
    r8.x = r16.z * r8.x - 1.0;
    ps = 1.0 - r0.x;
    r16.xy = r16.xy + r16.xy;
    r0.x = saturate(ps);
    r3.xyw = r11.xzy * 2.0 - 1.0;
    r11.xyz = r10.xyw * 2.0 - 1.0;
    r13.w = r3.y * UniformVector_4.z - r11.z;
    ps = log2(r0.x);
    r16.zw = r1.xy + r1.xy;
    r0.x = ps;
    ps = r8.z + r8.z;
    r16 = r16 - 1.0;
    r17.y = ps;
    ps = r8.w + r8.w;
    r17.x = dot(r4.zww, float3(1.0, 1.0, 1.0));
    r17.z = ps;
    r0.y = (r17.x == 0.0) ? r15.x : r15.y;
    ps = -ModShadowColor.z;
    r17 = r17.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r3.yz = r16.xy * 0.5 + r17.zw;
    r0.y = (r17.y == 0.0) ? r15.z : r0.y;
    r4.z = (r17.x == 0.0) ? r15.w : r0.y;
    ps = 1.0 + ps;
    r0.y = max(r4.z, 0.0);
    r5.z = ps;
    ps = (-1.0) + r1.w;
    r1.xy = -r4.zy + 1.0;
    r15.w = ps;
    ps = 2.5 * r1.x;
    r0.y = min(r0.y, 0.3);
    r14.w = ps;
    ps = rsqrt(abs(r1.z));
    r8.zw = r1.yy * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = 3.3333333 * r0.y;
    r4.xyz = r1.xxx * r2.xyz;
    r15.x = ps;
    ps = 0.875 * r0.z;
    r8.yzw = -r8.wzy + 1.0;
    r15.y = ps;
    ps = 0.875 * r0.w;
    r1.x = r8.w * UniformScalar_1.x;
    r15.z = ps;
    r2.xy = r1.xx * r16.zw + r3.xw;
    r1 = r15 * r8.xzyw + float4(1.0, 0.125, 0.125, 1.0);
    ps = abs(r1.x) * abs(r1.x);
    r0.yzw = r14.xyz * r13.xyz;
    r3.x = ps;
    r2.xy = r2.xy * UniformVector_4.xy - r11.xy;
    ps = r1.y * r1.z;
    r14.xyz = r0.yzw * r1.www;
    r0.y = ps;
    r0.yzw = r0.yyy * r5.xyz + ModShadowColor.xyz;
    r5.xyz = r14.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r3.yz = r15.xx * r3.yz + r2.xy;
    r3.w = saturate(r14.w * r1.x - 0.5);
    r13.xyz = r14.xyz * r1.xxx - r12.xyz;
    r1.z = r13.w * r3.w - 2.0;
    r10.xyz = r13.xyz * r3.www + r12.xyz;
    r2.xyw = r3.yzx * r3.wwx;
    r1.xy = r11.xy + r2.xy;
    r1.z = r10.w * 2.0 + r1.z;
    r1.xyz = r1.zxy * r8.www;
    ps = 1.0 + r1.x;
    r2.xyz = r10.xyz * r9.xyz;
    r1.w = ps;
    r1.xyz = (r8.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.yzw = (r8.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.w * r2.w;
    r1.x = dot(r1.wyz, r1.wyz);
    r2.w = ps;
    ps = rsqrt(abs(r1.x));
    r5.xyz = r2.www * r5.xyz;
    r1.x = ps;
    r1.yzw = r1.yzw * r1.xxx;
    r1.x = dot(r1.wyz, r7.zxy);
    r8.xyz = r1.yzw * r1.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r1.x = saturate(dot(r4.zxy, r7.zxy));
    ps = log2(r1.x);
    r3.xyz = r5.xyz * r3.www;
    r1.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.x = r1.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r1.x);
    r1.w = saturate(dot(r1.wzy, r4.zyx));
    r1.x = ps;
    ps = pow(2.0, r0.x);
    r1.xyz = r3.xyz * r1.xxx;
    r0.x = ps;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.xxx;
    r1.xyz = r1.xyz * r6.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.ywz;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
