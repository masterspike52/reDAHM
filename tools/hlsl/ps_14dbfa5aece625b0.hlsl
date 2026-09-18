// ps_14dbfa5aece625b0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041600 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r14.w;
    r7.w = r2.w - 4e+02;
    r6.w = ps;
    ps = OpacityOverride.x;
    r7.xy = r0.wz * 6.0;
    r21.x = saturate(ps);
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r11.x = ps;
    r7.xyz = tex2D(Texture2D_2, r7.xy).xwy;
    ps = r0.w;
    r13.yz = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_7.x * ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r10.x = ps;
    r10.zw = r7.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r10.y = saturate(r7.w * 0.00022222222);
    r6.w = ps;
    ps = -r0.z;
    r9.yzw = r6.www * r3.xyz;
    ps = 1.0 + ps;
    r21.yzw = r10.zyw * float3(0.5, -0.025, 0.5);
    r6.w = ps;
    ps = UniformVector_2.y * r6.w;
    r11.zw = r9.yz * r21.zz;
    r11.y = ps;
    ps = r0.w;
    r3.yz = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r13.xw = float2((r11.xy >= 0.5));
    r3.x = ps;
    ps = r0.z;
    r3.yz = r3.yz - r11.xy;
    ps = UniformVector_1.y * ps;
    r3.zw = r3.yz * r13.xw;
    r3.y = ps;
    ps = r0.z;
    r12 = r11.zwxy + r3;
    ps = UniformVector_7.y * ps;
    r3.xy = r12.zw + r12.zw;
    r10.y = ps;
    r11.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r22 = tex2D(Texture2D_1, r3.xy);
    r15.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r7.xzw = tex2D(Texture2D_3, r13.yz).wxy;
    ps = r2.w;
    r10.x = dot(r1.zxy, r1.zxy);
    r3 = r5.ywzx * 2.0 - 1.0;
    r6.yzw = r6.xyz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.zw = r7.zw + r7.zw;
    r21.z = saturate(ps);
    ps = r16.x + r16.x;
    r17.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.x = ps;
    ps = r16.y + r16.y;
    r14.yzw = r17.xyz * r14.xyz;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r6.wyz, r6.wyz);
    r13.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = r7.y * r16.z;
    r13.z = ps;
    ps = rsqrt(abs(r10.x));
    r9.x = dot(r3.zwx, r3.zwx);
    r10.x = ps;
    r17.xyz = r10.yzw * 2.0 - 1.0;
    r19.xyz = r15.xyw * 2.0 - 1.0;
    r18.z = r17.z * UniformVector_4.z - r19.z;
    ps = rsqrt(abs(r9.x));
    r10.xyz = r10.xxx * r1.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r16.xyz = r3.xzw * r1.xxx;
    r6.x = ps;
    ps = r9.w;
    r15.xyz = r6.ywz * r6.xxx;
    r6.x = ps;
    ps = 0.0;
    r20 = r5 - 1.0;
    r6.y = ps;
    ps = max(r6.x, r6.y);
    r5.xyz = r16.yzx * r15.zyx;
    r3.w = ps;
    r18.xyw = r16.xyz * r15.yxz - r5.xyz;
    ps = r7.y;
    r10.w = dot(r13.xww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r6.x = (r10.w == 0.0) ? r22.x : r22.y;
    ps = (-1.0) + r5.x;
    r5.yzw = r10.zww + float3(0.1, -3.0, -2.0);
    r1.z = ps;
    ps = 5.0 * r5.y;
    r1.xy = r20.xy + r21.yw;
    r21.y = saturate(ps);
    r5.x = (r5.w == 0.0) ? r22.z : r6.x;
    r3.x = (r5.z == 0.0) ? r22.w : r5.x;
    ps = (-1.0) + r7.x;
    r6.xyz = -r21.xzy + 1.0;
    r1.w = ps;
    r14.x = r1.w * r6.y + 1.0;
    ps = UniformScalar_1.x * r6.y;
    r7.xyz = r18.xyw * r3.yyy;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.y = max(r3.x, 0.0);
    r3.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.y = min(r5.y, 0.3);
    r3.z = ps;
    r5.xw = r5.xx * r20.zw + r17.xy;
    ps = 3.3333333 * r5.y;
    r6.w = dot(r7.zxy, r7.zxy);
    r5.z = ps;
    r9.x = r5.z * r1.z + 1.0;
    r3 = -r3.wxyz + 1.0;
    r5.xy = r5.xw * UniformVector_4.xy - r19.xy;
    r18.xy = r5.zz * r1.xy + r5.xy;
    ps = r3.y;
    r1 = r14.yzwx * r11.xyzx;
    r5.x = ps;
    ps = 2.5 * r5.x;
    r17.yzw = r1.xyz * r14.xxx;
    r17.x = ps;
    r7.w = saturate(r17.x * r9.x - 0.5);
    r5.xy = r18.xy * r7.ww + r19.xy;
    r5.z = r18.z * r7.w - 2.0;
    r5.z = r15.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r6.yyy;
    ps = 1.0 + r5.x;
    r11.w = dot(r4.zxy, r4.zxy);
    r5.w = ps;
    r5.xyz = (r6.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r7.xzy * r6.yyy;
    r5.x = ps;
    r6.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r6.wyz, r9.wyz);
    ps = r13.y;
    r5.xyz = r6.ywz * r5.xxx;
    r9.yzw = r5.xyz * 2.0 - r9.ywz;
    ps = abs(r8.x) * ps;
    r5.xyz = r16.zxy * r9.zzz;
    r13.x = ps;
    r5.xyz = r7.xzy * r9.www + r5.xyz;
    r5.xyw = r15.yzx * r9.yyy + r5.zyx;
    ps = r13.z;
    r7.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    ps = abs(r8.y) * ps;
    r5 = xe_cube(r5.xzy);
    r13.y = ps;
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r7.x = ps;
    r7.xy = r5.yx * r7.xx + 1.5;
    r11.yz = tex2D(ModShadowAccumTexture, r13.xy).xy;
    r5.x = tex2D(Texture2D_5, r0.xy).x;
    r16.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r18.xyz = UniformVector_5.xzy * UniformVector_5.www;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformScalar_9.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r12.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r5.y = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    r13.xyz = r14.ywz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = rsqrt(abs(r11.w));
    r15.xyz = r5.yyy - r0.xyz;
    r5.y = ps;
    r15.xyz = r15.xyz * UniformScalar_6.xxx + r0.xyz;
    ps = log2(abs(r3.x));
    r0.xyz = r5.yyy * r4.xyz;
    r5.y = ps;
    r1.xyz = r17.yzw * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = UniformScalar_3.x * r5.y;
    r15.xyz = r18.xzy * r15.xyz;
    r5.y = ps;
    r4.xyz = r17.yzw * r9.xxx - r16.xyz;
    ps = pow(2.0, r5.y);
    r6.x = float((r6.x >= 0.004));
    r5.y = ps;
    r5.y = r5.y * UniformScalar_5.x + UniformScalar_4.x;
    r4.xyz = r4.xyz * r7.www + r16.xyz;
    ps = UniformScalar_10.x * r5.z;
    r15.xyz = r15.xyz * r5.yyy;
    r15.w = ps;
    ps = r4.x;
    r15.xyz = r15.xzy * r13.xyz;
    ps = r7.x * ps;
    r13.yz = r15.zy * r1.ww;
    r7.x = ps;
    ps = r4.y;
    r5.yz = r15.xw * r11.xx;
    ps = r7.y * ps;
    r13.xw = r5.yz * r14.xx;
    r7.y = ps;
    ps = r4.z;
    r5 = r13.wxzy * r5.xxxx;
    ps = r7.z * ps;
    r1.xyz = r1.xyz + r5.xxx;
    r7.z = ps;
    r5.xyz = r5.yzw * r7.www + UniformVector_0.xzy;
    r4.xyz = r12.xyz * r4.xyz + r5.xzy;
    ps = ConstantLighting.x * r6.w;
    r11.x = dot(r0.zxy, r6.wyz);
    r0.x = ps;
    ps = ConstantLighting.y * r6.w;
    r5 = r11.yxxz * float4(0.875, -0.5, 0.5, 0.875);
    r0.y = ps;
    r3.xy = r5.xw * r3.zw + 0.125;
    ps = ConstantLighting.z * r6.w;
    r5.x = saturate(dot(r10.zxy, r9.zyw));
    r0.z = ps;
    ps = log2(r5.x);
    r9.yz = r5.yz + 0.5;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r9.xyz = abs(r9.xyz) * abs(r9.xyz);
    r5.w = ps;
    ps = r9.x * r9.x;
    r6.yzw = r7.xzy * r9.yyy;
    r3.z = ps;
    ps = pow(2.0, r5.w);
    r5.xyz = r7.xzy * r9.zzz;
    r5.w = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r4.xzy;
    r6.yzw = r6.ywz * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.x * r5.w;
    r3.yz = r3.xz * r3.yz;
    r3.x = ps;
    r5.xyz = r3.yyy * r8.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r5.w;
    r1.xyz = r3.zzz * r1.xyz;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r1.xyz = r1.xzy * r7.www;
    r3.z = ps;
    r6.yzw = r3.xyz * r1.xyz + r6.ywz;
    r6.yzw = r0.xyz * r7.xyz + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.ywz * r5.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xzy - r5.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.x + r2.w;
    r5.xyz = r7.xyz * r6.xxx + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
