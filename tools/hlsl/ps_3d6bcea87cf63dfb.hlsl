// ps_3d6bcea87cf63dfb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041100 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LightMapScale : register(c16); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UpperSkyColor : register(c13); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
sampler2D LightMapTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    ps = OpacityOverride.x;
    r0.zw = r1.wz * 0.5;
    r16.z = saturate(ps);
    r0.zw = tex2D(Texture2D_0, r0.zw).xy;
    r15 = tex2D(Texture2D_2, r1.xy);
    ps = r3.w;
    r8.x = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r10.x = dot(r2.zxy, r2.zxy);
    r13.w = saturate(ps);
    r11 = r6.yxzw * 2.0 - 1.0;
    r13.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.x = float((r15.w >= 0.5));
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r13.zxy, r13.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r10.x));
    r6.z = dot(r11.zyx, r11.zyx);
    r6.y = ps;
    r7.yz = r0.zw * 2.0 - 1.0;
    r10.xyz = r8.wyz * 2.0 - 1.0;
    r12.z = r10.x * UniformVector_2.z - 1.0;
    ps = rsqrt(abs(r8.x));
    r7.yz = r7.yz * 0.012;
    r10.x = ps;
    ps = rsqrt(abs(r6.z));
    r8.xyz = r10.xxx * r4.zxy;
    r8.w = ps;
    ps = r8.x;
    r6.yzw = r6.yyy * r2.xzy;
    r0.z = ps;
    r12.xy = r10.yz * UniformVector_2.xy - r7.yz;
    ps = rsqrt(abs(r6.x));
    r10.yzw = r11.xzy * r8.www;
    r6.x = ps;
    ps = 0.0;
    r2.xyz = r13.xzy * r6.xxx;
    r0.w = ps;
    ps = 0.1 - -r6.z;
    r13.xyz = r10.zwy * r2.zyx;
    r6.x = ps;
    r14.xyz = r10.yzw * r2.yxz - r13.xyz;
    ps = 5.0 * r6.x;
    r12.xyz = r12.xyz * r16.xxx;
    r16.y = saturate(ps);
    ps = max(r0.z, r0.w);
    r17.xyz = -r16.zxy + 1.0;
    r13.x = ps;
    ps = r7.y;
    r11.xyz = r14.xyz * r11.www;
    ps = r12.x + ps;
    r7.y = dot(r11.zxy, r11.zxy);
    r0.z = ps;
    ps = r7.z;
    r13.yz = r17.zz * ModShadowGroupColor.xy;
    ps = r12.y + ps;
    r13 = -r13.wxyz + 1.0;
    r0.w = ps;
    r12.xy = r0.zw * r13.xx;
    r12.z = r12.z * r13.x + 1.0;
    r12.xyz = (r13.xxx > 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    r12.xyz = (r13.xxx >= 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.y));
    r6.x = dot(r12.zxy, r12.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r11.xyz = r11.xzy * r7.yyy;
    r6.x = ps;
    r14.xyz = r12.xyz * r6.xxx;
    ps = r1.z;
    r6.x = dot(r14.zxy, r8.xyz);
    r7.y = ps;
    ps = r7.x;
    r12.xyz = r14.xzy * r6.xxx;
    r8.xyz = r12.xyz * 2.0 - r8.yxz;
    ps = abs(r9.x) * ps;
    r6.z = saturate(dot(r6.zyw, r8.yxz));
    r7.z = ps;
    ps = log2(abs(r13.y));
    r6.xyw = r10.wyz * r8.yyy;
    r10.y = ps;
    r6.xyw = r11.xzy * r8.zzz + r6.xyw;
    r6.xyw = r2.yzx * r8.xxx + r6.wyx;
    ps = log2(r6.z);
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r10.z = ps;
    ps = r7.w;
    r12.xyz = r10.xyz * float3(-0.075, 0.0125, 15.0);
    r7.x = r12.x * r4.x + r1.w;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xyz);
    r7.w = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r8.x = ps;
    r8.xy = r6.yx * r8.xx + 1.5;
    r10.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r4.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r1.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = UniformVector_4.x * UniformVector_4.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r6.w = dot(r5.zxy, r5.zxy);
    r0.z = ps;
    ps = LightMapScale.x * r6.y;
    r11.xyz = r1.xyz * 6.0;
    r2.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r0.xyz * r15.xyz;
    r6.w = ps;
    ps = LightMapScale.y * r6.z;
    r15.xyz = r6.www * r5.xyz;
    r2.y = ps;
    ps = LightMapScale.z * r6.x;
    r5.xyz = r0.xyz * r16.xxx;
    r2.z = ps;
    ps = r5.x;
    r9.xyz = r17.yyy * UniformVector_3.xyz;
    ps = r8.x * ps;
    r6.w = float((r17.x >= 0.004));
    r8.x = ps;
    r6.xyz = r16.xxx * UniformScalar_1.xxx + r9.xzy;
    r1.xyz = r5.xyz * UniformScalar_2.xxx + r6.xzy;
    ps = r5.y;
    r0.xyz = r2.xzy * r14.zzz;
    ps = r8.y * ps;
    r4.x = dot(r15.zxy, r14.zxy);
    r8.y = ps;
    ps = r5.z;
    r4 = r4.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    ps = r8.z * ps;
    r6.xy = r4.xy + 0.5;
    r8.z = ps;
    r4.xy = r4.zw * r13.zw + 0.125;
    ps = r4.x * r4.y;
    r6.xy = abs(r6.yx) * abs(r6.yx);
    r6.z = ps;
    r7.xyz = r6.zzz * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r12.z);
    r4.xyz = r8.xzy * r6.yyy;
    r6.y = ps;
    ps = pow(2.0, r12.y);
    r5.xyz = r8.xzy * r6.xxx;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r2.xyz = r2.xzy * r6.yyy;
    r6.x = ps;
    r6.xyz = r11.xzy * r6.xxx + r10.xzy;
    r6.xyz = r9.xyz * r6.xzy + UniformVector_0.xyz;
    r6.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.xyz = r5.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r2.xyz * r1.xzy + r6.xzy;
    r6.xyz = r0.xzy * r8.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r7.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
