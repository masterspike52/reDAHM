// ps_b06aac4aa3eaa15a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 375 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005DC 10041800 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r2.w - 4e+02;
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r11.xy = r5.zw * abs(r7.xy);
    r5.w = ps;
    ps = -r0.z;
    r9.xy = r0.wz * 6.0;
    ps = 1.0 + ps;
    r9.zw = r0.wz * UniformVector_6.xy;
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r10.xy = r0.wz * UniformVector_1.xy;
    r7.y = ps;
    ps = 0.00022222222 * r5.y;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = (-0.025) * r5.x;
    r3.yzw = r5.www * r3.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r7.xw = r3.yz * r5.xx;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r7.z = ps;
    ps = r7.z;
    r8.xyz = r5.xxx * r1.xyz;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r5.xz = float2((r7.zy >= 0.5));
    r5.y = ps;
    ps = (-0.5) + r7.y;
    r8.w = dot(r5.xzz, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.yw = r5.yw - r7.zy;
    ps = r2.w;
    r10.zw = r5.yw * r5.xz;
    ps = 0.0001 * ps;
    r6.xyz = r8.zww + float3(0.1, -3.0, -2.0);
    r5.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r1 = r7.xwzy + r10;
    r5.y = ps;
    ps = 5.0 * r6.x;
    r5.z = r1.y * r5.y;
    r5.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r10.xzw = -r5.zxy + 1.0;
    r10.y = ps;
    ps = r1.z + r1.z;
    r5.yz = r10.xy * UniformVector_2.yx;
    r7.x = ps;
    ps = r1.w + r1.w;
    r5.x = r5.z * r1.x;
    r7.y = ps;
    r14.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r18.zw = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r7 = tex2D(Texture2D_1, r7.xy);
    r23 = tex2D(Texture2D_4, r0.xy);
    r24.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r17.xyw = tex2D(Texture2D_2, r9.xy).xyw;
    r11 = tex2D(Texture2D_1, r5.xy).xzyw;
    r15.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r19.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r3.x = dot(r4.zxy, r4.zxy);
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = trunc(UniformScalar_1.x);
    r0.w = float((UniformScalar_4.x >= 1.0));
    r21.x = ps;
    ps = OpacityOverride.x;
    r0.x = float((UniformScalar_4.x > 1.0));
    r5.x = saturate(ps);
    r13.xyz = r1.zxy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r12.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r6.w = ps;
    ps = UniformScalar_5.x * r5.z;
    r20.xyz = r19.zxy + r19.zxy;
    r18.x = ps;
    r19.yz = r15.xy * 2.0 - 1.0;
    r1.w = (r21.x == 0.0) ? r11.x : r11.z;
    ps = UniformScalar_5.x * r5.w;
    r21.yz = r17.xy + r17.xy;
    r18.y = ps;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r24.xyz : 1.0;
    ps = r17.w;
    r17.xyz = r23.xyz * r23.www;
    ps = r15.w * ps;
    r15.xyz = r22.xzy * r17.xyz;
    r5.x = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.zxy;
    r17.xyz = r0.yxz * r5.ywz + r15.xzy;
    ps = (-1.0) - -r5.x;
    r0.w = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r19.x = ps;
    ps = UniformScalar_5.x * r0.y;
    r21 = r21.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r9.w = ps;
    ps = rsqrt(abs(r3.x));
    r11.x = r9.w * r5.y;
    r5.z = ps;
    r5.y = (r21.y == 0.0) ? r11.y : r1.w;
    ps = r0.w;
    r4.xyz = r5.zzz * r4.xyz;
    ps = -r15.x + ps;
    r1.xy = r21.zw * 0.5;
    r5.z = ps;
    ps = r19.y;
    r6.w = float((r6.w >= 0.004));
    ps = r1.x + ps;
    r19.w = r19.z + r1.y;
    r14.w = ps;
    ps = r5.z;
    r11.yz = r18.xy * r0.zx;
    r20.w = (r21.x == 0.0) ? r11.w : r5.y;
    r5.y = (r8.w == 0.0) ? r7.x : r7.y;
    ps = r15.x + ps;
    r21 = r20 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.x = saturate(ps);
    ps = r21.w;
    r11.xyz = r11.xzy + UniformScalar_6.xxx;
    ps = r20.w + ps;
    r0.yzw = r21.xzy * UniformVector_4.zyx;
    r5.z = ps;
    r7.xy = -r0.wz * r0.xx + r0.wz;
    r5.y = (r6.z == 0.0) ? r7.z : r5.y;
    r5.y = (r6.y == 0.0) ? r7.w : r5.y;
    ps = r5.z;
    r1.xy = -r0.yx + 1.0;
    r7.z = r1.x * r0.x + r0.y;
    ps = -r5.x + ps;
    r5.z = max(r5.y, 0.0);
    r18.x = saturate(ps);
    ps = 1.0 - r5.y;
    r18.y = min(r5.z, 0.3);
    r5.x = ps;
    r19.yz = -r10.ww * ModShadowGroupColor.xy + 1.0;
    ps = 2.5 * r5.x;
    r18.yzw = r18.yzw * float3(3.3333333, 0.875, 0.875);
    r6.x = ps;
    r7.y = r18.y * r19.w + r7.y;
    r5.yzw = r18.yzw * r19.xyz + float3(1.0, 0.125, 0.125);
    r0.w = saturate(r6.x * r5.y - 0.5);
    r14 = r18.xxxy * r14;
    ps = r11.x;
    r5.xw = r5.zy * r5.wx;
    ps = r1.y * ps;
    r6.xyz = r17.xzy - r14.xyz;
    r3.x = ps;
    r5.xyz = r5.xxx * r16.xyz + ModShadowColor.xyz;
    r0.xyz = r6.xyz * r0.www + r14.xyz;
    ps = r7.x;
    r5.w = float((r5.w > 0.9));
    ps = r14.w + ps;
    r6.xyz = r15.xyz * r5.www;
    r7.x = ps;
    ps = r11.z;
    r7.xyz = -r13.xyz + r7.zxy;
    r7.yz = r7.yz * r0.ww + r13.yz;
    r5.w = r7.x * r0.w - 2.0;
    r6.xyz = r6.xyz * r0.www + UniformVector_0.xyz;
    r6.xyz = r12.xzy * r0.xzy + r6.xzy;
    r7.x = r1.z * 2.0 + r5.w;
    ps = r1.y * ps;
    r7.xyw = r7.yzx * r10.zzz;
    r5.w = ps;
    ps = r11.y;
    r7.z = r7.w + 1.0;
    r7.xyz = (r10.zzz > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.xyz = (r10.zzz >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = r1.y * ps;
    r1.x = dot(r7.zxy, r7.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r1.x));
    r0.xyz = r0.xzy * r9.xzy;
    r1.x = ps;
    ps = r3.x;
    r1.xyz = r7.xyz * r1.xxx;
    ps = r0.w * ps;
    r4.w = dot(r1.zxy, r3.wyz);
    r3.x = ps;
    ps = r1.w;
    r7.xyz = r1.xyz * r4.www;
    r3.yzw = r7.xyz * 2.0 - r3.yzw;
    ps = r0.w * ps;
    r1.w = saturate(dot(r8.zxy, r3.wyz));
    r3.y = ps;
    ps = log2(r1.w);
    r3.z = dot(r4.zxy, r1.zxy);
    r3.w = ps;
    ps = r5.w;
    r1.xyw = r3.zzw * float3(-0.5, 0.5, 15.0);
    ps = r0.w * ps;
    r4.xy = r1.xy + 0.5;
    r3.z = ps;
    ps = pow(2.0, r1.w);
    r4.yz = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r1.xyz = r1.zzz * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r0.xzy * r4.yyy;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r0.xzy * r4.zzz;
    r4.z = ps;
    r6.xyz = r8.xyz * UpperSkyColor.xyz + r6.xzy;
    r6.xyz = r7.xzy * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * r3.xzy + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xzy - r5.xzy;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
