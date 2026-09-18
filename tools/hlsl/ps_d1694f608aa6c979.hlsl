// ps_d1694f608aa6c979.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 462 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000738 10041400 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c17); // float3
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

    ps = -r7.w;
    r6.x = UniformScalar_13.x * 0.05;
    ps = UniformScalar_9.x + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r11.w = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r11.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = r3.w;
    r10.xyz = r6.yyy * r2.xyz;
    ps = (-4e+02) + ps;
    r6.z = r10.z + 0.1;
    r6.y = ps;
    ps = r0.w;
    r13.yw = saturate(r6.zy * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r6.y = r6.x * r13.w;
    r6.x = ps;
    r9.yz = r11.xy * r6.yy + r0.wz;
    ps = UniformVector_1.x * r0.w;
    r9.w = -r0.z + 1.0;
    r12.x = ps;
    ps = r0.z;
    r9.x = -r9.z + 1.0;
    ps = 18.0 * ps;
    r12.yzw = r9.wxy * UniformVector_1.yyx;
    r6.y = ps;
    ps = r0.w;
    r2 = r12.wzxy - 0.5;
    ps = 3.0 * ps;
    r18 = float4((r12.wzxy >= 0.5));
    r6.z = ps;
    ps = r0.z;
    r2 = r2 - r12.wzxy;
    r2 = r2.zwxy * r18.zwxy + r12.xywz;
    ps = 3.0 * ps;
    r4 = r2.xywz + r2.xywz;
    r6.w = ps;
    r2 = tex2D(Texture2D_9, r0.xy);
    r17 = tex2D(Texture2D_3, r4.xy);
    r19 = tex2D(Texture2D_3, r4.wz);
    r14.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r15 = tex2D(Texture2D_4, r6.zw);
    r16.xyz = tex2D(Texture2D_4, r6.xy).xyw;
    ps = r7.w;
    r6.y = float((UniformScalar_8.x >= 1.0));
    ps = 15.0 * ps;
    r4.yz = r16.xy + r16.xy;
    r6.x = saturate(ps);
    r12.zw = r15.xy * 2.0 - 1.0;
    r6.y = r11.w * r6.y + r7.w;
    ps = -r6.y;
    r14.xyz = r14.zxy + r14.zxy;
    ps = r7.z + ps;
    r12.x = dot(r18.zww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    ps = r6.y;
    r12.y = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r4.x = ps;
    r6.z = (r12.y == 0.0) ? r19.x : r19.y;
    r6.y = (r12.x == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_10.x;
    r18 = r12.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r4.w = ps;
    r6.y = (r18.y == 0.0) ? r17.z : r6.y;
    r6.z = (r18.z == 0.0) ? r19.z : r6.z;
    r12.y = (r18.w == 0.0) ? r19.w : r6.z;
    r6.y = (r18.x == 0.0) ? r17.w : r6.y;
    ps = max(r4.x, r4.w);
    r6.w = max(r6.y, 0.0);
    r6.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r6.zw = min(r6.zw, float2(1.0, 0.3));
    r7.x = ps;
    ps = 1.0 - r6.x;
    r4.x = saturate(r6.z * r7.x);
    r7.x = ps;
    ps = 3.3333333 * r6.w;
    r4.x = -r4.x + 1.0;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.w = r4.x * r7.w;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.yw = -r12.yx + 1.0;
    r4.w = ps;
    r6.z = dot(r6.xx, r7.yy) + r12.y;
    ps = r6.z;
    r8.xy = r4.xw * abs(r8.xy);
    ps = r12.y + ps;
    r6.zw = r16.zw * r15.wz;
    r4.x = ps;
    ps = r6.x;
    r4.xyw = r4.yzx + float3(-1.0, -1.0, 0.25);
    ps = r7.w * ps;
    r7.yz = r4.xy * 0.5;
    r7.w = ps;
    ps = (-1.0) - -r6.z;
    r12.xyz = r12.zxw + r7.ywz;
    r12.w = ps;
    ps = 1.0 - r6.y;
    r12.xzw = r12.wxy * r12.yyz;
    r7.y = ps;
    ps = 2.5 * r7.y;
    r7.z = r12.x + 1.0;
    r7.w = ps;
    r6.xy = r7.zw * r7.yz;
    r6.xy = r6.yx * r7.xx;
    r13.xz = float2((r6.wy >= float2(0.05, 0.9)));
    ps = r0.w + r0.w;
    r7.xy = -r13.yx + 1.0;
    r7.z = ps;
    r7.w = (UniformScalar_9.x > 0.0) ? r7.y : 1.0;
    r7.w = (UniformScalar_9.x >= 0.0) ? r7.w : r7.y;
    ps = r0.z + r0.z;
    r14.w = r7.w * r2.w;
    r7.w = ps;
    ps = r9.y + r9.y;
    r16 = r14.wxyz + float4(-0.5, -1.0, -1.0, -1.0);
    r15.x = ps;
    ps = r9.z + r9.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.xxxx)) clip(-1.0);
    r15.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r14.xyz = tex2D(Texture2D_8, r15.xy).xyz;
    r17 = tex2D(Texture2D_2, r7.zw);
    r9 = tex2D(Texture2D_7, r0.xy);
    r8 = tex2D(Texture2D_6, r0.xy).xzyw;
    r0.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r15.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r18.w = saturate(r3.w * 0.0001);
    r7.z = dot(r5.zxy, r5.zxy);
    r19.xyz = UniformVector_4.xzy * 2e+01;
    r4.xyz = r2.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r18.xyz = r15.zxy * 2.0 - 1.0;
    r15.yzw = r0.wxy * 2.0 - 1.0;
    ps = r8.x * r8.w;
    r20.xyz = UniformVector_5.xzy * 2e+01;
    r8.x = ps;
    ps = r8.y * r8.w;
    r9.xyz = r9.xzy * r9.www;
    r8.y = ps;
    ps = r8.z * r8.w;
    r9.xyz = r20.xyz * r9.xyz;
    r8.z = ps;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r8.xyz = r19.xyz * r8.xyz;
    r7.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r18.xyz = r18.xyz - r15.yzw;
    r0.z = ps;
    r15.x = r18.x * r17.w - 2.0;
    r15.yzw = r18.xyz * r17.www + r15.yzw;
    r8.xyz = (-abs(r0.zzz) >= 0.0) ? r9.xyz : r8.xyz;
    r9.xyz = (-abs(r7.www) >= 0.0) ? r9.xyz : r8.xyz;
    r7.w = dot(r9.yxz, float3(0.11, 0.3, 0.59));
    r7.w = r7.w - r9.x;
    ps = rsqrt(abs(r7.z));
    r9.w = saturate(r7.w + r9.x);
    r7.z = ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r5.xyz = r7.zzz * r5.xyz;
    r14.w = saturate(dot(r9.zyx, float3(0.59, 0.11, 0.3)));
    ps = (-0.5) + r6.x;
    r13.yzw = r13.zzz * r9.xzy;
    r2.w = saturate(ps);
    r7.yzw = r13.yzw * r2.www + UniformVector_0.xyz;
    ps = OpacityOverride.x;
    r9.yz = r7.xx * ModShadowGroupColor.xy;
    r9.x = saturate(ps);
    ps = r4.w;
    r9 = -r9.wxyz + 1.0;
    ps = -r6.z + ps;
    r4.xyz = r4.xyz * r9.xxx;
    r13.x = saturate(ps);
    ps = r13.y;
    r7.x = float((r9.y >= 0.004));
    ps = r2.x + ps;
    r4.xyz = r4.xzy * r2.www;
    r16.x = ps;
    ps = r13.z;
    r18.xyz = r16.ywz * UniformVector_3.zyx;
    r6.xy = -r18.zy * r14.ww + r18.zy;
    ps = r2.y + ps;
    r13.yz = -r18.xw + 1.0;
    r16.y = ps;
    ps = r13.w;
    r6.xy = r6.xy + r12.zw;
    ps = r2.z + ps;
    r14 = r13.xxxy * r14;
    r16.z = ps;
    ps = r18.x;
    r2.xyz = -r14.xzy + r17.xzy;
    r2.xyz = r2.xyz * r17.www + r14.xzy;
    ps = r14.w + ps;
    r14.xyz = r16.xyz - r2.xzy;
    r6.z = ps;
    r6.xyz = -r15.yzw + r6.zxy;
    r6.yzw = r6.xyz * r2.www + r15.xzw;
    r2.xyz = r14.xyz * r2.www + r2.xzy;
    r7.yzw = r8.xyz * r2.xyz + r7.yzw;
    r6.x = r0.w * 2.0 + r6.y;
    r6.xyz = r6.xzw * r13.zzz;
    ps = 1.0 + r6.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r13.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r13.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r2.xyz * r0.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r2.xyz = r6.www * r1.xyz;
    r12.z = dot(r5.zxy, r6.wyz);
    r6.x = dot(r6.wyz, r11.zxy);
    r6.xyz = r6.yzw * r6.xxx;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.y = saturate(dot(r10.zxy, r6.zxy));
    r6.xz = r5.xy * r9.zw + 0.125;
    r5.xy = r5.zw + 0.5;
    r5.xy = abs(r5.xy) * abs(r5.xy);
    ps = log2(r6.y);
    r6.x = r6.x * r6.z;
    r6.y = ps;
    r6.xzw = r6.xxx * r8.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r8.xyz = r0.xzy * r5.yyy;
    r6.y = ps;
    r7.yzw = r8.xyz * UpperSkyColor.xzy + r7.ywz;
    ps = pow(2.0, r6.y);
    r5.xyz = r0.xzy * r5.xxx;
    r6.y = ps;
    r1.xyz = r6.yyy * r1.xzy;
    r7.yzw = r5.xzy * LowerSkyColor.xyz + r7.ywz;
    r7.yzw = r1.xyz * r4.xyz + r7.ywz;
    r7.yzw = r2.xyz * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
