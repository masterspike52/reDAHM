// ps_97005af4b2438ec9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c28); // float4
float4 ConstantLighting : register(c29); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c27); // float3
float4 ModShadowAccumResolution : register(c32); // float2
float4 ModShadowColor : register(c30); // float3
float4 ModShadowGroupColor : register(c31); // float3
float4 OpacityOverride : register(c25); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c13); // float
float4 UniformScalar_1 : register(c14); // float
float4 UniformScalar_10 : register(c22); // float
float4 UniformScalar_13 : register(c23); // float
float4 UniformScalar_14 : register(c24); // float
float4 UniformScalar_3 : register(c15); // float
float4 UniformScalar_4 : register(c16); // float
float4 UniformScalar_5 : register(c17); // float
float4 UniformScalar_6 : register(c18); // float
float4 UniformScalar_7 : register(c19); // float
float4 UniformScalar_8 : register(c20); // float
float4 UniformScalar_9 : register(c21); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UniformVector_7 : register(c12); // float4
float4 UpperSkyColor : register(c26); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
samplerCUBE TextureCube_0 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r8 = 0.0;
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r14.w;
    r11.x = r1.x * UniformVector_2.x;
    r7.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    ps = OpacityOverride.x;
    r0.zw = r1.xy * 6.0;
    r22.x = saturate(ps);
    r10.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    ps = (-4e+02) - -r3.w;
    r0.z = ps;
    ps = r1.x;
    r1.zw = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_7.x * ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r12.z = ps;
    r11.zw = r10.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r11.y = saturate(r0.z * 0.00022222222);
    r7.w = ps;
    ps = -r1.y;
    r9.yzw = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r17.xyw = r11.zwy * float3(0.5, 0.5, -0.025);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r11.zw = r9.yz * r17.ww;
    r11.y = ps;
    ps = r1.x;
    r4.yz = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r0.zw = float2((r11.xy >= 0.5));
    r4.x = ps;
    ps = r1.y;
    r4.yz = r4.yz - r11.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r4.yz * r0.zw;
    r4.y = ps;
    ps = r1.y;
    r11 = r11.zwxy + r4;
    ps = UniformVector_7.y * ps;
    r12.xy = r11.zw + r11.zw;
    r12.w = ps;
    r4.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r23 = tex2D(Texture2D_1, r12.xy);
    r12.xyz = tex2D(Texture2D_0, r11.xy).zxy;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r1.xy).xwy;
    r1.xzw = tex2D(Texture2D_3, r1.zw).wxy;
    ps = r3.w;
    r9.x = dot(r2.zxy, r2.zxy);
    r15 = r6.yxzw * 2.0 - 1.0;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.zw = r1.zw + r1.zw;
    r22.z = saturate(ps);
    ps = r13.x + r13.x;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = ps;
    ps = r13.z + r13.z;
    r14.yzw = r16.xyz * r14.xyz;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r7.wyz, r7.wyz);
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.y = r10.w * r13.y;
    r13.y = ps;
    ps = rsqrt(abs(r9.x));
    r4.w = dot(r15.zyx, r15.zyx);
    r9.x = ps;
    r18.xyz = r10.xyz * 2.0 - 1.0;
    r19.xyz = r12.yzx * 2.0 - 1.0;
    r18.z = r18.z * UniformVector_4.z - r19.z;
    ps = rsqrt(abs(r4.w));
    r10.xyz = r9.xxx * r2.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r7.x));
    r16.xyz = r15.xzy * r2.xxx;
    r7.x = ps;
    ps = r9.w;
    r12.yzw = r7.ywz * r7.xxx;
    r7.x = ps;
    ps = 0.0;
    r20 = r6 - 1.0;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r6.xyz = r16.yzx * r12.wzy;
    r17.w = ps;
    r21.xyz = r16.xyz * r12.zyw - r6.xyz;
    ps = r1.y;
    r10.w = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r7.x = (r10.w == 0.0) ? r23.x : r23.y;
    ps = (-1.0) + r6.x;
    r6.yzw = r10.zww + float3(0.1, -3.0, -2.0);
    r2.z = ps;
    ps = 5.0 * r6.y;
    r2.xy = r20.xy + r17.xy;
    r22.y = saturate(ps);
    r6.x = (r6.w == 0.0) ? r23.z : r7.x;
    r17.x = (r6.z == 0.0) ? r23.w : r6.x;
    ps = (-1.0) + r1.x;
    r7.xyz = -r22.xzy + 1.0;
    r2.w = ps;
    r14.x = r2.w * r7.y + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r15.xyz = r21.xyz * r15.www;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r6.y = max(r17.x, 0.0);
    r17.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.y = min(r6.y, 0.3);
    r17.z = ps;
    r6.xw = r6.xx * r20.zw + r18.xy;
    ps = 3.3333333 * r6.y;
    r7.w = dot(r15.zxy, r15.zxy);
    r6.z = ps;
    r9.x = r6.z * r2.z + 1.0;
    r1 = -r17.wxyz + 1.0;
    r6.xy = r6.xw * UniformVector_4.xy - r19.xy;
    r18.xy = r6.zz * r2.xy + r6.xy;
    ps = r1.y;
    r2 = r14.yzwx * r4.xyzx;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r17.yzw = r2.xyz * r14.xxx;
    r17.x = ps;
    r0.w = saturate(r17.x * r9.x - 0.5);
    r6.xy = r18.xy * r0.ww + r19.xy;
    r6.z = r18.z * r0.w - 2.0;
    r6.z = r12.x * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r4.w = dot(r5.zxy, r5.zxy);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r15.xyz = r15.xzy * r7.yyy;
    r6.x = ps;
    r7.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r7.wyz, r9.wyz);
    ps = r13.x;
    r6.xyz = r7.ywz * r6.xxx;
    r9.yzw = r6.xyz * 2.0 - r9.ywz;
    ps = abs(r8.x) * ps;
    r6.xyz = r16.zxy * r9.zzz;
    r12.x = ps;
    r6.xyz = r15.xzy * r9.www + r6.xyz;
    r6.xyw = r12.zwy * r9.yyy + r6.zyx;
    ps = r13.y;
    r12.yzw = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r12.yzw;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r6.xzy);
    r12.y = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r0.z = ps;
    r8.xy = r6.yx * r0.zz + 1.5;
    r4.yz = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r6.x = tex2D(Texture2D_5, r0.xy).x;
    r16.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r18.xyz = UniformVector_5.xzy * UniformVector_5.www;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformScalar_9.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r6.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    r13.xyz = r14.ywz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = rsqrt(abs(r4.w));
    r15.xyz = r6.yyy - r11.xyz;
    r6.y = ps;
    r15.xyz = r15.xyz * UniformScalar_6.xxx + r11.xyz;
    ps = log2(abs(r1.x));
    r11.xyz = r6.yyy * r5.xyz;
    r6.y = ps;
    r2.xyz = r17.yzw * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = UniformScalar_3.x * r6.y;
    r15.xyz = r18.xzy * r15.xyz;
    r6.y = ps;
    r5.xyz = r17.yzw * r9.xxx - r16.xyz;
    ps = pow(2.0, r6.y);
    r7.x = float((r7.x >= 0.004));
    r6.y = ps;
    r6.y = r6.y * UniformScalar_5.x + UniformScalar_4.x;
    r5.xyz = r5.xyz * r0.www + r16.xyz;
    ps = UniformScalar_10.x * r6.z;
    r15.xyz = r15.xyz * r6.yyy;
    r15.w = ps;
    ps = r5.x;
    r15.xyz = r15.xzy * r13.xyz;
    ps = r0.x * ps;
    r13.yz = r15.zy * r2.ww;
    r0.x = ps;
    ps = r5.y;
    r6.yz = r15.xw * r4.xx;
    ps = r0.y * ps;
    r13.xw = r6.yz * r14.xx;
    r0.y = ps;
    ps = r5.z;
    r6 = r13.wxzy * r6.xxxx;
    ps = r0.z * ps;
    r2.xyz = r2.xyz + r6.xxx;
    r0.z = ps;
    r6.xyz = r6.yzw * r0.www + UniformVector_0.xzy;
    r5.xyz = r12.xyz * r5.xyz + r6.xzy;
    ps = ConstantLighting.x * r7.w;
    r4.x = dot(r11.zxy, r7.wyz);
    r1.x = ps;
    ps = ConstantLighting.y * r7.w;
    r6 = r4.yxxz * float4(0.875, -0.5, 0.5, 0.875);
    r1.y = ps;
    r4.xy = r6.xw * r1.zw + 0.125;
    ps = ConstantLighting.z * r7.w;
    r6.x = saturate(dot(r10.zxy, r9.zyw));
    r1.z = ps;
    ps = log2(r6.x);
    r9.yz = r6.yz + 0.5;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r9.xyz = abs(r9.xyz) * abs(r9.xyz);
    r6.w = ps;
    ps = r9.x * r9.x;
    r7.yzw = r0.xzy * r9.yyy;
    r4.z = ps;
    ps = pow(2.0, r6.w);
    r6.xyz = r0.xzy * r9.zzz;
    r6.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r5.xzy;
    r7.yzw = r7.ywz * LowerSkyColor.xyz + r6.xzy;
    ps = ConstantLighting.x * r6.w;
    r4.yz = r4.xz * r4.yz;
    r4.x = ps;
    r6.xyz = r4.yyy * r8.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r6.w;
    r2.xyz = r4.zzz * r2.xyz;
    r4.y = ps;
    ps = ConstantLighting.y * r6.w;
    r2.xyz = r2.xzy * r0.www;
    r4.z = ps;
    r7.yzw = r4.xyz * r2.xyz + r7.ywz;
    r7.yzw = r1.xyz * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.ywz * r6.xzy;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xzy - r6.xzy;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
