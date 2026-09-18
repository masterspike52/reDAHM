// ps_8b402a2a42e872be.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040F00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyw;
    r6.xy = r0.wz * 0.5;
    r6.zw = r0.wz * UniformVector_5.xy;
    r11.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    r10.yz = r5.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.x = saturate(r5.w * 5.0);
    r7.x = saturate(ps);
    ps = 1.0 / r4.w;
    r5.x = -r5.x + 1.0;
    r10.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.yz = r5.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = -r7.yxz + 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r7.y;
    r5.xy = r5.xy * abs(r8.xy);
    r11.x = ps;
    r4.xy = r11.yz * r10.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_5, r6.zw).xyz;
    r14 = tex2D(Texture2D_3, r0.xy);
    r6.yz = tex2D(Texture2D_0, r6.xy).xy;
    r5.xw = tex2D(ModShadowAccumTexture, r5.xy).yx;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = float((UniformScalar_5.x >= 1.0));
    r0.w = dot(r3.zxy, r3.zxy);
    ps = (-1.0) + r5.z;
    r5.y = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    ps = 1.0 - r5.y;
    r5.z = dot(r1.zxy, r1.zxy);
    r6.x = saturate(ps);
    ps = 0.875 * r5.x;
    r0.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r13.y = ps;
    ps = r6.y + r6.y;
    r5.x = float((UniformScalar_5.x > 1.0));
    r6.y = ps;
    ps = r6.z + r6.z;
    r14.xyz = r0.xyz * r14.xyz;
    r6.z = ps;
    r2.xyz = (-abs(r5.xxx) >= 0.0) ? r15.xyz : 1.0;
    ps = rsqrt(abs(r5.z));
    r6.w = float((r14.w >= 0.5));
    r5.x = ps;
    r0.xyz = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    r9.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r2.xyz;
    ps = 1.0 - r6.w;
    r2.xyz = r5.xxx * r3.xyz;
    r5.z = ps;
    ps = log2(r6.x);
    r5.y = r6.w * UniformScalar_6.x;
    r5.x = ps;
    r3.xyw = r5.zzz * UniformVector_3.zyx + r5.yyy;
    ps = UniformVector_2.z * r0.x;
    r9.xyz = r14.xyz * r9.xyz;
    r6.x = ps;
    ps = 0.875 * r5.w;
    r6.xyz = r6.yxz - 1.0;
    r13.w = ps;
    ps = 0.012 * r6.x;
    r13.z = r6.y * r6.w;
    r10.x = ps;
    r3.z = r13.z * r7.y + 1.0;
    r5.yzw = r13.xyw * r7.yzx + float3(1.0, 0.125, 0.125);
    r7.w = (r11.x > 0.0) ? r5.y : 1.0;
    r0.xy = r11.xx * r10.yz + r0.yz;
    ps = 0.012 * r6.z;
    r5.y = r5.w * r5.z;
    r10.y = ps;
    r5.yzw = r5.yyy * r12.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * UniformVector_2.xy - r10.xy;
    r6.z = (r11.x >= 0.0) ? r7.w : 1.0;
    r6.xzw = r6.wxy * r6.zww;
    r6.zw = r10.xy + r6.zw;
    r0.xyw = r9.xyz * r6.xxx;
    r0.z = r0.w * UniformScalar_7.x + r3.x;
    r6.xy = r0.xy * UniformScalar_7.xx + r3.wy;
    r3.xy = r6.zw * r7.yy;
    r3.xyz = (r7.yyy > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.yyy >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r6.z = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.z));
    r0.xy = r0.xy * r8.xy;
    r6.z = ps;
    r7.xyz = r7.xyz * r6.zzz;
    r6.z = dot(r7.zxy, r2.zxy);
    r3.xyz = r7.xyz * r6.zzz;
    r2.xyz = r3.xyz * 2.0 - r2.xyz;
    r6.w = saturate(dot(r1.zxy, r2.zxy));
    ps = log2(r6.w);
    r6.z = r0.w * r8.z;
    r6.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.w = r6.w * 15.0;
    r5.x = ps;
    ps = pow(2.0, r6.w);
    r7.y = saturate(dot(r7.zxy, r1.zxy));
    r7.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r6.xyz * r7.xxy;
    r5.x = ps;
    r6.xyz = r0.xyz * r7.yyx + r6.xyz;
    r6.xyz = r6.xyz * r5.xxx;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
