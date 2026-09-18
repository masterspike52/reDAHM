// ps_2e740e31a7477b91.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041500 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r1.xy);
    ps = UniformVector_2.x * r1.w;
    r6.x = r10.w - 0.5;
    r7.y = ps;
    ps = (-4e+02) - -r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r7.z = ps;
    r13.z = tex2D(ShadowTexture, r0.xy).x;
    ps = 1.0 - r1.z;
    r12.w = UniformVector_6.y * UniformScalar_5.x;
    r11.y = ps;
    r0.yz = r1.wz * 6.0;
    r6.zw = r1.wz * UniformVector_1.xy;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = UniformScalar_1.x;
    r6.y = dot(r4.zxy, r4.zxy);
    ps = UniformVector_4.x * ps;
    r0.w = UniformVector_4.x * UniformScalar_4.x;
    r0.x = ps;
    r12.xz = r0.xw * UniformVector_6.xx;
    ps = 0.1 - -r2.z;
    r12.y = UniformScalar_2.x * UniformVector_6.y;
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.zw = saturate(r7.xz * float2(5.0, 0.00022222222));
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r6.yyy * r4.xyz;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r4.xyz = r6.yyy * -SpotDirection.xyz;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r4.zxy, r3.zxy);
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = r7.w * (-0.025);
    r0.w = ps;
    r13.xy = r9.xy * r7.xx + r6.zw;
    ps = 1.0 / UniformVector_1.y;
    r6.z = r6.y - SpotAngles.x;
    r13.w = ps;
    ps = SpotAngles.y * r6.z;
    r3.xy = r1.wz * UniformVector_7.xy;
    r4.x = saturate(ps);
    ps = 1.0 / r5.w;
    r6.zw = r13.zy * r13.zw;
    r4.w = ps;
    ps = 1.0 - r6.w;
    r4.yz = r5.xy * ScreenPositionScaleBias.xy;
    r11.x = ps;
    ps = r4.x * r4.x;
    r3.zw = r0.xw * abs(r8.xy);
    r0.x = ps;
    ps = r4.y * r4.w;
    r8.xyw = r11.zxy * UniformVector_2.xyy;
    r6.y = ps;
    ps = r4.z * r4.w;
    r11.xy = r8.yw - 0.5;
    r6.w = ps;
    ps = r8.x;
    r4 = r12 + r1.xyxy;
    ps = r13.x * ps;
    r16.zw = float2((r8.yw >= 0.5));
    r7.x = ps;
    ps = (-0.5) + r7.x;
    r11.zw = r11.xy - r8.yw;
    r11.x = ps;
    ps = (-0.5) + r7.y;
    r16.xy = float2((r7.xy >= 0.5));
    r11.y = ps;
    ps = ScreenPositionScaleBias.w + r6.y;
    r11.xy = r11.xy - r7.xy;
    r12.x = ps;
    r8.xz = r11.xy * r16.xy + r7.xy;
    r8.yw = r11.zw * r16.zw + r8.yw;
    ps = ScreenPositionScaleBias.z + r6.w;
    r11 = r8 + r8;
    r12.y = ps;
    r8.xyz = tex2D(Texture2D_6, r13.xy).xyz;
    r19.xyz = tex2D(LightAttenuationTexture, r12.xy).xyz;
    r17.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r14 = tex2D(Texture2D_1, r11.zw);
    r20 = tex2D(Texture2D_1, r11.xy);
    r21 = tex2D(Texture2D_4, r4.xy);
    r12 = tex2D(Texture2D_5, r4.zw);
    r15.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r11.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r4.xyw = tex2D(Texture2D_2, r0.yz).xyw;
    r1.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r0.z = dot(r2.zxy, r2.zxy);
    r13.xyz = UniformVector_5.xyz * 2e+01;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r6.y = float((UniformScalar_8.x > 1.0));
    r17.zw = r4.xy * 2.0 - 1.0;
    ps = r3.x + r3.x;
    r18.xyz = r10.xyz * UniformScalar_9.xxx;
    r4.x = ps;
    r11.xyz = (-abs(r6.yyy) >= 0.0) ? r11.xyz : 1.0;
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r12.xyz = r12.xyz * r12.www;
    r6.x = saturate(ps);
    r12.xyz = r21.xyz * r21.www + r12.xyz;
    ps = log2(r6.x);
    r15.xyz = r15.xyz * UniformVector_4.xyz;
    r6.y = ps;
    r11.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r11.xyz;
    r18.xyz = r18.xyz * r11.xyz + UniformScalar_10.xxx;
    ps = r3.y + r3.y;
    r13.xyz = r13.xyz * r12.xyz;
    r4.y = ps;
    ps = r3.w + r3.w;
    r6.x = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r4.z = ps;
    ps = r4.w;
    r6.x = r6.x - r13.x;
    ps = r1.w * ps;
    r6.w = saturate(r6.x + r13.x);
    r6.x = ps;
    r12.xy = -r15.xy * r6.ww + r15.xy;
    r0.yw = r16.zw * 2.0 + r16.xy;
    r7.x = (r0.y == 0.0) ? r20.x : r20.y;
    r7.y = (r0.w == 0.0) ? r14.x : r14.y;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r16 = r0.yyww + float4(-3.0, -2.0, -2.0, -3.0);
    r0.y = ps;
    r6.y = (r16.z == 0.0) ? r14.z : r7.y;
    r7.x = (r16.y == 0.0) ? r20.z : r7.x;
    r4.w = (r16.x == 0.0) ? r20.w : r7.x;
    r7.x = (r16.w == 0.0) ? r14.w : r6.y;
    ps = 1.0 - r7.x;
    r1.w = max(r7.x, 0.0);
    r7.x = ps;
    ps = 1.0 - r7.z;
    r14 = r4 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.w = ps;
    r12.zw = -r7.ww * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.z));
    r7.y = r14.w + r4.w;
    r6.y = ps;
    ps = pow(2.0, r0.y);
    r7.y = saturate(r7.y - r6.x);
    r7.z = ps;
    ps = r5.w;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r0.yzw = -ModShadowColor.xyz + 1.0;
    r15.w = saturate(ps);
    ps = r1.x + r1.x;
    r3.xyz = r6.yyy * r2.xyz;
    r16.z = ps;
    ps = r1.y + r1.y;
    r17 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    r16.w = ps;
    ps = (-1.0) - -r6.x;
    r5.xz = -r15.zw + 1.0;
    r6.y = ps;
    ps = 1.0 - r6.w;
    r1.xyz = r6.zzz * r19.xyz;
    r6.z = ps;
    ps = r1.w;
    r1.xyz = r1.xzy * r7.zzz;
    r6.x = ps;
    ps = 0.3;
    r2.xyz = r18.xyz * r6.zzz;
    r6.z = ps;
    ps = min(r6.x, r6.z);
    r16.xy = r17.xy * r12.zw;
    r6.x = ps;
    ps = 3.3333333 * r6.x;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r5.y = ps;
    ps = r16.x * r16.y;
    r6.xz = r16.zw + r17.zw;
    r7.z = ps;
    r0.yzw = r7.zzz * r0.yzw + ModShadowColor.xyz;
    ps = 2.5 * r7.x;
    r6 = r5.yyyx * r6.xzyw;
    r7.z = ps;
    ps = r15.z;
    r8.xyz = r7.yyy * r8.xyz;
    ps = r6.w + ps;
    r7.y = r6.z + 1.0;
    r6.w = ps;
    ps = r7.y * r7.x;
    r6.xz = r12.xy + r6.xy;
    r6.y = ps;
    ps = r7.z * r7.y;
    r12.xyz = -r14.xyz + r6.xzw;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y > 0.9));
    r7.w = saturate(ps);
    r6.xy = r12.xy * r7.ww + r14.xy;
    r7.xyz = r13.xyz * r6.zzz - r8.xyz;
    r6.z = r12.z * r7.w - 2.0;
    r6.z = r3.w * 2.0 + r6.z;
    r7.xyz = r11.xyz * r10.xyz + r7.xyz;
    r7.xyz = r7.xyz * r7.www + r8.xyz;
    r6.xyz = r6.zxy * r5.zzz;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r5.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r5.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.xyz = r2.xyz * r7.www;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r4.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xxx;
    r6.xyz = r6.xzy * r0.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
