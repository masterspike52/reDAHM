// ps_c65fdc47a6a0ee4c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10041200 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = -r1.z + 1.0;
    r3.x = ps;
    r7.zw = r1.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r2.z + 0.1;
    r3.y = ps;
    ps = r5.w;
    r10.xy = r1.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r0.z = r14.w - 0.5;
    r6.w = ps;
    ps = 0.00022222222 * r6.y;
    r9.xyz = r6.www * r4.xyz;
    r6.w = saturate(ps);
    ps = 5.0 * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.w;
    r4.x = r1.w * UniformVector_2.x;
    r6.z = ps;
    ps = UniformVector_2.y * r6.x;
    r4.zw = r9.xy * r6.zz;
    r4.y = ps;
    r6.xz = r4.xy - 0.5;
    r11.xw = float2((r4.xy >= 0.5));
    ps = r3.x;
    r6.xz = r6.xz - r4.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.xz * r11.xw;
    r0.z = ps;
    ps = r3.y;
    r15 = r4.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.xz = r15.zw + r15.zw;
    r0.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r16 = tex2D(Texture2D_1, r6.xz);
    r3.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r7.zw).xyw;
    ps = 0.0001 * r5.w;
    r7.xy = r1.xy * UniformScalar_0.xx;
    r6.x = saturate(ps);
    r7.xyz = tex2D(Texture2D_3, r7.xy).wxy;
    r4.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r8.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    ps = r8.x + r8.x;
    r0.zw = r1.wz * UniformVector_6.xy;
    r17.y = ps;
    r4.xyw = r4.xyz * 2.0 - 1.0;
    ps = (-1.0) + r7.x;
    r18.zw = r7.yz + r7.yz;
    r2.w = ps;
    ps = r10.x + r10.x;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r18.x = ps;
    ps = r10.y + r10.y;
    r6.xy = -r6.yx + 1.0;
    r18.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r12.xyz = r3.xyw + r3.xyw;
    r6.z = ps;
    ps = r2.w;
    r7 = r18.xzwy - 1.0;
    r6.zw = r6.zz * r7.yz + r4.xy;
    ps = r6.y * ps;
    r17.x = dot(r11.xww, float3(1.0, 1.0, 1.0));
    r12.w = ps;
    ps = r8.y + r8.y;
    r12 = r12 + float4(-1.0, -1.0, -1.0, 1.0);
    r17.z = ps;
    r7.yz = r6.zw * UniformVector_4.xy - r12.xy;
    r6.z = (r17.x == 0.0) ? r16.x : r16.y;
    r17 = r17.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r13.xy = r7.xw * 0.5 + r17.zw;
    r6.z = (r17.y == 0.0) ? r16.z : r6.z;
    r7.x = (r17.x == 0.0) ? r16.w : r6.z;
    r6.z = max(r7.x, 0.0);
    r11.x = min(r6.z, 0.3);
    ps = 1.0 / r5.w;
    r11.yzw = r11.xyz * float3(3.3333333, 0.875, 0.875);
    r6.z = ps;
    r13.xy = r11.yy * r13.xy + r7.yz;
    r6.zw = r13.zw * r6.zz + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r11.x = tex2D(ShadowTexture, r0.xy).x;
    r5.xyz = tex2D(Texture2D_5, r15.xy).xyz;
    r0.yzw = tex2D(Texture2D_7, r0.zw).xyz;
    r7.yzw = tex2D(Texture2D_8, r1.xy).xyz;
    r1.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = -ModShadowColor.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r6.z = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    r8.xyz = r7.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r7.y = r10.w * r8.w - 1.0;
    ps = rsqrt(abs(r6.z));
    r1.xyz = r1.xyz * r14.xyz;
    r6.z = ps;
    ps = -ModShadowColor.y;
    r3.xyz = r6.zzz * r2.xyz;
    ps = 1.0 + ps;
    r1.xyz = r1.xyz * r0.yzw;
    r0.y = ps;
    ps = -ModShadowColor.z;
    r7.zw = r6.xx * ModShadowGroupColor.xy;
    r1.w = r4.w * UniformVector_4.z - r12.z;
    ps = 1.0 + ps;
    r7.xzw = -r7.xwz + 1.0;
    r0.z = ps;
    ps = 2.5 * r7.x;
    r2.xyz = r1.xyz * r12.www;
    r2.w = ps;
    r7.xyz = r11.yzw * r7.ywz + float3(1.0, 0.125, 0.125);
    r1.xyz = r2.xyz * r7.xxx - r5.xyz;
    r0.w = saturate(r2.w * r7.x - 0.5);
    ps = abs(r7.x) * abs(r7.x);
    r6.z = r7.y * r7.z;
    r11.y = ps;
    r0.xyz = r6.zzz * r0.xyz + ModShadowColor.xyz;
    r7.xy = r13.xy * r0.ww + r12.xy;
    r6.z = r1.w * r0.w - 2.0;
    r5.xyz = r1.xyz * r0.www + r5.xyz;
    r1.xw = r11.xy * r11.xy;
    r7.z = r3.w * 2.0 + r6.z;
    r7.xyz = r7.zxy * r6.yyy;
    ps = 1.0 + r7.x;
    r1.xyz = r1.xxx * r10.xyz;
    r7.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = r1.w * r1.w;
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r7.xxx * r8.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r2.xyz = r6.yzw * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r2.zxy));
    ps = log2(r6.x);
    r2.xyz = r7.xyz * r0.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.xyz = r5.xyz * r4.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r1.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
