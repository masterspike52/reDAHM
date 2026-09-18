// ps_d0431b0816083897.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040D00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_6 : register(c4); // float
float4 UniformScalar_7 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r5.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r13.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_3, r0.xy).zxy;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xzy;
    ps = OpacityOverride.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r10.w = saturate(ps);
    ps = UniformScalar_7.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    ps = 0.0001;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r10.y = ps;
    ps = max(r10.x, r10.y);
    r6.x = dot(r3.zxy, r3.zxy);
    r13.x = ps;
    r6.yzw = r6.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r12.xyz = r9.xyz * r2.yzx;
    r6.x = ps;
    ps = rsqrt(abs(r0.w));
    r11.xyz = r6.xxx * r3.xyz;
    r0.w = ps;
    ps = 0.8 * r0.x;
    r4.xyz = r0.www * r4.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r0.w = dot(r6.wyz, r6.wyz);
    r3.x = ps;
    ps = rsqrt(abs(r0.w));
    r3.xyz = r3.xxx * r1.xzy;
    r0.w = ps;
    ps = 0.8 * r0.z;
    r1.yzw = r6.yzw * r0.www;
    r6.y = ps;
    ps = 0.1 - -r3.y;
    r13.y = dot(r4.zxy, r1.wyz);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.w = dot(r1.wyz, r11.zxy);
    r0.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r2.y;
    r0.z = -r0.z + 1.0;
    r10.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r4.xyz = r1.ywz * r0.www;
    r10.y = ps;
    r11.xyz = r4.xyz * 2.0 - r11.xzy;
    ps = ModShadowGroupColor.y * r0.z;
    r4 = r13.yyzw * float4(0.5, -0.5, 0.875, 0.875);
    r10.z = ps;
    ps = r4.x;
    r0.w = saturate(dot(r3.yxz, r11.yxz));
    r0.z = ps;
    ps = 0.5 + r0.z;
    r10.yzw = -r10.yzw + 1.0;
    r3.y = ps;
    ps = 0.5 + r4.y;
    r3.x = float((r10.w >= 0.004));
    r3.z = ps;
    r13.yz = r4.zw * r10.yz + 0.125;
    ps = AmbientColorAndSkyFactor.y * r2.z;
    r4.xz = abs(r3.yz) * abs(r3.yz);
    r10.y = ps;
    ps = log2(r0.w);
    r11.xyz = r12.yzx * r4.xxx;
    r13.w = ps;
    ps = AmbientColorAndSkyFactor.z * r2.x;
    r4.xy = r13.xy * r13.wz;
    r10.z = ps;
    r3.yzw = r4.yyy * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r4.x);
    r13.xyz = r12.yzx * r4.zzz;
    r1.x = ps;
    ps = ConstantLighting.y * r1.x;
    r8 = r1.wwwx * ConstantLighting.xyzx;
    r4.x = ps;
    ps = ConstantLighting.z * r1.x;
    r12.xyz = r8.xyz * r12.xyz;
    r4.y = ps;
    r1.xyz = r13.zyx * LowerSkyColor.xzy + r12.xzy;
    r1.xyz = r11.zxy * UpperSkyColor.xyz + r1.xzy;
    r1.xyz = r10.zyx * r9.zyx + r1.zyx;
    r1.z = r8.w * r7.x + r1.z;
    r1.xy = r4.xy * r7.yz + r1.yx;
    ps = 0.8 * r0.y;
    r1.xy = r1.xy + UniformVector_0.yz;
    r6.z = ps;
    r0.xyz = r6.yzx * UniformScalar_6.xxx + r1.xyz;
    r0.yzw = r5.xyz * 2.0 + r0.zxy;
    ps = UniformVector_0.x + r0.y;
    r0.x = ps;
    ps = -r2.w;
    r0.xyz = r0.xzw * r3.yzw;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r3.x + r2.w;
    r0.xyz = r1.xyz * r3.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
