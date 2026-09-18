// ps_e9e6f7d21ed00b24.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10041000 0000090A 00000000 00009129 007F01FF 00000001 0000F050 0000F151 0000F253 0000F354 0000F456 0000F557 0000F658 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c13); // float3
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
    float4 texcoord3 : TEXCOORD3; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord3;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = In.color0;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.xy = r0.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = r0.xy * UniformScalar_0.xx;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.x = UniformScalar_1.x * 4.0;
    r7.w = ps;
    ps = r10.x;
    r8.zw = r0.wz * UniformScalar_4.xx;
    ps = r1.x * ps;
    r0.xy = r7.zw * abs(r9.xy);
    r7.z = ps;
    ps = OpacityOverride.x;
    r7.w = r1.y * UniformScalar_1.x;
    r9.z = saturate(ps);
    r11.yz = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r13.xyz = tex2D(Texture2D_6, r8.zw).xyz;
    r0.w = tex2D(Texture2D_2, r1.xy).x;
    r15.xyz = tex2D(Texture2D_4, r8.xy).xyz;
    r10.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r1.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r7.xyz = tex2D(Texture2D_3, r7.xy).wxy;
    ps = r4.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r7.w = dot(r3.zxy, r3.zxy);
    r1.w = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r8.z = dot(r6.zxy, r6.zxy);
    r9.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r9.w = dot(r5.zxy, r5.zxy);
    r9.y = ps;
    r11.xw = r7.yz * 2.0 - 1.0;
    r1.xyz = r1.zxy * 2.0 - 1.0;
    r14.xyz = r8.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r9.w));
    r16.xyz = -r15.xyz + r10.xyz;
    r9.w = ps;
    ps = rsqrt(abs(r8.z));
    r10.xyz = r9.www * r5.xyz;
    r8.z = ps;
    ps = rsqrt(abs(r7.w));
    r12.xyz = r8.zzz * r6.xyz;
    r7.w = ps;
    r5.xyz = r16.xyz * r0.www + r15.xyz;
    ps = UniformVector_1.z * UniformVector_1.w;
    r8.xyz = r7.www * r3.zxy;
    r9.w = ps;
    ps = (-1.0) + r7.x;
    r1.xyz = r1.xyz - r14.xyz;
    r7.w = ps;
    r1.yz = r1.yz * r0.ww + r14.yz;
    r7.x = r1.x * r0.w - 2.0;
    ps = 0.1 - -r8.x;
    r3.xyz = r9.xyw * r5.xyz;
    r7.y = ps;
    r7.x = r8.w * 2.0 + r7.x;
    ps = r3.x;
    r1.x = saturate(r7.y * 5.0);
    ps = r13.x * ps;
    r7.yz = -r1.wx + 1.0;
    r3.x = ps;
    r1.xw = r7.xw * r7.yy + 1.0;
    ps = UniformScalar_3.x * r7.y;
    r9.xy = r7.zz * ModShadowGroupColor.xy;
    r7.x = ps;
    r1.yz = r7.xx * r11.xw + r1.yz;
    ps = r3.y;
    r9.xzw = -r9.zxy + 1.0;
    ps = r13.y * ps;
    r1.yz = r1.yz * r7.yy;
    r3.y = ps;
    ps = r3.z;
    r7.w = float((r9.x >= 0.004));
    r1 = (r7.xyyy > 0.0) ? r1.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r1 = (r7.yyyx >= 0.0) ? r1.yzwx : float4(1.0, 0.0, 0.0, 1.0);
    ps = r13.z * ps;
    r7.x = dot(r1.xyz, r1.xyz);
    r3.z = ps;
    r5.xyz = r3.xyz * r1.www;
    r3.xyz = r5.xzy * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r7.x));
    r0.xyz = r5.xyz * r0.xyz;
    r7.x = ps;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r5.xyz = r1.xyz * r7.xxx;
    r1.xyz = r5.xxx * r2.xyz;
    r11.x = dot(r12.zxy, r5.xyz);
    ps = -ModShadowColor.x;
    r7.x = dot(r5.xyz, r10.zxy);
    ps = 1.0 + ps;
    r7.xyz = r5.yzx * r7.xxx;
    r9.x = ps;
    ps = -ModShadowColor.y;
    r5 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.xyz = r7.xyz * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r7.x = saturate(dot(r8.xyz, r7.zxy));
    r9.y = ps;
    r7.yz = r5.zw * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r8.xy = r5.xy + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r8.xy) * abs(r8.xy);
    r9.z = ps;
    ps = log2(r7.x);
    r7.y = r7.y * r7.z;
    r7.x = ps;
    r8.xyz = r7.yyy * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r7.x;
    r9.xyz = r0.xzy * r5.yyy;
    r8.w = ps;
    r7.xyz = r9.xyz * UpperSkyColor.xzy + r6.xzy;
    ps = pow(2.0, r8.w);
    r5.xyz = r0.xzy * r5.xxx;
    r8.w = ps;
    r2.xyz = r8.www * r2.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r3.xyz + r7.xzy;
    r7.xyz = r1.xyz * r0.xyz + r7.xzy;
    ps = -r4.w;
    r7.xyz = r7.xyz * r8.xyz;
    ps = OpacityOverride.x + ps;
    r8.xyz = r7.xyz - r7.xyz;
    r8.w = ps;
    oC0.w = r8.w * r7.w + r4.w;
    r7.xyz = r8.xyz * r7.www + r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
