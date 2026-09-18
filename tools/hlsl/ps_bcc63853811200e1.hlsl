// ps_bcc63853811200e1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10040E00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / r4.w;
    r0.z = r1.z + 0.1;
    r1.w = ps;
    ps = 5.0 * r0.z;
    r0.w = dot(r3.zxy, r3.zxy);
    r5.z = saturate(ps);
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r7.xy = r1.ww * ScreenPositionScaleBias.xy;
    r1.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.z = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    r4.xy = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = r0.z;
    r3.xyz = r1.www * r3.xyz;
    ps = abs(r5.x) * ps;
    r1.w = dot(r6.zxy, r6.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r1.w));
    r5.x = saturate(dot(r3.zxy, r6.zxy));
    r1.w = ps;
    ps = r0.w;
    r11.xyz = r6.xyz * r1.www;
    ps = abs(r5.y) * ps;
    r0.z = dot(r11.zxy, r3.zxy);
    r10.y = ps;
    ps = 1.0 - r5.x;
    r6.xyz = r11.xzy * r0.zzz;
    r0.z = ps;
    r9.xyz = r6.xyz * 2.0 - r3.xzy;
    ps = 1.0 - r5.z;
    r3 = xe_cube(r9.xzy);
    r0.w = ps;
    ps = 1.0 / abs(r3.z);
    r12.z = r3.w;
    r1.w = ps;
    r12.xy = r3.yx * r1.ww + 1.5;
    r5.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r6.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r3.y = tex2D(Texture2D_9, r0.xy).x;
    r7.xyz = tex2D(Texture2D_1, r0.xy).yxz;
    r4.xyw = tex2D(Texture2D_2, r0.zz).yxz;
    r14.xyz = texCUBE(TextureCube_0, xe_cube_dir(r12.xyz)).xyz;
    r3.xzw = tex2D(Texture2D_8, r0.xy).yzx;
    r0.xz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    ps = 1.0 - r4.z;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = saturate(ps);
    ps = 0.875 * r0.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r10.x = ps;
    ps = 0.875 * r0.z;
    r3.xz = r14.zy * r3.zx;
    r10.y = ps;
    ps = 0.7 * r3.w;
    r0.xz = r7.xz * r4.xw;
    r0.y = ps;
    ps = 2e+01 * r4.y;
    r7.x = r0.y * r14.x;
    r0.y = ps;
    ps = rsqrt(abs(r4.z));
    r14.x = r0.y * r7.y;
    r0.y = ps;
    ps = rsqrt(abs(r5.w));
    r14.yz = r0.xz * 2e+01;
    r0.x = ps;
    ps = log2(r1.w);
    r4.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = 1e+01 * r3.y;
    r1.xyz = r0.yyy * -SpotDirection.xyz;
    r7.w = ps;
    ps = 0.65 * r3.z;
    r0.y = dot(r1.zxy, r2.zxy);
    r7.y = ps;
    ps = 0.5 * r3.x;
    r1.xyz = r14.xyz + r13.xyz;
    r7.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r2.xyw = r1.xyz * r12.xyz;
    r1.x = ps;
    ps = r7.w;
    r2.z = saturate(dot(r11.zxy, r4.zxy));
    r0.z = ps;
    r0.yw = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r1.yw = r10.xy * r0.yw + 0.125;
    ps = 0.0001;
    r1.z = saturate(dot(r4.zxy, r9.yxz));
    r0.w = ps;
    ps = max(r0.z, r0.w);
    r0.y = r1.y * r1.w;
    r1.y = ps;
    r0.yzw = r0.yyy * r8.xyz + ModShadowColor.xyz;
    ps = log2(r1.z);
    r1.x = saturate(r1.x * SpotAngles.y);
    r1.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xy = r1.xy * r1.xz;
    r0.x = ps;
    ps = pow(2.0, r1.y);
    r3.xyz = r7.xyz + r6.xyz;
    r1.z = ps;
    ps = pow(2.0, r0.x);
    r1.yzw = r3.xyz * r1.zzz;
    r0.x = ps;
    r2.xy = r2.xy * r2.zz + r1.yz;
    r2.z = r2.w * r2.z + r1.w;
    r2.xyz = r2.xyz * r0.xxx;
    r2.xyz = r2.xyz * r5.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r2.xzy * r1.xxx;
    r0.xyz = r1.xzy * r0.yzw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
