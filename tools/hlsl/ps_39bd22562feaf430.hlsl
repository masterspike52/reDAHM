// ps_39bd22562feaf430.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 444 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006F0 10041700 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c28); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c27); // float3
float4 ModShadowAccumResolution : register(c31); // float2
float4 ModShadowColor : register(c29); // float3
float4 ModShadowGroupColor : register(c30); // float3
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r15.w;
    r8.w = r3.w - 4e+02;
    r7.w = ps;
    ps = OpacityOverride.x;
    r8.xy = r0.wz * 6.0;
    r22.x = saturate(ps);
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r13.x = ps;
    r8.xyz = tex2D(Texture2D_2, r8.xy).xwy;
    ps = r0.w;
    r11.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_7.x * ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r10.z = ps;
    r10.yw = r8.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r10.x = saturate(r8.w * 0.00022222222);
    r7.w = ps;
    ps = -r0.z;
    r20.xyz = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r12.xyz = r10.ywx * float3(0.5, 0.5, -0.025);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r13.zw = r20.xy * r12.zz;
    r13.y = ps;
    ps = r0.w;
    r4.yz = r13.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r17.zw = float2((r13.xy >= 0.5));
    r4.x = ps;
    ps = r0.z;
    r4.yz = r4.yz - r13.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r4.yz * r17.zw;
    r4.y = ps;
    ps = r0.z;
    r14 = r13.zwxy + r4;
    ps = UniformVector_7.y * ps;
    r10.xy = r14.zw + r14.zw;
    r10.w = ps;
    r4.xyw = tex2D(Texture2D_7, r10.zw).yzx;
    r23 = tex2D(Texture2D_1, r10.xy);
    r13.xyz = tex2D(Texture2D_0, r14.xy).xyz;
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r8.xzw = tex2D(Texture2D_3, r11.xy).wxy;
    ps = r3.w;
    r10.x = dot(r2.zxy, r2.zxy);
    r11 = r6.ywzx * 2.0 - 1.0;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.zw = r8.zw + r8.zw;
    r22.z = saturate(ps);
    ps = r16.x + r16.x;
    r18.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = ps;
    ps = r16.y + r16.y;
    r15.yzw = r18.xyz * r15.xyz;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r7.wyz, r7.wyz);
    r17.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = r8.y * r16.z;
    r17.y = ps;
    ps = rsqrt(abs(r10.x));
    r4.z = dot(r11.zwx, r11.zwx);
    r10.x = ps;
    r16.xyz = r10.yzw * 2.0 - 1.0;
    r13.xyw = r13.xyz * 2.0 - 1.0;
    r21.z = r16.z * UniformVector_4.z - r13.w;
    ps = rsqrt(abs(r4.z));
    r10.xyz = r10.xxx * r2.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r7.x));
    r19.xyz = r11.xzw * r2.xxx;
    r7.x = ps;
    ps = r20.z;
    r18.xyz = r7.ywz * r7.xxx;
    r7.x = ps;
    ps = 0.0;
    r2 = r6 - 1.0;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r6.xyz = r19.yzx * r18.zyx;
    r11.w = ps;
    r21.xyw = r19.xyz * r18.yxz - r6.xyz;
    ps = r8.y;
    r10.w = dot(r17.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r7.x = (r10.w == 0.0) ? r23.x : r23.y;
    ps = (-1.0) + r6.x;
    r6.yzw = r10.zww + float3(0.1, -3.0, -2.0);
    r12.z = ps;
    ps = 5.0 * r6.y;
    r12.xy = r2.xy + r12.xy;
    r22.y = saturate(ps);
    r6.x = (r6.w == 0.0) ? r23.z : r7.x;
    r11.x = (r6.z == 0.0) ? r23.w : r6.x;
    ps = (-1.0) + r8.x;
    r7.xyz = -r22.xzy + 1.0;
    r12.w = ps;
    r15.x = r12.w * r7.y + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r8.xyz = r21.xyw * r11.yyy;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r6.y = max(r11.x, 0.0);
    r11.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.y = min(r6.y, 0.3);
    r11.z = ps;
    r6.xw = r6.xx * r2.zw + r16.xy;
    ps = 3.3333333 * r6.y;
    r7.w = dot(r8.zxy, r8.zxy);
    r6.z = ps;
    r2.x = r6.z * r12.z + 1.0;
    r11 = -r11.wxyz + 1.0;
    r6.xy = r6.xw * UniformVector_4.xy - r13.xy;
    r21.xy = r6.zz * r12.xy + r6.xy;
    ps = r11.y;
    r12 = r15 * r4.wwxy;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r16.yzw = r12.yzw * r15.xxx;
    r16.x = ps;
    r8.w = saturate(r16.x * r2.x - 0.5);
    r6.xy = r21.xy * r8.ww + r13.xy;
    r6.z = r21.z * r8.w - 2.0;
    r6.z = r13.z * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r4.z = UniformScalar_9.x * (-XE_FLT_MAX);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r8.xzy * r7.yyy;
    r6.x = ps;
    r13.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r13.zxy, r20.zxy);
    ps = r17.x;
    r6.xyz = r13.xzy * r6.xxx;
    r2.yzw = r6.xyz * 2.0 - r20.xzy;
    ps = abs(r9.x) * ps;
    r6.xyz = r19.zxy * r2.zzz;
    r7.y = ps;
    r6.xyz = r8.xzy * r2.www + r6.xyz;
    r6.xyw = r18.yzx * r2.yyy + r6.zyx;
    ps = r17.y;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xzy);
    r7.w = ps;
    ps = 1.0 / abs(r6.z);
    r9.z = r6.w;
    r8.x = ps;
    r9.xy = r6.yx * r8.xx + 1.5;
    r12.yz = tex2D(ModShadowAccumTexture, r7.yw).xy;
    r0.y = tex2D(Texture2D_5, r0.xy).x;
    r8.xyz = tex2D(Texture2D_8, r14.xy).xyz;
    r14.xyz = texCUBE(TextureCube_0, xe_cube_dir(r9.xyz)).xyz;
    ps = UniformVector_5.x * UniformVector_5.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r17.x = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r7.y = dot(r5.zxy, r5.zxy);
    r17.y = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r17.z = ps;
    ps = pow(2.0, r4.z);
    r7.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r6.w = ps;
    r0.xzw = r15.ywz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = rsqrt(abs(r7.y));
    r18.xyz = r7.www - r14.xyz;
    r7.y = ps;
    r14.xyz = r18.xyz * UniformScalar_6.xxx + r14.xyz;
    ps = log2(abs(r11.x));
    r5.xyz = r7.yyy * r5.xyz;
    r7.y = ps;
    r4.xyz = r16.yzw * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = UniformScalar_3.x * r7.y;
    r14.xyz = r17.xzy * r14.xyz;
    r7.w = ps;
    r16.xyz = r16.yzw * r2.xxx - r8.xyz;
    ps = pow(2.0, r7.w);
    r7.x = float((r7.x >= 0.004));
    r7.y = ps;
    r5.w = r7.y * UniformScalar_5.x + UniformScalar_4.x;
    r7.yzw = r16.xyz * r8.www + r8.xyz;
    r8.xyz = r7.yzw * r6.yzx;
    r14.xyz = r14.xyz * r5.www;
    r16.xyz = r14.xzy * r0.xzw;
    ps = UniformScalar_10.x * r6.w;
    r14.yz = r16.zy * r12.xx;
    r16.w = ps;
    r0.xz = r16.xw * r4.ww;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r14.xw = r0.xz * r15.xx;
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r14 = r14.wxzy * r0.yyyy;
    r0.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r4.xyz = r4.xyz + r14.xxx;
    r0.z = ps;
    r6.xyz = r14.yzw * r8.www + UniformVector_0.xzy;
    r7.yzw = r0.xyz * r7.yzw + r6.xzy;
    r0.xyz = r13.zzz * r1.xyz;
    r12.x = dot(r5.zxy, r13.zxy);
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.yz = r5.zw * r11.zw + 0.125;
    r6.x = saturate(dot(r10.zxy, r2.zyw));
    ps = log2(r6.x);
    r2.yz = r5.xy + 0.5;
    r6.x = ps;
    r2.xyw = abs(r2.yzx) * abs(r2.yzx);
    ps = 15.0 * r6.x;
    r5.xyz = r8.xzy * r2.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r10.xyz = r8.xzy * r2.yyy;
    r6.x = ps;
    ps = r2.w * r2.w;
    r2.xyz = r6.xxx * r1.xzy;
    r6.w = ps;
    r7.yzw = r10.xyz * UpperSkyColor.xzy + r7.ywz;
    r7.yzw = r5.xzy * LowerSkyColor.xyz + r7.ywz;
    r6.xw = r6.yw * r6.zw;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r1.xyz = r6.www * r4.xyz;
    r1.xyz = r1.xzy * r8.www;
    r7.yzw = r2.xyz * r1.xyz + r7.ywz;
    r7.yzw = r0.xyz * r8.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.ywz * r6.xzy;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xzy - r6.xzy;
    r8.w = ps;
    oC0.w = r8.w * r7.x + r3.w;
    r6.xyz = r8.xyz * r7.xxx + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
