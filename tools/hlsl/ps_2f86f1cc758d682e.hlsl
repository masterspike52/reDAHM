// ps_2f86f1cc758d682e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 348 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000570 10041200 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
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
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
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
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r11.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r13.x = r1.x * UniformVector_2.x;
    ps = r1.x;
    r8.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_6.x * ps;
    r12.xy = r1.xy * UniformVector_1.xy;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r3.w - 4e+02;
    r9.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r9.z = ps;
    r13.zw = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r13.y = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r10.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r4.xyw = r13.zyw * float3(0.5, -0.025, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r13.zw = r10.xy * r4.yy;
    r13.y = ps;
    ps = r1.y;
    r0.zw = r13.xy - 0.5;
    ps = UniformVector_6.y * ps;
    r8.zw = float2((r13.xy >= 0.5));
    r1.w = ps;
    ps = r9.y;
    r0.zw = r0.zw - r13.xy;
    ps = abs(r6.x) * ps;
    r12.zw = r0.zw * r8.zw;
    r9.x = ps;
    ps = r9.z;
    r13 = r13.zwxy + r12;
    ps = abs(r6.y) * ps;
    r0.zw = r13.zw + r13.zw;
    r9.y = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r12.xyz = tex2D(Texture2D_5, r13.xy).xyz;
    r17.xyz = tex2D(Texture2D_7, r1.zw).xyz;
    r14.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r15 = tex2D(Texture2D_1, r0.zw);
    r9.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r1.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r16.yzw = tex2D(Texture2D_3, r8.xy).xyw;
    r6.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r0.w = dot(r5.zxy, r5.zxy);
    r0.x = dot(r2.zxy, r2.zxy);
    r6.yzw = r6.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r13.zw = r16.yz * 2.0 - 1.0;
    r7.xyz = r1.wxy * 2.0 - 1.0;
    r8.xy = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r16.x = r7.w * r9.z;
    r0.x = ps;
    r9.xyz = r0.xxx * r2.xyz;
    ps = r3.w;
    r9.w = dot(r8.zww, float3(1.0, 1.0, 1.0));
    r1.z = (r9.w == 0.0) ? r15.x : r15.y;
    ps = 0.0001 * ps;
    r0.xyz = r9.zww + float3(0.1, -3.0, -2.0);
    r2.y = saturate(ps);
    ps = 5.0 * r0.x;
    r16.xw = r16.xw - 1.0;
    r2.x = saturate(ps);
    r1.z = (r0.z == 0.0) ? r15.z : r1.z;
    r8.z = (r0.y == 0.0) ? r15.w : r1.z;
    r0.yz = -r2.yx + 1.0;
    ps = rsqrt(abs(r0.w));
    r14.x = r16.w * r0.y;
    r0.x = ps;
    r18.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r2.yzw = -UniformVector_0.xyz + 1.0;
    r15.xyz = r2.yzw * AmbientColorAndSkyFactor.xyz;
    r14.yzw = r14.wyz + r14.wyz;
    r18.xyz = r18.xyz * r11.xyz;
    r11.xyz = r0.xxx * r5.xyz;
    r5.xyz = r18.xyz * r17.xyz;
    ps = OpacityOverride.x;
    r0.x = max(r8.z, 0.0);
    r8.w = saturate(ps);
    ps = UniformScalar_1.x * r0.y;
    r0.x = min(r0.x, 0.3);
    r13.y = ps;
    ps = 3.3333333 * r0.x;
    r16.yz = r8.xy + r4.xw;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r1.xyz = r0.xxx * r16.yxz;
    r8.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r14 = r14 + float4(1.0, -1.0, -1.0, -1.0);
    r8.y = ps;
    r6.x = r14.y * UniformVector_4.z - r7.x;
    ps = 1.0 + r1.y;
    r8 = -r8.wxyz + 1.0;
    r0.w = ps;
    ps = r8.w;
    r2.x = float((r8.x >= 0.004));
    r0.x = ps;
    ps = 2.5 * r0.x;
    r4.x = abs(r0.w) * abs(r0.w);
    r16.x = ps;
    ps = r4.x * r4.x;
    r16.yzw = r5.xyz * r14.xxx;
    r13.x = ps;
    r5.xyz = r16.yzw * r0.www - r12.xyz;
    r0.x = saturate(r16.x * r0.w - 0.5);
    r12.xyz = r5.xyz * r0.xxx + r12.xyz;
    r5.xyz = r15.xyz * r12.xyz + UniformVector_0.xyz;
    r13.xyz = r13.xyy * r13.xzw;
    r4.xw = r14.zw + r13.yz;
    r6.yzw = r13.xxx * r6.yzw;
    r4.xw = r4.xw * UniformVector_4.xy + r1.xz;
    r4.xw = r4.xw - r7.yz;
    r6 = r6.xywz * r0.xxxx;
    r1.yz = r4.xw * r0.xx + r7.yz;
    ps = (-2.0) + r6.x;
    r0.x = ps;
    r1.x = r1.w * 2.0 + r0.x;
    r1.yzw = r1.xyz * r0.yyy;
    ps = 1.0 + r1.y;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    r1.xyz = (r0.yyy > 0.0) ? r1.xzw : float3(1.0, 0.0, 0.0);
    r0.yzw = (r0.yyy >= 0.0) ? r1.xyz : float3(1.0, 0.0, 0.0);
    r0.x = dot(r0.yzw, r0.yzw);
    ps = rsqrt(abs(r0.x));
    r2.yzw = r12.xyz * r2.yzw;
    r0.x = ps;
    r0.xyw = r0.zwy * r0.xxx;
    r4.x = dot(r11.zxy, r0.wxy);
    r0.z = dot(r0.wxy, r10.zxy);
    r1.xyz = r0.xyw * r0.zzz;
    r4 = r4.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r1.xyz = r1.xyz * 2.0 - r10.xyz;
    r1.x = saturate(dot(r9.zxy, r1.zxy));
    r1.yz = r4.zw * r8.yz + 0.125;
    ps = ConstantLighting.x * r0.w;
    r4.yz = r4.xy + 0.5;
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r4.zw = abs(r4.yz) * abs(r4.yz);
    r4.y = ps;
    ps = log2(r1.x);
    r0.z = r1.y * r1.z;
    r0.x = ps;
    r1.xyz = r0.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r2.ywz * r4.zzz;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r8.xyz = r2.ywz * r4.www;
    r0.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xzy;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.yzw + r5.xzy;
    r0.xyz = r4.xyz * r2.yzw + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r2.x + r3.w;
    r0.xyz = r1.xyz * r2.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
