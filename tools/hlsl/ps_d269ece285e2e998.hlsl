// ps_d269ece285e2e998.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xy = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r12.x = UniformScalar_8.x * 0.05;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    ps = 0.0001 * ps;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r11.y = saturate(ps);
    ps = r4.w;
    r5.y = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r12.yzw = r8.xyz * r2.www;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r11.xz = saturate(r5.wz * float2(5.0, 0.00022222222));
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r8.xyz = r5.yyy * r3.xyz;
    r11.w = ps;
    ps = -r0.z;
    r4 = r12.xywz * r11.zwww;
    r5.xy = r8.xy * r4.xx + r0.wz;
    ps = 1.0 + ps;
    r5.z = -r5.y + 1.0;
    r5.w = ps;
    r10.xyz = r5.xzw * UniformVector_1.xyy;
    ps = UniformVector_1.x * r0.w;
    r5.w = float((UniformScalar_3.x >= 1.0));
    r10.w = ps;
    r3 = r10 - 0.5;
    r2 = float4((r10 >= 0.5));
    ps = r5.x + r5.x;
    r12 = r3 - r10;
    r3.y = ps;
    r10 = r12 * r2 + r10;
    ps = r5.y + r5.y;
    r12 = r10.wxyz + r10.wxyz;
    r3.z = ps;
    r22 = tex2D(Texture2D_4, r9.xy);
    r21.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r16 = tex2D(Texture2D_3, r12.xw);
    r10.xyz = tex2D(Texture2D_0, r3.yz).xyz;
    r15 = tex2D(Texture2D_6, r0.xy);
    r13 = tex2D(Texture2D_8, r0.xy);
    r14.xyz = UniformVector_4.xyz * 2e+01;
    r9.xyz = r13.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r5.xyz = r15.xyz * r15.www;
    ps = r6.w;
    r14.xyz = r14.xyz * r5.xyz;
    ps = 15.0 * ps;
    r5.x = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r18.x = saturate(ps);
    ps = -r6.w;
    r5.x = r5.x - r14.x;
    ps = UniformScalar_4.x + ps;
    r3.x = saturate(r5.x + r14.x);
    r9.w = ps;
    ps = 1.0 - r3.x;
    r5.xz = -r11.yx + 1.0;
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r11.yzw = r10.xyz + r10.xyz;
    r18.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9 = r9 * r5.yyyw;
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r9.w + r6.w;
    r15.y = ps;
    ps = -r5.y;
    r15.xy = r15.xy * abs(r7.xy);
    ps = r6.z + ps;
    r20.x = dot(r2.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = r5.y;
    r20.y = dot(r2.wzz, float3(1.0, 1.0, 1.0));
    r2.x = ps;
    r5.y = (r20.y == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_5.x;
    r17 = r20.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r2.y = ps;
    r5.y = (r17.z == 0.0) ? r16.z : r5.y;
    r2.z = (r17.w == 0.0) ? r16.w : r5.y;
    ps = max(r2.x, r2.y);
    r5.y = max(r2.z, 0.0);
    r5.w = ps;
    ps = 1.0 / UniformScalar_6.x;
    r2.xy = min(r5.wy, float2(1.0, 0.3));
    r5.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r18.w = saturate(r2.x * r5.y);
    r18.z = ps;
    r16 = -r18.wxyz + 1.0;
    r21.x = r16.x * r6.w;
    r5.yz = r21.wx * r22.wz;
    r2.w = float((r5.z >= 0.05));
    r2.xw = -r2.zw + 1.0;
    r5.z = (UniformScalar_4.x > 0.0) ? r2.w : 1.0;
    r5.z = (UniformScalar_4.x >= 0.0) ? r5.z : r2.w;
    r11.x = r5.z * r13.w;
    ps = r0.w + r0.w;
    r11 = r11.yzwx + float4(-1.0, -1.0, -1.0, -0.5);
    r6.x = ps;
    ps = r0.z + r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r11.wwww)) clip(-1.0);
    r6.y = ps;
    r7 = tex2D(Texture2D_2, r6.xy);
    r3.yzw = tex2D(Texture2D_7, r3.yz).xyz;
    r19.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r12 = tex2D(Texture2D_3, r12.yz);
    r5.zw = tex2D(ModShadowAccumTexture, r15.xy).xy;
    r6.xyz = tex2D(Texture2D_1, r6.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = dot(r1.zxy, r1.zxy);
    r15.xyz = r6.xyz * 2.0 - 1.0;
    r17.zw = r22.xy * 2.0 - 1.0;
    r6.xy = r21.yz * 2.0 - 1.0;
    r6.z = (r20.x == 0.0) ? r12.x : r12.y;
    r6.z = (r17.y == 0.0) ? r12.z : r6.z;
    r17.x = (r17.x == 0.0) ? r12.w : r6.z;
    ps = 0.5 * r6.x;
    r17.y = r2.y * 3.3333333;
    r12.x = ps;
    ps = 0.5 * r6.y;
    r2.yz = -r17.xy + 1.0;
    r12.y = ps;
    ps = r18.x;
    r6.xyz = r19.xyz + r19.xyz;
    r6.w = dot(r18.xx, r2.yy) + r17.x;
    ps = r2.z * ps;
    r6.w = r6.w + r17.x;
    r12.z = ps;
    ps = (-1.0) - -r5.y;
    r6 = r6 + float4(-1.0, -1.0, -1.0, 0.25);
    r18.w = ps;
    ps = r6.w;
    r18.xyz = r17.zyw + r12.xzy;
    ps = -r5.y + ps;
    r6.xyz = r6.zxy * UniformVector_3.zxy;
    r5.y = saturate(ps);
    r2.y = r18.w * r18.y + 1.0;
    ps = 0.875 * r5.z;
    r3.yzw = r5.yyy * r3.yzw;
    r17.z = ps;
    r12.xy = -r6.yz * r3.xx + r6.yz;
    r12.xy = r18.xy * r18.yz + r12.xy;
    ps = 2.5 * r2.x;
    r17.xyw = -r3.yzw + r7.xyz;
    r2.z = ps;
    r7.xyz = r17.xyw * r7.www + r3.yzw;
    ps = 0.875 * r5.w;
    r17.xy = r2.yz * r2.xy;
    r17.w = ps;
    ps = 1.0 - r6.x;
    r2 = r17.yzwx * r16.yzwy;
    r3.y = ps;
    ps = r2.x;
    r3.zw = r2.yz + 0.125;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r2.xyz = r15.xyz - r11.xyz;
    r5.w = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r6.w = float((r2.w >= 0.9));
    r5.y = ps;
    r11.w = r2.z * r7.w - 2.0;
    r11.xyz = r2.xyz * r7.www + r11.xyz;
    r13.xyz = r14.xyz * r6.www + r13.xyz;
    ps = r3.y * r3.x;
    r2.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = r3.z * r3.w;
    r1.xyz = r13.xyz - r7.xyz;
    r6.w = ps;
    r0.xyz = r6.www * r0.xyz + ModShadowColor.xyz;
    r7.xyz = r1.xyz * r5.www + r7.xyz;
    r12.z = r6.x + r5.y;
    r6.xyz = -r11.xyz + r12.xyz;
    r6.xyz = r6.xyz * r5.www + r11.xyw;
    r6.w = r10.z * 2.0 + r6.z;
    r6.xyw = r6.xyw * r5.xxx;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r5.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r5.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r6.zxy, r6.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r9.xyz * r5.www;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r6.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r8.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r6.xyz = r3.xyz * r5.xxx;
    r6.xyz = r6.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r2.zxy, r6.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r6.xyz = r7.xyz * r5.yzw;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zyx, r2.zyx));
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r4.ywz * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
