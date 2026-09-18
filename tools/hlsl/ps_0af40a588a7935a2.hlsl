// ps_0af40a588a7935a2.bin
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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

    r18 = tex2D(Texture2D_5, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r18.w - 0.5;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r1.w;
    r6.xy = r6.xy * abs(r9.xy);
    r10.x = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r5.w;
    r6.yz = r1.wz * 6.0;
    ps = (-4e+02) + ps;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.x = saturate(r6.w * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r9.xyw = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r16.xyz = r7.xyz * float3(-0.025, 0.875, 0.875);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r10.zw = r9.xy * r16.xx;
    r10.y = ps;
    ps = r1.w;
    r6.xw = r10.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r8.xw = float2((r10.xy >= 0.5));
    r7.x = ps;
    ps = r1.z;
    r6.xw = r6.xw - r10.xy;
    ps = UniformVector_1.y * ps;
    r7.zw = r6.xw * r8.xw;
    r7.y = ps;
    r4 = r10 + r7.zwxy;
    r6.xw = r4.xy + r4.xy;
    r12 = tex2D(Texture2D_1, r6.xw);
    r10.xzw = tex2D(Texture2D_3, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r6.yz).xyw;
    r6.xyw = tex2D(Texture2D_2, r1.wz).xwy;
    r7.xyw = tex2D(Texture2D_0, r4.zw).xyz;
    r4.xy = r1.wz * UniformVector_7.xy;
    r13.xyz = r7.xyw * 2.0 - 1.0;
    r15.x = r14.z * r6.y - 1.0;
    r8.yz = r14.xy * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    r10.y = ps;
    r6.xyz = r10.wxz * 2.0 - 1.0;
    ps = r6.w + r6.w;
    r10.x = dot(r8.xww, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    r6.w = (r10.x == 0.0) ? r12.x : r12.y;
    r10 = r10.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.w = (r10.y == 0.0) ? r12.z : r6.w;
    r0.w = (r10.x == 0.0) ? r12.w : r6.w;
    r6.w = max(r0.w, 0.0);
    ps = UniformVector_4.x * r6.y;
    r8.x = min(r6.w, 0.3);
    r17.x = ps;
    ps = UniformVector_4.y * r6.z;
    r8.xyz = r8.yzx * float3(0.5, 0.5, 3.3333333);
    r17.y = ps;
    ps = UniformVector_4.z * r6.x;
    r15.yz = r10.zw + r8.xy;
    r17.z = ps;
    r6.xy = r8.zz * r15.yz + r17.xy;
    ps = 1.0 / r5.w;
    r14.xy = r6.xy - r13.xy;
    r6.x = ps;
    r6.xy = r14.zw * r6.xx + ScreenPositionScaleBias.wz;
    r9.z = tex2D(Texture2D_4, r1.xy).x;
    r10.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r12.xyz = tex2D(Texture2D_7, r4.zw).xyz;
    r7.xyz = tex2D(Texture2D_6, r4.xy).yxz;
    r4.xyz = tex2D(Texture2D_8, r1.xy).xyz;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = r5.w;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r0.y = saturate(ps);
    ps = r2.z;
    r5.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r4.xyz = r4.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = 0.1 + ps;
    r5.xyz = r5.xyz * r18.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(-r6.y + 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r6.y));
    r2.xyz = r6.www * r2.xyz;
    r6.y = ps;
    ps = log2(r6.x);
    r18.xyz = r6.yyy * -SpotDirection.xyz;
    r6.x = ps;
    ps = 5.0 * r6.z;
    r6.y = dot(r18.zxy, r3.zxy);
    r0.z = saturate(ps);
    ps = -r13.z;
    r6.zw = -r0.zw + 1.0;
    ps = r17.z + ps;
    r0.zw = r6.zz * ModShadowGroupColor.xy;
    r5.w = ps;
    ps = 2.5 * r6.w;
    r8.xyw = -r0.zwy + 1.0;
    r3.w = ps;
    r0.zw = r16.yz * r8.xy + 0.125;
    r6.z = r8.z * r15.x + 1.0;
    ps = abs(r6.z) * abs(r6.z);
    r3.xyz = r5.xyz * r7.yxz;
    r0.y = ps;
    r5.xyz = r3.xyz * r6.zzz - r12.xyz;
    r6.w = saturate(r3.w * r6.z - 0.5);
    r3.xy = r14.xy * r6.ww + r13.xy;
    r6.z = r5.w * r6.w - 2.0;
    r5.xyz = r5.xyz * r6.www + r12.xyz;
    r0.xyw = r0.zxy * r0.wxy;
    r8.xyz = r0.xxx * r11.xyz + ModShadowColor.xyz;
    r1.xyz = r5.xyz * r1.xyz;
    r5.xyz = r0.yyy * r10.xyz;
    r3.z = r7.w * 2.0 + r6.z;
    r3.xyw = r3.xyz * r8.www;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r3.z = r3.w + 1.0;
    r6.z = ps;
    r3.xyz = (r8.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r8.www >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.z);
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r5.xzy * r6.zzz;
    r6.x = ps;
    r3.xyz = r3.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r9.wxy);
    r5.xyz = r3.xyz * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyw;
    ps = UniformScalar_8.x * r7.y;
    r6.x = saturate(dot(r2.zxy, r5.zxy));
    r7.x = ps;
    ps = log2(r6.x);
    r7.z = saturate(dot(r3.zyx, r2.zyx));
    r6.z = ps;
    ps = -SpotAngles.x - -r6.y;
    r7.y = r6.z * UniformScalar_7.x;
    r6.x = ps;
    ps = pow(2.0, r7.y);
    r6.z = r6.z * 15.0;
    r6.y = ps;
    ps = SpotAngles.y * r6.x;
    r9.y = r7.x * r6.y;
    r9.x = saturate(ps);
    r6.xy = r9.xy * r9.xz;
    ps = r0.w * r0.w;
    r7.xyw = r4.xyz + r6.yyy;
    r8.w = ps;
    r7.xyw = r8.www * r7.xyw;
    ps = pow(2.0, r6.z);
    r7.xyw = r7.xyw * r6.www;
    r6.z = ps;
    r6.yzw = r7.xyw * r6.zzz;
    r7.xy = r1.xy * r7.zz + r6.yz;
    r7.z = r1.z * r7.z + r6.w;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xxx;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
