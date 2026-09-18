// ps_c6b0114a80d4ed4e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041200 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r0.xy);
    r5.z = r11.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r0.wz * 6.0;
    r13.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r4.w;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r6.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r9.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r12.xyw = r6.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r13.zw = r9.xy * r12.ww;
    r13.y = ps;
    ps = r0.w;
    r5.xw = r13.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r10.zw = float2((r13.xy >= 0.5));
    r6.x = ps;
    ps = r0.z;
    r5.xw = r5.xw - r13.xy;
    ps = UniformVector_1.y * ps;
    r6.zw = r5.xw * r10.zw;
    r6.y = ps;
    r3 = r13.zwxy + r6;
    r5.xw = r3.zw + r3.zw;
    r13 = tex2D(Texture2D_1, r5.xw).xzwy;
    r6.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r5.yzw = tex2D(Texture2D_3, r5.yz).xyw;
    ps = r4.w;
    r10.xy = r0.wz * UniformVector_6.xy;
    ps = 0.0001 * ps;
    r5.x = r1.z + 0.1;
    r17.z = saturate(ps);
    r14.xy = r5.yz * 2.0 - 1.0;
    ps = r6.y + r6.y;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r16.y = ps;
    ps = r6.z + r6.z;
    r16.x = dot(r10.zww, float3(1.0, 1.0, 1.0));
    r16.z = ps;
    r5.y = (r16.x == 0.0) ? r13.x : r13.w;
    ps = 5.0 * r5.x;
    r16 = r16.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r13.x = saturate(ps);
    r5.x = (r16.y == 0.0) ? r13.y : r5.y;
    r13.w = (r16.x == 0.0) ? r13.z : r5.x;
    ps = 1.0 / r4.w;
    r5.xy = -r13.xw + 1.0;
    r14.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r17.xy = r5.xx * ModShadowGroupColor.xy;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yzw = -r17.zyx + 1.0;
    r4.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r4.zw = r4.xy * abs(r7.xy);
    r15.x = ps;
    r4.xy = r15.yz * r14.zz + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_5, r3.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r17.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r10.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r18.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.w = dot(r1.zxy, r1.zxy);
    r4.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r6.x = r8.w * r6.x - 1.0;
    ps = rsqrt(abs(r0.w));
    r10.xyz = r10.xyz * r2.www;
    r0.w = ps;
    ps = 1.0 - r5.x;
    r18.xyz = r18.xyz * r11.xyz;
    r5.x = saturate(ps);
    r2.xyz = r7.xyz * 2.0 - 1.0;
    r11.xyz = r3.xyw * 2.0 - 1.0;
    r12.w = r2.z * UniformVector_4.z - r11.z;
    ps = log2(r5.x);
    r3.xyz = r0.www * r1.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r18.xyz * r17.xyz;
    r0.w = ps;
    r12.xy = r16.zw + r12.xy;
    r1.w = max(r13.w, 0.0);
    ps = (-1.0) + r5.w;
    r13.x = min(r1.w, 0.3);
    r13.w = ps;
    ps = 2.5 * r5.y;
    r13.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r1.w = ps;
    r5 = r13 * r6.xwzy + float4(1.0, 0.125, 0.125, 1.0);
    r2.yz = r15.xx * r14.xy + r2.xy;
    ps = abs(r5.x) * abs(r5.x);
    r2.w = r5.y * r5.z;
    r2.x = ps;
    r0.xyz = r2.www * r0.xyz + ModShadowColor.xyz;
    ps = r2.x * r2.x;
    r1.xyz = r1.xyz * r5.www;
    r2.x = ps;
    r2.yz = r2.yz * UniformVector_4.xy - r11.xy;
    r2.yz = r13.xx * r12.xy + r2.yz;
    r2.w = saturate(r1.w * r5.x - 0.5);
    r12.xyz = r1.xyz * r5.xxx - r8.xyz;
    r5.z = r12.w * r2.w - 2.0;
    r8.xyz = r12.xyz * r2.www + r8.xyz;
    r1.xyw = r2.yzx * r2.wwx;
    r5.xy = r11.xy + r1.xy;
    r5.z = r3.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r6.yyy;
    ps = 1.0 + r5.x;
    r1.xyz = r10.xzy * r0.www;
    r5.w = ps;
    r5.xyz = (r6.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r6.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r5.yzw = r1.www * r4.xyz;
    r5.x = ps;
    r4.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xyz * r5.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r3.zxy, r6.zxy));
    ps = log2(r5.x);
    r2.xyz = r5.yzw * r2.www;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.xyz = r8.xyz * r7.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r1.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
