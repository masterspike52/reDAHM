// ps_0aaf9c5fbe4935c9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 213 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000354 10040D00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
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

    r2 = tex2D(Texture2D_4, r0.xy).wxyz;
    r8.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r6.xy = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r5.y = UniformScalar_1.x * UniformVector_2.x;
    r8.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = UniformVector_2.x * UniformScalar_4.x;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r8.xz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xw = r8.xz * r5.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = r2.x - 0.5;
    r6.w = ps;
    ps = UniformVector_4.x * r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r8.x = ps;
    ps = UniformVector_4.x * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r8.z = ps;
    r7 = r8 + r0.xyxy;
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r13 = tex2D(Texture2D_1, r7.xy);
    r7 = tex2D(Texture2D_2, r7.zw);
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.yzw = tex2D(Texture2D_3, r6.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.xw).zxy;
    r8.xyz = UniformVector_3.xyz * 2e+01;
    r5.w = float((UniformScalar_8.x >= 1.0));
    r6.w = dot(r3.zxy, r3.zxy);
    ps = r4.w;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r5.x = r1.z + 0.1;
    r0.x = saturate(ps);
    ps = 5.0 * r5.x;
    r5.z = float((UniformScalar_8.x > 1.0));
    r2.x = saturate(ps);
    r4.xyz = (-abs(r5.zzz) >= 0.0) ? r0.yzw : 1.0;
    ps = rsqrt(abs(r5.y));
    r11.xyz = r2.yzw * UniformScalar_9.xxx;
    r0.z = ps;
    r5.xyz = r10.zxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r5.y;
    r12.xyz = r7.xyz * r7.www;
    r0.y = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r0.zzz * r1.xyz;
    r6.w = ps;
    ps = UniformVector_2.y * r5.z;
    r10.xyz = r6.www * r3.xyz;
    r0.z = ps;
    r1.xyz = r13.xyz * r13.www + r12.xyz;
    r4.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r4.xyz;
    r3.xyz = r11.xyz * r4.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.z * r5.x;
    r1.xyz = r8.xyz * r1.xyz;
    r0.w = ps;
    r8.xyz = r4.xyz * r2.yzw + r1.xyz;
    ps = r0.w;
    r5.y = dot(r1.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.y = r5.y - r1.x;
    r5.z = ps;
    ps = 1.0 - r0.x;
    r2.y = saturate(r5.y + r1.x);
    r6.w = ps;
    ps = r5.z;
    r5.xy = -r0.yz * r2.yy;
    ps = r2.y * ps;
    r1.xw = -r2.xy + 1.0;
    r5.z = ps;
    r4.xy = -r1.xx * ModShadowGroupColor.xy + 1.0;
    r5.xyz = r0.wyz + r5.zxy;
    ps = (-1.0) - -r5.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = r5.wyz * r6.www;
    ps = 1.0 + r5.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r6.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r8.xyz * r0.xyz;
    r5.x = ps;
    r8.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r8.zxy, r10.zxy);
    ps = LightColor.x * r6.y;
    r5.xyz = r8.xyz * r5.xxx;
    r0.x = ps;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    ps = LightColor.z * r6.x;
    r5.x = saturate(dot(r7.zxy, r5.zxy));
    r0.y = ps;
    ps = log2(r5.x);
    r3.xyz = r3.xyz * r1.www;
    r9.x = ps;
    ps = LightColor.y * r6.z;
    r5.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    r0.z = ps;
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r8.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r4.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r3.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
