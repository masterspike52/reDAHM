// ps_2a9a03661246e44f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 303 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004BC 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = -r1.y + 1.0;
    r8.z = ps;
    r3.zw = r1.xy * 6.0;
    r9.xy = r1.xy * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = r5.w - 4e+02;
    r8.w = ps;
    ps = r2.z;
    r10.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r8.xy = r7.xy * r1.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r2.w));
    r1.w = r17.w - 0.5;
    r2.w = ps;
    ps = 5.0 * r0.w;
    r7.xyz = r2.www * r4.xyz;
    r0.w = saturate(ps);
    ps = 0.00022222222 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r0.z = saturate(ps);
    ps = (-0.025) * r0.z;
    r4.x = r1.x * UniformVector_2.x;
    r1.w = ps;
    ps = UniformVector_2.y * r1.z;
    r4.zw = r7.xy * r1.ww;
    r4.y = ps;
    r1.zw = r4.xy - 0.5;
    r9.zw = float2((r4.xy >= 0.5));
    ps = r8.z;
    r1.zw = r1.zw - r4.xy;
    ps = abs(r6.x) * ps;
    r10.zw = r1.zw * r9.zw;
    r1.z = ps;
    ps = r8.w;
    r4 = r4.zwxy + r10;
    ps = abs(r6.y) * ps;
    r8.zw = r4.zw + r4.zw;
    r1.w = ps;
    r12.xyz = tex2D(Texture2D_5, r4.xy).xyz;
    r14.yzw = tex2D(Texture2D_7, r9.xy).xyz;
    r1.zw = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r18 = tex2D(Texture2D_1, r8.zw);
    r10.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r11.xyw = tex2D(Texture2D_2, r3.zw).xwy;
    r8.xzw = tex2D(Texture2D_2, r1.xy).wxy;
    ps = 0.0001 * r5.w;
    r3.xy = r0.xy * UniformScalar_0.xx;
    r8.y = saturate(ps);
    r3.xyz = tex2D(Texture2D_3, r3.xy).wxy;
    r6.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    ps = -UniformVector_0.x;
    r5.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = 1.0 + ps;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = ps;
    ps = -UniformVector_0.y;
    r0.x = dot(r2.zxy, r2.zxy);
    r6.xyz = r6.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r8.x = r11.y * r8.x - 1.0;
    ps = 1.0 + ps;
    r16.zw = r3.yz + r3.yz;
    r9.y = ps;
    ps = r11.x + r11.x;
    r4.xyz = r4.xyz * LightColor.xyz;
    r16.x = ps;
    r15.xyz = r15.xyz * 2.0 - 1.0;
    r11.xyz = r10.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r17.xyz = r5.xyz * r17.xyz;
    r0.x = ps;
    ps = r11.w + r11.w;
    r5.xyz = r0.xxx * r2.xyz;
    r16.y = ps;
    r2.w = r15.z * UniformVector_4.z - r11.z;
    ps = r8.z + r8.z;
    r16 = r16 - 1.0;
    r2.y = ps;
    ps = r8.w + r8.w;
    r2.x = dot(r9.zww, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r0.x = (r2.x == 0.0) ? r18.x : r18.y;
    ps = (-1.0) + r3.x;
    r19 = r2.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r14.x = ps;
    r3.zw = r16.xy * 0.5 + r19.zw;
    r0.x = (r19.y == 0.0) ? r18.z : r0.x;
    r0.x = (r19.x == 0.0) ? r18.w : r0.x;
    ps = 1.0 - r0.x;
    r0.y = max(r0.x, 0.0);
    r0.x = ps;
    ps = 1.0 - r0.w;
    r1.y = min(r0.y, 0.3);
    r0.y = ps;
    ps = 2.5 * r0.x;
    r8.zw = r0.yy * ModShadowGroupColor.xy;
    r13.w = ps;
    ps = 3.3333333 * r1.y;
    r2.xyz = r17.xyz * r14.yzw;
    r14.y = ps;
    ps = 0.875 * r1.z;
    r8.yzw = -r8.wzy + 1.0;
    r14.z = ps;
    ps = 0.875 * r1.w;
    r0.x = r8.w * UniformScalar_1.x;
    r14.w = ps;
    r1.xy = r0.xx * r16.zw + r15.xy;
    r0 = r14 * r8.wxzy + float4(1.0, 1.0, 0.125, 0.125);
    r3.xy = r1.xy * UniformVector_4.xy - r11.xy;
    ps = abs(r0.y) * abs(r0.y);
    r1.x = r0.z * r0.w;
    r1.w = ps;
    r1.xyz = r1.xxx * r13.xyz + ModShadowColor.xyz;
    r3.yz = r14.yy * r3.zw + r3.xy;
    ps = r1.w * r1.w;
    r13.xyz = r2.xyz * r0.xxx;
    r3.x = ps;
    r3.w = saturate(r13.w * r0.y - 0.5);
    r2.xyz = r13.xyz * r0.yyy - r12.xyz;
    r0.z = r2.w * r3.w - 2.0;
    r10.xyz = r2.xyz * r3.www + r12.xyz;
    ps = -UniformVector_0.z;
    r2.xyw = r3.yzx * r3.wwx;
    ps = 1.0 + ps;
    r0.xy = r11.xy + r2.xy;
    r9.z = ps;
    r0.z = r10.w * 2.0 + r0.z;
    r0.xyz = r0.zxy * r8.www;
    ps = 1.0 + r0.x;
    r2.xyz = r10.xyz * r9.xyz;
    r0.w = ps;
    r0.xyz = (r8.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r8.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r6.xyz = r2.www * r6.xyz;
    r0.x = ps;
    r0.yzw = r0.yzw * r0.xxx;
    r0.x = dot(r0.wyz, r7.zxy);
    r8.xyz = r0.yzw * r0.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r0.x = saturate(dot(r5.zxy, r7.zxy));
    ps = log2(r0.x);
    r3.xyz = r6.xyz * r3.www;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r0.wzy, r5.zyx));
    r0.x = ps;
    r0.xyz = r3.xyz * r0.xxx;
    r0.xy = r2.xy * r0.ww + r0.xy;
    r0.z = r2.z * r0.w + r0.z;
    r0.xyz = r4.xyz * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
