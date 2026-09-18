// ps_adb88fd64363d8e5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040F00 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.w = dot(r4.zxy, r4.zxy);
    r8.xyz = r7.xyz * 2.0 - 1.0;
    r7 = r6.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r7.zyx, r7.zyx);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r8.zxy, r8.zxy);
    r6.y = ps;
    r5.xyz = r5.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r8.w));
    r10.xyz = r5.xyz - r5.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r6.w));
    r12.yzw = r8.www * r4.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r4.yzw = r8.xzy * r6.www;
    r6.z = ps;
    r8.xyz = r7.xzy * r6.zzz;
    r10.xyz = r10.xyz * UniformScalar_0.xxx + r5.xyz;
    r7.xyz = r8.zxy * r10.zzz;
    r6.z = dot(r10.zxy, r10.zxy);
    r5.xyz = r8.yzx * r4.wzy;
    r5.xyz = r8.xyz * r4.zyw - r5.xyz;
    ps = rsqrt(abs(r6.z));
    r5.xyz = r5.xyz * r7.www;
    r6.z = ps;
    r11.xyw = r10.xyz * r6.zzz;
    r6.w = dot(r11.wxy, r12.wyz);
    r6.z = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.z));
    r13.xyz = r11.xyw * r6.www;
    r6.z = ps;
    r13.xyz = r13.xyz * 2.0 - r12.yzw;
    ps = r6.x;
    r5.xyz = r5.xzy * r6.zzz;
    r7.xyz = r5.xzy * r10.yyy + r7.xyz;
    ps = abs(r9.x) * ps;
    r8.xyz = r8.zxy * r13.zzz;
    r4.x = ps;
    r8.xyz = r5.xzy * r13.yyy + r8.xyz;
    r7.xyw = r4.yzw * r10.xxx + r7.xzy;
    r5.xyw = r4.ywz * r13.xxx + r8.xyz;
    ps = LocalToWorldMatrix[0].z * r7.x;
    r8.xyz = r5.www * LocalToWorldMatrix[2].xyz;
    r5.w = ps;
    ps = LocalToWorldMatrix[1].z * r7.w;
    r4.yzw = r5.yyy * LocalToWorldMatrix[1].xyz;
    r8.w = ps;
    r5.xyz = r5.xxx * LocalToWorldMatrix[0].xzy + r4.ywz;
    ps = r6.y;
    r8 = r5.wxzy + r8.wxyz;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r8.yzw);
    r4.y = ps;
    ps = 1.0 / abs(r6.z);
    r7.w = r6.w;
    r7.x = ps;
    r7.xz = r6.yx * r7.xx + 1.5;
    r9.z = tex2D(Texture2D_1, r0.xy).y;
    r9.xyw = texCUBE(TextureCube_0, xe_cube_dir(r7.xzw)).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r0.xyz = tex2D(Texture2D_2, r0.xy).yxz;
    r14.yzw = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r2.zxy, r2.zxy);
    r4.xyz = -UniformVector_0.yxz + 1.0;
    ps = OpacityOverride.x;
    r6.w = dot(r9.wxy, float3(0.11, 0.3, 0.59));
    r7.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.y * r0.x;
    r5.xyz = r0.yzx - 1.0;
    r12.x = ps;
    r11.xyz = r5.xyz * UniformScalar_0.xxx + 1.0;
    ps = rsqrt(abs(r6.z));
    r15.yzw = r6.www - r9.xwy;
    r6.z = ps;
    ps = UpperSkyColor.x * r4.y;
    r2.xyz = r6.zzz * r2.xzy;
    r4.w = ps;
    ps = LowerSkyColor.x * r4.y;
    r5 = r4.zyxw * r0.zyxy;
    r15.x = ps;
    r8.yzw = r15.yzw * 1.2 + r9.xwy;
    ps = 0.1 - -r2.y;
    r6.w = dot(r12.wyz, r10.zxy);
    r6.z = ps;
    ps = 0.875 * r6.x;
    r7.x = saturate(r6.z * 5.0);
    r10.z = ps;
    ps = 0.875 * r6.y;
    r6.xz = -r7.zx + 1.0;
    r10.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r7.x = max(r6.w, 0.0);
    r7.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15.yzw = r11.www * r1.xyz;
    r7.w = ps;
    ps = 1.0 - r7.x;
    r10.xy = r15.yz * r5.yz;
    r9.x = ps;
    ps = 1.0 - r7.z;
    r12.yz = r15.xw * r0.yz;
    r9.y = ps;
    ps = 1.0 - r7.w;
    r6.y = saturate(dot(r2.yxz, r13.zxy));
    r9.w = ps;
    ps = UniformScalar_1.x * r8.y;
    r0.xy = r10.zw * r9.yw;
    r13.x = ps;
    ps = r5.z;
    r10.zw = r12.xz * r4.xz;
    r6.z = ps;
    r11.w = r7.y * LocalToWorldMatrix[2].z + r8.x;
    ps = UpperSkyColor.y * r6.z;
    r0.zw = r11.wx * float2(0.5, 5e+01);
    r6.w = ps;
    ps = log2(r6.y);
    r7.xyw = r0.xyz + float3(0.125, 0.125, 0.5);
    r14.x = ps;
    ps = r7.x * r7.y;
    r0.x = max(r0.w, 0.0001);
    r0.y = ps;
    ps = UpperSkyColor.z * r5.x;
    r0 = r0.xyyy * r14;
    r6.y = ps;
    ps = pow(2.0, r0.x);
    r2.x = r10.z + r6.w;
    r6.w = ps;
    ps = UniformScalar_1.x * r8.z;
    r1.xyz = r6.www * r1.xyz;
    r13.y = ps;
    ps = log2(abs(r7.w));
    r7.xyz = r1.xyz * r11.xzy;
    r7.w = ps;
    ps = UniformScalar_1.x * r8.w;
    r7 = r7.xzyw * float4(2e+01, 2e+01, 2e+01, 0.8);
    r13.z = ps;
    ps = pow(2.0, r7.w);
    r2.yz = r10.xw + r7.xy;
    r6.w = ps;
    r8.xyz = r13.xyz * r6.www - 0.0125;
    ps = abs(r9.x) * abs(r9.x);
    r8.w = r2.y + r12.y;
    r6.w = ps;
    ps = sqrt(abs(r6.w));
    r7.x = r8.w + r5.w;
    r6.w = ps;
    r8.xyz = r8.xyz * r6.www + 0.0125;
    r7.yw = r5.xz * LowerSkyColor.zy + r2.zx;
    r7.y = r7.y + r6.y;
    r6.w = float((r6.x >= 0.004));
    ps = r7.w;
    r6.xyz = r0.yzw + ModShadowColor.xyz;
    ps = r10.y + ps;
    r8.xyz = r8.xyz * r11.xyz;
    r8.w = ps;
    r8.w = r8.w + r7.z;
    r9.xy = r5.yx * AmbientColorAndSkyFactor.xz + r7.xy;
    r7.xyz = r8.xyw + UniformVector_0.xzy;
    r7.w = r7.z + r8.z;
    r7.w = r7.w + r9.z;
    r7.xyz = r7.xyw + r9.xyz;
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
