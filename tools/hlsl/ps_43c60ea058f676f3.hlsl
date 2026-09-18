// ps_43c60ea058f676f3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 279 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000045C 10041300 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r19.x = ps;
    ps = OpacityOverride.x;
    r10.w = dot(r4.zxy, r4.zxy);
    r7.w = saturate(ps);
    r10.xyz = r7.xyz * 2.0 - 1.0;
    r8 = r6.wxzy * 2.0 - 1.0;
    ps = -r0.z;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r7.y = dot(r8.zyw, r8.zyw);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.z = dot(r10.zxy, r10.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r10.w));
    r18.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    ps = UniformVector_2.y * r6.x;
    r6.yzw = r6.yyy * r4.zyx;
    r19.y = ps;
    ps = rsqrt(abs(r7.z));
    r7.x = max(r6.y, 0.0);
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r4.xyz = r10.xzy * r6.xxx;
    r6.x = ps;
    ps = r18.x;
    r11.xyz = r8.wzy * r6.xxx;
    r8.w = r6.y * 2.0 - r6.y;
    ps = -r6.w * ps;
    r10.xyz = r11.zxy * r8.www;
    r2.x = ps;
    ps = 1.0 - r7.x;
    r2.yzw = r11.yzx * r4.zyx;
    r19.z = ps;
    r2.yzw = r11.xyz * r4.yxz - r2.yzw;
    ps = 1.0 - r7.w;
    r11.xyz = r2.yzw * r8.xxx;
    r19.w = ps;
    ps = r18.y;
    r7.yz = r19.yx - 0.5;
    ps = -r6.z * ps;
    r8.xyz = float3((r19.xyw >= float3(0.5, 0.5, 0.004)));
    r2.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r11.zxy, r11.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.yz = r7.yz - r19.yx;
    r6.x = ps;
    r2.zw = r7.yz * r8.yx + r19.yx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = r11.xyz * r6.xxx;
    r7.y = ps;
    r6.xyz = r11.xzy * -r6.zzz + r10.xzy;
    ps = r2.x + r2.y;
    r7.xy = r7.xy * abs(r9.xy);
    r17.x = ps;
    r6.xyw = r4.yzx * -r6.www + r6.yzx;
    ps = r2.z + r2.z;
    r4.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r17.y = ps;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r4.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = r2.w + r2.w;
    r6 = xe_cube(r6.xyz);
    r17.z = ps;
    ps = 1.0 / abs(r6.z);
    r2.z = r6.w;
    r7.z = ps;
    r2.xy = r6.yx * r7.zz + 1.5;
    r12.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r9.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r16 = tex2D(Texture2D_2, r17.zy);
    r6.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r2.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1 = tex2D(Texture2D_1, r0.xy);
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r5.zxy, r5.zxy);
    ps = 1.0 - r1.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    ps = 6.0 * r7.x;
    r10.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r13.x = ps;
    ps = 6.0 * r7.z;
    r11.yzw = r2.xyz * 0.5;
    r13.y = ps;
    ps = UniformVector_1.x * r6.w;
    r2.yzw = r1.xyz * 2e+01;
    r11.x = ps;
    ps = UniformVector_1.y * r6.w;
    r1.xyz = r11.yzw * r1.www;
    r11.y = ps;
    ps = rsqrt(abs(r6.x));
    r15.xyz = r1.xyz + r2.yzw;
    r6.x = ps;
    ps = UniformVector_1.z * r6.w;
    r14 = r6.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r11.z = ps;
    r6.xyz = r1.www * UniformScalar_0.xxx + r11.xzy;
    r1.xyz = r1.xyz * UniformScalar_1.xxx + r6.xzy;
    ps = 6.0 * r7.w;
    r18.w = dot(r8.xyy, float3(1.0, 1.0, 1.0));
    r13.z = ps;
    r7.x = (r18.w == 0.0) ? r16.x : r16.y;
    ps = log2(abs(r19.z));
    r6.yzw = r18.zww + float3(0.1, -3.0, -2.0);
    r6.x = ps;
    ps = 5.0 * r6.y;
    r5.xy = r14.xy * r5.zz;
    r7.y = saturate(ps);
    r7.z = (r6.w == 0.0) ? r16.z : r7.x;
    r7.x = saturate(r18.z * r8.w + r17.x);
    r7.z = (r6.z == 0.0) ? r16.w : r7.z;
    ps = log2(r7.x);
    r6.yz = -r7.zy + 1.0;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r16.xyz = r15.xyz - r9.xyz;
    r15.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xyz = r6.wyx * float3(15.0, 2.5, 0.0125);
    r15.z = ps;
    ps = pow(2.0, r7.x);
    r6.w = saturate(r7.y - 0.5);
    r6.x = ps;
    r9.xyz = r16.xyz * r6.www + r9.xyz;
    ps = pow(2.0, r7.z);
    r7.xyw = r6.xxx * ConstantLighting.xzy;
    r15.x = ps;
    ps = r7.x;
    r6.xyz = -r15.xyz + 1.0;
    ps = r6.w * ps;
    r0.xyz = r9.xyz * r0.xyz;
    r2.x = ps;
    ps = r7.y;
    r5.zw = r14.zw * r6.yz;
    r6.xyz = r13.xzy * r6.xxx + r12.xzy;
    r6.xyz = r11.xyz * r6.xzy + r2.yzw;
    ps = r6.w * ps;
    r5 = r5 + float4(0.5, 0.5, 0.125, 0.125);
    r2.y = ps;
    r6.xyz = r6.xyz * r6.www + UniformVector_0.xyz;
    r7.xyz = r10.xyz * r9.xyz + r6.xyz;
    ps = r5.z * r5.w;
    r8.xy = abs(r5.xy) * abs(r5.xy);
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    ps = r7.w;
    r4.xyz = r0.xzy * r8.xxx;
    ps = r6.w * ps;
    r5.xyz = r0.xzy * r8.yyy;
    r2.z = ps;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r1.xzy + r7.xzy;
    r7.xyz = r0.xyz * ConstantLighting.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r8.z + r3.w;
    r6.xyz = r7.xyz * r8.zzz + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
