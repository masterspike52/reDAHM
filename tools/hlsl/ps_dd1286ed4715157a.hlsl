// ps_dd1286ed4715157a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c17); // float4
float4 ConstantLighting : register(c18); // float3
float4 LowerSkyColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 OpacityOverride : register(c14); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c15); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_7, r0.xy);
    ps = (-0.5) + r17.w;
    r21.xyz = UniformVector_5.xzy * 2e+01;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r16.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    ps = OpacityOverride.x;
    r0.zw = r1.xy * 6.0;
    r7.x = saturate(ps);
    r8.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    ps = r1.x;
    r1.zw = r1.xy * UniformVector_1.xy;
    ps = UniformVector_2.x * ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = -r1.y;
    r7.y = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r0.z = r3.w - 4e+02;
    r2.w = ps;
    r7.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r10.w = r8.z * r16.z;
    r7.y = ps;
    ps = rsqrt(abs(r0.w));
    r10.xyz = r7.yyy * r2.xyz;
    r0.w = ps;
    ps = 0.00022222222 * r0.z;
    r8.xyz = r0.www * r4.xyz;
    r7.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r4.xzw = r7.yzw * float3(-0.025, 0.5, 0.5);
    r2.y = ps;
    r0.zw = r8.xy * r4.xx + r1.zw;
    ps = 1.0 / UniformVector_1.y;
    r4.xy = r10.zw + float2(0.1, -1.0);
    r1.z = ps;
    ps = 5.0 * r4.x;
    r1.xy = r1.xy * UniformVector_7.xy;
    r2.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.z = r0.w * r1.z;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xz = -r2.zx + 1.0;
    r1.w = ps;
    ps = ModShadowGroupColor.x * r2.z;
    r1.zw = r1.zw * abs(r6.xy);
    r7.y = ps;
    ps = ModShadowGroupColor.y * r2.z;
    r9.yzw = r2.wxy * UniformVector_2.yyx;
    r7.z = ps;
    ps = r9.w;
    r2.yzw = -r7.xyz + 1.0;
    ps = r0.z * ps;
    r6.yzw = r9.zxy - 0.5;
    r2.x = ps;
    ps = (-0.5) - -r2.x;
    r20.xyz = float3((r9.xyz >= 0.5));
    r6.x = ps;
    ps = r6.x;
    r7.yzw = r6.zwy - r9.xyz;
    ps = -r2.x + ps;
    r6.xy = float2((r2.xy >= float2(0.5, 0.004)));
    r6.z = ps;
    r7.x = r6.z * r6.x + r2.x;
    r7.yzw = r7.wyz * r20.zxy + r9.zxy;
    r7 = r7.zwxy + r7.zwxy;
    r12.xy = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r14.yzw = tex2D(Texture2D_6, r0.zw).xyz;
    r19 = tex2D(Texture2D_1, r7.zw).xzwy;
    r15 = tex2D(Texture2D_1, r7.xy);
    r11 = tex2D(Texture2D_5, r0.xy);
    r18 = tex2D(Texture2D_4, r0.xy).xzyw;
    r9.xyz = tex2D(Texture2D_8, r1.xy).xyz;
    r7.xyw = tex2D(Texture2D_3, r0.xy).xzy;
    r0.yzw = tex2D(Texture2D_0, r0.zw).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r1.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r8.w = float((UniformScalar_8.x >= 1.0));
    r7.z = ps;
    ps = r3.w;
    r9.w = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r1.xyz = -UniformVector_0.zxy + 1.0;
    r0.x = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r1.y;
    r12.z = float((UniformScalar_8.x > 1.0));
    r14.x = ps;
    r13.xyz = r0.wyz * 2.0 - 1.0;
    r6.zw = r16.xy * 2.0 - 1.0;
    r16.yzw = (-abs(r12.zzz) >= 0.0) ? r9.xyz : 1.0;
    ps = r18.x * r18.w;
    r12.zw = r17.yz * UniformScalar_9.xx;
    r18.x = ps;
    ps = rsqrt(abs(r9.w));
    r9.xyz = r11.xzy * r11.www;
    r9.w = ps;
    ps = r18.y * r18.w;
    r11.xyz = r9.www * r5.xyz;
    r18.y = ps;
    ps = r18.z * r18.w;
    r9.xyz = r22.xyz * r9.xyz;
    r18.z = ps;
    ps = r7.y + r7.y;
    r21.xyz = r21.xyz * r18.xyz;
    r16.x = ps;
    r18.xyz = (-abs(r8.www) >= 0.0) ? 1.0 : r16.yzw;
    ps = r7.x + r7.x;
    r5.yz = r12.zw * r18.yz;
    r16.y = ps;
    r7.xyz = (-abs(r7.zzz) >= 0.0) ? r9.xyz : r21.xyz;
    ps = r7.w + r7.w;
    r5.x = r18.x * UniformScalar_9.x;
    r16.z = ps;
    ps = r5.x;
    r4.zw = r6.zw + r4.zw;
    r9.xyz = (-abs(r1.www) >= 0.0) ? r9.xyz : r7.xyz;
    ps = r17.x * ps;
    r1.w = dot(r9.yxz, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = r1.w;
    r9.w = saturate(dot(r9.zyx, float3(0.59, 0.11, 0.3)));
    ps = -r9.x + ps;
    r7.xyz = r5.xyz + UniformScalar_10.xxx;
    r1.w = ps;
    ps = r1.w;
    r5.x = dot(r20.xyy, float3(1.0, 1.0, 1.0));
    r1.w = (r5.x == 0.0) ? r15.x : r15.y;
    r5.y = r20.z * 2.0 + r6.x;
    r6.z = (r5.y == 0.0) ? r19.x : r19.w;
    ps = r9.x + ps;
    r5 = r5.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r19.x = saturate(ps);
    r1.w = (r5.y == 0.0) ? r15.z : r1.w;
    r6.z = (r5.z == 0.0) ? r19.y : r6.z;
    r16.w = (r5.w == 0.0) ? r19.z : r6.z;
    r0.z = (r5.x == 0.0) ? r15.w : r1.w;
    ps = 1.0 - r0.x;
    r1.w = max(r0.z, 0.0);
    r5.w = ps;
    ps = 1.0 - r0.z;
    r0.y = min(r1.w, 0.3);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r15 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.z = ps;
    ps = 3.3333333 * r0.y;
    r1.w = r15.w + r16.w;
    r0.x = ps;
    ps = r1.w;
    r19.yzw = r15.xzy * UniformVector_4.zyx;
    r5.y = r0.x * r4.y + 1.0;
    r6.zw = -r19.wz * r9.ww + r19.wz;
    r16.xy = r0.xx * r4.zw + r6.zw;
    ps = -r10.w + ps;
    r15.yz = -r19.xy + 1.0;
    r0.x = saturate(ps);
    ps = r5.y * r5.x;
    r4.xyz = r0.xxx * r14.yzw;
    r0.y = ps;
    ps = r5.z * r5.y;
    r7.xyz = r7.xyz * r15.yyy;
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.y * r1.z;
    r15.x = float((r0.y > 0.9));
    r14.y = ps;
    ps = (-0.5) + r0.x;
    r15 = r15.xxxz * r9.xzyw;
    r0.x = saturate(ps);
    r9.xyz = r15.xyz * r0.xxx + UniformVector_0.xyz;
    ps = r19.y;
    r7.xyz = r7.xzy * r0.xxx;
    r17.xyz = r18.xzy * r17.xzy + r15.xzy;
    ps = r15.w + ps;
    r15.xyz = r17.xyz - r4.xzy;
    r16.z = ps;
    ps = AmbientColorAndSkyFactor.z * r1.x;
    r6.xzw = -r13.xyz + r16.zxy;
    r14.z = ps;
    r4.xyz = r15.xyz * r0.xxx + r4.xzy;
    r9.xyz = r14.xyz * r4.xzy + r9.xyz;
    r0.yz = r6.zw * r0.xx + r13.yz;
    r0.x = r6.x * r0.x - 2.0;
    r0.x = r0.w * 2.0 + r0.x;
    r0.xyz = r0.xyz * r5.www;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r5.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r5.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r4.xyz = r4.xzy * r1.yzx;
    r0.x = ps;
    ps = -ModShadowColor.x;
    r0.xyw = r0.yzw * r0.xxx;
    ps = 1.0 + ps;
    r12.z = dot(r11.zxy, r0.wxy);
    r1.x = ps;
    ps = -ModShadowColor.y;
    r0.z = dot(r0.wxy, r8.zxy);
    ps = 1.0 + ps;
    r11.xyz = r0.xyw * r0.zzz;
    r1.y = ps;
    ps = -ModShadowColor.z;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r8.xyz = r11.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r1.w = saturate(dot(r10.zxy, r8.zxy));
    r1.z = ps;
    r5.xy = r5.xy * r2.zw + 0.125;
    ps = ConstantLighting.x * r0.w;
    r2.yz = r5.zw + 0.5;
    r2.x = ps;
    ps = ConstantLighting.y * r0.w;
    r2.zw = abs(r2.yz) * abs(r2.yz);
    r2.y = ps;
    ps = log2(r1.w);
    r0.z = r5.x * r5.y;
    r0.y = ps;
    r1.xyz = r0.zzz * r1.xyz + ModShadowColor.xyz;
    ps = 15.0 * r0.y;
    r8.xyz = r4.xzy * r2.zzz;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r5.xyz = r4.xzy * r2.www;
    r0.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r9.xzy;
    r5.xyz = r8.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r0.w;
    r8.xyz = r0.zzz * ConstantLighting.xzy;
    r2.z = ps;
    r0.xyz = r8.xyz * r7.xyz + r5.xzy;
    r0.xyz = r2.xyz * r4.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xzy * r1.xzy;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xzy - r0.xzy;
    r1.w = ps;
    oC0.w = r1.w * r6.y + r3.w;
    r0.xyz = r1.xyz * r6.yyy + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
