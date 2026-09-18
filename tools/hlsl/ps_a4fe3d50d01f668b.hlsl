// ps_a4fe3d50d01f668b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040A00 00000A0A 00000000 0000914A 00FF03FF 00000001 00003050 00003151 0000F252 0000F353 0000F454 0000F556 0000F657 0000F758 0000F8A0 0000F9A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r8 <-> COLOR0 (flags 0xF)
//   interpolator: r9 <-> COLOR1 (flags 0xF)
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
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 texcoord8 : TEXCOORD8; // r7
    float4 color0 : COLOR0; // r8
    float4 color1 : COLOR1; // r9
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
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.texcoord8;
    float4 r8 = In.color0;
    float4 r9 = In.color1;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2 = r8.yxzw * 2.0 - 1.0;
    r9.xyw = r9.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = dot(r4.zxy, r4.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r8.y));
    r8.x = dot(r6.zxy, r6.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r8.x));
    r9.z = r8.y * r4.z;
    r8.x = ps;
    r8.z = dot(r9.wxy, r9.wxy);
    r0.z = dot(r2.zyx, r2.zyx);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r8.xyw = r8.xxx * r6.yzx;
    r0.w = ps;
    r0.z = r8.y * 2.0 - r8.y;
    ps = rsqrt(abs(r8.z));
    r2.xyz = r2.xzy * r0.www;
    r8.z = ps;
    r9.xyw = r9.xwy * r8.zzz;
    r3.xyz = r2.yzx * r9.wyx;
    r3.xyz = r2.xyz * r9.yxw - r3.xyz;
    r3.xyz = r3.xyz * r2.www;
    r8.z = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r8.z));
    r2.xyz = r2.zxy * r0.zzz;
    r8.z = ps;
    r3.xyz = r3.xzy * r8.zzz;
    r8.xyz = r3.xzy * -r8.xxx + r2.xyz;
    r8.xyw = r9.ywx * -r8.www + r8.zyx;
    ps = r0.x;
    r9.xyw = r8.xxx * LocalToWorldMatrix[2].xzy;
    r8.xyz = r8.yyy * LocalToWorldMatrix[1].xzy + r9.xyw;
    r8.xyz = r8.www * LocalToWorldMatrix[0].xyz + r8.xzy;
    ps = abs(r10.x) * ps;
    r8 = xe_cube(r8.xyz);
    r2.x = ps;
    ps = 1.0 / abs(r8.z);
    r0.z = r8.w;
    r9.x = ps;
    ps = r0.y;
    r9.xy = r8.yx * r9.xx;
    ps = abs(r10.y) * ps;
    r0.xyw = r9.xyz + float3(1.5, 1.5, 0.1);
    r2.y = ps;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).zxy;
    r8.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    ps = OpacityOverride.x;
    r8.z = saturate(r0.w * 5.0);
    r2.z = saturate(ps);
    ps = 0.875 * r8.x;
    r8.z = -r8.z + 1.0;
    r0.z = ps;
    ps = 0.875 * r8.y;
    r2.xy = r8.zz * ModShadowGroupColor.xy;
    r0.w = ps;
    ps = UniformVector_0.x + r9.y;
    r8.xyw = -r2.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_0.y + r9.z;
    r8.w = float((r8.w >= 0.004));
    r0.y = ps;
    r8.xy = r0.zw * r8.xy + 0.125;
    ps = UniformVector_0.z + r9.x;
    r8.x = r8.x * r8.y;
    r0.z = ps;
    r8.xyz = r8.xxx * r1.xyz + ModShadowColor.xyz;
    ps = -r5.w;
    r8.xyz = r0.xyz * r8.xyz;
    ps = OpacityOverride.x + ps;
    r9.xyz = r8.xyz - r8.xyz;
    r9.w = ps;
    oC0.w = r9.w * r8.w + r5.w;
    r8.xyz = r9.xyz * r8.www + r8.xyz;
    oC0.xyz = r8.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
