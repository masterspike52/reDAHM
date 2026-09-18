// ps_556c276025d53025.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040800 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A1
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
    float4 color0 : COLOR0; // r4
    float4 color1 : COLOR1; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.texcoord8;
    float4 r4 = In.color0;
    float4 r5 = In.color1;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = r4.yxzw * 2.0 - 1.0;
    r5.xyw = r5.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.y = dot(r0.zxy, r0.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r4.y));
    r4.x = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r5.z = r4.y * r0.z;
    r4.x = ps;
    r4.z = dot(r5.wxy, r5.wxy);
    r0.x = dot(r8.zyx, r8.zyx);
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyw = r4.xxx * r2.yzx;
    r0.y = ps;
    r0.x = r4.y * 2.0 - r4.y;
    ps = rsqrt(abs(r4.z));
    r0.yzw = r8.xzy * r0.yyy;
    r4.z = ps;
    r5.xyw = r5.xwy * r4.zzz;
    r2.xyz = r0.zwy * r5.wyx;
    r2.xyz = r0.yzw * r5.yxw - r2.xyz;
    r2.xyz = r2.xyz * r8.www;
    r4.z = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r4.z));
    r0.xyz = r0.wyz * r0.xxx;
    r4.z = ps;
    r2.xyz = r2.xzy * r4.zzz;
    r4.xyz = r2.xzy * -r4.xxx + r0.xyz;
    r4.xyw = r5.ywx * -r4.www + r4.zyx;
    ps = r7.x;
    r5.xyw = r4.xxx * LocalToWorldMatrix[2].xzy;
    r4.xyz = r4.yyy * LocalToWorldMatrix[1].xzy + r5.xyw;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xyz + r4.xzy;
    ps = abs(r6.x) * ps;
    r4 = xe_cube(r4.xyz);
    r2.x = ps;
    ps = 1.0 / abs(r4.z);
    r0.z = r4.w;
    r5.x = ps;
    ps = r7.y;
    r5.xy = r4.yx * r5.xx;
    ps = abs(r6.y) * ps;
    r0.xyw = r5.xyz + float3(1.5, 1.5, 0.1);
    r2.y = ps;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).zxy;
    r4.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    ps = OpacityOverride.x;
    r4.z = saturate(r0.w * 5.0);
    r2.z = saturate(ps);
    ps = 0.875 * r4.x;
    r4.z = -r4.z + 1.0;
    r0.z = ps;
    ps = 0.875 * r4.y;
    r2.xy = r4.zz * ModShadowGroupColor.xy;
    r0.w = ps;
    ps = UniformVector_0.x + r5.y;
    r4.xyw = -r2.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_0.y + r5.z;
    r4.w = float((r4.w >= 0.004));
    r0.y = ps;
    r4.xy = r0.zw * r4.xy + 0.125;
    ps = UniformVector_0.z + r5.x;
    r4.x = r4.x * r4.y;
    r0.z = ps;
    r4.xyz = r4.xxx * r3.xyz + ModShadowColor.xyz;
    ps = -r1.w;
    r4.xyz = r0.xyz * r4.xyz;
    ps = OpacityOverride.x + ps;
    r5.xyz = r4.xyz - r4.xyz;
    r5.w = ps;
    oC0.w = r5.w * r4.w + r1.w;
    r4.xyz = r5.xyz * r4.www + r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
