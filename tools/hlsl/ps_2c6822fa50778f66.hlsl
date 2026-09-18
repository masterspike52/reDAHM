// ps_2c6822fa50778f66.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 588 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000930 10041700 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c30); // float4
float4 LightMapScale : register(c31); // float3
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

    r0.z = dot(r4.zxy, r4.zxy);
    ps = UniformScalar_17.x;
    r8.x = r3.w - 4e+02;
    ps = 0.05 * ps;
    r8.x = saturate(r8.x * 0.00022222222);
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r8.x = r0.w * r8.x;
    r0.z = ps;
    r19.xyz = r0.zzz * r4.xyz;
    ps = -r1.z;
    r20.xy = r19.xy * r8.xx;
    ps = 1.0 + ps;
    r23.w = r20.y + r1.z;
    r0.z = ps;
    ps = OpacityOverride.x;
    r0.w = -r23.w + 1.0;
    r8.x = saturate(ps);
    ps = 1.0 - r8.x;
    r11.yz = r0.zw * UniformVector_1.yy;
    r11.w = ps;
    ps = UniformVector_1.x * r1.w;
    r22.w = saturate(r8.w * 15.0);
    r11.x = ps;
    r4.xyz = r11.zxy - 0.5;
    r10 = float4((r11.zxyw >= float4(0.5, 0.5, 0.5, 0.004)));
    r4.xyz = r4.xyz - r11.zxy;
    r4.xyz = r4.yzx * r10.yzx + r11.xyz;
    r14.yzw = r4.zxy + r4.zxy;
    r13 = tex2D(Texture2D_3, r14.zw);
    ps = UniformScalar_13.x - r8.w;
    r21.x = r1.w * 3.0;
    r12.w = ps;
    r0.w = float((UniformScalar_12.x >= 1.0));
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    r12.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.yw = r1.wz * float2(18.0, 3.0);
    r4.z = ps;
    r21.y = r8.w * (-0.8) + r4.w;
    ps = rsqrt(abs(r0.z));
    r7.x = dot(r12.zxy, r12.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r11.xyz = r7.yyy * r2.xyz;
    r0.z = ps;
    r12 = r12.wxzy * r0.wzzz;
    ps = r4.x;
    r7.x = r12.x + r8.w;
    ps = abs(r9.x) * ps;
    r7.x = -r7.x + r8.z;
    r0.z = ps;
    ps = r7.x;
    r11.w = dot(r10.yzz, float3(1.0, 1.0, 1.0));
    r2.x = ps;
    r7.w = (r11.w == 0.0) ? r13.x : r13.y;
    ps = UniformScalar_14.x;
    r7.xyz = r11.zww + float3(0.1, -3.0, -2.0);
    r2.z = ps;
    r7.w = (r7.z == 0.0) ? r13.z : r7.w;
    r16.y = (r7.y == 0.0) ? r13.w : r7.w;
    ps = max(r2.x, r2.z);
    r2.y = max(r16.y, 0.0);
    r2.x = ps;
    ps = r4.z;
    r21.zw = min(r2.yx, float2(0.3, 1.0));
    ps = abs(r9.y) * ps;
    r4.xz = r21.zy * float2(3.3333333, 6.0);
    r0.w = ps;
    r17.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r23.xyz = tex2D(Texture2D_4, r4.yz).xyw;
    r2 = tex2D(Texture2D_4, r21.xy);
    ps = 0.0001 * r3.w;
    r13.x = saturate(ps);
    r15 = r6.wyxz * 2.0 - 1.0;
    ps = r2.z;
    r0.w = r23.z * r2.w;
    r6.y = ps;
    ps = (-0.3) * r6.y;
    r6.x = dot(r15.wzy, r15.wzy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.w = r0.w - 1.0;
    r6.x = ps;
    ps = r2.x + r2.x;
    r18.xyz = r15.ywz * r6.xxx;
    r16.x = ps;
    ps = r19.z;
    r6.xzw = r18.yzx * r12.wzy;
    r9.x = ps;
    r6.xzw = r18.xyz * r12.zyw - r6.xzw;
    ps = 0.0;
    r15.yzw = r23.wxy + r23.wxy;
    r9.y = ps;
    ps = max(r9.x, r9.y);
    r17.zw = r15.zw - 1.0;
    r13.w = ps;
    ps = 1.0 / UniformScalar_15.x;
    r22.xyz = r6.xzw * r15.xxx;
    r6.x = ps;
    ps = 5.0 * r7.x;
    r16.z = saturate(r21.w * r6.x);
    r16.w = saturate(ps);
    ps = 1.0 - r4.x;
    r6.x = dot(r22.zxy, r22.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r7.yzw = -r16.zwy + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r21 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    r13.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r17 = r22.xzyw * r6.xxxz;
    r13.z = ps;
    ps = r2.y + r2.y;
    r13 = -r13 + 1.0;
    r16.y = ps;
    ps = r7.y;
    r16.zw = r21.xy * r13.yz;
    ps = r8.w * ps;
    r16 = r16 + float4(-1.0, -1.0, 0.125, 0.125);
    r7.x = ps;
    ps = r4.x;
    r9.xz = r16.xy + r21.zw;
    ps = r17.w + ps;
    r6.z = r9.x * 0.01;
    r9.y = ps;
    ps = r9.w * r9.y;
    r8.yz = r7.wx * r2.zz;
    r6.x = ps;
    ps = r9.x * r9.y;
    r20.zw = r6.yz * r9.yy;
    r6.y = ps;
    ps = r9.y * r9.z;
    r2.xyw = r20.wxz + r1.xwy;
    r6.z = ps;
    r2.z = r6.z * 0.025 + r2.w;
    ps = UniformVector_1.x * r2.y;
    r12.x = dot(r5.zxy, r5.zxy);
    r8.x = ps;
    ps = (-0.5) - -r8.x;
    r0.z = float((UniformScalar_9.x > 1.0));
    r6.w = ps;
    r8.w = r6.w - r8.x;
    ps = 1.0 + r6.x;
    r7.yz = float2((r8.xz >= float2(0.5, 0.05)));
    r7.x = ps;
    ps = r1.w + r1.w;
    r13.yz = r8.wy * r7.yx;
    r9.x = ps;
    ps = r1.z + r1.z;
    r6.w = r8.x + r13.y;
    r9.y = ps;
    ps = r2.y + r2.y;
    r14.x = r6.w + r6.w;
    r15.x = ps;
    r6.w = tex2D(Texture2D_7, r1.xy).w;
    r4.xyz = tex2D(Texture2D_5, r2.xz).xyz;
    r20 = tex2D(Texture2D_3, r14.xy).zwyx;
    r14 = tex2D(Texture2D_2, r9.xy);
    r8.xyw = tex2D(Texture2D_0, r15.xy).zyx;
    r9.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r21.xyz = r9.xyz * 2.0 - 1.0;
    r9.xyz = r8.wyx * 2.0 - 1.0;
    r21.xyz = r21.xyz - r9.xyz;
    r9.w = r21.z * r14.w - 2.0;
    r9.xyz = r21.xyz * r14.www + r9.xyz;
    r21.x = r7.x * r7.w;
    r8.z = r10.x * 2.0 + r7.y;
    r4.w = (r8.z == 0.0) ? r20.w : r20.z;
    ps = 1.0 - r7.z;
    r8.yz = r8.zz + float2(-3.0, -2.0);
    r7.y = ps;
    r18.w = (UniformScalar_13.x > 0.0) ? r7.y : 1.0;
    r20.w = (UniformScalar_13.x >= 0.0) ? r18.w : r7.y;
    ps = r13.z;
    r4.xyz = r4.xyz + r4.xyz;
    r7.y = (r8.z == 0.0) ? r20.x : r4.w;
    r21.w = (r8.y == 0.0) ? r20.y : r7.y;
    ps = -r21.x + ps;
    r20.y = -r21.w + 1.0;
    r20.x = ps;
    r21.yz = r22.ww * r20.xy;
    r8.yw = r21.zx + r21.wy;
    r8.w = saturate(r8.w * 2.5 - 0.5);
    r7.y = r8.y + r21.z;
    r4.w = r7.y + r21.w;
    r4 = r4 + float4(-1.0, -1.0, -1.0, 0.25);
    r20.z = r4.z * UniformVector_3.z - r9.z;
    r6.xy = r4.xy * UniformVector_3.xy + r6.yz;
    r20.xy = r6.xy - r9.xy;
    r7.y = r20.w * r6.w - 0.5;
    r6.xyz = r20.xyz * r8.www + r9.xyw;
    r6.w = r8.x * 2.0 + r6.z;
    r6.xyz = r6.wxy * r13.xxx;
    ps = 1.0 + r6.x;
    r9.w = float((UniformScalar_9.x >= 1.0));
    r6.w = ps;
    r6.xyz = (r13.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r13.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r19.zxy);
    r6.xyz = r4.xyz * r6.xxx;
    r9.xyz = r6.xyz * 2.0 - r19.xyz;
    r6.xyz = r18.zxy * r9.zzz;
    r6.xyz = r17.xzy * r9.yyy + r6.xyz;
    r6.xyw = r12.zwy * r9.xxx + r6.zyx;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r7.y = ps;
    r8.xy = r6.yx * r7.yy + 1.5;
    r12.yzw = tex2D(Texture2D_8, r15.xy).xyz;
    r1.w = tex2D(Texture2D_6, r1.xy).x;
    r1.xyz = tex2D(Texture2D_7, r2.xz).xyz;
    r15.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r6.w = UniformScalar_7.x * (-XE_FLT_MAX);
    ps = UniformVector_5.x * UniformVector_5.w;
    r17.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r2.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r2.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r7.y = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r2.z = ps;
    r13.xyz = r2.xyz * r1.xyz;
    r1.xyz = r13.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r2.xyz = r13.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = pow(2.0, r6.w);
    r18.xyz = r7.yyy - r15.xyz;
    r6.w = ps;
    r15.xyz = r18.xyz * UniformScalar_4.xxx + r15.xyz;
    ps = log2(abs(r13.w));
    r2.w = r6.w * UniformScalar_8.x;
    r6.w = ps;
    ps = UniformScalar_1.x * r6.w;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r15.xyz = r17.xyz * r15.xyz;
    r6.w = ps;
    r6.w = r6.w * UniformScalar_3.x + UniformScalar_2.x;
    ps = -UniformVector_0.x;
    r7.y = r16.z * r16.w;
    r8.xyz = r7.yyy * r8.xyz + ModShadowColor.xyz;
    ps = 1.0 + ps;
    r15.xyz = r15.xyz * r6.www;
    r7.y = ps;
    ps = abs(r7.x) * abs(r7.x);
    r2.xyz = r15.xyz * r2.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r12.x));
    r2 = r2 * r1.wwww;
    r7.z = ps;
    r2 = (-abs(r0.zzzz) >= 0.0) ? r2 : 0.0;
    ps = r6.w * r6.w;
    r0.xyz = r7.zzz * r5.xyz;
    r6.w = ps;
    r2 = (-abs(r9.wwww) >= 0.0) ? 0.0 : r2;
    ps = r6.w * r6.w;
    r1.xyz = r1.xyz + r2.www;
    r6.w = ps;
    ps = -UniformVector_0.y;
    r1.xyz = r6.www * r1.xyz;
    ps = 1.0 + ps;
    r2.xyz = r8.www * r2.xyz;
    r7.z = ps;
    ps = -UniformVector_0.z;
    r1.xyz = r1.xyz * r8.www;
    ps = 1.0 + ps;
    r1.xyz = r1.xzy * r7.www;
    r7.x = ps;
    r5.xyz = r2.xyz * r7.www + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r6.w = saturate(r4.w - r0.w);
    r12.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r2.xyz = r6.www * r12.yzw;
    r12.y = ps;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r15.xyz = -r2.xzy + r14.xzy;
    r12.z = ps;
    r2.xyz = r15.xyz * r14.www + r2.xzy;
    r13.xyz = r13.xyz * r7.www - r2.xzy;
    r2.xyz = r13.xyz * r8.www + r2.xzy;
    r5.xyz = r12.xyz * r2.xyz + r5.xyz;
    ps = LightMapScale.x * r6.y;
    r7.xyz = r2.xyz * r7.yzx;
    r2.x = ps;
    ps = LightMapScale.y * r6.z;
    r6.w = saturate(dot(r11.zxy, r9.zxy));
    r2.y = ps;
    ps = log2(r6.w);
    r0.x = dot(r0.zxy, r4.zxy);
    r0.y = ps;
    ps = LightMapScale.z * r6.x;
    r0.xyz = r0.xxy * float3(-0.5, 0.5, 15.0);
    r2.z = ps;
    ps = pow(2.0, r0.z);
    r6.xy = r0.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r0.xyz = r2.xzy * r4.zzz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r2.xyz = r2.xzy * r6.zzz;
    r6.x = ps;
    r4.xyz = r7.xzy * r6.yyy;
    r6.xyz = r7.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r5.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r2.xyz * r1.xyz + r6.xzy;
    r6.xyz = r0.xzy * r7.xyz + r6.xzy;
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
