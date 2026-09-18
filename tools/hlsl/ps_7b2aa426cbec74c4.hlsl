// ps_7b2aa426cbec74c4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041400 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r12.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r11.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r13.y = UniformScalar_2.x * UniformVector_6.y;
    ps = UniformVector_6.y;
    r9.zw = r0.wz * UniformVector_7.xy;
    ps = UniformScalar_5.x * ps;
    r19.x = -r0.z + 1.0;
    r13.w = ps;
    ps = OpacityOverride.x;
    r5.w = UniformVector_4.x * UniformScalar_4.x;
    r6.y = saturate(ps);
    ps = UniformScalar_1.x;
    r9.xy = r0.wz * UniformVector_1.xy;
    ps = UniformVector_4.x * ps;
    r6.z = saturate(r2.w * 0.0001);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r2.w - 4e+02;
    r6.x = ps;
    ps = 0.00022222222 * r5.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.y = saturate(ps);
    r11.zw = r8.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.yz = -r6.yz + 1.0;
    r6.y = ps;
    ps = UniformVector_6.x * r5.z;
    r5.y = dot(r1.zxy, r1.zxy);
    r13.x = ps;
    ps = rsqrt(abs(r5.y));
    r10.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r5.yyy * r1.xzy;
    r5.x = ps;
    ps = 0.1 - -r6.y;
    r8.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r1.xzw = r11.yzw * float3(-0.025, 0.5, 0.5);
    r5.y = ps;
    r9.xy = r8.xy * r1.xx + r9.xy;
    ps = 5.0 * r5.x;
    r3.x = r9.y * r5.y;
    r3.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r19.yw = -r3.xy + 1.0;
    r19.z = ps;
    ps = UniformVector_6.x * r5.w;
    r11.yzw = r19.xyz * UniformVector_2.yyx;
    r13.z = ps;
    ps = r11.w;
    r5 = r13 + r0.xyxy;
    ps = r9.x * ps;
    r3.xyz = r11.zxy - 0.5;
    r2.x = ps;
    ps = (-0.5) - -r2.x;
    r17.xyz = float3((r11.xyz >= 0.5));
    r6.w = ps;
    ps = r6.w;
    r3.yzw = r3.yzx - r11.xyz;
    ps = -r2.x + ps;
    r1.xy = float2((r2.xy >= float2(0.5, 0.004)));
    r6.w = ps;
    r3.x = r6.w * r1.x + r2.x;
    r3.yzw = r3.wyz * r17.zxy + r11.zxy;
    r7 = r3.zwxy + r3.zwxy;
    r16.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r3.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15 = tex2D(Texture2D_1, r7.zw);
    r7 = tex2D(Texture2D_1, r7.xy).wyzx;
    r18 = tex2D(Texture2D_4, r5.xy);
    r20 = tex2D(Texture2D_5, r5.zw);
    r10.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r0.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r5.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r11.xyz = UniformVector_5.xyz * 2e+01;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r0.z = float((UniformScalar_8.x > 1.0));
    r9.xyz = r5.wxy * 2.0 - 1.0;
    r5.yz = r0.xy * 2.0 - 1.0;
    r13.xyz = (-abs(r0.zzz) >= 0.0) ? r10.xyz : 1.0;
    ps = r8.w;
    r10.xyz = r12.xyz * UniformScalar_9.xxx;
    ps = r0.w * ps;
    r0.xyz = r20.xyz * r20.www;
    r5.x = ps;
    r0.xyz = r18.xyz * r18.www + r0.xyz;
    r13.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r13.xyz;
    r10.xyz = r10.xyz * r13.xyz + UniformScalar_10.xxx;
    ps = (-1.0) - -r5.x;
    r16.w = r5.y + r1.z;
    r18.x = ps;
    ps = r5.z;
    r11.xyz = r11.xyz * r0.xyz;
    ps = r1.w + ps;
    r5.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r18.w = ps;
    ps = r5.z;
    r6.w = dot(r4.zxy, r4.zxy);
    r18.yz = -r19.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r11.x + ps;
    r0.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    r5.z = (r0.x == 0.0) ? r7.w : r7.y;
    r0.y = r17.z * 2.0 + r1.x;
    r1.z = (r0.y == 0.0) ? r15.x : r15.y;
    ps = r1.w;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = (r0.y == 0.0) ? r7.z : r5.z;
    r1.z = (r0.z == 0.0) ? r15.z : r1.z;
    r7.w = (r0.w == 0.0) ? r15.w : r1.z;
    r5.z = (r0.x == 0.0) ? r7.x : r5.z;
    ps = r11.x + ps;
    r0.x = max(r5.z, 0.0);
    r15.x = saturate(ps);
    ps = r0.x;
    r7.xyz = r3.zxy + r3.zxy;
    r0.x = ps;
    ps = 0.3;
    r3 = r7.xwzy + float4(-1.0, 0.25, -1.0, -1.0);
    r0.y = ps;
    ps = min(r0.x, r0.y);
    r15.yzw = r3.xzw * UniformVector_4.zyx;
    r14.x = ps;
    r3.xw = -r15.zw * r15.xx + r15.zw;
    ps = 1.0 - r5.z;
    r17.yzw = r14.xyz * float3(3.3333333, 0.875, 0.875);
    r0.x = ps;
    r14.y = r17.y * r18.w + r3.x;
    r0.yzw = r17.yzw * r18.xyz + float3(1.0, 0.125, 0.125);
    ps = 2.5 * r0.x;
    r1.xz = -r15.xy + 1.0;
    r5.z = ps;
    r14.z = r1.z * r15.x + r15.y;
    ps = rsqrt(abs(r6.w));
    r1.xzw = r10.xyz * r1.xxx;
    r6.w = ps;
    ps = r3.y;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = r7.w + ps;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = r7.x;
    r10.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz;
    ps = -r5.x + ps;
    r7.xyz = r6.www * r4.xyz;
    r17.x = saturate(ps);
    r6.w = saturate(r5.z * r0.y - 0.5);
    r4 = r17.xxxy * r16;
    r5.xy = r0.yz * r0.xw;
    r0.xyz = r5.yyy * r15.xyz + ModShadowColor.xyz;
    ps = r3.w;
    r5.z = float((r5.x > 0.9));
    ps = r4.w + ps;
    r11.xyz = r11.xzy * r5.zzz;
    r14.x = ps;
    r5.xyz = -r9.xyz + r14.zxy;
    r5.yz = r5.yz * r6.ww + r9.yz;
    r9.xyz = r11.xyz * r6.www + UniformVector_0.xzy;
    r11.xyz = r13.xzy * r12.xzy + r11.xyz;
    r5.x = r5.x * r6.w - 2.0;
    r5.x = r5.w * 2.0 + r5.x;
    r11.xyz = r11.xyz - r4.xzy;
    r4.xyz = r11.xyz * r6.www + r4.xzy;
    r9.xyz = r10.xyz * r4.xzy + r9.xzy;
    r5.xyz = r5.xyz * r2.zzz;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r2.zzz > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r2.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r3.xyz = r4.xzy * r3.xyz;
    r5.x = ps;
    ps = r1.x;
    r5.xyz = r5.yzw * r5.xxx;
    ps = r6.w * ps;
    r5.w = dot(r5.zxy, r8.zxy);
    r4.x = ps;
    ps = r1.w;
    r4.yzw = r5.xyz * r5.www;
    r4.yzw = r4.yzw * 2.0 - r8.xyz;
    ps = r6.w * ps;
    r5.w = saturate(dot(r6.yxz, r4.wyz));
    r4.y = ps;
    ps = log2(r5.w);
    r6.x = dot(r7.zxy, r5.zxy);
    r6.y = ps;
    ps = r1.z;
    r5.xyw = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = r6.w * ps;
    r6.xy = r5.xy + 0.5;
    r4.z = ps;
    ps = pow(2.0, r5.w);
    r5.xy = abs(r6.xy) * abs(r6.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r6.xyz = r5.zzz * ConstantLighting.xyz;
    r7.x = ps;
    ps = ConstantLighting.z * r5.w;
    r8.xyz = r3.xzy * r5.xxx;
    r7.y = ps;
    ps = ConstantLighting.y * r5.w;
    r5.xyz = r3.xzy * r5.yyy;
    r7.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r9.xzy;
    r5.xyz = r8.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r7.xyz * r4.xyz + r5.xzy;
    r5.xyz = r6.xyz * r3.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r0.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r1.y + r2.w;
    r5.xyz = r6.xyz * r1.yyy + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
