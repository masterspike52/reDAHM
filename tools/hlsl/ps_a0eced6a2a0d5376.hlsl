// ps_a0eced6a2a0d5376.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r1.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r0.zw = r0.zw * abs(r5.xy);
    r1.w = ps;
    r5.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = r1.www * r3.xyz;
    r3 = xe_cube(r9.xyz);
    ps = 1.0 / abs(r3.z);
    r4.z = r3.w;
    r1.w = ps;
    r4.xy = r3.yx * r1.ww + 1.5;
    r3.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r6.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r5.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = r1.z;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r0.z = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = 0.875 * r0.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r10.x = ps;
    ps = 0.875 * r0.y;
    r4.xyz = r7.xyz * r4.xyz;
    r10.y = ps;
    ps = rsqrt(abs(r1.w));
    r0.y = saturate(-r0.z + 1.0);
    r3.w = ps;
    ps = 5.0 * r0.w;
    r1.w = dot(r11.zxy, r11.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r7.xyz = r3.www * r1.xyz;
    r0.z = ps;
    ps = log2(r0.y);
    r1.xyz = r0.zzz * -SpotDirection.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r1.w));
    r0.z = dot(r1.zxy, r2.zxy);
    r0.w = ps;
    ps = 1.0 - r0.x;
    r2.xyz = r0.www * r11.xyz;
    r0.x = ps;
    r0.xw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r1.yw = r10.xy * r0.xw + 0.125;
    r0.x = dot(r2.zxy, r9.zxy);
    ps = -SpotAngles.x - -r0.z;
    r10.xyz = r2.xzy * r0.xxx;
    r0.x = ps;
    r9.xyz = r10.xyz * 2.0 - r9.xzy;
    ps = SpotAngles.y * r0.x;
    r1.z = saturate(dot(r7.zxy, r9.yxz));
    r1.x = saturate(ps);
    r1.xy = r1.xy * r1.xw;
    r0.xzw = r1.yyy * r8.xyz + ModShadowColor.xyz;
    ps = log2(r1.z);
    r2.z = saturate(dot(r2.zxy, r7.zxy));
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r5 = r5.yzxw * float4(3e+01, 3e+01, 15.0, 3e+01);
    r0.y = ps;
    ps = pow(2.0, r5.z);
    r2.xyw = r5.xyw * r6.xyz;
    r1.z = ps;
    ps = pow(2.0, r0.y);
    r1.yzw = r2.xyw * r1.zzz;
    r0.y = ps;
    r2.xy = r4.xy * r2.zz + r1.yz;
    r2.z = r4.z * r2.z + r1.w;
    r2.xyz = r2.xyz * r0.yyy;
    r2.xyz = r2.xyz * r3.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r2.xzy * r1.xxx;
    r0.xyz = r1.xzy * r0.xzw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
