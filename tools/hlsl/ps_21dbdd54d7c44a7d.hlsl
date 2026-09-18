// ps_21dbdd54d7c44a7d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 447 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006FC 10041700 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c29); // float3
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
sampler2D LightMapTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_6, r1.xy);
    ps = (-0.5) + r15.w;
    r8.w = r3.w - 4e+02;
    r7.w = ps;
    ps = OpacityOverride.x;
    r8.xy = r1.wz * 6.0;
    r22.x = saturate(ps);
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r13.x = ps;
    r8.xyz = tex2D(Texture2D_2, r8.xy).xwy;
    ps = r1.w;
    r12.xy = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_7.x * ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r11.z = ps;
    r10.yz = r8.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r10.x = saturate(r8.w * 0.00022222222);
    r7.w = ps;
    ps = -r1.z;
    r20.xyz = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r10.xyz = r10.yzx * float3(0.5, 0.5, -0.025);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r13.zw = r20.xy * r10.zz;
    r13.y = ps;
    ps = r1.w;
    r4.yz = r13.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r0.zw = float2((r13.xy >= 0.5));
    r4.x = ps;
    ps = r1.z;
    r4.yz = r4.yz - r13.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r4.yz * r0.zw;
    r4.y = ps;
    ps = r1.z;
    r14 = r13.zwxy + r4;
    ps = UniformVector_7.y * ps;
    r11.xy = r14.zw + r14.zw;
    r11.w = ps;
    r4.xyw = tex2D(Texture2D_7, r11.zw).yzx;
    r23 = tex2D(Texture2D_1, r11.xy);
    r13.xyz = tex2D(Texture2D_0, r14.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r1.wz).xwy;
    r8.xzw = tex2D(Texture2D_3, r12.xy).wxy;
    ps = r3.w;
    r10.w = dot(r2.zxy, r2.zxy);
    r12 = r6.ywzx * 2.0 - 1.0;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.zw = r8.zw + r8.zw;
    r22.z = saturate(ps);
    ps = r16.x + r16.x;
    r17.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = ps;
    ps = r16.z + r16.z;
    r15.yzw = r17.xyz * r15.xyz;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r7.wyz, r7.wyz);
    r16.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = r8.y * r16.y;
    r16.y = ps;
    ps = rsqrt(abs(r10.w));
    r4.z = dot(r12.zwx, r12.zwx);
    r10.w = ps;
    r17.xyz = r11.xyz * 2.0 - 1.0;
    r13.xyw = r13.xyz * 2.0 - 1.0;
    r21.z = r17.z * UniformVector_4.z - r13.w;
    ps = rsqrt(abs(r4.z));
    r11.xyz = r10.www * r2.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r7.x));
    r19.xyz = r12.xzw * r2.xxx;
    r7.x = ps;
    ps = r20.z;
    r18.xyz = r7.ywz * r7.xxx;
    r7.x = ps;
    ps = 0.0;
    r2 = r6 - 1.0;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r6.xyz = r19.yzx * r18.zyx;
    r12.w = ps;
    r21.xyw = r19.xyz * r18.yxz - r6.xyz;
    ps = r8.y;
    r11.w = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r7.x = (r11.w == 0.0) ? r23.x : r23.y;
    ps = (-1.0) + r6.x;
    r6.yzw = r11.zww + float3(0.1, -3.0, -2.0);
    r10.z = ps;
    ps = 5.0 * r6.y;
    r10.xy = r2.xy + r10.xy;
    r22.y = saturate(ps);
    r6.x = (r6.w == 0.0) ? r23.z : r7.x;
    r12.x = (r6.z == 0.0) ? r23.w : r6.x;
    ps = (-1.0) + r8.x;
    r7.yzw = -r22.zyx + 1.0;
    r10.w = ps;
    r15.x = r10.w * r7.y + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r8.xzw = r21.xyw * r12.yyy;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r6.y = max(r12.x, 0.0);
    r12.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.y = min(r6.y, 0.3);
    r12.z = ps;
    r6.xw = r6.xx * r2.zw + r17.xy;
    ps = 3.3333333 * r6.y;
    r7.x = dot(r8.wxz, r8.wxz);
    r6.z = ps;
    r2.x = r6.z * r10.z + 1.0;
    r12 = -r12.wxyz + 1.0;
    r6.xy = r6.xw * UniformVector_4.xy - r13.xy;
    r21.xy = r6.zz * r10.xy + r6.xy;
    ps = r12.y;
    r10 = r15.yzxw * r4.wxwy;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r17.yzw = r10.xyw * r15.xxx;
    r17.x = ps;
    r0.w = saturate(r17.x * r2.x - 0.5);
    r6.xy = r21.xy * r0.ww + r13.xy;
    r6.z = r21.z * r0.w - 2.0;
    r6.z = r13.z * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r8.y = UniformScalar_9.x * (-XE_FLT_MAX);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.x));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r8.xwz * r7.xxx;
    r6.x = ps;
    r13.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r13.zxy, r20.zxy);
    ps = r16.x;
    r6.xyz = r13.xzy * r6.xxx;
    r2.yzw = r6.xyz * 2.0 - r20.xzy;
    ps = abs(r9.x) * ps;
    r6.xyz = r19.zxy * r2.zzz;
    r8.x = ps;
    r6.xyz = r7.xzy * r2.www + r6.xyz;
    r6.xyw = r18.yzx * r2.yyy + r6.zyx;
    ps = r16.y;
    r7.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xzy);
    r8.z = ps;
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r9.yz = tex2D(ModShadowAccumTexture, r8.xz).xy;
    r1.w = tex2D(Texture2D_5, r1.xy).x;
    r8.xzw = tex2D(Texture2D_8, r14.xy).xyz;
    r1.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = UniformVector_5.x * UniformVector_5.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r16.x = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r6.y = dot(r5.zxy, r5.zxy);
    r16.y = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r6.xzw = -UniformVector_0.yxz + 1.0;
    r16.z = ps;
    ps = pow(2.0, r8.y);
    r0.x = dot(r1.zxy, float3(0.11, 0.3, 0.59));
    r8.y = ps;
    r14.xyz = r15.ywz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r0.xxx - r1.xyz;
    r6.y = ps;
    r0.xyz = r0.xyz * UniformScalar_6.xxx + r1.xyz;
    ps = log2(abs(r12.x));
    r5.xyz = r6.yyy * r5.xyz;
    r6.y = ps;
    r1.xyz = r17.yzw * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = UniformScalar_3.x * r6.y;
    r16.xyz = r16.xzy * r0.xyz;
    r6.y = ps;
    r0.xyz = r17.yzw * r2.xxx - r8.xzw;
    ps = pow(2.0, r6.y);
    r7.w = float((r7.w >= 0.004));
    r6.y = ps;
    r6.y = r6.y * UniformScalar_5.x + UniformScalar_4.x;
    r0.xyz = r0.xyz * r0.www + r8.xzw;
    r8.xzw = r0.xyz * r6.zxw;
    ps = LightMapScale.x * r7.y;
    r16.xyz = r16.xyz * r6.yyy;
    r10.x = ps;
    ps = LightMapScale.y * r7.z;
    r16.xyz = r16.xzy * r14.xyz;
    r10.y = ps;
    ps = UniformScalar_10.x * r8.y;
    r14.yz = r16.zy * r10.zz;
    r16.w = ps;
    ps = LightMapScale.z * r7.x;
    r9.xw = r16.xw * r4.ww;
    r10.z = ps;
    ps = AmbientColorAndSkyFactor.x * r6.z;
    r14.xw = r9.xw * r15.xx;
    r7.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.x;
    r14 = r14.wxzy * r1.wwww;
    r7.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r1.xyz = r1.xyz + r14.xxx;
    r7.z = ps;
    r6.xyz = r14.yzw * r0.www + UniformVector_0.xzy;
    r7.xyz = r7.xyz * r0.xyz + r6.xzy;
    r0.xyz = r10.xzy * r13.zzz;
    r9.x = dot(r5.zxy, r13.zxy);
    r5 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.yz = r5.zw * r12.zw + 0.125;
    r6.x = saturate(dot(r11.zxy, r2.zyw));
    ps = log2(r6.x);
    r2.yz = r5.xy + 0.5;
    r6.x = ps;
    r2.xyw = abs(r2.yzx) * abs(r2.yzx);
    ps = 15.0 * r6.x;
    r5.xyz = r8.xwz * r2.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r9.xyz = r8.xwz * r2.yyy;
    r6.x = ps;
    ps = r2.w * r2.w;
    r2.xyz = r10.xzy * r6.xxx;
    r6.w = ps;
    r7.xyz = r9.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r6.xw = r6.yw * r6.zw;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xyz = r6.www * r1.xyz;
    r1.xyz = r1.xzy * r0.www;
    r7.xyz = r2.xyz * r1.xyz + r7.xzy;
    r7.xyz = r0.xzy * r8.xzw + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xzy - r6.xzy;
    r8.w = ps;
    oC0.w = r8.w * r7.w + r3.w;
    r6.xyz = r8.xyz * r7.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
