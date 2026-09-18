// ps_fe83bac82da91dbb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041500 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 ConstantLighting : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r15.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r1.w = ps;
    r17.xyz = tex2D(Texture2D_2, r5.xy).xyw;
    r10.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    ps = 1.0 - r0.z;
    r6.x = ps;
    ps = OpacityOverride.x;
    r5.zw = r0.wz * UniformVector_1.xy;
    r5.y = saturate(ps);
    ps = r2.w;
    r6.y = dot(r1.zxy, r1.zxy);
    ps = (-4e+02) + ps;
    r11.x = r17.z * r10.y;
    r5.x = ps;
    ps = rsqrt(abs(r6.y));
    r5.x = saturate(r5.x * 0.00022222222);
    r6.w = ps;
    ps = (-0.025) * r5.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r11.yzw = r6.www * r1.xyz;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r12.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    r3.zw = r12.xy * r6.yy + r5.zw;
    r6.y = -r3.w * r5.x + 1.0;
    ps = 1.0 / UniformVector_1.x;
    r3.xy = r11.wx + float2(0.1, -1.0);
    r6.z = ps;
    ps = 5.0 * r3.x;
    r5.zw = r0.xy * UniformScalar_0.xx;
    r5.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = r6.xzy * UniformVector_2.yxy;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.x = r6.y * r3.z;
    r8.w = ps;
    ps = 1.0 - r5.x;
    r8.xy = r0.wz * UniformVector_6.xy;
    r1.z = ps;
    ps = (-0.5) + r6.x;
    r9.xy = r8.zw * abs(r7.xy);
    r7.x = ps;
    ps = (-0.5) + r6.z;
    r8.zw = float2((r6.xz >= 0.5));
    r7.y = ps;
    ps = 1.0 - r5.y;
    r7.xy = r7.xy - r6.xz;
    r1.y = ps;
    r6.yw = r7.xy * r8.zw + r6.xz;
    r5.xy = r1.wx - 0.5;
    r7.xyz = float3((r1.wxy >= float3(0.5, 0.5, 0.004)));
    r5.xy = r5.xy - r1.wx;
    r6.xz = r5.xy * r7.xy + r1.wx;
    r6 = r6 + r6;
    r10.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r14.xyz = tex2D(Texture2D_5, r3.zw).xyz;
    r9 = tex2D(Texture2D_1, r6.xy);
    r21 = tex2D(Texture2D_1, r6.zw);
    r18.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r16.xyz = tex2D(Texture2D_0, r3.zw).xyz;
    r5.xyz = tex2D(Texture2D_3, r5.zw).xwy;
    r6.w = float((UniformScalar_5.x >= 1.0));
    ps = r2.w;
    r5.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r19.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r19.w = saturate(ps);
    ps = (-1.0) + r5.y;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r16.w = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r0.x = float((UniformScalar_5.x > 1.0));
    r8.x = ps;
    r0.zw = r17.xy * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r17.zw = r5.xz + r5.xz;
    r8.y = ps;
    ps = r10.x + r10.x;
    r15.xyz = r19.xyz * r15.xyz;
    r17.x = ps;
    r5.xyz = r16.zxy * 2.0 + float3(-1.0, 0.0, 0.0);
    r13.xyz = (-abs(r0.xxx) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r5.w));
    r18.xyz = r18.zxy + r18.zxy;
    r5.w = ps;
    r13.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r13.xyz;
    ps = r10.w + r10.w;
    r3.zw = r5.yz - 1.0;
    r17.y = ps;
    ps = ModShadowGroupColor.x * r1.z;
    r17 = r17 - 1.0;
    r19.x = ps;
    r8.zw = r8.zw * 2.0 + r7.xy;
    r0.x = (r8.w == 0.0) ? r21.x : r21.y;
    r6.w = (r8.z == 0.0) ? r9.x : r9.y;
    ps = ModShadowGroupColor.y * r1.z;
    r20 = r8.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r19.y = ps;
    r6.w = (r20.w == 0.0) ? r9.z : r6.w;
    r0.x = (r20.y == 0.0) ? r21.z : r0.x;
    r18.w = (r20.z == 0.0) ? r21.w : r0.x;
    r19.z = (r20.x == 0.0) ? r9.w : r6.w;
    ps = r19.z;
    r9 = -r19.wzxy + 1.0;
    r8.z = ps;
    ps = 0.0;
    r1 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r8.w = ps;
    r1.x = r1.x * UniformVector_4.z - r5.x;
    ps = max(r8.z, r8.w);
    r0.y = r9.y * 2.5;
    r6.w = ps;
    ps = r9.x;
    r0.x = min(r6.w, 0.3);
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r6.w = r1.w + r18.w;
    r5.z = ps;
    ps = r6.w;
    r0.xzw = r0.zxw * float3(0.5, 3.3333333, 0.5);
    r1.yz = r5.zz * r17.zw + r1.yz;
    r1.yz = r1.yz * UniformVector_4.xy - r3.zw;
    ps = -r11.x + ps;
    r3.zw = r17.xy + r0.xw;
    r0.x = saturate(ps);
    r1.yz = r0.zz * r3.zw + r1.yz;
    r14.w = r0.z * r3.y + 1.0;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r0 = r0.xxxy * r14;
    r8.z = ps;
    ps = r5.w;
    r6.w = saturate(r0.w - 0.5);
    r5.x = r1.x * r6.w + r5.x;
    r1.xy = r1.yz * r6.ww - 1.0;
    r16.yz = r16.xy * 2.0 + r1.xy;
    r16.x = r5.x * TwoSidedSign.x - TwoSidedSign.x;
    ps = r4.x * ps;
    r1 = r16 * r9.xxxx;
    r5.x = ps;
    ps = r1.x;
    r3.xyz = r15.xyz * r13.xyz;
    r5.y = ps;
    ps = TwoSidedSign.x + r5.y;
    r1.w = r1.w + 1.0;
    r1.x = ps;
    r1.yz = (r9.xx > 0.0) ? r1.yz : 0.0;
    r1.yz = (r9.xx >= 0.0) ? r1.yz : 0.0;
    r5.y = (r5.z > 0.0) ? r1.w : 1.0;
    r1.x = (r9.x > 0.0) ? r1.x : TwoSidedSign.x;
    r1.x = (r9.x >= 0.0) ? r1.x : TwoSidedSign.x;
    r5.y = (r5.z >= 0.0) ? r5.y : 1.0;
    ps = r5.w;
    r13.xyz = r3.xyz * r5.yyy;
    r3.xyz = r13.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r13.xyz = r13.xyz * r14.www - r0.xyz;
    ps = r4.y * ps;
    r5.y = dot(r1.xyz, r1.xyz);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r10.x = abs(r14.w) * abs(r14.w);
    r5.y = ps;
    r0.xyz = r13.xyz * r6.www + r0.xyz;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    ps = r5.w;
    r1.xyz = r1.xyz * r5.yyy;
    ps = r4.z * ps;
    r1.xyz = r1.xyz * TwoSidedSign.xxx;
    r5.w = ps;
    ps = -ModShadowColor.x;
    r10.w = dot(r5.wxz, r1.xyz);
    ps = 1.0 + ps;
    r5.x = dot(r1.xyz, r12.zxy);
    r9.x = ps;
    ps = -ModShadowColor.y;
    r5.xyz = r1.yzx * r5.xxx;
    r4.xyz = r5.xyz * 2.0 - r12.xyz;
    ps = 1.0 + ps;
    r5 = r10.yzww * float4(0.875, 0.875, -0.5, 0.5);
    r9.y = ps;
    r10.yz = r5.xy * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r5.yz = r5.zw + 0.5;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r11.wyz, r4.zxy));
    r9.z = ps;
    ps = log2(r5.x);
    r5.yz = abs(r5.yz) * abs(r5.yz);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r0.xyz = r0.xyz * r6.yzx;
    r5.w = ps;
    ps = r10.x * r10.x;
    r4.xyz = r0.xzy * r5.yyy;
    r0.w = ps;
    ps = r10.y * r10.z;
    r6.xyz = r0.xzy * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r0.w = r0.w * r0.w;
    r5.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    ps = ConstantLighting.x * r5.w;
    r1.xyz = r1.xxx * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r3.xyz = r0.www * r3.xyz;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r3.xyz = r3.xzy * r6.www;
    r4.z = ps;
    r6.xyz = r4.xyz * r3.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r7.z + r2.w;
    r5.xyz = r6.xyz * r7.zzz + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
