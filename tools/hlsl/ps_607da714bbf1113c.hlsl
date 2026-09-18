// ps_607da714bbf1113c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r5.xz = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r6.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r5.xz).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    ps = r4.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r12.xyw = -UniformVector_0.xyz + 1.0;
    r12.z = saturate(ps);
    ps = UniformVector_3.x;
    r5.z = float((UniformScalar_3.x >= 1.0));
    ps = 2e+01 * ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r15.x = ps;
    ps = UniformVector_3.y;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r0.x = float((UniformScalar_3.x > 1.0));
    r15.y = ps;
    ps = UniformVector_3.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r5.y = r1.z + 0.1;
    r15.z = ps;
    ps = 5.0 * r5.y;
    r14.xyz = r13.xyz * r13.www;
    r9.x = saturate(ps);
    ps = 1.0 - r5.x;
    r13.xy = r11.yz * UniformScalar_4.xx;
    r5.y = saturate(ps);
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.zxy * UniformVector_2.zxy;
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r6.www * r1.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r10.xyz = r5.www * r3.xyz;
    r5.x = ps;
    r0.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r0.yxz;
    ps = log2(r5.y);
    r3.xyz = r5.xxx * -SpotDirection.xyz;
    r5.y = ps;
    ps = r13.x;
    r5.xzw = r15.xzy * r14.xzy;
    r1.xyz = r0.yxz * r11.xyz + r5.xwz;
    ps = r0.x * ps;
    r6.w = dot(r5.zxw, float3(0.11, 0.3, 0.59));
    r11.y = ps;
    ps = r13.y;
    r5.w = dot(r3.zxy, r2.zxy);
    ps = r0.z * ps;
    r6.w = r6.w - r5.x;
    r11.z = ps;
    ps = 1.0 - r6.x;
    r9.w = saturate(r6.w + r5.x);
    r5.x = ps;
    ps = r5.x;
    r1.xyz = r1.xyz * r12.xyw;
    ps = r9.w * ps;
    r5.xz = -r9.wx + 1.0;
    r2.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r2.xy = -r6.yz * r9.ww;
    r12.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.xyz = r6.xyz + r2.zxy;
    r12.y = ps;
    ps = (-1.0) - -r6.x;
    r3.xyz = -r12.xyz + 1.0;
    r6.w = ps;
    ps = UniformScalar_4.x * r0.y;
    r6.xyw = r6.yzw * r3.zzz;
    r0.x = ps;
    ps = r0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r3.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r3.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r11.x * ps;
    r6.w = dot(r0.zxy, r0.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r11.xyz + UniformScalar_5.xxx;
    r6.w = ps;
    r2.xyz = r0.xyz * r6.www;
    r6.w = dot(r2.zxy, r10.zxy);
    r0.xyz = r2.xyz * r6.www;
    r0.xyz = r0.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r6.w = saturate(dot(r4.zxy, r0.zxy));
    r5.y = ps;
    ps = log2(r6.w);
    r6.xyz = r6.xyz * r5.xxx;
    r9.x = ps;
    ps = -SpotAngles.x - -r5.w;
    r0.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r5.x = ps;
    r0.yz = r0.yz * r3.xy + 0.125;
    ps = pow(2.0, r0.x);
    r5.z = saturate(dot(r2.zyx, r4.zyx));
    r5.w = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.zxy * r5.www;
    r0.x = saturate(ps);
    r6.yz = r1.xy * r5.zz + r6.yz;
    r6.w = r1.z * r5.z + r6.x;
    ps = pow(2.0, r5.y);
    r5.xw = r0.yx * r0.zx;
    r6.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
