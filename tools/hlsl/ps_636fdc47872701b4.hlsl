// ps_636fdc47872701b4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 516 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000810 10041A00 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 LightMapScale : register(c22); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c13); // float
float4 UniformScalar_1 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformScalar_7 : register(c17); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UniformVector_7 : register(c12); // float4
float4 UpperSkyColor : register(c19); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r10.x = dot(r5.zxy, r5.zxy);
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = float((UniformScalar_5.x >= 1.0));
    r8.y = ps;
    ps = UniformVector_2.x * r1.w;
    r8.xy = r8.xy * abs(r9.xy);
    r12.x = ps;
    r9.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    ps = 0.0001 * r3.w;
    r8.z = dot(r4.zxy, r4.zxy);
    r19.w = saturate(ps);
    ps = rsqrt(abs(r8.z));
    r8.xy = r1.xy * UniformScalar_0.xx;
    r9.z = ps;
    r23 = r9.xyzz * float4(0.875, 0.875, -0.075, 1.0);
    r13 = r23.zwww * r4.xzxy;
    ps = r1.z;
    r8.z = r13.x + r1.w;
    r8.w = ps;
    r4.yzw = tex2D(Texture2D_7, r8.zw).xyz;
    r22.xyz = tex2D(Texture2D_4, r8.xy).xyw;
    r24.x = -r1.z + 1.0;
    r10.yzw = r7.xyz * 2.0 - 1.0;
    r8 = r6.wyxz * 2.0 - 1.0;
    ps = OpacityOverride.x;
    r7 = r1.wzwz * float4(0.5, 0.5, 6.0, 6.0);
    r6.x = saturate(ps);
    ps = r3.w;
    r9.xy = r1.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.w = dot(r8.wzy, r8.wzy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r10.wyz, r10.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r17.xyz = r8.ywz * r6.www;
    r6.z = ps;
    ps = 0.00022222222 * r6.y;
    r15.xyz = r10.ywz * r6.zzz;
    r4.x = saturate(ps);
    ps = 1.0 - r6.x;
    r18 = r4 * float4(-0.025, 6.0, 6.0, 6.0);
    r8.y = ps;
    ps = r22.x + r22.x;
    r4.xyz = r17.yzx * r15.zyx;
    r8.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.y = max(r13.y, 0.0);
    r6.z = ps;
    r4.xyz = r17.xyz * r15.yxz - r4.xyz;
    r9.xy = r13.zw * r18.xx + r9.xy;
    ps = r9.y;
    r11.xyz = r4.xyz * r8.xxx;
    ps = r6.z * ps;
    r6.x = dot(r11.zxy, r11.zxy);
    r6.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r24.yw = -r6.zy + 1.0;
    r24.z = ps;
    ps = r22.y + r22.y;
    r12.yzw = r24.xyz * UniformVector_2.yyx;
    r8.w = ps;
    ps = r12.w;
    r6.yzw = r12.zxy - 0.5;
    ps = r9.x * ps;
    r19.xyz = float3((r12.xyz >= 0.5));
    r8.x = ps;
    r20.xyz = r8.zwx + float3(-1.0, -1.0, -0.5);
    r6.yzw = r6.zwy - r12.xyz;
    r4.yz = float2((r8.xy >= float2(0.5, 0.004)));
    r6.yzw = r6.wyz * r19.zxy + r12.zxy;
    ps = rsqrt(abs(r6.x));
    r11.w = r20.z - r8.x;
    r4.x = ps;
    r16 = r11.xzyw * r4.xxxy;
    r6.x = r8.x + r16.w;
    r6 = r6.zwxy + r6.zwxy;
    r8.zw = tex2D(Texture2D_3, r7.xy).xy;
    r25 = tex2D(Texture2D_1, r6.zw);
    r26 = tex2D(Texture2D_1, r6.xy);
    r14.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r11 = tex2D(Texture2D_6, r1.xy);
    r6.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r10.yzw = tex2D(Texture2D_2, r7.zw).xyw;
    r7.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r6.z = dot(r2.zxy, r2.zxy);
    r9.zw = r7.xy * 2.0 - 1.0;
    r21.zw = r10.yz * 2.0 - 1.0;
    r12.xyz = r6.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r20.z = float((r11.w >= 0.5));
    r6.z = ps;
    r7.xyz = r14.zxy * 2.0 - 1.0;
    ps = UniformVector_4.z * r7.x;
    r14.xyz = r6.zzz * r2.xyz;
    r14.w = ps;
    ps = r10.w;
    r6.xy = r14.zw + float2(0.1, -1.0);
    r10.y = r6.y * r20.z - r12.z;
    ps = r7.w * ps;
    r8.x = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r7.w = (r8.x == 0.0) ? r26.x : r26.y;
    r8.y = r19.z * 2.0 + r4.y;
    r6.z = (r8.y == 0.0) ? r25.x : r25.y;
    ps = 5.0 * r6.x;
    r2 = r8.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r19.x = saturate(ps);
    r6.z = (r2.z == 0.0) ? r25.z : r6.z;
    r7.w = (r2.y == 0.0) ? r26.z : r7.w;
    r19.y = (r2.x == 0.0) ? r26.w : r7.w;
    r8.y = (r2.w == 0.0) ? r25.w : r6.z;
    ps = 0.25 + r8.y;
    r6.z = max(r19.y, 0.0);
    r8.x = ps;
    ps = log2(abs(r24.w));
    r6.x = min(r6.z, 0.3);
    r6.y = ps;
    ps = 3.3333333 * r6.x;
    r8.xyz = r8.zwx + r8.zwy;
    r7.w = ps;
    ps = 0.0125 * r6.y;
    r21.xy = r8.xy - 1.0;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r21 = r21 * float4(0.012, 0.012, 0.5, 0.5);
    r19.z = ps;
    ps = (-1.0) - -r7.x;
    r2 = -r19.wxyz + 1.0;
    r19.x = ps;
    ps = r2.z;
    r19.yz = r9.zw + r21.zw;
    r6.z = ps;
    r9.zw = -r2.yy * ModShadowGroupColor.xy + 1.0;
    ps = r2.x;
    r10.zw = r23.xy * r9.zw;
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r19.xyz = r7.www * r19.xyz;
    r7.w = ps;
    r7.yz = r7.ww * r20.xy + r7.yz;
    r20.xy = r7.yz * UniformVector_4.xy - r21.xy;
    ps = 2.5 * r6.z;
    r7.y = r19.x + 1.0;
    r6.z = ps;
    r7.z = saturate(r6.z * r7.y - 0.5);
    r10.yzw = r10.yzw + float3(1.0, 0.125, 0.125);
    r22.w = r10.y * r7.z;
    r6.xz = r22.zw + float2(-1.0, -2.0);
    r6.y = r6.w * 2.0 + r6.z;
    r6.yw = r6.yx * r2.xx + 1.0;
    r6.x = (r7.w > 0.0) ? r6.w : 1.0;
    r20.w = (r7.w >= 0.0) ? r6.x : 1.0;
    r8.xyw = r20.xyz * r20.zzw;
    r6.xz = r21.xy + r8.xy;
    r6.xz = r6.xz + r19.yz;
    r6.xz = -r12.xy + r6.xz;
    r6.xz = r6.xz * r7.zz + r12.xy;
    r6.xz = r6.xz * r2.xx;
    r6.xyz = (r2.xxx > 0.0) ? r6.xyz : float3(0.0, 1.0, 0.0);
    r6.yzw = (r2.xxx >= 0.0) ? r6.xyz : float3(0.0, 1.0, 0.0);
    r6.x = dot(r6.zyw, r6.zyw);
    ps = rsqrt(abs(r6.x));
    r1.xy = r1.wz * UniformVector_7.xy;
    r6.x = ps;
    r12.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r12.yxz, r13.yzw);
    r6.xyz = r12.xzy * r6.xxx;
    r13.xyz = r6.xyz * 2.0 - r13.zwy;
    r6.xyz = r17.zxy * r13.zzz;
    r6.xyz = r16.xzy * r13.yyy + r6.xyz;
    r6.xyw = r15.yzx * r13.xxx + r6.zyx;
    r15.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r15.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    r6 = xe_cube(r6.xyz);
    ps = 1.0 / abs(r6.z);
    r15.z = r6.w;
    r7.w = ps;
    r15.xy = r6.yx * r7.ww + 1.5;
    r17.xyz = texCUBE(TextureCube_0, xe_cube_dir(r15.xyz)).xyz;
    r19.xyz = tex2D(Texture2D_8, r9.xy).xyz;
    r15.xyz = tex2D(Texture2D_9, r1.xy).xyz;
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_6.x * UniformVector_6.w;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r1.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.w = float((UniformScalar_5.x > 1.0));
    r1.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r2.xyz = r0.xyz * LightMapScale.xyz;
    r1.z = ps;
    r0.xyz = (-abs(r6.www) >= 0.0) ? r15.xyz : 1.0;
    ps = rsqrt(abs(r10.x));
    r1.xyz = r1.xyz * r11.xyz;
    r6.w = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.xyz;
    r7.w = -r20.z + 1.0;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r16.xyz = r7.www * UniformVector_5.xyz;
    r11.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r15.xyz = r1.xyz * r0.xyz;
    r11.y = ps;
    r1.xyz = r20.zzz * UniformScalar_6.xxx + r16.xzy;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r7.x = saturate(r8.z - r7.x);
    r11.z = ps;
    ps = r6.w;
    r8.xyz = r7.xxx * r19.xyz;
    r0.xyz = r18.ywz * r2.www + r17.xzy;
    ps = r5.x * ps;
    r0.xyz = r16.xzy * r0.xyz;
    r7.x = ps;
    r0.xyz = r0.xyz * r7.zzz + UniformVector_0.xzy;
    ps = r6.w;
    r15.xyz = r15.xyz * r8.www;
    r1.xyz = r15.xyz * UniformScalar_7.xxx + r1.xzy;
    r15.xyz = r15.xyz * r7.yyy - r8.xyz;
    r8.xyz = r15.xyz * r7.zzz + r8.xyz;
    r11.xyz = r11.xyz * r8.xyz + r0.xzy;
    ps = r5.y * ps;
    r8.xyz = r8.xyz * r6.yzx;
    r7.z = ps;
    ps = r6.w;
    r0.xyz = r2.xzy * r12.yyy;
    ps = r5.z * ps;
    r6.y = saturate(dot(r14.zxy, r13.zxy));
    r7.w = ps;
    ps = log2(r6.y);
    r6.x = dot(r7.wxz, r12.yxz);
    r6.y = ps;
    r6.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r7.zw = r6.xy + 0.5;
    r6.x = ps;
    r2.xyz = r2.xzy * r6.xxx;
    r6.xyw = abs(r7.zwy) * abs(r7.zwy);
    r7.xyz = r8.xzy * r6.xxx;
    ps = r6.w * r6.w;
    r6.xyz = r8.xzy * r6.yyy;
    r10.x = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r11.xzy;
    r7.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xw = r10.zx * r10.wx;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r6.www * r1.xyz;
    r1.xyz = r5.xzy * r1.xzy;
    r7.xyz = r2.xyz * r1.xyz + r7.xzy;
    r7.xyz = r0.xzy * r8.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r4.z + r3.w;
    r6.xyz = r7.xyz * r4.zzz + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
