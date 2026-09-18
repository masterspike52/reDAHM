// ps_cc328faf3664b6ef.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 303 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004BC 10041100 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r10.x = ps;
    r9.xy = r0.xy * UniformScalar_0.xx;
    r9.zw = r0.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r10.y = ps;
    ps = r1.z;
    r11.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r6.zw = r6.yz * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r5.w = r13.w - 0.5;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r6.xxx * r3.xyz;
    r6.y = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.x = saturate(ps);
    ps = (-0.025) * r6.x;
    r12.x = r0.w * UniformVector_2.x;
    r5.x = ps;
    ps = UniformVector_2.y * r5.z;
    r12.zw = r8.xy * r5.xx;
    r12.y = ps;
    r5.xy = r12.xy - 0.5;
    r14.xy = float2((r12.xy >= 0.5));
    ps = r10.x;
    r5.xy = r5.xy - r12.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r5.xy * r14.xy;
    r3.z = ps;
    ps = r10.y;
    r5 = r12.zwxy + r11;
    ps = abs(r7.y) * ps;
    r3.xy = r5.zw + r5.zw;
    r3.w = ps;
    r10.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r14.zw = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r16 = tex2D(Texture2D_1, r3.xy);
    r3.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_2, r9.zw).xyw;
    r7.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    r5.yzw = tex2D(Texture2D_3, r9.xy).xyw;
    r0.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = r4.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r6.w = dot(r1.zxy, r1.zxy);
    r7.y = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r0.yzw = r0.xyz * r2.www;
    r4.y = ps;
    r7.x = r15.z * r7.x - 1.0;
    ps = 1.0 - r5.x;
    r15.xy = r15.xy + r15.xy;
    r5.x = saturate(ps);
    r2.xyz = r11.xyz * 2.0 - 1.0;
    r11.xyz = r3.xyw * 2.0 - 1.0;
    r12.w = r2.z * UniformVector_4.z - r11.z;
    ps = log2(r5.x);
    r15.zw = r5.yz + r5.yz;
    r5.y = ps;
    ps = r7.z + r7.z;
    r15 = r15 - 1.0;
    r17.y = ps;
    ps = r7.w + r7.w;
    r17.x = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r17.z = ps;
    r5.x = (r17.x == 0.0) ? r16.x : r16.y;
    ps = UniformVector_5.z * UniformVector_5.w;
    r17 = r17.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r4.z = ps;
    r2.zw = r15.xy * 0.5 + r17.zw;
    r5.x = (r17.y == 0.0) ? r16.z : r5.x;
    r6.z = (r17.x == 0.0) ? r16.w : r5.x;
    ps = (-1.0) + r5.w;
    r0.x = max(r6.z, 0.0);
    r14.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.xz = -r6.zy + 1.0;
    r6.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r14.y = min(r0.x, 0.3);
    r7.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r14.yzw = r14.yzw * float3(3.3333333, 0.875, 0.875);
    r7.w = ps;
    ps = 2.5 * r5.x;
    r7.yzw = -r7.wzy + 1.0;
    r13.w = ps;
    ps = rsqrt(abs(r6.w));
    r5.x = r7.w * UniformScalar_1.x;
    r6.x = ps;
    r2.xy = r5.xx * r15.zw + r2.xy;
    r5 = r14 * r7.wxzy + float4(1.0, 1.0, 0.125, 0.125);
    ps = abs(r5.y) * abs(r5.y);
    r4.xyz = r4.xyz * r13.xyz;
    r6.w = ps;
    r2.xy = r2.xy * UniformVector_4.xy - r11.xy;
    ps = r5.z * r5.w;
    r3.xyz = r6.xxx * r1.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r13.xyz = r4.xyz * r5.xxx;
    r0.x = ps;
    r6.xyz = r6.xxx * r12.xyz + ModShadowColor.xyz;
    r4.xyz = r13.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r2.yz = r14.yy * r2.zw + r2.xy;
    ps = r6.w * r6.w;
    r0.xyz = r0.ywz * r0.xxx;
    r2.x = ps;
    r2.w = saturate(r13.w * r5.y - 0.5);
    r12.xyz = r13.xyz * r5.yyy - r10.xyz;
    r5.z = r12.w * r2.w - 2.0;
    r10.xyz = r12.xyz * r2.www + r10.xyz;
    r1.xyw = r2.yzx * r2.wwx;
    r5.xy = r11.xy + r1.xy;
    r5.z = r3.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r7.www;
    ps = 1.0 + r5.x;
    r1.xyz = r10.xyz * r9.xyz;
    r5.w = ps;
    r5.xyz = (r7.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r7.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r4.xyz = r1.www * r4.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r2.xyz = r4.xyz * r2.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
