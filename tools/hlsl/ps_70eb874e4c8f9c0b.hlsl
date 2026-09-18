// ps_70eb874e4c8f9c0b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 444 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006F0 10041600 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c18); // float4
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c20); // float2
float4 SpotDirection : register(c19); // float3
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11.xz = r1.wz + r1.wz;
    r10.xyw = tex2D(Texture2D_4, r11.xz).xyw;
    ps = r1.w;
    r11.y = -r1.z + 1.0;
    ps = UniformVector_2.x * ps;
    r9.w = UniformScalar_1.x * UniformVector_4.x;
    r13.y = ps;
    ps = r1.w - r1.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    ps = r1.z - r1.y;
    r6.x = r5.w - 4e+02;
    r7.y = ps;
    ps = 0.00022222222 * r6.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r11.w = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r13.zw = r10.xy + r10.xy;
    r6.x = ps;
    r7.xy = r7.yx * UniformScalar_4.xx + r1.yx;
    ps = 1.0 / UniformScalar_2.x;
    r9.xyz = r6.xxx * -SpotDirection.xyz;
    r12.w = ps;
    ps = rsqrt(abs(r6.w));
    r6.y = dot(r9.zxy, r3.zxy);
    r6.x = ps;
    ps = -SpotAngles.x - -r6.y;
    r9.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r12.xyz = r11.xzw * float3(6.0, 6.0, -0.1);
    r22.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r3.xyz = r9.xwy * r12.zwz;
    r22.w = ps;
    r22.xy = r1.wz * UniformVector_1.xy + r3.xz;
    ps = UniformVector_1.x + UniformVector_1.x;
    r4.xy = r22.yz * r22.wz;
    r0.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r11.x = -r4.x + 1.0;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyw = r11.zxy * UniformVector_2.xyy;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.x = r6.x * r22.x;
    r7.w = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r4.zw = r1.wz * UniformVector_8.xy;
    r0.w = ps;
    ps = UniformVector_6.x * r7.y;
    r16.zw = r5.xy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = UniformVector_6.y * r7.x;
    r0.zw = r0.zw * r1.wz;
    r7.x = ps;
    ps = (-0.5) + r6.y;
    r11.xy = r7.zw * abs(r8.xy);
    r7.z = ps;
    ps = (-0.5) + r6.w;
    r15.xy = float2((r6.yw >= 0.5));
    r7.w = ps;
    ps = UniformScalar_3.x * r3.y;
    r16.xy = r7.zw - r6.yw;
    r14.x = ps;
    ps = r15.x + r15.x;
    r17 = r13.zxwy + float4(-1.0, -0.5, -1.0, -0.5);
    r14.y = ps;
    ps = 1.0 / r5.w;
    r7.zw = float2((r13.xy >= 0.5));
    r15.z = ps;
    r8.xy = r16.zw * r15.zz + ScreenPositionScaleBias.wz;
    r3.yw = r16.xy * r15.xy + r6.yw;
    ps = r15.y + r15.y;
    r6.xy = r17.yw - r13.xy;
    r14.z = ps;
    r20.xzw = r14.xyz + r7.yzw;
    r3.xz = r6.xy * r7.zw + r13.xy;
    ps = UniformVector_7.y + r7.x;
    r3 = r3 + r3;
    r20.y = ps;
    r8.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r17.y = tex2D(ShadowTexture, r0.xy).x;
    r14 = tex2D(Texture2D_2, r0.zw).zxyw;
    r13.yzw = tex2D(Texture2D_8, r22.xy).xyz;
    r18.yw = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r19 = tex2D(Texture2D_3, r3.zw);
    r21 = tex2D(Texture2D_3, r3.xy);
    r16.xyz = tex2D(Texture2D_9, r4.zw).xyz;
    r11.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r3 = tex2D(Texture2D_7, r20.xy);
    r15 = tex2D(Texture2D_6, r1.xy);
    r7.xyw = tex2D(Texture2D_0, r22.xy).xyz;
    r1.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r4.xzw = tex2D(Texture2D_4, r12.xy).xyw;
    ps = r5.w;
    r6.x = r2.z + 0.1;
    ps = 0.0001 * ps;
    r0.yzw = -ModShadowColor.xyz + 1.0;
    r6.y = saturate(ps);
    ps = r4.x + r4.x;
    r5.xyz = UniformVector_5.xyz * 2e+01;
    r18.z = ps;
    r12.xyz = r1.zxy * 2.0 - 1.0;
    r10.xyz = r7.wxy * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r7.z = float((UniformScalar_17.x >= 1.0));
    r6.x = saturate(ps);
    ps = 1.0 - r6.z;
    r1.w = float((UniformScalar_17.x > 1.0));
    r0.x = saturate(ps);
    ps = r15.w;
    r1.xyz = r3.xyz * r3.www;
    r6.z = ps;
    ps = 1.0 - r6.z;
    r3.xyz = r15.zxy * UniformScalar_18.xxx;
    r6.w = ps;
    r11.xyz = r11.zxy * 2.0 - 1.0;
    r16.xyz = (-abs(r1.www) >= 0.0) ? r16.xyz : 1.0;
    r16.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r16.xyz;
    ps = log2(r0.x);
    r7.xyz = r11.xzy * UniformVector_4.zyx;
    r6.z = ps;
    r3.xyz = r3.xyz * r16.zxy + UniformScalar_19.xxx;
    ps = 1.0 - r6.x;
    r1.xyz = r5.xyz * r1.xyz;
    r0.x = ps;
    ps = 1.0 - r6.y;
    r5 = r1.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r1.w = ps;
    r13.x = dot(r5.yx, r6.ww) + 0.0;
    r1.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = r4.w;
    r11.xyz = r5.yzw * r6.www;
    r0.x = dot(r11.zy, float2(0.11, 0.59)) + 0.0;
    r6.y = (r20.z == 0.0) ? r21.x : r21.y;
    r6.x = (r20.w == 0.0) ? r19.x : r19.y;
    ps = r10.w * ps;
    r20 = r20.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r5.y = ps;
    r6.x = (r20.z == 0.0) ? r19.z : r6.x;
    r6.y = (r20.y == 0.0) ? r21.z : r6.y;
    r5.z = (r20.x == 0.0) ? r21.w : r6.y;
    r17.w = (r20.w == 0.0) ? r19.w : r6.x;
    ps = r17.w;
    r12.xzw = r12.xyz - r10.xyz;
    r6.y = ps;
    ps = 0.0;
    r5.xw = r5.yz + float2(-1.0, 0.25);
    r6.w = ps;
    ps = max(r6.y, r6.w);
    r6.x = r5.w + r5.z;
    r6.y = ps;
    ps = r6.x;
    r18.x = min(r6.y, 0.3);
    ps = -r5.y + ps;
    r6.xyw = r18.ywx * float3(0.875, 0.875, 3.3333333);
    r1.z = saturate(ps);
    ps = r4.z + r4.z;
    r13.yzw = r1.zzz * r13.yzw;
    r18.w = ps;
    ps = -r13.w;
    r18.xy = r6.xy * r1.xy;
    ps = r14.x + ps;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r12.y = ps;
    r5.yz = r18.zw * 0.5 + r17.xz;
    ps = r18.x * r18.y;
    r12 = r12.zwxy * r14.wwww;
    r1.x = ps;
    r1.xyz = r1.xxx * r0.yzw + ModShadowColor.xyz;
    r14.x = r13.w + r12.w;
    r0.yz = -r13.yz + r14.yz;
    r0.yz = r0.yz * r14.ww;
    r14.yzw = r13.yzx + r0.yzx;
    r0.y = r6.w * r5.x + 1.0;
    ps = 1.0 - r7.x;
    r17.z = saturate(r14.w - r11.x);
    r17.x = ps;
    r0.xw = -r17.wz + 1.0;
    r13.z = r3.x * r0.w;
    r0.z = dot(r2.zxy, r2.zxy);
    ps = r17.x * r17.z;
    r4.xzw = r10.xyz + r12.zxy;
    r10.x = ps;
    ps = r17.y * r17.y;
    r10.yz = -r7.zy * r17.zz;
    r10.w = ps;
    ps = r12.z;
    r7.xyz = r7.xzy + r10.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r0.z));
    r13.w = r7.x - r4.x;
    r6.y = ps;
    ps = 2.5 * r0.x;
    r12.xyw = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    r13.xy = r6.ww * r5.yz + r7.yz;
    ps = r0.y * r0.x;
    r5.xyz = r6.yyy * r2.xyz;
    r6.w = ps;
    ps = r0.z * r0.y;
    r2.zw = r13.xy - r4.zw;
    r6.y = ps;
    ps = (-2.0) + r6.x;
    r7.z = float((r6.w > 0.9));
    r6.w = ps;
    ps = (-0.5) + r6.y;
    r11.xyz = r11.xyz * r7.zzz;
    r12.z = saturate(ps);
    r7.xyz = r16.xyz * r15.xyz + r11.xyz;
    ps = r7.x;
    r2.xy = r7.zy - r14.xz;
    ps = -r14.y + ps;
    r11 = r2 * r12.zzzz;
    r2.w = ps;
    ps = r14.z;
    r2.xy = r3.yz * r0.ww;
    ps = r11.y + ps;
    r2.z = r14.x + r11.x;
    r13.y = ps;
    ps = r4.z;
    r3 = r2.wxyz * r12.zzzw;
    ps = r11.z + ps;
    r13.x = r14.y + r3.x;
    r6.x = ps;
    ps = r4.w;
    r2 = r13.wxyz * r12.zxyz;
    ps = r11.w + ps;
    r6.w = r6.w + r2.x;
    r6.y = ps;
    r6.w = r7.w * 2.0 + r6.w;
    r7.xyz = r6.wxy * r1.www;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r6.xyw = (r1.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r1.www >= 0.0) ? r6.xyw : float3(0.0, 0.0, 1.0);
    r6.x = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r10.www * r8.xyz;
    r6.x = ps;
    r0.xyz = r0.xyz * r6.xxx;
    r6.x = dot(r0.zxy, r9.zxy);
    ps = LightColorAndFalloffExponent.w * r6.z;
    r8.xyz = r0.xyz * r6.xxx;
    r6.y = ps;
    r6.xzw = r8.xyz * 2.0 - r9.xyz;
    ps = pow(2.0, r6.y);
    r6.x = saturate(dot(r5.zxy, r6.wxz));
    r6.y = ps;
    ps = log2(r6.x);
    r7.xyz = r7.xzy * r6.yyy;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r0.x = saturate(dot(r0.zyx, r5.zyx));
    r0.y = ps;
    r6.xyz = r3.yzw * r0.yyx;
    r6.xyz = r2.yzw * r0.xxy + r6.xyz;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r4.yyy;
    r6.xyz = r6.xzy * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
