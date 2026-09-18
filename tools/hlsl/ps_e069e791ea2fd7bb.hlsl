// ps_e069e791ea2fd7bb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040E00 0000080A 00000000 00007908 003F00FF 00000001 0000F050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r0.xy * UniformScalar_0.xx;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = UniformScalar_1.x * 4.0;
    r9.w = ps;
    ps = 1.0 / r5.w;
    r9.xy = r5.xy * ScreenPositionScaleBias.xy;
    r7.z = ps;
    r9.xy = r9.xy * r7.zz + ScreenPositionScaleBias.wz;
    ps = r6.z;
    r7.zw = r0.wz * UniformScalar_4.xx;
    ps = r1.x * ps;
    r8.xy = r9.zw * abs(r8.xy);
    r6.z = ps;
    ps = UniformScalar_1.x * r1.y;
    r6.xy = r0.xy * UniformScalar_2.xx;
    r6.w = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r11.xyz = tex2D(Texture2D_6, r7.zw).xyz;
    r0.w = tex2D(Texture2D_2, r1.xy).x;
    r13.xyz = tex2D(Texture2D_4, r7.xy).xyz;
    r14.xyz = tex2D(Texture2D_5, r6.zw).xyz;
    r8.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r6.zw).xyz;
    r7.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    ps = r5.w;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r10.x = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r6.w = dot(r4.zxy, r4.zxy);
    r10.y = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r6.z = dot(r2.zxy, r2.zxy);
    r10.z = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r6.y = dot(r3.zxy, r3.zxy);
    r10.w = ps;
    r9.xw = r7.yz * 2.0 - 1.0;
    r12.xyz = r12.xyz * 2.0 - 1.0;
    r3.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r7.yzw = -r13.xyz + r14.xyz;
    r6.z = ps;
    ps = 5.0 * r6.x;
    r5.xyz = r6.zzz * r2.xyz;
    r6.x = saturate(ps);
    r7.yzw = r7.yzw * r0.www + r13.xyz;
    ps = 1.0 - r6.x;
    r2.xyz = r12.xyz - r3.xyz;
    r6.z = ps;
    r8.xy = r2.xy * r0.ww + r3.xy;
    r6.x = r2.z * r0.w - 2.0;
    ps = ModShadowGroupColor.x * r6.z;
    r7.yzw = r10.yzw * r7.yzw;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r3.xyz = r7.yzw * r11.xyz;
    r10.z = ps;
    r6.z = r8.z * 2.0 + r6.x;
    ps = (-1.0) + r7.x;
    r7.yzw = -r10.xyz + 1.0;
    r6.x = ps;
    r8.zw = r6.zx * r7.yy + 1.0;
    ps = UniformScalar_3.x * r7.y;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    r6.xz = r7.xx * r9.xw + r8.xy;
    r8.xy = r6.xz * r7.yy;
    r8 = (r7.xyyy > 0.0) ? r8.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r10 = (r7.xyyy >= 0.0) ? r8 : float4(1.0, 0.0, 0.0, 1.0);
    r0.w = dot(r10.wyz, r10.wyz);
    ps = rsqrt(abs(r6.w));
    r8.xyz = r3.xyz * r10.xxx;
    r6.x = ps;
    r3.xyz = r8.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.w));
    r6.xzw = r6.xxx * r4.xyz;
    r0.w = ps;
    r4.xyz = r10.yzw * r0.www;
    r0.w = dot(r4.zxy, r6.wxz);
    ps = 1.0 - r6.y;
    r10.xyz = r4.xyz * r0.www;
    r6.y = saturate(ps);
    r6.xzw = r10.xyz * 2.0 - r6.xzw;
    ps = log2(r6.y);
    r6.x = saturate(dot(r5.zxy, r6.wxz));
    r6.y = ps;
    ps = log2(r6.x);
    r6.y = r6.y * LightColorAndFalloffExponent.w;
    r9.x = ps;
    r6.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r6.z);
    r1.xyz = r8.xyz * r1.xyz;
    r6.z = ps;
    r6.xw = r6.xw * r7.zw + 0.125;
    ps = r6.x * r6.w;
    r7.w = saturate(dot(r4.zyx, r5.zyx));
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r7.xyz = r3.xyz * r6.zzz;
    r6.w = ps;
    r6.xyz = r6.xxx * r2.xyz + ModShadowColor.xyz;
    r7.xy = r1.xy * r7.ww + r7.xy;
    r7.z = r1.z * r7.w + r7.z;
    r7.xyz = r7.xyz * r6.www;
    r7.xyz = r7.xyz * r0.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
