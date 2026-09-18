// ps_ebcfd71ee069fb49.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
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
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r9.xy = r0.xy * UniformVector_3.xy;
    r5.z = ps;
    r12 = tex2D(Texture2D_8, r9.xy);
    ps = 0.1 - -r1.z;
    r13.xy = r0.wz * 6.0;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r4.w - 4e+02;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r9.w = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = r12.w - 0.5;
    r6.z = ps;
    ps = 5.0 * r5.y;
    r10.xy = r0.wz * UniformVector_1.xy;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r5.x;
    r8.xyz = r6.zzz * r3.xyz;
    r6.w = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.y = r6.w * (-0.025);
    r5.x = ps;
    r3.xy = r8.xy * r5.yy + r10.xy;
    ps = 1.0 - r0.z;
    r6.z = r3.y * r5.x;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xw = -r6.zx + 1.0;
    r6.z = ps;
    ps = r9.z;
    r10.xyw = r6.zxy * UniformVector_2.xyy;
    ps = abs(r7.x) * ps;
    r3.zw = r10.yw - 0.5;
    r5.y = ps;
    ps = r10.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    ps = r3.x * ps;
    r11.xy = float2((r10.yw >= 0.5));
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r14.xy = r3.zw - r10.yw;
    r3.z = ps;
    ps = (-0.5) + r5.z;
    r11.zw = float2((r5.xz >= 0.5));
    r3.w = ps;
    ps = r9.w;
    r14.zw = r3.zw - r5.xz;
    r10.xz = r14.zw * r11.zw + r5.xz;
    r10.yw = r14.xy * r11.xy + r10.yw;
    ps = abs(r7.y) * ps;
    r10 = r10 + r10;
    r5.w = ps;
    r14 = tex2D(Texture2D_1, r10.zw);
    r15.y = tex2D(Texture2D_4, r9.xy).x;
    r7.xy = tex2D(ModShadowAccumTexture, r5.yw).xy;
    r9.yzw = tex2D(Texture2D_3, r9.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r13.xy).xyw;
    r16.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r9.x = UniformScalar_4.x * UniformScalar_3.x;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r3.zw = r0.wz * UniformVector_5.xy;
    r1.w = ps;
    ps = 1.0 / r4.w;
    r7.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r13.xy = r7.zw * r5.ww + ScreenPositionScaleBias.wz;
    r7.zw = r5.xy * 2.0 - 1.0;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r17.xyz = r9.wyz + float3(-2.0, 0.0, 0.0);
    r5.w = ps;
    r5.w = (-abs(r5.w) >= 0.0) ? 1.0 : (-1.0);
    r15.x = (-abs(r1.w) >= 0.0) ? (-1.0) : r5.w;
    ps = r16.x + r16.x;
    r5.xyw = r17.yxz + r9.ywz;
    r17.z = ps;
    ps = (-1.0) + r5.x;
    r7 = r7.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r9.y = ps;
    ps = (-1.0) + r5.w;
    r15.zw = r6.ww * ModShadowGroupColor.xy;
    r9.z = ps;
    ps = 0.0 + r5.y;
    r6.xyz = -r15.zyw + 1.0;
    r9.w = ps;
    ps = r16.y + r16.y;
    r9 = r9.yzxw * r15.xyxy;
    r17.w = ps;
    ps = r5.z;
    r17.xy = r7.xw * r6.xz;
    ps = r16.z * ps;
    r19 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r6.z = ps;
    r6.xw = r11.xy * 2.0 + r11.zw;
    r5.x = (r6.w == 0.0) ? r14.x : r14.y;
    ps = (-1.0) - -r6.z;
    r11 = r6.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.x = ps;
    r5.x = (r11.z == 0.0) ? r14.z : r5.x;
    r5.z = (r11.w == 0.0) ? r14.w : r5.x;
    ps = floor(r9.z);
    r5.x = max(r5.z, 0.0);
    r5.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.x = min(r5.x, 0.3);
    r7.w = ps;
    ps = 3.3333333 * r5.x;
    r7.yz = r19.zw + r7.yz;
    r5.y = ps;
    ps = r0.y;
    r14 = r5.yyyw * r7;
    ps = UniformScalar_8.x + ps;
    r5.x = r14.w + r0.x;
    r5.y = ps;
    r7.xyz = tex2D(Texture2D_6, r3.xy).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r13.xy).xyz;
    r18 = tex2D(Texture2D_5, r5.xy);
    r0 = tex2D(Texture2D_1, r10.xy).xwyz;
    r20.xyz = tex2D(Texture2D_7, r3.zw).xyz;
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r6.w = dot(r1.zxy, r1.zxy);
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = r4.w;
    r5.y = float((UniformScalar_11.x >= 1.0));
    ps = 0.0001 * ps;
    r1.w = dot(r2.zxy, r2.zxy);
    r5.w = saturate(ps);
    ps = r3.x + r3.x;
    r5.x = float((UniformScalar_11.x > 1.0));
    r16.x = ps;
    ps = r3.y + r3.y;
    r10.xyz = r12.xyz * UniformScalar_12.xxx;
    r16.y = ps;
    r4.xyz = (-abs(r5.xxx) >= 0.0) ? r20.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r5.x = saturate(-r1.w + 1.0);
    r1.w = ps;
    ps = log2(r5.x);
    r20.xyz = r1.www * -SpotDirection.xyz;
    r5.x = ps;
    r4.xyz = (-abs(r5.yyy) >= 0.0) ? 1.0 : r4.xyz;
    r10.xyz = r10.xyz * r4.xyz + UniformScalar_13.xxx;
    ps = r3.w + r3.w;
    r5.y = dot(r20.zxy, r2.zxy);
    r16.z = ps;
    r1.w = (r6.x == 0.0) ? r0.x : r0.z;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.z = r19.x * r19.y;
    r5.x = ps;
    r3.xyz = r3.zzz * r13.xyz + ModShadowColor.xyz;
    r0.x = (r11.y == 0.0) ? r0.w : r1.w;
    r16.w = (r11.x == 0.0) ? r0.y : r0.x;
    ps = rsqrt(abs(r6.w));
    r11 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.x = ps;
    ps = pow(2.0, r5.x);
    r6.x = -r11.z + r9.w;
    r6.w = ps;
    r13.xyz = UniformVector_4.xyz * 2e+01;
    ps = -SpotAngles.x - -r5.y;
    r0.yzw = r18.xyz * r18.www;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r17.xyz = r17.xyz * r2.www;
    r9.z = saturate(ps);
    ps = 1.0 - r5.z;
    r2.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = 1.0 - r5.w;
    r1.xyz = r13.xyz * r0.yzw;
    r0.w = ps;
    ps = r11.w;
    r13.xyz = r1.xyz * r15.yyy;
    ps = r16.w + ps;
    r1.xyz = r17.xzy * r6.www;
    r5.x = ps;
    ps = 2.5 * r0.x;
    r5.y = saturate(r5.x - r6.z);
    r0.z = ps;
    ps = r14.z;
    r10.xyz = r10.xyz * r6.yyy;
    r5.x = r9.x * r15.y + r14.y;
    ps = r9.y + ps;
    r0.y = r14.x + 1.0;
    r5.z = ps;
    ps = r0.y * r0.x;
    r7.xyz = r5.yyy * r7.xyz;
    r5.y = ps;
    ps = r0.z * r0.y;
    r9.xy = -r11.xy + r5.xz;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.y = float((r5.y > 0.9));
    r9.w = saturate(ps);
    r5.xyz = r13.xyz * r5.yyy - r7.xyz;
    r4.xyz = r4.xyz * r12.xyz + r5.xyz;
    r6.yzw = r9.xyz * r9.wwz;
    ps = 1.0 + r6.x;
    r5.xy = r11.xy + r6.yz;
    r4.w = ps;
    r7.xyz = r4.xyz * r9.www + r7.xyz;
    r5.z = r4.w * r9.w - 2.0;
    r5.z = r3.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r0.www;
    ps = 1.0 + r5.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r0.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r10.xyz * r9.www;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r9.xyz = r5.yzw * r5.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r2.zxy, r8.zxy));
    ps = log2(r5.x);
    r6.xyz = r7.xyz * r4.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r2.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r1.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r3.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
