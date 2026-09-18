// ps_33e4c4cedcddc4d1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 UniformScalar_7 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
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
    r6.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = UniformScalar_7.x;
    r8.yzw = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = 0.0001;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = max(r0.x, r0.y);
    r0.z = r1.z + 0.1;
    r8.x = ps;
    ps = 5.0 * r0.z;
    r0.x = dot(r2.zxy, r2.zxy);
    r0.y = saturate(ps);
    ps = 1.0 - r0.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r0.w = saturate(ps);
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r10.xy = r10.xy * 0.875;
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r5.xyz = r8.yzw * r5.xyz;
    r1.w = ps;
    ps = rsqrt(abs(r0.x));
    r8.yzw = r0.zzz * r3.xyz;
    r0.x = ps;
    ps = r1.w;
    r11.xyz = r0.xxx * -SpotDirection.xyz;
    ps = r1.x * ps;
    r0.z = dot(r7.zxy, r7.zxy);
    r3.x = ps;
    ps = log2(r0.w);
    r0.y = -r0.y + 1.0;
    r0.x = ps;
    r3.yz = -r0.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.z));
    r0.y = dot(r11.zxy, r2.zxy);
    r0.z = ps;
    r2.xy = r10.xy * r3.yz + 0.125;
    ps = r1.w;
    r7.xyz = r7.xyz * r0.zzz;
    ps = r1.y * ps;
    r0.z = dot(r7.zxy, r8.wyz);
    r3.y = ps;
    ps = r1.w;
    r0.w = r2.x * r2.y;
    r2.xyz = r0.www * r9.xyz + ModShadowColor.xyz;
    ps = r1.z * ps;
    r9.xyz = r7.xzy * r0.zzz;
    r3.z = ps;
    r1.xyz = r9.xyz * 2.0 - r8.ywz;
    ps = -SpotAngles.x - -r0.y;
    r0.z = saturate(dot(r3.zxy, r1.yxz));
    r0.y = ps;
    ps = log2(r0.z);
    r8.y = saturate(r0.y * SpotAngles.y);
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.yz = r8.xy * r8.zy;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r0.w = saturate(dot(r7.zxy, r3.zxy));
    r1.x = ps;
    ps = pow(2.0, r0.x);
    r1.xyz = r1.xxx * r6.xyz;
    r0.x = ps;
    r1.xy = r5.xy * r0.ww + r1.xy;
    r1.z = r5.z * r0.w + r1.z;
    r1.xyz = r1.xyz * r0.xxx;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.zzz;
    r0.xyz = r0.xyz * r2.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
