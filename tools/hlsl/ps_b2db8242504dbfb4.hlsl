// ps_b2db8242504dbfb4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041800 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c19); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c20); // float3
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.w = UniformScalar_16.x * 0.05;
    r6.w = UniformScalar_3.x * UniformVector_4.x;
    ps = r3.w;
    r6.yz = r0.xy * UniformVector_2.xy;
    ps = (-4e+02) + ps;
    r9 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    r6.x = ps;
    ps = 0.00022222222 * r6.x;
    r8.w = r6.w * UniformScalar_4.x;
    r6.w = saturate(ps);
    ps = floor(r8.w);
    r6.x = dot(r4.zxy, r4.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r6.x));
    r6.w = r2.w * r6.w;
    r6.x = ps;
    ps = 1.0 / UniformScalar_1.x;
    r11.yzw = r6.xxx * r4.xyz;
    r6.x = ps;
    r4.xyz = r11.zyx * r6.wwx + r0.zwx;
    ps = 1.0 - r4.x;
    r10.x = r0.w * UniformVector_1.x;
    r8.w = ps;
    ps = 1.0 - r0.z;
    r6.w = dot(r2.zxy, r2.zxy);
    r8.z = ps;
    ps = UniformVector_1.x * r4.y;
    r10.yz = r8.zw * UniformVector_1.yy;
    r10.w = ps;
    ps = r0.w + r0.w;
    r12 = r10.wzxy - 0.5;
    r8.z = ps;
    ps = r0.z + r0.z;
    r23 = float4((r10.wzxy >= 0.5));
    r8.w = ps;
    ps = r4.y + r4.y;
    r12 = r12 - r10.wzxy;
    r22.x = ps;
    r10 = r12.xzwy * r23.xzwy + r10.wxyz;
    ps = r4.x + r4.x;
    r10 = r10 + r10;
    r22.y = ps;
    r13 = tex2D(Texture2D_9, r6.yz);
    r18 = tex2D(Texture2D_2, r8.zw);
    r20 = tex2D(Texture2D_3, r10.yz);
    r24 = tex2D(Texture2D_3, r10.xw);
    r21.y = tex2D(Texture2D_6, r6.yz).x;
    r6.xyz = tex2D(Texture2D_5, r6.yz).xyz;
    r17.xyz = tex2D(Texture2D_4, r9.xy).xyw;
    r16 = tex2D(Texture2D_4, r9.zw);
    r10.xyw = tex2D(Texture2D_0, r22.xy).xyz;
    r9.xyw = tex2D(Texture2D_1, r8.zw).xyz;
    r21.z = saturate(r7.w * 15.0);
    r21.w = float((UniformScalar_11.x >= 1.0));
    r19.xyz = r9.wxy * 2.0 - 1.0;
    r15.xyz = r10.wxy * 2.0 - 1.0;
    r8.zw = r16.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r16.xy = r17.xy + r17.xy;
    r6.w = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = UniformScalar_12.x - r7.w;
    r10.xyz = r6.www * r2.xyz;
    r2.w = ps;
    ps = UniformVector_4.z * r6.x;
    r6.w = r10.z + 0.1;
    r2.x = ps;
    ps = UniformVector_4.x * r6.y;
    r21.x = saturate(r6.w * 5.0);
    r2.y = ps;
    ps = UniformVector_4.y * r6.z;
    r12.xzw = -r21.xzy + 1.0;
    r2.z = ps;
    r14.xyz = r2.wyz * r21.wyy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xy = r12.xx * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r14.x + r7.w;
    r6.z = ps;
    ps = -r6.x;
    r22.zw = r6.yz * abs(r8.xy);
    ps = r7.z + ps;
    r8.x = dot(r23.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r8.y = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r6.w = (r8.y == 0.0) ? r24.x : r24.y;
    r6.x = (r8.x == 0.0) ? r20.x : r20.y;
    ps = UniformScalar_13.x;
    r23 = r8.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r6.x = (r23.y == 0.0) ? r20.z : r6.x;
    r6.w = (r23.z == 0.0) ? r24.z : r6.w;
    r8.y = (r23.w == 0.0) ? r24.w : r6.w;
    r6.x = (r23.x == 0.0) ? r20.w : r6.x;
    ps = max(r6.y, r6.z);
    r6.w = -r6.x + 1.0;
    r6.y = ps;
    ps = 2.5 * r6.w;
    r6.x = max(r6.x, 0.0);
    r6.z = ps;
    ps = 1.0 / UniformScalar_14.x;
    r6.xy = min(r6.xy, float2(0.3, 1.0));
    r4.w = ps;
    ps = 3.3333333 * r6.x;
    r9.w = saturate(r6.y * r4.w);
    r8.x = ps;
    ps = r8.x;
    r19.xyz = r19.xyz - r15.xyz;
    r6.x = ps;
    ps = 0.0001 * r3.w;
    r0.w = dot(r5.zxy, r5.zxy);
    r9.z = saturate(ps);
    ps = 1.0 - r6.x;
    r9 = -r9.wxyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r8.y;
    r17.w = r9.x * r7.w;
    r6.y = ps;
    r6.y = dot(r21.zz, r6.yy) + r8.y;
    ps = r6.y;
    r20.xyz = r19.xyz * r18.www;
    ps = r8.y + ps;
    r7.xy = r17.zw * r16.wz;
    r16.z = ps;
    ps = r21.z;
    r19.xyz = r16.xyz + float3(-1.0, -1.0, 0.25);
    ps = r6.x * ps;
    r16.xy = r19.xy * 0.5;
    r16.z = ps;
    ps = (-1.0) - -r7.x;
    r17.xyz = r8.zxw + r16.xzy;
    r17.w = ps;
    r6.x = r17.w * r17.y + 1.0;
    r7.zw = r6.xz * r6.wx;
    ps = OpacityOverride.x;
    r16.xz = float2((r7.yz >= float2(0.05, 0.9)));
    r16.y = saturate(ps);
    r6.xw = -r16.xy + 1.0;
    r6.y = (UniformScalar_12.x > 0.0) ? r6.x : 1.0;
    r6.y = (UniformScalar_12.x >= 0.0) ? r6.y : r6.x;
    r20.w = r6.y * r13.w;
    ps = r0.y;
    r8.xw = r20.wx + float2(-0.5, -2.0);
    ps = UniformScalar_8.x + ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r4.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r22.zw).xy;
    r0.xyz = tex2D(Texture2D_8, r22.xy).xyz;
    r22 = tex2D(Texture2D_7, r4.zw);
    r23.xyz = UniformVector_5.xyz * 2e+01;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r4.xyz = r13.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = rsqrt(abs(r0.w));
    r22.xyz = r22.xyz * r22.www;
    r0.w = ps;
    ps = (-1.0) - -r2.x;
    r5.xyz = r0.www * r5.xyz;
    r2.w = ps;
    ps = r15.x;
    r2.xyz = r23.xyz * r22.xyz;
    ps = r20.x + ps;
    r2 = r2 * r21.yyyy;
    r15.x = ps;
    ps = r15.y;
    r4.xyz = r4.xyz * r12.www;
    ps = r20.y + ps;
    r0.w = saturate(r19.z - r7.x);
    r15.y = ps;
    ps = r15.z;
    r0.xyz = r0.www * r0.xyz;
    ps = r20.z + ps;
    r19.xyz = -r0.xzy + r18.xzy;
    r15.z = ps;
    r0.xyz = r19.xyz * r18.www + r0.xzy;
    r8.yz = r17.xy * r17.yz + r14.yz;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r8.yz = r8.yz - r15.yz;
    r14.x = ps;
    r7.y = saturate(r7.w * r12.z - 0.5);
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r4.xyz = r4.xzy * r7.yyy;
    r14.y = ps;
    r7.zw = r8.yz * r7.yy + r15.yz;
    ps = -r15.x;
    r2.xyz = r2.xyz * r16.zzz;
    ps = r2.w + ps;
    r15.xyz = r2.xyz + r13.xyz;
    r7.x = ps;
    ps = 1.0 + r7.x;
    r6.w = float((r6.w >= 0.004));
    r2.w = ps;
    r13.xyz = r2.xyz * r7.yyy + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r15.xyz = r15.xyz - r0.xzy;
    r14.z = ps;
    r0.xyz = r15.xyz * r7.yyy + r0.xzy;
    r8.xyz = r14.xyz * r0.xyz + r13.xyz;
    r7.x = r2.w * r7.y + r8.w;
    r7.y = r10.w * 2.0 + r7.x;
    r7.xyz = r7.yzw * r9.www;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r9.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r9.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r7.w));
    r0.xyz = r0.xyz * r6.yzx;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r2.xyz = r7.zzz * r1.xyz;
    r12.z = dot(r5.zxy, r7.zxy);
    ps = -ModShadowColor.x;
    r6.x = dot(r7.zxy, r11.wyz);
    ps = 1.0 + ps;
    r6.xyz = r7.xyz * r6.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.yzw;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r7.y = ps;
    r6.yz = r5.xy * r9.yz + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r5.zw + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
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
