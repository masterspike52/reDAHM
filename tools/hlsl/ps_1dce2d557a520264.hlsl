// ps_1dce2d557a520264.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041700 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
float4 UpperSkyColor : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r17.w;
    r6.xy = r0.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r2.w = ps;
    r20.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    r15.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = OpacityOverride.x;
    r6.zw = r0.wz * UniformVector_1.xy;
    r6.y = saturate(ps);
    ps = r3.w;
    r7.y = dot(r2.zxy, r2.zxy);
    ps = (-4e+02) + ps;
    r12.x = r20.z * r15.x;
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r6.x = saturate(r6.x * 0.00022222222);
    r7.w = ps;
    ps = (-0.025) * r6.x;
    r7.z = dot(r4.zxy, r4.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r12.yzw = r7.www * r2.xyz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r14.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    r4.zw = r14.xy * r7.yy + r6.zw;
    r7.y = -r4.w * r6.x + 1.0;
    ps = 1.0 / UniformVector_1.x;
    r4.xy = r12.wx + float2(0.1, -1.0);
    r7.z = ps;
    ps = 5.0 * r4.x;
    r6.zw = r0.xy * UniformScalar_0.xx;
    r6.x = saturate(ps);
    ps = 1.0 - r0.z;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = r7.xzy * UniformVector_2.yxy;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.x = r7.y * r4.z;
    r9.w = ps;
    ps = 1.0 - r6.x;
    r9.xy = r0.wz * UniformVector_6.xy;
    r2.z = ps;
    ps = (-0.5) + r7.x;
    r9.zw = r9.zw * abs(r8.xy);
    r8.x = ps;
    ps = (-0.5) + r7.z;
    r13.zw = float2((r7.xz >= 0.5));
    r8.y = ps;
    ps = 1.0 - r6.y;
    r8.xy = r8.xy - r7.xz;
    r2.y = ps;
    r7.yw = r8.xy * r13.zw + r7.xz;
    r6.xy = r2.wx - 0.5;
    r8.xyz = float3((r2.wxy >= float3(0.5, 0.5, 0.004)));
    r6.xy = r6.xy - r2.wx;
    r7.xz = r6.xy * r8.xy + r2.wx;
    r7 = r7 + r7;
    r13.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r16.xyz = tex2D(Texture2D_5, r4.zw).xyz;
    r11 = tex2D(Texture2D_1, r7.xy);
    r23 = tex2D(Texture2D_1, r7.zw);
    r19.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r7.xyz = tex2D(Texture2D_3, r6.zw).xwy;
    r6.w = float((UniformScalar_5.x >= 1.0));
    ps = r3.w;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r18.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r22.w = saturate(ps);
    ps = (-1.0) + r7.y;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r9.w = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r4.z = float((UniformScalar_5.x > 1.0));
    r15.x = ps;
    r20.yz = r20.xy * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r7.zw = r7.xz + r7.xz;
    r15.y = ps;
    ps = r15.z + r15.z;
    r17.xyz = r18.xyz * r17.xyz;
    r7.x = ps;
    r18.xyz = r9.zxy * 2.0 + float3(-1.0, 0.0, 0.0);
    r0.xyz = (-abs(r4.zzz) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r21.xyz = r19.zxy + r19.zxy;
    r0.w = ps;
    r0.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = r15.w + r15.w;
    r4.zw = r18.yz - 1.0;
    r7.y = ps;
    ps = ModShadowGroupColor.x * r2.z;
    r19 = r7 - 1.0;
    r22.x = ps;
    r7.xy = r13.zw * 2.0 + r8.xy;
    r8.w = (r7.y == 0.0) ? r23.x : r23.y;
    r6.w = (r7.x == 0.0) ? r11.x : r11.y;
    ps = ModShadowGroupColor.y * r2.z;
    r7 = r7.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r22.y = ps;
    r6.w = (r7.w == 0.0) ? r11.z : r6.w;
    r2.x = (r7.y == 0.0) ? r23.z : r8.w;
    r21.w = (r7.z == 0.0) ? r23.w : r2.x;
    r22.z = (r7.x == 0.0) ? r11.w : r6.w;
    ps = r22.z;
    r11 = -r22.wxyz + 1.0;
    r7.x = ps;
    ps = 0.0;
    r2 = r21 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.z = ps;
    r2.x = r2.x * UniformVector_4.z - r18.x;
    ps = max(r7.x, r7.z);
    r7.y = r11.w * 2.5;
    r6.w = ps;
    ps = r11.x;
    r20.x = min(r6.w, 0.3);
    r6.w = ps;
    ps = UniformScalar_1.x * r6.w;
    r8.w = r2.w + r21.w;
    r2.w = ps;
    ps = r8.w;
    r7.xzw = r20.yxz * float3(0.5, 3.3333333, 0.5);
    r2.yz = r2.ww * r19.zw + r2.yz;
    r2.yz = r2.yz * UniformVector_4.xy - r4.zw;
    ps = -r12.x + ps;
    r4.zw = r19.xy + r7.xw;
    r7.x = saturate(ps);
    r2.yz = r7.zz * r4.zw + r2.yz;
    r16.w = r7.z * r4.y + 1.0;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r7 = r7.xxxy * r16;
    r15.z = ps;
    ps = r0.w;
    r7.w = saturate(r7.w - 0.5);
    r6.w = r2.x * r7.w + r18.x;
    r2.xy = r2.yz * r7.ww - 1.0;
    r9.yz = r9.xy * 2.0 + r2.xy;
    r9.x = r6.w * TwoSidedSign.x - TwoSidedSign.x;
    ps = r5.x * ps;
    r9 = r9 * r11.xxxx;
    r4.x = ps;
    ps = r9.x;
    r0.xyz = r17.xyz * r0.xyz;
    r6.w = ps;
    ps = TwoSidedSign.x + r6.w;
    r4.y = r9.w + 1.0;
    r2.x = ps;
    r2.yz = (r11.xx > 0.0) ? r9.yz : 0.0;
    r2.yz = (r11.xx >= 0.0) ? r2.yz : 0.0;
    r6.w = (r2.w > 0.0) ? r4.y : 1.0;
    r2.x = (r11.x > 0.0) ? r2.x : TwoSidedSign.x;
    r2.x = (r11.x >= 0.0) ? r2.x : TwoSidedSign.x;
    r6.w = (r2.w >= 0.0) ? r6.w : 1.0;
    ps = r0.w;
    r0.xyz = r0.xyz * r6.www;
    r9.xyz = r0.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r0.xyz = r0.xyz * r16.www - r7.xyz;
    ps = r5.y * ps;
    r6.w = dot(r2.xyz, r2.xyz);
    r4.y = ps;
    ps = rsqrt(abs(r6.w));
    r11.x = abs(r16.w) * abs(r16.w);
    r6.w = ps;
    r0.xyz = r0.xyz * r7.www + r7.xyz;
    r7.xyz = r15.xyz * r0.xyz + UniformVector_0.xyz;
    ps = r0.w;
    r2.xyz = r2.xyz * r6.www;
    ps = r5.z * ps;
    r2.xyz = r2.xyz * TwoSidedSign.xxx;
    r4.z = ps;
    ps = r0.x;
    r13.z = dot(r4.zxy, r2.xyz);
    ps = r6.y * ps;
    r6.w = dot(r2.xyz, r14.zxy);
    r0.x = ps;
    ps = r0.y;
    r4.xyz = r2.yzx * r6.www;
    r5.xyz = r4.xyz * 2.0 - r14.xyz;
    ps = r6.z * ps;
    r4 = r13.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r0.y = ps;
    r11.yz = r4.xy * r11.yz + 0.125;
    ps = r0.z;
    r4.xy = r4.zw + 0.5;
    ps = r6.x * ps;
    r0.w = saturate(dot(r12.wyz, r5.zxy));
    r0.z = ps;
    ps = log2(r0.w);
    r6.yw = abs(r4.yx) * abs(r4.yx);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r2.xyz = r2.xxx * r1.xyz;
    r0.w = ps;
    ps = r11.x * r11.x;
    r5.xyz = r0.xzy * r6.www;
    r6.w = ps;
    ps = r11.y * r11.z;
    r4.xyz = r0.xzy * r6.yyy;
    r6.x = ps;
    r6.xyz = r6.xxx * r10.xyz + ModShadowColor.xyz;
    r7.xyz = r4.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = pow(2.0, r0.w);
    r6.w = r6.w * r6.w;
    r0.w = ps;
    r4.xyz = r0.www * r1.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r1.xyz = r6.www * r9.xyz;
    r1.xyz = r1.xzy * r7.www;
    r7.xyz = r4.xyz * r1.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r8.z + r3.w;
    r6.xyz = r7.xyz * r8.zzz + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
