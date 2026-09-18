// ps_1529e7b8b69c3370.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040F00 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LightMapScale : register(c14); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UpperSkyColor : register(c11); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r1.xy * 1e+01 + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.w = dot(r2.zxy, r2.zxy);
    r8.y = ps;
    r8.xy = r8.xy * abs(r9.xy);
    r11.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r13.x = tex2D(Texture2D_1, r1.xy).y;
    r13.w = tex2D(Texture2D_2, r5.xy).y;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r8.xz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r6 = r6.yxwz * 2.0 - 1.0;
    r10.xyz = r7.xyz * 2.0 - 1.0;
    r7.w = dot(r10.zxy, r10.zxy);
    r8.y = dot(r6.wyx, r6.wyx);
    r1.xyz = r1.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r5.xyz = r1.xyz - r1.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r8.w));
    r15.xyz = r7.xxx * r4.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r8.y));
    r7.xyz = r7.xxx * r2.xzy;
    r8.y = ps;
    ps = rsqrt(abs(r7.w));
    r9.xyz = r6.xwy * r8.yyy;
    r7.w = ps;
    r4.xyz = r10.xzy * r7.www;
    r1.xyz = r5.xyz * UniformScalar_0.xxx + r1.xyz;
    r10.xyz = r9.zxy * r1.zzz;
    ps = OpacityOverride.x;
    r8.y = dot(r15.zxy, r1.zxy);
    r6.y = saturate(ps);
    ps = 0.1 - -r7.y;
    r7.w = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r9.yzx * r4.zyx;
    r6.x = saturate(ps);
    r2.xyz = r9.xyz * r4.yxz - r2.xyz;
    ps = rsqrt(abs(r7.w));
    r14.x = max(r8.y, 0.0);
    r7.w = ps;
    ps = 0.875 * r8.x;
    r5.xyz = r1.xyz * r7.www;
    r0.z = ps;
    ps = 1.0 - r6.x;
    r12.xyz = r2.xyz * r6.zzz;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r6.w = dot(r12.zxy, r12.zxy);
    r8.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = dot(r5.zxy, r15.zxy);
    r14.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyz = r5.xyz * r6.xxx;
    r14.z = ps;
    r2.xyz = r2.xyz * 2.0 - r15.xyz;
    ps = rsqrt(abs(r6.w));
    r5.xyw = -r14.yzx + 1.0;
    r6.x = ps;
    ps = 0.875 * r8.z;
    r12.xyz = r12.xzy * r6.xxx;
    r0.w = ps;
    r13.yz = r0.zw * r5.xy + 0.125;
    r6.xyz = r12.xzy * r1.yyy + r10.xyz;
    r6.xyz = r4.yzx * r1.xxx + r6.zyx;
    ps = LocalToWorldMatrix[2].z * r6.x;
    r6.w = saturate(dot(r7.yxz, r2.zxy));
    r10.w = ps;
    ps = LocalToWorldMatrix[1].z * r6.y;
    r10.xy = r13.xy * r13.wz;
    r7.x = ps;
    r10.z = r6.z * LocalToWorldMatrix[0].z + r7.x;
    r7.xy = r10.zx + r10.wx;
    ps = 0.5 * r7.x;
    r11.x = ps;
    r1 = r11.yzwx + float4(-1.0, -1.0, -1.0, 0.5);
    r7.xzw = r1.xyz * UniformScalar_0.xxx + 1.0;
    ps = 5e+01 * r7.x;
    r6.x = ps;
    ps = log2(r6.w);
    r4.w = max(r6.x, 0.0001);
    r2.w = ps;
    r4 = r4.wzxy * r2.wxxx;
    r6.xyz = r12.xyz * r2.yyy + r4.zwy;
    r6.xyw = r9.xyz * r2.zzz + r6.zyx;
    r8.xyz = r6.yyy * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.xxx * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r8.x = ps;
    r8.xy = r6.yx * r8.xx + 1.5;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = LightMapScale.x * r6.y;
    r8.xyz = -UniformVector_0.yxz + 1.0;
    r2.x = ps;
    ps = LightMapScale.y * r6.z;
    r0.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r2.y = ps;
    ps = LightMapScale.z * r6.x;
    r6.yzw = r8.yxz * r11.yzw;
    r2.z = ps;
    ps = LowerSkyColor.x * r8.y;
    r0.xyz = r0.xxx - r9.xzy;
    r6.x = ps;
    r0.xyz = r0.xyz * 1.8 + r9.xzy;
    ps = UpperSkyColor.x * r8.y;
    r4.yzw = r2.yzx * r5.zzz;
    r0.w = ps;
    ps = r0.w;
    r5.z = r4.w * r6.y;
    ps = r11.y * ps;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    ps = UpperSkyColor.y * r6.z;
    r0.yzw = r0.xyz * UniformScalar_6.xxx;
    r1.y = ps;
    ps = UpperSkyColor.z * r6.w;
    r8.w = float((r8.w >= 0.004));
    r1.z = ps;
    ps = r6.x;
    r12.xy = r4.yz * r11.zw;
    ps = r11.y * ps;
    r5.xy = r12.xy * r8.xz;
    r4.z = ps;
    r8.xyz = r10.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r4.x);
    r6.x = abs(r5.w) * abs(r5.w);
    r0.x = ps;
    ps = LowerSkyColor.y * r6.z;
    r2.xyz = r2.xyz * r0.xxx;
    r4.x = ps;
    ps = log2(abs(r1.w));
    r2.xyz = r2.xzy * r7.xwz;
    r2.w = ps;
    ps = LowerSkyColor.z * r6.w;
    r2 = r2.xzyw * float4(2e+01, 2e+01, 2e+01, 0.8);
    r4.y = ps;
    ps = sqrt(abs(r6.x));
    r5.xyz = r5.xyz + r2.yzx;
    r6.x = ps;
    ps = pow(2.0, r2.w);
    r2.xyz = r5.xyz + r4.xyz;
    r0.x = ps;
    r0.xyz = r0.yzw * r0.xxx - 0.025;
    r0.xyz = r0.xyz * r6.xxx + 0.025;
    r1.xyz = r2.zxy + r1.xyz;
    r6.xyz = r6.yzw * AmbientColorAndSkyFactor.xyz + r1.xyz;
    r0.xyw = r0.xyz * r7.xwz;
    r0.z = r7.y + r0.w;
    r7.xyz = r0.xzy + UniformVector_0.xyz;
    r6.xyz = r7.xyz + r6.xyz;
    ps = -r3.w;
    r6.xyz = r6.xyz * r8.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r8.w + r3.w;
    r6.xyz = r7.xyz * r8.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
