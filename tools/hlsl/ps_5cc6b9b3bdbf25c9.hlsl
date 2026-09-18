// ps_5cc6b9b3bdbf25c9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041000 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LightMapScale : register(c15); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UpperSkyColor : register(c12); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D LightMapTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = r6.yxzw * 2.0 - 1.0;
    r8.xyz = r7.xzy * 2.0 - 1.0;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.w = -r1.z + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = dot(r2.zxy, r2.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r7.w));
    r10.y = r8.w * UniformVector_2.y;
    r10.z = ps;
    ps = rsqrt(abs(r7.x));
    r0.zw = r7.yz * abs(r9.xy);
    r7.x = ps;
    ps = r1.w;
    r7.z = dot(r8.yxz, r8.yxz);
    ps = UniformVector_2.x * ps;
    r8.w = dot(r6.zyx, r6.zyx);
    r10.x = ps;
    ps = rsqrt(abs(r8.w));
    r7.xyw = r7.xxx * r4.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r7.z));
    r15.xyz = r10.zzz * r2.xyz;
    r7.z = ps;
    ps = r8.x;
    r2.xy = r15.xy * -r7.xy;
    ps = r7.z * ps;
    r9.xyz = r6.xzy * r8.www;
    r8.x = ps;
    ps = r8.y;
    r14.xy = float2((r10.xy >= 0.5));
    r4.w = r7.w * 2.0 - r7.w;
    ps = r7.z * ps;
    r2.zw = r10.yx - 0.5;
    r8.y = ps;
    ps = r8.z;
    r2.zw = r2.zw - r10.yx;
    ps = r7.z * ps;
    r6.xyz = r9.zxy * r4.www;
    r8.z = ps;
    r4.xyz = r9.yzx * r8.zyx;
    r2.zw = r2.zw * r14.yx + r10.yx;
    r4.xyz = r9.xyz * r8.yxz - r4.xyz;
    r4.xyz = r4.xyz * r6.www;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.w));
    r2.xyz = r2.xzw + r2.yzw;
    r6.w = ps;
    r4.xyz = r4.xyz * r6.www;
    r6.xyz = r4.xzy * -r7.yyy + r6.xzy;
    r6.xyw = r8.yzx * -r7.xxx + r6.yzx;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    r6 = xe_cube(r6.xyz);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r7.z = ps;
    r8.xy = r6.yx * r7.zz + 1.5;
    r9.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r11.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r1.wz).xyz;
    r16 = tex2D(Texture2D_2, r2.zy);
    r12.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r13.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r8 = tex2D(Texture2D_1, r1.xy);
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r1.w = dot(r5.zxy, r5.zxy);
    r14.w = saturate(ps);
    ps = r8.w;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r2.yzw = r8.xyz * 2e+01;
    r6.x = ps;
    ps = LightMapScale.x * r7.y;
    r1.xyz = r6.xxx * UniformVector_1.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r1.w));
    r0.yzw = r6.xxx * r13.xyz;
    r12.x = ps;
    r13.xyz = r8.www * UniformScalar_0.xxx + r1.xzy;
    ps = r7.w;
    r12 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.y = ps;
    ps = 0.0;
    r15.w = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r7.w = ps;
    r6.x = (r15.w == 0.0) ? r16.x : r16.y;
    ps = max(r7.y, r7.w);
    r8.xyz = r15.zww + float3(0.1, -3.0, -2.0);
    r7.w = ps;
    ps = 5.0 * r8.x;
    r5.zw = r12.xy * r5.zz;
    r7.y = saturate(ps);
    r6.x = (r8.z == 0.0) ? r16.z : r6.x;
    r14.z = (r8.y == 0.0) ? r16.w : r6.x;
    r6.x = saturate(r15.z * r4.w + r2.x);
    ps = log2(r6.x);
    r7.yw = -r7.wy + 1.0;
    r11.x = ps;
    r0.yzw = r0.ywz * r7.yyy + r10.xzy;
    r10.xyz = r1.xyz * r0.ywz + r2.yzw;
    ps = ModShadowGroupColor.x * r7.w;
    r1 = r11.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    r14.x = ps;
    ps = ModShadowGroupColor.y * r7.w;
    r11.xyz = r1.xyz * r8.www;
    r14.y = ps;
    ps = LightMapScale.y * r7.z;
    r8 = -r14.wxyz + 1.0;
    r0.y = ps;
    ps = LightMapScale.z * r7.x;
    r7.w = float((r8.x >= 0.004));
    r0.z = ps;
    r1.xyz = r11.xyz * UniformScalar_1.xxx + r13.xzy;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5.xy = r12.zw * r8.yz;
    r2.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r8.xyz = r11.xyz + r2.yzw;
    r2.y = ps;
    r8.w = saturate(r8.w * 2.5 - 0.5);
    r7.xyz = r10.xyz * r8.www + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r8.xyz = r8.xyz - r9.xyz;
    r2.z = ps;
    ps = pow(2.0, r1.w);
    r5 = r5 + float4(0.125, 0.125, 0.5, 0.5);
    r6.x = ps;
    r8.xyz = r8.xyz * r8.www + r9.xyz;
    r7.xyz = r2.xyz * r8.xyz + r7.xyz;
    ps = r5.x * r5.y;
    r2.xyz = r0.xyz * r6.xxx;
    r6.x = ps;
    ps = abs(r5.z) * abs(r5.z);
    r2.xyz = r2.xzy * r8.www;
    r8.w = ps;
    ps = abs(r5.w) * abs(r5.w);
    r8.xyz = r8.xyz * r6.yzw;
    r6.w = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r4.xyz = r8.xzy * r8.www;
    r5.xyz = r8.xzy * r6.www;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r1.xzy + r7.xzy;
    r7.xyz = r0.xyz * r8.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xzy - r6.xzy;
    r8.w = ps;
    oC0.w = r8.w * r7.w + r3.w;
    r6.xyz = r8.xyz * r7.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
