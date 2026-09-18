// ps_08c6e794d5074d8e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040D00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * 0.5;
    r7.xy = tex2D(Texture2D_0, r5.xy).xy;
    r5.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r9 = tex2D(Texture2D_2, r0.xy);
    ps = 0.1 - -r1.z;
    r7.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = float((r9.w >= 0.5));
    r6.z = ps;
    r5.xyz = r5.yzw * 2.0 - 1.0;
    r7.xy = r7.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xy = r7.xy * 0.012;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r0.xy = r6.zw * abs(r8.xy);
    r6.z = ps;
    r13.xy = r5.xy * UniformVector_2.xy - r12.xy;
    r7.xy = r13.zw * r6.zz + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.w = dot(r2.zxy, r2.zxy);
    ps = r4.w;
    r10.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = 0.0001 * ps;
    r9.yzw = r10.zxy * r9.zxy;
    r11.x = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r5.x = saturate(-r5.w + 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r6.www * r1.xyz;
    r5.y = ps;
    r9.x = r5.z * UniformVector_2.z - 1.0;
    ps = log2(r5.x);
    r1.xyz = r5.yyy * -SpotDirection.xyz;
    r5.x = ps;
    ps = UniformScalar_1.x * r6.y;
    r5.zw = -r6.xy + 1.0;
    r6.w = ps;
    ps = rsqrt(abs(r7.w));
    r5.y = dot(r1.zxy, r2.zxy);
    r7.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r10.xyz = r7.www * r3.xyz;
    r11.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r9 = r9.zwxy * r6.yyyy;
    r11.z = ps;
    r1.xyz = r5.www * UniformVector_3.xyz + r6.www;
    r3.xyz = r9.xyw * UniformScalar_2.xxx + r1.xyz;
    r5.zw = r13.xy * r6.yy + r12.xy;
    ps = -UniformVector_0.x;
    r1.xyz = -r11.xyz + 1.0;
    ps = 1.0 + ps;
    r6.xy = r5.zw * r1.xx;
    r2.x = ps;
    r6.z = r9.z * r1.x + 1.0;
    r6.xyz = (r1.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r1.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = -SpotAngles.x - -r5.y;
    r5.z = dot(r6.zxy, r6.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r1.x = saturate(r5.y * SpotAngles.y);
    r5.y = ps;
    ps = -UniformVector_0.y;
    r6.xyz = r6.xyz * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r6.zxy, r10.zxy);
    r2.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r6.xzy * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r10.xzy;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r4.zxy, r5.zyw));
    r2.z = ps;
    ps = log2(r5.y);
    r2.xyz = r9.xyw * r2.xyz;
    r8.x = ps;
    r5.yzw = r8.xyz * float3(15.0, 0.875, 0.875);
    r1.yz = r5.zw * r1.yz + 0.125;
    ps = pow(2.0, r5.y);
    r5.z = saturate(dot(r6.zxy, r4.zxy));
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xyz = r3.zxy * r5.yyy;
    r5.y = ps;
    r6.yz = r2.xy * r5.zz + r6.yz;
    r6.w = r2.z * r5.z + r6.x;
    ps = pow(2.0, r5.y);
    r5.xw = r1.yx * r1.zx;
    r6.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
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
