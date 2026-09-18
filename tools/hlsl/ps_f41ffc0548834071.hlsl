// ps_f41ffc0548834071.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040C00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_13 : register(c11); // float
float4 UniformScalar_14 : register(c12); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_3, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r0.xy * UniformScalar_0.xx;
    r7.z = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r0.zw = r7.xy * r6.xx + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r7.yw = r1.xy * UniformVector_5.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.x = saturate(r5.w * 0.0001);
    r7.x = ps;
    ps = (-0.5) + r6.x;
    r7.xz = r7.xz * abs(r8.xy);
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r8.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r9.y = tex2D(Texture2D_2, r0.xy).x;
    r7.xz = tex2D(ModShadowAccumTexture, r7.xz).xy;
    r1.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r3.yzw = tex2D(Texture2D_4, r7.yw).xyz;
    r5.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r6.yz).xyw;
    r5.x = float((UniformScalar_14.x >= 1.0));
    r7.w = float((UniformScalar_14.x > 1.0));
    r7.y = dot(r4.zxy, r4.zxy);
    ps = r2.z;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r0.w = float((UniformScalar_13.x >= 1.0));
    r6.x = ps;
    r9.xz = r0.xy * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r2.w = float((UniformScalar_13.x > 1.0));
    r6.z = saturate(ps);
    r6.xyw = r5.wyz * 2.0 - 1.0;
    r3.yzw = (-abs(r2.www) >= 0.0) ? r3.yzw : 1.0;
    r10.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r3.yzw;
    ps = UniformVector_2.z * r6.x;
    r1.xyz = r1.xzy * LightColor.xzy;
    r0.w = ps;
    ps = rsqrt(abs(r1.w));
    r6.z = -r6.z + 1.0;
    r1.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.yzw = r1.www * r2.xyz;
    r3.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r0.zw - 1.0;
    r3.z = ps;
    r0.yzw = -r3.xyz + 1.0;
    r12.zw = r2.yx * r0.yy + 1.0;
    ps = UniformScalar_1.x * r0.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    r6.xy = r0.xx * r9.xz + r6.yw;
    r6.xy = r6.xy * UniformVector_2.xy;
    ps = UniformVector_4.x * UniformVector_4.w;
    r12.xy = r6.xy * r0.yy;
    r2.x = ps;
    r6 = (r0.xyyy > 0.0) ? r12.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r9.x = (r0.x >= 0.0) ? r6.x : 1.0;
    r6.yzw = (r0.yyy >= 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.y));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r7.yyy * r4.xyz;
    r6.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r6.yzw = r6.yzw * r6.xxx;
    r2.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r6.x = dot(r6.wyz, r4.zxy);
    r2.z = ps;
    ps = -UniformVector_0.x;
    r12.xyz = r6.yzw * r6.xxx;
    r4.xyz = r12.xyz * 2.0 - r4.xyz;
    ps = 1.0 + ps;
    r7.y = saturate(dot(r5.wyz, r4.zxy));
    r6.x = ps;
    ps = log2(r7.y);
    r2.xyz = r2.xyz * r11.xyz;
    r7.y = ps;
    ps = UniformScalar_9.x * r7.y;
    r6.w = saturate(dot(r6.wyz, r5.wyz));
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r7.xyz = r7.yxz * float3(15.0, 0.875, 0.875);
    r6.y = ps;
    r5.yz = r7.yz * r0.zw + 0.125;
    ps = -UniformVector_0.y;
    r6.y = r6.y * UniformScalar_10.x;
    ps = 1.0 + ps;
    r2.w = r6.y * r9.x;
    r6.y = ps;
    ps = -UniformVector_0.z;
    r0 = r2 * r10.xyzx;
    ps = 1.0 + ps;
    r2 = r0 * r9.xxxy;
    r6.z = ps;
    r0.xyz = r2.xyz * r6.xyz;
    r5.w = (r7.w > 0.0) ? 0.0 : r2.w;
    r6.xyz = -r2.xyz + r8.xyz;
    r6.xyz = r6.xyz * UniformScalar_15.xxx + r2.xyz;
    r2.xyz = r6.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    r7.yz = r5.xy * r5.wz;
    r6.xyz = r7.zzz * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.x);
    r7.yzw = r2.xyz + r7.yyy;
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r1.xzy * r7.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
