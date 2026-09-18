// ps_5a9d170bc0c21761.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041800 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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

    r14 = tex2D(Texture2D_9, r0.xy);
    r7.zw = saturate(UniformVector_12.xy);
    ps = UniformVector_1.x + UniformVector_1.x;
    r12.y = UniformScalar_4.x * UniformScalar_5.x;
    r7.y = ps;
    ps = r3.w;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = (-2e+02) + ps;
    r9.x = dot(r4.zxy, r4.zxy);
    r11.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.y = UniformScalar_3.x * UniformVector_4.x;
    r6.z = ps;
    ps = rsqrt(abs(r9.x));
    r6.w = r14.w - 0.5;
    r9.x = ps;
    ps = rsqrt(abs(r6.x));
    r10.xyz = r9.xxx * r4.xyz;
    r6.x = ps;
    ps = r0.w;
    r9.xyz = r6.xxx * r2.xyz;
    ps = UniformVector_1.x * ps;
    r11.x = r9.z + 0.1;
    r2.x = ps;
    ps = r0.z;
    r11.zw = saturate(r11.xy * float2(5.0, 0.00022222222));
    ps = UniformVector_1.y * ps;
    r6.x = r11.w * (-0.1);
    r2.y = ps;
    ps = UniformScalar_5.x * r6.y;
    r12.zw = r10.xy * r6.xx;
    r12.x = ps;
    ps = UniformVector_2.x * r6.z;
    r6.xy = floor(r12.xy);
    r6.z = ps;
    r6.xy = r6.xy * UniformVector_11.xy - r12.xy;
    ps = 1.0 / UniformVector_1.y;
    r2.zw = r6.xy * r7.zw;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4 = r12.zwxy + r2;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.w = r6.z * r4.x;
    r6.z = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r12.zw = r0.wz * UniformVector_14.xy;
    r7.z = ps;
    r12.xy = r7.yz * r0.wz;
    ps = r3.w;
    r2.xy = r6.yz * abs(r8.xy);
    ps = 0.0001 * ps;
    r11.x = r4.y * r6.x;
    r11.y = saturate(ps);
    r6.xy = r0.yx * UniformVector_13.yx + r4.wz;
    ps = UniformVector_8.x * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.z = ps;
    ps = UniformVector_8.y * r6.x;
    r7.yzw = -r11.xzy + 1.0;
    r6.w = ps;
    r6.yz = frac(r6.zw);
    ps = 1.0 / UniformVector_10.x;
    r6.xw = float2((UniformVector_10.xy >= r6.yz));
    r18.x = ps;
    ps = r6.x * r6.w;
    r18.zw = float2((UniformVector_10.yx > r6.zy));
    r6.x = ps;
    ps = 1.0 - r0.z;
    r2.w = float((UniformScalar_12.x >= 1.0));
    r7.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r13.yz = r7.xy * UniformVector_2.yy;
    r18.y = ps;
    r6.xyz = r6.xyz * r18.zxy;
    ps = UniformVector_2.x * r0.w;
    r4.z = float((UniformScalar_12.x > 1.0));
    r13.x = ps;
    r8 = r13 - 0.5;
    r23 = float4((r13 >= 0.5));
    ps = r0.w + r0.w;
    r8 = r8 - r13;
    r11.z = ps;
    r8 = r8.xywz * r23.xywz + r13.xywz;
    ps = r0.z + r0.z;
    r13 = r8 + r8;
    r11.w = ps;
    r11.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r2.xyz = tex2D(Texture2D_7, r4.xy).xyz;
    r8 = tex2D(Texture2D_3, r13.xy);
    r17 = tex2D(Texture2D_3, r13.zw);
    r19 = tex2D(Texture2D_2, r12.xy);
    r15.xyz = tex2D(Texture2D_8, r12.zw).xyz;
    r4.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    r16.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    r21.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r12 = tex2D(Texture2D_6, r6.yz);
    r0.xyz = tex2D(Texture2D_4, r11.zw).wxy;
    r0.w = dot(r5.zxy, r5.zxy);
    r13.xyz = UniformVector_5.xyz * 2e+01;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r20.yz = r0.yz * 2.0 - 1.0;
    ps = r12.x * r12.w;
    r21.xyz = r21.zxy + r21.zxy;
    r12.x = ps;
    ps = r12.y * r12.w;
    r22.xyz = r14.xyz * UniformScalar_13.xxx;
    r12.y = ps;
    r24.xyz = r16.zxy * 2.0 - 1.0;
    r16.yzw = r4.wxy * 2.0 - 1.0;
    r15.xyz = (-abs(r4.zzz) >= 0.0) ? r15.xyz : 1.0;
    r15.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r15.xyz;
    ps = r12.z * r12.w;
    r24.xyz = r24.xyz - r16.yzw;
    r12.z = ps;
    r16.x = r24.x * r19.w - 2.0;
    r16.yzw = r24.xyz * r19.www + r16.yzw;
    r22.xyz = r22.xyz * r15.xyz + UniformScalar_14.xxx;
    ps = r6.x;
    r11.z = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    ps = r18.w * ps;
    r11.w = dot(r23.wzz, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r2.w = (r11.w == 0.0) ? r17.x : r17.y;
    r4.z = (r11.z == 0.0) ? r8.x : r8.y;
    r12.xyz = r12.xyz * r6.xxx;
    r13.xyz = r13.xyz * r12.xyz;
    ps = OpacityOverride.x;
    r12 = r11.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r18.w = saturate(ps);
    ps = (-1.0) + r0.x;
    r6.x = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r20.x = ps;
    r0.x = (r12.y == 0.0) ? r8.z : r4.z;
    r0.y = (r12.z == 0.0) ? r17.z : r2.w;
    r21.w = (r12.w == 0.0) ? r17.w : r0.y;
    r17.x = (r12.x == 0.0) ? r8.w : r0.x;
    ps = ModShadowGroupColor.x * r7.z;
    r6.x = r6.x - r13.x;
    r18.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r18.x = saturate(r6.x + r13.x);
    r18.z = ps;
    ps = rsqrt(abs(r0.w));
    r6.x = max(r17.x, 0.0);
    r7.x = ps;
    ps = r6.x;
    r12.xyz = r7.xxx * r5.xyz;
    r7.x = ps;
    ps = 0.3;
    r0 = r21 + float4(-1.0, -1.0, -1.0, -0.75);
    r7.y = ps;
    ps = min(r7.x, r7.y);
    r8 = -r18.wxyz + 1.0;
    r6.x = ps;
    ps = r0.w;
    r17.yzw = r0.xzy * UniformVector_4.zyx;
    ps = r21.w + ps;
    r4.xyz = r22.xyz * r8.yyy;
    r7.x = saturate(ps);
    ps = 3.3333333 * r6.x;
    r2.xyz = r7.xxx * r2.xyz;
    r6.x = ps;
    r7.xyz = r6.xxx * r20.xyz;
    r0.xy = -r17.wz * r18.xx + r17.wz;
    r0.xy = r7.yz * 2.0 + r0.xy;
    r5.zw = -r17.xy + 1.0;
    r20.xyz = -r2.xzy + r19.xzy;
    r2.yzw = r20.xyz * r19.www + r2.xzy;
    r0.z = r5.w * r18.x + r17.y;
    ps = 1.0 + r7.x;
    r5.y = r5.z * 2.5;
    r5.x = ps;
    ps = r5.x * r5.z;
    r2.x = float((r8.x >= 0.004));
    r7.x = ps;
    ps = r5.y * r5.x;
    r0.yzw = -r16.yzw + r0.zxy;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r0.x = float((r7.x > 0.9));
    r6.x = saturate(ps);
    r0.yzw = r0.yzw * r6.xxx + r16.xzw;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r13.yzw = r13.xyz * r0.xxx;
    r13.x = ps;
    r5.xyz = r13.yzw * r6.xxx + UniformVector_0.xyz;
    r0.x = r4.w * 2.0 + r0.y;
    r13.yzw = r15.xyz * r14.xyz + r13.yzw;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r14.xyz = r13.yzw - r2.ywz;
    r13.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r0.xyz = r0.xzw * r7.www;
    r13.z = ps;
    r2.yzw = r14.xyz * r6.xxx + r2.ywz;
    r5.xyz = r13.xyz * r2.yzw + r5.xyz;
    ps = 1.0 + r0.x;
    r4.xyz = r4.xzy * r6.xxx;
    r0.w = ps;
    r0.xyz = (r7.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r2.yzw * r6.yzw;
    r6.x = ps;
    r6.yzw = r7.xyz * r6.xxx;
    r2.yzw = r6.www * r1.xyz;
    r11.z = dot(r12.zxy, r6.wyz);
    ps = -ModShadowColor.x;
    r6.x = dot(r6.wyz, r10.zxy);
    ps = 1.0 + ps;
    r6.xzw = r6.yzw * r6.xxx;
    r6.y = ps;
    ps = -ModShadowColor.y;
    r7 = r11.zxyz * float4(-0.5, 0.875, 0.875, 0.5);
    r6.xzw = r6.xzw * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r9.zxy, r6.wxz));
    r6.z = ps;
    r7.yz = r7.yz * r8.zw + 0.125;
    ps = -ModShadowColor.z;
    r7.xw = r7.xw + 0.5;
    ps = 1.0 + ps;
    r7.xw = abs(r7.wx) * abs(r7.wx);
    r6.w = ps;
    ps = log2(r6.x);
    r7.y = r7.y * r7.z;
    r6.x = ps;
    r6.yzw = r7.yyy * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r8.xyz = r0.xzy * r7.xxx;
    r6.x = ps;
    r7.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    ps = pow(2.0, r6.x);
    r5.xyz = r0.xzy * r7.www;
    r6.x = ps;
    r1.xyz = r6.xxx * r1.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.yzw * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r2.x + r3.w;
    r6.xyz = r7.xyz * r2.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
