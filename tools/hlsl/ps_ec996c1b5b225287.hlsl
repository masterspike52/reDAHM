// ps_ec996c1b5b225287.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 447 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006FC 10041800 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 ConstantLighting : register(c21); // float3
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UpperSkyColor : register(c18); // float3
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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.xy * UniformVector_3.xy;
    r9 = tex2D(Texture2D_8, r6.xy);
    ps = (-0.5) + r9.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r2.w;
    r5.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r10.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r10.x = saturate(r5.w * 0.00022222222);
    r5.z = ps;
    r16.xyz = r5.zzz * r3.xyz;
    r3.xzw = r10.xyz * float3(-0.025, 0.5, 0.5);
    r3.xy = r16.xy * r3.xx + r5.xy;
    r21.x = tex2D(Texture2D_4, r6.xy).x;
    r5.yzw = tex2D(Texture2D_0, r3.xy).xzy;
    r6.yzw = tex2D(Texture2D_3, r6.xy).xyz;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r13.x = r0.w * UniformVector_2.x;
    r8.z = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r5.x = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r23.x = -r0.z + 1.0;
    r5.x = ps;
    r6.yzw = r6.zyw * 2.0 + float3(0.0, 0.0, -2.0);
    r6.x = (-abs(r6.x) >= 0.0) ? 1.0 : (-1.0);
    r21.w = (-abs(r8.z) >= 0.0) ? (-1.0) : r6.x;
    r15.xyz = r5.xxx * r1.xyz;
    ps = 1.0 / UniformVector_1.y;
    r5.x = r15.z + 0.1;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r12.xyz = r5.zyw + r5.zyw;
    r1.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = r3.y * r6.x;
    r1.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r23.yw = -r1.zy + 1.0;
    r23.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r23.xyz * UniformVector_2.yyx;
    r1.y = ps;
    ps = r13.w;
    r10.xy = r1.xy * abs(r7.xy);
    ps = r3.x * ps;
    r1.xyz = r13.zxy - 0.5;
    r12.w = ps;
    ps = OpacityOverride.x;
    r21.y = float((r12.w >= 0.5));
    r21.z = saturate(ps);
    ps = (-1.0) + r6.z;
    r11.yzw = float3((r13.xyz >= 0.5));
    r7.y = ps;
    ps = (-1.0) + r6.y;
    r1.xyz = r1.yzx - r13.xyz;
    r7.z = ps;
    ps = r7.y;
    r14 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    r1.yzw = r1.zxy * r11.wyz + r13.zxy;
    ps = r21.w * ps;
    r7.w = r14.w - r12.w;
    r7.x = ps;
    r7.xyz = r7.xwz * r21.xyx;
    r1.x = r12.w + r7.y;
    r1 = r1.zwxy + r1.zwxy;
    r10.yz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r12 = tex2D(Texture2D_1, r1.xy);
    r5.xyw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = r0.y;
    r6.x = UniformScalar_4.x * UniformScalar_3.x;
    r8.xy = r5.yw * 2.0 - 1.0;
    ps = UniformScalar_8.x + ps;
    r5.y = r21.w * UniformScalar_3.x;
    r7.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r1.xy = r0.wz * UniformVector_5.xy;
    r11.x = ps;
    r22.y = r11.w * 2.0 + r21.y;
    ps = r8.x;
    r22.x = dot(r11.yzz, float3(1.0, 1.0, 1.0));
    r7.w = (r22.x == 0.0) ? r12.x : r12.y;
    ps = r3.z + ps;
    r11.yz = r6.xw * r21.wx;
    r6.x = ps;
    ps = r8.y;
    r20 = r22.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.y = (r20.y == 0.0) ? r12.z : r7.w;
    r6.z = (r20.x == 0.0) ? r12.w : r6.y;
    ps = r3.w + ps;
    r6.w = max(r6.z, 0.0);
    r6.y = ps;
    ps = floor(r11.x);
    r10.x = min(r6.w, 0.3);
    r17.z = ps;
    ps = floor(r11.y);
    r18.xyz = r10.xyz * float3(3.3333333, 0.875, 0.875);
    r17.w = ps;
    r6.xy = r18.xx * r6.xy + r7.xz;
    ps = 1.0 / UniformScalar_1.x;
    r17.xy = r6.xy - r14.yz;
    r6.x = ps;
    r7.xz = r17.zw * r6.xx + r0.xx;
    r8.xyz = tex2D(Texture2D_6, r3.xy).xyz;
    r19 = tex2D(Texture2D_1, r1.zw);
    r3.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r1 = tex2D(Texture2D_5, r7.xy);
    r0.x = tex2D(Texture2D_5, r7.zy).w;
    r6.x = dot(r4.zxy, r4.zxy);
    r24.xyz = UniformVector_4.xyz * 2e+01;
    r6.y = float((UniformScalar_11.x >= 1.0));
    r6.w = float((UniformScalar_11.x > 1.0));
    r0.xyz = r1.xyz * r0.xxx;
    r3.xyz = (-abs(r6.www) >= 0.0) ? r3.xyz : 1.0;
    r12.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r3.xyz;
    r0.xyz = r24.xyz * r0.xyz;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r0.xzy * r21.xxx;
    r6.x = ps;
    r0.yzw = -ModShadowColor.xyz + 1.0;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r1.xyz * r1.www;
    ps = r2.w;
    r3.xyz = r9.xyz * UniformScalar_12.xxx;
    ps = 0.0001 * ps;
    r1.xyz = r6.xxx * r4.xyz;
    r6.x = saturate(ps);
    ps = r8.w;
    r4.xyz = r24.xyz * r10.xyz;
    ps = r5.x * ps;
    r10.xyz = r4.xzy * r21.xxx;
    r5.y = ps;
    r3.xyz = r3.xyz * r12.xyz + UniformScalar_13.xxx;
    ps = (-1.0) - -r5.y;
    r6.yw = r23.ww * ModShadowGroupColor.yx;
    r4.x = ps;
    r0.x = (r22.y == 0.0) ? r19.x : r19.y;
    ps = 1.0 - r6.x;
    r5.xw = -r21.xz + 1.0;
    r4.w = ps;
    ps = 1.0 - r6.y;
    r3.xyz = r3.xyz * r5.xxx;
    r4.y = ps;
    r6.x = (r20.z == 0.0) ? r19.z : r0.x;
    r15.w = (r20.w == 0.0) ? r19.w : r6.x;
    ps = 1.0 - r6.w;
    r6.x = -r6.z + 1.0;
    r4.z = ps;
    ps = 2.5 * r6.x;
    r0.x = float((r5.w >= 0.004));
    r5.x = ps;
    r6.yzw = r18.xyz * r4.xzy + float3(1.0, 0.125, 0.125);
    r1.w = saturate(r5.x * r6.y - 0.5);
    ps = -r14.x;
    r5.xw = r6.yz * r6.xw;
    r0.yzw = r5.www * r0.yzw + ModShadowColor.xyz;
    r6.yz = r17.xy * r1.ww + r14.yz;
    ps = r11.z + ps;
    r3.w = float((r5.x > 0.9));
    r5.x = ps;
    ps = 1.0 + r5.x;
    r11.xyz = r10.xzy * r3.www;
    r11.w = ps;
    r14.xyz = r12.xzy * r9.xzy + r11.xzy;
    r10.xyz = r11.xyz * r1.www + UniformVector_0.xyz;
    r5.x = r11.w * r1.w - 2.0;
    r6.x = r5.z * 2.0 + r5.x;
    r6.xyz = r6.xyz * r4.www;
    ps = 1.0 + r6.x;
    r11.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r6.w = ps;
    r5.xzw = (r4.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r4.www >= 0.0) ? r5.xzw : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r3.xyz = r3.xzy * r1.www;
    r5.x = ps;
    r5.xzw = r6.xyz * r5.xxx;
    r6.x = dot(r5.wxz, r16.zxy);
    r6.xyz = r5.xzw * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r16.xyz;
    r6.y = saturate(dot(r15.zxy, r6.zxy));
    ps = log2(r6.y);
    r6.x = dot(r1.zxy, r5.wxz);
    r6.y = ps;
    r15.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r15.z);
    r1.xyz = r5.www * ConstantLighting.xyz;
    r5.w = ps;
    r4.xyz = r15.yxw + float3(0.5, 0.5, 0.25);
    r5.x = r4.z + r15.w;
    r5.x = saturate(r5.x - r5.y);
    r8.xyz = r5.xxx * r8.xyz;
    ps = abs(r4.y) * abs(r4.y);
    r5.xyz = r14.xzy - r8.xyz;
    r6.w = ps;
    r6.xyz = r13.xzy * r3.www - r8.xyz;
    r9.xyz = r12.xzy * r9.xzy + r6.xzy;
    r6.xyz = r5.xyz * r1.www + r8.xyz;
    r5.xyz = r11.xzy * r6.xzy + r10.xzy;
    r4.yzw = r9.xzy * r1.www + r8.xyz;
    ps = abs(r4.x) * abs(r4.x);
    r6.xyz = r6.xzy * r7.xzy;
    r1.w = ps;
    ps = ConstantLighting.x * r5.w;
    r8.xyz = r6.xzy * r1.www;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r4.ywz * r7.xzy;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r7.xyz = r7.xzy * r6.www;
    r4.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xyz + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xzy + r5.xzy;
    r5.xyz = r4.xzy * r3.xzy + r5.xzy;
    r5.xyz = r1.xzy * r6.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r0.yzw;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r0.x + r2.w;
    r5.xyz = r6.xyz * r0.xxx + r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
