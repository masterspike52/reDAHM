// ps_5a0348b2293e8117.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041800 00000606 00000000 000050C6 003F003F 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
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

    r6.z = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = r3.w - 4e+02;
    r1.w = ps;
    ps = rsqrt(abs(r0.z));
    r9.zw = r1.zw * abs(r6.xy);
    r6.x = ps;
    ps = -r1.y;
    r1.zw = r1.xy * 6.0;
    ps = 1.0 + ps;
    r9.xy = r1.xy * UniformVector_6.xy;
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r11.xy = r1.xy * UniformVector_1.xy;
    r6.y = ps;
    ps = 0.00022222222 * r0.w;
    r7.x = dot(r2.zxy, r2.zxy);
    r0.z = saturate(ps);
    ps = (-0.025) * r0.z;
    r8.xyz = r6.xxx * r4.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r7.x));
    r6.xw = r8.xy * r0.zz;
    r0.z = ps;
    ps = r6.z;
    r7.xyz = r0.zzz * r2.xyz;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r2.xy = float2((r6.zy >= 0.5));
    r0.z = ps;
    ps = (-0.5) + r6.y;
    r7.w = dot(r2.xyy, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r0.zw = r0.zw - r6.zy;
    ps = r3.w;
    r11.zw = r0.zw * r2.xy;
    ps = 0.0001 * ps;
    r2.xyz = r7.zww + float3(0.1, -3.0, -2.0);
    r10.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r4 = r6.xwzy + r11;
    r0.z = ps;
    ps = 5.0 * r2.x;
    r10.z = r4.y * r0.z;
    r10.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r10.xzw = -r10.zxy + 1.0;
    r10.y = ps;
    ps = r4.z + r4.z;
    r6.yz = r10.xy * UniformVector_2.yx;
    r0.z = ps;
    ps = r4.w + r4.w;
    r6.x = r6.z * r4.x;
    r0.w = ps;
    r14.xyz = tex2D(Texture2D_5, r4.xy).xyz;
    r11.yw = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r20 = tex2D(Texture2D_1, r0.zw);
    r23 = tex2D(Texture2D_4, r0.xy);
    r24.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r17.xyw = tex2D(Texture2D_2, r1.zw).xyw;
    r6 = tex2D(Texture2D_1, r6.xy);
    r15.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r18.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r8.w = dot(r5.zxy, r5.zxy);
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = trunc(UniformScalar_1.x);
    r2.w = float((UniformScalar_4.x >= 1.0));
    r19.y = ps;
    ps = OpacityOverride.x;
    r1.x = float((UniformScalar_4.x > 1.0));
    r0.x = saturate(ps);
    r13.xyz = r4.zxy * 2.0 - 1.0;
    ps = 1.0 - r0.x;
    r12.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r1.w = ps;
    ps = UniformScalar_5.x * r0.z;
    r21.xyz = r18.zxy + r18.zxy;
    r11.x = ps;
    r18.xz = r15.xy * 2.0 - 1.0;
    r4.w = (r19.y == 0.0) ? r6.x : r6.y;
    ps = UniformScalar_5.x * r0.w;
    r19.zw = r17.xy + r17.xy;
    r11.z = ps;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? r24.xyz : 1.0;
    ps = r17.w;
    r17.xyz = r23.xyz * r23.www;
    ps = r15.w * ps;
    r15.xyz = r22.xzy * r17.xyz;
    r0.x = ps;
    r1.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r1.zxy;
    r17.xyz = r1.yxz * r0.ywz + r15.xzy;
    ps = (-1.0) - -r0.x;
    r2.w = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r19.x = ps;
    ps = UniformScalar_5.x * r1.y;
    r22 = r19.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r9.w = ps;
    ps = rsqrt(abs(r8.w));
    r18.y = r9.w * r0.y;
    r0.z = ps;
    r0.y = (r22.y == 0.0) ? r6.z : r4.w;
    ps = r2.w;
    r6.xyz = r0.zzz * r5.xyz;
    ps = -r15.x + ps;
    r4.xy = r22.zw * 0.5;
    r0.z = ps;
    ps = r18.x;
    r1.w = float((r1.w >= 0.004));
    ps = r4.x + ps;
    r19.w = r18.z + r4.y;
    r14.w = ps;
    ps = r0.z;
    r18.zw = r11.xz * r1.zx;
    r21.w = (r22.x == 0.0) ? r6.w : r0.y;
    r0.y = (r7.w == 0.0) ? r20.x : r20.y;
    ps = r15.x + ps;
    r22 = r21 + float4(-1.0, -1.0, -1.0, 0.25);
    r18.x = saturate(ps);
    ps = r22.w;
    r5.xyz = r18.ywz + UniformScalar_6.xxx;
    ps = r21.w + ps;
    r18.yzw = r22.xzy * UniformVector_4.zyx;
    r0.z = ps;
    r1.xy = -r18.wz * r18.xx + r18.wz;
    r0.y = (r2.z == 0.0) ? r20.z : r0.y;
    r0.y = (r2.y == 0.0) ? r20.w : r0.y;
    ps = r0.z;
    r4.xy = -r18.yx + 1.0;
    r11.z = r4.x * r18.x + r18.y;
    ps = -r0.x + ps;
    r0.z = max(r0.y, 0.0);
    r18.x = saturate(ps);
    ps = 1.0 - r0.y;
    r11.x = min(r0.z, 0.3);
    r0.x = ps;
    r19.yz = -r10.ww * ModShadowGroupColor.xy + 1.0;
    ps = 2.5 * r0.x;
    r18.yzw = r11.xyw * float3(3.3333333, 0.875, 0.875);
    r1.z = ps;
    r11.y = r18.y * r19.w + r1.y;
    r0.yzw = r18.yzw * r19.xyz + float3(1.0, 0.125, 0.125);
    r2.w = saturate(r1.z * r0.y - 0.5);
    r14 = r18.xxxy * r14;
    ps = r5.x;
    r0.xw = r0.zy * r0.wx;
    ps = r4.y * ps;
    r2.xyz = r17.xzy - r14.xyz;
    r5.x = ps;
    r0.xyz = r0.xxx * r16.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xyz * r2.www + r14.xyz;
    ps = r1.x;
    r0.w = float((r0.w > 0.9));
    ps = r14.w + ps;
    r1.xyz = r15.xyz * r0.www;
    r11.x = ps;
    ps = r5.z;
    r11.xyz = -r13.xyz + r11.zxy;
    r11.yz = r11.yz * r2.ww + r13.yz;
    r0.w = r11.x * r2.w - 2.0;
    r1.xyz = r1.xyz * r2.www + UniformVector_0.xyz;
    r1.xyz = r12.xzy * r2.xzy + r1.xzy;
    r11.x = r4.z * 2.0 + r0.w;
    ps = r4.y * ps;
    r11.xyw = r11.yzx * r10.zzz;
    r0.w = ps;
    ps = r5.y;
    r11.z = r11.w + 1.0;
    r5.yzw = (r10.zzz > 0.0) ? r11.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.zzz >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = r4.y * ps;
    r4.x = dot(r5.wyz, r5.wyz);
    r4.w = ps;
    ps = rsqrt(abs(r4.x));
    r2.xyz = r2.xzy * r9.xzy;
    r4.x = ps;
    ps = r5.x;
    r4.xyz = r5.yzw * r4.xxx;
    ps = r2.w * ps;
    r5.y = dot(r4.zxy, r8.zxy);
    r5.x = ps;
    ps = r4.w;
    r5.yzw = r4.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r8.xyz;
    ps = r2.w * ps;
    r4.w = saturate(dot(r7.zxy, r5.wyz));
    r5.y = ps;
    ps = log2(r4.w);
    r5.z = dot(r6.zxy, r4.zxy);
    r5.w = ps;
    ps = r0.w;
    r4.xyw = r5.zzw * float3(-0.5, 0.5, 15.0);
    ps = r2.w * ps;
    r6.xy = r4.xy + 0.5;
    r5.z = ps;
    ps = pow(2.0, r4.w);
    r6.yz = abs(r6.xy) * abs(r6.xy);
    r0.w = ps;
    ps = ConstantLighting.x * r0.w;
    r4.xyz = r4.zzz * ConstantLighting.xyz;
    r6.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r2.xzy * r6.yyy;
    r6.y = ps;
    ps = ConstantLighting.y * r0.w;
    r8.xyz = r2.xzy * r6.zzz;
    r6.z = ps;
    r1.xyz = r8.xyz * UpperSkyColor.xyz + r1.xzy;
    r1.xyz = r7.xzy * LowerSkyColor.xzy + r1.xzy;
    r1.xyz = r6.xzy * r5.xzy + r1.xzy;
    r1.xyz = r4.xzy * r2.xyz + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xzy - r0.xzy;
    r2.w = ps;
    oC0.w = r2.w * r1.w + r3.w;
    r0.xyz = r2.xyz * r1.www + r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
