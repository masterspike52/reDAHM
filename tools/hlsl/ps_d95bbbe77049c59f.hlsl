// ps_d95bbbe77049c59f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 282 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000468 10041100 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
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

    r6 = r6.yxzw * 2.0 - 1.0;
    r10.xyz = r7.xyz * 2.0 - 1.0;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = -r0.z + 1.0;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = dot(r2.zxy, r2.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r7.y));
    r7.w = r7.z * UniformVector_2.y;
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r11.xy = r8.xy * abs(r9.xy);
    r8.y = ps;
    ps = r0.w;
    r7.x = dot(r10.zxy, r10.zxy);
    ps = UniformVector_2.x * ps;
    r8.x = dot(r6.zyx, r6.zyx);
    r7.z = ps;
    ps = rsqrt(abs(r8.x));
    r9.xyz = r8.yyy * r4.zxy;
    r4.x = ps;
    ps = rsqrt(abs(r7.x));
    r8.xyz = r7.yyy * r2.zxy;
    r8.w = ps;
    ps = r10.x;
    r7.xy = r8.yz * -r9.yz;
    ps = r8.w * ps;
    r12.xyz = r6.xzy * r4.xxx;
    r2.x = ps;
    ps = r10.z;
    r4.xy = float2((r7.zw >= 0.5));
    r17.x = r9.x * 2.0 - r9.x;
    ps = r8.w * ps;
    r2.zw = r7.wz - 0.5;
    r2.y = ps;
    ps = r10.y;
    r4.zw = r2.zw - r7.wz;
    ps = r8.w * ps;
    r6.xyz = r12.zxy * r17.xxx;
    r2.z = ps;
    r10.xyz = r12.yzx * r2.zyx;
    r7.zw = r4.zw * r4.yx + r7.wz;
    r10.xyz = r12.xyz * r2.yxz - r10.xyz;
    r10.xyz = r10.xyz * r6.www;
    r6.w = dot(r10.zxy, r10.zxy);
    ps = rsqrt(abs(r6.w));
    r7.xyw = r7.zwx + r7.zwy;
    r6.w = ps;
    r10.xyz = r10.xyz * r6.www;
    r6.xyz = r10.xzy * -r9.zzz + r6.xzy;
    r6.xyw = r2.yzx * -r9.yyy + r6.yzx;
    r2.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r2.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    r6 = xe_cube(r6.xyz);
    ps = 1.0 / abs(r6.z);
    r2.z = r6.w;
    r7.z = ps;
    r2.xy = r6.yx * r7.zz + 1.5;
    r10.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r13.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_0, r0.wz).xyz;
    r17.yzw = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r14 = tex2D(Texture2D_2, r7.yx);
    r12.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r2 = tex2D(Texture2D_1, r0.xy);
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = r2.w;
    r7.xyz = -UniformVector_0.zxy + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r2.xyz = r2.xyz * 2e+01;
    r8.w = ps;
    ps = OpacityOverride.x;
    r15.xyz = r8.www * UniformVector_1.xyz;
    r0.w = saturate(ps);
    r9.yzw = r2.www * UniformScalar_0.xxx + r15.xzy;
    ps = rsqrt(abs(r6.z));
    r6.y = max(r9.x, 0.0);
    r12.x = ps;
    ps = 0.1 - -r8.x;
    r12 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r0.x = dot(r4.xyy, float3(1.0, 1.0, 1.0));
    r6.x = saturate(ps);
    r6.w = (r0.x == 0.0) ? r14.x : r14.y;
    ps = 1.0 - r6.x;
    r0.yz = r12.xy * r5.zz;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r4 = r0.xxyz + float4(-3.0, -2.0, 0.5, 0.5);
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r8 = r8.xwww * r17;
    r0.x = ps;
    r6.y = (r4.y == 0.0) ? r14.z : r6.w;
    r5.xyz = r8.ywz * r6.xxx + r16.xzy;
    r8.yzw = r15.xyz * r5.xzy + r2.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r7.w = saturate(r7.w + r8.x);
    r0.y = ps;
    r0.z = (r4.x == 0.0) ? r14.w : r6.y;
    ps = log2(r7.w);
    r6 = -r0 + 1.0;
    r13.x = ps;
    r0 = r13.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r6.w = float((r6.w >= 0.004));
    r9.x = ps;
    r6.xy = r12.zw * r6.xy + 0.125;
    r8.x = saturate(r6.z * 2.5 - 0.5);
    r5.xyz = r8.yzw * r8.xxx + UniformVector_0.xyz;
    ps = r6.x * r6.y;
    r8.yzw = r0.xyz * r2.www;
    r6.x = ps;
    r6.xyz = r6.xxx * r11.xyz + ModShadowColor.xyz;
    r0.xyz = r8.yzw * UniformScalar_1.xxx + r9.ywz;
    ps = pow(2.0, r0.w);
    r8.yzw = r8.yzw + r2.xyz;
    r7.w = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r2.xyz = r7.www * r1.xyz;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r2.xyz = r2.xzy * r8.xxx;
    r9.z = ps;
    ps = abs(r4.z) * abs(r4.z);
    r8.yzw = r8.yzw - r10.xyz;
    r7.w = ps;
    r8.xyz = r8.yzw * r8.xxx + r10.xyz;
    r5.xyz = r9.xyz * r8.xyz + r5.xyz;
    ps = abs(r4.w) * abs(r4.w);
    r8.xyz = r8.xyz * r7.yzx;
    r7.x = ps;
    r4.xyz = r8.xzy * r7.www;
    r7.xyz = r8.xzy * r7.xxx;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r5.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xzy + r7.xzy;
    r7.xyz = r8.xyz * r1.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
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
