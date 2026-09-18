// ps_ead906aee0c985fc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040800 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c6); // float4
samplerCUBE TextureCube_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

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
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5 = r6.yxzw * 2.0 - 1.0;
    r7.xyw = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r7.z = r6.y * r2.z;
    r6.x = ps;
    r6.z = dot(r7.wxy, r7.wxy);
    r0.z = dot(r5.zyx, r5.zyx);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r6.xyw = r6.xxx * r4.yzx;
    r0.w = ps;
    r0.z = r6.y * 2.0 - r6.y;
    ps = rsqrt(abs(r6.z));
    r2.xyz = r5.xzy * r0.www;
    r6.z = ps;
    r7.xyw = r7.xwy * r6.zzz;
    r4.xyz = r2.yzx * r7.wyx;
    r4.xyz = r2.xyz * r7.yxw - r4.xyz;
    r4.xyz = r4.xyz * r5.www;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.z));
    r2.xyz = r2.zxy * r0.zzz;
    r6.z = ps;
    r4.xyz = r4.xzy * r6.zzz;
    r6.xyz = r4.xzy * -r6.xxx + r2.xyz;
    r6.xyw = r7.ywx * -r6.www + r6.zyx;
    ps = r0.x;
    r7.xyw = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r7.xyw;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = abs(r8.x) * ps;
    r6 = xe_cube(r6.xyz);
    r2.x = ps;
    ps = 1.0 / abs(r6.z);
    r0.z = r6.w;
    r7.x = ps;
    ps = r0.y;
    r7.xy = r6.yx * r7.xx;
    ps = abs(r8.y) * ps;
    r0.xyw = r7.xyz + float3(1.5, 1.5, 0.1);
    r2.y = ps;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).zxy;
    r6.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    ps = OpacityOverride.x;
    r6.z = saturate(r0.w * 5.0);
    r2.z = saturate(ps);
    ps = 0.875 * r6.x;
    r6.z = -r6.z + 1.0;
    r0.z = ps;
    ps = 0.875 * r6.y;
    r2.xy = r6.zz * ModShadowGroupColor.xy;
    r0.w = ps;
    ps = UniformVector_0.x + r7.y;
    r6.xyw = -r2.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_0.y + r7.z;
    r6.w = float((r6.w >= 0.004));
    r0.y = ps;
    r6.xy = r0.zw * r6.xy + 0.125;
    ps = UniformVector_0.z + r7.x;
    r6.x = r6.x * r6.y;
    r0.z = ps;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    ps = -r3.w;
    r6.xyz = r0.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
