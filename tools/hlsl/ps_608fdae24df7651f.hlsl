// ps_608fdae24df7651f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 582 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000918 10041700 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c30); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c29); // float3
float4 ModShadowAccumResolution : register(c33); // float2
float4 ModShadowColor : register(c31); // float3
float4 ModShadowGroupColor : register(c32); // float3
float4 OpacityOverride : register(c27); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_10 : register(c20); // float
float4 UniformScalar_11 : register(c21); // float
float4 UniformScalar_12 : register(c22); // float
float4 UniformScalar_13 : register(c23); // float
float4 UniformScalar_14 : register(c24); // float
float4 UniformScalar_15 : register(c25); // float
float4 UniformScalar_17 : register(c26); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformScalar_7 : register(c17); // float
float4 UniformScalar_8 : register(c18); // float
float4 UniformScalar_9 : register(c19); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UpperSkyColor : register(c28); // float3
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

    r10.x = dot(r4.zxy, r4.zxy);
    ps = UniformScalar_17.x;
    r8.x = r3.w - 4e+02;
    ps = 0.05 * ps;
    r8.x = saturate(r8.x * 0.00022222222);
    r10.y = ps;
    ps = rsqrt(abs(r10.x));
    r8.x = r10.y * r8.x;
    r10.x = ps;
    r16.xyz = r10.xxx * r4.xyz;
    ps = -r0.z;
    r20.xy = r16.xy * r8.xx;
    ps = 1.0 + ps;
    r23.w = r20.y + r0.z;
    r4.x = ps;
    ps = OpacityOverride.x;
    r4.y = -r23.w + 1.0;
    r8.x = saturate(ps);
    ps = 1.0 - r8.x;
    r11.yz = r4.xy * UniformVector_1.yy;
    r11.w = ps;
    ps = UniformVector_1.x * r0.w;
    r22.w = saturate(r8.w * 15.0);
    r11.x = ps;
    r4.xyz = r11.zxy - 0.5;
    r10 = float4((r11.zxyw >= float4(0.5, 0.5, 0.5, 0.004)));
    r4.xyz = r4.xyz - r11.zxy;
    r4.xyz = r4.yzx * r10.yzx + r11.xyz;
    r13.yzw = r4.zxy + r4.zxy;
    r11 = tex2D(Texture2D_3, r13.zw);
    ps = UniformScalar_13.x - r8.w;
    r21.x = r0.w * 3.0;
    r14.w = ps;
    r12.y = float((UniformScalar_12.x >= 1.0));
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.x = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    r14.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.yw = r0.wz * float2(18.0, 3.0);
    r4.z = ps;
    r21.y = r8.w * (-0.8) + r4.w;
    ps = rsqrt(abs(r12.x));
    r7.x = dot(r14.zxy, r14.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r17.xyz = r7.yyy * r2.xyz;
    r12.x = ps;
    r12 = r14.xzyw * r12.xxxy;
    ps = r4.x;
    r7.x = r12.w + r8.w;
    ps = abs(r9.x) * ps;
    r7.x = -r7.x + r8.z;
    r2.x = ps;
    ps = r7.x;
    r17.w = dot(r10.yzz, float3(1.0, 1.0, 1.0));
    r2.y = ps;
    r7.w = (r17.w == 0.0) ? r11.x : r11.y;
    ps = UniformScalar_14.x;
    r7.xyz = r17.zww + float3(0.1, -3.0, -2.0);
    r2.w = ps;
    r7.w = (r7.z == 0.0) ? r11.z : r7.w;
    r11.y = (r7.y == 0.0) ? r11.w : r7.w;
    ps = max(r2.y, r2.w);
    r2.z = max(r11.y, 0.0);
    r2.y = ps;
    ps = r4.z;
    r21.zw = min(r2.zy, float2(0.3, 1.0));
    ps = abs(r9.y) * ps;
    r4.xz = r21.zy * float2(3.3333333, 6.0);
    r2.y = ps;
    r18.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r23.xyz = tex2D(Texture2D_4, r4.yz).xyw;
    r2 = tex2D(Texture2D_4, r21.xy);
    ps = 0.0001 * r3.w;
    r14.x = saturate(ps);
    r15 = r6.wyxz * 2.0 - 1.0;
    ps = r2.z;
    r9.x = r23.z * r2.w;
    r6.y = ps;
    ps = (-0.3) * r6.y;
    r6.x = dot(r15.wzy, r15.wzy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r19.w = r9.x - 1.0;
    r6.x = ps;
    ps = r2.x + r2.x;
    r9.yzw = r15.ywz * r6.xxx;
    r11.x = ps;
    ps = r16.z;
    r6.xzw = r9.zwy * r12.zyx;
    r11.z = ps;
    r6.xzw = r9.yzw * r12.yxz - r6.xzw;
    ps = 0.0;
    r15.yzw = r23.wxy + r23.wxy;
    r11.w = ps;
    ps = max(r11.z, r11.w);
    r18.zw = r15.zw - 1.0;
    r14.w = ps;
    ps = 1.0 / UniformScalar_15.x;
    r22.xyz = r6.xzw * r15.xxx;
    r6.x = ps;
    ps = 5.0 * r7.x;
    r11.z = saturate(r21.w * r6.x);
    r11.w = saturate(ps);
    ps = 1.0 - r4.x;
    r6.x = dot(r22.zxy, r22.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r7.xzw = -r11.ywz + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r21 = r18 * float4(0.875, 0.875, 0.5, 0.5);
    r14.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r18 = r22.xzyw * r6.xxxz;
    r14.z = ps;
    ps = r2.y + r2.y;
    r14 = -r14 + 1.0;
    r11.y = ps;
    ps = r7.w;
    r11.zw = r21.xy * r14.yz;
    ps = r8.w * ps;
    r11 = r11 + float4(-1.0, -1.0, 0.125, 0.125);
    r7.y = ps;
    ps = r4.x;
    r19.xz = r11.xy + r21.zw;
    ps = r18.w + ps;
    r6.z = r19.x * 0.01;
    r19.y = ps;
    ps = r19.w * r19.y;
    r8.yz = r7.xy * r2.zz;
    r6.x = ps;
    ps = r19.x * r19.y;
    r20.zw = r6.yz * r19.yy;
    r6.y = ps;
    ps = r19.y * r19.z;
    r2.xyw = r20.wxz + r0.xwy;
    r6.z = ps;
    r2.z = r6.z * 0.025 + r2.w;
    ps = UniformVector_1.x * r2.y;
    r11.y = dot(r5.zxy, r5.zxy);
    r8.x = ps;
    ps = (-0.5) - -r8.x;
    r11.x = float((UniformScalar_9.x > 1.0));
    r6.w = ps;
    r8.w = r6.w - r8.x;
    ps = 1.0 + r6.x;
    r7.yz = float2((r8.zx >= float2(0.05, 0.5)));
    r7.w = ps;
    ps = r0.w + r0.w;
    r14.yz = r8.wy * r7.zw;
    r19.x = ps;
    ps = r0.z + r0.z;
    r6.w = r8.x + r14.y;
    r19.y = ps;
    ps = r2.y + r2.y;
    r13.x = r6.w + r6.w;
    r15.x = ps;
    r6.w = tex2D(Texture2D_7, r0.xy).w;
    r4.xyz = tex2D(Texture2D_5, r2.xz).xyz;
    r20 = tex2D(Texture2D_3, r13.xy).zwyx;
    r13 = tex2D(Texture2D_2, r19.xy);
    r8.xyw = tex2D(Texture2D_0, r15.xy).xzy;
    r19.xyz = tex2D(Texture2D_1, r19.xy).xyz;
    r21.xyz = r19.xyz * 2.0 - 1.0;
    r19.xyz = r8.xwy * 2.0 - 1.0;
    r21.xyz = r21.xyz - r19.xyz;
    r19.w = r21.z * r13.w - 2.0;
    r19.xyz = r21.xyz * r13.www + r19.xyz;
    r21.x = r7.w * r7.x;
    r8.z = r10.x * 2.0 + r7.z;
    r4.w = (r8.z == 0.0) ? r20.w : r20.z;
    ps = 1.0 - r7.y;
    r8.xz = r8.zz + float2(-3.0, -2.0);
    r16.w = ps;
    r21.y = (UniformScalar_13.x > 0.0) ? r16.w : 1.0;
    r20.w = (UniformScalar_13.x >= 0.0) ? r21.y : r16.w;
    ps = r14.z;
    r4.xyz = r4.xyz + r4.xyz;
    r8.z = (r8.z == 0.0) ? r20.x : r4.w;
    r21.w = (r8.x == 0.0) ? r20.y : r8.z;
    ps = -r21.x + ps;
    r20.y = -r21.w + 1.0;
    r20.x = ps;
    r21.yz = r22.ww * r20.xy;
    r8.xw = r21.zx + r21.wy;
    r8.w = saturate(r8.w * 2.5 - 0.5);
    r8.z = r8.x + r21.z;
    r4.w = r8.z + r21.w;
    r4 = r4 + float4(-1.0, -1.0, -1.0, 0.25);
    r20.z = r4.z * UniformVector_3.z - r19.z;
    r6.xy = r4.xy * UniformVector_3.xy + r6.yz;
    r20.xy = r6.xy - r19.xy;
    r8.x = r20.w * r6.w - 0.5;
    r6.xyz = r20.xyz * r8.www + r19.xyw;
    r6.w = r8.y * 2.0 + r6.z;
    r6.xyz = r6.wxy * r14.xxx;
    ps = 1.0 + r6.x;
    r12.w = float((UniformScalar_9.x >= 1.0));
    r6.w = ps;
    r6.xyz = (r14.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r14.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r16.zxy);
    r6.xyz = r4.xyz * r6.xxx;
    r16.xyz = r6.xyz * 2.0 - r16.xyz;
    r6.xyz = r9.wyz * r16.zzz;
    r6.xyz = r18.xzy * r16.yyy + r6.xyz;
    r6.xyw = r12.yzx * r16.xxx + r6.zyx;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r8.x = ps;
    r8.xy = r6.yx * r8.xx + 1.5;
    r9.yzw = tex2D(Texture2D_8, r15.xy).xyz;
    r6.z = tex2D(Texture2D_6, r0.xy).x;
    r0.xyz = tex2D(Texture2D_7, r2.xz).xyz;
    r18.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r6.x = UniformScalar_7.x * (-XE_FLT_MAX);
    ps = UniformVector_5.x * UniformVector_5.w;
    r15.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r2.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r2.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r6.y = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r2.z = ps;
    r12.xyz = r2.xyz * r0.xyz;
    r2.xyz = r12.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r0.xyz = r12.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = pow(2.0, r6.x);
    r19.xyz = r6.yyy - r18.xyz;
    r6.x = ps;
    r14.xyz = r19.xyz * UniformScalar_4.xxx + r18.xyz;
    ps = log2(abs(r14.w));
    r0.w = r6.x * UniformScalar_8.x;
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r6.w = saturate(dot(r17.zxy, r16.zxy));
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r14.xyz = r15.xyz * r14.xyz;
    r6.x = ps;
    r6.x = r6.x * UniformScalar_3.x + UniformScalar_2.x;
    ps = -UniformVector_0.x;
    r6.y = r11.z * r11.w;
    r8.xyz = r6.yyy * r8.xyz + ModShadowColor.xyz;
    ps = 1.0 + ps;
    r14.xyz = r14.xyz * r6.xxx;
    r6.y = ps;
    ps = abs(r7.w) * abs(r7.w);
    r0.xyz = r14.xyz * r0.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r11.y));
    r0 = r0 * r6.zzzz;
    r6.z = ps;
    r11 = (-abs(r11.xxxx) >= 0.0) ? r0 : 0.0;
    ps = r6.x * r6.x;
    r0.xyz = r6.zzz * r5.xyz;
    r6.x = ps;
    r5 = (-abs(r12.wwww) >= 0.0) ? 0.0 : r11;
    ps = r6.x * r6.x;
    r2.xyz = r2.xyz + r5.www;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r6.xxx * r2.xyz;
    ps = 1.0 + ps;
    r5.xyz = r8.www * r5.xyz;
    r6.z = ps;
    ps = -UniformVector_0.z;
    r2.xyz = r2.xyz * r8.www;
    ps = 1.0 + ps;
    r2.xyz = r2.xzy * r7.xxx;
    r6.x = ps;
    r5.xyz = r5.xyz * r7.xxx + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r0.w = saturate(r4.w - r9.x);
    r9.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r11.xyz = r0.www * r9.yzw;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r14.xyz = -r11.xzy + r13.xzy;
    r9.z = ps;
    r11.xyz = r14.xyz * r13.www + r11.xzy;
    r7.xyz = r12.xyz * r7.xxx - r11.xzy;
    r7.xyz = r7.xyz * r8.www + r11.xzy;
    r5.xyz = r9.xyz * r7.xyz + r5.xyz;
    r7.xyz = r7.xyz * r6.yzx;
    ps = log2(r6.w);
    r6.x = dot(r0.zxy, r4.zxy);
    r6.y = ps;
    r6.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r6.xy = r6.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r0.xyz = r4.zzz * r1.xyz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1.xyz = r6.zzz * r1.xzy;
    r6.x = ps;
    r4.xyz = r7.xzy * r6.yyy;
    r6.xyz = r7.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r5.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r2.xyz + r6.xzy;
    r6.xyz = r0.xyz * r7.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r8.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r10.w + r3.w;
    r6.xyz = r7.xyz * r10.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
