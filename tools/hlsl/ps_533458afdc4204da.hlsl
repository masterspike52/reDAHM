// ps_533458afdc4204da.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041300 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c12); // float
float4 UniformScalar_1 : register(c13); // float
float4 UniformScalar_2 : register(c14); // float
float4 UniformScalar_3 : register(c15); // float
float4 UniformScalar_4 : register(c16); // float
float4 UniformScalar_5 : register(c17); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_5 : register(c11); // float4
float4 UpperSkyColor : register(c19); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    r7.xy = r7.xy * abs(r9.xy);
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r8.xyz = tex2D(Texture2D_3, r0.xy).yxz;
    r10.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r15.xyz = -UniformVector_0.xyz + 1.0;
    r16.w = saturate(ps);
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r9.w = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r0.x = dot(r2.zxy, r2.zxy);
    r8.w = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r7.y = dot(r5.zxy, r5.zxy);
    r12.x = ps;
    r19.xyz = r6.xyz * 2.0 - 1.0;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.w = dot(r19.zxy, r19.zxy);
    r12.y = ps;
    r9.xyz = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r6.yzw = -r10.yzw + r16.xyz;
    r6.x = ps;
    ps = UniformScalar_0.x * r6.y;
    r16.xyz = r8.zzz * UniformVector_3.xzy;
    r17.y = ps;
    ps = UniformScalar_0.x * r6.z;
    r7.yzw = r6.xxx * r5.xyz;
    r17.z = ps;
    ps = rsqrt(abs(r0.x));
    r6.x = dot(r9.xyz, r9.xyz);
    r0.x = ps;
    ps = rsqrt(abs(r9.w));
    r0.xyz = r0.xxx * r2.xzy;
    r2.w = ps;
    r2.xyz = r8.xxx * UniformVector_2.xzy + r16.xyz;
    ps = UniformScalar_0.x * r6.w;
    r18.xyz = r2.www * r4.zxy;
    r17.w = ps;
    ps = rsqrt(abs(r0.w));
    r16.z = max(r18.x, 0.0);
    r8.x = ps;
    r6.yzw = r8.yyy * UniformVector_1.xyz + r2.xzy;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r19.xyz * r8.xxx;
    r6.x = ps;
    r6.yzw = (-abs(r8.www) >= 0.0) ? 1.0 : r6.yzw;
    ps = 0.1 - -r0.y;
    r4.xyz = r9.xyz * r6.xxx;
    r6.x = ps;
    ps = LocalToWorldMatrix[0].z * r8.x;
    r2.xyz = r4.xxx * r1.xyz;
    r17.x = ps;
    ps = 5.0 * r6.x;
    r5.x = dot(r7.wyz, r4.xyz);
    r6.x = saturate(ps);
    r7.yzw = (-abs(r7.xxx) >= 0.0) ? 1.0 : r6.yzw;
    ps = LocalToWorldMatrix[1].z * r8.y;
    r6.z = -r6.x + 1.0;
    r10.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.y = dot(r4.xyz, r18.xyz);
    r16.x = ps;
    ps = UniformScalar_5.x * r7.y;
    r9.xyz = r7.ywz * UniformScalar_2.xxx;
    r6.x = ps;
    ps = UniformScalar_5.x * r7.z;
    r19.xyz = r4.yzx * r6.yyy;
    r6.y = ps;
    ps = UniformScalar_5.x * r7.w;
    r10 = r17 + r10;
    r6.w = ps;
    ps = UniformScalar_3.x * r7.y;
    r4.xyz = r6.xwy * r10.ywz;
    r17.x = ps;
    r5.y = r8.z * LocalToWorldMatrix[2].z + r10.x;
    ps = UniformScalar_3.x * r7.z;
    r6.xyw = r10.yzw * r7.yzw;
    r17.y = ps;
    r8.xyz = r19.xyz * 2.0 - r18.yzx;
    ps = UniformScalar_3.x * r7.w;
    r9.yzw = r9.xyz * r10.ywz;
    r17.z = ps;
    r7.xyz = r17.xyz * r10.yzw + UniformScalar_4.xxx;
    r10.xyz = r7.xzy * UniformVector_4.xzy - r9.yzw;
    ps = ModShadowGroupColor.y * r6.z;
    r0.y = saturate(dot(r0.yxz, r8.zxy));
    r16.y = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r7 = -r16.wxyz + float4(1.0, 1.0, 1.0, 0.55);
    r12.z = ps;
    ps = r7.w;
    r8.xyz = r6.xyw * r15.xyz;
    r6.x = ps;
    ps = 2.2222223 * r6.x;
    r6.w = float((r7.x >= 0.004));
    r0.x = saturate(ps);
    r6.xyz = r5.xxy * float3(-0.5, 0.5, 0.5) + 0.5;
    ps = log2(abs(r6.z));
    r7.xw = abs(r6.xy) * abs(r6.xy);
    r14.x = ps;
    ps = r8.x;
    r5.xyz = r8.xzy * r7.xxx;
    ps = r7.w * ps;
    r6.xyz = r14.yxz * float3(0.875, 0.8, 0.875);
    r9.x = ps;
    r6.xz = r6.xz * r7.yz + 0.125;
    ps = pow(2.0, r6.y);
    r6.x = r6.x * r6.z;
    r0.z = ps;
    r6.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    ps = r8.z;
    r7.xy = r0.xy * r0.zy;
    r10.xyz = r7.xxx * r10.xyz + r9.yzw;
    ps = r7.w * ps;
    r7.y = r7.y * r0.y;
    r9.y = ps;
    ps = r8.y;
    r0.xyz = r7.yyy * r1.xzy;
    r1.xyz = r12.xzy * r11.xyz + r10.xzy;
    ps = r7.w * ps;
    r7.xyz = r1.xyz + UniformVector_0.xyz;
    r9.z = ps;
    r7.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r9.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r0.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r8.xyz + r7.xzy;
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
