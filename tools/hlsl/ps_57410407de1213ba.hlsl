// ps_57410407de1213ba.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.zw = UniformVector_2.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = float((UniformScalar_1.x >= UniformScalar_0.x));
    r6.x = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r13.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r5.zw).xyz;
    r10.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r5.x = tex2D(Texture2D_3, r0.xy).x;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = dot(r1.zxy, r1.zxy);
    r6.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.w));
    r12.xy = r4.xy * 0.875;
    r0.w = ps;
    ps = rsqrt(abs(r6.y));
    r1.w = saturate(-r6.w + 1.0);
    r3.w = ps;
    ps = rsqrt(abs(r6.x));
    r6.w = saturate(r3.w * r1.z);
    r6.x = ps;
    r7.w = max(UniformScalar_9.x, 0.0001);
    r4.yzw = -UniformVector_0.xyz + 1.0;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r4.x = float((UniformScalar_1.x > UniformScalar_0.x));
    ps = 0.1 + ps;
    r11.xyz = r5.yzw * UniformVector_1.xyz;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r0.xyz = r10.xyz * r2.www;
    r9.w = ps;
    ps = 5.0 * r5.z;
    r9.xyz = r9.xyz * r5.xxx;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.yzw = r13.xyz * r7.xyz;
    r6.y = ps;
    r5.yzw = (-abs(r4.xxx) >= 0.0) ? r13.xyz : r5.yzw;
    ps = log2(r1.w);
    r10.xyz = r3.www * r1.zxy;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r6.xxx * r3.xyz;
    r6.x = ps;
    ps = -r1.x;
    r3.xyz = r0.www * -SpotDirection.xyz;
    r7.y = ps;
    r7.x = r1.z * 2.0 - r1.z;
    r5.xzw = (-abs(r6.zzz) >= 0.0) ? r13.xyz : r5.yzw;
    ps = -r1.y;
    r5.y = dot(r3.zxy, r2.zxy);
    r7.z = ps;
    r6.yz = -r6.yy * ModShadowGroupColor.xy + 1.0;
    r1.yz = r12.xy * r6.yz + 0.125;
    ps = -SpotAngles.x - -r5.y;
    r2.xyz = -r11.xyz + r5.xzw;
    r5.x = ps;
    r5.yzw = r2.zxy * UniformScalar_1.xxx + r11.zxy;
    r2.xyz = r5.zwy * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = SpotAngles.y * r5.x;
    r3 = r9 * r5.zwyy;
    r1.x = saturate(ps);
    ps = r3.z + r3.w;
    r5.y = saturate(dot(r10.yzx, r7.yzx));
    r7.z = ps;
    r7.xy = r9.ww * r5.zw + r3.xy;
    ps = log2(r5.y);
    r5.xw = r1.yx * r1.zx;
    r4.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r1 = r7.wxyz * r4;
    r6.x = ps;
    ps = pow(2.0, r1.x);
    r0.xyz = r0.xzy * r6.xxx;
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.yz * r6.ww + r6.xy;
    r6.z = r1.w * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
