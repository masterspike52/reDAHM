// ps_3dc37e524aa14086.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 459 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000072C 10041400 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c23); // float4
float4 LowerSkyColor : register(c22); // float3
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 OpacityOverride : register(c20); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.z = UniformScalar_22.x * 0.05;
    ps = r0.w - r0.x;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = r0.z - r0.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r6.xy = r6.xy * UniformScalar_6.xx;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r11.xyz = r7.xxx * r4.xyz;
    r6.w = ps;
    ps = r3.w;
    r10.xyz = r6.www * r2.xyz;
    ps = (-4e+02) + ps;
    r7.x = r10.z + 0.1;
    r7.y = ps;
    ps = 1.0 - r0.z;
    r7.xy = saturate(r7.xy * float2(5.0, 0.00022222222));
    r9.x = ps;
    ps = UniformScalar_1.x;
    r6.z = r6.z * r7.y;
    ps = UniformVector_3.x * ps;
    r6.zw = r11.xy * r6.zz;
    r9.y = ps;
    ps = 1.0 / UniformScalar_2.x;
    r13 = r6 + r0.xywz;
    r6.x = ps;
    ps = r13.z;
    r6.z = float((UniformScalar_17.x >= 1.0));
    r6.y = ps;
    ps = UniformScalar_18.x - r7.w;
    r12 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    r9.z = ps;
    ps = r13.w;
    r4.xw = r9.yz * r6.xz;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r6.zw = r13.xy * UniformVector_5.xy;
    r9.y = ps;
    r2.x = r4.x * UniformScalar_3.x + r6.z;
    ps = UniformVector_1.x * r6.y;
    r14.yz = r9.xy * UniformVector_1.yy;
    r14.w = ps;
    ps = OpacityOverride.x;
    r14.x = r0.w * UniformVector_1.x;
    r9.w = saturate(ps);
    r15 = r14.wzxy - 0.5;
    r19 = float4((r14.wzxy >= 0.5));
    r15 = r15 - r14.wzxy;
    r14 = r15.xzwy * r19.xzwy + r14.wxyz;
    ps = UniformVector_6.y + r6.w;
    r15 = r14 + r14;
    r2.y = ps;
    r14.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r18 = tex2D(Texture2D_3, r15.yz);
    r20 = tex2D(Texture2D_3, r15.xw);
    r6 = tex2D(Texture2D_7, r2.xy);
    r16 = tex2D(Texture2D_6, r0.xy);
    r2 = tex2D(Texture2D_4, r12.zw);
    r12.xyz = tex2D(Texture2D_4, r12.xy).xyw;
    ps = r7.w;
    r9.xyz = UniformVector_4.xyz * 2e+01;
    r15.zw = r2.xy * 2.0 - 1.0;
    ps = 15.0 * ps;
    r6.xyz = r6.xyz * r6.www;
    r6.w = saturate(ps);
    ps = r16.w;
    r4.xyz = r9.xyz * r6.xyz;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r6.z = r4.w + r7.w;
    r6.y = ps;
    ps = -r6.z;
    r4 = r4.yxxz * float4(1.0, 0.3, 1.0, 1.0);
    ps = r7.z + ps;
    r17.xyz = r4.zxw * r6.yyy;
    r6.x = ps;
    ps = r12.x + r12.x;
    r4.w = max(r6.x, UniformScalar_19.x);
    r4.x = ps;
    r6.x = dot(r17.zy, float2(0.11, 0.59)) + 0.0;
    r6.x = dot(r4.zy, r6.yy) + r6.x;
    ps = r12.y + r12.y;
    r7.z = saturate(r6.x - r17.x);
    r4.y = ps;
    ps = 1.0 - r7.x;
    r9.x = dot(r19.zww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    ps = 1.0 - r7.z;
    r9.y = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r6.y = (r9.y == 0.0) ? r20.x : r20.y;
    r6.x = (r9.x == 0.0) ? r18.x : r18.y;
    ps = ModShadowGroupColor.x * r6.z;
    r19 = r9.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r9.x = ps;
    r6.x = (r19.y == 0.0) ? r18.z : r6.x;
    r6.y = (r19.z == 0.0) ? r20.z : r6.y;
    r15.y = (r19.w == 0.0) ? r20.w : r6.y;
    r6.x = (r19.x == 0.0) ? r18.w : r6.x;
    ps = ModShadowGroupColor.y * r6.z;
    r4.z = max(r6.x, 0.0);
    r9.y = ps;
    ps = 1.0 - r6.x;
    r6.yz = min(r4.zw, float2(0.3, 1.0));
    r6.x = ps;
    ps = 1.0 / UniformScalar_20.x;
    r15.x = r6.y * 3.3333333;
    r4.z = ps;
    ps = r6.z;
    r14.xyz = r14.zxy + r14.zxy;
    ps = r4.z * ps;
    r6.yz = -r15.xy + 1.0;
    r9.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r9 = -r9.wxyz + 1.0;
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.w = r9.w * r7.w;
    r4.w = ps;
    r7.w = dot(r6.ww, r6.zz) + r15.y;
    ps = r7.w;
    r8.zw = r4.zw * abs(r8.xy);
    ps = r15.y + ps;
    r2.xw = r12.zw * r2.wz;
    r4.z = ps;
    ps = r6.w;
    r4.xyw = r4.xyz + float3(-1.0, -1.0, 0.25);
    ps = r6.y * ps;
    r12.xy = r4.xy * 0.5;
    r12.z = ps;
    ps = (-1.0) - -r2.x;
    r12.xyz = r15.zxw + r12.xzy;
    r12.w = ps;
    ps = 1.0 - r6.w;
    r12.xzw = r12.wxy * r12.yyz;
    r6.w = ps;
    ps = 2.5 * r6.x;
    r6.y = r12.x + 1.0;
    r6.z = ps;
    r2.yz = r6.yz * r6.xy;
    r2.yz = r2.yz * r6.ww;
    ps = r0.w + r0.w;
    r8.xy = float2((r2.yw >= float2(0.9, 0.05)));
    r6.x = ps;
    ps = r0.z + r0.z;
    r6.z = -r8.y + 1.0;
    r6.y = ps;
    r6.w = (UniformScalar_18.x > 0.0) ? r6.z : 1.0;
    r14.w = (UniformScalar_18.x >= 0.0) ? r6.w : r6.z;
    ps = r13.z + r13.z;
    r14 = r14 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.z = ps;
    ps = r13.w + r13.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.wwww)) clip(-1.0);
    r6.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r15.xyz = tex2D(Texture2D_8, r6.zw).xyz;
    r18 = tex2D(Texture2D_2, r6.xy);
    r0.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    r13.xyz = tex2D(Texture2D_1, r6.xy).xyz;
    r15.w = saturate(r3.w * 0.0001);
    r6.w = dot(r5.zxy, r5.zxy);
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r4.xyz = r16.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    r19.xyz = r13.zxy * 2.0 - 1.0;
    r13.yzw = r0.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r19.xyz = r19.xyz - r13.yzw;
    r6.w = ps;
    r13.x = r19.x * r18.w - 2.0;
    r13.yzw = r19.xyz * r18.www + r13.yzw;
    ps = r4.x;
    r5.xyz = r6.www * r5.xyz;
    ps = r7.x * ps;
    r6.w = float((r9.x >= 0.004));
    r4.x = ps;
    ps = r4.y;
    r7.w = saturate(r4.w - r2.x);
    ps = r7.x * ps;
    r15.xyz = r7.www * r15.xyz;
    r4.y = ps;
    ps = r4.z;
    r19.xyz = -r15.xzy + r18.xzy;
    r15.xyz = r19.xyz * r18.www + r15.xzy;
    ps = r7.x * ps;
    r7.w = saturate(r2.z - 0.5);
    r4.z = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r8.yzw = r17.xyz * r8.xxx;
    r8.x = ps;
    r2.xyz = r8.yzw * r7.www + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r16.xyz = r8.yzw + r16.xyz;
    r8.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r16.xyz = r16.xyz - r15.xzy;
    r8.z = ps;
    r0.xyz = r16.xyz * r7.www + r15.xzy;
    r8.xyz = r8.xyz * r0.xyz + r2.xyz;
    r15.xyz = r14.xzy * UniformVector_3.zyx;
    r2.zw = -r15.zy * r7.zz + r15.zy;
    r2.xy = -r15.xw + 1.0;
    r14.xy = r2.zw + r12.zw;
    r14.z = r2.x * r7.z + r15.x;
    r7.xyz = -r13.yzw + r14.zxy;
    r13.yzw = r7.xyz * r7.www + r13.xzw;
    r13.x = r0.w * 2.0 + r13.y;
    r7.xyz = r13.xzw * r2.yyy;
    ps = 1.0 + r7.x;
    r4.xyz = r4.xzy * r7.www;
    r7.w = ps;
    r7.xyz = (r2.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r2.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r7.w));
    r0.xyz = r0.xyz * r6.yzx;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r2.xyz = r7.zzz * r1.xyz;
    r12.z = dot(r5.zxy, r7.zxy);
    ps = -ModShadowColor.x;
    r6.x = dot(r7.zxy, r11.zxy);
    ps = 1.0 + ps;
    r6.xyz = r7.xyz * r6.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.y = saturate(dot(r10.zxy, r6.zxy));
    r7.y = ps;
    r6.xz = r5.xy * r9.yz + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r5.zw + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.y);
    r6.x = r6.x * r6.z;
    r6.y = ps;
    r7.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r4.xyz + r6.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
