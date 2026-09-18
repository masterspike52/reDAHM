// ps_62e845b134d311b1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041900 00000606 00000000 000050C6 003F003F 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 ConstantLighting : register(c22); // float3
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UpperSkyColor : register(c19); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r11.x = r1.x * UniformVector_2.x;
    r20.x = -r1.y + 1.0;
    r1.zw = UniformVector_1.xy + UniformVector_1.xy;
    ps = 1.0 / UniformVector_1.x;
    r0.w = r3.w - 4e+02;
    r0.z = ps;
    r8.xy = r1.zw * r1.xy;
    ps = UniformScalar_1.x;
    r8.zw = r1.xy * UniformVector_8.xy;
    ps = UniformVector_4.x * ps;
    r7.yz = r1.xy * UniformVector_1.xy;
    r16.w = ps;
    ps = r1.x + r1.x;
    r1.z = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    ps = r1.y + r1.y;
    r7.xw = r1.xy - r0.xy;
    r9.z = ps;
    r1.xyw = r10.zxy * 2.0 - 1.0;
    r7.xw = r7.xw * UniformScalar_4.xx + r0.xy;
    ps = 0.00022222222 * r0.w;
    r7.xw = r7.wx * UniformVector_6.yx;
    r9.x = saturate(ps);
    ps = rsqrt(abs(r1.z));
    r19.yzw = r1.xwy * UniformVector_4.zyx;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.xyz = r0.www * r4.xyz;
    r10.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r4.xyz = r9.xyz * float3(-0.1, 6.0, 6.0);
    r4.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xyz = r16.xwy * r4.xwx;
    r10.y = ps;
    ps = UniformScalar_3.x * r1.y;
    r10.xy = r10.xy * abs(r6.xy);
    r1.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r1.xzw = r1.wxz + r7.wyz;
    r0.w = ps;
    ps = UniformVector_2.x * r0.z;
    r19.x = r1.w * r0.w;
    r0.z = ps;
    ps = r0.z;
    r20.yz = -r19.xy + 1.0;
    ps = r1.z * ps;
    r11.yz = r20.xy * UniformVector_2.yy;
    r11.w = ps;
    r6 = r11 - 0.5;
    r23 = float4((r11 >= 0.5));
    r6 = r6 - r11;
    r6 = r6.xywz * r23.xywz + r11.xywz;
    ps = UniformVector_7.y + r7.x;
    r6 = r6 + r6;
    r1.y = ps;
    r12.xyz = tex2D(Texture2D_8, r1.zw).xyz;
    r15.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r18 = tex2D(Texture2D_3, r6.xy);
    r22 = tex2D(Texture2D_3, r6.zw);
    r11 = tex2D(Texture2D_2, r8.xy);
    r24.xyz = tex2D(Texture2D_9, r8.zw).xyz;
    r6.xyw = tex2D(Texture2D_0, r1.zw).xyz;
    r17.xyz = tex2D(Texture2D_1, r8.xy).xyz;
    r8 = tex2D(Texture2D_7, r1.xy);
    r21 = tex2D(Texture2D_6, r0.xy).xwyz;
    r4.xyz = tex2D(Texture2D_4, r4.yz).wxy;
    r0.xyw = tex2D(Texture2D_4, r9.yz).xwy;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r14.xyz = UniformVector_5.xyz * 2e+01;
    r4.w = float((UniformScalar_17.x >= 1.0));
    ps = OpacityOverride.x;
    r1.y = dot(r2.zxy, r2.zxy);
    r14.w = saturate(ps);
    ps = r3.w;
    r1.z = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = saturate(ps);
    r10.yz = r0.xw * 2.0 - 1.0;
    r4.yz = r4.yz * 2.0 - 1.0;
    ps = r4.x;
    r0.x = float((UniformScalar_17.x > 1.0));
    ps = r0.y * ps;
    r4.x = -r21.y + 1.0;
    r1.x = ps;
    ps = r8.x * r8.w;
    r9.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r8.x = ps;
    r25.xyz = r17.zxy * 2.0 - 1.0;
    r17.yzw = r6.wxy * 2.0 - 1.0;
    r0.xyw = (-abs(r0.xxx) >= 0.0) ? r24.xyz : 1.0;
    ps = rsqrt(abs(r1.z));
    r24.xyz = r21.xzw * UniformScalar_18.xxx;
    r1.z = ps;
    ps = rsqrt(abs(r1.y));
    r6.xyz = r1.zzz * r5.xyz;
    r1.y = ps;
    ps = r8.y * r8.w;
    r1.yzw = r1.yyy * r2.xyz;
    r8.y = ps;
    r0.xyw = (-abs(r4.www) >= 0.0) ? 1.0 : r0.xyw;
    ps = r8.z * r8.w;
    r2.xyz = r25.xyz - r17.yzw;
    r8.z = ps;
    r17.x = r2.x * r11.w - 2.0;
    r17.yzw = r2.xyz * r11.www + r17.yzw;
    r5.xyz = r24.xyz * r0.xyw + UniformScalar_19.xxx;
    ps = r0.x;
    r2.xyz = r14.xyz * r8.xyz;
    ps = r21.x * ps;
    r2 = r2.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r21.y = ps;
    r21.x = dot(r2.yx, r4.xx) + 0.0;
    ps = r0.y;
    r8.xyw = r2.zwy * r4.xxx;
    r10.x = dot(r8.yx, float2(0.11, 0.59)) + 0.0;
    ps = r21.z * ps;
    r2.x = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r21.z = ps;
    ps = r0.w;
    r2.y = dot(r23.wzz, float3(1.0, 1.0, 1.0));
    r0.y = (r2.y == 0.0) ? r22.x : r22.y;
    r0.x = (r2.x == 0.0) ? r18.x : r18.y;
    ps = r21.w * ps;
    r2 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r21.w = ps;
    r0.x = (r2.y == 0.0) ? r18.z : r0.x;
    r0.y = (r2.z == 0.0) ? r22.z : r0.y;
    r15.z = (r2.w == 0.0) ? r22.w : r0.y;
    r0.x = (r2.x == 0.0) ? r18.w : r0.x;
    ps = r1.w;
    r0.w = max(r0.x, 0.0);
    r0.y = ps;
    ps = 0.1 + r0.y;
    r4.x = min(r0.w, 0.3);
    r2.x = ps;
    ps = (-1.0) + r1.x;
    r4.xyz = r4.yxz * float3(0.5, 3.3333333, 0.5);
    r2.y = ps;
    ps = 1.0 - r0.x;
    r2.zw = r10.yz + r4.xz;
    r4.x = ps;
    ps = 1.0 - r0.z;
    r18.xyz = r4.yyy * r2.yzw;
    r4.w = ps;
    ps = 2.5 * r4.x;
    r4.y = r18.x + 1.0;
    r4.z = ps;
    ps = 5.0 * r2.x;
    r0.yw = r4.yz * r4.xy;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r2.x = float((r0.y > 0.9));
    r0.z = ps;
    ps = (-0.5) + r0.w;
    r10.yzw = r8.wxy * r2.xxx;
    r2.y = saturate(ps);
    r8.xyz = r10.yzw * r2.yyy + UniformVector_0.xyz;
    ps = ModShadowGroupColor.x * r0.z;
    r10 = r21 + r10;
    r14.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r14.x = saturate(r10.x - r8.w);
    r14.z = ps;
    r0.z = r20.z * r14.x + r19.y;
    r0.xy = -r19.wz * r14.xx + r19.wz;
    r14 = -r14.wxyz + 1.0;
    ps = r5.x;
    r0.xy = r0.xy + r18.yz;
    ps = r14.y * ps;
    r2.x = float((r14.x >= 0.004));
    r5.x = ps;
    ps = r5.y;
    r0.xyz = -r17.yzw + r0.zxy;
    r0.yzw = r0.xyz * r2.yyy + r17.xzw;
    r0.x = r6.w * 2.0 + r0.y;
    ps = r14.y * ps;
    r0.xyw = r0.zwx * r4.www;
    r5.y = ps;
    ps = r5.z;
    r0.z = r0.w + 1.0;
    r0.xyz = (r4.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r4.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = r14.y * ps;
    r0.x = dot(r0.wyz, r0.wyz);
    r5.z = ps;
    ps = rsqrt(abs(r0.x));
    r5.xyz = r5.xzy * r2.yyy;
    r0.x = ps;
    r4.xyz = r0.yzw * r0.xxx;
    r15.w = dot(r6.zxy, r4.zxy);
    r0.x = dot(r4.zxy, r16.zxy);
    r0.xyz = r4.xyz * r0.xxx;
    r6.yzw = r0.xyz * 2.0 - r16.xyz;
    r0 = r15.wwxy * float4(-0.5, 0.5, 0.875, 0.875);
    ps = r0.x;
    r4.xyz = r4.zzz * ConstantLighting.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r15.xy = r0.zw * r14.zw;
    r6.x = ps;
    ps = 0.5 + r0.y;
    r2.z = saturate(dot(r1.wyz, r6.wyz));
    r6.y = ps;
    ps = log2(r2.z);
    r6.yz = abs(r6.xy) * abs(r6.xy);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r14.xyz = r15.xyz + float3(0.125, 0.125, 0.25);
    r0.w = ps;
    ps = r14.x * r14.y;
    r2.z = r14.z + r15.z;
    r0.x = ps;
    r0.xyz = r0.xxx * r13.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r1.x = saturate(r2.z - r1.x);
    r0.w = ps;
    r1.xyz = r1.xxx * r12.xyz;
    r12.xyz = -r1.xzy + r11.xzy;
    r1.xyz = r12.xyz * r11.www + r1.xzy;
    r10.xyz = r10.yzw - r1.xzy;
    r2.yzw = r10.xyz * r2.yyy + r1.xzy;
    r1.xyz = r9.xyz * r2.yzw + r8.xyz;
    ps = ConstantLighting.x * r0.w;
    r2.yzw = r2.yzw * r7.xyz;
    r6.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r2.ywz * r6.yyy;
    r6.y = ps;
    ps = ConstantLighting.y * r0.w;
    r8.xyz = r2.ywz * r6.zzz;
    r6.z = ps;
    r1.xyz = r8.xyz * UpperSkyColor.xzy + r1.xzy;
    r1.xyz = r7.xzy * LowerSkyColor.xyz + r1.xzy;
    r1.xyz = r6.xyz * r5.xyz + r1.xzy;
    r1.xyz = r4.xyz * r2.yzw + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r2.x + r3.w;
    r0.xyz = r1.xyz * r2.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
