// ps_8165ecb383c2edbd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006A8 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_9, r0.xy);
    r5.zw = saturate(UniformVector_12.xy);
    ps = UniformScalar_4.x;
    r10.w = r0.w * UniformVector_2.x;
    ps = UniformScalar_5.x * ps;
    r6.y = -r0.z + 1.0;
    r8.y = ps;
    ps = r4.w;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = (-2e+02) + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r5.x = saturate(r5.x * 0.00022222222);
    r3.w = ps;
    ps = (-0.1) * r5.x;
    r6.xw = r0.wz * UniformVector_1.xy;
    r1.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.xyz = r3.www * r3.xyz;
    r5.x = ps;
    r13.xy = r9.xy * r1.ww + r6.xw;
    r6.x = -r13.y * r5.x + 1.0;
    ps = UniformScalar_5.x * r5.y;
    r6.xyz = r6.xyz * UniformVector_2.yyx;
    r8.x = ps;
    ps = r14.w;
    r10.z = r6.z * r13.x;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r12.zw = float2((r6.xy >= 0.5));
    r5.x = ps;
    ps = r12.z + r12.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r8.z = ps;
    ps = r12.w + r12.w;
    r16.xy = float2((r10.zw >= 0.5));
    r8.w = ps;
    r5.xy = floor(r8.xy);
    r5.xy = r5.xy * UniformVector_11.xy - r8.xy;
    r16.zw = r5.xy * r5.zw;
    r8 = r8 + r16.zwxy;
    r5.xy = r0.xy * UniformVector_13.xy + r8.xy;
    r5.xy = r5.xy * UniformVector_8.xy;
    ps = 1.0 / UniformVector_10.x;
    r5.yz = frac(r5.xy);
    r18.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r5.xw = float2((UniformVector_10.xy >= r5.yz));
    r18.y = ps;
    ps = r5.x * r5.w;
    r18.zw = float2((UniformVector_10.yx > r5.zy));
    r5.x = ps;
    r5.xyz = r5.yzx * r18.xyz;
    r3.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r15 = tex2D(Texture2D_6, r5.xy);
    ps = r0.w + r0.w;
    r3.x = saturate(r4.w * 0.0001);
    r5.y = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r11.zw = r0.wz * UniformVector_14.xy;
    r10.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r5.x = r1.z + 0.1;
    r10.y = ps;
    ps = 5.0 * r5.x;
    r17.xyz = UniformVector_5.xyz * 2e+01;
    r12.x = saturate(ps);
    ps = 1.0 / r4.w;
    r15.xyz = r15.xyz * r15.www;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = r10.xy * r0.wz;
    r4.x = ps;
    r3.yzw = r3.yzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.yzw = r3.yzw * UniformVector_4.xyz;
    r4.y = ps;
    ps = r3.w;
    r4.xy = r4.xy * abs(r7.xy);
    r5.x = ps;
    r7.xy = r13.zw * r5.ww + ScreenPositionScaleBias.wz;
    ps = 1.0 - r5.x;
    r4.zw = r10.zw - 0.5;
    r10.x = ps;
    ps = 1.0 - r3.x;
    r4.zw = r4.zw - r10.zw;
    r10.y = ps;
    r16.xz = r4.zw * r16.xy + r10.zw;
    ps = (-0.5) + r6.x;
    r5.z = r5.z * r18.w;
    r5.x = ps;
    ps = (-0.5) + r6.y;
    r15.xyz = r15.xyz * r5.zzz;
    r5.z = ps;
    ps = r5.x;
    r15.xyz = r17.xyz * r15.xyz;
    ps = -r6.x + ps;
    r5.x = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r10.z = ps;
    ps = r5.z;
    r5.x = r5.x - r15.x;
    ps = -r6.y + ps;
    r12.y = saturate(r5.x + r15.x);
    r10.w = ps;
    r16.yw = r10.zw * r12.zw + r6.xy;
    ps = r0.z + r0.z;
    r6 = r16 + r16;
    r5.z = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r17.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r16 = tex2D(Texture2D_2, r11.xy);
    r20 = tex2D(Texture2D_3, r6.zw);
    r21 = tex2D(Texture2D_3, r6.xy);
    r4.xyz = tex2D(Texture2D_8, r11.zw).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r11.xy).xyz;
    r5.xyz = tex2D(Texture2D_4, r5.yz).wxy;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = float((UniformScalar_12.x >= 1.0));
    r0.z = dot(r1.zxy, r1.zxy);
    r1.w = dot(r2.zxy, r2.zxy);
    ps = (-1.0) + r5.x;
    r4.w = float((UniformScalar_12.x > 1.0));
    r6.x = ps;
    r6.yz = r5.yz * 2.0 - 1.0;
    r11.xyz = r11.xyz * 2.0 - 1.0;
    ps = r0.x + r0.x;
    r5.yzw = r14.xyz * UniformScalar_13.xxx;
    r18.x = ps;
    ps = r0.y + r0.y;
    r19.xyz = r7.xyz * r2.www;
    r18.y = ps;
    r2.xyz = (-abs(r4.www) >= 0.0) ? r4.xyz : 1.0;
    ps = rsqrt(abs(r0.z));
    r5.x = saturate(-r1.w + 1.0);
    r0.z = ps;
    ps = log2(r5.x);
    r4.xyz = r0.zzz * r1.xyz;
    r5.x = ps;
    r2.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r2.xyz;
    r7.xyz = r5.yzw * r2.xyz + UniformScalar_14.xxx;
    r5.z = (r8.z == 0.0) ? r21.x : r21.y;
    r5.y = (r8.w == 0.0) ? r20.x : r20.y;
    ps = r0.w + r0.w;
    r1 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r18.z = ps;
    r5.y = (r1.z == 0.0) ? r20.z : r5.y;
    r5.z = (r1.y == 0.0) ? r21.z : r5.z;
    r18.w = (r1.x == 0.0) ? r21.w : r5.z;
    r5.z = (r1.w == 0.0) ? r20.w : r5.y;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = max(r5.z, 0.0);
    r5.w = ps;
    ps = 1.0 - r5.z;
    r5.x = min(r5.y, 0.3);
    r5.y = ps;
    ps = pow(2.0, r5.w);
    r1 = r18 + float4(-1.0, -1.0, -1.0, -0.75);
    r5.z = ps;
    ps = r1.w;
    r0.xyz = r19.xzy * r5.zzz;
    ps = r18.w + ps;
    r11.xyz = r11.xyz - r1.xyz;
    r5.z = saturate(ps);
    r11.w = r11.z * r16.w - 2.0;
    r11.xyz = r11.xyz * r16.www + r1.xyz;
    ps = 3.3333333 * r5.x;
    r1.xyz = r5.zzz * r17.xyz;
    r5.x = ps;
    ps = 2.5 * r5.y;
    r6.xyz = r5.xxx * r6.xyz;
    r5.z = ps;
    ps = 1.0 + r6.x;
    r17.xyz = -r1.xyz + r16.xyz;
    r5.x = ps;
    r1.xyz = r17.xyz * r16.www + r1.xyz;
    r5.xy = r5.zx * r5.xy;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r6.w = saturate(ps);
    r5.xyz = r15.xyz * r5.zzz - r1.xyz;
    r2.xyz = r2.xyz * r14.xyz + r5.xyz;
    r5.xy = -r3.yz * r12.yy + r3.yz;
    r1.xyz = r2.xyz * r6.www + r1.xyz;
    r1.xyz = r1.xyz * r13.xyz;
    r5.z = r10.x * r12.y + r3.w;
    r5.xy = r6.yz * 2.0 + r5.xy;
    r2.xw = -r12.xy + 1.0;
    r3.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    r5.xyz = -r11.xyz + r5.xyz;
    r5.xyz = r5.xyz * r6.www + r11.xyw;
    r5.w = r0.w * 2.0 + r5.z;
    r5.xyz = r5.wxy * r10.yyy;
    ps = 1.0 + r5.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r10.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r10.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r5.yzw = r7.xyz * r2.www;
    r5.x = ps;
    r7.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r7.zxy, r9.zxy);
    r6.xyz = r7.xyz * r5.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r4.zxy, r6.zxy));
    ps = log2(r5.x);
    r6.xyz = r5.yzw * r6.www;
    r8.z = ps;
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r7.zyx, r4.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r3.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
