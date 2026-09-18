// ps_7a18fd0a964fcf33.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041700 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_9, r0.xy);
    ps = r1.x + r1.x;
    r9.zw = saturate(UniformVector_12.xy);
    r7.z = ps;
    ps = UniformScalar_4.x;
    r13.y = r1.x * UniformVector_2.x;
    ps = UniformScalar_5.x * ps;
    r12.y = -r1.y + 1.0;
    r14.y = ps;
    ps = r5.w;
    r10.xy = r1.xy * UniformVector_14.xy;
    ps = 0.0001 * ps;
    r8.zw = r5.xy * ScreenPositionScaleBias.xy;
    r4.w = saturate(ps);
    ps = r5.w;
    r8.xy = r1.xy * UniformVector_1.xy;
    ps = (-2e+02) + ps;
    r1.w = r2.z + 0.1;
    r1.z = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r0.z = UniformScalar_3.x * UniformVector_4.x;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r5.xy * r1.xy;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = saturate(r1.wz * float2(5.0, 0.00022222222));
    r1.z = ps;
    ps = rsqrt(abs(r0.w));
    r10.zw = r1.xz * abs(r6.xy);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r11.xyz = r0.www * r4.xyz;
    r1.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r0.w = r5.y * (-0.1);
    r1.x = ps;
    r8.xy = r11.xy * r0.ww + r8.xy;
    ps = UniformScalar_5.x * r0.z;
    r4.xyz = r8.wyz * r1.zxz;
    r14.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r12.xw = -r4.yw + 1.0;
    r12.z = ps;
    ps = r15.w;
    r1.xzw = r12.zxy * UniformVector_2.xyy;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r13.x = r1.x * r8.x;
    r2.w = ps;
    ps = (-0.5) + r1.z;
    r13.zw = float2((r1.zw >= 0.5));
    r0.w = ps;
    ps = (-0.5) + r1.w;
    r14.zw = r13.zw + r13.zw;
    r0.z = ps;
    ps = r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    ps = -r1.z + ps;
    r6.xy = r13.xy - 0.5;
    r21.x = ps;
    ps = floor(r14.x);
    r9.xy = float2((r13.xy >= 0.5));
    r5.z = ps;
    ps = floor(r14.y);
    r6.xy = r6.xy - r13.xy;
    r5.w = ps;
    r6.xz = r6.xy * r9.xy + r13.xy;
    r5.zw = r5.zw * UniformVector_11.xy - r14.xy;
    ps = r0.z;
    r9.zw = r5.zw * r9.zw;
    ps = -r1.w + ps;
    r9 = r14 + r9.zwxy;
    r21.y = ps;
    r0.zw = r0.xy * UniformVector_13.xy + r9.xy;
    ps = 1.0 / UniformVector_10.x;
    r0.zw = r0.zw * UniformVector_8.xy;
    r13.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r21.zw = frac(r0.zw);
    r13.y = ps;
    ps = r1.y + r1.y;
    r14 = r21 * r13.zwxy;
    r7.w = ps;
    ps = ScreenPositionScaleBias.w + r4.z;
    r6.yw = r1.zw + r14.xy;
    r0.z = ps;
    ps = ScreenPositionScaleBias.z + r4.x;
    r16 = r6 + r6;
    r0.w = ps;
    r6.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r10.zw).xy;
    r13 = tex2D(Texture2D_2, r7.xy);
    r1.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r14 = tex2D(Texture2D_6, r14.zw);
    r4.xzw = tex2D(Texture2D_5, r0.xy).xyz;
    r22 = tex2D(Texture2D_3, r16.zw);
    r23 = tex2D(Texture2D_3, r16.xy);
    r10.yzw = tex2D(Texture2D_8, r10.xy).xyz;
    r0.yzw = tex2D(Texture2D_4, r7.zw).wxy;
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r16.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = -UniformVector_0.x;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r2.w = float((UniformScalar_12.x >= 1.0));
    r10.x = ps;
    r17.xyz = r16.xyz * 2.0 - 1.0;
    r18.xyz = r8.xyw * 2.0 - 1.0;
    ps = (-1.0) + r0.y;
    r0.x = dot(r3.zxy, r3.zxy);
    r20.x = ps;
    r20.yz = r0.zw * 2.0 - 1.0;
    ps = 1.0 - r0.x;
    r0.z = float((UniformScalar_12.x > 1.0));
    r0.y = saturate(ps);
    r0.xzw = (-abs(r0.zzz) >= 0.0) ? r10.yzw : 1.0;
    r16.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r0.xzw;
    ps = log2(r0.y);
    r0.xzw = r15.xyz * UniformScalar_13.xxx;
    r0.y = ps;
    r10.yzw = r0.xzw * r16.xyz + UniformScalar_14.xxx;
    ps = 1.0 - r5.x;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r0.z = ps;
    r2.w = (r9.z == 0.0) ? r23.x : r23.y;
    r0.x = (r9.w == 0.0) ? r22.x : r22.y;
    ps = ModShadowGroupColor.x * r0.z;
    r3 = r9.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r0.w = ps;
    r0.x = (r3.z == 0.0) ? r22.z : r0.x;
    r2.w = (r3.y == 0.0) ? r23.z : r2.w;
    r5.x = (r3.x == 0.0) ? r23.w : r2.w;
    r4.y = (r3.w == 0.0) ? r22.w : r0.x;
    ps = r4.y;
    r5.yzw = r4.xzw + r4.xzw;
    r4.x = ps;
    ps = 0.0;
    r3.xw = float2((UniformVector_10.yx > r21.wz));
    r4.z = ps;
    ps = max(r4.x, r4.z);
    r3.yz = float2((UniformVector_10.xy >= r21.zw));
    r0.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.x = min(r0.x, 0.3);
    r0.z = ps;
    ps = r3.y * r3.z;
    r21 = r5 + float4(-0.75, -1.0, -1.0, -1.0);
    r2.w = ps;
    ps = 3.3333333 * r0.x;
    r2.w = r2.w * r3.x;
    r0.x = ps;
    ps = r21.x;
    r14.xyz = r14.xyz * r14.www;
    ps = r5.x + ps;
    r4.xzw = r21.wyz * UniformVector_4.zxy;
    r3.y = saturate(ps);
    ps = r2.w;
    r1.xyz = r3.yyy * r1.xzy;
    ps = r3.w * ps;
    r3.xyz = r0.xxx * r20.xyz;
    r2.w = ps;
    ps = 1.0 + r3.x;
    r20.y = -r1.y + r13.z;
    r5.y = ps;
    ps = r4.y;
    r20.xzw = r17.zxy - r18.zxy;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r9.zw = -r1.xz + r13.xy;
    r5.x = ps;
    ps = 1.0 - r4.x;
    r17.xyz = r14.xyz * r2.www;
    r5.w = ps;
    r14.xy = r9.zw * r13.ww + r1.xz;
    ps = 2.5 * r5.x;
    r13 = r20.zwxy * r13.wwww;
    r5.z = ps;
    ps = r13.z;
    r17.xyz = r19.xyz * r17.xyz;
    r1.x = ps;
    ps = r1.y;
    r0.x = dot(r17.zxy, float3(0.11, 0.3, 0.59));
    ps = r13.w + ps;
    r0.x = r0.x - r17.x;
    r14.z = ps;
    ps = rsqrt(abs(r1.w));
    r1.yz = r5.yz * r5.xy;
    r1.w = ps;
    ps = (-0.5) + r1.z;
    r8.xyz = r1.www * r2.xyz;
    r1.w = saturate(ps);
    ps = r0.x;
    r13.xyz = r18.xyz + r13.xyz;
    ps = r17.x + ps;
    r1.y = float((r1.y > 0.9));
    r0.x = saturate(ps);
    r5.z = r5.w * r0.x + r4.x;
    r2.xyz = r17.xyz * r1.yyy - r14.xyz;
    r1.yz = -r4.zw * r0.xx + r4.zw;
    r5.xy = r3.yz * 2.0 + r1.yz;
    r2.xyz = r16.xyz * r15.xyz + r2.xyz;
    r2.xyz = r2.xyz * r1.www + r14.xyz;
    ps = (-2.0) + r1.x;
    r3.xyz = -r13.xyz + r5.xyz;
    r13.w = ps;
    r3.xyz = r3.xyz * r1.www + r13.xyw;
    r3.w = r8.w * 2.0 + r3.z;
    ps = 1.0 - r0.x;
    r3.xyw = r3.xyw * r12.www;
    r4.x = ps;
    ps = 1.0 - r0.w;
    r3.z = r3.w + 1.0;
    r4.y = ps;
    r1.xyz = (r12.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r12.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r0.z;
    r2.w = dot(r3.zxy, r3.zxy);
    r4.z = ps;
    ps = rsqrt(abs(r2.w));
    r1.xyz = r10.yzw * r4.xxx;
    r0.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r3.xyz * r0.xxx;
    ps = 1.0 + ps;
    r0.x = dot(r3.zxy, r11.zxy);
    r10.y = ps;
    ps = -UniformVector_0.z;
    r0.xzw = r3.xyz * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r0.x = saturate(dot(r8.zxy, r0.wxz));
    r10.z = ps;
    ps = log2(r0.x);
    r2.xyz = r2.xyz * r10.xyz;
    r9.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.xzw = r9.xzy * float3(0.875, 15.0, 0.875);
    r0.y = ps;
    ps = pow(2.0, r0.z);
    r1.xyz = r1.xyz * r1.www;
    r0.z = ps;
    r0.xw = r0.xw * r4.yz + 0.125;
    ps = r0.x * r0.w;
    r1.w = saturate(dot(r3.zyx, r8.zyx));
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.zzz;
    r0.w = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r6.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
