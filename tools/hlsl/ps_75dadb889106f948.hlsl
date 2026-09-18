// ps_75dadb889106f948.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 282 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000468 10041000 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 ConstantLighting : register(c15); // float3
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
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
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

    r5 = r5.yxzw * 2.0 - 1.0;
    r9.xyz = r6.xyz * 2.0 - 1.0;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r0.z + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = dot(r1.zxy, r1.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.w = r6.z * UniformVector_2.y;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r11.xy = r7.xy * abs(r8.xy);
    r7.y = ps;
    ps = r0.w;
    r6.x = dot(r9.zxy, r9.zxy);
    ps = UniformVector_2.x * ps;
    r7.x = dot(r5.zyx, r5.zyx);
    r6.z = ps;
    ps = rsqrt(abs(r7.x));
    r8.xyz = r7.yyy * r3.zxy;
    r3.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r6.yyy * r1.zxy;
    r7.w = ps;
    ps = r9.x;
    r6.xy = r7.yz * -r8.yz;
    ps = r7.w * ps;
    r10.xyz = r5.xzy * r3.xxx;
    r1.x = ps;
    ps = r9.z;
    r3.xy = float2((r6.zw >= 0.5));
    r16.x = r8.x * 2.0 - r8.x;
    ps = r7.w * ps;
    r1.zw = r6.wz - 0.5;
    r1.y = ps;
    ps = r9.y;
    r3.zw = r1.zw - r6.wz;
    ps = r7.w * ps;
    r5.xyz = r10.zxy * r16.xxx;
    r1.z = ps;
    r9.xyz = r10.yzx * r1.zyx;
    r6.zw = r3.zw * r3.yx + r6.wz;
    r9.xyz = r10.xyz * r1.yxz - r9.xyz;
    r9.xyz = r9.xyz * r5.www;
    r5.w = dot(r9.zxy, r9.zxy);
    ps = rsqrt(abs(r5.w));
    r6.xyw = r6.zwx + r6.zwy;
    r5.w = ps;
    r9.xyz = r9.xyz * r5.www;
    r5.xyz = r9.xzy * -r8.zzz + r5.xzy;
    r5.xyw = r1.yzx * -r8.yyy + r5.yzx;
    r1.xyz = r5.xxx * LocalToWorldMatrix[2].xzy;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xzy + r1.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xyz + r5.xzy;
    r5 = xe_cube(r5.xyz);
    ps = 1.0 / abs(r5.z);
    r1.z = r5.w;
    r6.z = ps;
    r1.xy = r5.yx * r6.zz + 1.5;
    r9.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_0, r0.wz).xyz;
    r16.yzw = texCUBE(TextureCube_0, xe_cube_dir(r1.xyz)).xyz;
    r13 = tex2D(Texture2D_2, r6.yx);
    r11.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r0 = tex2D(Texture2D_1, r0.xy);
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = dot(r4.zxy, r4.zxy);
    ps = r0.w;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r8.yzw = r0.xyz * 2e+01;
    r7.w = ps;
    ps = OpacityOverride.x;
    r14.xyz = r7.www * UniformVector_1.xyz;
    r12.w = saturate(ps);
    r0.xyz = r0.www * UniformScalar_0.xxx + r14.xzy;
    ps = rsqrt(abs(r5.z));
    r5.y = max(r8.x, 0.0);
    r11.x = ps;
    ps = 0.1 - -r7.x;
    r11 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r3.x = dot(r3.xyy, float3(1.0, 1.0, 1.0));
    r5.x = saturate(ps);
    r5.w = (r3.x == 0.0) ? r13.x : r13.y;
    ps = 1.0 - r5.x;
    r3.yz = r11.xy * r4.zz;
    r5.z = ps;
    ps = 1.0 - r5.y;
    r3 = r3.xxyz + float4(-3.0, -2.0, 0.5, 0.5);
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r7 = r7.xwww * r16;
    r12.x = ps;
    r5.y = (r3.y == 0.0) ? r13.z : r5.w;
    r4.xyz = r7.ywz * r5.xxx + r15.xzy;
    r7.yzw = r14.xyz * r4.xzy + r8.yzw;
    ps = ModShadowGroupColor.y * r5.z;
    r6.w = saturate(r6.w + r7.x);
    r12.y = ps;
    r12.z = (r3.x == 0.0) ? r13.w : r5.y;
    ps = log2(r6.w);
    r5 = -r12.xywz + 1.0;
    r10.x = ps;
    r10 = r10 * float4(15.0, 0.5, 0.5, 0.5);
    r5.xy = r11.zw * r5.xy + 0.125;
    r7.x = saturate(r5.w * 2.5 - 0.5);
    r4.xyz = r7.yzw * r7.xxx + UniformVector_0.xyz;
    ps = r5.x * r5.y;
    r5.w = float((r5.z >= 0.004));
    r5.x = ps;
    ps = pow(2.0, r10.x);
    r7.yzw = r10.yzw * r0.www;
    r6.w = ps;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    r0.xyz = r7.yzw * UniformScalar_1.xxx + r0.xzy;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r1.xyz = r6.www * ConstantLighting.xyz;
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r7.yzw = r7.yzw + r8.yzw;
    r8.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r1.xyz = r1.xzy * r7.xxx;
    r8.z = ps;
    ps = abs(r3.z) * abs(r3.z);
    r7.yzw = r7.yzw - r9.xyz;
    r6.w = ps;
    r7.xyz = r7.yzw * r7.xxx + r9.xyz;
    r4.xyz = r8.xyz * r7.xyz + r4.xyz;
    ps = abs(r3.w) * abs(r3.w);
    r7.xyz = r7.xyz * r6.yzx;
    r6.x = ps;
    r3.xyz = r7.xzy * r6.www;
    r6.xyz = r7.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r4.xzy;
    r6.xyz = r3.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.xzy + r6.xzy;
    r6.xyz = r7.xyz * ConstantLighting.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
