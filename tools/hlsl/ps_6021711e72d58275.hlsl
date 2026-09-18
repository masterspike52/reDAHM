// ps_6021711e72d58275.bin
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
    r19.z = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r0.wz - r0.xy;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r7.xy);
    r11.z = ps;
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = -r0.z;
    r9.w = UniformScalar_1.x * UniformVector_4.x;
    ps = 1.0 + ps;
    r5.w = r4.w - 4e+02;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = UniformVector_2.x * r5.y;
    r9.xyz = r5.xxx * r3.xyz;
    r5.y = ps;
    ps = 1.0 / UniformScalar_2.x;
    r18.xyz = r6.xyz * float3(-0.1, 0.875, 0.875);
    r18.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.xyz = r9.wxy * r18.wxx;
    r5.x = ps;
    r10.xy = r0.wz * UniformVector_1.xy + r6.yz;
    ps = r5.y;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = -r10.y * r5.x + 1.0;
    ps = r10.x * ps;
    r11.yw = r5.xz * UniformVector_2.yy;
    r11.x = ps;
    r5 = r11 - 0.5;
    r7 = float4((r11.xywz >= 0.5));
    r5 = r5.xywz - r11.xywz;
    r5 = r5.xywz * r7.xywz + r11;
    r11 = r5 + r5;
    r3 = tex2D(Texture2D_3, r11.zw);
    r14.yz = r0.wz + r0.wz;
    ps = UniformVector_1.x + UniformVector_1.x;
    r5.zw = r0.wz * UniformVector_8.xy;
    r6.y = ps;
    r5.xy = r8.xy * UniformScalar_4.xx + r0.xy;
    ps = 1.0 / r4.w;
    r5.xy = r5.yx * UniformVector_6.yx;
    r6.z = ps;
    r6.x = r6.x * UniformScalar_3.x + r5.y;
    r6.zw = r10.zw * r6.zz + ScreenPositionScaleBias.wz;
    ps = UniformVector_1.y + UniformVector_1.y;
    r19.x = dot(r7.xyy, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    ps = r6.y;
    r19.y = dot(r7.wzz, float3(1.0, 1.0, 1.0));
    r6.y = (r19.y == 0.0) ? r3.x : r3.y;
    ps = r0.w * ps;
    r4 = r19.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r7.x = ps;
    r6.y = (r4.x == 0.0) ? r3.z : r6.y;
    r4.x = (r4.y == 0.0) ? r3.w : r6.y;
    ps = r1.w;
    r6.y = max(r4.x, 0.0);
    ps = r0.z * ps;
    r14.x = min(r6.y, 0.3);
    r7.y = ps;
    ps = UniformVector_7.y + r5.x;
    r3.xyz = r14.yxz * float3(6.0, 3.3333333, 6.0);
    r6.y = ps;
    r8.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r12 = tex2D(Texture2D_2, r7.xy).wxyz;
    r17.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r20 = tex2D(Texture2D_3, r11.xy);
    r21 = tex2D(Texture2D_7, r6.xy);
    r6.yzw = tex2D(Texture2D_9, r5.zw).xyz;
    r13.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r11 = tex2D(Texture2D_6, r0.xy).wxyz;
    r5.xzw = tex2D(Texture2D_4, r3.xz).wxy;
    r0.xzw = tex2D(Texture2D_4, r14.yz).wxy;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    ps = r1.z;
    r16.xyz = UniformVector_5.xyz * 2e+01;
    ps = 0.1 + ps;
    r6.x = float((UniformScalar_17.x >= 1.0));
    r5.y = ps;
    r14.xyz = r7.zxy * 2.0 - 1.0;
    r15.xyz = r10.zxy * 2.0 - 1.0;
    ps = 5.0 * r5.y;
    r5.x = r5.x * r0.x;
    r4.y = saturate(ps);
    ps = r5.z + r5.z;
    r1.w = float((UniformScalar_17.x > 1.0));
    r0.x = ps;
    ps = r5.w + r5.w;
    r7.xyz = r11.wyz * UniformScalar_18.xxx;
    r0.y = ps;
    r5.yzw = r13.zxy * 2.0 - 1.0;
    r13.xyz = (-abs(r1.www) >= 0.0) ? r6.yzw : 1.0;
    ps = r0.z + r0.z;
    r6.yzw = r21.xyz * r21.www;
    r0.z = ps;
    ps = r0.w + r0.w;
    r6.yzw = r16.xyz * r6.yzw;
    r0.w = ps;
    r16.yzw = (-abs(r6.xxx) >= 0.0) ? 1.0 : r13.xyz;
    r7.xyz = r7.xyz * r16.wyz + UniformScalar_19.xxx;
    ps = r11.x;
    r13 = r0 - 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r0 = r6.yyzw * float4(0.3, 1.0, 1.0, 1.0);
    r6.x = ps;
    r16.x = dot(r0.yx, r6.xx) + 0.0;
    r6.yz = r13.xy * 0.5 + r13.zw;
    ps = UniformVector_4.z * r5.y;
    r13.xyz = r0.zwy * r6.xxx;
    r0.x = ps;
    r11.x = dot(r13.yx, float2(0.11, 0.59)) + 0.0;
    r5.y = (r19.x == 0.0) ? r20.x : r20.y;
    r5.y = (r4.w == 0.0) ? r20.z : r5.y;
    r5.y = (r4.z == 0.0) ? r20.w : r5.y;
    ps = (-1.0) + r5.x;
    r3.xw = -r4.xy + 1.0;
    r6.x = ps;
    ps = 0.25 + r5.y;
    r19.xy = r3.ww * ModShadowGroupColor.xy;
    r6.w = ps;
    ps = 2.5 * r3.x;
    r1.w = r6.w + r5.y;
    r3.z = ps;
    ps = r1.w;
    r0.yzw = -r19.xyz + 1.0;
    ps = -r5.x + ps;
    r6.xyz = r3.yyy * r6.xyz;
    r5.x = saturate(ps);
    r4.zw = r18.yz * r0.yz + 0.125;
    ps = 1.0 + r6.x;
    r10.xyw = r5.xxx * r17.xyz;
    r3.y = ps;
    ps = -r10.w;
    r14.xzw = r14.xyz - r15.xyz;
    ps = r12.w + ps;
    r5.xy = -r10.xy + r12.yz;
    r14.y = ps;
    r12.yz = r5.xy * r12.xx + r10.xy;
    ps = r3.y * r3.x;
    r16.yzw = r16.yzw * r11.yzw;
    r5.y = ps;
    ps = r3.z * r3.y;
    r14 = r14.zwxy * r12.xxxx;
    r5.x = ps;
    ps = UniformVector_4.y * r5.w;
    r6.w = float((r5.y > 0.9));
    r0.y = ps;
    ps = UniformVector_4.x * r5.z;
    r11.yzw = r13.zxy * r6.www;
    r0.z = ps;
    ps = 1.0 - r0.x;
    r3 = r16 + r11;
    r4.y = ps;
    ps = (-0.5) + r5.x;
    r7.w = r3.y - r12.y;
    r11.z = saturate(ps);
    ps = r14.z;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = r10.w;
    r11.xyw = -UniformVector_0.xyz + 1.0;
    ps = r14.w + ps;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r12.x = ps;
    ps = r3.x;
    r10.xyw = r15.xyz + r14.zxy;
    ps = -r13.z + ps;
    r13.xy = r3.wz - r12.xz;
    r4.x = saturate(ps);
    ps = (-2.0) + r5.x;
    r14.yz = -r0.zy * r4.xx;
    r1.w = ps;
    ps = 1.0 - r4.x;
    r14.xw = r4.yz * r4.xw;
    r3.w = ps;
    r3.xyz = r14.www * r5.yzw + ModShadowColor.xyz;
    ps = r7.x;
    r5.xyz = r0.xzy + r14.xyz;
    ps = r3.w * ps;
    r6.xy = r5.yz + r6.yz;
    r4.z = ps;
    ps = r5.x;
    r13.zw = r6.xy - r10.yw;
    ps = -r10.x + ps;
    r5 = r13.xwyz * r11.zzzz;
    r4.w = ps;
    ps = r12.z;
    r7.xy = r7.yz * r3.ww;
    ps = r5.z + ps;
    r7.z = r12.x + r5.x;
    r4.y = ps;
    ps = r10.y;
    r7 = r7.wxyz * r11.zzzw;
    ps = r5.w + ps;
    r4.x = r12.y + r7.x;
    r5.x = ps;
    ps = r10.w;
    r4 = r4.wxyz * r11.zxyz;
    ps = r5.y + ps;
    r5.z = r1.w + r4.x;
    r5.y = ps;
    r5.z = r10.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r0.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r0.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r6.zxy, r6.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r1.xyz;
    r5.x = ps;
    r0.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r0.zxy, r9.zxy);
    r6.xyz = r0.xyz * r5.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r5.wyz, r6.zxy));
    ps = log2(r5.x);
    r6.xyz = r8.xyz * r2.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.x = saturate(dot(r0.zyx, r5.wzy));
    r0.y = ps;
    r5.xyz = r7.yzw * r0.yyx;
    r5.xyz = r4.yzw * r0.xxy + r5.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xyz;
    r5.xyz = r5.xyz * r3.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
