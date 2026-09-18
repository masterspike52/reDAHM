// ps_641e5bf4f573d617.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
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
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r20.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = OpacityOverride.x;
    r5.xy = r0.wz * 6.0;
    r6.x = saturate(ps);
    r8.xyz = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r6.yz = r0.wz * UniformVector_1.xy;
    ps = UniformVector_2.x * ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = -r0.z;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.y = r2.w - 4e+02;
    r5.x = ps;
    r9.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r10.w = r8.z * r20.z;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r10.xyz = r5.www * r1.xyz;
    r5.z = ps;
    ps = 0.00022222222 * r5.y;
    r8.xyz = r5.zzz * r3.xyz;
    r9.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r1.xzw = r9.yzw * float3(-0.025, 0.5, 0.5);
    r5.w = ps;
    r12.zw = r8.xy * r1.xx + r6.yz;
    ps = 1.0 / UniformVector_1.y;
    r1.xy = r10.zw + float2(0.1, -1.0);
    r5.z = ps;
    ps = 5.0 * r1.x;
    r14.xy = r0.wz * UniformVector_7.xy;
    r5.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r12.w * r5.z;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = -r5.zy + 1.0;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.xy = r6.yz * abs(r7.xy);
    r6.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r9.yzw = r5.xyw * UniformVector_2.yyx;
    r6.z = ps;
    ps = r9.w;
    r6.yzw = -r6.yxz + 1.0;
    ps = r12.z * ps;
    r5.yzw = r9.zxy - 0.5;
    r6.x = ps;
    ps = (-0.5) - -r6.x;
    r13.xyz = float3((r9.xyz >= 0.5));
    r5.x = ps;
    ps = r5.x;
    r5.yzw = r5.zwy - r9.xyz;
    ps = -r6.x + ps;
    r7.xy = float2((r6.xz >= float2(0.5, 0.004)));
    r5.x = ps;
    r5.x = r5.x * r7.x + r6.x;
    r5.yzw = r5.wyz * r13.zxy + r9.zxy;
    r5 = r5.zwxy + r5.zwxy;
    r12.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r9.yzw = tex2D(Texture2D_6, r12.zw).xyz;
    r19 = tex2D(Texture2D_1, r5.zw).xzwy;
    r3 = tex2D(Texture2D_1, r5.xy);
    r11 = tex2D(Texture2D_5, r0.xy);
    r18 = tex2D(Texture2D_4, r0.xy).xzyw;
    r16.xyz = tex2D(Texture2D_8, r14.xy).xyz;
    r15.xyw = tex2D(Texture2D_3, r0.xy).xzy;
    r0.xyz = tex2D(Texture2D_0, r12.zw).zxy;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r5.y = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r0.w = float((UniformScalar_8.x >= 1.0));
    r6.z = ps;
    ps = r2.w;
    r8.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r5.xzw = -UniformVector_0.yxz + 1.0;
    r6.x = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r5.z;
    r12.z = float((UniformScalar_8.x > 1.0));
    r9.x = ps;
    r14.xyz = r0.xyz * 2.0 - 1.0;
    r7.zw = r20.xy * 2.0 - 1.0;
    r16.yzw = (-abs(r12.zzz) >= 0.0) ? r16.xyz : 1.0;
    ps = r18.x * r18.w;
    r12.zw = r17.yz * UniformScalar_9.xx;
    r18.x = ps;
    ps = rsqrt(abs(r8.w));
    r20.xyz = r11.xzy * r11.www;
    r8.w = ps;
    ps = r18.y * r18.w;
    r11.xyz = r8.www * r4.xyz;
    r18.y = ps;
    ps = r18.z * r18.w;
    r20.xyz = r22.xyz * r20.xyz;
    r18.z = ps;
    ps = r15.y + r15.y;
    r21.xyz = r21.xyz * r18.xyz;
    r16.x = ps;
    r18.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r16.yzw;
    ps = r15.x + r15.x;
    r4.yz = r12.zw * r18.yz;
    r16.y = ps;
    r15.xyz = (-abs(r6.zzz) >= 0.0) ? r20.xyz : r21.xyz;
    ps = r15.w + r15.w;
    r6.z = r18.x * UniformScalar_9.x;
    r16.z = ps;
    ps = r6.z;
    r1.zw = r7.zw + r1.zw;
    r15.xyz = (-abs(r5.yyy) >= 0.0) ? r20.xyz : r15.xyz;
    ps = r17.x * ps;
    r5.y = dot(r15.yxz, float3(0.11, 0.3, 0.59));
    r4.x = ps;
    ps = r5.y;
    r15.w = saturate(dot(r15.zyx, float3(0.59, 0.11, 0.3)));
    ps = -r15.x + ps;
    r4.xyz = r4.xyz + UniformScalar_10.xxx;
    r5.y = ps;
    ps = r5.y;
    r7.z = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r5.y = (r7.z == 0.0) ? r3.x : r3.y;
    r7.w = r13.z * 2.0 + r7.x;
    r6.z = (r7.w == 0.0) ? r19.x : r19.w;
    ps = r15.x + ps;
    r13 = r7.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r19.x = saturate(ps);
    r5.y = (r13.y == 0.0) ? r3.z : r5.y;
    r6.z = (r13.z == 0.0) ? r19.y : r6.z;
    r16.w = (r13.w == 0.0) ? r19.z : r6.z;
    r6.z = (r13.x == 0.0) ? r3.w : r5.y;
    ps = 1.0 - r6.x;
    r5.y = max(r6.z, 0.0);
    r3.w = ps;
    ps = 1.0 - r6.z;
    r5.y = min(r5.y, 0.3);
    r3.x = ps;
    ps = 2.5 * r3.x;
    r13 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r3.z = ps;
    ps = 3.3333333 * r5.y;
    r6.x = r13.w + r16.w;
    r5.y = ps;
    ps = r6.x;
    r19.yzw = r13.xzy * UniformVector_4.zyx;
    r3.y = r5.y * r1.y + 1.0;
    r7.zw = -r19.wz * r15.ww + r19.wz;
    r16.xy = r5.yy * r1.zw + r7.zw;
    ps = -r10.w + ps;
    r1.yz = -r19.xy + 1.0;
    r5.y = saturate(ps);
    ps = r3.y * r3.x;
    r13.xyz = r5.yyy * r9.yzw;
    r5.y = ps;
    ps = r3.z * r3.y;
    r4.xyz = r4.xyz * r1.yyy;
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.y * r5.x;
    r1.x = float((r5.y > 0.9));
    r9.y = ps;
    ps = (-0.5) + r6.x;
    r15 = r1.xxxz * r15.xzyw;
    r5.y = saturate(ps);
    r1.xyz = r15.xyz * r5.yyy + UniformVector_0.xyz;
    ps = r19.y;
    r4.xyz = r4.xzy * r5.yyy;
    r17.xyz = r18.xzy * r17.xzy + r15.xzy;
    ps = r15.w + ps;
    r15.xyz = r17.xyz - r13.xzy;
    r16.z = ps;
    ps = AmbientColorAndSkyFactor.z * r5.w;
    r0.yzw = -r14.yzx + r16.xyz;
    r9.z = ps;
    r13.xyz = r15.xyz * r5.yyy + r13.xzy;
    r9.xyz = r9.xyz * r13.xzy + r1.xyz;
    r0.yz = r0.yz * r5.yy + r14.yz;
    r5.y = r0.w * r5.y - 2.0;
    r0.x = r0.x * 2.0 + r5.y;
    r0.xyz = r0.xyz * r3.www;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r3.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r3.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.y));
    r0.xyz = r13.xzy * r5.zxw;
    r5.x = ps;
    ps = -ModShadowColor.x;
    r5.xyw = r1.xyz * r5.xxx;
    ps = 1.0 + ps;
    r12.z = dot(r11.zxy, r5.wxy);
    r3.x = ps;
    ps = -ModShadowColor.y;
    r5.z = dot(r5.wxy, r8.zxy);
    ps = 1.0 + ps;
    r11.xyz = r5.xyw * r5.zzz;
    r3.y = ps;
    ps = -ModShadowColor.z;
    r1 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r8.xyz = r11.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r0.w = saturate(dot(r10.zxy, r8.zxy));
    r3.z = ps;
    r6.xy = r1.xy * r6.yw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r6.zw = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r6.zw) * abs(r6.zw);
    r1.y = ps;
    ps = log2(r0.w);
    r5.z = r6.x * r6.y;
    r5.y = ps;
    r6.xyz = r5.zzz * r3.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.y;
    r8.xyz = r0.xzy * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r3.xyz = r0.xzy * r1.www;
    r5.z = ps;
    r3.xyz = r3.xyz * UpperSkyColor.xzy + r9.xzy;
    r3.xyz = r8.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r8.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r8.xyz * r4.xyz + r3.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r7.y + r2.w;
    r5.xyz = r6.xyz * r7.yyy + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
