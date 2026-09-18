// ps_bc780c9eec25833c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040B00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_10 : register(c9); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_7 : register(c6); // float
float4 UniformScalar_8 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r11.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r8.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r6.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.y = tex2D(Texture2D_1, r0.xy).x;
    ps = r4.w;
    r9.x = float((UniformScalar_9.x >= 1.0));
    ps = 0.0001 * ps;
    r0.w = float((UniformScalar_9.x > 1.0));
    r9.y = saturate(ps);
    ps = r1.z;
    r7.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r6.x;
    r0.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r7.z = saturate(ps);
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = 5.0 * r5.x;
    r7.x = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r11.xyz = r0.xyz * r11.xyz;
    r1.w = ps;
    r4.xyz = r11.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = 1.0 - r5.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = UniformVector_2.x * r5.y;
    r0.xyz = r11.xyz * r0.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r7.w));
    r1.xyw = r1.www * r1.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r3.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = log2(r7.z);
    r11.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = UniformVector_2.y * r5.z;
    r1.z = dot(r11.zxy, r2.zxy);
    r7.z = ps;
    ps = UniformVector_2.z * r5.w;
    r9.zw = r7.xx * ModShadowGroupColor.xy;
    r7.x = ps;
    ps = (-1.0) - -r7.x;
    r5.yzw = -r9.yzw + 1.0;
    r7.w = ps;
    r7.xyz = r7.wyz * r5.yyy;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r5.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r5.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.x));
    r7.w = r1.z - SpotAngles.x;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r6.x = dot(r7.zxy, r3.zxy);
    r2.xyz = r7.xyz * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r3.xyz;
    ps = UniformScalar_8.x * r6.y;
    r6.x = saturate(dot(r1.wxy, r2.zxy));
    r1.z = ps;
    ps = log2(r6.x);
    r9.y = saturate(r7.w * SpotAngles.y);
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r7.z = saturate(dot(r7.zxy, r1.wxy));
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.xyz = r6.zwy * float3(0.875, 0.875, 15.0);
    r1.w = ps;
    r1.xy = r6.xy * r5.zw + 0.125;
    r6.xy = r1.xz * r1.yw;
    r5.yzw = r6.xxx * r10.xyz + ModShadowColor.xyz;
    r9.z = (r0.w > 0.0) ? 0.0 : r6.y;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xy = r9.xy * r9.zy;
    r5.x = ps;
    ps = pow(2.0, r6.z);
    r7.xyw = r4.xyz + r6.xxx;
    r6.z = ps;
    ps = pow(2.0, r5.x);
    r6.xzw = r7.xyw * r6.zzz;
    r5.x = ps;
    r7.xy = r0.xy * r7.zz + r6.xz;
    r7.z = r0.z * r7.z + r6.w;
    r7.xyz = r7.xyz * r5.xxx;
    r7.xyz = r7.xyz * r8.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.yyy;
    r5.xyz = r6.xzy * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
