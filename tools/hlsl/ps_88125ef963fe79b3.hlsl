// ps_88125ef963fe79b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 471 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000075C 10041700 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
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

    ps = 18.0 * r1.w;
    r0.zw = r1.wz + r1.wz;
    r6.z = ps;
    ps = -r8.w;
    r6.w = UniformScalar_17.x * 0.05;
    ps = UniformScalar_13.x + ps;
    r6.y = r5.w - 4e+02;
    r20.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r2.z + 0.1;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r10.y = ps;
    ps = rsqrt(abs(r7.x));
    r7.yz = r1.wz * 3.0;
    r7.w = ps;
    r7.x = r8.w * (-0.8) + r7.z;
    ps = 0.00022222222 * r6.y;
    r22.x = float((UniformScalar_12.x >= 1.0));
    r16.w = saturate(ps);
    ps = 5.0 * r6.x;
    r11.xyz = r7.www * r4.xyz;
    r16.x = saturate(ps);
    ps = r1.w;
    r6.x = r6.w * r16.w;
    ps = UniformVector_1.x * ps;
    r15.xy = r11.xy * r6.xx;
    r4.y = ps;
    ps = -r1.z;
    r19.w = r15.y + r1.z;
    ps = 1.0 + ps;
    r6.y = -r19.w + 1.0;
    r6.x = ps;
    ps = 6.0 * r7.x;
    r4.zw = r6.xy * UniformVector_1.yy;
    r6.w = ps;
    ps = r10.x;
    r12.xyz = r4.zwy - 0.5;
    ps = abs(r9.x) * ps;
    r22.yzw = float3((r4.yzw >= 0.5));
    r4.x = ps;
    ps = r10.y;
    r20.yzw = r12.xyz - r4.zwy;
    r12.yzw = r20.zwy * r22.wyz + r4.wyz;
    ps = abs(r9.y) * ps;
    r6.xy = r12.zw + r12.zw;
    r4.y = ps;
    r2.w = tex2D(Texture2D_7, r1.xy).w;
    r14.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r18.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r17 = tex2D(Texture2D_3, r6.xy);
    r19.xyz = tex2D(Texture2D_4, r6.zw).xyw;
    r13 = tex2D(Texture2D_4, r7.yx).xywz;
    ps = 1.0 / r5.w;
    r10.z = r13.w * (-0.3);
    r6.x = ps;
    ps = r13.x + r13.x;
    r9.yw = r5.xy * ScreenPositionScaleBias.xy;
    r7.x = ps;
    ps = 0.0001 * r5.w;
    r9.x = saturate(r8.w * 15.0);
    r16.y = saturate(ps);
    r10.xy = r9.yw * r6.xx + ScreenPositionScaleBias.wz;
    ps = r13.y + r13.y;
    r4.yzw = r19.xyw + r19.xyw;
    r7.y = ps;
    ps = (-1.0) + r4.y;
    r7.z = dot(r22.yzz, float3(1.0, 1.0, 1.0));
    r18.z = ps;
    r6.x = (r7.z == 0.0) ? r17.x : r17.y;
    r6.y = r20.x * r22.x + r8.w;
    ps = (-1.0) + r4.z;
    r7 = r7.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r18.w = ps;
    r6.x = (r7.w == 0.0) ? r17.z : r6.x;
    ps = -r6.y;
    r18 = r18 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r8.z + ps;
    r6.zw = r7.xy + r18.zw;
    r6.y = ps;
    ps = r19.z;
    r6.y = max(r6.y, UniformScalar_14.x);
    r7.y = (r7.z == 0.0) ? r17.w : r6.x;
    ps = r13.z * ps;
    r6.x = max(r7.y, 0.0);
    r7.x = ps;
    ps = 1.0 / UniformScalar_15.x;
    r6.xy = min(r6.yx, float2(1.0, 0.3));
    r7.z = ps;
    ps = (-1.0) - -r7.x;
    r7.z = saturate(r6.x * r7.z);
    r6.x = ps;
    ps = 3.3333333 * r6.y;
    r5.yz = -r7.yz + 1.0;
    r16.z = ps;
    ps = 0.01 * r6.z;
    r7.yzw = -r16.zxy + 1.0;
    r10.w = ps;
    r6.y = r9.x * r7.y + r16.z;
    ps = ModShadowGroupColor.x * r7.z;
    r15.zw = r10.zw * r6.yy;
    r21.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r20.xyz = r6.xzy * r6.yyw;
    r21.y = ps;
    ps = r5.z;
    r6.xzw = r15.wxz + r1.xwy;
    r6.y = r20.z * 0.025 + r6.w;
    ps = r8.w * ps;
    r8.x = r6.z * UniformVector_1.x;
    r5.x = ps;
    ps = (-0.5) - -r8.x;
    r13.xyz = r14.xyz + r14.xyz;
    r8.w = ps;
    ps = r8.w;
    r8.yz = r5.xy * r13.ww;
    ps = -r8.x + ps;
    r21.zw = float2((r8.xy >= float2(0.5, 0.05)));
    r8.w = ps;
    r12.x = r8.w * r21.z + r8.x;
    r17.xyz = -r21.xyw + 1.0;
    r8.x = (UniformScalar_13.x > 0.0) ? r17.z : 1.0;
    r8.x = (UniformScalar_13.x >= 0.0) ? r8.x : r17.z;
    ps = r6.z + r6.z;
    r13.w = r8.x * r2.w;
    r4.x = ps;
    ps = r12.x + r12.x;
    r15 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    r8.x = ps;
    ps = r12.y + r12.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r15.wwww)) clip(-1.0);
    r8.w = ps;
    r10.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r9.z = tex2D(ShadowTexture, r0.xy).x;
    r14 = tex2D(Texture2D_2, r0.zw);
    r16.xyz = tex2D(Texture2D_8, r4.xw).xyz;
    r19 = tex2D(Texture2D_3, r8.xw);
    r12.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r23.xyz = tex2D(Texture2D_5, r6.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r4.xw).xyz;
    r6.w = tex2D(Texture2D_6, r1.xy).x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r10.w = float((UniformScalar_9.x >= 1.0));
    r0.w = float((UniformScalar_9.x > 1.0));
    r6.z = dot(r2.zxy, r2.zxy);
    r6.x = dot(r3.zxy, r3.zxy);
    r13.xyz = r4.xyw * 2.0 - 1.0;
    r1.xyw = r23.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r23.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r6.y = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r12.xyz = r23.xyz * r12.xyz;
    r6.x = ps;
    r4.xyz = r12.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = log2(r6.y);
    r23.xyz = r6.xxx * -SpotDirection.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r23.zxy, r3.zxy);
    r6.z = ps;
    ps = -SpotAngles.x - -r6.y;
    r3.xyz = r6.zzz * r2.xyz;
    r6.z = ps;
    r2.zw = r1.xy * UniformVector_3.xy + r20.yz;
    r20.w = r22.w * 2.0 + r21.z;
    r6.y = (r20.w == 0.0) ? r19.x : r19.y;
    ps = SpotAngles.y * r6.z;
    r1.xyz = r20.xww + float3(1.0, -3.0, -2.0);
    r2.y = saturate(ps);
    r6.y = (r1.z == 0.0) ? r19.z : r6.y;
    ps = abs(r1.x) * abs(r1.x);
    r8.x = r1.x * r5.y;
    r2.x = ps;
    r6.z = r8.z * r1.x - r8.x;
    r8.y = (r1.y == 0.0) ? r19.w : r6.y;
    ps = 1.0 - r8.y;
    r17.xy = r18.xy * r17.xy;
    r6.y = ps;
    r8.zw = r9.xx * r6.yz;
    r6.yz = r8.zx + r8.yw;
    r9.w = saturate(r6.z * 2.5 - 0.5);
    r6.y = r6.y + r8.z;
    r17.z = r6.y + r8.y;
    r8.xyz = r17.xyz + float3(0.125, 0.125, 0.25);
    ps = r8.x * r8.y;
    r6.y = saturate(r8.z - r7.x);
    r6.z = ps;
    r0.xyz = r6.zzz * r0.xyz + ModShadowColor.xyz;
    r1.xyz = r6.yyy * r16.xyz;
    ps = -r1.z;
    r8.xzw = r15.zxy - r13.zxy;
    ps = r14.z + ps;
    r6.yz = -r1.xy + r14.xy;
    r8.y = ps;
    r1.xy = r6.yz * r14.ww + r1.xy;
    r8 = r8.zwxy * r14.wwww;
    r1.z = r1.z + r8.w;
    ps = r8.z;
    r13.xyz = r13.xyz + r8.xyz;
    r6.y = ps;
    r12.w = r1.w * UniformVector_3.z - r13.z;
    ps = (-2.0) + r6.y;
    r9.xy = r2.zw - r13.xy;
    r1.w = ps;
    r12.xyz = r12.xyz * r5.yyy - r1.xyz;
    r8.xyz = r9.xyz * r9.wwz;
    r8.xy = r13.xy + r8.xy;
    r10.xyz = r8.zzz * r10.xyz;
    r12 = r12 * r9.wwww + r1;
    r8.z = r4.w * 2.0 + r12.w;
    r8.xyz = r8.zxy * r7.www;
    ps = 1.0 + r8.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r8.w = ps;
    r8.xyz = (r7.www > 0.0) ? r8.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.www >= 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.y));
    r1.xyz = r12.xyz * r1.xyz;
    r6.y = ps;
    r8.yzw = r7.xyz * r6.yyy;
    ps = UniformScalar_8.x * r6.w;
    r6.y = dot(r8.wyz, r11.zxy);
    r7.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.yzw = r8.yzw * r6.yyy;
    r8.x = ps;
    r6.xyz = r6.yzw * 2.0 - r11.xyz;
    ps = r2.x * r2.x;
    r6.x = saturate(dot(r3.zxy, r6.zxy));
    r7.y = ps;
    ps = log2(r6.x);
    r6.w = saturate(dot(r8.wzy, r3.zyx));
    r6.x = ps;
    ps = r2.y * r2.y;
    r6.y = r6.x * UniformScalar_7.x;
    r7.w = ps;
    ps = pow(2.0, r6.y);
    r6.x = r6.x * 15.0;
    r7.z = ps;
    ps = pow(2.0, r8.x);
    r6.yz = r7.xy * r7.zy;
    r8.x = ps;
    r8.y = (r0.w > 0.0) ? 0.0 : r6.y;
    r8 = r10.xzyw * r8.xxxy;
    r2.xyz = r4.xyz + r8.www;
    r2.xyz = r6.zzz * r2.xyz;
    r2.xyz = r2.xyz * r9.www;
    ps = pow(2.0, r6.x);
    r2.xyz = r2.xyz * r5.yyy;
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.www;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
