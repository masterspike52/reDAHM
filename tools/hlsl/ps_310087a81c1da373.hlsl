// ps_310087a81c1da373.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_2, r1.xy);
    r6.xz = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r1.wz * UniformVector_4.xy;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.x = TwoSidedSign.x * UniformVector_2.z;
    r7.w = ps;
    ps = r11.w;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r7.zw = r7.zw * abs(r8.xy);
    r6.y = ps;
    ps = 1.0 / r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r6.y = ps;
    r6.yw = r12.yz * r6.yy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r6.yw).xyz;
    r8.x = tex2D(ShadowTexture, r0.xy).x;
    r8.zw = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r9.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r6.yzw = tex2D(Texture2D_0, r6.xz).wxy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = r5.w;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r7.x = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r7.y = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r7.z = float((UniformScalar_5.x >= 1.0));
    r5.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r7.w = float((UniformScalar_5.x > 1.0));
    r5.z = ps;
    r10.xy = r6.zw * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r11.xyz = r5.xyz * r11.xyz;
    r6.x = saturate(ps);
    r1.xyz = (-abs(r7.www) >= 0.0) ? r1.xyz : 1.0;
    r9.xyz = r9.xzy * 2.0 - 1.0;
    r9.y = r12.x * r9.y - TwoSidedSign.x;
    r1.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r1.xyz;
    ps = rsqrt(abs(r7.y));
    r6.z = -r6.x + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xyz = r6.xxx * r2.xyz;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyz = r11.xyz * r1.xyz;
    r7.z = ps;
    r7.yzw = -r7.xyz + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    r9.xz = r7.xx * r10.xy + r9.xz;
    ps = (-1.0) + r6.y;
    r9.zw = r9.xz * UniformVector_2.xy;
    r9.x = ps;
    r6.w = r9.y * r7.y + TwoSidedSign.x;
    r6.xyz = r9.xzw * r7.yyy + float3(1.0, 0.0, 0.0);
    r6.xyz = (r7.xyy > 0.0) ? r6.xyz : float3(1.0, 0.0, 0.0);
    r6.w = (r7.y > 0.0) ? r6.w : TwoSidedSign.x;
    r10.z = (r7.y >= 0.0) ? r6.w : TwoSidedSign.x;
    r10.xyw = (r7.yyx >= 0.0) ? r6.yzx : float3(0.0, 0.0, 1.0);
    r6.yzw = r2.xyz * r10.www;
    r2.xyz = r6.yzw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r0.w));
    r6.x = dot(r10.zxy, r10.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r0.www * r4.xyz;
    r6.x = ps;
    r4.xyz = r10.xyz * r6.xxx;
    r4.xyz = r4.xyz * TwoSidedSign.xxx;
    r6.x = dot(r4.zxy, r9.zxy);
    r10.xyz = r4.xzy * r6.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xzy;
    r6.x = saturate(dot(r5.zxy, r9.yxz));
    ps = log2(r6.x);
    r1.xyz = r6.yzw * r1.xyz;
    r8.y = ps;
    r6.xyw = r8.ywz * float3(15.0, 0.875, 0.875);
    r8.yz = r6.wy * r7.zw + 0.125;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zxy, r5.zxy));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r7.xy = r1.xy * r6.ww + r6.xy;
    r7.z = r1.z * r6.w + r6.z;
    r6.xw = r8.yx * r8.zx;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r3.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
