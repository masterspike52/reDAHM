// ps_022504849886f51a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 357 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000594 10041100 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
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
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.x = r4.w - 4e+02;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.z));
    r5.y = r1.z + 0.1;
    r6.x = ps;
    ps = 0.00022222222 * r5.x;
    r5.zw = r0.wz * UniformVector_1.xy;
    r6.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r6.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.y = r6.w * (-0.025);
    r5.x = ps;
    r5.yz = r8.xy * r5.yy + r5.zw;
    r6.z = r5.z * r5.x;
    ps = 0.0001 * r4.w;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r10.yzw = -r6.zxy + 1.0;
    r10.x = ps;
    r6.yz = r10.yx * UniformVector_2.yx;
    r6.x = r6.z * r5.y;
    r11 = tex2D(Texture2D_1, r6.xy);
    ps = UniformVector_2.x * r0.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xy = r0.wz * 6.0;
    r2.y = ps;
    ps = trunc(UniformScalar_1.x);
    r9.zw = r0.wz * UniformVector_6.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = -r0.z + 1.0;
    r2.z = ps;
    r5.w = (r6.z == 0.0) ? r11.x : r11.y;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = r2.y;
    r12 = r6.xyzz + float4(-0.5, -0.5, -3.0, -2.0);
    ps = abs(r7.x) * ps;
    r14.xy = float2((r6.xy >= 0.5));
    r2.x = ps;
    ps = 1.0 / r4.w;
    r3.xy = r12.xy - r6.xy;
    r14.z = ps;
    r5.x = (r12.w == 0.0) ? r11.z : r5.w;
    r6.w = (r12.z == 0.0) ? r11.w : r5.x;
    r5.xw = r3.zw * r14.zz + ScreenPositionScaleBias.wz;
    r6.yz = r3.xy * r14.xy + r6.xy;
    ps = r2.z;
    r6.x = r6.w + 0.25;
    ps = abs(r7.y) * ps;
    r6.xyw = r6.yzx + r6.yzw;
    r2.y = ps;
    r15.xyz = tex2D(Texture2D_5, r5.yz).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r5.xw).xyz;
    r2 = tex2D(Texture2D_1, r6.xy);
    r7 = tex2D(Texture2D_4, r0.xy);
    r16.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r0.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r5.xyw = tex2D(Texture2D_0, r5.yz).xyz;
    r12.xyz = r5.xyw * 2.0 - 1.0;
    r9.xw = r0.xy * 2.0 - 1.0;
    r13.zw = r11.xy * 2.0 - 1.0;
    r5.x = r11.z * r0.z;
    r0.w = dot(r1.zxy, r1.zxy);
    r11.xyz = UniformVector_5.xzy * 2e+01;
    r5.z = float((UniformScalar_4.x >= 1.0));
    r0.x = float((UniformScalar_4.x > 1.0));
    r4.xyz = r4.xyz * 2.0 - 1.0;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r16.xyz : 1.0;
    r7.xyz = r7.xyz * r7.www;
    r0.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r0.yxz;
    r11.xyz = r11.xzy * r7.xyz;
    r5.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    ps = r5.z;
    r16.xyz = r4.xyz * UniformVector_4.xyz;
    ps = -r11.x + ps;
    r7.x = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    r5.z = (r7.x == 0.0) ? r2.x : r2.y;
    r1.w = saturate(r1.w + r11.x);
    r14.xy = -r16.xy * r1.ww + r16.xy;
    r7.yz = -r10.zz * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.w));
    r6.w = saturate(r6.w - r5.x);
    r0.w = ps;
    ps = UniformScalar_5.x * r6.z;
    r3.xyz = r3.xyz * LightColor.xyz;
    r9.y = ps;
    ps = UniformScalar_5.x * r6.y;
    r4.xyz = r0.www * r1.xyz;
    r9.z = ps;
    ps = UniformScalar_5.x * r0.y;
    r9.yz = r9.zy * r0.xz;
    r0.w = ps;
    ps = r0.w;
    r13 = r13 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r6.x * ps;
    r1.yz = r9.xw + r13.zw;
    r9.x = ps;
    r9.xyz = r9.xyz + UniformScalar_6.xxx;
    r7.yz = r13.xy * r7.yz;
    r13 = r7.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r5.z = (r13.y == 0.0) ? r2.z : r5.z;
    ps = r13.z * r13.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r2.xyz = r0.www * r17.xyz + ModShadowColor.xyz;
    r16.w = (r13.x == 0.0) ? r2.w : r5.z;
    r5.z = max(r16.w, 0.0);
    ps = (-1.0) - -r5.x;
    r5.y = min(r5.z, 0.3);
    r1.x = ps;
    ps = 1.0 - r1.w;
    r5.xz = -r16.zw + 1.0;
    r0.w = ps;
    ps = 3.3333333 * r5.y;
    r9.xyz = r9.xyz * r0.www;
    r5.y = ps;
    r13 = r5.yyxy * r1.xywz;
    ps = 2.5 * r5.z;
    r13.z = r16.z + r13.z;
    r0.w = ps;
    ps = r13.x;
    r1.xyz = r6.www * r15.xyz;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r13.xy = r14.xy + r13.yw;
    r6.w = ps;
    r11.xyz = r0.yxz * r6.xyz + r11.xyz;
    r5.xyz = -r12.xyz + r13.xyz;
    r6.w = saturate(r0.w * r6.w - 0.5);
    r5.xy = r5.xy * r6.ww + r12.xy;
    r5.z = r5.z * r6.w - 2.0;
    r6.xyz = r11.xyz - r1.xyz;
    r6.xyz = r6.xyz * r6.www + r1.xyz;
    r5.z = r5.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r10.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r10.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r9.xyz * r6.www;
    r5.x = ps;
    r1.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r1.zxy, r8.zxy);
    r5.xyz = r1.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r1.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r3.xyz * r5.xyz;
    r5.xyz = r5.xzy * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
