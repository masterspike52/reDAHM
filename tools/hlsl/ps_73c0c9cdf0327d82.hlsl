// ps_73c0c9cdf0327d82.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041100 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
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
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
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
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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

    r12.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 0.0001 * r3.w;
    r8.xy = r0.wz * 0.5;
    r16.x = saturate(ps);
    r13.xy = tex2D(Texture2D_0, r8.xy).xy;
    r11 = tex2D(Texture2D_2, r0.xy).wxyz;
    r10.w = dot(r4.zxy, r4.zxy);
    r12.w = dot(r2.zxy, r2.zxy);
    r8 = r6.yxwz * 2.0 - 1.0;
    r10.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.w = float((r11.x >= 0.5));
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r10.zxy, r10.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r12.w));
    r6.w = dot(r8.wyx, r8.wyx);
    r7.x = ps;
    r6.xy = r13.xy * 2.0 - 1.0;
    r12.xyz = r12.xyz * 2.0 - 1.0;
    r17.z = r12.z * UniformVector_2.z - 1.0;
    ps = 0.012 * r6.x;
    r9.xy = r7.yz * abs(r9.xy);
    r13.x = ps;
    ps = rsqrt(abs(r10.w));
    r7.xyz = r7.xxx * r2.zxy;
    r2.x = ps;
    ps = 0.012 * r6.y;
    r2.yzw = r2.xxx * r4.zxy;
    r13.y = ps;
    ps = rsqrt(abs(r6.w));
    r14.y = max(r2.y, 0.0);
    r6.x = ps;
    r17.xy = r12.xy * UniformVector_2.xy - r13.xy;
    ps = rsqrt(abs(r6.z));
    r15.xyz = r8.xwy * r6.xxx;
    r6.x = ps;
    ps = OpacityOverride.x;
    r10.xyz = r10.xzy * r6.xxx;
    r14.z = saturate(ps);
    ps = 0.1 - -r7.x;
    r6.yzw = r15.yzx * r10.zyx;
    r6.x = ps;
    r12.xyz = r15.xyz * r10.yxz - r6.yzw;
    ps = 5.0 * r6.x;
    r6.yzw = r17.xzy * r16.www;
    r14.x = saturate(ps);
    r8.xyw = -r14.xyz + 1.0;
    ps = r13.x;
    r12.xyz = r12.xyz * r8.zzz;
    ps = r6.y + ps;
    r7.w = dot(r12.zxy, r12.zxy);
    r9.z = ps;
    ps = r13.y;
    r16.yz = r8.xx * ModShadowGroupColor.xy;
    ps = r6.w + ps;
    r13 = -r16.wxyz + 1.0;
    r9.w = ps;
    r6.xy = r9.zw * r13.yy;
    r6.z = r6.z * r13.y + 1.0;
    r6.xyz = (r13.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r13.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r12.xyz = r12.xzy * r7.www;
    r6.x = ps;
    r14.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r14.zxy, r2.yzw);
    r6.xyz = r14.xzy * r6.xxx;
    r2.yzw = r6.yxz * 2.0 - r2.yzw;
    r6.z = saturate(dot(r7.xyz, r2.yzw));
    ps = log2(abs(r8.y));
    r6.xyw = r15.zxy * r2.yyy;
    r2.y = ps;
    r6.xyw = r12.xzy * r2.www + r6.xyw;
    r6.xyw = r10.yzx * r2.zzz + r6.wyx;
    ps = log2(r6.z);
    r7.yzw = r6.xxx * LocalToWorldMatrix[2].xzy;
    r2.z = ps;
    r12.xyz = r2.xyz * float3(-0.075, 0.0125, 15.0);
    r7.x = r12.x * r4.x + r0.w;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r7.yzw;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = r0.z;
    r6 = xe_cube(r6.xyz);
    r7.y = ps;
    ps = 1.0 / abs(r6.z);
    r0.z = r6.w;
    r7.z = ps;
    r0.xy = r6.yx * r7.zz + 1.5;
    r10.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    r4.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r6.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r0.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 6.0 * r6.x;
    r6.w = dot(r5.zxy, r5.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r0.xyz * r11.yzw;
    r6.w = ps;
    ps = 6.0 * r6.y;
    r15.xyz = r6.www * r5.xyz;
    r11.y = ps;
    ps = 6.0 * r6.z;
    r5.xyz = r0.xyz * r16.www;
    r11.z = ps;
    ps = r5.x;
    r6.w = float((r8.w >= 0.004));
    ps = r8.x * ps;
    r9.xyz = r13.xxx * UniformVector_3.xyz;
    r8.x = ps;
    r6.xyz = r16.www * UniformScalar_1.xxx + r9.xzy;
    r2.xyz = r5.xyz * UniformScalar_2.xxx + r6.xzy;
    ps = r5.y;
    r0.xyz = r14.zzz * r1.xyz;
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
    r1.xyz = r6.yyy * r1.xzy;
    r6.x = ps;
    r6.xyz = r11.xzy * r6.xxx + r10.xzy;
    r6.xyz = r9.xyz * r6.xzy + UniformVector_0.xyz;
    r6.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.xyz = r5.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r2.xzy + r6.xzy;
    r6.xyz = r0.xyz * r8.xyz + r6.xzy;
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
