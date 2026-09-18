// ps_56370bb4772e2c06.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10041000 00000706 00000000 000050E7 007F007F 00000001 00003050 00003151 00003252 00007354 0000F455 00007556 0000F657
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
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
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float2 vPos : VPOS;   // r7 (pixel parameters)
    float vFace : VFACE;  // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = r0.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.xy = r0.xy * UniformScalar_0.xx;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.z = UniformScalar_1.x * 4.0;
    r8.w = ps;
    ps = 1.0 / r6.w;
    r8.xy = r6.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r8.xy = r8.xy * r0.zz + ScreenPositionScaleBias.wz;
    ps = r2.z;
    r0.zw = r1.xy * UniformScalar_4.xx;
    ps = r2.x * ps;
    r1.xy = r8.zw * abs(r7.xy);
    r2.z = ps;
    ps = UniformScalar_1.x * r2.y;
    r11.x = saturate(r6.w * 0.0001);
    r2.w = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r12.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r0.z = tex2D(Texture2D_2, r2.xy).x;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_5, r2.zw).xyz;
    r10.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_1, r2.zw).xyz;
    r1.xyz = tex2D(Texture2D_3, r1.zw).wxy;
    ps = 0.1 - -r3.z;
    r0.x = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r11.y = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r2.w = dot(r5.zxy, r5.zxy);
    r11.z = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r0.y = dot(r4.zxy, r4.zxy);
    r11.w = ps;
    r8.xy = r1.yz * 2.0 - 1.0;
    ps = 1.0 - r0.y;
    r3.w = dot(r3.zxy, r3.zxy);
    r0.w = saturate(ps);
    r14.xyz = r13.xyz * 2.0 - 1.0;
    r13.xyz = r10.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r3.w));
    r1.yzw = -r15.xyz + r16.xyz;
    r3.w = ps;
    ps = rsqrt(abs(r2.w));
    r6.xyz = r3.www * r3.xyz;
    r2.w = ps;
    ps = rsqrt(abs(r0.y));
    r10.xyz = r2.www * r5.xyz;
    r0.y = ps;
    ps = 5.0 * r0.x;
    r3.xyz = r0.yyy * -SpotDirection.xyz;
    r0.y = saturate(ps);
    r1.yzw = r1.yzw * r0.zzz + r15.xyz;
    ps = log2(r0.w);
    r5.xyz = r14.xyz - r13.xyz;
    r0.x = ps;
    r5.xy = r5.xy * r0.zz + r13.xy;
    r0.w = r5.z * r0.z - 2.0;
    ps = 1.0 - r0.y;
    r1.yzw = r11.yzw * r1.yzw;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.y = dot(r3.zxy, r4.zxy);
    r11.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r3.xzw = r1.yzw * r12.xyz;
    r11.z = ps;
    r0.w = r10.w * 2.0 + r0.w;
    ps = (-1.0) + r1.x;
    r1.yzw = -r11.xyz + 1.0;
    r0.z = ps;
    r4.zw = r0.wz * r1.yy + 1.0;
    ps = UniformScalar_3.x * r1.y;
    r1.x = ps;
    r0.zw = r1.xx * r8.xy + r5.xy;
    ps = -UniformVector_0.x;
    r4.xy = r0.zw * r1.yy;
    r4 = (r1.xyyy > 0.0) ? r4.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r8 = (r1.xyyy >= 0.0) ? r4 : float4(1.0, 0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r0.z = dot(r8.wyz, r8.wyz);
    r3.y = ps;
    ps = -SpotAngles.x - -r0.y;
    r4.xyz = r3.xzw * r8.xxx;
    r0.y = ps;
    r5.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.z));
    r3.x = saturate(r0.y * SpotAngles.y);
    r0.y = ps;
    ps = -UniformVector_0.y;
    r8.xyz = r8.yzw * r0.yyy;
    ps = 1.0 + ps;
    r0.y = dot(r8.zxy, r10.zxy);
    r3.z = ps;
    ps = -UniformVector_0.z;
    r0.yzw = r8.xyz * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r0.y = saturate(dot(r6.zxy, r0.wyz));
    r3.w = ps;
    ps = log2(r0.y);
    r4.xyz = r4.xyz * r3.yzw;
    r9.z = ps;
    r0.yzw = r9.zxy * float3(15.0, 0.875, 0.875);
    r3.yz = r0.zw * r1.zw + 0.125;
    ps = pow(2.0, r0.y);
    r0.z = saturate(dot(r8.zyx, r6.zyx));
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xyz = r5.zxy * r0.yyy;
    r0.y = ps;
    r1.yz = r4.xy * r0.zz + r1.yz;
    r1.w = r4.z * r0.z + r1.x;
    ps = pow(2.0, r0.y);
    r0.xw = r3.yx * r3.zx;
    r1.x = ps;
    r0.xyz = r0.xxx * r2.xyz + ModShadowColor.xyz;
    r1.xyz = r1.yzw * r1.xxx;
    r1.xyz = r1.xyz * r7.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xyz * r0.www;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
