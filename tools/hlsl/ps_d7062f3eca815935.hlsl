// ps_d7062f3eca815935.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041800 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 ConstantLighting : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c16); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r15.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    ps = r3.w;
    r0.zw = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r1.z = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    r8.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.z));
    r8.x = saturate(r1.w * 0.00022222222);
    r1.z = ps;
    r7.xyz = r1.zzz * r4.xyz;
    r4.xyz = r8.xyz * float3(-0.025, 0.5, 0.5);
    r11.xy = r7.xy * r4.xx + r0.zw;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r11.xy).xyz;
    r12.x = r1.x * UniformVector_2.x;
    ps = 1.0 / UniformVector_1.y;
    r0.zw = r1.xy * UniformVector_7.xy;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r23.x = -r1.y + 1.0;
    r11.z = ps;
    r9.xyz = r9.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.xyz = r9.xzy * UniformVector_4.zyx;
    r11.w = ps;
    ps = r8.w + r8.w;
    r14.w = r11.y * r1.z;
    r9.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r23.yw = -r14.wx + 1.0;
    r23.z = ps;
    ps = r8.x + r8.x;
    r12.yzw = r23.xyz * UniformVector_2.yyx;
    r9.z = ps;
    ps = r12.w;
    r10.xyz = r12.zxy - 0.5;
    ps = r11.x * ps;
    r22.xyz = float3((r12.xyz >= 0.5));
    r9.x = ps;
    ps = r8.y + r8.y;
    r22.w = float((r9.x >= 0.5));
    r9.w = ps;
    ps = r11.z;
    r13.xyz = r10.yzx - r12.xyz;
    ps = abs(r6.x) * ps;
    r10 = r9 + float4(-0.5, -1.0, -1.0, -1.0);
    r1.z = ps;
    ps = r11.w;
    r13.w = r10.x - r9.x;
    r9.x = r13.w * r22.w + r9.x;
    r9.yzw = r13.zxy * r22.zxy + r12.zxy;
    ps = abs(r6.y) * ps;
    r9 = r9.zwxy + r9.zwxy;
    r1.w = ps;
    r11.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r18 = tex2D(Texture2D_1, r9.xy);
    r21 = tex2D(Texture2D_1, r9.zw);
    r17 = tex2D(Texture2D_5, r0.xy);
    r9 = tex2D(Texture2D_4, r0.xy);
    r12.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r6.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    ps = OpacityOverride.x;
    r19.xyz = -ModShadowColor.xyz + 1.0;
    r4.w = saturate(ps);
    ps = r3.w;
    r0.z = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 0.0001 * ps;
    r1.w = float((UniformScalar_11.x >= 1.0));
    r4.x = saturate(ps);
    ps = UniformVector_5.x;
    r0.y = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r24.xyz = UniformVector_6.xzy * 2e+01;
    r20.y = ps;
    ps = UniformVector_5.z;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r1.xyz = -UniformVector_0.zxy + 1.0;
    r20.z = ps;
    ps = UniformVector_5.y;
    r0.x = float((UniformScalar_11.x > 1.0));
    r8.xy = r6.xy * 2.0 - 1.0;
    ps = 2e+01 * ps;
    r6.xyz = r15.xyz * UniformScalar_12.xxx;
    r20.w = ps;
    r16.xyz = (-abs(r0.xxx) >= 0.0) ? r12.xyz : 1.0;
    ps = AmbientColorAndSkyFactor.x * r1.y;
    r9.xyz = r9.xzy * r9.www;
    r12.x = ps;
    ps = AmbientColorAndSkyFactor.y * r1.z;
    r17.xyz = r17.xzy * r17.www;
    r12.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.x = r7.w * r6.w;
    r0.w = ps;
    ps = (-1.0) - -r0.x;
    r17.xyz = r24.xyz * r17.xyz;
    r20.x = ps;
    ps = rsqrt(abs(r0.y));
    r9.xyz = r20.yzw * r9.xyz;
    r0.y = ps;
    r16.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r16.xyz;
    r6.xyz = r6.xyz * r16.xyz + UniformScalar_13.xxx;
    r17.xyz = (-abs(r0.zzz) >= 0.0) ? r17.xyz : r9.xyz;
    ps = r8.x;
    r9.xyz = r0.yyy * r2.xyz;
    ps = r4.y + ps;
    r0.y = dot(r17.yxz, float3(0.11, 0.3, 0.59));
    r17.w = ps;
    ps = r8.y;
    r0.z = saturate(dot(r17.zyx, float3(0.59, 0.11, 0.3)));
    r8.xy = -r14.zy * r0.zz + r14.zy;
    ps = r4.z + ps;
    r0.y = r0.y - r17.x;
    r20.w = ps;
    r14.z = r23.w * r0.z + r14.x;
    ps = r0.y;
    r2.x = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r2.y = r22.z * 2.0 + r22.w;
    r0.z = (r2.y == 0.0) ? r21.x : r21.y;
    r0.y = (r2.x == 0.0) ? r18.x : r18.y;
    ps = r17.x + ps;
    r2 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r4.z = saturate(ps);
    r0.y = (r2.y == 0.0) ? r18.z : r0.y;
    r0.z = (r2.z == 0.0) ? r21.z : r0.z;
    r9.w = (r2.w == 0.0) ? r21.w : r0.z;
    r0.y = (r2.x == 0.0) ? r18.w : r0.y;
    ps = 1.0 - r0.y;
    r2.y = max(r0.y, 0.0);
    r2.x = ps;
    ps = 2.5 * r2.x;
    r0.yz = r9.zw + float2(0.1, 0.25);
    r6.w = ps;
    ps = 5.0 * r0.y;
    r1.w = r0.z + r9.w;
    r4.y = saturate(ps);
    ps = r1.w;
    r13.x = min(r2.y, 0.3);
    ps = -r0.x + ps;
    r18.yzw = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r7.w = saturate(ps);
    ps = r7.w;
    r4 = -r4.wzyx + 1.0;
    ps = r11.x * ps;
    r6.xyz = r6.xyz * r4.yyy;
    r13.x = ps;
    ps = r7.w;
    r1.w = float((r4.x >= 0.004));
    r20.yz = -r4.zz * ModShadowGroupColor.xy + 1.0;
    r14.y = r18.y * r20.w + r8.y;
    r2.yzw = r18.yzw * r20.xyz + float3(1.0, 0.125, 0.125);
    r6.w = saturate(r6.w * r2.y - 0.5);
    ps = r11.y * ps;
    r2.xy = r2.yz * r2.xw;
    r13.y = ps;
    r0.xyz = r2.yyy * r19.xyz + ModShadowColor.xyz;
    ps = r7.w;
    r18.x = float((r2.x > 0.9));
    ps = r11.z * ps;
    r2 = r18.xxxy * r17.xzyw;
    r13.z = ps;
    r11.xyz = r2.xyz * r6.www + UniformVector_0.xyz;
    ps = r8.x;
    r6.xyz = r6.xzy * r6.www;
    r15.xyz = r16.xzy * r15.xzy + r2.xzy;
    ps = r2.w + ps;
    r2.xyz = r15.xyz - r13.xzy;
    r14.x = ps;
    ps = AmbientColorAndSkyFactor.z * r1.x;
    r4.xyz = -r10.yzw + r14.zxy;
    r12.z = ps;
    r2.xyz = r2.xyz * r6.www + r13.xzy;
    r8.xyz = r12.xyz * r2.xzy + r11.xyz;
    r10.yz = r4.yz * r6.ww + r10.zw;
    r2.w = r4.x * r6.w - 2.0;
    r10.x = r8.w * 2.0 + r2.w;
    r10.xyw = r10.yzx * r4.www;
    ps = r0.w;
    r10.z = r10.w + 1.0;
    r4.xyz = (r4.www > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r4.yzw = (r4.www >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.x * ps;
    r2.w = dot(r4.wyz, r4.wyz);
    r4.x = ps;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r2.xzy * r1.yzx;
    r1.x = ps;
    ps = r0.w;
    r1.xyz = r4.yzw * r1.xxx;
    ps = r5.y * ps;
    r2.w = dot(r1.zxy, r7.zxy);
    r4.y = ps;
    ps = r0.w;
    r10.xyz = r1.xyz * r2.www;
    r7.xyz = r10.xyz * 2.0 - r7.xyz;
    ps = r5.z * ps;
    r0.w = saturate(dot(r9.zxy, r7.zxy));
    r4.z = ps;
    ps = log2(r0.w);
    r4.x = dot(r4.zxy, r1.zxy);
    r4.y = ps;
    r4.xyz = r4.xxy * float3(-0.5, 0.5, 15.0);
    r5.xy = r4.xy + 0.5;
    ps = pow(2.0, r4.z);
    r1.xy = abs(r5.xy) * abs(r5.xy);
    r0.w = ps;
    ps = ConstantLighting.x * r0.w;
    r4.xyz = r1.zzz * ConstantLighting.xyz;
    r5.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r2.xzy * r1.xxx;
    r5.y = ps;
    ps = ConstantLighting.y * r0.w;
    r1.xyz = r2.xzy * r1.yyy;
    r5.z = ps;
    r1.xyz = r1.xyz * UpperSkyColor.xzy + r8.xzy;
    r1.xyz = r7.xzy * LowerSkyColor.xyz + r1.xzy;
    r1.xyz = r5.xyz * r6.xyz + r1.xzy;
    r1.xyz = r4.xyz * r2.xyz + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xzy * r0.xzy;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xzy - r0.xzy;
    r2.w = ps;
    oC0.w = r2.w * r1.w + r3.w;
    r0.xyz = r2.xyz * r1.www + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
