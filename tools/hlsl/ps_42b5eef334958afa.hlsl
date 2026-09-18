// ps_42b5eef334958afa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040F00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_2, r0.xy).yzwx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = ps;
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r1.zw = r1.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r8.z;
    r7.xy = r1.xy * UniformVector_4.xy;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r1.xy = r7.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r1.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r12 = tex2D(Texture2D_1, r0.xy);
    ps = r5.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r11.xyw = -UniformVector_0.xyz + 1.0;
    r11.z = saturate(ps);
    ps = UniformVector_3.x;
    r0.w = float((UniformScalar_3.x >= 1.0));
    ps = 2e+01 * ps;
    r1.x = dot(r4.zxy, r4.zxy);
    r15.x = ps;
    ps = UniformVector_3.y;
    r2.w = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r4.w = float((UniformScalar_3.x > 1.0));
    r15.y = ps;
    ps = UniformVector_3.z;
    r0.x = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r0.y = r2.z + 0.1;
    r15.z = ps;
    ps = 5.0 * r0.y;
    r14.xyz = r12.xyz * r12.www;
    r9.x = saturate(ps);
    ps = 1.0 - r0.x;
    r12.xy = r8.xy * UniformScalar_4.xx;
    r0.z = saturate(ps);
    r13.xyz = (-abs(r4.www) >= 0.0) ? r10.xyz : 1.0;
    r1.yzw = r1.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r2.w));
    r1.yzw = r1.ywz * UniformVector_2.xzy;
    r0.y = ps;
    ps = rsqrt(abs(r1.x));
    r5.xyz = r0.yyy * r2.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r0.yyy * r4.xyz;
    r1.x = ps;
    r0.xyw = (-abs(r0.www) >= 0.0) ? 1.0 : r13.zyx;
    ps = log2(r0.z);
    r13.xyz = r1.xxx * -SpotDirection.xyz;
    r1.x = ps;
    ps = r12.x;
    r4.xyz = r15.xyz * r14.xyz;
    r2.xyz = r0.wyx * r8.wxy + r4.xyz;
    ps = r0.y * ps;
    r0.z = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r4.y = ps;
    ps = r12.y;
    r0.y = dot(r13.zxy, r3.zxy);
    ps = r0.x * ps;
    r0.z = r0.z - r4.x;
    r4.z = ps;
    ps = 1.0 - r1.z;
    r9.w = saturate(r0.z + r4.x);
    r0.x = ps;
    ps = r0.x;
    r3.xyz = r2.xyz * r11.xyw;
    ps = r9.w * ps;
    r0.xz = -r9.wx + 1.0;
    r2.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r2.xy = -r1.yw * r9.ww;
    r11.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r2.xyz = r1.zyw + r2.zxy;
    r11.y = ps;
    ps = (-1.0) - -r2.x;
    r8.xyz = -r11.xyz + 1.0;
    r2.w = ps;
    ps = UniformScalar_4.x * r0.w;
    r2.xyw = r2.yzw * r8.zzz;
    r0.w = ps;
    ps = r0.w;
    r2.z = r2.w + 1.0;
    r1.yzw = (r8.zzz > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r8.zzz >= 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    ps = r8.w * ps;
    r0.w = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.yzw = r4.xyz + UniformScalar_5.xxx;
    r0.w = ps;
    r4.xyz = r2.xyz * r0.www;
    r0.w = dot(r4.zxy, r10.zxy);
    r2.xyz = r4.xyz * r0.www;
    r2.xyz = r2.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r1.x;
    r0.w = saturate(dot(r5.zxy, r2.zxy));
    r1.x = ps;
    ps = log2(r0.w);
    r1.yzw = r1.yzw * r0.xxx;
    r9.x = ps;
    ps = -SpotAngles.x - -r0.y;
    r2.xyz = r9.yxz * float3(0.875, 15.0, 0.875);
    r0.x = ps;
    r0.zw = r2.xz * r8.xy + 0.125;
    ps = pow(2.0, r2.y);
    r2.x = saturate(dot(r4.zyx, r5.zyx));
    r0.y = ps;
    ps = SpotAngles.y * r0.x;
    r1.yzw = r1.yzw * r0.yyy;
    r0.y = saturate(ps);
    r1.yz = r3.xy * r2.xx + r1.yz;
    r1.w = r3.z * r2.x + r1.w;
    ps = pow(2.0, r1.x);
    r0.xw = r0.zy * r0.wy;
    r1.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r1.xyz = r1.yzw * r1.xxx;
    r1.xyz = r1.xyz * r6.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
