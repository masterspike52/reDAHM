// ps_3b8becba3acc2a7e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 297 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004A4 10040F00 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 LightMapScale : register(c13); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformVector_0 : register(c6); // float4
float4 UpperSkyColor : register(c10); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r8.w = dot(r4.zxy, r4.zxy);
    r5.xyz = r7.xyz * 2.0 - 1.0;
    r7 = r6.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r7.zyx, r7.zyx);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r5.zxy, r5.zxy);
    r6.y = ps;
    r8.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r8.w));
    r10.xyz = r8.xyz - r8.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r6.w));
    r14.yzw = r8.www * r4.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r5.xyz = r5.xzy * r6.www;
    r6.z = ps;
    r4.xyz = r7.xyz * r6.zzz;
    r10.yzw = r10.xyz * UniformScalar_0.xxx + r8.xyz;
    r7.xyz = r4.yxz * r10.www;
    r6.z = dot(r10.wyz, r10.wyz);
    r8.xyz = r4.zxy * r5.zxy;
    r8.xyz = r4.xzy * r5.yxz - r8.xzy;
    ps = rsqrt(abs(r6.z));
    r11.xyz = r8.xzy * r7.www;
    r6.z = ps;
    r8.xyw = r10.yzw * r6.zzz;
    r6.w = dot(r8.wxy, r14.wyz);
    r6.z = dot(r11.yxz, r11.yxz);
    ps = rsqrt(abs(r6.z));
    r12.xyz = r8.xyw * r6.www;
    r6.z = ps;
    r13.xyz = r12.xyz * 2.0 - r14.yzw;
    ps = r6.x;
    r11.xyz = r11.xzy * r6.zzz;
    r7.xyz = r11.xzy * r10.zzz + r7.xzy;
    ps = abs(r9.x) * ps;
    r4.xyz = r4.yzx * r13.zzz;
    r0.z = ps;
    r4.xyz = r11.xzy * r13.yyy + r4.xyz;
    r7.xyz = r5.xzy * r10.yyy + r7.xzy;
    r8.xyz = r5.xzy * r13.xxx + r4.xzy;
    ps = LocalToWorldMatrix[0].z * r7.x;
    r4.xyz = r8.zzz * LocalToWorldMatrix[2].xyz;
    r5.w = ps;
    ps = LocalToWorldMatrix[1].z * r7.y;
    r5.xyz = r8.yyy * LocalToWorldMatrix[1].xyz;
    r4.w = ps;
    r5.xyz = r8.xxx * LocalToWorldMatrix[0].xzy + r5.xzy;
    ps = r6.y;
    r4 = r5.wzxy + r4.wyxz;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r4.zyw);
    r0.w = ps;
    ps = 1.0 / abs(r6.z);
    r7.w = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r4.z = tex2D(Texture2D_1, r1.xy).y;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyw)).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r7.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.xyz = tex2D(Texture2D_2, r1.xy).yxz;
    ps = OpacityOverride.x;
    r12.yzw = -ModShadowColor.xyz + 1.0;
    r9.w = saturate(ps);
    ps = AmbientColorAndSkyFactor.y * r8.x;
    r0.xyz = -UniformVector_0.yxz + 1.0;
    r10.x = ps;
    ps = LowerSkyColor.x * r0.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    ps = UpperSkyColor.x * r0.y;
    r4.yw = r7.xy * 0.875;
    r0.w = ps;
    ps = LightMapScale.x * r6.y;
    r7.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r11.y = ps;
    ps = LightMapScale.y * r6.z;
    r1.xyz = r8.yzx - 1.0;
    r11.z = ps;
    r5.xyz = r1.xyz * UniformScalar_0.xxx + 1.0;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r7.xxx - r9.xzy;
    r6.w = ps;
    ps = LightMapScale.z * r6.x;
    r7.xyw = r6.www * r2.xzy;
    r11.w = ps;
    ps = 0.1 - -r7.y;
    r1 = r0.zyxw * r8.zyxy;
    r6.x = ps;
    r6.yzw = r15.yxz * 1.2 + r9.zxy;
    ps = UniformScalar_1.x * r6.z;
    r2.x = dot(r14.wyz, r10.wyz);
    r11.x = ps;
    ps = r1.z;
    r6.z = saturate(r6.x * 5.0);
    r6.x = ps;
    ps = 1.0 - r6.z;
    r9.x = max(r2.x, 0.0);
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r14.yzw = r11.yzw * r8.www;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r14.yz * r1.yz;
    r9.z = ps;
    ps = UpperSkyColor.y * r6.x;
    r9 = -r9.wxyz + 1.0;
    r8.w = ps;
    ps = r4.y;
    r10.yz = r14.xw * r8.yz;
    ps = r9.z * ps;
    r6.x = saturate(dot(r7.yxw, r13.zxy));
    r13.x = ps;
    ps = r4.w;
    r2.zw = r10.xz * r0.xz;
    r5.w = r7.z * LocalToWorldMatrix[2].z + r4.x;
    ps = r9.w * ps;
    r13.zw = r5.wx * float2(0.5, 5e+01);
    r13.y = ps;
    ps = log2(r6.x);
    r7.xyw = r13.xyz + float3(0.125, 0.125, 0.5);
    r12.x = ps;
    ps = r7.x * r7.y;
    r8.x = max(r13.w, 0.0001);
    r8.y = ps;
    ps = UpperSkyColor.z * r1.x;
    r0 = r8.xyyy * r12;
    r6.x = ps;
    ps = pow(2.0, r0.x);
    r4.x = r2.z + r8.w;
    r7.z = ps;
    ps = UniformScalar_1.x * r6.y;
    r8.xyz = r11.yzw * r7.zzz;
    r11.y = ps;
    ps = log2(abs(r7.w));
    r7.xyz = r8.xyz * r5.xzy;
    r7.w = ps;
    ps = UniformScalar_1.x * r6.w;
    r7 = r7.xzyw * float4(2e+01, 2e+01, 2e+01, 0.8);
    r11.z = ps;
    ps = pow(2.0, r7.w);
    r4.yw = r2.xw + r7.xy;
    r6.y = ps;
    r8.xyz = r11.xyz * r6.yyy - 0.0125;
    ps = abs(r9.y) * abs(r9.y);
    r6.z = r4.y + r10.y;
    r6.y = ps;
    ps = sqrt(abs(r6.y));
    r7.x = r6.z + r1.w;
    r6.y = ps;
    r8.xyz = r8.xyz * r6.yyy + 0.0125;
    r7.yw = r1.xz * LowerSkyColor.zy + r4.wx;
    r7.y = r7.y + r6.x;
    r6.w = float((r9.x >= 0.004));
    ps = r7.w;
    r6.xyz = r0.yzw + ModShadowColor.xyz;
    ps = r2.y + ps;
    r8.xyz = r8.xyz * r5.xyz;
    r8.w = ps;
    r8.w = r8.w + r7.z;
    r4.xy = r1.yx * AmbientColorAndSkyFactor.xz + r7.xy;
    r7.xyz = r8.xyw + UniformVector_0.xzy;
    r7.w = r7.z + r8.z;
    r7.w = r7.w + r4.z;
    r7.xyz = r7.xyw + r4.xyz;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xzy;
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
