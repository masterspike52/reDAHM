// ps_915880148ba54611.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 213 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000354 10040B00 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 ConstantLighting : register(c15); // float3
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c12); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.zw = r0.xy * UniformScalar_0.xx;
    r7.w = ps;
    ps = r9.w;
    r7.xy = r1.xy * UniformVector_2.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.x = dot(r2.zxy, r2.zxy);
    r7.z = ps;
    ps = (-0.5) + r0.z;
    r6.xy = r7.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyw = tex2D(Texture2D_3, r7.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r1.zw).wxy;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r1.z = float((UniformScalar_4.x >= 1.0));
    ps = OpacityOverride.x;
    r1.w = dot(r5.zxy, r5.zxy);
    r7.z = saturate(ps);
    ps = r3.w;
    r6.xyz = UniformVector_1.xyz * UniformVector_1.www;
    ps = 0.0001 * ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r1.y = saturate(ps);
    r11.xw = r0.yz * 2.0 - 1.0;
    ps = (-1.0) + r0.x;
    r8.w = float((UniformScalar_4.x > 1.0));
    r0.w = ps;
    r7.xyw = (-abs(r8.www) >= 0.0) ? r7.xyw : 1.0;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xyz * r9.xyz;
    r6.w = ps;
    r0.xyz = r8.xyz * 2.0 + float3(0.0, 0.0, -2.0);
    ps = rsqrt(abs(r1.w));
    r8.xyz = r6.www * r4.xyz;
    r1.w = ps;
    ps = rsqrt(abs(r1.x));
    r4.xyz = r1.www * r5.xyz;
    r1.x = ps;
    r5.xyz = (-abs(r1.zzz) >= 0.0) ? 1.0 : r7.xyw;
    ps = (-1.0) + r0.x;
    r9.xyz = r1.xxx * r2.xyz;
    r2.y = ps;
    ps = (-1.0) + r0.y;
    r1.x = r9.z + 0.1;
    r2.z = ps;
    ps = r6.x;
    r1.x = saturate(r1.x * 5.0);
    ps = r5.x * ps;
    r1.yz = -r1.yx + 1.0;
    r2.x = ps;
    r0.xw = r0.zw * r1.yy + 1.0;
    ps = UniformScalar_1.x * r1.y;
    r7.xy = r1.zz * ModShadowGroupColor.xy;
    r1.x = ps;
    r0.yz = r1.xx * r11.xw + r2.yz;
    ps = r6.y;
    r7.xyz = -r7.xyz + 1.0;
    ps = r5.y * ps;
    r0.yz = r0.yz * r1.yy;
    r2.y = ps;
    ps = r6.z;
    r1.w = float((r7.z >= 0.004));
    r0 = (r1.xyyy > 0.0) ? r0.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r0 = (r1.xyyy >= 0.0) ? r0 : float4(1.0, 1.0, 0.0, 0.0);
    ps = r5.z * ps;
    r1.x = dot(r0.yzw, r0.yzw);
    r2.z = ps;
    r2.xyz = r2.xyz * r0.xxx;
    r6.xyz = r2.xzy * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r1.x));
    r2.xyz = r2.xyz * r10.xyz;
    r0.x = ps;
    r5.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = -ModShadowColor.x;
    r0.xyw = r0.zwy * r0.xxx;
    ps = 1.0 + ps;
    r11.x = dot(r4.zxy, r0.wxy);
    r1.x = ps;
    ps = -ModShadowColor.y;
    r0.z = dot(r0.wxy, r8.zxy);
    ps = 1.0 + ps;
    r10.xyz = r0.xyw * r0.zzz;
    r1.y = ps;
    ps = -ModShadowColor.z;
    r4 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r2.w = saturate(dot(r9.zxy, r8.zxy));
    r1.z = ps;
    r7.xy = r4.zw * r7.xy + 0.125;
    ps = ConstantLighting.x * r0.w;
    r4.yz = r4.xy + 0.5;
    r4.x = ps;
    ps = ConstantLighting.y * r0.w;
    r4.zw = abs(r4.yz) * abs(r4.yz);
    r4.y = ps;
    ps = log2(r2.w);
    r0.z = r7.x * r7.y;
    r0.x = ps;
    r1.xyz = r0.zzz * r1.xyz + ModShadowColor.xyz;
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
    r0.xyz = r7.xyz * r6.xyz + r5.xzy;
    r0.xyz = r4.xyz * r2.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.w + r3.w;
    r0.xyz = r2.xyz * r1.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
