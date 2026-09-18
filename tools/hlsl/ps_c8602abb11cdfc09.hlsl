// ps_c8602abb11cdfc09.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 753 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000BC4 10041D00 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c26); // float3
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
sampler2D LightMapTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_13.x;
    r10.x = -r8.w + UniformScalar_8.x;
    ps = 0.05 * ps;
    r0.z = r1.w * UniformVector_1.x;
    r10.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = -r1.z + 1.0;
    r3.z = ps;
    ps = UniformVector_1.y * r7.w;
    r20 = r1.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r0.w = ps;
    r8.xy = r8.ww * float2(0.16, -0.8) + r20.xy;
    ps = (-0.5) + r0.w;
    r12.yz = float2((r0.zw >= 0.5));
    r9.w = ps;
    ps = (-0.5) + r0.z;
    r3.x = r3.w - 4e+02;
    r9.z = ps;
    r10.yz = r9.zw - r0.zw;
    ps = 0.00022222222 * r3.x;
    r12.x = float((UniformScalar_7.x >= 1.0));
    r12.w = saturate(ps);
    r13 = r10 * r12;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r0.zw + r13.yz;
    r3.y = ps;
    r3.xy = r3.yz * abs(r9.xy);
    ps = 6.0 * r8.x;
    r7.w = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = 6.0 * r8.y;
    r0.zw = r0.zw + r0.zw;
    r9.y = ps;
    r3.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r9.xyz = tex2D(Texture2D_3, r9.xy).xyw;
    ps = rsqrt(abs(r7.w));
    r7.w = r13.x + r8.w;
    r3.z = ps;
    r10 = r3.xzzy * float4(0.875, -0.125, 1.0, 0.875);
    r11 = tex2D(Texture2D_4, r0.zw);
    r3.z = dot(r12.yzz, float3(1.0, 1.0, 1.0));
    r0.z = (r3.z == 0.0) ? r11.x : r11.y;
    r18 = tex2D(Texture2D_3, r8.xy);
    r15.xy = r9.xy * 2.0 - 1.0;
    r3.xy = r18.xy + r18.xy;
    r12 = r3.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r8.x = (r12.w == 0.0) ? r11.z : r0.z;
    ps = UniformScalar_9.x;
    r14.xyz = r10.zzz * r4.zxy;
    r0.w = ps;
    r3.xy = r14.zy * r13.ww + r1.zw;
    r8.y = (r12.z == 0.0) ? r11.w : r8.x;
    r7.w = -r7.w + r8.z;
    ps = r7.w;
    r0.z = ps;
    ps = max(r0.z, r0.w);
    r0.w = max(r8.y, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_0.x;
    r0.zw = min(r0.zw, float2(1.0, 0.3));
    r7.w = ps;
    r8.x = saturate(r0.z * r7.w);
    ps = 1.0 - r8.x;
    r11.y = ps;
    r9.w = r11.y * r8.w;
    ps = 1.0 - r3.x;
    r7.w = dot(r2.zxy, r2.zxy);
    r3.z = ps;
    r13.xy = r3.yz * UniformVector_1.xy;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r13.zw = r9.zw * r18.wz;
    r3.z = ps;
    ps = 3.3333333 * r0.w;
    r19.z = float((r13.w >= 0.05));
    r19.y = ps;
    ps = 1.0 - r8.y;
    r8.xy = float2((r13.xy >= 0.5));
    r11.z = ps;
    ps = rsqrt(abs(r7.w));
    r16.w = dot(r8.xyy, float3(1.0, 1.0, 1.0));
    r7.w = ps;
    r16.xyz = r7.www * r2.xyz;
    r2.xyz = r16.wzw + float3(-3.0, 0.1, -2.0);
    ps = 5.0 * r2.y;
    r24.xyz = r13.xyz + float3(-0.5, -0.5, -1.0);
    r19.x = saturate(ps);
    ps = r8.w;
    r0.zw = r24.xy - r13.xy;
    ps = 15.0 * ps;
    r28.yzw = -r19.zxy + 1.0;
    r9.z = saturate(ps);
    r23.y = r9.z * r28.w + r19.y;
    r17.xy = r0.zw * r8.xy + r13.xy;
    r17.zw = tex2D(Texture2D_6, r20.zw).xy;
    ps = r1.z + r1.z;
    r25 = r17 + r17;
    r0.w = ps;
    r15.zw = r25.zw - 1.0;
    r29 = r15 * float4(0.5, 0.5, 0.036, 0.036);
    ps = r18.z;
    r23.xz = r12.xy + r29.xy;
    r7.w = ps;
    ps = r10.y;
    ps = r4.x * ps;
    r4.x = -r8.z + 1.0;
    r22.y = ps;
    ps = r3.y + r3.y;
    r8.y = r23.x * 0.01;
    r2.y = ps;
    ps = (-0.3) * r7.w;
    r23.w = ps;
    ps = UniformVector_2.y;
    r22.xzw = r23.wxy * r23.yyz;
    r8.z = saturate(ps);
    r7.w = r22.w * 0.025;
    ps = r7.w;
    r20.xz = r22.yx + r1.wy;
    ps = r22.x + ps;
    r15.y = r20.z + r7.w;
    r8.x = ps;
    ps = r8.y;
    ps = r23.y * ps;
    r8.y = ps;
    ps = UniformVector_2.x;
    r15.xz = r8.yx + r1.xy;
    r8.y = saturate(ps);
    r7.w = tex2D(Texture2D_5, r15.xz).w;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r8.yz = r8.zy * UniformScalar_4.xx;
    r3.y = ps;
    ps = 1.0 / UniformScalar_4.x;
    r8.zw = floor(-r8.yz);
    r8.y = ps;
    r26 = tex2D(Texture2D_5, r15.xy);
    ps = (-0.5) + r7.w;
    r8.yz = -r8.zw * r8.yy;
    r8.w = ps;
    ps = r26.w;
    r4.yz = r8.yz + UniformScalar_5.xx;
    r7.w = ps;
    r4 = r4.xxyz - r8.yzyz;
    ps = 1.0 / r4.z;
    r8.y = ps;
    ps = 1.0 / r4.w;
    r8.x = dot(r18.xxx, float3(1.0, 1.0, 1.0));
    r8.z = ps;
    r17.xy = saturate(r4.xy * r8.yz);
    r8.y = dot(r18.yyy, float3(1.0, 1.0, 1.0));
    ps = (-0.5) + r7.w;
    r8.yz = r29.xy + r8.xy;
    r8.x = ps;
    r12.xz = saturate(r8.xw * 3.3333333);
    r11.xw = -r12.xz + 1.0;
    r8.x = r17.x * r11.x + r12.x;
    ps = r3.x + r3.x;
    r18.xyz = r8.xyz + r18.zxy;
    r2.w = ps;
    r21.xyz = tex2D(Texture2D_0, r2.yw).xyz;
    ps = r21.x + r21.x;
    r8.x = ps;
    ps = r21.y + r21.y;
    r8.y = ps;
    ps = r21.z + r21.z;
    r28.x = float((r18.x >= 0.5));
    r8.z = ps;
    r9.xw = (-abs(r3.zz) >= 0.0) ? 1.0 : r28.yx;
    r8.w = (-abs(r3.y) >= 0.0) ? r28.y : r9.x;
    ps = r1.w + r1.w;
    r27 = r8 + float4(-1.0, -1.0, -1.0, -0.5);
    r0.z = ps;
    ps = OpacityOverride.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r27.wwww)) clip(-1.0);
    r8.w = saturate(ps);
    r4 = tex2D(Texture2D_4, r25.xy);
    r3.x = (r16.w == 0.0) ? r4.x : r4.y;
    r8.x = max(r14.x, 0.0);
    ps = r24.z;
    r8.yz = r28.zz * ModShadowGroupColor.xy;
    ps = r23.y * ps;
    r8 = -r8 + 1.0;
    r15.w = ps;
    r25.yz = r10.xw * r8.yz + 0.125;
    r1.xyw = tex2D(Texture2D_1, r0.zw).xyz;
    ps = r3.w;
    r7.w = -r26.w + 1.0;
    r10 = r6.yxwz * 2.0 - 1.0;
    r6.xy = r17.yy * r11.xw + r12.xz;
    ps = 0.0001 * ps;
    r6.w = dot(r10.wyx, r10.wyx);
    r9.y = saturate(ps);
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r7.zxy, r7.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r17.xyz = r10.xwy * r6.www;
    r6.z = ps;
    r7.xyz = r7.xzy * r6.zzz;
    ps = 1.0 - r6.x;
    r23.xyz = r17.yzx * r7.zyx;
    r6.z = ps;
    r23.xyz = r17.xyz * r7.yxz - r23.xyz;
    ps = 1.0 - r6.y;
    r10.xyz = r23.xyz * r10.zzz;
    r6.w = ps;
    r6.xy = r18.yz + r29.xy;
    r18.xyz = tex2D(Texture2D_7, r15.xy).xyz;
    ps = r18.x + r18.x;
    r15.x = ps;
    ps = r18.y + r18.y;
    r15.y = ps;
    ps = r18.z + r18.z;
    r15.z = ps;
    ps = log2(abs(r8.x));
    r15 = r15 + float4(-1.0, -1.0, -1.0, 1.0);
    r11.x = ps;
    r24.w = r15.z * UniformVector_4.z - 1.0;
    ps = abs(r15.w) * abs(r15.w);
    r23.xy = r11.xz * float2(0.0125, 2.5);
    r25.x = ps;
    r24.x = saturate(r23.y * r15.w - 0.5);
    r24.yz = r15.xy * UniformVector_4.xy - r29.zw;
    ps = -r24.x;
    r18 = r12.xxxx * r24;
    ps = r18.x + ps;
    r15.x = ps;
    ps = (-2.0) + r6.x;
    r12.zw = r29.zw + r18.yz;
    r12.x = ps;
    ps = (-2.0) + r6.y;
    r20.yw = r12.zw + r22.zw;
    r12.z = ps;
    r22 = r12.xzxz * r6.zzww;
    r6.xy = (-abs(r3.zz) >= 0.0) ? 0.0 : r22.zw;
    r14.w = (-abs(r3.y) >= 0.0) ? r28.x : r9.w;
    r3.yz = (-abs(r3.yy) >= 0.0) ? r22.xy : r6.xy;
    r6.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r1.w + r1.w;
    r12.x = r18.w * r14.w;
    r12.w = ps;
    ps = r1.x + r1.x;
    r6.xyz = r6.xyz * r26.xyz;
    r12.y = ps;
    ps = r1.y + r1.y;
    r22.xyz = r6.xzy * r26.www;
    r12.z = ps;
    ps = r20.y;
    ps = r3.y + ps;
    r18 = r12 + float4(1.0, -1.0, -1.0, -1.0);
    r1.y = ps;
    r6.xyz = r18.yzw - r27.xyz;
    r12 = tex2D(Texture2D_2, r0.zw);
    r6.w = r6.z * r12.w - 2.0;
    r6.xyz = r6.xyz * r12.www + r27.xyz;
    r23.z = r18.x - r6.z;
    r18.xyz = r7.www * UniformVector_5.xzy;
    r15.yzw = r26.www * UniformScalar_10.xxx + r18.xzy;
    r0.zw = r25.xy * r25.xz;
    ps = r0.z * r0.z;
    r9.w = ps;
    ps = pow(2.0, r23.x);
    r1.x = dot(r10.zxy, r10.zxy);
    r9.x = ps;
    ps = r20.w;
    ps = r3.z + ps;
    r1.w = ps;
    r15.yzw = r22.zxy * UniformScalar_11.xxx + r15.zyw;
    r23.xy = r1.yw * r14.ww - r6.xy;
    ps = rsqrt(abs(r1.x));
    r15 = r9.zwww * r15.xzyw;
    r1.x = ps;
    ps = r24.x;
    r9.xyz = -r9.zxy + 1.0;
    ps = r15.x + ps;
    r10.xyz = r10.xzy * r1.xxx;
    r7.w = ps;
    r6.xyz = r23.xyz * r7.www + r6.xyw;
    r6.w = r21.z * 2.0 + r6.z;
    r6.xyw = r6.wxy * r9.zzz;
    ps = 1.0 + r6.x;
    r21.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    r6.yzw = (r9.zzz > 0.0) ? r6.yzw : float3(0.0, 1.0, 0.0);
    r6.yzw = (r9.zzz >= 0.0) ? r6.yzw : float3(0.0, 1.0, 0.0);
    r6.x = dot(r6.zyw, r6.zyw);
    ps = rsqrt(abs(r6.x));
    r6.x = ps;
    r1.xyw = r6.yzw * r6.xxx;
    r6.x = dot(r1.yxw, r14.xyz);
    r6.xyz = r1.xwy * r6.xxx;
    r14.xyz = r6.xyz * 2.0 - r14.yzx;
    r6.xyz = r17.zxy * r14.zzz;
    r6.xyz = r10.xzy * r14.yyy + r6.xyz;
    r7.xyz = r7.yzx * r14.xxx + r6.zyx;
    r6.xyz = r7.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r7.yyy * LocalToWorldMatrix[1].xyz + r6.xyz;
    r6.xyz = r7.zzz * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    r2.z = (r2.z == 0.0) ? r4.z : r3.x;
    r7.x = (r2.x == 0.0) ? r4.w : r2.z;
    ps = 1.0 / abs(r6.z);
    r17.z = r6.w;
    r6.z = ps;
    r7.yz = r6.yx * r6.zz;
    ps = r1.z;
    r17.xyw = r7.yzx + float3(1.5, 1.5, -1.0);
    r20.y = ps;
    r6.x = dot(r5.zxy, r5.zxy);
    r10.xzw = tex2D(Texture2D_9, r2.yw).xyz;
    r4.yzw = texCUBE(TextureCube_0, xe_cube_dir(r17.xyz)).xyz;
    r2.xyz = tex2D(Texture2D_8, r20.xy).xyz;
    r7.xyz = -UniformVector_0.zxy + 1.0;
    ps = rsqrt(abs(r6.x));
    r20.xyz = r2.xyz * 6.0;
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r3.xyz = r6.xxx * r5.xyz;
    r10.y = ps;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r0.xyz = r0.www * r21.xyz + ModShadowColor.xyz;
    r4.yzw = r20.xzy * r9.yyy + r4.ywz;
    ps = LightMapScale.y * r6.z;
    r18.xyz = r18.xzy * r4.ywz;
    r4.y = ps;
    ps = LightMapScale.x * r6.y;
    r3.x = dot(r3.zxy, r1.yxw);
    r4.x = ps;
    ps = LightMapScale.z * r6.x;
    r6.y = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r4.z = ps;
    r6.xyz = r6.yyy - r18.xzy;
    r6.xyz = r19.yyy * r6.xyz + r18.xzy;
    r1.z = dot(r17.ww, r9.xx) + 2.25;
    r0.w = saturate(dot(r16.zxy, r14.zxy));
    ps = r7.w;
    r5.xyz = r22.xzy - r2.xyz;
    r5.xyz = r5.xyz * r14.www + r2.xyz;
    r2.yzw = r15.yzw * r11.zzz;
    r6.w = r2.y * r14.w;
    ps = r14.w * ps;
    r6.xyz = r11.zzz * r6.xzy;
    r14.x = ps;
    ps = r6.w;
    ps = r7.w * ps;
    r2.x = ps;
    ps = r14.x;
    r2.yz = r14.xx * r2.zw;
    ps = r6.x * ps;
    r14.yz = r6.yz * r9.xx;
    r6.y = ps;
    ps = r6.y;
    r6.xw = r14.xy * r14.zw;
    ps = r9.x * ps;
    r6.z = r6.w * r7.w;
    r6.y = ps;
    ps = r6.y;
    r6.y = ps;
    ps = UniformVector_0.x + r6.y;
    r9.x = ps;
    ps = log2(r0.w);
    r6.y = saturate(r1.z - r13.z);
    r3.y = ps;
    ps = UniformVector_0.z + r6.x;
    r13.xyz = r3.yxx * float3(15.0, -0.5, 0.5);
    r9.y = ps;
    ps = UniformVector_0.y + r6.z;
    r3.yz = r13.yz + 0.5;
    r9.z = ps;
    ps = pow(2.0, r13.x);
    r6.w = ps;
    ps = r4.x;
    ps = r6.w * ps;
    r6.xyz = r6.yyy * r10.xzw;
    r3.x = ps;
    r10.xzw = -r6.xzy + r12.xzy;
    r6.xyz = r10.xzw * r12.www + r6.xzy;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r10.x = ps;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r10.z = ps;
    r5.xyz = r11.zzz * r5.xyz - r6.xzy;
    r5.xyz = r5.xyz * r7.www + r6.xzy;
    r6.xyz = r10.xzy * r5.xzy + r9.xyz;
    ps = r4.z;
    r7.xyz = r5.xyz * r7.yzx;
    ps = r6.w * ps;
    r9.xy = abs(r3.yz) * abs(r3.yz);
    r3.y = ps;
    ps = r4.y;
    r5.xyz = r7.xzy * r9.xxx;
    r9.xyz = r7.xzy * r9.yyy;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r6.xyz;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r6.xyz;
    ps = r6.w * ps;
    r1.xyz = r4.xzy * r1.yyy;
    r3.z = ps;
    r6.xyz = r3.xyz * r2.xzy + r6.xyz;
    r6.xyz = r1.xyz * r7.xzy + r6.xyz;
    r6.xyz = r6.xyz * r0.xzy;
    ps = -r3.w;
    r6.w = float((r8.w >= 0.004));
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
