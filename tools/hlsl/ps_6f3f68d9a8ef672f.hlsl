// ps_6f3f68d9a8ef672f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041500 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r14.xyz = UniformVector_5.xyz * 2e+01;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.w = UniformScalar_1.x * UniformVector_4.x;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r7.xy);
    r2.z = ps;
    r2.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = -r0.z;
    r5.w = r4.w - 4e+02;
    ps = 1.0 + ps;
    r6.xy = r0.wz * UniformVector_1.xy;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r2.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = UniformVector_2.x * r5.y;
    r8.xyz = r5.xxx * r3.xyz;
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r16.xyz = r2.xyw * float3(-0.1, 0.875, 0.875);
    r5.x = ps;
    r9.xy = r8.xy * r16.xx + r6.xy;
    ps = r5.y;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = -r9.y * r5.x + 1.0;
    ps = r9.x * ps;
    r2.yw = r5.xz * UniformVector_2.yy;
    r2.x = ps;
    r5 = r2 - 0.5;
    r6 = float4((r2.xywz >= 0.5));
    r5 = r5.xywz - r2.xywz;
    r5 = r5.xywz * r6.xywz + r2;
    r12 = r5 + r5;
    r5 = tex2D(Texture2D_3, r12.zw).xwyz;
    r20.x = dot(r6.xyy, float3(1.0, 1.0, 1.0));
    r20.y = dot(r6.wzz, float3(1.0, 1.0, 1.0));
    r6.x = (r20.y == 0.0) ? r5.x : r5.z;
    r19 = r20.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.x = (r19.z == 0.0) ? r5.w : r6.x;
    r5.w = (r19.w == 0.0) ? r5.y : r5.x;
    ps = r0.w + r0.w;
    r5.x = max(r5.w, 0.0);
    r5.y = ps;
    ps = r0.z + r0.z;
    r5.x = min(r5.x, 0.3);
    r5.z = ps;
    r10.xyz = r5.xyz * float3(3.3333333, 6.0, 6.0);
    r3.xyz = tex2D(Texture2D_4, r10.yz).xyw;
    r5.xyz = tex2D(Texture2D_4, r5.yz).xyw;
    ps = UniformVector_1.x + UniformVector_1.x;
    r7.xy = r0.wz - r0.xy;
    r2.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r6.zw = r5.xy + r5.xy;
    r2.y = ps;
    ps = r3.x + r3.x;
    r2.zw = r0.wz * UniformVector_8.xy;
    r6.x = ps;
    r5.xy = r7.xy * UniformScalar_4.xx + r0.xy;
    ps = r3.y + r3.y;
    r5.z = r3.z * r5.z;
    r6.y = ps;
    ps = (-1.0) - -r5.z;
    r2.xy = r2.xy * r0.wz;
    r3.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r5.xy = r5.yx * UniformVector_6.yx;
    r3.w = ps;
    ps = 1.0 / r4.w;
    r7 = r6 - 1.0;
    r6.x = ps;
    r3.yz = r7.xy * 0.5 + r7.zw;
    r6.xy = r9.zw * r6.xx + ScreenPositionScaleBias.wz;
    ps = UniformVector_7.y + r5.x;
    r10 = r10.xxxw * r3;
    r3.y = ps;
    r3.x = r10.w * UniformScalar_3.x + r5.y;
    r7.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r11 = tex2D(Texture2D_2, r2.xy).wxyz;
    r17.xyz = tex2D(Texture2D_8, r9.xy).xyz;
    r6.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r18 = tex2D(Texture2D_3, r12.xy);
    r21 = tex2D(Texture2D_7, r3.xy);
    r3.xyz = tex2D(Texture2D_9, r2.zw).xyz;
    r12 = tex2D(Texture2D_6, r0.xy).wxyz;
    r9.xyz = tex2D(Texture2D_0, r9.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    ps = r4.w;
    r6.w = float((UniformScalar_17.x >= 1.0));
    ps = 0.0001 * ps;
    r5.x = float((UniformScalar_17.x > 1.0));
    r4.x = saturate(ps);
    r13.xyz = r0.zxy * 2.0 - 1.0;
    r15.xyz = r9.zxy * 2.0 - 1.0;
    ps = r1.z;
    r2.xyz = r12.wyz * UniformScalar_18.xxx;
    r3.xyz = (-abs(r5.xxx) >= 0.0) ? r3.xyz : 1.0;
    ps = 0.1 + ps;
    r0.xyz = r21.xyz * r21.www;
    r5.y = ps;
    ps = r12.x;
    r0.xyz = r14.xyz * r0.xyz;
    r5.x = ps;
    r14.yzw = (-abs(r6.www) >= 0.0) ? 1.0 : r3.xyz;
    r3.xyz = r2.xyz * r14.wyz + UniformScalar_19.xxx;
    ps = 1.0 - r5.x;
    r0 = r0.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r5.x = ps;
    r14.x = dot(r0.yx, r5.xx) + 0.0;
    ps = 5.0 * r5.y;
    r2.xyz = r0.zwy * r5.xxx;
    r5.x = saturate(ps);
    r12.x = dot(r2.yx, float2(0.11, 0.59)) + 0.0;
    r5.y = (r20.x == 0.0) ? r18.x : r18.y;
    r5.y = (r19.y == 0.0) ? r18.z : r5.y;
    r18.w = (r19.x == 0.0) ? r18.w : r5.y;
    ps = 1.0 - r5.x;
    r18.xyz = r6.zxy + r6.zxy;
    r6.z = ps;
    ps = 1.0 - r5.w;
    r0 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.x = r0.w + r18.w;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.x = saturate(r5.x - r5.z);
    r4.z = ps;
    ps = 2.5 * r6.x;
    r4.xyz = -r4.xyz + 1.0;
    r6.w = ps;
    ps = r0.x;
    r5.yzw = r5.xxx * r17.xyz;
    r5.x = ps;
    r0.xw = r16.yz * r4.yz + 0.125;
    ps = -r5.w;
    r13.xzw = r13.xyz - r15.xyz;
    ps = r11.w + ps;
    r16.xy = -r5.yz + r11.yz;
    r13.y = ps;
    r11.yz = r16.xy * r11.xx + r5.yz;
    ps = r10.x;
    r14.yzw = r14.yzw * r12.yzw;
    r5.z = ps;
    ps = 1.0 + r5.z;
    r13 = r13.zwxy * r11.xxxx;
    r6.y = ps;
    ps = UniformVector_4.z * r5.x;
    r5.yz = r6.yw * r6.xy;
    r6.x = ps;
    ps = UniformVector_4.y * r0.z;
    r5.x = float((r5.y > 0.9));
    r6.y = ps;
    ps = UniformVector_4.x * r0.y;
    r12.yzw = r2.zxy * r5.xxx;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r12 = r14 + r12;
    r0.y = ps;
    ps = r13.z;
    r3.w = r12.y - r11.y;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r1.w = ps;
    ps = r5.w;
    r2.xyw = -UniformVector_0.xyz + 1.0;
    ps = r13.w + ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r11.x = ps;
    ps = r12.x;
    r4.yzw = r15.xyz + r13.zxy;
    ps = -r2.z + ps;
    r12.xy = r12.wz - r11.xz;
    r0.z = saturate(ps);
    ps = (-0.5) + r5.z;
    r13.yz = -r6.zy * r0.zz;
    r2.z = saturate(ps);
    ps = 1.0 - r0.z;
    r13.xw = r0.yx * r0.zw;
    r0.w = ps;
    r0.xyz = r13.www * r14.xyz + ModShadowColor.xyz;
    ps = r3.x;
    r5.xyz = r6.xzy + r13.xyz;
    ps = r0.w * ps;
    r6.xy = r5.yz + r10.yz;
    r10.z = ps;
    ps = r5.x;
    r12.zw = r6.xy - r4.zw;
    ps = -r4.y + ps;
    r5 = r12.xwyz * r2.zzzz;
    r10.w = ps;
    ps = r11.z;
    r3.xy = r3.yz * r0.ww;
    ps = r5.z + ps;
    r3.z = r11.x + r5.x;
    r10.y = ps;
    ps = r4.z;
    r3 = r3.wxyz * r2.zzzw;
    ps = r5.w + ps;
    r10.x = r11.y + r3.x;
    r5.x = ps;
    ps = r4.w;
    r2 = r10.wxyz * r2.zxyz;
    ps = r5.y + ps;
    r5.z = r1.w + r2.x;
    r5.y = ps;
    r5.z = r9.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r4.xxx;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r4.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r4.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.xxx * r1.xyz;
    r5.x = ps;
    r4.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r5.xyz = r4.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r1.zxy, r5.zxy));
    ps = log2(r5.x);
    r6.xyz = r7.xyz * LightColor.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.x = saturate(dot(r4.zyx, r1.zyx));
    r1.y = ps;
    r5.xyz = r3.yzw * r1.yyx;
    r5.xyz = r2.yzw * r1.xxy + r5.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xyz * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
