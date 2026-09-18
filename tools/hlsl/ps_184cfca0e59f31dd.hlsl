// ps_184cfca0e59f31dd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040D00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    r2.x = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = rsqrt(abs(r2.x));
    r0.zw = r0.zw * abs(r5.xy);
    r2.x = ps;
    r9.xyz = r2.xxx * r3.zxy;
    r3 = xe_cube(r9.yzx);
    ps = 1.0 / abs(r3.z);
    r2.z = r3.w;
    r2.x = ps;
    r2.xy = r3.yx * r2.xx + 1.5;
    r10.xyz = tex2D(Texture2D_2, r9.xx).yzx;
    r5.xyw = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).yzx;
    r2.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r3 = tex2D(Texture2D_1, r0.xy).yzxw;
    r7.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0 = tex2D(Texture2D_4, r0.xy).wxyz;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r7.w = dot(r1.zxy, r1.zxy);
    r8.z = saturate(ps);
    ps = r0.y + r0.y;
    r7.xy = r7.xy * 0.875;
    r13.w = ps;
    ps = r3.z;
    r5.z = r3.w + UniformVector_0.y;
    r0.y = ps;
    r8.xyw = r8.wxy * 2.0 - 1.0;
    ps = 2e+02 * r2.x;
    r11.xy = r5.xy * r0.zw;
    r0.z = ps;
    ps = r0.x;
    r10.xy = r10.xy * r2.yz;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.z = r0.z * r10.z;
    r7.z = ps;
    ps = rsqrt(abs(r7.w));
    r0.xw = r10.yx * 2e+02;
    r7.w = ps;
    ps = r7.z;
    r10.xyz = r6.xyz * r3.zxy;
    r7.z = ps;
    ps = 0.0001;
    r1.xyz = r7.www * r1.zxy;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r1.w = dot(r8.xyw, r8.xyw);
    r6.w = ps;
    ps = rsqrt(abs(r1.w));
    r5.z = r5.z + r0.w;
    r1.w = ps;
    ps = UniformVector_0.x + r0.z;
    r4.xyz = r6.www * r4.xyz;
    r11.z = ps;
    ps = UniformVector_0.z + r0.x;
    r8.xyw = r8.ywx * r1.www;
    r11.w = ps;
    r5.xy = r3.ww * float2(0.5, 1.25) + r11.zw;
    ps = 0.1 - -r1.x;
    r11.z = dot(r4.zxy, r8.wxy);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.w = dot(r8.wxy, r9.xyz);
    r0.x = saturate(ps);
    ps = max(r7.z, r7.w);
    r0.z = -r0.x + 1.0;
    r10.w = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r4.xyz = r8.xyw * r0.www;
    r8.x = ps;
    r9.xyz = r4.xyz * 2.0 - r9.yzx;
    ps = ModShadowGroupColor.y * r0.z;
    r4 = r11.zyxz * float4(0.5, 1.5, 1.8, -0.5);
    r8.y = ps;
    ps = r4.w;
    r11.xyz = r8.www * ConstantLighting.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r1.z = saturate(dot(r1.xyz, r9.zxy));
    r1.x = ps;
    ps = 0.5 + r4.x;
    r0.xzw = -r8.xyz + 1.0;
    r1.y = ps;
    r13.yz = r7.xy * r0.xz + 0.125;
    ps = log2(r1.z);
    r1.xy = abs(r1.xy) * abs(r1.xy);
    r1.z = ps;
    ps = AmbientColorAndSkyFactor.x * r0.y;
    r9 = r10.xzyw * r1.xxxz;
    r7.x = ps;
    ps = pow(2.0, r9.w);
    r0.w = float((r0.w >= 0.004));
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.y * r3.x;
    r0.xyz = r0.xxx * ConstantLighting.zyx;
    r7.y = ps;
    ps = r0.z;
    r8.xyz = r10.xzy * r1.yyy;
    ps = r5.w * ps;
    r1.yz = r0.xy * r4.yz;
    r13.x = ps;
    ps = AmbientColorAndSkyFactor.z * r3.y;
    r1.xw = r13.xy * r13.wz;
    r7.z = ps;
    r0.xyz = r1.www * r12.xyz + ModShadowColor.xyz;
    r1.xyz = r11.xzy * r10.xzy + r1.xyz;
    r1.xyz = r9.xyz * LowerSkyColor.xzy + r1.xyz;
    r1.xyz = r8.xyz * UpperSkyColor.xzy + r1.xyz;
    r1.xyz = r7.xzy * r6.xzy + r1.xyz;
    r1.xyz = r1.xyz + r5.xyz;
    ps = -r2.w;
    r0.xyz = r1.xzy * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
