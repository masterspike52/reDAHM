// ps_01cd73efbe53a4c2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041600 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
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

    ps = -r0.z;
    r14.xy = r0.wz + r0.wz;
    ps = 1.0 + ps;
    r6.z = saturate(r4.w * 0.0001);
    r18.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yw = r0.wz * UniformVector_1.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r1.z + 0.1;
    r5.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r4.w - 4e+02;
    r5.y = ps;
    ps = UniformVector_2.x * r5.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r1.w));
    r6.x = saturate(r6.x * 5.0);
    r1.w = ps;
    ps = 0.00022222222 * r5.x;
    r9.xyz = r1.www * r3.xyz;
    r14.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.xz = -r6.zx + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r3.xyz = r14.xyz * float3(6.0, 6.0, -0.1);
    r8.x = ps;
    r10.xy = r9.xy * r3.zz + r6.yw;
    ps = ModShadowGroupColor.y * r6.z;
    r8.w = r10.y * r5.x;
    r8.y = ps;
    ps = r5.y;
    r18.xzw = -r8.wxy + 1.0;
    ps = r10.x * ps;
    r8.yw = r18.xy * UniformVector_2.yy;
    r8.x = ps;
    ps = UniformVector_2.x * r0.w;
    r22.xyz = UniformVector_5.xyz * 2e+01;
    r8.z = ps;
    ps = r5.z;
    r11 = r8 - 0.5;
    ps = abs(r7.x) * ps;
    r13 = float4((r8.xywz >= 0.5));
    r5.x = ps;
    ps = r5.w;
    r11 = r11.xywz - r8.xywz;
    r8 = r11.xywz * r13.xywz + r8;
    ps = abs(r7.y) * ps;
    r11 = r8.zwxy + r8.zwxy;
    r5.y = ps;
    r8.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r12 = tex2D(Texture2D_3, r11.xy);
    r5.xyz = tex2D(Texture2D_4, r14.xy).xyw;
    r3.xyz = tex2D(Texture2D_4, r3.xy).wxy;
    r19.w = UniformScalar_1.x * UniformVector_4.x;
    ps = r0.w - r0.x;
    r7.xy = UniformVector_1.xy + UniformVector_1.xy;
    r7.z = ps;
    ps = r0.z - r0.y;
    r11.xy = r0.wz * UniformVector_8.xy;
    r7.w = ps;
    ps = 1.0 / r4.w;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r6.yz = r6.yz * r5.ww + ScreenPositionScaleBias.wz;
    ps = r3.y + r3.y;
    r7.xy = r7.xy * r0.wz;
    r4.x = ps;
    ps = r3.z + r3.z;
    r4.zw = r5.xy + r5.xy;
    r4.y = ps;
    r5.xy = r7.wz * UniformScalar_4.xx + r0.yx;
    r4 = r4 - 1.0;
    r3.yz = r4.xy * 0.5 + r4.zw;
    ps = r3.x;
    r21.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    ps = r5.z * ps;
    r21.y = dot(r13.wzz, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.z = (r21.y == 0.0) ? r12.x : r12.y;
    ps = (-1.0) - -r5.w;
    r17 = r21.yxxy + float4(-2.0, -3.0, -2.0, -3.0);
    r3.x = ps;
    r5.z = (r17.x == 0.0) ? r12.z : r5.z;
    r16.w = (r17.w == 0.0) ? r12.w : r5.z;
    ps = UniformVector_6.x * r5.y;
    r5.z = max(r16.w, 0.0);
    r5.y = ps;
    ps = UniformVector_6.y * r5.x;
    r8.x = min(r5.z, 0.3);
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r19.xyz = r8.xyz * float3(3.3333333, 0.875, 0.875);
    r3.w = ps;
    ps = UniformVector_7.y + r5.x;
    r13 = r19.xxxw * r3;
    r5.z = ps;
    r5.x = r13.w * UniformScalar_3.x + r5.y;
    r8.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r12 = tex2D(Texture2D_2, r7.xy).zxyw;
    r3.yzw = tex2D(Texture2D_8, r10.xy).xyz;
    r20 = tex2D(Texture2D_3, r11.zw);
    r6.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r10 = tex2D(Texture2D_7, r5.xz);
    r11.xyz = tex2D(Texture2D_9, r11.xy).xyz;
    r0 = tex2D(Texture2D_6, r0.xy).zxyw;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = float((UniformScalar_17.x >= 1.0));
    r5.x = dot(r2.zxy, r2.zxy);
    ps = r0.x;
    r1.w = float((UniformScalar_17.x > 1.0));
    r5.y = ps;
    r15.xyz = (-abs(r1.www) >= 0.0) ? r11.xyz : 1.0;
    ps = UniformScalar_18.x * r5.y;
    r14.xyz = r10.xyz * r10.www;
    r11.x = ps;
    r10.xyz = r7.zxy * 2.0 - 1.0;
    r7.xyz = r4.wxy * 2.0 - 1.0;
    r6.yzw = r6.wyz * 2.0 - 1.0;
    ps = UniformScalar_18.x * r0.y;
    r10.xzw = r10.xyz - r7.xyz;
    r11.y = ps;
    ps = rsqrt(abs(r5.x));
    r14.xyz = r22.xyz * r14.xyz;
    r5.y = ps;
    ps = UniformScalar_18.x * r0.z;
    r22.xyz = r5.yyy * -SpotDirection.xyz;
    r11.z = ps;
    r15.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r15.xyz;
    r11.xyz = r11.yzx * r15.xyz + UniformScalar_19.xxx;
    ps = r0.w;
    r5.y = dot(r22.zxy, r2.zxy);
    r5.z = ps;
    ps = 1.0 - r5.z;
    r2 = r14.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r5.z = ps;
    r17.x = dot(r2.yx, r5.zz) + 0.0;
    r14.xyz = r2.yzw * r5.zzz;
    r3.x = dot(r14.zy, float2(0.11, 0.59)) + 0.0;
    r5.z = (r21.x == 0.0) ? r20.x : r20.y;
    r5.z = (r17.z == 0.0) ? r20.z : r5.z;
    r17.w = (r17.y == 0.0) ? r20.w : r5.z;
    r17.yz = r19.yz * r18.zw;
    r2.xyz = r17.yzw + float3(0.125, 0.125, 0.25);
    ps = r2.x * r2.y;
    r5.z = r2.z + r17.w;
    r1.w = ps;
    r4.xyz = r1.www * r16.xyz + ModShadowColor.xyz;
    r5.z = saturate(r5.z - r5.w);
    r17.yzw = r5.zzz * r3.yzw;
    r10.y = -r17.w + r12.x;
    ps = UniformVector_4.z * r6.y;
    r10 = r10.zwyx * r12.wwww;
    r2.x = ps;
    ps = UniformVector_4.y * r6.w;
    r12.x = r17.w + r10.z;
    r2.y = ps;
    ps = UniformVector_4.x * r6.z;
    r5.zw = -r17.yz + r12.yz;
    r2.z = ps;
    ps = 1.0 - r2.x;
    r3.yz = r5.zw * r12.ww;
    r16.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r12.yzw = r17.yzx + r3.yzx;
    r5.z = ps;
    ps = SpotAngles.y * r5.z;
    r16.z = saturate(r12.w - r14.x);
    r16.y = saturate(ps);
    r3.xw = -r16.wz + 1.0;
    r11.z = r11.z * r3.w;
    ps = r16.x * r16.z;
    r10.xyz = r7.xyz + r10.wxy;
    r7.x = ps;
    ps = r16.y * r16.y;
    r7.yz = -r2.zy * r16.zz;
    r7.w = ps;
    ps = r13.x;
    r16.xyz = r2.xzy + r7.xyz;
    r5.z = ps;
    ps = 1.0 + r5.z;
    r11.w = r16.x - r10.x;
    r3.y = ps;
    ps = r10.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = 2.5 * r3.x;
    r2.xyw = -UniformVector_0.xyz + 1.0;
    r3.z = ps;
    ps = r3.y * r3.x;
    r6.yw = r16.yz + r13.yz;
    r5.y = ps;
    ps = r3.z * r3.y;
    r13.zw = r6.yw - r10.yz;
    r5.w = ps;
    ps = (-2.0) + r5.z;
    r5.y = float((r5.y > 0.9));
    r5.z = ps;
    ps = (-0.5) + r5.w;
    r14.xyz = r14.xyz * r5.yyy;
    r2.z = saturate(ps);
    r0.xyz = r15.xyz * r0.yzx + r14.xyz;
    ps = r0.x;
    r13.xy = r0.zy - r12.xz;
    ps = -r12.y + ps;
    r0 = r13 * r2.zzzz;
    r13.w = ps;
    ps = r12.z;
    r13.xy = r11.xy * r3.ww;
    ps = r0.y + ps;
    r13.z = r12.x + r0.x;
    r11.y = ps;
    ps = r10.y;
    r3 = r13.wxyz * r2.zzzw;
    ps = r0.z + ps;
    r11.x = r12.y + r3.x;
    r5.y = ps;
    ps = r10.z;
    r2 = r11.wxyz * r2.zxyz;
    ps = r0.w + ps;
    r5.w = r5.z + r2.x;
    r5.z = ps;
    r5.w = r4.w * 2.0 + r5.w;
    r0.xyz = r5.wyz * r6.xxx;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r5.yzw = (r6.xxx > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.xxx >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.yzw = r5.yyy * r1.xyz;
    r6.x = ps;
    r6.xyw = r6.yzw * r6.xxx;
    r6.z = dot(r6.wxy, r9.zxy);
    ps = 1.0 - r5.x;
    r0.xyz = r6.xyw * r6.zzz;
    r6.z = saturate(ps);
    r0.xyz = r0.xyz * 2.0 - r9.xyz;
    ps = log2(r6.z);
    r5.x = saturate(dot(r5.wyz, r0.zxy));
    r6.z = ps;
    ps = log2(r5.x);
    r6.z = r6.z * LightColorAndFalloffExponent.w;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.x = saturate(dot(r6.wyx, r5.wzy));
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.yzw = r3.yzw * r6.yyx;
    r5.x = ps;
    r5.yzw = r2.yzw * r6.xxy + r5.yzw;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r8.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r7.www;
    r5.xyz = r5.xyz * r4.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
