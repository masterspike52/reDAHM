// ps_06f87f6af36ca465.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10040B00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
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
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.zw = r0.xy + 0.5;
    r8.xy = r0.xy * UniformVector_3.xy;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = -r0.z + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r10.yzw = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r5.z = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    ps = rsqrt(abs(r5.z));
    r9.x = r6.x * UniformVector_2.y;
    r5.z = ps;
    ps = r5.z;
    r7.zw = r5.xw * abs(r7.xy);
    ps = r4.x * ps;
    r6.xyw = r9.yyy * r3.xyz;
    r10.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r10.yzw, r10.yzw);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r11.yzw = r5.yyy * r1.xyz;
    r5.x = ps;
    ps = r5.z;
    r5.xyw = r10.zwy * r5.xxx;
    ps = r4.y * ps;
    r6.z = dot(r5.wxy, r6.wxy);
    r10.y = ps;
    ps = r5.z;
    r1.xyz = r5.xyw * r6.zzz;
    r1.xyz = r1.xyz * 2.0 - r6.xyw;
    ps = r4.z * ps;
    r5.z = saturate(dot(r11.wyz, r1.zxy));
    r10.z = ps;
    ps = log2(r5.z);
    r9.w = dot(r10.zxy, r5.wxy);
    r9.z = ps;
    ps = r0.w;
    r4 = r9.ywwz * float4(-0.05, -0.5, 0.5, 15.0);
    ps = UniformVector_2.x * ps;
    r9.zw = r4.xx * r3.xy;
    r9.y = ps;
    r1 = r9.zyxw + float4(0.5, -0.5, -0.5, 0.5);
    ps = r8.z;
    r5.xz = float2((r9.xy >= 0.5));
    ps = r9.z + ps;
    r7.xy = r1.xw + r0.xy;
    r1.x = ps;
    ps = r8.w;
    r1.yz = r1.yz - r9.yx;
    r1.yz = r1.yz * r5.zx + r9.yx;
    ps = r9.w + ps;
    r1.zw = r1.yz + r1.yz;
    r1.y = ps;
    r4.x = tex2D(Texture2D_3, r8.xy).x;
    r8 = tex2D(Texture2D_2, r1.zw);
    r3 = tex2D(Texture2D_1, r0.xy);
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r5.y = tex2D(Texture2D_1, r7.xy).w;
    r7.xyz = UniformVector_1.xyz * UniformVector_1.www;
    ps = OpacityOverride.x;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r10.w = saturate(ps);
    ps = 1.0 - r5.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    ps = 0.875 * r6.x;
    r1.yzw = r1.xyz * 0.15;
    r1.x = ps;
    r0.x = r7.w * r3.w + r5.y;
    r7.xyz = r7.xyz * r3.xyz - r1.yzw;
    r7.yzw = r7.xyz * r3.www + r1.yzw;
    r3.xyz = r7.ywz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    ps = 0.875 * r6.y;
    r11.x = dot(r5.zxx, float3(1.0, 1.0, 1.0));
    r1.y = ps;
    r6.z = (r11.x == 0.0) ? r8.x : r8.y;
    ps = r6.w;
    r5.xyz = r11.xxw + float3(-3.0, -2.0, 0.1);
    r6.x = ps;
    ps = 5.0 * r5.z;
    r1.zw = r4.yz + 0.5;
    r6.y = saturate(ps);
    r6.z = (r5.y == 0.0) ? r8.z : r6.z;
    r8.x = (r5.x == 0.0) ? r8.w : r6.z;
    ps = 0.0;
    r5.y = -r6.y + 1.0;
    r6.y = ps;
    ps = max(r6.x, r6.y);
    r10.yz = r5.yy * ModShadowGroupColor.xy;
    r10.x = ps;
    ps = pow(2.0, r4.w);
    r6 = -r10 + 1.0;
    r5.z = ps;
    ps = log2(abs(r6.x));
    r1.zw = abs(r1.zw) * abs(r1.zw);
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r4.yz = r1.xy * r6.yz;
    r1.x = ps;
    ps = pow(2.0, r1.x);
    r6.xyz = r4.yxz + float3(0.125, 1.0, 0.125);
    r8.y = ps;
    ps = r6.x * r6.z;
    r4.xyz = r5.zzz * ConstantLighting.xzy;
    r5.z = ps;
    ps = r6.y;
    r6.x = float((r6.w >= 0.004));
    r6.yzw = r5.zzz * r9.xyz + ModShadowColor.xyz;
    ps = -r8.y + ps;
    r1.xy = -r8.xy + 1.0;
    r5.z = ps;
    r7.x = r5.z * r1.y;
    r0 = r7 * r0;
    r8.xyz = r0.ywz * r1.zzz;
    ps = ConstantLighting.x * r5.w;
    r7 = r0.ywzx * r1.wwwx;
    r1.x = ps;
    r1.yzw = r0.yzw * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r1.ywz;
    ps = ConstantLighting.y * r5.w;
    r5.z = r7.w - 0.5;
    r1.y = ps;
    ps = ConstantLighting.z * r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r1.z = ps;
    r5.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    r5.xyz = r4.xyz * r3.xyz + r5.xzy;
    r5.xyz = r1.xyz * r0.yzw + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
