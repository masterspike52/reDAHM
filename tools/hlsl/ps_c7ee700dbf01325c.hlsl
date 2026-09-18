// ps_c7ee700dbf01325c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 582 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000918 10041700 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c30); // float4
float4 ConstantLighting : register(c31); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c29); // float3
float4 ModShadowAccumResolution : register(c34); // float2
float4 ModShadowColor : register(c32); // float3
float4 ModShadowGroupColor : register(c33); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9.x = dot(r3.zxy, r3.zxy);
    ps = UniformScalar_17.x;
    r7.x = r2.w - 4e+02;
    ps = 0.05 * ps;
    r7.x = saturate(r7.x * 0.00022222222);
    r9.y = ps;
    ps = rsqrt(abs(r9.x));
    r7.x = r9.y * r7.x;
    r9.x = ps;
    r17.xyz = r9.xxx * r3.xyz;
    ps = -r0.z;
    r20.xy = r17.xy * r7.xx;
    ps = 1.0 + ps;
    r23.w = r20.y + r0.z;
    r3.x = ps;
    ps = OpacityOverride.x;
    r3.y = -r23.w + 1.0;
    r7.x = saturate(ps);
    ps = 1.0 - r7.x;
    r10.yz = r3.xy * UniformVector_1.yy;
    r10.w = ps;
    ps = UniformVector_1.x * r0.w;
    r21.w = saturate(r7.w * 15.0);
    r10.x = ps;
    r3.xyz = r10.zxy - 0.5;
    r9 = float4((r10.zxyw >= float4(0.5, 0.5, 0.5, 0.004)));
    r3.xyz = r3.xyz - r10.zxy;
    r3.xyz = r3.yzx * r9.yzx + r10.xyz;
    r14.yzw = r3.zxy + r3.zxy;
    r10 = tex2D(Texture2D_3, r14.zw);
    ps = UniformScalar_13.x - r7.w;
    r22.x = r0.w * 3.0;
    r13.w = ps;
    r12.y = float((UniformScalar_12.x >= 1.0));
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.x = dot(r1.zxy, r1.zxy);
    r3.x = ps;
    r13.xyz = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.yw = r0.wz * float2(18.0, 3.0);
    r3.z = ps;
    r22.y = r7.w * (-0.8) + r3.w;
    ps = rsqrt(abs(r11.x));
    r6.x = dot(r13.zxy, r13.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r11.xyz = r6.yyy * r1.xyz;
    r12.x = ps;
    r12 = r13.xzyw * r12.xxxy;
    ps = r3.x;
    r6.x = r12.w + r7.w;
    ps = abs(r8.x) * ps;
    r6.x = -r6.x + r7.z;
    r1.x = ps;
    ps = r6.x;
    r11.w = dot(r9.yzz, float3(1.0, 1.0, 1.0));
    r1.y = ps;
    r6.w = (r11.w == 0.0) ? r10.x : r10.y;
    ps = UniformScalar_14.x;
    r6.xyz = r11.zww + float3(0.1, -3.0, -2.0);
    r1.w = ps;
    r6.w = (r6.z == 0.0) ? r10.z : r6.w;
    r18.y = (r6.y == 0.0) ? r10.w : r6.w;
    ps = max(r1.y, r1.w);
    r1.z = max(r18.y, 0.0);
    r1.y = ps;
    ps = r3.z;
    r22.zw = min(r1.zy, float2(0.3, 1.0));
    ps = abs(r8.y) * ps;
    r3.xz = r22.zy * float2(3.3333333, 6.0);
    r1.y = ps;
    r15.xy = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r23.xyz = tex2D(Texture2D_4, r3.yz).xyw;
    r1 = tex2D(Texture2D_4, r22.xy);
    ps = 0.0001 * r2.w;
    r10.x = saturate(ps);
    r13 = r5.wyxz * 2.0 - 1.0;
    ps = r1.z;
    r8.w = r23.z * r1.w;
    r5.y = ps;
    ps = (-0.3) * r5.y;
    r5.x = dot(r13.wzy, r13.wzy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r19.w = r8.w - 1.0;
    r5.x = ps;
    ps = r1.x + r1.x;
    r16.xyz = r13.ywz * r5.xxx;
    r18.x = ps;
    ps = r17.z;
    r5.xzw = r16.yzx * r12.zyx;
    r8.x = ps;
    r5.xzw = r16.xyz * r12.yxz - r5.xzw;
    ps = 0.0;
    r13.yzw = r23.wxy + r23.wxy;
    r8.y = ps;
    ps = max(r8.x, r8.y);
    r15.zw = r13.zw - 1.0;
    r10.w = ps;
    ps = 1.0 / UniformScalar_15.x;
    r21.xyz = r5.xzw * r13.xxx;
    r5.x = ps;
    ps = 5.0 * r6.x;
    r18.z = saturate(r22.w * r5.x);
    r18.w = saturate(ps);
    ps = 1.0 - r3.x;
    r5.x = dot(r21.zxy, r21.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.xzw = -r18.ywz + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r22 = r15 * float4(0.875, 0.875, 0.5, 0.5);
    r10.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15 = r21.xzyw * r5.xxxz;
    r10.z = ps;
    ps = r1.y + r1.y;
    r10 = -r10 + 1.0;
    r18.y = ps;
    ps = r6.w;
    r18.zw = r22.xy * r10.yz;
    ps = r7.w * ps;
    r18 = r18 + float4(-1.0, -1.0, 0.125, 0.125);
    r6.y = ps;
    ps = r3.x;
    r19.xz = r18.xy + r22.zw;
    ps = r15.w + ps;
    r5.z = r19.x * 0.01;
    r19.y = ps;
    ps = r19.w * r19.y;
    r7.yz = r6.xy * r1.zz;
    r5.x = ps;
    ps = r19.x * r19.y;
    r20.zw = r5.yz * r19.yy;
    r5.y = ps;
    ps = r19.y * r19.z;
    r1.xyw = r20.wxz + r0.xwy;
    r5.z = ps;
    r1.z = r5.z * 0.025 + r1.w;
    ps = UniformVector_1.x * r1.y;
    r8.z = r18.z * r18.w;
    r7.x = ps;
    ps = (-0.5) - -r7.x;
    r12.w = UniformScalar_7.x * (-XE_FLT_MAX);
    r5.w = ps;
    r7.w = r5.w - r7.x;
    ps = 1.0 + r5.x;
    r6.yz = float2((r7.zx >= float2(0.05, 0.5)));
    r6.w = ps;
    ps = r0.w + r0.w;
    r8.xy = r7.wy * r6.zw;
    r18.x = ps;
    ps = r0.z + r0.z;
    r5.w = r7.x + r8.x;
    r18.y = ps;
    ps = r1.y + r1.y;
    r14.x = r5.w + r5.w;
    r13.x = ps;
    r5.w = tex2D(Texture2D_7, r0.xy).w;
    r3.xyz = tex2D(Texture2D_5, r1.xz).xyz;
    r19 = tex2D(Texture2D_3, r14.xy).zwyx;
    r14 = tex2D(Texture2D_2, r18.xy);
    r7.xyw = tex2D(Texture2D_0, r13.xy).xzy;
    r18.xyz = tex2D(Texture2D_1, r18.xy).xyz;
    r20.xyz = r18.xyz * 2.0 - 1.0;
    r18.xyz = r7.xwy * 2.0 - 1.0;
    r20.xyz = r20.xyz - r18.xyz;
    r18.w = r20.z * r14.w - 2.0;
    r18.xyz = r20.xyz * r14.www + r18.xyz;
    r20.x = r6.w * r6.x;
    r7.z = r9.x * 2.0 + r6.z;
    r3.w = (r7.z == 0.0) ? r19.w : r19.z;
    ps = 1.0 - r6.y;
    r7.xz = r7.zz + float2(-3.0, -2.0);
    r16.w = ps;
    r17.w = (UniformScalar_13.x > 0.0) ? r16.w : 1.0;
    r19.w = (UniformScalar_13.x >= 0.0) ? r17.w : r16.w;
    ps = r8.y;
    r3.xyz = r3.xyz + r3.xyz;
    r7.z = (r7.z == 0.0) ? r19.x : r3.w;
    r20.w = (r7.x == 0.0) ? r19.y : r7.z;
    ps = -r20.x + ps;
    r8.y = -r20.w + 1.0;
    r8.x = ps;
    r20.yz = r21.ww * r8.xy;
    r7.xw = r20.zx + r20.wy;
    r7.w = saturate(r7.w * 2.5 - 0.5);
    r7.z = r7.x + r20.z;
    r3.w = r7.z + r20.w;
    r3 = r3 + float4(-1.0, -1.0, -1.0, 0.25);
    r19.z = r3.z * UniformVector_3.z - r18.z;
    r5.xy = r3.xy * UniformVector_3.xy + r5.yz;
    r19.xy = r5.xy - r18.xy;
    r7.x = r19.w * r5.w - 0.5;
    r5.xyz = r19.xyz * r7.www + r18.xyw;
    r5.w = r7.y * 2.0 + r5.z;
    r5.xyz = r5.wxy * r10.xxx;
    ps = 1.0 + r5.x;
    r8.y = float((UniformScalar_9.x > 1.0));
    r5.w = ps;
    r5.xyz = (r10.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r5.x = ps;
    r3.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r3.zxy, r17.zxy);
    r5.xyz = r3.xyz * r5.xxx;
    r10.xyz = r5.xyz * 2.0 - r17.xyz;
    r5.xyz = r16.zxy * r10.zzz;
    r5.xyz = r15.xzy * r10.yyy + r5.xyz;
    r5.xyw = r12.yzx * r10.xxx + r5.zyx;
    r7.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r7.x = ps;
    r7.xy = r5.yx * r7.xx + 1.5;
    r15.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r0.x = tex2D(Texture2D_6, r0.xy).x;
    r0.yzw = tex2D(Texture2D_7, r1.xz).xyz;
    r12.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r1.w = float((UniformScalar_9.x >= 1.0));
    ps = UniformVector_4.x * UniformVector_4.w;
    r8.x = dot(r4.zxy, r4.zxy);
    r16.x = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.xyz = -UniformVector_0.zxy + 1.0;
    r1.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.w = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    r1.z = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r13.xyz = r1.xyz * r0.yzw;
    r16.y = ps;
    r1.xyz = r13.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r0.yzw = r13.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = pow(2.0, r12.w);
    r17.xyz = r5.www - r12.xyz;
    r5.w = ps;
    r12.xyz = r17.xyz * UniformScalar_4.xxx + r12.xyz;
    ps = log2(abs(r10.w));
    r12.w = r5.w * UniformScalar_8.x;
    r5.w = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r5.w = r5.w * UniformScalar_1.x;
    r16.z = ps;
    ps = pow(2.0, r5.w);
    r12.xyz = r16.xyz * r12.xyz;
    r5.w = ps;
    r5.w = r5.w * UniformScalar_3.x + UniformScalar_2.x;
    r7.xyz = r8.zzz * r7.xyz + ModShadowColor.xyz;
    r12.xyz = r12.xyz * r5.www;
    ps = abs(r6.w) * abs(r6.w);
    r12.xyz = r12.xyz * r0.yzw;
    r5.w = ps;
    ps = rsqrt(abs(r8.x));
    r0 = r12 * r0.xxxx;
    r8.x = ps;
    r0 = (-abs(r8.yyyy) >= 0.0) ? r0 : 0.0;
    ps = r5.w * r5.w;
    r4.xyz = r8.xxx * r4.xyz;
    r5.w = ps;
    r0 = (-abs(r1.wwww) >= 0.0) ? 0.0 : r0;
    ps = r5.w * r5.w;
    r1.xyz = r1.xyz + r0.www;
    r5.w = ps;
    r1.xyz = r5.www * r1.xyz;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r0.xyz = r7.www * r0.xyz;
    r12.x = ps;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r1.xyz = r1.xzy * r7.www;
    r12.y = ps;
    r8.xyz = r0.xyz * r6.xxx + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r5.w = saturate(r3.w - r8.w);
    r12.z = ps;
    ps = r1.x;
    r0.xyz = r5.www * r15.xyz;
    ps = r6.x * ps;
    r15.xyz = -r0.xzy + r14.xzy;
    r1.x = ps;
    r0.xyz = r15.xyz * r14.www + r0.xzy;
    r13.xyz = r13.xyz * r6.xxx - r0.xzy;
    r0.xyz = r13.xyz * r7.www + r0.xzy;
    r8.xyz = r12.xyz * r0.xyz + r8.xyz;
    ps = r1.y;
    r0.xyz = r0.xyz * r5.yzx;
    ps = r6.x * ps;
    r5.y = saturate(dot(r11.zxy, r10.zxy));
    r1.y = ps;
    ps = log2(r5.y);
    r5.x = dot(r4.zxy, r3.zxy);
    r5.y = ps;
    ps = r1.z;
    r5.xyz = r5.xxy * float3(-0.5, 0.5, 15.0);
    ps = r6.x * ps;
    r4.xy = r5.xy + 0.5;
    r1.z = ps;
    ps = pow(2.0, r5.z);
    r5.xy = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r6.xyz = r3.zzz * ConstantLighting.xyz;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r0.xzy * r5.xxx;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r5.xyz = r0.xzy * r5.yyy;
    r3.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xzy;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r3.xyz * r1.xyz + r5.xzy;
    r5.xyz = r6.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r9.w + r2.w;
    r5.xyz = r6.xyz * r9.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
