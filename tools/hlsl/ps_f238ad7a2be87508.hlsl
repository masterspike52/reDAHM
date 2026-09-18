// ps_f238ad7a2be87508.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 375 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005DC 10041800 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r3.w - 4e+02;
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r13.xy = r6.zw * abs(r8.xy);
    r6.w = ps;
    ps = -r0.z;
    r12.xy = r0.wz * 6.0;
    ps = 1.0 + ps;
    r12.zw = r0.wz * UniformVector_6.xy;
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r8.xy = r0.wz * UniformVector_1.xy;
    r7.y = ps;
    ps = 0.00022222222 * r6.y;
    r6.z = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    ps = (-0.025) * r6.x;
    r9.xyz = r6.www * r4.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r7.zw = r9.xy * r6.xx;
    r6.x = ps;
    ps = UniformVector_2.x * r0.w;
    r24.xyz = UniformVector_5.xzy * 2e+01;
    r7.x = ps;
    ps = r7.x;
    r10.xyz = r6.xxx * r2.xyz;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r6.xz = float2((r7.xy >= 0.5));
    r6.y = ps;
    ps = (-0.5) + r7.y;
    r10.w = dot(r6.xzz, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r6.yw = r6.yw - r7.xy;
    ps = r3.w;
    r8.zw = r6.yw * r6.xz;
    ps = 0.0001 * ps;
    r2.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r6.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r4 = r7.zwxy + r8;
    r6.y = ps;
    ps = 5.0 * r2.x;
    r6.z = r4.y * r6.y;
    r6.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r11.xzw = -r6.zxy + 1.0;
    r11.y = ps;
    ps = r4.z + r4.z;
    r6.yz = r11.xy * UniformVector_2.yx;
    r7.x = ps;
    ps = r4.w + r4.w;
    r6.x = r6.z * r4.x;
    r7.y = ps;
    r8.xyz = tex2D(Texture2D_5, r4.xy).xyz;
    r16.zw = tex2D(ModShadowAccumTexture, r13.xy).xy;
    r21 = tex2D(Texture2D_1, r7.xy);
    r23 = tex2D(Texture2D_4, r0.xy);
    r7.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r15.xyz = tex2D(Texture2D_2, r12.xy).xyw;
    r17 = tex2D(Texture2D_1, r6.xy).xzyw;
    r13.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r18.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    ps = -ModShadowColor.x;
    r2.w = float((UniformScalar_4.x >= 1.0));
    ps = 1.0 + ps;
    r0.w = dot(r5.zxy, r5.zxy);
    r16.x = ps;
    ps = trunc(UniformScalar_1.x);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r18.x = ps;
    ps = OpacityOverride.x;
    r8.w = float((UniformScalar_4.x > 1.0));
    r6.x = saturate(ps);
    r14.xyz = r4.wxy * 2.0 - 1.0;
    ps = UniformScalar_5.x * r6.z;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r22.x = ps;
    ps = UniformScalar_5.x * r6.w;
    r20.xyz = r18.wyz + r18.wyz;
    r22.y = ps;
    r19.yz = r13.xy * 2.0 - 1.0;
    r4.z = (r18.x == 0.0) ? r17.x : r17.z;
    ps = 1.0 - r6.x;
    r18.yz = r15.xy + r15.xy;
    r7.w = ps;
    r7.xyz = (-abs(r8.www) >= 0.0) ? r7.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r23.xyz = r23.xyz * r23.www;
    r0.w = ps;
    ps = r15.z;
    r13.xyz = r24.xzy * r23.xyz;
    r7.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r7.zxy;
    r15.xyz = r7.yxz * r6.ywz + r13.xzy;
    ps = r13.w * ps;
    r2.w = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = UniformScalar_5.x * r7.y;
    r18 = r18.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r8.w = ps;
    ps = (-1.0) - -r6.x;
    r17.x = r8.w * r6.y;
    r19.x = ps;
    r6.z = (r18.y == 0.0) ? r17.y : r4.z;
    ps = r2.w;
    r7.w = float((r7.w >= 0.004));
    ps = -r13.x + ps;
    r4.xy = r18.zw * 0.5;
    r6.y = ps;
    ps = r19.y;
    r17.yz = r22.xy * r7.zx;
    ps = r4.x + ps;
    r19.w = r19.z + r4.y;
    r8.w = ps;
    r20.w = (r18.x == 0.0) ? r17.w : r6.z;
    ps = r6.y;
    r17.xyz = r17.xzy + UniformScalar_6.xxx;
    r6.y = (r10.w == 0.0) ? r21.x : r21.y;
    ps = r13.x + ps;
    r22 = r20 + float4(-1.0, -1.0, -1.0, 0.25);
    r18.x = saturate(ps);
    ps = r22.w;
    r18.yzw = r22.xzy * UniformVector_4.zyx;
    r7.xy = -r18.zw * r18.xx + r18.zw;
    r6.y = (r2.z == 0.0) ? r21.z : r6.y;
    r6.y = (r2.y == 0.0) ? r21.w : r6.y;
    ps = r20.w + ps;
    r6.zw = -r18.yx + 1.0;
    r7.z = ps;
    r2.z = r6.z * r18.x + r18.y;
    ps = r7.z;
    r6.z = max(r6.y, 0.0);
    ps = -r6.x + ps;
    r17.xyz = r17.xzy * r6.www;
    r18.x = saturate(ps);
    ps = 1.0 - r6.y;
    r16.y = min(r6.z, 0.3);
    r6.x = ps;
    r19.yz = -r11.ww * ModShadowGroupColor.xy + 1.0;
    ps = 2.5 * r6.x;
    r18.yzw = r16.yzw * float3(3.3333333, 0.875, 0.875);
    r7.z = ps;
    r2.y = r18.y * r19.w + r7.x;
    r6.yzw = r18.yzw * r19.xyz + float3(1.0, 0.125, 0.125);
    r7.x = saturate(r7.z * r6.y - 0.5);
    ps = -ModShadowColor.y;
    r8 = r18.yxxx * r8.wxyz;
    ps = 1.0 + ps;
    r6.xw = r6.zy * r6.wx;
    r16.y = ps;
    ps = -ModShadowColor.z;
    r4.xyz = r17.xzy * r7.xxx;
    ps = 1.0 + ps;
    r15.xyz = r15.xzy - r8.yzw;
    r16.z = ps;
    r6.xyz = r6.xxx * r16.xyz + ModShadowColor.xyz;
    r8.yzw = r15.xyz * r7.xxx + r8.yzw;
    ps = r7.y;
    r6.w = float((r6.w > 0.9));
    ps = r8.x + ps;
    r13.xyz = r13.xyz * r6.www;
    r2.x = ps;
    r2.xyz = -r14.xyz + r2.zxy;
    r2.yz = r2.yz * r7.xx + r14.yz;
    r6.w = r2.x * r7.x - 2.0;
    r7.xyz = r13.xyz * r7.xxx + UniformVector_0.xyz;
    r7.xyz = r12.xzy * r8.ywz + r7.xzy;
    r2.x = r4.w * 2.0 + r6.w;
    r2.xyw = r2.yzx * r11.zzz;
    ps = r0.w;
    r2.z = r2.w + 1.0;
    r2.xyz = (r11.zzz > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r11.zzz >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.x * ps;
    r6.w = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r8.ywz * r0.xzy;
    r6.w = ps;
    ps = r0.w;
    r2.xyz = r2.xyz * r6.www;
    ps = r5.y * ps;
    r6.w = dot(r2.zxy, r9.zxy);
    r8.y = ps;
    ps = r0.w;
    r11.xyz = r2.xyz * r6.www;
    r9.xyz = r11.xyz * 2.0 - r9.xyz;
    ps = r5.z * ps;
    r6.w = saturate(dot(r10.zxy, r9.zxy));
    r8.z = ps;
    ps = log2(r6.w);
    r5.x = dot(r8.zxy, r2.zxy);
    r5.y = ps;
    r2.xyw = r5.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r2.w);
    r5.xy = r2.xy + 0.5;
    r6.w = ps;
    ps = abs(r5.x) * abs(r5.x);
    r2.xyz = r2.zzz * r1.xyz;
    r0.w = ps;
    ps = abs(r5.y) * abs(r5.y);
    r1.xyz = r6.www * r1.xzy;
    r6.w = ps;
    r5.xyz = r0.xzy * r0.www;
    r8.xyz = r0.xzy * r6.www;
    r7.xyz = r8.xyz * UpperSkyColor.xyz + r7.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r1.xzy * r4.xzy + r7.xzy;
    r7.xyz = r2.xzy * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xzy - r6.xzy;
    r0.w = ps;
    oC0.w = r0.w * r7.w + r3.w;
    r6.xyz = r0.xyz * r7.www + r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
