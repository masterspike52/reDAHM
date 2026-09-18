// ps_5aa308c058209186.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003F0 10040C00 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.z = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    r12.xyz = r7.xyz * 2.0 - 1.0;
    r7 = r6.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r7.zyx, r7.zyx);
    r8.y = ps;
    r10.xyz = r10.xyz * 2.0 - 1.0;
    r5.xyz = r5.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r8.z));
    r6.y = dot(r12.zxy, r12.zxy);
    r6.z = ps;
    r11.xyz = r6.zzz * r4.xyz;
    ps = rsqrt(abs(r6.y));
    r10.xyz = r10.xyz - r5.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r12.xzy * r6.yyy;
    r6.x = ps;
    r6.xyz = r7.xzy * r6.xxx;
    r10.xyz = r10.xyz * UniformScalar_0.xxx + r5.xyz;
    r7.xyz = r6.zxy * r10.zzz;
    r6.w = dot(r10.zxy, r10.zxy);
    r5.xyz = r6.yzx * r4.zyx;
    r5.xyz = r6.xyz * r4.yxz - r5.xyz;
    ps = rsqrt(abs(r6.w));
    r12.xyz = r5.xyz * r7.www;
    r6.w = ps;
    r5.xyz = r10.xzy * r6.www;
    r7.w = dot(r5.yxz, r11.zxy);
    r6.w = dot(r12.zxy, r12.zxy);
    ps = rsqrt(abs(r6.w));
    r5.xyz = r5.xzy * r7.www;
    r6.w = ps;
    r5.xyz = r5.xyz * 2.0 - r11.xyz;
    ps = r8.x;
    r12.yzw = r12.xzy * r6.www;
    r7.xyz = r12.ywz * r10.yyy + r7.xyz;
    ps = abs(r9.x) * ps;
    r6.xyz = r6.zxy * r5.zzz;
    r12.x = ps;
    r6.xyz = r12.ywz * r5.yyy + r6.xyz;
    r7.xyz = r4.xzy * r10.xxx + r7.xyz;
    r12.yzw = r4.xyz * r5.xxx + r6.xzy;
    ps = LocalToWorldMatrix[0].z * r7.x;
    r6.xyz = r12.zzz * LocalToWorldMatrix[2].xyz;
    r4.w = ps;
    ps = LocalToWorldMatrix[1].z * r7.y;
    r4.xyz = r12.www * LocalToWorldMatrix[1].xyz;
    r6.w = ps;
    r4.xyz = r12.yyy * LocalToWorldMatrix[0].xzy + r4.xzy;
    ps = r8.y;
    r4 = r4.xzyw + r6;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r4.xyz);
    r12.y = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r7.x = ps;
    r8.xy = r6.yx * r7.xx + 1.5;
    r7.xyw = tex2D(Texture2D_2, r0.xy).xyz;
    r8.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r6.xz = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r9.xyz = UniformVector_2.xyz * UniformScalar_1.xxx;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.y = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    ps = rsqrt(abs(r6.w));
    r7.xyw = r7.xyw - 1.0;
    r6.w = ps;
    r0.yzw = r7.xyw * UniformScalar_0.xxx + 1.0;
    r7.xyw = r6.www * r2.xzy;
    r2.xyz = r6.yyy - r8.xyz;
    r8.xyz = r2.xyz * 0.8 + r8.xyz;
    ps = 0.1 - -r7.y;
    r6.w = dot(r11.zxy, r10.zxy);
    r6.y = ps;
    ps = OpacityOverride.x;
    r6.y = saturate(r6.y * 5.0);
    r2.w = saturate(ps);
    ps = 1.0 - r6.y;
    r2.z = max(r6.w, 0.0);
    r6.y = ps;
    ps = 0.875 * r6.x;
    r2.xy = r6.yy * ModShadowGroupColor.xy;
    r6.w = ps;
    ps = 0.875 * r6.z;
    r2 = -r2.wxyz + 1.0;
    r6.y = ps;
    ps = r6.w;
    r8.xyz = r9.xyz * r8.xyz;
    ps = r2.y * ps;
    r6.w = float((r2.x >= 0.004));
    r6.x = ps;
    ps = r6.y;
    r8.w = saturate(dot(r7.yxw, r5.zxy));
    r6.y = r7.z * LocalToWorldMatrix[2].z + r4.w;
    ps = r2.z * ps;
    r6.z = r6.y * 0.5;
    r6.y = ps;
    ps = abs(r2.w) * abs(r2.w);
    r6.xyz = r6.xzy + float3(0.125, 0.5, 0.125);
    r7.x = ps;
    ps = log2(abs(r6.y));
    r6.x = r6.x * r6.z;
    r0.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    ps = log2(r8.w);
    r7.yw = r0.xy * float2(0.8, 5e+01);
    r7.z = ps;
    ps = pow(2.0, r7.y);
    r8.w = max(r7.w, 0.0001);
    r7.y = ps;
    ps = sqrt(abs(r7.x));
    r8 = r8 * r7.yyyz;
    r7.x = ps;
    ps = pow(2.0, r8.w);
    r8.xyz = r8.xyz - UniformVector_1.xyz;
    r7.w = ps;
    r7.xyz = r8.xyz * r7.xxx + UniformVector_1.xyz;
    r8.xyz = r7.www * r1.xyz;
    r8.xyz = r8.xyz * r0.yzw;
    r7.xyz = r7.xyz * r0.yzw + UniformVector_0.xyz;
    r7.xyz = r8.xyz * 2e+01 + r7.xyz;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
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
