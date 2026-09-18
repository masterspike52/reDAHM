// ps_c4129f7f9f2b655d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041500 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r15.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r16.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r9.xyw = tex2D(Texture2D_2, r1.xy).xwy;
    ps = 1.0 - r1.y;
    r4.w = r1.x * UniformVector_2.x;
    r7.x = ps;
    ps = OpacityOverride.x;
    r1.zw = r1.xy * UniformVector_1.xy;
    r3.y = saturate(ps);
    ps = r3.w;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = (-4e+02) + ps;
    r10.x = r16.z * r9.y;
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r0.z = saturate(r0.z * 0.00022222222);
    r6.z = ps;
    ps = (-0.025) * r0.z;
    r3.x = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r3.x));
    r10.yzw = r6.zzz * r2.xyz;
    r0.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r11.xyz = r0.zzz * r4.xyz;
    r0.z = ps;
    r1.zw = r11.xy * r0.ww + r1.zw;
    r7.y = -r1.w * r0.z + 1.0;
    ps = 1.0 / UniformVector_1.x;
    r6.zw = r10.xw + float2(-1.0, 0.1);
    r7.z = ps;
    ps = 5.0 * r6.w;
    r0.zw = r0.xy * UniformScalar_0.xx;
    r3.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = r7.xzy * UniformVector_2.yxy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.x = r2.y * r1.z;
    r7.y = ps;
    ps = 1.0 - r3.x;
    r1.xy = r1.xy * UniformVector_6.xy;
    r4.z = ps;
    ps = (-0.5) + r2.x;
    r6.xy = r7.xy * abs(r6.xy);
    r7.x = ps;
    ps = (-0.5) + r2.z;
    r7.zw = float2((r2.xz >= 0.5));
    r7.y = ps;
    ps = 1.0 - r3.y;
    r7.xy = r7.xy - r2.xz;
    r4.y = ps;
    r8.yw = r7.xy * r7.zw + r2.xz;
    r7.xy = r4.wx - 0.5;
    r2.xyz = float3((r4.wxy >= float3(0.5, 0.5, 0.004)));
    r7.xy = r7.xy - r4.wx;
    r8.xz = r7.xy * r2.xy + r4.wx;
    r12 = r8 + r8;
    r9.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r14.xyz = tex2D(Texture2D_5, r1.zw).xyz;
    r8 = tex2D(Texture2D_1, r12.xy);
    r21 = tex2D(Texture2D_1, r12.zw);
    r18.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r1.zw).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.zw).xwy;
    r1.w = float((UniformScalar_5.x >= 1.0));
    ps = r3.w;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r19.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r19.w = saturate(ps);
    ps = (-1.0) + r0.y;
    r1.xyz = -UniformVector_0.zxy + 1.0;
    r12.w = ps;
    ps = AmbientColorAndSkyFactor.x * r1.y;
    r2.w = float((UniformScalar_5.x > 1.0));
    r7.x = ps;
    r16.zw = r16.xy * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.y * r1.z;
    r17.zw = r0.xz + r0.xz;
    r7.y = ps;
    ps = r9.x + r9.x;
    r15.xyz = r19.xyz * r15.xyz;
    r17.x = ps;
    r0.xyz = r12.zxy * 2.0 + float3(-1.0, 0.0, 0.0);
    r13.xyz = (-abs(r2.www) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r18.xyz = r18.zxy + r18.zxy;
    r0.w = ps;
    r13.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r13.xyz;
    ps = r9.w + r9.w;
    r6.xy = r0.yz - 1.0;
    r17.y = ps;
    ps = ModShadowGroupColor.x * r4.z;
    r17 = r17 - 1.0;
    r19.x = ps;
    r7.zw = r7.zw * 2.0 + r2.xy;
    r2.w = (r7.w == 0.0) ? r21.x : r21.y;
    r1.w = (r7.z == 0.0) ? r8.x : r8.y;
    ps = ModShadowGroupColor.y * r4.z;
    r20 = r7.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r19.y = ps;
    r1.w = (r20.w == 0.0) ? r8.z : r1.w;
    r2.w = (r20.y == 0.0) ? r21.z : r2.w;
    r18.w = (r20.z == 0.0) ? r21.w : r2.w;
    r19.z = (r20.x == 0.0) ? r8.w : r1.w;
    ps = r19.z;
    r8 = -r19.wzxy + 1.0;
    r7.z = ps;
    ps = 0.0;
    r4 = r18.yxzw + float4(-1.0, -1.0, -1.0, 0.25);
    r7.w = ps;
    r16.x = r4.y * UniformVector_4.z - r0.x;
    ps = max(r7.z, r7.w);
    r4.y = r8.y * 2.5;
    r1.w = ps;
    ps = r8.x;
    r16.y = min(r1.w, 0.3);
    r0.y = ps;
    ps = UniformScalar_1.x * r0.y;
    r1.w = r4.w + r18.w;
    r0.z = ps;
    ps = r1.w;
    r2.xyw = r16.yzw * float3(3.3333333, 0.5, 0.5);
    r4.xz = r0.zz * r17.zw + r4.xz;
    r4.zw = r4.xz * UniformVector_4.xy - r6.xy;
    ps = -r10.x + ps;
    r6.xy = r17.xy + r2.yw;
    r4.x = saturate(ps);
    r16.yz = r2.xx * r6.xy + r4.zw;
    r14.w = r2.x * r6.z + 1.0;
    ps = AmbientColorAndSkyFactor.z * r1.x;
    r4 = r4.xxxy * r14;
    r7.z = ps;
    ps = r0.w;
    r1.w = saturate(r4.w - 0.5);
    r0.x = r16.x * r1.w + r0.x;
    r6.xy = r16.yz * r1.ww - 1.0;
    r12.yz = r12.xy * 2.0 + r6.xy;
    r12.x = r0.x * TwoSidedSign.x - TwoSidedSign.x;
    ps = r5.x * ps;
    r12 = r12 * r8.xxxx;
    r0.x = ps;
    ps = r12.x;
    r6.xyz = r15.xyz * r13.xyz;
    r0.y = ps;
    ps = TwoSidedSign.x + r0.y;
    r6.w = r12.w + 1.0;
    r2.w = ps;
    r9.xw = (r8.xx > 0.0) ? r12.yz : 0.0;
    r12.yz = (r8.xx >= 0.0) ? r9.xw : 0.0;
    r0.y = (r0.z > 0.0) ? r6.w : 1.0;
    r2.w = (r8.x > 0.0) ? r2.w : TwoSidedSign.x;
    r12.x = (r8.x >= 0.0) ? r2.w : TwoSidedSign.x;
    r0.y = (r0.z >= 0.0) ? r0.y : 1.0;
    ps = r0.w;
    r13.xyz = r6.xyz * r0.yyy;
    r6.xyz = r13.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r13.xyz = r13.xyz * r14.www - r4.xyz;
    ps = r5.y * ps;
    r0.y = dot(r12.xyz, r12.xyz);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r9.x = abs(r14.w) * abs(r14.w);
    r0.y = ps;
    r4.xyz = r13.xyz * r1.www + r4.xyz;
    r7.xyz = r7.xyz * r4.xyz + UniformVector_0.xyz;
    ps = r0.w;
    r12.xyz = r12.xyz * r0.yyy;
    ps = r5.z * ps;
    r2.xyw = r12.xzy * TwoSidedSign.xxx;
    r0.w = ps;
    ps = -ModShadowColor.x;
    r9.w = dot(r0.wxz, r2.xwy);
    ps = 1.0 + ps;
    r0.x = dot(r2.xwy, r11.zxy);
    r8.x = ps;
    ps = -ModShadowColor.y;
    r0.xyz = r2.wyx * r0.xxx;
    r5.xyz = r0.xyz * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r0 = r9.yzww * float4(0.875, 0.875, -0.5, 0.5);
    r8.y = ps;
    r9.yz = r0.xy * r8.zw + 0.125;
    ps = -ModShadowColor.z;
    r0.yz = r0.zw + 0.5;
    ps = 1.0 + ps;
    r0.x = saturate(dot(r10.wyz, r5.zxy));
    r8.z = ps;
    ps = log2(r0.x);
    r0.yz = abs(r0.yz) * abs(r0.yz);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r4.xyz = r4.xyz * r1.yzx;
    r0.w = ps;
    ps = r9.x * r9.x;
    r5.xyz = r4.xzy * r0.yyy;
    r4.w = ps;
    ps = r9.y * r9.z;
    r1.xyz = r4.xzy * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r2.w = r4.w * r4.w;
    r0.w = ps;
    r1.xyz = r1.xyz * UpperSkyColor.xzy + r7.xzy;
    r1.xyz = r5.xzy * LowerSkyColor.xyz + r1.xzy;
    ps = ConstantLighting.x * r0.w;
    r5.xyz = r2.xxx * ConstantLighting.xyz;
    r7.x = ps;
    ps = ConstantLighting.z * r0.w;
    r6.xyz = r2.www * r6.xyz;
    r7.y = ps;
    ps = ConstantLighting.y * r0.w;
    r6.xyz = r6.xzy * r1.www;
    r7.z = ps;
    r1.xyz = r7.xyz * r6.xyz + r1.xzy;
    r1.xyz = r5.xyz * r4.xyz + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r2.z + r3.w;
    r0.xyz = r1.xyz * r2.zzz + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
