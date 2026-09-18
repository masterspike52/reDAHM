// ps_4dda29174932613f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041000 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
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
sampler2D ShadowTexture : register(s8);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_5, r1.xy);
    ps = (-0.5) + r15.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.x = ps;
    r7.xyz = tex2D(Texture2D_2, r6.xy).xwy;
    r8.xy = r1.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r5.w - 4e+02;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    r11.zw = r7.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r11.y = saturate(r6.z * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r10.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r12.xyw = r11.yzw * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r11.zw = r10.xy * r12.xx;
    r11.y = ps;
    r6.xz = r11.xy - 0.5;
    r0.zw = float2((r11.xy >= 0.5));
    ps = r6.y;
    r6.xz = r6.xz - r11.xy;
    ps = abs(r9.x) * ps;
    r8.zw = r6.xz * r0.zw;
    r6.z = ps;
    ps = r6.w;
    r11 = r11.zwxy + r8;
    ps = abs(r9.y) * ps;
    r6.xy = r11.zw + r11.zw;
    r6.w = ps;
    r9.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r16 = tex2D(Texture2D_1, r6.xy);
    r6.xyz = tex2D(Texture2D_2, r1.wz).xwy;
    r8.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r11.xy).xyz;
    r7.xzw = r4.zxy * 2.0 - 1.0;
    r8.xyz = r8.xyz * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    r13.y = ps;
    ps = r6.z + r6.z;
    r13.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r13.z = ps;
    r6.w = (r13.x == 0.0) ? r16.x : r16.y;
    r13 = r13.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r13.z;
    r8.xyw = r8.xyz * UniformVector_4.xyz;
    r6.w = (r13.y == 0.0) ? r16.z : r6.w;
    r0.z = (r13.x == 0.0) ? r16.w : r6.w;
    ps = r12.y + ps;
    r6.w = max(r0.z, 0.0);
    r9.x = ps;
    ps = r13.w;
    r9.y = min(r6.w, 0.3);
    ps = r12.w + ps;
    r12.xyz = r9.zyw * float3(0.875, 3.3333333, 0.875);
    r9.y = ps;
    r9.xy = r12.yy * r9.xy + r8.xy;
    ps = 1.0 / r5.w;
    r14.xy = r9.xy - r7.zw;
    r6.w = ps;
    r9.xy = r14.zw * r6.ww + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r11.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r6.w = tex2D(Texture2D_4, r1.xy).x;
    r0.x = saturate(r5.w * 0.0001);
    r1.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r2.z;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    r5.x = r7.y * r6.y - 1.0;
    ps = 1.0 - r6.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r15.xyz = r1.xyz * r15.xyz;
    r6.x = ps;
    r1.xyz = r15.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r6.y);
    r0.w = saturate(r6.z * 5.0);
    r6.z = ps;
    ps = -r7.x;
    r5.yzw = r6.xxx * -SpotDirection.xyz;
    ps = r8.w + ps;
    r6.y = dot(r5.wyz, r3.zxy);
    r12.w = ps;
    ps = -SpotAngles.x - -r6.y;
    r7.xy = -r0.zw + 1.0;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r0.zw = r7.yy * ModShadowGroupColor.xy;
    r3.w = saturate(ps);
    ps = 2.5 * r7.x;
    r5.yzw = -r0.wzx + 1.0;
    r15.w = ps;
    r3.xyz = r12.yxz * r5.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r3.x) * abs(r3.x);
    r7.x = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    r12.xyz = r15.xyz * r3.xxx - r11.xyz;
    r8.w = saturate(r15.w * r3.x - 0.5);
    r4.xy = r14.xy * r8.ww + r7.zw;
    ps = rsqrt(abs(r7.x));
    r6.xy = r3.yw * r3.zw;
    r0.z = ps;
    r7.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    r7.w = r12.w * r8.w - 2.0;
    ps = r0.x * r0.x;
    r3.xyz = r0.zzz * r2.xyz;
    r2.y = ps;
    r2.xzw = r12.xyz * r8.www + r11.xyz;
    ps = r0.y * r0.y;
    r8.xyz = r2.xzw * r8.xyz;
    r2.w = ps;
    r0.xyz = r2.www * r9.xyz;
    r4.z = r4.z * 2.0 + r7.w;
    r4.xyw = r4.xyz * r5.www;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r4.z = r4.w + 1.0;
    r7.w = ps;
    r4.xyz = (r5.www > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r5.www >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.w);
    r6.z = dot(r4.zxy, r4.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r0.xzy * r7.www;
    r6.z = ps;
    r4.xyz = r4.xyz * r6.zzz;
    r6.z = dot(r4.zxy, r10.zxy);
    r5.xyz = r4.xyz * r6.zzz;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    r6.z = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r6.z);
    r7.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    ps = UniformScalar_8.x * r6.w;
    r0.w = r6.z * UniformScalar_7.x;
    r2.x = ps;
    ps = pow(2.0, r0.w);
    r6.z = r6.z * 15.0;
    r2.z = ps;
    r6.xw = r2.xy * r2.zy;
    r1.xyz = r1.xyz + r6.xxx;
    r1.xyz = r6.www * r1.xyz;
    ps = pow(2.0, r6.z);
    r1.xyz = r1.xyz * r8.www;
    r6.z = ps;
    r6.xzw = r1.xyz * r6.zzz;
    r8.xy = r8.xy * r7.ww + r6.xz;
    r8.z = r8.z * r7.w + r6.w;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r8.xzy * r6.yyy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
