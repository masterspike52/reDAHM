// ps_0bc20587b78bd81a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10040D00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
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
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    r1.zw = r1.zw * abs(r6.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r3.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.zw = r0.xy + 0.5;
    r1.zw = r0.xy * UniformVector_3.xy;
    r0.z = dot(r2.zxy, r2.zxy);
    r8.xyz = r3.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r2.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    r10.xyz = r0.zzz * r2.xyz;
    ps = rsqrt(abs(r2.w));
    r0.z = dot(r8.zxy, r8.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r0.z));
    r3.xyw = r6.xxx * r4.xyz;
    r0.z = ps;
    r11.xyz = r8.xyz * r0.zzz;
    r0.z = dot(r11.zxy, r3.wxy);
    ps = -r1.y;
    r8.xyz = r11.xzy * r0.zzz;
    r8.xyz = r8.xyz * 2.0 - r3.xwy;
    ps = 1.0 + ps;
    r0.z = saturate(dot(r10.zxy, r8.yxz));
    r2.w = ps;
    ps = log2(r0.z);
    r8.x = r2.w * UniformVector_2.y;
    r6.y = ps;
    ps = r1.x;
    r6 = r6.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    ps = UniformVector_2.x * ps;
    r8.zw = r6.zz * r4.xy;
    r8.y = ps;
    r4 = r8.zwyx + float4(0.5, 0.5, -0.5, -0.5);
    ps = r9.z;
    r9.xy = float2((r8.xy >= 0.5));
    ps = r8.z + ps;
    r4.xy = r4.xy + r0.xy;
    r1.x = ps;
    ps = r9.w;
    r4.zw = r4.zw - r8.yx;
    r4.zw = r4.zw * r9.yx + r8.yx;
    ps = r8.w + ps;
    r4.zw = r4.zw + r4.zw;
    r1.y = ps;
    r1.w = tex2D(Texture2D_3, r1.zw).x;
    r8 = tex2D(Texture2D_2, r4.zw);
    r1.z = tex2D(Texture2D_1, r4.xy).w;
    r4 = tex2D(Texture2D_1, r0.xy);
    r13.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    ps = 1.0 / r5.w;
    r0.x = r2.z + 0.1;
    r0.z = ps;
    ps = 1.0 - r0.w;
    r12.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r0.y = saturate(ps);
    ps = ScreenPositionScaleBias.x * r0.z;
    r2.xzw = -UniformVector_0.xyz + 1.0;
    r1.x = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r3.xyz = r13.xyz * 0.15;
    r1.y = ps;
    r1.xy = r1.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.yzw = r12.xyz * r4.xyz - r3.xyz;
    ps = log2(r0.y);
    r5.x = -r1.z + 1.0;
    r0.z = ps;
    r2.y = max(r3.w, 0.0);
    r0.w = r5.x * r4.w + r1.z;
    r3.xyz = r5.yzw * r4.www + r3.xyz;
    ps = 5.0 * r0.x;
    r4.xyz = r3.xyz * r2.xzw;
    r2.x = saturate(ps);
    r3.xyz = r3.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r2.xy = -r2.xy + 1.0;
    ps = log2(abs(r2.y));
    r0.x = saturate(dot(r11.zxy, r10.zxy));
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r1.z = dot(r9.yxx, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.yz = r2.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = pow(2.0, r6.w);
    r4.w = -r0.y + 1.0;
    r2.x = ps;
    r3.xyz = r3.xyz * r2.xxx;
    r3.xy = r4.xy * r0.xx + r3.xy;
    r3.z = r4.z * r0.x + r3.z;
    r0.x = (r1.z == 0.0) ? r8.x : r8.y;
    r4.xyz = r1.zzw + float3(-3.0, -2.0, 1.0);
    r4.z = r4.z - r0.y;
    r0.x = (r4.y == 0.0) ? r8.z : r0.x;
    r2.x = (r4.x == 0.0) ? r8.w : r0.x;
    r2.yzw = -r2.xyz + 1.0;
    r4.xy = r6.xy * r2.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r0.z;
    r0.xy = r4.xz * r4.yw;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r3.w = r0.y * r0.w;
    r2.x = ps;
    r2 = r3 * r2.xxxy;
    ps = (-0.5) - -r2.w;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r1.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r1.xyz = r2.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
