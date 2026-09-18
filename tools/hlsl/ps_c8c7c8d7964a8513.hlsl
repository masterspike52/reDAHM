// ps_c8c7c8d7964a8513.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r0.xy * UniformScalar_0.xx;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.xy = r6.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = r10.x;
    r8.xy = r0.wz * UniformVector_2.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r1.z + 0.1;
    r6.z = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r6.zw * abs(r7.xy);
    r5.y = ps;
    ps = 0.0001 * r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r8.z = saturate(ps);
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r11.xyz = tex2D(Texture2D_3, r8.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_1, r5.zw).wxy;
    ps = UniformVector_1.x * UniformVector_1.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r6.w = float((UniformScalar_4.x >= 1.0));
    r7.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r0.w = dot(r3.zxy, r3.zxy);
    r7.z = ps;
    ps = -UniformVector_0.x;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r0.x = float((UniformScalar_4.x > 1.0));
    r10.x = ps;
    r9.zw = r5.zw * 2.0 - 1.0;
    ps = (-1.0) + r5.y;
    r5.z = dot(r2.zxy, r2.zxy);
    r12.x = ps;
    ps = 1.0 - r5.z;
    r12.yzw = r8.wxy + float3(-2.0, 0.0, 0.0);
    r5.w = saturate(ps);
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r11.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r10.yzw = r7.xyz * r10.yzw;
    r5.y = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = 5.0 * r5.x;
    r11.xyz = r5.yyy * r3.xyz;
    r5.y = saturate(ps);
    r0.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = log2(r5.w);
    r12.yzw = r12.zwy + r8.xyw;
    r5.x = ps;
    ps = 1.0 - r5.y;
    r1.xy = r12.yz - 1.0;
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r8.xy = r5.yy * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = r10.y;
    r5.yzw = r5.yyy * -SpotDirection.xyz;
    ps = r0.x * ps;
    r5.y = dot(r5.wyz, r2.zxy);
    r0.x = ps;
    ps = r10.z;
    r8.yzw = -r8.zxy + 1.0;
    r1.zw = r12.wx * r8.yy + 1.0;
    ps = r0.y * ps;
    r8.x = r8.y * UniformScalar_1.x;
    r0.y = ps;
    r5.zw = r8.xx * r9.zw + r1.xy;
    ps = r10.w;
    r1.xy = r5.zw * r8.yy;
    r1 = (r8.xyyy > 0.0) ? r1.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r2 = (r8.xyyy >= 0.0) ? r1 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r0.z * ps;
    r5.z = dot(r2.wyz, r2.wyz);
    r0.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r1.yzw = r0.xyz * r2.xxx;
    r5.y = ps;
    r0.xyz = r1.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r5.z));
    r1.x = saturate(r5.y * SpotAngles.y);
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r2.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r11.zxy);
    r10.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r3.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r7.zxy, r5.wyz));
    r10.z = ps;
    ps = log2(r5.y);
    r2.xyz = r1.yzw * r10.xyz;
    r9.z = ps;
    r5.yzw = r9.zxy * float3(15.0, 0.875, 0.875);
    r1.yz = r5.zw * r8.zw + 0.125;
    ps = pow(2.0, r5.y);
    r5.z = saturate(dot(r3.zyx, r7.zyx));
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r0.xyz * r5.yyy;
    r5.y = ps;
    r0.xy = r2.xy * r5.zz + r0.xy;
    r0.z = r2.z * r5.z + r0.z;
    ps = pow(2.0, r5.y);
    r5.xw = r1.yx * r1.zx;
    r6.w = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r6.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
