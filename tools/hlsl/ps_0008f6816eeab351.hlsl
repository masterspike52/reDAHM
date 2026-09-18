// ps_0008f6816eeab351.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041800 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c20); // float3
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
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_9, r0.xy);
    ps = r1.x + r1.x;
    r7.zw = saturate(UniformVector_12.xy);
    r3.z = ps;
    ps = UniformScalar_4.x;
    r8.w = r1.x * UniformVector_2.x;
    ps = UniformScalar_5.x * ps;
    r12.y = -r1.y + 1.0;
    r14.y = ps;
    ps = r5.w;
    r10.xy = r1.xy * UniformVector_14.xy;
    ps = 0.0001 * ps;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r4.w = saturate(ps);
    ps = r5.w;
    r8.xy = r1.xy * UniformVector_1.xy;
    ps = (-2e+02) + ps;
    r1.w = r2.z + 0.1;
    r1.z = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r3.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r0.z = UniformScalar_3.x * UniformVector_4.x;
    r3.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = r3.xy * r1.xy;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xy = saturate(r1.wz * float2(5.0, 0.00022222222));
    r1.z = ps;
    ps = rsqrt(abs(r0.w));
    r7.xy = r1.xz * abs(r6.xy);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r9.xyz = r0.www * r4.xyz;
    r1.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r0.w = r3.y * (-0.1);
    r1.x = ps;
    r13.xy = r9.xy * r0.ww + r8.xy;
    ps = UniformScalar_5.x * r0.z;
    r4.xyz = r13.wyz * r1.zxz;
    r14.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r12.xw = -r4.yw + 1.0;
    r12.z = ps;
    ps = r16.w;
    r1.xzw = r12.zxy * UniformVector_2.xyy;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r8.z = r1.x * r13.x;
    r2.w = ps;
    ps = (-0.5) + r1.z;
    r6.zw = float2((r1.zw >= 0.5));
    r0.w = ps;
    ps = (-0.5) + r1.w;
    r14.zw = r6.zw + r6.zw;
    r0.z = ps;
    ps = r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    ps = -r1.z + ps;
    r5.xz = r8.zw - 0.5;
    r22.x = ps;
    ps = floor(r14.x);
    r8.xy = float2((r8.zw >= 0.5));
    r5.y = ps;
    ps = floor(r14.y);
    r5.xz = r5.xz - r8.zw;
    r5.w = ps;
    r5.xz = r5.xz * r8.xy + r8.zw;
    r5.yw = r5.yw * UniformVector_11.xy - r14.xy;
    ps = r0.z;
    r8.zw = r5.yw * r7.zw;
    ps = -r1.w + ps;
    r8 = r14 + r8.zwxy;
    r22.y = ps;
    r0.zw = r0.xy * UniformVector_13.xy + r8.xy;
    ps = 1.0 / UniformVector_10.x;
    r0.zw = r0.zw * UniformVector_8.xy;
    r6.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r22.zw = frac(r0.zw);
    r6.y = ps;
    ps = r1.y + r1.y;
    r6 = r22 * r6.zwxy;
    r3.w = ps;
    ps = ScreenPositionScaleBias.w + r4.z;
    r5.yw = r1.zw + r6.xy;
    r0.z = ps;
    ps = ScreenPositionScaleBias.z + r4.x;
    r1 = r5 + r5;
    r0.w = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r14 = tex2D(Texture2D_2, r11.xy).xywz;
    r20.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r19 = tex2D(Texture2D_3, r1.zw);
    r24 = tex2D(Texture2D_3, r1.xy);
    r10.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r17.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r13.xyz = tex2D(Texture2D_1, r11.xy).xyz;
    r4 = tex2D(Texture2D_6, r6.zw).xzyw;
    r0.xyz = tex2D(Texture2D_4, r3.zw).wxy;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = dot(r2.zxy, r2.zxy);
    r18.xyz = UniformVector_5.xyz * 2e+01;
    ps = (-1.0) + r0.x;
    r0.w = float((UniformScalar_12.x >= 1.0));
    r1.x = ps;
    ps = r4.x * r4.w;
    r2.w = float((UniformScalar_12.x > 1.0));
    r4.x = ps;
    r1.yz = r0.yz * 2.0 - 1.0;
    r15.xyz = r13.xyz * 2.0 - 1.0;
    r13.xyz = r5.xyw * 2.0 - 1.0;
    ps = r4.z * r4.w;
    r21.xyz = r17.xyz + r17.xyz;
    r4.z = ps;
    ps = r4.y * r4.w;
    r0.xyz = r16.xyz * UniformScalar_13.xxx;
    r4.w = ps;
    r10.xyz = (-abs(r2.www) >= 0.0) ? r10.xyz : 1.0;
    r17.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r10.xyz;
    r10.xyz = r0.xyz * r17.xyz + UniformScalar_14.xxx;
    r0.y = (r8.z == 0.0) ? r24.x : r24.y;
    r0.x = (r8.w == 0.0) ? r19.x : r19.y;
    ps = 1.0 - r3.x;
    r23 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r0.z = ps;
    r0.x = (r23.z == 0.0) ? r19.z : r0.x;
    r0.y = (r23.y == 0.0) ? r24.z : r0.y;
    r21.w = (r23.x == 0.0) ? r24.w : r0.y;
    r3.x = (r23.w == 0.0) ? r19.w : r0.x;
    ps = ModShadowGroupColor.x * r0.z;
    r0.y = max(r3.x, 0.0);
    r0.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r3.yz = float2((UniformVector_10.xy >= r22.zw));
    r0.w = ps;
    ps = r3.y * r3.z;
    r0.z = min(r0.y, 0.3);
    r3.y = ps;
    ps = 3.3333333 * r0.z;
    r19 = r21 + float4(-1.0, -1.0, -1.0, -0.75);
    r2.w = ps;
    ps = r19.w;
    r0.yz = float2((UniformVector_10.xy > r22.zw));
    ps = r21.w + ps;
    r3.y = r3.y * r0.z;
    r0.z = saturate(ps);
    ps = r3.y;
    r15.xzw = r15.zxy - r13.zxy;
    ps = r0.y * ps;
    r1.xyz = r2.www * r1.xyz;
    r0.y = ps;
    ps = 1.0 + r1.x;
    r5.xyz = r0.zzz * r20.xyz;
    r4.y = ps;
    ps = -r5.z;
    r3.yzw = r19.xyz * UniformVector_4.xyz;
    ps = r14.w + ps;
    r8.zw = -r5.xy + r14.xy;
    r15.y = ps;
    ps = r3.w;
    r4.xzw = r4.xzw * r0.yyy;
    r0.z = ps;
    r14.xy = r8.zw * r14.zz + r5.xy;
    ps = 1.0 - r0.z;
    r18.xyz = r18.xyz * r4.xzw;
    r4.w = ps;
    ps = 1.0 - r3.x;
    r15 = r15.zwxy * r14.zzzz;
    r4.x = ps;
    ps = 2.5 * r4.x;
    r13.w = r15.z - 2.0;
    r4.z = ps;
    ps = r5.z;
    r0.y = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    ps = r15.w + ps;
    r2.w = r0.y - r18.x;
    r14.z = ps;
    ps = rsqrt(abs(r1.w));
    r0.yz = r4.yz * r4.xy;
    r6.w = ps;
    ps = (-0.5) + r0.z;
    r5.xyz = r7.xyz * LightColor.xyz;
    r1.w = saturate(ps);
    ps = r2.w;
    r7.xyz = r6.www * r2.xyz;
    ps = r18.x + ps;
    r0.y = float((r0.y > 0.9));
    r0.z = saturate(ps);
    r4.z = r4.w * r0.z + r3.w;
    r2.xyz = r18.xyz * r0.yyy - r14.xyz;
    r3.xy = -r3.yz * r0.zz + r3.yz;
    r4.xy = r1.yz * 2.0 + r3.xy;
    r1.xyz = r17.xyz * r16.xyz + r2.xyz;
    ps = 1.0 - r0.z;
    r13.xyz = r13.xyz + r15.xyz;
    r3.x = ps;
    r2.xyz = r1.xyz * r1.www + r14.xyz;
    ps = 1.0 - r0.x;
    r1.xyz = -r13.xyz + r4.xyz;
    r3.y = ps;
    r4.xyz = r1.xyz * r1.www + r13.xyw;
    r4.w = r5.w * 2.0 + r4.z;
    ps = 1.0 - r0.w;
    r4.xyw = r4.xyw * r12.www;
    r3.z = ps;
    ps = r10.x;
    r4.z = r4.w + 1.0;
    r0.xyz = (r12.www > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r12.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = r3.x * ps;
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r2.xyz * r11.xyz;
    r0.x = ps;
    ps = r10.y;
    r4.xyz = r1.xyz * r0.xxx;
    ps = r3.x * ps;
    r0.x = dot(r4.zxy, r9.zxy);
    r0.z = ps;
    ps = r10.z;
    r1.xyz = r4.xyz * r0.xxx;
    r1.xyz = r1.xyz * 2.0 - r9.xyz;
    ps = r3.x * ps;
    r0.x = saturate(dot(r7.zxy, r1.zxy));
    r0.w = ps;
    ps = log2(r0.x);
    r1.xyz = r0.yzw * r1.www;
    r8.z = ps;
    r0.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r0.z);
    r0.w = saturate(dot(r4.zyx, r7.zyx));
    r0.z = ps;
    r0.xy = r0.xy * r3.yz + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r1.xzy * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.y = r2.z * r0.w + r1.y;
    r1.xz = r2.xy * r0.ww + r1.xz;
    r1.xyz = r5.xzy * r1.xyz;
    r0.xyz = r1.xyz * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
