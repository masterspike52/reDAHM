// ps_12ed1e789bb2327e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041700 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c23); // float4
float4 ConstantLighting : register(c24); // float3
float4 LowerSkyColor : register(c22); // float3
float4 ModShadowAccumResolution : register(c27); // float2
float4 ModShadowColor : register(c25); // float3
float4 ModShadowGroupColor : register(c26); // float3
float4 OpacityOverride : register(c20); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c21); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_9, r0.xy);
    ps = 1.0 - r1.y;
    r10.x = r1.x * UniformVector_2.x;
    r2.w = ps;
    r7.xy = saturate(UniformVector_12.xy);
    ps = UniformVector_1.x + UniformVector_1.x;
    r12.y = UniformScalar_4.x * UniformScalar_5.x;
    r1.z = ps;
    ps = r3.w;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = (-2e+02) + ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r10.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r0.z = UniformScalar_3.x * UniformVector_4.x;
    r0.w = ps;
    ps = rsqrt(abs(r7.w));
    r7.z = r15.w - 0.5;
    r7.w = ps;
    ps = rsqrt(abs(r1.w));
    r8.xyz = r7.www * r4.xyz;
    r1.w = ps;
    ps = r1.x;
    r9.xyz = r1.www * r2.xyz;
    ps = UniformVector_1.x * ps;
    r10.y = r9.z + 0.1;
    r4.x = ps;
    ps = r1.y;
    r11.zw = saturate(r10.yz * float2(5.0, 0.00022222222));
    ps = UniformVector_1.y * ps;
    r1.w = r11.w * (-0.1);
    r4.y = ps;
    ps = UniformScalar_5.x * r0.z;
    r12.zw = r8.xy * r1.ww;
    r12.x = ps;
    ps = UniformVector_2.x * r0.w;
    r2.xy = floor(r12.xy);
    r0.w = ps;
    r2.xy = r2.xy * UniformVector_11.xy - r12.xy;
    ps = 1.0 / UniformVector_1.y;
    r4.zw = r2.xy * r7.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4 = r12 + r4.zwxy;
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.w = r0.w * r4.z;
    r2.y = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r14.xy = r1.xy * UniformVector_14.xy;
    r1.w = ps;
    r1.zw = r1.zw * r1.xy;
    ps = r3.w;
    r7.xy = r2.xy * abs(r6.xy);
    ps = 0.0001 * ps;
    r11.x = r4.w * r0.z;
    r11.y = saturate(ps);
    r0.zw = r0.xy * UniformVector_13.xy + r4.xy;
    ps = UniformVector_8.x * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r6.x = ps;
    ps = UniformVector_8.y * r0.w;
    r2.xyz = -r11.xyz + 1.0;
    r6.y = ps;
    r6.yz = frac(r6.xy);
    ps = 1.0 / UniformVector_10.x;
    r0.zw = float2((UniformVector_10.xy >= r6.yz));
    r20.x = ps;
    ps = r0.z * r0.w;
    r20.zw = float2((UniformVector_10.yx > r6.zy));
    r6.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r10.yz = r2.wx * UniformVector_2.yy;
    r20.y = ps;
    r16.xyw = r6.yzx * r20.xyz;
    r6 = r10 - 0.5;
    r11 = float4((r10.xzwy >= 0.5));
    ps = r1.x + r1.x;
    r6 = r6 - r10;
    r0.z = ps;
    r6 = r6.xywz * r11.xwzy + r10.xywz;
    ps = r1.y + r1.y;
    r6 = r6 + r6;
    r0.w = ps;
    r4.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r12.xyz = tex2D(Texture2D_7, r4.zw).xyz;
    r7.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r10 = tex2D(Texture2D_3, r6.xy);
    r13 = tex2D(Texture2D_3, r6.zw);
    r21 = tex2D(Texture2D_2, r1.zw);
    r23.xyz = tex2D(Texture2D_8, r14.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r4.zw).xyz;
    r17.xyz = tex2D(Texture2D_1, r1.zw).xyz;
    r14 = tex2D(Texture2D_6, r16.xy);
    r0.xyz = tex2D(Texture2D_4, r0.zw).wxy;
    r0.w = dot(r5.zxy, r5.zxy);
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r1.w = float((UniformScalar_12.x >= 1.0));
    r18.yz = r0.yz * 2.0 - 1.0;
    ps = r14.x * r14.w;
    r4.z = float((UniformScalar_12.x > 1.0));
    r14.x = ps;
    ps = r14.y * r14.w;
    r1.xyz = r15.xyz * UniformScalar_13.xxx;
    r14.y = ps;
    r22.xyz = r17.zxy * 2.0 - 1.0;
    r17.yzw = r6.wxy * 2.0 - 1.0;
    r23.xyz = (-abs(r4.zzz) >= 0.0) ? r23.xyz : 1.0;
    r16.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r23.xyz;
    ps = r14.z * r14.w;
    r22.xyz = r22.xyz - r17.yzw;
    r14.z = ps;
    r17.x = r22.x * r21.w - 2.0;
    r17.yzw = r22.xyz * r21.www + r17.yzw;
    r1.xyz = r1.xyz * r16.xyz + UniformScalar_14.xxx;
    ps = r16.w;
    r11.x = dot(r11.xww, float3(1.0, 1.0, 1.0));
    ps = r20.w * ps;
    r11.y = dot(r11.zyy, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    r4.z = (r11.y == 0.0) ? r13.x : r13.y;
    r4.w = (r11.x == 0.0) ? r10.x : r10.y;
    r14.xyz = r14.xyz * r1.www;
    r14.xyz = r19.xyz * r14.xyz;
    ps = OpacityOverride.x;
    r11 = r11.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r20.w = saturate(ps);
    ps = (-1.0) + r0.x;
    r1.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r18.x = ps;
    r0.x = (r11.y == 0.0) ? r10.z : r4.w;
    r0.y = (r11.z == 0.0) ? r13.z : r4.z;
    r22.w = (r11.w == 0.0) ? r13.w : r0.y;
    r19.x = (r11.x == 0.0) ? r10.w : r0.x;
    ps = ModShadowGroupColor.x * r2.z;
    r0.x = r1.w - r14.x;
    r20.y = ps;
    ps = ModShadowGroupColor.y * r2.z;
    r20.x = saturate(r0.x + r14.x);
    r20.z = ps;
    ps = r19.x;
    r22.xyz = r7.zxy + r7.zxy;
    r0.x = ps;
    ps = 0.0;
    r23 = r22 + float4(-1.0, -1.0, -1.0, -0.75);
    r0.y = ps;
    ps = max(r0.x, r0.y);
    r7 = -r20.wxyz + 1.0;
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r1.xzy * r7.yyy;
    r0.y = ps;
    ps = r0.x;
    r1.yzw = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = 0.3;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = min(r0.x, r0.z);
    r13.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r0.x = ps;
    ps = r23.w;
    r10.xyz = r0.yyy * r5.xyz;
    ps = r22.w + ps;
    r19.yzw = r23.xzy * UniformVector_4.zyx;
    r0.y = saturate(ps);
    ps = 3.3333333 * r0.x;
    r12.xyz = r0.yyy * r12.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r18.xyz;
    r4.zw = -r19.wz * r20.xx + r19.wz;
    r5.xy = r0.yz * 2.0 + r4.zw;
    r18.zw = -r19.xy + 1.0;
    r22.xyz = -r12.xzy + r21.xzy;
    r12.xyz = r22.xyz * r21.www + r12.xzy;
    r5.z = r18.w * r20.x + r19.y;
    ps = 1.0 + r0.x;
    r18.y = r18.z * 2.5;
    r18.x = ps;
    ps = r18.x * r18.z;
    r1.x = float((r7.x >= 0.004));
    r0.y = ps;
    ps = r18.y * r18.x;
    r5.xyz = -r17.yzw + r5.zxy;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r4.z = float((r0.y > 0.9));
    r5.w = saturate(ps);
    r0.yzw = r5.xyz * r5.www + r17.xzw;
    r14.xyz = r14.xyz * r4.zzz;
    r5.xyz = r14.xyz * r5.www + UniformVector_0.xyz;
    r0.x = r6.w * 2.0 + r0.y;
    r14.xyz = r16.xyz * r15.xyz + r14.xyz;
    r0.xyz = r0.xzw * r2.yyy;
    ps = 1.0 + r0.x;
    r14.xyz = r14.xyz - r12.xzy;
    r0.w = ps;
    r12.xyz = r14.xyz * r5.www + r12.xzy;
    r5.xyz = r13.xyz * r12.xyz + r5.xyz;
    r0.xyz = (r2.yyy > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r2.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r2.xyz = r12.xyz * r11.xyz;
    r0.x = ps;
    ps = r6.x;
    r0.xyw = r0.yzw * r0.xxx;
    ps = r5.w * ps;
    r4.z = dot(r10.zxy, r0.wxy);
    r6.x = ps;
    ps = r6.y;
    r0.z = dot(r0.wxy, r8.zxy);
    ps = r5.w * ps;
    r10.xyz = r0.xyw * r0.zzz;
    r6.y = ps;
    ps = r6.z;
    r4 = r4.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = r5.w * ps;
    r2.w = saturate(dot(r9.zxy, r8.zxy));
    r6.z = ps;
    r7.xy = r4.xy * r7.zw + 0.125;
    ps = ConstantLighting.x * r0.w;
    r4.yz = r4.zw + 0.5;
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r4.zw = abs(r4.yz) * abs(r4.yz);
    r4.y = ps;
    ps = log2(r2.w);
    r0.z = r7.x * r7.y;
    r0.x = ps;
    r1.yzw = r0.zzz * r1.yzw + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r2.xzy * r4.zzz;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r8.xyz = r2.xzy * r4.www;
    r0.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xzy;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.xyz + r5.xzy;
    r0.xyz = r4.xyz * r2.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.yzw;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.x + r3.w;
    r0.xyz = r2.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
