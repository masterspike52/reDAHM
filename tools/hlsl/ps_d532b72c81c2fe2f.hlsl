// ps_d532b72c81c2fe2f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 324 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000510 10041100 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_9 : register(c11); // float
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
    float4 color1 : COLOR1; // r7
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
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.z + 1.0;
    r3.x = ps;
    r7.xy = r1.xy * UniformScalar_0.xx;
    r7.zw = r1.wz * 6.0;
    r11.zw = r1.wz * UniformVector_7.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r5.w - 4e+02;
    r3.y = ps;
    ps = r2.z;
    r8.xy = r1.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r8.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / r5.w;
    r0.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r11.xy = r0.zw * r6.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r8.z));
    r6.w = r17.w - 0.5;
    r8.z = ps;
    ps = 5.0 * r6.x;
    r10.xyz = r8.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.y;
    r4.x = r1.w * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r10.xy * r6.ww;
    r4.y = ps;
    r6.zw = r4.xy - 0.5;
    r14.xy = float2((r4.xy >= 0.5));
    ps = r3.x;
    r6.zw = r6.zw - r4.xy;
    ps = abs(r9.x) * ps;
    r8.zw = r6.zw * r14.xy;
    r0.z = ps;
    ps = r3.y;
    r8 = r4.zwxy + r8;
    ps = abs(r9.y) * ps;
    r6.zw = r8.zw + r8.zw;
    r0.w = ps;
    r3.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    r4.y = tex2D(Texture2D_5, r1.xy).x;
    r9.xyz = tex2D(Texture2D_7, r11.zw).xyz;
    r11.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r0.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r16 = tex2D(Texture2D_1, r6.zw);
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r4.xzw = tex2D(Texture2D_4, r1.xy).xyz;
    r15.xyz = tex2D(Texture2D_2, r7.zw).xyw;
    r12.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r7.xyz = tex2D(Texture2D_3, r7.xy).xwy;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = r5.w;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r1.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.z = saturate(ps);
    ps = r7.x + r7.x;
    r1.xyz = r1.xyz * r17.xyz;
    r14.z = ps;
    r12.w = r15.z * r12.w - 1.0;
    r5.xy = r15.xy * 2.0 - 1.0;
    ps = r7.z + r7.z;
    r12.yz = r12.xy + r12.xy;
    r14.w = ps;
    r15.xyz = r4.xzw * 2.0 - 1.0;
    r4.xzw = r8.xyw * 2.0 - 1.0;
    r5.z = r15.z * UniformVector_4.z - r4.w;
    ps = rsqrt(abs(r6.w));
    r6.yz = -r6.zx + 1.0;
    r6.x = ps;
    ps = UniformScalar_1.x * r6.y;
    r2.xyz = r6.xxx * r2.xyz;
    r8.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r12.x = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r6.x = (r12.x == 0.0) ? r16.x : r16.y;
    ps = ModShadowGroupColor.y * r6.z;
    r17 = r12.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r7.z = ps;
    r12.xy = r5.xy * 0.5 + r17.zw;
    r6.x = (r17.y == 0.0) ? r16.z : r6.x;
    r7.w = (r17.x == 0.0) ? r16.w : r6.x;
    ps = 1.0 - r7.z;
    r6.x = max(r7.w, 0.0);
    r12.z = ps;
    ps = 1.0 - r7.x;
    r0.x = min(r6.x, 0.3);
    r6.w = ps;
    ps = 1.0 - r7.w;
    r5.xyw = r0.zwx * float3(0.875, 0.875, 3.3333333);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r14.y = r5.x * r6.w;
    r14.x = ps;
    r0.xw = r5.yw * r12.zw + float2(0.125, 1.0);
    ps = abs(r0.w) * abs(r0.w);
    r14.yzw = r14.yzw + float3(0.125, -1.0, -1.0);
    r0.z = ps;
    r6.xw = r8.zz * r14.zw + r15.xy;
    r5.xy = r6.xw * UniformVector_4.xy - r4.xz;
    r6.xw = r14.xy * r0.wx;
    r8.xyz = r6.www * r13.xyz + ModShadowColor.xyz;
    r5.xy = r5.ww * r12.xy + r5.xy;
    ps = (-1.0) + r7.y;
    r6.x = saturate(r6.x - 0.5);
    r5.w = ps;
    r7.xy = r5.xy * r6.xx + r4.xz;
    r4.xz = r5.wz * r6.yx + float2(1.0, -2.0);
    r7.z = r8.w * 2.0 + r4.z;
    r7.xyw = r7.xyz * r6.yyy;
    ps = r0.y * r0.y;
    r7.z = r7.w + 1.0;
    r6.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.xyz = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.z * r0.z;
    r6.y = dot(r5.zxy, r5.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r6.www * r11.xyz;
    r6.y = ps;
    r5.xyz = r5.xyz * r6.yyy;
    r6.y = dot(r5.zxy, r10.zxy);
    r11.xyz = r5.xyz * r6.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.y = saturate(dot(r2.zxy, r10.zxy));
    ps = log2(r6.y);
    r6.w = saturate(dot(r5.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = ps;
    ps = pow(2.0, r1.w);
    r7.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r1.w = ps;
    r1.w = r1.w * r4.x;
    r1 = r1 * r9.xyzx;
    r1 = r1 * r4.xxxy;
    r2.xyz = r1.xyz * r0.www - r3.xyz;
    r4.xyz = r1.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r1.xyz = r4.xyz + r1.www;
    r2.xyz = r2.xyz * r6.xxx + r3.xyz;
    ps = r8.w * r8.w;
    r0.xyz = r2.xyz * r0.xyz;
    r8.w = ps;
    r1.xyz = r8.www * r1.xyz;
    ps = pow(2.0, r7.w);
    r1.xyz = r1.xyz * r6.xxx;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
