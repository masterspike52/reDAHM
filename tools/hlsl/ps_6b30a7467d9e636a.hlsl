// ps_6b30a7467d9e636a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 384 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000600 10041700 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_8, r0.xy);
    ps = r5.w;
    r3.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r1.z = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r1.z));
    r1.w = r9.w - 0.5;
    r1.z = ps;
    ps = 0.1 - -r2.z;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r0.w = ps;
    ps = 5.0 * r0.w;
    r8.xyz = r1.zzz * r4.xyz;
    r1.z = saturate(ps);
    ps = 0.00022222222 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r1.w = saturate(ps);
    ps = (-0.025) * r1.w;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r10.xy = r8.xy * r0.zz + r3.xy;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r14.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r1.xy * 6.0;
    r3.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r3.xy = r1.xy * UniformVector_7.xy;
    r11.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r11.y = -r1.y + 1.0;
    r2.w = ps;
    ps = 1.0 / r5.w;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r3.w = ps;
    r7.xy = r10.zw * r3.ww + ScreenPositionScaleBias.wz;
    r11.x = -r10.y * r2.w + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.yzw = r11.yxz * UniformVector_2.yyx;
    r3.w = ps;
    ps = r14.w;
    r3.zw = r3.zw * abs(r6.xy);
    ps = r10.x * ps;
    r6.xyz = r14.zxy - 0.5;
    r11.w = ps;
    ps = r4.x + r4.x;
    r13.x = float((r11.w >= 0.5));
    r11.x = ps;
    ps = r4.y + r4.y;
    r19.xyz = float3((r14.xzy >= 0.5));
    r11.y = ps;
    ps = r4.w + r4.w;
    r6.xyz = r6.xzy - r14.zyx;
    r11.z = ps;
    r12 = r11 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.yzw = r6.xzy * r19.yxz + r14.zxy;
    r2.w = r12.w - r11.w;
    r6.x = r2.w * r13.x + r11.w;
    r6 = r6.zwxy + r6.zwxy;
    r14.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r20 = tex2D(Texture2D_1, r6.zw);
    r18 = tex2D(Texture2D_1, r6.xy);
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r15.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r23 = tex2D(Texture2D_4, r0.xy);
    r21 = tex2D(Texture2D_5, r0.xy);
    r10.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r3.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyw = tex2D(Texture2D_2, r0.zw).wxy;
    r4.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r0.z = r0.x * r4.z;
    r1.x = dot(r2.zxy, r2.zxy);
    r16.xyz = UniformVector_6.xzy * 2e+01;
    r1.y = float((UniformScalar_8.x >= UniformScalar_1.x));
    r0.x = float((UniformScalar_11.x > 1.0));
    r6.xy = r4.xy * 2.0 - 1.0;
    r15.zw = r0.yw * 2.0 - 1.0;
    r3.xyz = r3.xyz * 2.0 - 1.0;
    r10.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : 1.0;
    r2.w = float((UniformScalar_11.x >= 1.0));
    ps = r21.x * r21.w;
    r11.xyz = r9.xyz * UniformScalar_12.xxx;
    r13.y = ps;
    ps = r21.z * r21.w;
    r0.xyw = r23.xzy * r23.www;
    r13.z = ps;
    ps = r21.y * r21.w;
    r0.xyw = r22.xyz * r0.xyw;
    r13.w = ps;
    r13.yzw = r16.xyz * r13.yzw;
    r10.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r10.xyz;
    r3.xzw = r3.zxy * UniformVector_4.zxy;
    r16.xyz = r11.xyz * r10.xyz + UniformScalar_13.xxx;
    r11.xyz = (abs(r1.yyy) > 0.0) ? r0.xwy : r13.ywz;
    r0.xyw = (-abs(r1.yyy) >= 0.0) ? r13.zyw : r0.yxw;
    r21 = r15 * float4(0.875, 0.875, 0.5, 0.5);
    ps = rsqrt(abs(r1.x));
    r15.yz = r6.xy + r21.zw;
    r1.x = ps;
    r6.xyz = r1.xxx * r2.xyz;
    r15.w = saturate(dot(r0.wxy, float3(0.59, 0.11, 0.3)));
    r0.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r0.x = r0.x - r11.x;
    ps = r5.w;
    r1.x = saturate(r0.x + r11.x);
    ps = 0.0001 * ps;
    r1.xz = -r1.xz + 1.0;
    r0.w = saturate(ps);
    ps = ModShadowGroupColor.x * r1.z;
    r13.zw = -r3.zw * r15.ww;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r1.z;
    r13.y = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    r2.xyw = -r0.xyw + 1.0;
    ps = r19.y + r19.y;
    r5.xy = r21.xy * r2.xy;
    r3.y = ps;
    r0.x = (r13.y == 0.0) ? r18.x : r18.y;
    ps = (-1.0) - -r0.z;
    r13.xzw = r3.yzw + r13.xzw;
    r15.x = ps;
    r0.y = (r13.x == 0.0) ? r20.x : r20.y;
    ps = 1.0 - r3.x;
    r19 = r13.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r1.y = ps;
    r0.x = (r19.z == 0.0) ? r18.z : r0.x;
    r0.y = (r19.y == 0.0) ? r20.z : r0.y;
    r5.z = (r19.x == 0.0) ? r20.w : r0.y;
    r0.x = (r19.w == 0.0) ? r18.w : r0.x;
    ps = 1.0 - r0.x;
    r0.y = max(r0.x, 0.0);
    r0.w = ps;
    ps = 2.5 * r0.w;
    r0.y = min(r0.y, 0.3);
    r0.x = ps;
    ps = 3.3333333 * r0.y;
    r2.xyz = r5.xyz + float3(0.125, 0.125, 0.25);
    r1.w = ps;
    ps = r2.x * r2.y;
    r0.y = r2.z + r5.z;
    r2.z = ps;
    r2.xyz = r2.zzz * r17.xyz + ModShadowColor.xyz;
    ps = r0.y;
    r4.xyz = r16.xyz * r1.xxx;
    ps = -r0.z + ps;
    r5 = r1.ywww * r15.wxyz;
    r0.y = saturate(ps);
    ps = r3.x;
    r1.xyz = r0.yyy * r14.xyz;
    ps = r5.x + ps;
    r0.y = r5.y + 1.0;
    r3.z = ps;
    ps = r0.y * r0.w;
    r3.xy = r13.zw + r5.zw;
    r0.z = ps;
    ps = r0.x * r0.y;
    r3.xyw = -r12.xyz + r3.xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r0.z = float((r0.z > 0.9));
    r1.w = saturate(ps);
    r0.xy = r3.xy * r1.ww + r12.xy;
    r3.xyz = r0.zzz * r11.xyz - r1.xyz;
    r0.z = r3.w * r1.w - 2.0;
    r0.z = r4.w * 2.0 + r0.z;
    r3.xyz = r10.xyz * r9.xyz + r3.xyz;
    r3.xyz = r3.xyz * r1.www + r1.xyz;
    r0.xyz = r0.zxy * r2.www;
    ps = 1.0 + r0.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r0.xyz = (r2.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r2.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r4.xyz = r4.xyz * r1.www;
    r0.x = ps;
    r0.yzw = r0.yzw * r0.xxx;
    r0.x = dot(r0.wyz, r8.zxy);
    r5.xyz = r0.yzw * r0.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r0.x = saturate(dot(r6.zxy, r5.zxy));
    ps = log2(r0.x);
    r3.xyz = r3.xyz * r1.xyz;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r1.xyz = r7.xyz * LightColor.xyz;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r0.wzy, r6.zyx));
    r0.x = ps;
    r0.xyz = r4.xyz * r0.xxx;
    r0.xy = r3.xy * r0.ww + r0.xy;
    r0.z = r3.z * r0.w + r0.z;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xzy * r2.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
