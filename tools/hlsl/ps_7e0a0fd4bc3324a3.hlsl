// ps_7e0a0fd4bc3324a3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
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

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    r6.yz = r6.yz * abs(r8.xy);
    r7.zw = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r9.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r3.xy = r1.xy + 0.5;
    r8.xy = r1.xy * UniformVector_3.xy;
    ps = 1.0 / r5.w;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    r9.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r6.zw = r6.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r3.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = r6.yyy * r2.xyz;
    ps = rsqrt(abs(r6.x));
    r6.z = dot(r9.zxy, r9.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.xyw = r7.xxx * r4.xyz;
    r6.z = ps;
    r11.yzw = r9.xyz * r6.zzz;
    r6.z = dot(r11.wyz, r6.wxy);
    ps = -r1.z;
    r9.xyz = r11.ywz * r6.zzz;
    r9.xyz = r9.xyz * 2.0 - r6.xwy;
    ps = 1.0 + ps;
    r6.z = saturate(dot(r5.zxy, r9.yxz));
    r7.y = ps;
    ps = log2(r6.z);
    r10.x = r7.y * UniformVector_2.y;
    r7.y = ps;
    ps = r1.w;
    r7 = r7.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    ps = UniformVector_2.x * ps;
    r10.zw = r7.zz * r4.xy;
    r10.y = ps;
    r4 = r10.yxzw + float4(-0.5, -0.5, 0.5, 0.5);
    ps = r3.x;
    r9.xy = float2((r10.xy >= 0.5));
    ps = r10.z + ps;
    r0.zw = r4.zw + r1.xy;
    r3.x = ps;
    ps = r3.y;
    r4.xy = r4.xy - r10.yx;
    r4.xy = r4.xy * r9.yx + r10.yx;
    ps = r10.w + ps;
    r4.xy = r4.xy + r4.xy;
    r3.y = ps;
    r6.z = tex2D(Texture2D_3, r8.xy).x;
    r4 = tex2D(Texture2D_2, r4.xy);
    r10.xyz = tex2D(LightAttenuationTexture, r3.zw).xyz;
    r11.x = tex2D(ShadowTexture, r0.xy).x;
    r8 = tex2D(Texture2D_1, r1.xy);
    r1.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r6.y = tex2D(Texture2D_1, r0.zw).w;
    ps = r2.z;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r1.xyz * 0.15;
    r1.x = saturate(ps);
    r12.yzw = r12.xyz * r8.xyz - r2.xyz;
    ps = 1.0 - r6.y;
    r1.y = max(r6.w, 0.0);
    r12.x = ps;
    r6.x = r12.x * r8.w + r6.y;
    r8.xyz = r12.yzw * r8.www + r2.xyz;
    r2.xyz = r8.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r6.yw = -r1.yx + 1.0;
    ps = log2(abs(r6.y));
    r1.x = saturate(dot(r11.wyz, r5.zxy));
    r6.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r5.xy = r6.ww * ModShadowGroupColor.xy;
    r5.z = ps;
    ps = r8.x;
    r1.yzw = -r5.xyz + 1.0;
    r11.yz = r7.xy * r1.yz + 0.125;
    ps = r3.x * ps;
    r6.yw = r11.xy * r11.xz;
    r3.x = ps;
    r7.xyz = r6.www * r0.xyz + ModShadowColor.xyz;
    ps = r8.y;
    r0.xyz = r6.yyy * r10.xyz;
    ps = r3.y * ps;
    r6.w = dot(r9.yxx, float3(1.0, 1.0, 1.0));
    r3.y = ps;
    r0.w = (r6.w == 0.0) ? r4.x : r4.y;
    ps = r8.z;
    r6.yzw = r6.zww + float3(1.0, -3.0, -2.0);
    ps = r3.z * ps;
    r3.w = r6.y - r5.z;
    r3.z = ps;
    r6.y = (r6.w == 0.0) ? r4.z : r0.w;
    r6.y = (r6.z == 0.0) ? r4.w : r6.y;
    ps = 1.0 - r6.y;
    r1 = r3 * r1.xxxw;
    r6.w = ps;
    ps = pow(2.0, r7.w);
    r0.w = r1.w * r6.x;
    r6.z = ps;
    r6.xy = r2.xy * r6.zz + r1.xy;
    r6.z = r2.z * r6.z + r1.z;
    r6 = r0.wxyz * r6.wxyz;
    ps = r6.x;
    r6.yzw = r6.ywz * LightColor.xzy;
    r6.x = ps;
    ps = (-0.5) - -r6.x;
    r6.yzw = r6.ywz * r7.xyz;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    oC0.xyz = r6.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
