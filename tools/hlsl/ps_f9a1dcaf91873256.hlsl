// ps_f9a1dcaf91873256.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10040D00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_5, r0.xy);
    r6.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = -r1.y + 1.0;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r6.y * UniformVector_2.y;
    r7.w = ps;
    ps = r9.w;
    r7.xy = r1.xy * 6.0;
    r6.w = ps;
    ps = (-0.5) + r6.w;
    r7.zw = r7.zw * abs(r8.xy);
    r6.y = ps;
    ps = (-0.5) + r6.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r6.y = ps;
    ps = (-0.5) + r6.z;
    r0.zw = float2((r6.xz >= 0.5));
    r6.w = ps;
    r6.yw = r6.yw - r6.xz;
    r6.xy = r6.yw * r0.zw + r6.xz;
    r6.xy = r6.xy + r6.xy;
    r10 = tex2D(Texture2D_1, r6.xy).xzwy;
    r6.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r8.xyw = tex2D(Texture2D_2, r7.xy).xwy;
    r11.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    ps = r5.w;
    r3.x = r5.w - 4e+02;
    ps = 0.0001 * ps;
    r7.xy = r1.xy * UniformVector_7.xy;
    r11.w = saturate(ps);
    ps = r5.x;
    r1.xz = r1.xy * UniformVector_1.xy;
    ps = ScreenPositionScaleBias.x * ps;
    r3.w = r2.z + 0.1;
    r1.y = ps;
    r11.z = r8.y * r11.z - 1.0;
    ps = r8.x + r8.x;
    r6.z = dot(r4.zxy, r4.zxy);
    r8.z = ps;
    ps = 0.875 * r6.x;
    r3.yz = r11.xy + r11.xy;
    r7.z = ps;
    ps = rsqrt(abs(r6.z));
    r12.yz = saturate(r3.xw * float2(0.00022222222, 5.0));
    r6.x = ps;
    ps = r6.x;
    r3.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r6.z = (r3.x == 0.0) ? r10.x : r10.w;
    ps = r4.x * ps;
    r3 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r10.x = ps;
    r6.z = (r3.y == 0.0) ? r10.y : r6.z;
    r12.w = (r3.x == 0.0) ? r10.z : r6.z;
    ps = r6.x;
    r6.z = max(r12.w, 0.0);
    ps = r4.y * ps;
    r12.x = min(r6.z, 0.3);
    r10.y = ps;
    ps = r6.x;
    r0.zw = r12.yx * float2(-0.025, 3.3333333);
    ps = r4.z * ps;
    r6.xz = -r12.wz + 1.0;
    r10.z = ps;
    ps = 2.5 * r6.x;
    r11.xy = r6.zz * ModShadowGroupColor.xy;
    r10.w = ps;
    r6.zw = r10.xy * r0.zz + r1.xz;
    ps = 0.875 * r6.y;
    r4.xyw = -r11.xyw + 1.0;
    r7.w = ps;
    ps = r8.w + r8.w;
    r8.xy = r7.zw * r4.xy;
    r8.w = ps;
    ps = r5.y;
    r13 = r8 + float4(0.125, 0.125, -1.0, -1.0);
    r11.xy = r13.zw * 0.5 + r3.zw;
    r2.w = r0.w * r11.z + 1.0;
    ps = ScreenPositionScaleBias.y * ps;
    r6.x = abs(r2.w) * abs(r2.w);
    r1.z = ps;
    ps = 1.0 / r5.w;
    r1.x = r6.x * r6.x;
    r1.w = ps;
    r1.xyw = r1.yzx * r1.wwx;
    r6.xy = r1.xy + ScreenPositionScaleBias.wz;
    r1.z = tex2D(Texture2D_4, r0.xy).x;
    r4.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r5.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r3.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r6.xzw = tex2D(LightAttenuationTexture, r6.xy).yxz;
    r3.w = dot(r2.zxy, r2.zxy);
    r8.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r7.xyw = r7.xyz * 2.0 - 1.0;
    r3.xyz = r3.xyz * 2.0 - 1.0;
    r3.xyz = r3.xyz * UniformVector_4.xyz;
    ps = -r7.w;
    r6.y = r13.x * r13.y;
    r0.xyz = r6.yyy * r12.xyz + ModShadowColor.xyz;
    r11.xy = r0.ww * r11.xy + r3.xy;
    r0.w = saturate(r10.w * r2.w - 0.5);
    ps = r3.z + ps;
    r3.xy = r11.xy - r7.xy;
    r3.z = ps;
    r7.xy = r3.xy * r0.ww + r7.xy;
    r6.y = r3.z * r0.w - 2.0;
    r7.z = r7.z * 2.0 + r6.y;
    r7.xyz = r7.zxy * r4.www;
    ps = 1.0 + r7.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r4.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r11.xyz = (r4.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r3.w));
    r6.y = dot(r11.zxy, r11.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r7.xxx * r2.xyz;
    r6.y = ps;
    r2.xyz = r11.xyz * r6.yyy;
    r6.y = dot(r2.zxy, r10.zxy);
    r11.xyz = r2.xyz * r6.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.y = saturate(dot(r7.zxy, r10.zxy));
    ps = log2(r6.y);
    r7.w = saturate(dot(r2.zyx, r7.zyx));
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r8.xyz = r8.xyz * r9.xyz;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r7.z = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_8.x * r6.y;
    r8.w = ps;
    r5 = r8 * r5.xyzx;
    r2.xyz = r5.xyz * r2.www - r4.xyz;
    r5.xyz = r5.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r1.xyz = r5.www * r1.zzz + r5.xyz;
    r2.xyz = r2.xyz * r0.www + r4.xyz;
    ps = LightColor.x * r6.z;
    r2.xyz = r2.xyz * r3.xyz;
    r7.x = ps;
    ps = LightColor.y * r6.x;
    r1.xyz = r1.www * r1.xyz;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r1.xyz = r1.xyz * r0.www;
    r6.y = ps;
    ps = LightColor.z * r6.w;
    r1.xyz = r1.xyz * r6.yyy;
    r7.z = ps;
    r6.xy = r2.xy * r7.ww + r1.xy;
    r6.z = r2.z * r7.w + r1.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
