// ps_726d0430ac90046e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 360 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005A0 10041200 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r4.w;
    r5.y = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r5.x = r4.w - 4e+02;
    r5.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.w = r1.z + 0.1;
    r6.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.xw = saturate(r5.wx * float2(5.0, 0.00022222222));
    r5.y = ps;
    ps = (-0.025) * r5.w;
    r6.yz = r0.wz * UniformVector_1.xy;
    r6.w = ps;
    ps = 1.0 - r5.x;
    r9.xyz = r5.yyy * r3.xyz;
    r5.y = ps;
    r10.xy = r9.xy * r6.ww + r6.yz;
    ps = 1.0 - r5.z;
    r6.x = r10.y * r6.x;
    r3.w = ps;
    r6.yz = r5.yy * ModShadowGroupColor.xy;
    ps = 1.0 / UniformVector_1.x;
    r16.yzw = -r6.xyz + 1.0;
    r16.x = ps;
    ps = UniformVector_2.x * r0.w;
    r5.yz = r16.yx * UniformVector_2.yx;
    r6.x = ps;
    r5.x = r5.z * r10.x;
    r13 = tex2D(Texture2D_1, r5.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yz = r0.wz * 6.0;
    r8.x = ps;
    ps = trunc(UniformScalar_1.x);
    r10.zw = r0.wz * UniformVector_6.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = -r0.z + 1.0;
    r8.y = ps;
    r5.w = (r6.z == 0.0) ? r13.x : r13.y;
    ps = UniformVector_2.y * r5.x;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = r8.x;
    r14 = r6.xyzz + float4(-0.5, -0.5, -3.0, -2.0);
    ps = abs(r7.x) * ps;
    r11.xy = float2((r6.xy >= 0.5));
    r5.x = ps;
    ps = 1.0 / r4.w;
    r12.xy = r14.xy - r6.xy;
    r11.z = ps;
    r5.w = (r14.w == 0.0) ? r13.z : r5.w;
    r6.w = (r14.z == 0.0) ? r13.w : r5.w;
    r3.xy = r12.zw * r11.zz + ScreenPositionScaleBias.wz;
    r6.yz = r12.xy * r11.xy + r6.xy;
    ps = r8.y;
    r6.x = r6.w + 0.25;
    ps = abs(r7.y) * ps;
    r6.xyw = r6.yzx + r6.yzw;
    r5.w = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r14.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r17.xy = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r7 = tex2D(Texture2D_1, r6.xy);
    r8 = tex2D(Texture2D_4, r0.xy);
    r15.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r18.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r5.yz).xyw;
    r5.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    r12.xyz = r4.xyw * 2.0 - 1.0;
    r10.xy = r5.yz * 2.0 - 1.0;
    r17.zw = r13.xy * 2.0 - 1.0;
    r2.xyz = r18.xyz * 2.0 - 1.0;
    r5.z = r13.z * r5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r13.xyz = UniformVector_5.xzy * 2e+01;
    r5.y = float((UniformScalar_4.x >= 1.0));
    r0.x = float((UniformScalar_4.x > 1.0));
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r15.xyz : 1.0;
    ps = 1.0 - r5.x;
    r8.xyz = r8.xyz * r8.www;
    r5.x = saturate(ps);
    r0.xyz = (-abs(r5.yyy) >= 0.0) ? 1.0 : r0.yxz;
    ps = log2(r5.x);
    r8.xyz = r13.xzy * r8.xyz;
    r5.y = ps;
    r5.x = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    ps = r5.x;
    r15.xyz = r2.xyz * UniformVector_4.xyz;
    ps = -r8.x + ps;
    r2.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r5.x = (r2.x == 0.0) ? r7.x : r7.y;
    r1.w = saturate(r0.w + r8.x);
    r13.xy = -r15.xy * r1.ww + r15.xy;
    ps = rsqrt(abs(r5.w));
    r6.w = saturate(r6.w - r5.z);
    r5.w = ps;
    ps = UniformScalar_5.x * r6.z;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r2.y = ps;
    ps = UniformScalar_5.x * r6.y;
    r4.xyz = r5.www * r1.xyz;
    r2.z = ps;
    ps = UniformScalar_5.x * r0.y;
    r2.zw = r2.zy * r0.xz;
    r5.w = ps;
    ps = r5.w;
    r17 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r6.x * ps;
    r1.yz = r10.xy + r17.zw;
    r2.y = ps;
    r10.xyz = r2.yzw + UniformScalar_6.xxx;
    r2.yz = r17.xy * r16.zw;
    r2 = r2.xyzx + float4(-2.0, 0.125, 0.125, -3.0);
    r5.x = (r2.x == 0.0) ? r7.z : r5.x;
    ps = r2.y * r2.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r2.xyz = r5.www * r11.xyz + ModShadowColor.xyz;
    r15.w = (r2.w == 0.0) ? r7.w : r5.x;
    r5.x = max(r15.w, 0.0);
    ps = (-1.0) - -r5.z;
    r5.x = min(r5.x, 0.3);
    r1.x = ps;
    ps = 1.0 - r1.w;
    r5.zw = -r15.zw + 1.0;
    r0.w = ps;
    ps = 3.3333333 * r5.x;
    r10.xyz = r10.xyz * r0.www;
    r5.x = ps;
    r11 = r5.xxzx * r1.xywz;
    ps = 2.5 * r5.w;
    r11.z = r15.z + r11.z;
    r0.w = ps;
    ps = r11.x;
    r1.xyz = r6.www * r14.xyz;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r11.xy = r13.xy + r11.yw;
    r6.w = ps;
    r8.xyz = r0.yxz * r6.xyz + r8.xyz;
    r11.xyz = -r12.xyz + r11.xyz;
    r5.z = saturate(r0.w * r6.w - 0.5);
    r6.xy = r11.xy * r5.zz + r12.xy;
    r5.x = r11.z * r5.z - 2.0;
    r0.xyz = r8.xyz - r1.xyz;
    r8.xyz = r0.xyz * r5.zzz + r1.xyz;
    r6.z = r4.w * 2.0 + r5.x;
    r6.xyz = r6.zxy * r3.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r3.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r10.xyz * r5.zzz;
    r5.x = ps;
    r1.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r1.zxy, r9.zxy);
    r5.xzw = r1.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r9.xyz;
    r5.x = saturate(dot(r4.zxy, r5.wxz));
    ps = log2(r5.x);
    r6.yzw = r8.xyz * r7.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r6.x = saturate(dot(r1.zyx, r4.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
