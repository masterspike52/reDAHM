// ps_6a51b62ed1ae2585.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_6 : register(s4);
sampler2D Texture2D_7 : register(s5);
sampler2D Texture2D_8 : register(s6);
sampler2D Texture2D_9 : register(s7);
samplerCUBE TextureCube_0 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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

    r2.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r5.x = r1.z + 0.1;
    r5.y = ps;
    ps = 5.0 * r5.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.y = saturate(ps);
    r9.xyz = r2.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.yz = r5.yy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r2.zw = r5.yz * r4.xy + ScreenPositionScaleBias.wz;
    ps = r6.x;
    r5.xyz = r5.xxx * r3.xyz;
    ps = abs(r7.x) * ps;
    r5.w = dot(r9.zxy, r9.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.z = saturate(dot(r5.zxy, r9.zxy));
    r5.w = ps;
    ps = r6.w;
    r11.xyz = r9.xyz * r5.www;
    ps = abs(r7.y) * ps;
    r5.w = dot(r11.zxy, r5.zxy);
    r2.y = ps;
    ps = 1.0 - r6.y;
    r3.xyz = r11.xzy * r5.www;
    r6.w = ps;
    r7.xyz = r3.xyz * 2.0 - r5.xzy;
    ps = 1.0 - r6.z;
    r5 = xe_cube(r7.xzy);
    r6.z = ps;
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r6.x = ps;
    r3.xy = r5.yx * r6.xx + 1.5;
    r4.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r13.z = tex2D(Texture2D_9, r0.xy).x;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r13.xyw = tex2D(Texture2D_1, r0.xy).yzx;
    r5.xyz = tex2D(LightAttenuationTexture, r2.zw).zxy;
    r6.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r2.xyz = tex2D(Texture2D_2, r6.zz).yxz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).yxz;
    ps = 0.7 * r0.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    ps = 2e+01 * r2.y;
    r5.w = dot(r1.zxy, r1.zxy);
    r1.w = ps;
    ps = 0.875 * r6.x;
    r13.xy = r13.xy * r2.xz;
    r10.x = ps;
    ps = 0.875 * r6.y;
    r6.xz = r9.yz * r0.xz;
    r10.y = ps;
    ps = LightColor.x * r5.y;
    r2.x = r1.w * r13.w;
    r0.x = ps;
    ps = rsqrt(abs(r5.w));
    r0.y = r0.w * r9.x;
    r5.w = ps;
    ps = 0.65 * r6.x;
    r9.xyz = r5.www * r1.xyz;
    r0.z = ps;
    ps = 0.5 * r6.z;
    r2.yzw = r13.xyz * float3(2e+01, 2e+01, 1e+01);
    r0.w = ps;
    ps = r2.w;
    r1.xyz = r0.yzw + r12.xyz;
    r0.y = ps;
    ps = 0.0001;
    r5.w = saturate(dot(r11.zxy, r9.zxy));
    r0.z = ps;
    r6.xy = -r6.ww * ModShadowGroupColor.xy + 1.0;
    r6.yz = r10.xy * r6.xy + 0.125;
    ps = max(r0.y, r0.z);
    r6.w = saturate(dot(r9.zxy, r7.yxz));
    r6.x = ps;
    ps = log2(r6.w);
    r2.xyz = r2.xyz + r4.xyz;
    r6.w = ps;
    ps = LightColor.z * r5.x;
    r6.xw = r6.yx * r6.zw;
    r0.y = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r2.xyz = r2.xyz * r8.xyz;
    r6.w = ps;
    ps = LightColor.y * r5.z;
    r1.xyz = r1.xyz * r6.www;
    r0.z = ps;
    r5.y = r2.z * r5.w + r1.z;
    r5.xz = r2.xy * r5.ww + r1.xy;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
