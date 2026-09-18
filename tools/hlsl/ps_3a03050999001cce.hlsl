// ps_3a03050999001cce.bin
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
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

    r8.zw = r0.xy * 1e+01 + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.yzw = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = -UniformVector_0.yxz + 1.0;
    r8.y = ps;
    r8.xy = r8.xy * abs(r9.xy);
    r12.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r13.x = tex2D(Texture2D_1, r0.xy).y;
    r13.w = tex2D(Texture2D_2, r8.zw).y;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8.y = dot(r2.zxy, r2.zxy);
    r8.w = dot(r4.zxy, r4.zxy);
    r9 = r6.yxzw * 2.0 - 1.0;
    r11.xyz = r7.xyz * 2.0 - 1.0;
    r6.w = dot(r11.zxy, r11.zxy);
    r7.w = dot(r9.zyx, r9.zyx);
    r6.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r8.w));
    r7.xyz = r6.xyz - r6.xyz;
    r8.w = ps;
    ps = rsqrt(abs(r8.y));
    r16.xyz = r8.www * r4.xyz;
    r8.y = ps;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r8.yyy * r2.xzy;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r14.xyz = r9.xzy * r7.www;
    r6.w = ps;
    r9.xyz = r11.xzy * r6.www;
    r6.yzw = r7.yzx * UniformScalar_0.xxx + r6.yzx;
    ps = OpacityOverride.x;
    r11.xyz = r14.zxy * r6.zzz;
    r4.x = saturate(ps);
    ps = 0.1 - -r0.y;
    r7.z = dot(r6.zwy, r6.zwy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.y = dot(r16.zxy, r6.zwy);
    r7.x = saturate(ps);
    ps = r7.y;
    r2.xyz = r14.yzx * r9.zyx;
    r7.y = ps;
    r2.xyz = r14.xyz * r9.yxz - r2.xyz;
    ps = rsqrt(abs(r7.z));
    r15.xyz = r2.xyz * r9.www;
    r6.x = ps;
    ps = 0.0;
    r2.xyw = r6.wyz * r6.xxx;
    r7.z = ps;
    ps = max(r7.y, r7.z);
    r7.w = dot(r2.wxy, r16.zxy);
    r7.y = ps;
    ps = 0.875 * r8.x;
    r7.xz = -r7.yx + 1.0;
    r7.y = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r6.x = dot(r15.zxy, r15.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r6.x));
    r17.xyz = r2.xyw * r7.www;
    r6.x = ps;
    r2.xyz = r17.xyz * 2.0 - r16.xyz;
    ps = ModShadowGroupColor.y * r7.z;
    r15.xyz = r15.xzy * r6.xxx;
    r4.z = ps;
    r6.xyz = r15.xzy * r6.yyy + r11.xyz;
    ps = 0.875 * r8.z;
    r4.xyz = -r4.xyz + 1.0;
    r7.w = ps;
    r13.yz = r7.yw * r4.yz + 0.125;
    r6.xyz = r9.xzy * r6.www + r6.xyz;
    ps = LocalToWorldMatrix[0].z * r6.x;
    r6.w = saturate(dot(r0.yxz, r2.zxy));
    r11.x = ps;
    ps = LocalToWorldMatrix[1].z * r6.y;
    r11.yz = r13.xy * r13.wz;
    r11.w = ps;
    r8.xz = r11.xy + r11.wy;
    r6.x = r6.z * LocalToWorldMatrix[2].z + r8.x;
    ps = 0.5 * r6.x;
    r13.yzw = r2.www * r1.yzx;
    r12.x = ps;
    r0 = r12.yzwx + float4(-1.0, -1.0, -1.0, 0.5);
    r7.yzw = r0.xyz * UniformScalar_0.xxx + 1.0;
    ps = 5e+01 * r7.y;
    r6.x = ps;
    ps = log2(r6.w);
    r9.w = max(r6.x, 0.0001);
    r2.w = ps;
    r9 = r9.xzyw * r2.xxxw;
    r6.xyz = r15.xyz * r2.yyy + r9.xzy;
    r6.xyw = r14.xyz * r2.zzz + r6.zyx;
    r2.xyz = r6.yyy * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.xxx * LocalToWorldMatrix[1].xyz + r2.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r2.z = r6.w;
    r8.y = ps;
    r2.xy = r6.yx * r8.yy + 1.5;
    r6.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r6.w = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    ps = UpperSkyColor.x * r5.y;
    r2.xyz = r6.www - r6.xzy;
    r5.w = ps;
    r6.xyz = r2.xyz * 1.8 + r6.xzy;
    r2 = r5.yxzw * r12.yzwy;
    r10.x = r13.w * r2.x;
    ps = LowerSkyColor.x * r5.y;
    r9.xyz = r6.xyz * UniformScalar_6.xxx;
    r13.x = ps;
    r8.xyw = r13.xyz * r12.yzw;
    r6.xyz = r11.zzz * r10.yzw + ModShadowColor.xyz;
    ps = pow(2.0, r9.w);
    r10.yz = r8.yw * r5.xz;
    r6.w = ps;
    r1.xyz = r6.www * r1.xyz;
    ps = log2(abs(r0.w));
    r0.xyz = r1.xzy * r7.ywz;
    r0.w = ps;
    ps = abs(r7.x) * abs(r7.x);
    r0 = r0.xzyw * float4(2e+01, 2e+01, 2e+01, 0.8);
    r6.w = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r10.xyz + r0.xyz;
    r7.x = ps;
    r1.xyz = r9.xyz * r7.xxx - 0.025;
    r8.yw = r2.yz * LowerSkyColor.yz + r0.yz;
    ps = sqrt(abs(r6.w));
    r0.x = r0.x + r8.x;
    r7.x = ps;
    ps = r0.x;
    r6.w = float((r4.x >= 0.004));
    r0.yz = r2.yz * UpperSkyColor.yz + r8.yw;
    r1.xyz = r1.xyz * r7.xxx + 0.025;
    ps = r2.w + ps;
    r8.xyw = r1.xyz * r7.ywz;
    r0.x = ps;
    r7.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    r8.z = r8.z + r8.w;
    r8.xyz = r8.xzy + UniformVector_0.xyz;
    r7.xyz = r8.xyz + r7.xyz;
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
