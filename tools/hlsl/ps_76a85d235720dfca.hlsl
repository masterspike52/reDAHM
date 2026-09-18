// ps_76a85d235720dfca.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041000 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = -r1.y + 1.0;
    r3.x = ps;
    r7.zw = r1.xy * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r2.z + 0.1;
    r3.y = ps;
    ps = r5.w;
    r10.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r0.z = r12.w - 0.5;
    r6.w = ps;
    ps = 0.00022222222 * r6.y;
    r9.xyz = r6.www * r4.xyz;
    r6.w = saturate(ps);
    ps = 5.0 * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.w;
    r4.x = r1.x * UniformVector_2.x;
    r6.z = ps;
    ps = UniformVector_2.y * r6.x;
    r4.zw = r9.xy * r6.zz;
    r4.y = ps;
    r6.xz = r4.xy - 0.5;
    r0.zw = float2((r4.xy >= 0.5));
    ps = r3.x;
    r6.xz = r6.xz - r4.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.xz * r0.zw;
    r1.z = ps;
    ps = r3.y;
    r4 = r4.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.xz = r4.zw + r4.zw;
    r1.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r14 = tex2D(Texture2D_1, r6.xz);
    r15.xzw = tex2D(Texture2D_4, r0.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r7.zw).xyw;
    ps = 0.0001 * r5.w;
    r7.xy = r0.xy * UniformScalar_0.xx;
    r6.x = saturate(ps);
    r13.xyz = tex2D(Texture2D_3, r7.xy).xyw;
    r3.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r1.xy).xwy;
    r8.xyz = r3.xyw * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r7.w = r13.z - 1.0;
    r15.y = ps;
    ps = r10.x + r10.x;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    ps = r10.y + r10.y;
    r1.zw = r13.xy + r13.xy;
    r1.y = ps;
    ps = r15.x + r15.x;
    r16 = r1 - 1.0;
    r1.x = ps;
    ps = r15.z + r15.z;
    r6.yz = -r6.xy + 1.0;
    r1.y = ps;
    ps = r15.w + r15.w;
    r1.w = r7.w * r6.y;
    r1.z = ps;
    ps = r7.z + r7.z;
    r1 = r1 + float4(-1.0, -1.0, -1.0, 1.0);
    r15.z = ps;
    ps = UniformScalar_1.x * r6.y;
    r15.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r6.x = (r15.x == 0.0) ? r14.x : r14.y;
    r0.zw = r6.ww * r16.zw + r1.xy;
    r0.zw = r0.zw * UniformVector_4.xy - r8.xy;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r13.xy = r16.xy * 0.5 + r15.zw;
    r6.x = (r15.y == 0.0) ? r14.z : r6.x;
    r7.x = (r15.x == 0.0) ? r14.w : r6.x;
    r6.x = max(r7.x, 0.0);
    r11.x = min(r6.x, 0.3);
    ps = 1.0 / r5.w;
    r11.xyz = r11.xyz * float3(3.3333333, 0.875, 0.875);
    r6.x = ps;
    r13.xy = r11.xx * r13.xy + r0.zw;
    r6.xw = r13.zw * r6.xx + ScreenPositionScaleBias.wz;
    r4.z = tex2D(Texture2D_5, r0.xy).x;
    r4.xyw = tex2D(Texture2D_7, r4.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = -UniformVector_0.x;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r5.yzw = UniformVector_6.xyz * UniformVector_6.www;
    r5.x = ps;
    r7.y = r10.w * r7.y - 1.0;
    ps = ModShadowGroupColor.x * r6.z;
    r5.yzw = r5.yzw * r12.xyz;
    r7.z = ps;
    r12.w = r1.z * UniformVector_4.z - r8.z;
    ps = ModShadowGroupColor.y * r6.z;
    r14.xyz = r5.yzw * r1.www;
    r7.w = ps;
    r3.xyz = r14.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r6.x));
    r7.xzw = -r7.xwz + 1.0;
    r6.x = ps;
    ps = 2.5 * r7.x;
    r0.xyz = r0.xyz * LightColor.xyz;
    r14.w = ps;
    r11.xyz = r11.xyz * r7.ywz + float3(1.0, 0.125, 0.125);
    ps = abs(r11.x) * abs(r11.x);
    r2.xyz = r6.xxx * r2.xyz;
    r11.w = ps;
    r12.xyz = r14.xyz * r11.xxx - r4.xyw;
    r7.w = saturate(r14.w * r11.x - 0.5);
    r5.yz = r13.xy * r7.ww + r8.xy;
    r8.xyz = r12.xyz * r7.www + r4.xyw;
    r6.x = r12.w * r7.w - 2.0;
    ps = -UniformVector_0.y;
    r4.yw = r11.wy * r11.wz;
    r7.xyz = r4.www * r10.xyz + ModShadowColor.xyz;
    r5.w = r3.w * 2.0 + r6.x;
    ps = 1.0 + ps;
    r10.xyw = r5.yzw * r6.yyy;
    r5.y = ps;
    ps = -UniformVector_0.z;
    r10.z = r10.w + 1.0;
    r10.xyz = (r6.yyy > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r5.z = ps;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r8.xyz * r5.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r2.zxy, r5.zxy));
    ps = log2(r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r6.x = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r4.x = r6.y * r1.w;
    r6.yz = r4.xy * r4.zy;
    r2.xyz = r3.xyz + r6.yyy;
    r2.xyz = r6.zzz * r2.xyz;
    ps = pow(2.0, r6.x);
    r2.xyz = r2.xyz * r7.www;
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
