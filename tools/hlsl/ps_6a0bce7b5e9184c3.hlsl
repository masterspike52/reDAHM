// ps_6a0bce7b5e9184c3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_7, r0.xy);
    ps = r2.z;
    r7.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r1.z = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r1.z));
    r1.w = r11.w - 0.5;
    r1.z = ps;
    ps = (-4e+02) - -r5.w;
    r7.zw = r1.xy * UniformVector_7.xy;
    r0.w = ps;
    ps = 0.00022222222 * r0.w;
    r9.xyz = r1.zzz * r4.xyz;
    r1.z = saturate(ps);
    ps = 5.0 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r1.w = saturate(ps);
    ps = (-0.025) * r1.z;
    r20.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r8.zw = r9.xy * r0.zz + r7.xy;
    r4.xyw = tex2D(Texture2D_0, r8.zw).xyz;
    ps = r1.x;
    r7.xy = r1.xy * 6.0;
    ps = UniformVector_2.x * ps;
    r12.z = -r1.y + 1.0;
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = r5.xy * ScreenPositionScaleBias.xy;
    r12.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r12.w = ps;
    ps = rsqrt(abs(r0.z));
    r10.xyz = r4.xyw + r4.xyw;
    r0.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r13.xyz = r0.www * -SpotDirection.xyz;
    r2.w = ps;
    ps = 1.0 / r5.w;
    r0.w = dot(r13.zxy, r3.zxy);
    r3.x = ps;
    r13.xy = r8.xy * r3.xx + ScreenPositionScaleBias.wz;
    r12.y = -r8.w * r2.w + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.yzw = r12.zyw * UniformVector_2.yyx;
    r12.y = ps;
    ps = r14.w;
    r3.yz = r12.xy * abs(r6.xy);
    ps = r8.z * ps;
    r6.xyz = r14.zxy - 0.5;
    r10.w = ps;
    r21.z = float((r10.w >= 0.5));
    r4.xyz = float3((r14.xzy >= 0.5));
    r6.xyz = r6.xzy - r14.zyx;
    ps = -SpotAngles.x - -r0.w;
    r12 = r10 + float4(-1.0, -1.0, -1.0, -0.5);
    r0.w = ps;
    r6.yzw = r6.xzy * r4.yxz + r14.zxy;
    ps = SpotAngles.y * r0.w;
    r21.x = r12.w - r10.w;
    r21.y = saturate(ps);
    r3.xw = r21.xy * r21.zy;
    r6.x = r10.w + r3.x;
    r10 = r6.zwxy + r6.zwxy;
    r6.xyz = tex2D(LightAttenuationTexture, r13.xy).xyz;
    r8.xyz = tex2D(Texture2D_6, r8.zw).xyz;
    r18 = tex2D(Texture2D_1, r10.xy);
    r19 = tex2D(Texture2D_1, r10.zw);
    r13.xy = tex2D(ModShadowAccumTexture, r3.yz).xy;
    r16 = tex2D(Texture2D_5, r0.xy);
    r15.xyw = tex2D(Texture2D_8, r7.zw).xyz;
    r10 = tex2D(Texture2D_4, r0.xy).xzyw;
    r0.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r7.xy).xyw;
    r3.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r14.xyz = UniformVector_5.xzy * 2e+01;
    r1.x = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r2.w = ps;
    ps = r5.w;
    r6.w = float((UniformScalar_8.x >= 1.0));
    ps = 0.0001 * ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r1.y = saturate(ps);
    ps = r3.x + r3.x;
    r5.y = float((UniformScalar_8.x > 1.0));
    r15.z = ps;
    r13.zw = r7.xy * 2.0 - 1.0;
    ps = 1.0 - r0.z;
    r17.xyz = r0.xyw + r0.xyw;
    r0.x = saturate(ps);
    ps = r10.x * r10.w;
    r0.yw = r11.yz * UniformScalar_9.xx;
    r10.x = ps;
    r15.xyw = (-abs(r5.yyy) >= 0.0) ? r15.xyw : 1.0;
    ps = rsqrt(abs(r5.x));
    r16.xyz = r16.xzy * r16.www;
    r0.z = ps;
    ps = r10.y * r10.w;
    r5.xyz = r0.zzz * r2.xyz;
    r10.y = ps;
    ps = r10.z * r10.w;
    r16.xyz = r22.xyz * r16.xyz;
    r10.z = ps;
    r2.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r15.yxw;
    ps = log2(r0.x);
    r10.xyz = r14.xyz * r10.xyz;
    r0.x = ps;
    ps = r3.y + r3.y;
    r14 = r13 * float4(0.875, 0.875, 0.5, 0.5);
    r15.w = ps;
    r13.xyz = (-abs(r2.www) >= 0.0) ? r16.yxz : r10.yxz;
    r10.xyz = (abs(r2.www) > 0.0) ? r10.xzy : r16.xzy;
    r10.xyz = (abs(r1.xxx) > 0.0) ? r10.xyz : r16.xzy;
    r13.xyz = (-abs(r1.xxx) >= 0.0) ? r16.yxz : r13.xyz;
    ps = r7.z;
    r13.w = saturate(dot(r13.zxy, float3(0.59, 0.11, 0.3)));
    ps = r3.z * ps;
    r1.x = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r0.z = ps;
    ps = (-1.0) - -r0.z;
    r1.x = r1.x - r10.x;
    r13.x = ps;
    ps = r0.y;
    r1.x = saturate(r1.x + r10.x);
    ps = r2.x * ps;
    r7.xyw = -r1.wxy + 1.0;
    r16.y = ps;
    r1.xy = -r7.xx * ModShadowGroupColor.xy + 1.0;
    ps = r0.w;
    r15.xy = r14.xy * r1.xy;
    ps = r2.z * ps;
    r1.y = dot(r4.xzz, float3(1.0, 1.0, 1.0));
    r16.z = ps;
    r1.x = r4.y * 2.0 + r21.z;
    r0.w = (r1.x == 0.0) ? r19.x : r19.y;
    r0.y = (r1.y == 0.0) ? r18.x : r18.y;
    ps = UniformScalar_9.x * r2.y;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r2.w = ps;
    ps = r2.w;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r0.y = (r1.z == 0.0) ? r18.z : r0.y;
    r0.w = (r1.y == 0.0) ? r19.z : r0.w;
    ps = r11.x * ps;
    r2.w = r15.x * r15.y;
    r16.x = ps;
    r4.xyz = r2.www * r20.xyz + ModShadowColor.xyz;
    r17.w = (r1.x == 0.0) ? r19.w : r0.w;
    r0.w = (r1.w == 0.0) ? r18.w : r0.y;
    ps = 1.0 - r0.w;
    r0.y = max(r0.w, 0.0);
    r3.x = ps;
    ps = 2.5 * r3.x;
    r0.y = min(r0.y, 0.3);
    r3.z = ps;
    ps = 3.3333333 * r0.y;
    r1 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r14.y = ps;
    ps = r1.w;
    r16.xyz = r16.xyz + UniformScalar_10.xxx;
    ps = r17.w + ps;
    r1.xyz = r1.zxy * UniformVector_4.zxy;
    r1.w = ps;
    r0.yw = -r1.yz * r13.ww + r1.yz;
    ps = 1.0 - r1.x;
    r7.xyz = r16.xyz * r7.yyy;
    r14.x = ps;
    ps = r1.w;
    r13.yz = r15.zw + r14.zw;
    ps = -r0.z + ps;
    r13 = r14.xyyy * r13.wxyz;
    r0.z = saturate(ps);
    ps = r1.x;
    r8.xyz = r0.zzz * r8.xyz;
    ps = r13.x + ps;
    r3.y = r13.y + 1.0;
    r1.z = ps;
    ps = r3.y * r3.x;
    r1.xy = r0.yw + r13.zw;
    r0.z = ps;
    ps = r3.z * r3.y;
    r1.xyz = -r12.xyz + r1.xyz;
    r0.y = ps;
    ps = (-0.5) + r0.y;
    r0.w = float((r0.z > 0.9));
    r0.z = saturate(ps);
    r1.xy = r1.xy * r0.zz + r12.xy;
    r10.xyz = r0.www * r10.xyz - r8.xyz;
    r0.y = r1.z * r0.z - 2.0;
    r1.z = r4.w * 2.0 + r0.y;
    r2.xyz = r2.yxz * r11.xyz + r10.xyz;
    r8.xyz = r2.xyz * r0.zzz + r8.xyz;
    r1.xyw = r1.xyz * r7.www;
    ps = -UniformVector_0.x;
    r1.z = r1.w + 1.0;
    r1.xyz = (r7.www > 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r1.yzw = (r7.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r0.y = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r0.y));
    r2.xyz = r7.xyz * r0.zzz;
    r0.y = ps;
    ps = -UniformVector_0.y;
    r7.xyz = r1.yzw * r0.yyy;
    ps = 1.0 + ps;
    r0.y = dot(r7.zxy, r9.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r0.yzw = r7.xyz * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r0.y = saturate(dot(r5.zxy, r0.wyz));
    r1.z = ps;
    ps = log2(r0.y);
    r1.yzw = r8.xyz * r1.xyz;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r7.zyx, r5.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r2.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r3.www;
    r0.xyz = r0.xzy * r4.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
