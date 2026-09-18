// ps_793f364d18174940.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 330 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000528 10041200 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r1.xy);
    ps = (-0.5) + r17.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r15.x = ps;
    r6.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r1.w;
    r7.xy = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_7.x * ps;
    r8.xy = r1.wz * UniformVector_1.xy;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.z = r5.w - 4e+02;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r4.zxy, r4.zxy);
    r7.w = ps;
    ps = 1.0 / r5.w;
    r0.zw = r5.xy * ScreenPositionScaleBias.xy;
    r8.w = ps;
    r13.xy = r0.zw * r8.ww + ScreenPositionScaleBias.wz;
    r10.zw = r6.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r10.y = saturate(r8.z * 0.00022222222);
    r6.z = ps;
    ps = -r1.z;
    r11.xyz = r6.zzz * r4.xyz;
    ps = 1.0 + ps;
    r12.xyw = r10.zwy * float3(0.5, 0.5, -0.025);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r15.zw = r11.xy * r12.ww;
    r15.y = ps;
    ps = r1.z;
    r8.zw = r15.xy - 0.5;
    ps = UniformVector_7.y * ps;
    r14.xw = float2((r15.xy >= 0.5));
    r10.y = ps;
    ps = r7.z;
    r8.zw = r8.zw - r15.xy;
    ps = abs(r9.x) * ps;
    r8.zw = r8.zw * r14.xw;
    r0.z = ps;
    ps = r7.w;
    r8 = r15.zwxy + r8;
    ps = abs(r9.y) * ps;
    r7.zw = r8.zw + r8.zw;
    r0.w = ps;
    r4.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    r9.y = tex2D(Texture2D_5, r1.xy).x;
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r13.xy).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r0.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r15 = tex2D(Texture2D_1, r7.zw);
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r9.xzw = tex2D(Texture2D_4, r1.xy).xyz;
    r18.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r7.xyz = tex2D(Texture2D_3, r7.xy).xwy;
    r1.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r5.w;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r6.z = dot(r3.zxy, r3.zxy);
    r6.x = saturate(ps);
    ps = r2.z;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r14.yz = r7.xz + r7.xz;
    r7.x = ps;
    r12.w = r6.w * r18.z - 1.0;
    ps = rsqrt(abs(r6.y));
    r7.zw = r18.xy + r18.xy;
    r6.w = ps;
    ps = 1.0 - r6.z;
    r1.xyz = r1.xyz * r17.xyz;
    r6.y = saturate(ps);
    r5.xyz = r9.xzw * 2.0 - 1.0;
    r9.xzw = r8.xyw * 2.0 - 1.0;
    r3.z = r5.z * UniformVector_4.z - r9.w;
    ps = log2(r6.y);
    r6.z = saturate(r7.x * 5.0);
    r6.y = ps;
    ps = 1.0 - r6.x;
    r2.xyz = r6.www * r2.xyz;
    r6.w = ps;
    ps = 1.0 - r6.z;
    r7.x = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r6.x = (r7.x == 0.0) ? r15.x : r15.y;
    ps = UniformScalar_1.x * r6.w;
    r17 = r7.xxzw + float4(-3.0, -2.0, -1.0, -1.0);
    r8.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r12.xy = r17.zw + r12.xy;
    r7.x = ps;
    r6.x = (r17.y == 0.0) ? r15.z : r6.x;
    r7.w = (r17.x == 0.0) ? r15.w : r6.x;
    ps = ModShadowGroupColor.y * r6.z;
    r6.x = max(r7.w, 0.0);
    r7.z = ps;
    ps = 1.0 - r7.x;
    r0.y = min(r6.x, 0.3);
    r7.x = ps;
    ps = 1.0 - r7.w;
    r3.xyw = r0.zwy * float3(0.875, 0.875, 3.3333333);
    r6.x = ps;
    ps = 1.0 - r7.z;
    r14.x = r3.x * r7.x;
    r12.z = ps;
    r0.yz = r3.wy * r12.wz + float2(1.0, 0.125);
    ps = abs(r0.y) * abs(r0.y);
    r14.yzw = r14.xyz + float3(0.125, -1.0, -1.0);
    r0.w = ps;
    r15.xy = r8.zz * r14.zw + r5.xy;
    r0.xw = r0.xw * r0.xw;
    ps = 2.5 * r6.x;
    r5.xyz = r0.xxx * r16.xyz;
    r14.x = ps;
    r3.xy = r15.xy * UniformVector_4.xy - r9.xz;
    r0.xz = r14.xy * r0.yz;
    r8.xyz = r0.zzz * r13.xyz + ModShadowColor.xyz;
    r3.xy = r3.ww * r12.xy + r3.xy;
    ps = (-1.0) + r7.y;
    r6.x = saturate(r0.x - 0.5);
    r3.w = ps;
    r7.xy = r3.xy * r6.xx + r9.xz;
    r9.xz = r3.wz * r6.wx + float2(1.0, -2.0);
    r7.z = r8.w * 2.0 + r9.z;
    r3.xyw = r7.xyz * r6.www;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r3.z = r3.w + 1.0;
    r7.x = ps;
    r7.yzw = (r6.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r6.www >= 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.x);
    r6.y = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r5.xzy * r7.xxx;
    r6.y = ps;
    r3.xyz = r3.xyz * r6.yyy;
    r6.y = dot(r3.zxy, r11.zxy);
    r5.xyz = r3.xyz * r6.yyy;
    r5.xyz = r5.xyz * 2.0 - r11.xyz;
    r6.y = saturate(dot(r2.zxy, r5.zxy));
    ps = log2(r6.y);
    r7.w = saturate(dot(r3.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = ps;
    ps = pow(2.0, r1.w);
    r8.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r1.w = r6.y * r9.x;
    r1 = r1 * r10.xyzx;
    r1 = r1 * r9.xxxy;
    r3.xyz = r1.xyz * r0.yyy - r4.xyz;
    r5.xyz = r1.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r1.xyz = r5.xyz + r1.www;
    r3.xyz = r3.xyz * r6.xxx + r4.xyz;
    ps = r0.w * r0.w;
    r0.xyz = r3.xyz * r2.xyz;
    r6.y = ps;
    r1.xyz = r6.yyy * r1.xyz;
    ps = pow(2.0, r8.w);
    r6.yzw = r1.xyz * r6.xxx;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r7.ww + r6.xy;
    r6.z = r0.z * r7.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r8.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
