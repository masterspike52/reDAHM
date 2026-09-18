// ps_d102f53e140d6a8f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041200 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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

    r7 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r7.w;
    r9.xy = r1.xy * UniformVector_1.xy;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    ps = OpacityOverride.x;
    r0.zw = r1.xy * 6.0;
    r7.w = saturate(ps);
    r8.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r11.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r3.w - 4e+02;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    r10.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r10.x = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r8.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r4.xyw = r10.yxz * float3(0.5, -0.025, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r11.zw = r8.xy * r4.yy;
    r11.y = ps;
    r9.zw = r11.xy - 0.5;
    r0.zw = float2((r11.xy >= 0.5));
    ps = r1.z;
    r9.zw = r9.zw - r11.xy;
    ps = abs(r6.x) * ps;
    r9.zw = r9.zw * r0.zw;
    r10.x = ps;
    ps = r1.w;
    r9 = r11.zwxy + r9;
    ps = abs(r6.y) * ps;
    r1.zw = r9.zw + r9.zw;
    r10.y = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r15.xyz = tex2D(Texture2D_4, r9.xy).xyz;
    r17 = tex2D(Texture2D_1, r1.zw);
    r10.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r1.yzw = tex2D(Texture2D_2, r1.xy).xyw;
    r9.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    ps = r3.w;
    r0.x = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r1.x = dot(r2.zxy, r2.zxy);
    r18.x = ps;
    r13.yzw = r9.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r16.x = r8.w * r1.w - 1.0;
    r16.yz = r1.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r14.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r1.x = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    r12.xyz = r10.wxy * 2.0 - 1.0;
    r13.x = r6.x * UniformVector_4.z - r12.x;
    ps = UniformVector_5.y * UniformVector_5.w;
    r9.xyz = r1.xxx * r2.xyz;
    r18.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r9.w = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r18.z = ps;
    r0.w = (r9.w == 0.0) ? r17.x : r17.y;
    ps = rsqrt(abs(r0.x));
    r1.xyz = r9.zww + float3(0.1, -3.0, -2.0);
    r0.x = ps;
    ps = 5.0 * r1.x;
    r2.yzw = r18.xyz * r7.xyz;
    r0.z = saturate(ps);
    r0.w = (r1.z == 0.0) ? r17.z : r0.w;
    r7.z = (r1.y == 0.0) ? r17.w : r0.w;
    ps = 1.0 - r0.z;
    r10.xyz = r0.xxx * r5.xyz;
    r0.z = ps;
    ps = 1.0 - r0.y;
    r0.x = max(r7.z, 0.0);
    r1.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.x = min(r0.x, 0.3);
    r7.x = ps;
    ps = 3.3333333 * r0.x;
    r16.yz = r16.yz + r4.xw;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.xyw = r0.xxx * r16.xyz;
    r7.y = ps;
    r7 = -r7.wxyz + 1.0;
    r1.yz = r6.yz * UniformVector_4.xy + r0.yw;
    ps = r7.w;
    r0.w = r0.x + 1.0;
    r0.x = ps;
    ps = 2.5 * r0.x;
    r0.y = abs(r0.w) * abs(r0.w);
    r2.x = ps;
    ps = r0.y * r0.y;
    r6.yz = r1.yz - r12.yz;
    r6.x = ps;
    r0.xyz = r2.yzw * r0.www - r15.xyz;
    r6.w = saturate(r2.x * r0.w - 0.5);
    r2.xyz = r0.xyz * r6.www + r15.xyz;
    r5.xyz = r14.xyz * r2.xyz + UniformVector_0.xyz;
    r0.xyz = r6.xyz * r6.xww;
    ps = r12.y;
    r1.y = float((r7.x >= 0.004));
    ps = r0.y + ps;
    r13.yzw = r0.xxx * r13.yzw;
    r0.y = ps;
    ps = r12.z;
    r6 = r13.xywz * r6.wwww;
    ps = r0.z + ps;
    r0.x = r6.x - 2.0;
    r0.z = ps;
    r0.x = r10.w * 2.0 + r0.x;
    r0.yzw = r0.xyz * r1.xxx;
    ps = 1.0 + r0.y;
    r0.x = ps;
    r0.xyz = (r1.xxx > 0.0) ? r0.xzw : float3(1.0, 0.0, 0.0);
    r0.yzw = (r1.xxx >= 0.0) ? r0.xyz : float3(1.0, 0.0, 0.0);
    r0.x = dot(r0.yzw, r0.yzw);
    ps = rsqrt(abs(r0.x));
    r2.xyz = r2.xyz * r11.xyz;
    r0.x = ps;
    ps = -ModShadowColor.x;
    r0.xyw = r0.zwy * r0.xxx;
    ps = 1.0 + ps;
    r4.x = dot(r10.zxy, r0.wxy);
    r1.x = ps;
    ps = -ModShadowColor.y;
    r0.z = dot(r0.wxy, r8.zxy);
    ps = 1.0 + ps;
    r10.xyz = r0.xyw * r0.zzz;
    r1.z = ps;
    ps = -ModShadowColor.z;
    r4 = r4.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r2.w = saturate(dot(r9.zxy, r8.zxy));
    r1.w = ps;
    r7.xy = r4.zw * r7.yz + 0.125;
    ps = ConstantLighting.x * r0.w;
    r4.yz = r4.xy + 0.5;
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r4.zw = abs(r4.yz) * abs(r4.yz);
    r4.y = ps;
    ps = log2(r2.w);
    r0.z = r7.x * r7.y;
    r0.x = ps;
    r1.xzw = r0.zzz * r1.xzw + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r2.xzy * r4.zzz;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r8.xyz = r2.xzy * r4.www;
    r0.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xzy;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.yzw + r5.xzy;
    r0.xyz = r4.xyz * r2.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.xzw;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.y + r3.w;
    r0.xyz = r2.xyz * r1.yyy + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
