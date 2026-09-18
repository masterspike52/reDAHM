// ps_81d06ac4a4b69ead.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 717 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000B34 10041F00 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c25); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c24); // float3
float4 ModShadowAccumResolution : register(c28); // float2
float4 ModShadowColor : register(c26); // float3
float4 ModShadowGroupColor : register(c27); // float3
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
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 r28 = 0.0;
    float4 r29 = 0.0;
    float4 r30 = 0.0;
    float4 r31 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_13.x;
    ps = 0.05 * ps;
    r7.w = -r0.z + 1.0;
    r10.x = ps;
    ps = OpacityOverride.x;
    r18 = r0.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r20.z = saturate(ps);
    r13.zw = r8.ww * float2(0.16, -0.8) + r18.xy;
    ps = UniformVector_1.x * r0.w;
    r3.y = ps;
    ps = r3.w;
    r28.y = saturate(r8.w * 15.0);
    ps = (-4e+02) + ps;
    r3.z = r7.w * UniformVector_1.y;
    r7.w = ps;
    ps = (-0.5) + r3.y;
    r11.y = float((UniformScalar_7.x >= 1.0));
    r8.x = ps;
    ps = (-0.5) + r3.z;
    r11.zw = float2((r3.yz >= 0.5));
    r8.y = ps;
    r10.zw = r8.xy - r3.yz;
    ps = 0.00022222222 * r7.w;
    r10.y = -r8.w + UniformScalar_8.x;
    r11.x = saturate(ps);
    r19 = r10 * r11;
    r7.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r7.w));
    r3.yz = r3.yz + r19.zw;
    r7.w = ps;
    r8.xy = r3.yz + r3.yz;
    r10 = tex2D(Texture2D_4, r8.xy);
    r9.zw = r7.ww * float2(1.0, -0.125);
    r3.x = dot(r11.zww, float3(1.0, 1.0, 1.0));
    r7.w = (r3.x == 0.0) ? r10.x : r10.y;
    r29 = tex2D(Texture2D_3, r13.zw);
    r3.yz = r29.xy + r29.xy;
    r12 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r7.w = (r12.y == 0.0) ? r10.z : r7.w;
    r15.x = (r12.x == 0.0) ? r10.w : r7.w;
    ps = UniformVector_2.x;
    r15.yzw = r9.zzz * r4.zxy;
    r9.z = saturate(ps);
    r10.xy = max(r15.yx, 0.0);
    ps = 1.0 - r10.x;
    r7.w = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    ps = log2(abs(r8.x));
    r11.x = r29.z * (-0.3);
    r13.x = ps;
    ps = rsqrt(abs(r7.w));
    r13.y = -r15.x + 1.0;
    r7.w = ps;
    r30 = r13.zwxy * float4(6.0, 6.0, 0.0125, 2.5);
    r14.xyz = tex2D(Texture2D_3, r30.xy).xyw;
    r3.xz = r14.xy * 2.0 - 1.0;
    r8.x = r19.y + r8.w;
    ps = 0.5 * r3.z;
    r4.yzw = r7.www * r2.xyz;
    r27.z = ps;
    ps = 0.5 * r3.x;
    r8.x = -r8.x + r8.z;
    r27.y = ps;
    ps = 0.1 + r4.w;
    r2.xz = r12.zw + r27.yz;
    r7.w = ps;
    ps = 5.0 * r7.w;
    r10.z = max(r8.x, UniformScalar_9.x);
    r28.x = saturate(ps);
    ps = 1.0 / UniformScalar_0.x;
    r8.xy = min(r10.zy, float2(1.0, 0.3));
    r7.w = ps;
    ps = pow(2.0, r30.z);
    r28.w = saturate(r8.x * r7.w);
    r28.z = ps;
    r17 = -r28.wzxy + 1.0;
    ps = 3.3333333 * r8.y;
    r20.xy = r17.zz * ModShadowGroupColor.xy;
    r20.w = ps;
    ps = 0.01 * r2.x;
    r10 = -r20.zwxy + 1.0;
    r11.y = ps;
    r2.y = r28.y * r10.y + r20.w;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.w = r17.x * r8.w;
    r12.z = ps;
    ps = r15.z;
    r16.yz = r14.zw * r29.wz;
    r14.zw = r2.xy * r2.yz;
    r7.w = r14.w * 0.025;
    r11.xy = r11.xy * r2.yy;
    ps = r19.x * ps;
    r11.w = r7.w + r11.x;
    r11.z = ps;
    r8.y = r9.w * r4.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r22.y = r0.z;
    r12.w = ps;
    ps = UniformVector_2.y;
    r8.x = r15.w * r19.x;
    r9.w = saturate(ps);
    ps = r8.x;
    ps = r0.z + ps;
    r22.z = ps;
    ps = r8.y;
    r2.xz = r11.yw + r0.xy;
    ps = r0.w + ps;
    r22.w = float((r16.z >= 0.05));
    r22.x = ps;
    ps = r0.w + r0.w;
    r8.yw = -r22.wz + 1.0;
    r14.x = ps;
    r11.xzw = r11.yxz + r0.xyw;
    ps = UniformVector_1.y * r8.w;
    r0.y = r11.w * UniformVector_1.x;
    r0.x = ps;
    r0.w = tex2D(Texture2D_5, r2.xz).w;
    ps = r11.w + r11.w;
    r19.yzw = r0.wxy - 0.5;
    r3.x = ps;
    ps = r22.z + r22.z;
    r2.xz = r19.zw - r0.xy;
    r3.y = ps;
    ps = r11.z;
    ps = r7.w + ps;
    r11.y = ps;
    r21 = tex2D(Texture2D_5, r11.xy);
    r24 = r6.yxzw * 2.0 - 1.0;
    ps = r21.w;
    r6.zw = r9.wz * UniformScalar_4.xx;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r8.x = dot(r24.zyx, r24.zyx);
    r19.x = ps;
    r6.xy = saturate(r19.xy * 3.3333333);
    r9.zw = float2((r0.xy >= 0.5));
    r12.xy = r2.xz * r9.zw + r0.xy;
    ps = r0.z + r0.z;
    r9.xy = r12.zw * abs(r9.xy);
    r14.y = ps;
    r12.zw = tex2D(Texture2D_6, r18.zw).xy;
    r0 = r12.wyxz + r12.wyxz;
    r19.xyz = tex2D(Texture2D_1, r14.xy).xyz;
    r18.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r25 = tex2D(Texture2D_4, r0.yz);
    r2.xzw = tex2D(Texture2D_0, r3.xy).xzy;
    ps = r2.w + r2.w;
    r16.x = dot(r9.wzz, float3(1.0, 1.0, 1.0));
    r23.y = ps;
    r0.y = (r16.x == 0.0) ? r25.x : r25.y;
    ps = r2.z + r2.z;
    r26.xyz = r16.xxy + float3(-3.0, -2.0, -1.0);
    r23.z = ps;
    ps = -r8.z;
    r7.w = dot(r5.zxy, r5.zxy);
    r9.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 + ps;
    r31.x = ps;
    ps = rsqrt(abs(r8.x));
    r7.x = dot(r9.zxy, r9.zxy);
    r7.y = ps;
    r12.xyz = r24.xzy * r7.yyy;
    ps = 1.0 / UniformScalar_4.x;
    r7.yz = floor(-r6.zw);
    r6.z = ps;
    ps = rsqrt(abs(r7.x));
    r6.zw = -r7.yz * r6.zz;
    r7.x = ps;
    ps = UniformScalar_5.x + r6.z;
    r9.xyz = r9.xzy * r7.xxx;
    r31.y = ps;
    ps = UniformScalar_5.x + r6.w;
    r7.xyz = r12.yzx * r9.zyx;
    r31.z = ps;
    r7.xyz = r12.xyz * r9.yxz - r7.xyz;
    r31 = r31.xxyz - r6.zwzw;
    ps = r2.x + r2.x;
    r8.x = dot(r29.xxx, float3(1.0, 1.0, 1.0));
    r23.x = ps;
    ps = r0.w;
    r23.w = r26.z * r2.y;
    r6.w = ps;
    ps = (-1.0) + r6.w;
    r23 = r23 + float4(-1.0, -1.0, -1.0, 1.0);
    r18.z = ps;
    r27.x = saturate(r30.w * r23.w - 0.5);
    ps = 1.0 / r31.z;
    r8.z = dot(r29.yyy, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    ps = 1.0 / r31.w;
    r30.yz = r27.yz + r8.xz;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r8.xz = saturate(r31.xy * r6.zw);
    r6.z = ps;
    ps = 1.0 - r6.y;
    r6.w = ps;
    r30.x = r8.x * r6.z + r6.x;
    r6.yz = r8.zz * r6.zw + r6.xy;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r29.xyz = r30.xyz + r29.zxy;
    r6.w = ps;
    ps = (-1.0) + r0.x;
    r0.zw = r29.yz + r27.yz;
    r18.w = ps;
    r11.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r11.xyz = r11.xyz * 2.0 - 1.0;
    r27.w = r11.z * UniformVector_4.z - 1.0;
    ps = 1.0 - r6.y;
    r30 = r18 * float4(0.875, 0.875, 0.036, 0.036);
    r0.x = ps;
    r27.yz = r11.xy * UniformVector_4.xy - r30.zw;
    r11.zw = r30.xy * r10.zw + 0.125;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r8.z = float((r29.x >= 0.5));
    r6.y = ps;
    r8.xw = (-abs(r6.yy) >= 0.0) ? 1.0 : r8.zy;
    r12.w = (-abs(r6.w) >= 0.0) ? r8.y : r8.w;
    ps = 1.0 - r6.z;
    r11.xy = r0.zw - 2.0;
    r0.z = ps;
    r18 = r11.xyxy * r0.zzxx;
    r6.yz = (-abs(r6.yy) >= 0.0) ? 0.0 : r18.xy;
    r9.w = (-abs(r6.w) >= 0.0) ? r8.z : r8.x;
    r29 = r6.xxxx * r27;
    ps = -r27.x;
    r0.w = r29.w * r9.w;
    ps = r29.x + ps;
    r8.xy = r30.zw + r29.yz;
    r6.x = ps;
    r8.w = r28.y * r6.x + r27.x;
    r6.x = (r26.y == 0.0) ? r25.z : r0.y;
    r11.x = (r26.x == 0.0) ? r25.w : r6.x;
    r18.yz = (-abs(r6.ww) >= 0.0) ? r18.zw : r6.yz;
    ps = abs(r23.w) * abs(r23.w);
    r6.yzw = r7.xyz * r24.www;
    r11.y = ps;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r19.xyz + r19.xyz;
    r6.x = ps;
    r7.xyz = r6.xxx * r5.xyz;
    ps = r11.y * r11.y;
    r5.xy = r8.xy + r14.zw;
    r18.x = ps;
    ps = r5.x;
    r6.x = dot(r6.wyz, r6.wyz);
    ps = r18.y + ps;
    r19 = r0 + float4(-1.0, -1.0, -1.0, 1.0);
    r8.x = ps;
    r0.xyz = r19.xyz - r23.xyz;
    r14 = tex2D(Texture2D_2, r14.xy);
    r0.w = r0.z * r14.w - 2.0;
    r0.xyz = r0.xyz * r14.www + r23.xyz;
    ps = r5.y;
    r8.z = r19.w - r0.z;
    ps = r18.z + ps;
    r8.y = ps;
    r8.xy = r8.xy * r9.ww - r0.xy;
    r0.xyz = r8.xyz * r8.www + r0.xyw;
    r8.x = saturate(r3.w * 0.0001);
    ps = 1.0 - r8.x;
    r18.w = ps;
    ps = r11.z * r11.w;
    r19.xz = r0.xy * r18.ww;
    r18.y = ps;
    r18.z = r2.z * 2.0 + r0.z;
    ps = UniformVector_6.z * UniformVector_6.w;
    r11.yz = r18.zx * r18.wx;
    r2.z = ps;
    r19.yw = r11.yx + float2(1.0, -1.0);
    r8.xyz = (r18.www > 0.0) ? r19.xyz : float3(0.0, 1.0, 0.0);
    r8.xyz = (r18.www >= 0.0) ? r8.xyz : float3(0.0, 1.0, 0.0);
    r7.w = dot(r8.yxz, r8.yxz);
    ps = rsqrt(abs(r7.w));
    r7.w = ps;
    r0.xyz = r8.xyz * r7.www;
    r7.w = dot(r0.yxz, r15.yzw);
    r8.xyz = r0.xzy * r7.www;
    r5.xyz = r8.yzx * 2.0 - r15.wyz;
    r4.w = saturate(dot(r4.wyz, r5.yzx));
    ps = UniformVector_6.y * UniformVector_6.w;
    r7.y = dot(r7.zxy, r0.yxz);
    r2.y = ps;
    ps = UniformVector_6.x * UniformVector_6.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r2.xyz * r21.xyz;
    r6.x = ps;
    r4.xyz = r6.ywz * r6.xxx;
    ps = log2(r4.w);
    r6.xyz = r12.zxy * r5.yyy;
    r7.z = ps;
    r6.xyz = r4.xzy * r5.xxx + r6.xyz;
    r4.xyz = r9.yzx * r5.zzz + r6.zyx;
    r6.xyz = r4.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r6.xyz;
    r6.xyz = r4.zzz * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    r12.xyz = r7.yyz * float3(-0.5, 0.5, 15.0);
    ps = r6.w;
    r5.xyz = r12.xwy + float3(0.5, -0.5, 0.5);
    r7.w = ps;
    ps = 1.0 / abs(r6.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r6.z = ps;
    r7.yz = r6.yx * r6.zz + 1.5;
    r15.xyz = tex2D(Texture2D_9, r3.xy).xyz;
    r6.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.yzw)).xyz;
    r7.yzw = tex2D(Texture2D_8, r22.xy).xyz;
    ps = 6.0 * r7.w;
    r7.x = -r21.w + 1.0;
    r9.z = ps;
    ps = 6.0 * r7.y;
    r3.xyz = r2.xyz * r21.www;
    r9.x = ps;
    ps = 6.0 * r7.z;
    r2.xyz = r7.xxx * UniformVector_5.xzy;
    r9.y = ps;
    r4.xyz = r21.www * UniformScalar_10.xxx + r2.xzy;
    r4.yzw = r3.yxz * UniformScalar_11.xxx + r4.yxz;
    r6.xyz = r9.xzy * r17.yyy + r6.xzy;
    ps = r3.x;
    r6.xyz = r2.xzy * r6.xzy;
    ps = -r7.y + ps;
    r6.w = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    r2.x = ps;
    ps = r3.y;
    ps = -r7.z + ps;
    r9.xyz = r6.www - r6.xzy;
    r2.y = ps;
    r6.xyz = r20.www * r9.xyz + r6.xzy;
    r6.w = dot(r19.ww, r17.ww) + 2.25;
    r6.xyz = r13.yyy * r6.xzy;
    ps = r3.z;
    r9.yz = r6.yz * r17.ww;
    ps = -r7.w + ps;
    r9.x = r8.w * r9.w;
    r2.z = ps;
    r8.xyz = r18.yyy * r8.xyz + ModShadowColor.xyz;
    r2.xzw = r2.xyz * r9.www + r7.yzw;
    r6.x = r9.x * r6.x;
    ps = r6.x;
    r7.yw = r9.xy * r9.zw;
    ps = r17.w * ps;
    r7.z = r7.w * r8.w;
    r7.x = ps;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r3.xyz = r7.xyz + UniformVector_0.xzy;
    r4.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r7.xyz = r11.zzz * r4.zyw;
    r4.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r11.xyz = r7.yzx * r13.yyy;
    r4.z = ps;
    ps = r9.x;
    r6.w = saturate(r6.w - r16.y);
    ps = r11.x * ps;
    r7.xyz = r6.www * r15.xyz;
    r2.y = ps;
    ps = r9.x;
    r15.xyz = -r7.xzy + r14.xzy;
    r7.xyz = r15.xyz * r14.www + r7.xzy;
    r13.xyz = r13.yyy * r2.xzw - r7.xzy;
    ps = r11.y * ps;
    r2.xw = abs(r5.xz) * abs(r5.xz);
    r2.z = ps;
    r7.xyz = r13.xyz * r8.www + r7.xzy;
    ps = pow(2.0, r12.z);
    r0.xyz = r0.yyy * r1.xyz;
    r6.w = ps;
    ps = r11.z;
    r1.xyz = r6.www * r1.xzy;
    ps = r9.w * ps;
    r6.w = ps;
    r4.xyz = r4.xzy * r7.xzy + r3.xyz;
    r7.xyz = r7.xyz * r6.yzx;
    ps = r6.w;
    r3.xyz = r7.xzy * r2.xxx;
    ps = r8.w * ps;
    r6.w = float((r10.x >= 0.004));
    r2.x = ps;
    ps = -r3.w;
    r6.xyz = r7.xzy * r2.www;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r4.xyz;
    r6.xyz = r3.xyz * LowerSkyColor.xzy + r6.xyz;
    r6.xyz = r1.xyz * r2.xzy + r6.xyz;
    r6.xyz = r0.xzy * r7.xzy + r6.xyz;
    r6.xyz = r6.xyz * r8.xzy;
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
