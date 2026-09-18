// ps_4f4692e1538606e6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 372 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005D0 10041700 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
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

    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.z));
    r6.y = r5.w - 4e+02;
    r6.z = ps;
    ps = 0.1 - -r2.z;
    r11.x = r1.w * UniformVector_2.x;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.xy = r1.wz * UniformVector_1.xy;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r6.y;
    r9.xyz = r6.zzz * r4.xyz;
    r6.z = saturate(ps);
    ps = (-0.025) * r6.z;
    r6.y = saturate(r5.w * 0.0001);
    r6.w = ps;
    r0.yz = r9.xy * r6.ww + r7.xy;
    r4.xw = -r6.xy + 1.0;
    ps = 1.0 / UniformVector_1.y;
    r18.xy = r4.xx * ModShadowGroupColor.xy;
    r0.w = ps;
    r18.zw = r0.zx * r0.wx;
    ps = 1.0 / UniformVector_1.x;
    r14.yzw = -r18.zxy + 1.0;
    r14.x = ps;
    r6.yz = r14.yx * UniformVector_2.yx;
    r6.x = r6.z * r0.y;
    r13 = tex2D(Texture2D_1, r6.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.yz = r1.wz * 6.0;
    r10.x = ps;
    ps = trunc(UniformScalar_1.x);
    r7.xy = r1.wz * UniformVector_6.xy;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = -r1.z + 1.0;
    r10.y = ps;
    r7.w = (r11.z == 0.0) ? r13.x : r13.y;
    ps = UniformVector_2.y * r6.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r11.y = ps;
    ps = r10.x;
    r6 = r11.xzyz + float4(-0.5, -3.0, -0.5, -2.0);
    ps = abs(r8.x) * ps;
    r19.xy = float2((r11.xy >= 0.5));
    r7.z = ps;
    ps = 1.0 / r5.w;
    r12.xy = r6.xz - r11.xy;
    r19.z = ps;
    r6.x = (r6.w == 0.0) ? r13.z : r7.w;
    r6.w = (r6.y == 0.0) ? r13.w : r6.x;
    r5.xy = r12.zw * r19.zz + ScreenPositionScaleBias.wz;
    r6.yz = r12.xy * r19.xy + r11.xy;
    ps = r10.y;
    r6.x = r6.w + 0.25;
    ps = abs(r8.y) * ps;
    r6.xyw = r6.yzx + r6.yzw;
    r7.w = ps;
    r10.yzw = tex2D(Texture2D_5, r0.yz).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r11 = tex2D(Texture2D_1, r6.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r22 = tex2D(Texture2D_4, r1.xy);
    r23.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r13.xyw = tex2D(Texture2D_6, r1.xy).yzx;
    r21.xyw = tex2D(Texture2D_2, r4.yz).xyw;
    r12.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r8.xyz = tex2D(Texture2D_0, r0.yz).xyz;
    ps = -ModShadowColor.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r20.xyz = UniformVector_5.xzy * 2e+01;
    r15.x = ps;
    ps = -ModShadowColor.y;
    r7.w = float((UniformScalar_4.x >= 1.0));
    ps = 1.0 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r15.y = ps;
    ps = -ModShadowColor.z;
    r6.z = float((UniformScalar_4.x > 1.0));
    r8.xyw = r8.xyz * 2.0 - 1.0;
    r0.zw = r12.xy * 2.0 - 1.0;
    r16.zw = r21.xy * 2.0 - 1.0;
    ps = 1.0 + ps;
    r0.xy = r13.yx * UniformScalar_5.xx;
    r15.z = ps;
    r7.xyz = (-abs(r6.zzz) >= 0.0) ? r7.xyz : 1.0;
    ps = 1.0 - r6.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r1.w = saturate(ps);
    r21.xyz = r23.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r1.xyz = r22.xyz * r22.www;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.zzz * r2.xyz;
    r6.z = ps;
    ps = r21.w;
    r2.xyz = r6.zzz * -SpotDirection.xyz;
    ps = r12.w * ps;
    r12.xyz = r21.xyz * UniformVector_4.xyz;
    r6.z = ps;
    ps = log2(r1.w);
    r1.xyz = r20.zxy * r1.yxz;
    r6.x = ps;
    r7.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r7.yxz;
    r13.xyz = r7.yxz * r13.wxy + r1.yxz;
    ps = (-1.0) - -r6.z;
    r7.zw = r0.yx * r7.xz;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.x = dot(r1.zyx, float3(0.11, 0.3, 0.59));
    r1.x = ps;
    ps = UniformScalar_5.x * r7.y;
    r6.y = dot(r2.zxy, r3.zxy);
    r7.x = ps;
    ps = -SpotAngles.x - -r6.y;
    r7.y = r7.x * r13.w;
    r6.x = ps;
    ps = r0.x;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    ps = -r1.y + ps;
    r3.z = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r0.x = ps;
    r7.x = (r3.z == 0.0) ? r11.x : r11.y;
    ps = SpotAngles.y * r6.x;
    r0.x = saturate(r0.x + r1.y);
    r10.x = saturate(ps);
    r2.yz = -r12.xy * r0.xx + r12.xy;
    ps = 1.0 - r0.x;
    r0.zw = r0.zw + r16.zw;
    r1.w = ps;
    ps = pow(2.0, r1.x);
    r3.xyw = r18.www * r17.xyz;
    r1.x = ps;
    ps = UniformScalar_6.x + r7.y;
    r1.xyz = r3.xwy * r1.xxx;
    r2.w = ps;
    ps = UniformScalar_6.x + r7.z;
    r3.xy = r16.xy * r14.zw;
    r3.w = ps;
    ps = UniformScalar_6.x + r7.w;
    r14 = r3.xyzz + float4(0.125, 0.125, -3.0, -2.0);
    r7.w = ps;
    r2.x = (r14.w == 0.0) ? r11.z : r7.x;
    ps = r2.w;
    r7.x = r14.x * r14.y;
    r7.xyz = r7.xxx * r15.xyz + ModShadowColor.xyz;
    r12.w = (r14.z == 0.0) ? r11.w : r2.x;
    ps = r1.w * ps;
    r2.w = max(r12.w, 0.0);
    r2.x = ps;
    ps = r6.w;
    r6.x = min(r2.w, 0.3);
    ps = -r6.z + ps;
    r6.yw = -r12.zw + 1.0;
    r6.z = saturate(ps);
    ps = 3.3333333 * r6.x;
    r3.xyz = r6.zzz * r10.yzw;
    r6.x = ps;
    ps = 2.5 * r6.w;
    r11 = r6.yxxx * r0;
    r10.y = ps;
    ps = r12.z;
    r0.xyz = r13.xyz - r3.xyz;
    ps = r11.x + ps;
    r10.z = r11.y + 1.0;
    r6.w = ps;
    ps = r10.x * r10.x;
    r6.yz = r2.yz + r11.zw;
    r6.x = ps;
    ps = r10.y * r10.z;
    r2.yzw = -r8.xyw + r6.yzw;
    r6.y = ps;
    ps = r3.w;
    r6.z = saturate(r6.y - 0.5);
    r0.xyz = r0.xyz * r6.zzz + r3.xyz;
    r2.yz = r2.yz * r6.zz + r8.xy;
    r6.y = r2.w * r6.z - 2.0;
    r2.w = r8.z * 2.0 + r6.y;
    ps = r1.w * ps;
    r3.xyw = r2.yzw * r4.www;
    r2.y = ps;
    ps = r7.w;
    r3.z = r3.w + 1.0;
    r3.xyz = (r4.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r4.www >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    ps = r1.w * ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r2.z = ps;
    ps = rsqrt(abs(r6.y));
    r2.xyz = r2.xyz * r6.zzz;
    r6.y = ps;
    r3.xyz = r3.xyz * r6.yyy;
    r6.y = dot(r3.zxy, r9.zxy);
    r6.yzw = r3.xyz * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r9.xyz;
    r6.y = saturate(dot(r4.zxy, r6.wyz));
    ps = log2(r6.y);
    r0.xyz = r0.xyz * r5.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r7.w = saturate(dot(r3.zyx, r4.zyx));
    r6.y = ps;
    r6.yzw = r2.xyz * r6.yyy;
    r6.yz = r0.xy * r7.ww + r6.yz;
    r6.w = r0.z * r7.w + r6.w;
    r6.yzw = r1.xzy * r6.yzw;
    r6.yzw = r6.yzw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.ywz * r6.xxx;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
