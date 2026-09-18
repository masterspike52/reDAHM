// ps_d8332c63ce4c98cc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 279 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000045C 10041400 00000A0A 00000000 0000A14A 007F03FF 00000001 0000F050 0000F151 0000F253 0000F354 0000F456 0000F557 0000F658 0000F7A0 0000F8A1 0000F9A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
//   interpolator: r9 <-> COLOR2 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord3 : TEXCOORD3; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
    float4 color0 : COLOR0; // r7
    float4 color1 : COLOR1; // r8
    float4 color2 : COLOR2; // r9
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord3;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = In.color0;
    float4 r8 = In.color1;
    float4 r9 = In.color2;
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
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r20.x = ps;
    ps = OpacityOverride.x;
    r11.w = dot(r5.zxy, r5.zxy);
    r8.w = saturate(ps);
    r11.xyz = r8.xyz * 2.0 - 1.0;
    r9 = r7.wxzy * 2.0 - 1.0;
    ps = -r0.z;
    r7.y = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r8.y = dot(r9.zyw, r9.zyw);
    r7.x = ps;
    ps = rsqrt(abs(r7.y));
    r8.z = dot(r11.zxy, r11.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r11.w));
    r19.xyz = r7.yyy * r3.xyz;
    r7.y = ps;
    ps = UniformVector_2.y * r7.x;
    r7.yzw = r7.yyy * r5.zyx;
    r20.y = ps;
    ps = rsqrt(abs(r8.z));
    r8.x = max(r7.y, 0.0);
    r7.x = ps;
    ps = rsqrt(abs(r8.y));
    r5.xyz = r11.xzy * r7.xxx;
    r7.x = ps;
    ps = r19.x;
    r12.xyz = r9.wzy * r7.xxx;
    r9.w = r7.y * 2.0 - r7.y;
    ps = -r7.w * ps;
    r11.xyz = r12.zxy * r9.www;
    r3.x = ps;
    ps = 1.0 - r8.x;
    r3.yzw = r12.yzx * r5.zyx;
    r20.z = ps;
    r3.yzw = r12.xyz * r5.yxz - r3.yzw;
    ps = 1.0 - r8.w;
    r12.xyz = r3.yzw * r9.xxx;
    r20.w = ps;
    ps = r19.y;
    r8.yz = r20.yx - 0.5;
    ps = -r7.z * ps;
    r9.xyz = float3((r20.xyw >= float3(0.5, 0.5, 0.004)));
    r3.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r12.zxy, r12.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r7.x));
    r8.yz = r8.yz - r20.yx;
    r7.x = ps;
    r3.zw = r8.yz * r9.yx + r20.yx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = r12.xyz * r7.xxx;
    r8.y = ps;
    r7.xyz = r12.xzy * -r7.zzz + r11.xzy;
    ps = r3.x + r3.y;
    r8.xy = r8.xy * abs(r10.xy);
    r18.x = ps;
    r7.xyw = r5.yzx * -r7.www + r7.yzx;
    ps = r3.z + r3.z;
    r5.xyz = r7.xxx * LocalToWorldMatrix[2].xzy;
    r18.y = ps;
    r7.xyz = r7.yyy * LocalToWorldMatrix[1].xzy + r5.xyz;
    r7.xyz = r7.www * LocalToWorldMatrix[0].xyz + r7.xzy;
    ps = r3.w + r3.w;
    r7 = xe_cube(r7.xyz);
    r18.z = ps;
    ps = 1.0 / abs(r7.z);
    r3.z = r7.w;
    r8.z = ps;
    r3.xy = r7.yx * r8.zz + 1.5;
    r13.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r17 = tex2D(Texture2D_2, r18.zy);
    r7.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r3.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1 = tex2D(Texture2D_1, r0.xy);
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r6.zxy, r6.zxy);
    ps = 1.0 - r1.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    ps = 6.0 * r8.x;
    r11.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r14.x = ps;
    ps = 6.0 * r8.z;
    r12.yzw = r3.xyz * 0.5;
    r14.y = ps;
    ps = UniformVector_1.x * r7.w;
    r3.yzw = r1.xyz * 2e+01;
    r12.x = ps;
    ps = UniformVector_1.y * r7.w;
    r1.xyz = r12.yzw * r1.www;
    r12.y = ps;
    ps = rsqrt(abs(r7.x));
    r16.xyz = r1.xyz + r3.yzw;
    r7.x = ps;
    ps = UniformVector_1.z * r7.w;
    r15 = r7.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r12.z = ps;
    r7.xyz = r1.www * UniformScalar_0.xxx + r12.xzy;
    r1.xyz = r1.xyz * UniformScalar_1.xxx + r7.xzy;
    ps = 6.0 * r8.w;
    r19.w = dot(r9.xyy, float3(1.0, 1.0, 1.0));
    r14.z = ps;
    r8.x = (r19.w == 0.0) ? r17.x : r17.y;
    ps = log2(abs(r20.z));
    r7.yzw = r19.zww + float3(0.1, -3.0, -2.0);
    r7.x = ps;
    ps = 5.0 * r7.y;
    r6.xy = r15.xy * r6.zz;
    r8.y = saturate(ps);
    r8.z = (r7.w == 0.0) ? r17.z : r8.x;
    r8.x = saturate(r19.z * r9.w + r18.x);
    r8.z = (r7.z == 0.0) ? r17.w : r8.z;
    ps = log2(r8.x);
    r7.yz = -r8.zy + 1.0;
    r7.w = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r17.xyz = r16.xyz - r10.xyz;
    r16.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r8.xyz = r7.wyx * float3(15.0, 2.5, 0.0125);
    r16.z = ps;
    ps = pow(2.0, r8.x);
    r7.w = saturate(r8.y - 0.5);
    r7.x = ps;
    r10.xyz = r17.xyz * r7.www + r10.xyz;
    ps = pow(2.0, r8.z);
    r8.xyw = r7.xxx * r2.xzy;
    r16.x = ps;
    ps = r8.x;
    r7.xyz = -r16.xyz + 1.0;
    ps = r7.w * ps;
    r0.xyz = r10.xyz * r0.xyz;
    r3.x = ps;
    ps = r8.y;
    r6.zw = r15.zw * r7.yz;
    r7.xyz = r14.xzy * r7.xxx + r13.xzy;
    r7.xyz = r12.xyz * r7.xzy + r3.yzw;
    ps = r7.w * ps;
    r6 = r6 + float4(0.5, 0.5, 0.125, 0.125);
    r3.y = ps;
    r7.xyz = r7.xyz * r7.www + UniformVector_0.xyz;
    r8.xyz = r11.xyz * r10.xyz + r7.xyz;
    ps = r6.z * r6.w;
    r9.xy = abs(r6.xy) * abs(r6.xy);
    r7.x = ps;
    r7.xyz = r7.xxx * r5.xyz + ModShadowColor.xyz;
    ps = r8.w;
    r5.xyz = r0.xzy * r9.xxx;
    ps = r7.w * ps;
    r6.xyz = r0.xzy * r9.yyy;
    r3.z = ps;
    r8.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r8.xyz = r5.xzy * LowerSkyColor.xyz + r8.xzy;
    r8.xyz = r3.xyz * r1.xzy + r8.xzy;
    r8.xyz = r0.xyz * r2.xyz + r8.xzy;
    ps = -r4.w;
    r7.xyz = r8.xzy * r7.xzy;
    ps = OpacityOverride.x + ps;
    r8.xyz = r7.xzy - r7.xzy;
    r8.w = ps;
    oC0.w = r8.w * r9.z + r4.w;
    r7.xyz = r8.xyz * r9.zzz + r7.xzy;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
