// ps_341223b558995f3f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 678 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000A98 10041E00 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c25); // float4
float4 ConstantLighting : register(c26); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c24); // float3
float4 ModShadowAccumResolution : register(c29); // float2
float4 ModShadowColor : register(c27); // float3
float4 ModShadowGroupColor : register(c28); // float3
float4 OpacityOverride : register(c22); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c12); // float
float4 UniformScalar_1 : register(c13); // float
float4 UniformScalar_10 : register(c19); // float
float4 UniformScalar_11 : register(c20); // float
float4 UniformScalar_13 : register(c21); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_7 : register(c16); // float
float4 UniformScalar_8 : register(c17); // float
float4 UniformScalar_9 : register(c18); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UpperSkyColor : register(c23); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
samplerCUBE TextureCube_0 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 r28 = 0.0;
    float4 r29 = 0.0;
    float4 r30 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_13.x;
    r2.y = r0.w * UniformVector_1.x;
    ps = 0.05 * ps;
    r6.w = -r0.z + 1.0;
    r9.x = ps;
    ps = r2.w;
    r12 = r0.wwzz * float4(3.0, 0.5, 3.0, 0.5);
    r11.zw = r7.ww * float2(0.16, -0.8) + r12.xz;
    ps = (-4e+02) + ps;
    r2.z = r6.w * UniformVector_1.y;
    r6.w = ps;
    ps = (-0.5) + r2.y;
    r13.y = float((UniformScalar_7.x >= 1.0));
    r9.z = ps;
    ps = (-0.5) + r2.z;
    r13.zw = float2((r2.yz >= 0.5));
    r9.w = ps;
    ps = 0.00022222222 * r6.w;
    r9.zw = r9.zw - r2.yz;
    r13.x = saturate(ps);
    ps = UniformScalar_8.x - r7.w;
    r22.z = saturate(r7.w * 15.0);
    r9.y = ps;
    r10 = r9 * r13;
    r9.xy = r2.yz + r10.zw;
    r9.xy = r9.xy + r9.xy;
    r9 = tex2D(Texture2D_4, r9.xy).xzwy;
    r26 = tex2D(Texture2D_3, r11.zw);
    r11.y = dot(r3.zxy, r3.zxy);
    r18.zw = r26.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r11.y));
    r11.x = dot(r1.zxy, r1.zxy);
    r11.y = ps;
    ps = rsqrt(abs(r11.x));
    r12.xz = r11.yy * float2(-0.125, 1.0);
    r11.x = ps;
    ps = r12.z;
    r23.yzw = r11.xxx * r1.xyz;
    ps = r3.z * ps;
    r23.x = dot(r13.zww, float3(1.0, 1.0, 1.0));
    r22.x = ps;
    r1.z = (r23.x == 0.0) ? r9.x : r9.w;
    ps = r12.z;
    r1.xyw = r23.xxw + float3(-3.0, -2.0, 0.1);
    ps = r3.x * ps;
    r9.x = r10.y + r7.w;
    r22.y = ps;
    r1.z = (r1.y == 0.0) ? r9.y : r1.z;
    r1.z = (r1.x == 0.0) ? r9.z : r1.z;
    ps = r12.z;
    r1.x = -r9.x + r7.z;
    ps = r3.y * ps;
    r9.x = max(r1.x, UniformScalar_9.x);
    r22.w = ps;
    ps = r22.x;
    r9.y = max(r1.z, 0.0);
    r1.x = ps;
    ps = 0.0;
    r9.xw = min(r9.yx, float2(0.3, 1.0));
    r1.y = ps;
    ps = max(r1.x, r1.y);
    r18.x = r9.x * 3.3333333;
    r18.y = ps;
    ps = (-0.3) * r26.z;
    r1.xy = -r18.yx + 1.0;
    r9.y = ps;
    ps = log2(abs(r1.x));
    r11.y = -r1.z + 1.0;
    r11.x = ps;
    r13 = r11.zwxy * float4(6.0, 6.0, 0.0125, 2.5);
    r15.xyz = tex2D(Texture2D_3, r13.xy).xyw;
    r1.xz = r15.xy * 2.0 - 1.0;
    ps = 0.5 * r1.x;
    r14.z = r22.y * r10.x;
    r27.x = ps;
    ps = 0.5 * r1.z;
    r27.z = r22.z * r1.y;
    r27.y = ps;
    r1.xyz = r18.zwx + r27.xyz;
    ps = 0.01 * r1.x;
    r7.xy = r1.xz * r1.zy;
    r9.z = ps;
    ps = 0.025 * r7.y;
    r14.xy = r9.yz * r1.zz;
    r9.z = ps;
    r14.w = r9.z + r14.x;
    r16.xy = r14.yw + r0.xy;
    r12.zw = tex2D(Texture2D_6, r12.yw).xy;
    r16.z = tex2D(Texture2D_5, r16.xy).w;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xy = r0.wz + r0.wz;
    r16.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.y = saturate(r2.w * 0.0001);
    r16.y = ps;
    ps = r0.z;
    r8.xy = r16.xy * abs(r8.xy);
    r19.y = ps;
    ps = OpacityOverride.x;
    r3.y = r12.x * r3.x;
    r10.z = saturate(ps);
    ps = 1.0 / UniformScalar_0.x;
    r3.x = r22.w * r10.x;
    r3.z = ps;
    ps = 5.0 * r1.w;
    r10.w = saturate(r9.w * r3.z);
    r10.x = saturate(ps);
    ps = r3.x;
    r10 = -r10.wxyz + 1.0;
    ps = r0.z + ps;
    r15.w = r10.x * r7.w;
    r19.z = ps;
    ps = r3.y;
    r15.yz = r15.zw * r26.wz;
    ps = r0.w + ps;
    r19.w = float((r15.z >= 0.05));
    r19.x = ps;
    r1.xy = -r19.zw + 1.0;
    r17.xzw = r14.yxz + r0.xyw;
    ps = UniformVector_1.y * r1.x;
    r16.y = r17.w * UniformVector_1.x;
    r16.x = ps;
    ps = r19.z + r19.z;
    r3.yz = float2((r16.xy >= 0.5));
    r14.y = ps;
    ps = r17.w + r17.w;
    r30.yzw = r16.zxy - 0.5;
    r14.x = ps;
    ps = r17.z;
    r0.xy = r30.zw - r16.xy;
    r12.xy = r0.xy * r3.yz + r16.xy;
    ps = r9.z + ps;
    r0 = r12.wyxz + r12.wyxz;
    r17.y = ps;
    r12 = tex2D(Texture2D_2, r9.xy);
    r21.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r29 = tex2D(Texture2D_4, r0.yz);
    r9.xyz = tex2D(Texture2D_7, r17.xy).xyz;
    r16.yzw = tex2D(Texture2D_0, r14.xy).xyz;
    r17 = tex2D(Texture2D_5, r17.xy);
    ps = -r7.z;
    r14.w = dot(r4.zxy, r4.zxy);
    r20 = r5.yxzw * 2.0 - 1.0;
    r6.yzw = r6.xyz * 2.0 - 1.0;
    ps = 1.0 + ps;
    r7.z = dot(r26.xxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = UniformVector_2.x;
    r5.x = dot(r6.wyz, r6.wyz);
    r5.y = saturate(ps);
    ps = UniformVector_2.y;
    r7.w = dot(r20.zyx, r20.zyx);
    r5.z = saturate(ps);
    ps = r17.w;
    r5.yz = r5.zy * UniformScalar_4.xx;
    r5.w = ps;
    r25.xyz = r9.zxy * 2.0 - 1.0;
    r25.w = r25.x * UniformVector_4.z - 1.0;
    ps = 1.0 / UniformScalar_4.x;
    r3.xw = floor(-r5.yz);
    r5.y = ps;
    ps = rsqrt(abs(r7.w));
    r5.yz = -r3.xw * r5.yy;
    r7.w = ps;
    ps = rsqrt(abs(r5.x));
    r20.xyz = r20.xzy * r7.www;
    r5.x = ps;
    ps = UniformScalar_5.x + r5.y;
    r9.xyz = r6.ywz * r5.xxx;
    r6.y = ps;
    ps = UniformScalar_5.x + r5.z;
    r24.xyz = r20.yzx * r9.zyx;
    r6.z = ps;
    r24.xyz = r20.xyz * r9.yxz - r24.xyz;
    ps = (-0.5) + r5.w;
    r6 = r6.xxyz - r5.yzyz;
    r30.x = ps;
    ps = 1.0 / r6.z;
    r7.w = dot(r26.yyy, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = 1.0 / r6.w;
    r28.yz = r27.xy + r7.zw;
    r5.y = ps;
    ps = r16.y + r16.y;
    r8.zw = saturate(r6.xy * r5.xy);
    r3.x = ps;
    ps = r16.z + r16.z;
    r15.x = dot(r3.zyy, float3(1.0, 1.0, 1.0));
    r3.y = ps;
    r5.z = (r15.x == 0.0) ? r29.x : r29.y;
    ps = r16.w + r16.w;
    r5.xy = saturate(r30.xy * 3.3333333);
    r3.z = ps;
    ps = 1.0 - r5.x;
    r6.xzw = r15.yxx + float3(-1.0, -3.0, -2.0);
    r7.z = ps;
    ps = 1.0 - r5.y;
    r3.w = r6.x * r1.z;
    r7.w = ps;
    r28.x = r8.z * r7.z + r5.x;
    r6.xy = r8.ww * r7.zw + r5.xy;
    r5.y = (r6.w == 0.0) ? r29.z : r5.z;
    r14.z = (r6.z == 0.0) ? r29.w : r5.y;
    ps = r0.w;
    r26.xyz = r28.xyz + r26.zxy;
    r5.y = ps;
    ps = (-1.0) + r5.y;
    r3 = r3 + float4(-1.0, -1.0, -1.0, 1.0);
    r8.z = ps;
    r25.x = saturate(r13.w * r3.w - 0.5);
    ps = (-1.0) + r0.x;
    r6.zw = r26.yz + r27.xy;
    r8.w = ps;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r8 = r8.zxyw * float4(0.036, 0.875, 0.875, 0.036);
    r7.z = ps;
    ps = 1.0 - r6.x;
    r1.z = float((r26.x >= 0.5));
    r5.z = ps;
    r25.yz = r25.yz * UniformVector_4.xy - r8.xw;
    ps = 1.0 - r6.y;
    r6.zw = r6.zw - 2.0;
    r5.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r0 = r6.zwzw * r5.zzww;
    r5.z = ps;
    r6.xy = (-abs(r5.zz) >= 0.0) ? 1.0 : r1.zy;
    r9.w = (-abs(r7.z) >= 0.0) ? r1.y : r6.y;
    r5.zw = (-abs(r5.zz) >= 0.0) ? 0.0 : r0.zw;
    r13.w = (-abs(r7.z) >= 0.0) ? r1.z : r6.x;
    ps = r17.w;
    r6 = r5.xxxx * r25.yzxw;
    r5.x = ps;
    ps = rsqrt(abs(r14.w));
    r1.w = r6.w * r13.w;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r1.xyz = r21.xyz + r21.xyz;
    r5.x = ps;
    r21.xyz = r5.xxx * UniformVector_5.xzy;
    r0.xy = (-abs(r7.zz) >= 0.0) ? r0.xy : r5.zw;
    ps = -r25.x;
    r5.xzw = r5.yyy * r4.xyz;
    ps = r6.z + ps;
    r6.xy = r8.xw + r6.xy;
    r5.y = ps;
    r0.w = r22.z * r5.y + r25.x;
    ps = r17.w;
    r6.xw = r6.xy + r7.xy;
    r5.y = ps;
    ps = r6.x;
    r7.xyz = r24.xyz * r20.www;
    ps = r0.x + ps;
    r1 = r1 + float4(-1.0, -1.0, -1.0, 1.0);
    r0.x = ps;
    ps = r6.w;
    r6.xyz = r1.xyz - r3.xyz;
    r6.w = r6.z * r12.w - 2.0;
    r6.xyz = r6.xyz * r12.www + r3.xyz;
    ps = r0.y + ps;
    r0.z = r1.w - r6.z;
    r0.y = ps;
    r0.xy = r0.xy * r13.ww - r6.xy;
    r6.xyw = r0.xyz * r0.www + r6.xyw;
    ps = UniformScalar_10.x * r5.y;
    r21.w = r6.w + r16.w;
    r16.x = ps;
    ps = r6.x;
    r6.w = dot(r7.zxy, r7.zxy);
    ps = r10.z * ps;
    r4 = r21.xzyw + r16.xxxw;
    r16.x = ps;
    ps = r6.y;
    r14.w = r4.w * r10.z;
    ps = r10.z * ps;
    r16.yw = r14.wz + float2(1.0, -1.0);
    r16.z = ps;
    r6.xyz = (r10.zzz > 0.0) ? r16.xyz : float3(0.0, 1.0, 0.0);
    r6.xyz = (r10.zzz >= 0.0) ? r6.xyz : float3(0.0, 1.0, 0.0);
    ps = rsqrt(abs(r6.w));
    r5.y = dot(r6.yxz, r6.yxz);
    r6.w = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r7.xzy * r6.www;
    r5.y = ps;
    r0.xyz = r6.xyz * r5.yyy;
    r6.x = dot(r5.wxz, r0.yxz);
    r5.x = dot(r0.yxz, r22.xyw);
    r5.xyz = r0.xzy * r5.xxx;
    r5.xyw = r5.yzx * 2.0 - r22.wxy;
    r5.z = saturate(dot(r23.wyz, r5.ywx));
    ps = log2(r5.z);
    r7.xyz = r20.zxy * r5.yyy;
    r6.y = ps;
    r5.xyz = r1.xzy * r5.xxx + r7.xyz;
    r5.xyw = r9.yzx * r5.www + r5.zyx;
    r9.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    r6.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r6.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r3.xyz = r9.xyw + float3(0.5, 0.5, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.zzzz)) clip(-1.0);
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r14.xyz = tex2D(Texture2D_9, r14.xy).xyz;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    r6.yzw = tex2D(Texture2D_8, r19.xy).xyz;
    r1.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r20.xyz = -ModShadowColor.xyz + 1.0;
    r5.xyz = -UniformVector_0.zxy + 1.0;
    r1.xyz = r1.xyz * r17.xyz;
    ps = 6.0 * r6.y;
    r17.xyz = r1.xzy * r17.www;
    r13.x = ps;
    ps = 6.0 * r6.z;
    r19.xyz = r17.xzy - r6.yzw;
    r13.y = ps;
    ps = pow(2.0, r13.z);
    r22.xy = r10.yy * ModShadowGroupColor.xy;
    r22.w = ps;
    ps = 6.0 * r6.w;
    r1 = -r22.wxyz + 1.0;
    r13.z = ps;
    r7.xyz = r13.xzy * r1.xxx + r7.xzy;
    r7.xyz = r21.xzy * r7.xzy;
    r5.w = dot(r7.zxy, float3(0.11, 0.3, 0.59));
    r13.xyz = r5.www - r7.xzy;
    r7.xyz = r18.xxx * r13.xyz + r7.xzy;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r18.xyz = r11.yyy * r7.xzy;
    r8.x = ps;
    ps = abs(r3.w) * abs(r3.w);
    r13.yz = r18.yz * r1.ww;
    r7.x = ps;
    r7.yz = r8.yz * r1.yz + 0.125;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r7.xy = r7.xy * r7.xz;
    r8.y = ps;
    r7.yzw = r7.yyy * r20.xyz + ModShadowColor.xyz;
    r10.xyz = r19.xyz * r13.www + r6.yzw;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r13.x = r0.w * r13.w;
    r8.z = ps;
    ps = r7.x * r7.x;
    r5.w = r13.x * r18.x;
    r3.w = ps;
    ps = r5.w;
    r6.xw = r13.xy * r13.zw;
    ps = r1.w * ps;
    r6.z = r6.w * r0.w;
    r6.y = ps;
    ps = r6.y;
    r7.x = float((r10.w >= 0.004));
    r5.w = ps;
    r4.xyz = r17.zxy * UniformScalar_11.xxx + r4.yxz;
    ps = UniformVector_0.x + r5.w;
    r4.yzw = r3.www * r4.yxz;
    r4.x = ps;
    ps = UniformVector_0.z + r6.x;
    r1.xyz = r4.yzw * r11.yyy;
    r4.y = ps;
    ps = UniformVector_0.y + r6.z;
    r1.yz = r13.xx * r1.yz;
    r4.z = ps;
    r5.w = dot(r16.ww, r1.ww) + 2.25;
    ps = r1.x;
    r5.w = saturate(r5.w - r15.y);
    ps = r13.w * ps;
    r6.xyz = r5.www * r14.xyz;
    r5.w = ps;
    ps = r5.w;
    r13.xyz = -r6.xzy + r12.xzy;
    r6.xyz = r13.xyz * r12.www + r6.xzy;
    r10.xyz = r11.yyy * r10.xyz - r6.xzy;
    ps = r0.w * ps;
    r0.xyz = r0.yyy * ConstantLighting.xyz;
    r1.x = ps;
    r6.xyz = r10.xyz * r0.www + r6.xzy;
    r8.xyz = r8.xzy * r6.xzy + r4.xyz;
    ps = pow(2.0, r9.z);
    r6.xyz = r6.xyz * r5.yzx;
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r5.xy = abs(r3.xy) * abs(r3.xy);
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r6.xzy * r5.xxx;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r5.xyz = r6.xzy * r5.yyy;
    r3.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xyz;
    r5.xyz = r4.xyz * LowerSkyColor.xzy + r5.xyz;
    r5.xyz = r3.xyz * r1.xzy + r5.xyz;
    r5.xyz = r0.xzy * r6.xzy + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r7.ywz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r7.x + r2.w;
    r5.xyz = r6.xyz * r7.xxx + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
