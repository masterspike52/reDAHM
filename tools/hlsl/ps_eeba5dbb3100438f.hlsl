// ps_eeba5dbb3100438f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 450 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000708 10041800 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
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

    r7.xy = r0.xy * UniformVector_3.xy;
    r10 = tex2D(Texture2D_8, r7.xy);
    ps = (-0.5) + r10.w;
    r6.xy = r0.wz * 6.0;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r3.w;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    r11.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r11.x = saturate(r6.w * 0.00022222222);
    r6.z = ps;
    r16.xyz = r6.zzz * r4.xyz;
    r9.xyz = r11.xyz * float3(-0.025, 0.5, 0.5);
    r4.xw = r16.xy * r9.xx + r6.xy;
    r22.x = tex2D(Texture2D_4, r7.xy).x;
    r6.yzw = tex2D(Texture2D_0, r4.xw).xzy;
    r7.yzw = tex2D(Texture2D_3, r7.xy).xyz;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r13.x = r0.w * UniformVector_2.x;
    r4.y = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r6.x = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r23.x = -r0.z + 1.0;
    r6.x = ps;
    r7.yzw = r7.zyw * 2.0 + float3(0.0, 0.0, -2.0);
    r7.x = (-abs(r7.x) >= 0.0) ? 1.0 : (-1.0);
    r22.w = (-abs(r4.y) >= 0.0) ? (-1.0) : r7.x;
    r17.xyz = r6.xxx * r2.xyz;
    ps = 1.0 / UniformVector_1.y;
    r6.x = r17.z + 0.1;
    r7.x = ps;
    ps = 5.0 * r6.x;
    r11.xyz = r6.zyw + r6.zyw;
    r2.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.z = r4.w * r7.x;
    r2.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r23.yw = -r2.zy + 1.0;
    r23.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r23.xyz * UniformVector_2.yyx;
    r2.y = ps;
    ps = r13.w;
    r4.yz = r2.xy * abs(r8.xy);
    ps = r4.x * ps;
    r2.xyz = r13.zxy - 0.5;
    r11.w = ps;
    ps = OpacityOverride.x;
    r22.y = float((r11.w >= 0.5));
    r22.z = saturate(ps);
    ps = (-1.0) + r7.z;
    r12.yzw = float3((r13.xyz >= 0.5));
    r8.y = ps;
    ps = (-1.0) + r7.y;
    r2.xyz = r2.yzx - r13.xyz;
    r8.z = ps;
    ps = r8.y;
    r15 = r11 + float4(-1.0, -1.0, -1.0, -0.5);
    r2.yzw = r2.zxy * r12.wyz + r13.zxy;
    ps = r22.w * ps;
    r8.w = r15.w - r11.w;
    r8.x = ps;
    r8.xyz = r8.xzw * r22.xxy;
    r2.x = r11.w + r8.z;
    r2 = r2.zwxy + r2.zwxy;
    r11.yz = tex2D(ModShadowAccumTexture, r4.yz).xy;
    r14 = tex2D(Texture2D_1, r2.xy);
    r6.xyw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = r0.y;
    r7.x = UniformScalar_4.x * UniformScalar_3.x;
    r8.zw = r6.wy * 2.0 - 1.0;
    ps = UniformScalar_8.x + ps;
    r6.y = r22.w * UniformScalar_3.x;
    r13.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r2.xy = r0.wz * UniformVector_5.xy;
    r12.x = ps;
    r4.z = r12.w * 2.0 + r22.y;
    ps = r8.w;
    r4.y = dot(r12.yzz, float3(1.0, 1.0, 1.0));
    r8.w = (r4.y == 0.0) ? r14.x : r14.y;
    ps = r9.y + ps;
    r12.yz = r7.xw * r22.wx;
    r7.x = ps;
    ps = r8.z;
    r21 = r4.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r7.y = (r21.y == 0.0) ? r14.z : r8.w;
    r7.z = (r21.x == 0.0) ? r14.w : r7.y;
    ps = r9.z + ps;
    r7.w = max(r7.z, 0.0);
    r7.y = ps;
    ps = floor(r12.x);
    r11.x = min(r7.w, 0.3);
    r18.z = ps;
    ps = floor(r12.y);
    r19.xyz = r11.xyz * float3(3.3333333, 0.875, 0.875);
    r18.w = ps;
    r7.xy = r19.xx * r7.xy + r8.xy;
    ps = 1.0 / UniformScalar_1.x;
    r18.xy = r7.xy - r15.yz;
    r7.x = ps;
    r13.xz = r18.zw * r7.xx + r0.xx;
    r8.xyz = tex2D(Texture2D_6, r4.xw).xyz;
    r20 = tex2D(Texture2D_1, r2.zw);
    r11.xyz = tex2D(Texture2D_7, r2.xy).xyz;
    r2 = tex2D(Texture2D_5, r13.xy);
    r0.x = tex2D(Texture2D_5, r13.zy).w;
    r7.x = dot(r5.zxy, r5.zxy);
    r24.xyz = UniformVector_4.xyz * 2e+01;
    r7.y = float((UniformScalar_11.x >= 1.0));
    r7.w = float((UniformScalar_11.x > 1.0));
    r0.xyz = r2.xyz * r0.xxx;
    r11.xyz = (-abs(r7.www) >= 0.0) ? r11.xyz : 1.0;
    r13.xyz = (-abs(r7.yyy) >= 0.0) ? 1.0 : r11.xyz;
    r0.xyz = r24.xyz * r0.xyz;
    ps = rsqrt(abs(r7.x));
    r14.xyz = r0.xzy * r22.xxx;
    r7.x = ps;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = r2.xyz * r2.www;
    ps = r3.w;
    r2.xyz = r10.xyz * UniformScalar_12.xxx;
    ps = 0.0001 * ps;
    r5.xyz = r7.xxx * r5.xyz;
    r7.x = saturate(ps);
    ps = r9.w;
    r11.xyz = r24.xyz * r11.xyz;
    ps = r6.x * ps;
    r11.xyz = r11.xzy * r22.xxx;
    r6.x = ps;
    r2.xyz = r2.xyz * r13.xyz + UniformScalar_13.xxx;
    ps = (-1.0) - -r6.x;
    r7.yw = r23.ww * ModShadowGroupColor.yx;
    r4.x = ps;
    r0.w = (r4.z == 0.0) ? r20.x : r20.y;
    ps = 1.0 - r7.x;
    r6.yw = -r22.xz + 1.0;
    r4.w = ps;
    ps = 1.0 - r7.y;
    r2.xyz = r2.xyz * r6.yyy;
    r4.y = ps;
    r7.x = (r21.z == 0.0) ? r20.z : r0.w;
    r16.w = (r21.w == 0.0) ? r20.w : r7.x;
    ps = 1.0 - r7.w;
    r7.x = -r7.z + 1.0;
    r4.z = ps;
    ps = 2.5 * r7.x;
    r6.w = float((r6.w >= 0.004));
    r0.w = ps;
    r7.yzw = r19.xyz * r4.xzy + float3(1.0, 0.125, 0.125);
    r0.w = saturate(r0.w * r7.y - 0.5);
    ps = -r15.x;
    r7.xy = r7.yz * r7.xw;
    r0.xyz = r7.yyy * r0.xyz + ModShadowColor.xyz;
    r7.yz = r18.xy * r0.ww + r15.yz;
    ps = r12.z + ps;
    r2.w = float((r7.x > 0.9));
    r6.y = ps;
    ps = 1.0 + r6.y;
    r12.xyz = r11.xzy * r2.www;
    r12.w = ps;
    r15.xyz = r13.xzy * r10.xzy + r12.xzy;
    r11.xyz = r12.xyz * r0.www + UniformVector_0.xyz;
    r6.y = r12.w * r0.w - 2.0;
    r7.x = r6.z * 2.0 + r6.y;
    r7.xyz = r7.xyz * r4.www;
    ps = 1.0 + r7.x;
    r12.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r7.w = ps;
    r7.xyz = (r4.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r4.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.y));
    r4.xyz = r2.xzy * r0.www;
    r6.y = ps;
    r7.xyz = r7.xyz * r6.yyy;
    r2.xyz = r7.zzz * r1.xyz;
    r6.y = dot(r7.zxy, r16.zxy);
    r18.xyz = r7.xyz * r6.yyy;
    r16.xyz = r18.xyz * 2.0 - r16.xyz;
    r6.z = saturate(dot(r17.zxy, r16.zxy));
    ps = log2(r6.z);
    r6.y = dot(r5.zxy, r7.zxy);
    r6.z = ps;
    r16.xyz = r6.yyz * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r16.z);
    r5.xyw = r16.xwy + float3(0.5, 0.25, 0.5);
    r6.y = ps;
    r1.xyz = r6.yyy * r1.xzy;
    r6.y = r5.y + r16.w;
    r6.x = saturate(r6.y - r6.x);
    r8.xyz = r6.xxx * r8.xyz;
    ps = abs(r5.x) * abs(r5.x);
    r6.xyz = r15.xzy - r8.xyz;
    r7.w = ps;
    r7.xyz = r14.xzy * r2.www - r8.xyz;
    r10.xyz = r13.xzy * r10.xzy + r7.xzy;
    r7.xyz = r6.xyz * r0.www + r8.xyz;
    r6.xyz = r12.xzy * r7.xzy + r11.xzy;
    r5.xyz = r10.xzy * r0.www + r8.xyz;
    ps = abs(r5.w) * abs(r5.w);
    r7.xyz = r7.xzy * r9.xzy;
    r0.w = ps;
    r8.xyz = r7.xzy * r0.www;
    r5.xyz = r5.xzy * r9.xzy;
    r5.xyz = r5.xzy * r7.www;
    r6.xyz = r8.xyz * UpperSkyColor.xyz + r6.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r1.xzy * r4.xzy + r6.xzy;
    r6.xyz = r2.xzy * r7.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
