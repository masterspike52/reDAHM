// ps_d74737850e34a206.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10040C00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.zw = r0.xy * UniformScalar_0.xx;
    r8.w = ps;
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r1.zw = r1.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r7.w;
    r8.xy = r1.xy * UniformVector_2.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r2.z + 0.1;
    r8.z = ps;
    ps = (-0.5) + r0.z;
    r6.xy = r8.zw * abs(r6.xy);
    r0.z = ps;
    ps = 0.0001 * r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r8.z = saturate(ps);
    r1.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12.xyz = tex2D(Texture2D_3, r8.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r9.zw).wxy;
    ps = UniformVector_1.x * UniformVector_1.w;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r1.w = float((UniformScalar_4.x >= 1.0));
    r6.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r2.w = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = -UniformVector_0.x;
    r4.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r5.w = float((UniformScalar_4.x > 1.0));
    r10.x = ps;
    r10.yz = r0.yz * 2.0 - 1.0;
    ps = (-1.0) + r0.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r11.x = ps;
    ps = 1.0 - r0.z;
    r11.yzw = r8.wxy + float3(-2.0, 0.0, 0.0);
    r0.x = saturate(ps);
    r12.xyz = (-abs(r5.www) >= 0.0) ? r12.xyz : 1.0;
    ps = rsqrt(abs(r4.w));
    r7.xyz = r6.xyz * r7.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r2.w));
    r6.xyz = r0.yyy * r2.xyz;
    r0.y = ps;
    ps = 5.0 * r0.w;
    r4.xyz = r0.yyy * r4.xyz;
    r0.y = saturate(ps);
    r2.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r0.x);
    r11.yzw = r11.zwy + r8.xyw;
    r0.x = ps;
    ps = 1.0 - r0.y;
    r9.zw = r11.yz - 1.0;
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r8.xy = r0.yy * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = r7.x;
    r0.yzw = r0.yyy * -SpotDirection.xyz;
    ps = r2.x * ps;
    r0.y = dot(r0.wyz, r3.zxy);
    r2.x = ps;
    ps = r7.y;
    r8.yzw = -r8.zxy + 1.0;
    r3.zw = r11.wx * r8.yy + 1.0;
    ps = r2.y * ps;
    r8.x = r8.y * UniformScalar_1.x;
    r2.y = ps;
    r0.zw = r8.xx * r10.yz + r9.zw;
    ps = r7.z;
    r3.xy = r0.zw * r8.yy;
    r3 = (r8.xyyy > 0.0) ? r3.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r7 = (r8.xyyy >= 0.0) ? r3 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r2.z * ps;
    r0.z = dot(r7.wyz, r7.wyz);
    r2.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r3.yzw = r2.xyz * r7.xxx;
    r0.y = ps;
    r2.xyz = r3.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.z));
    r3.x = saturate(r0.y * SpotAngles.y);
    r0.y = ps;
    ps = -UniformVector_0.y;
    r7.xyz = r7.yzw * r0.yyy;
    ps = 1.0 + ps;
    r0.y = dot(r7.zxy, r4.zxy);
    r10.y = ps;
    ps = -UniformVector_0.z;
    r0.yzw = r7.xyz * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r4.xyz;
    ps = 1.0 + ps;
    r0.y = saturate(dot(r6.zxy, r0.wyz));
    r10.z = ps;
    ps = log2(r0.y);
    r4.xyz = r3.yzw * r10.xyz;
    r9.z = ps;
    r0.yzw = r9.zxy * float3(15.0, 0.875, 0.875);
    r3.yz = r0.zw * r8.zw + 0.125;
    ps = pow(2.0, r0.y);
    r0.z = saturate(dot(r7.zyx, r6.zyx));
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2.xyz = r2.xyz * r0.yyy;
    r0.y = ps;
    r2.xy = r4.xy * r0.zz + r2.xy;
    r2.z = r4.z * r0.z + r2.z;
    ps = pow(2.0, r0.y);
    r0.xw = r3.yx * r3.zx;
    r1.w = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xyz * r1.www;
    r1.xyz = r2.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xyz * r0.www;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
