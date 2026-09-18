// ps_3e7db0bc161ba49b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_7 : register(c4); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.xyw = tex2D(Texture2D_3, r0.xy).yzx;
    r1.w = tex2D(Texture2D_1, r0.xy).x;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = UniformScalar_9.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = ps;
    ps = 0.0001;
    r3.w = dot(r1.zxy, r1.zxy);
    r0.w = ps;
    ps = r1.z;
    r4.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r10.xy = r8.xy * 0.875;
    r2.y = saturate(ps);
    r9.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.w));
    r1.w = -r1.w + 1.0;
    r0.x = ps;
    ps = rsqrt(abs(r3.w));
    r8.xyz = r0.xxx * r3.xyz;
    r0.x = ps;
    ps = 5.0 * r0.z;
    r7.xyz = r0.xxx * r1.xyz;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r1.xyz = r1.www * r5.wxy;
    r2.x = ps;
    ps = log2(r2.y);
    r0.z = dot(r9.zxy, r9.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r2.yzw = r1.xyz * r11.xyz;
    r0.z = ps;
    r3.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    r5.yz = r10.xy * r3.xy + 0.125;
    ps = max(r0.y, r0.w);
    r3.xzw = r9.xyz * r0.zzz;
    r5.x = ps;
    ps = r1.w;
    r2.x = saturate(dot(r3.wxz, r7.zxy));
    r0.y = ps;
    ps = UniformScalar_7.x * r0.y;
    r0.z = dot(r3.wxz, r8.zxy);
    r3.y = ps;
    ps = UniformScalar_7.x * r1.y;
    r0.yzw = r3.xwz * r0.zzz;
    r3.z = ps;
    r0.yzw = r0.yzw * 2.0 - r8.xzy;
    ps = UniformScalar_7.x * r1.z;
    r0.y = saturate(dot(r7.zxy, r0.zyw));
    r3.w = ps;
    ps = log2(r0.y);
    r3.x = r3.y * r5.w;
    r5.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xy = r5.xy * r5.wz;
    r0.w = ps;
    r0.xyz = r1.yyy * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r1.yzw = r3.xwz + UniformScalar_8.xxx;
    r1.x = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r1.ywz * r1.xxx;
    r0.w = ps;
    r1.xy = r2.yz * r2.xx + r1.xy;
    r1.z = r2.w * r2.x + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
