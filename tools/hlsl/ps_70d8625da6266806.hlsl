// ps_70d8625da6266806.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 543 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000087C 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c16); // float
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_14 : register(c18); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r6.w;
    r5.x = float((UniformScalar_7.x >= 1.0));
    ps = UniformScalar_8.x + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = r1.w * r5.x;
    r12.x = ps;
    ps = UniformVector_1.x * r0.w;
    r5.yz = r0.wz * 3.0;
    r10.y = ps;
    r12.yzw = r6.www * float3(0.16, -0.8, 1.0) + r5.yzx;
    r9 = r12.xxzy * float4(-0.125, 1.0, 6.0, 6.0);
    r8.yzw = tex2D(Texture2D_3, r9.wz).xyw;
    r5.x = -r0.z + 1.0;
    ps = UniformVector_1.y * r5.x;
    r10.zw = r8.yz + r8.yz;
    r10.x = ps;
    r11 = r10.yxzw + float4(-0.5, -0.5, -1.0, -1.0);
    r2.zw = float2((r10.xy >= 0.5));
    r5.xy = r11.xy - r10.yx;
    r5.xy = r5.yx * r2.zw + r10.xy;
    r5.xy = r5.yx + r5.yx;
    r5 = tex2D(Texture2D_4, r5.xy).xzyw;
    r10 = tex2D(Texture2D_3, r12.yz);
    r15.y = saturate(r6.w * 15.0);
    r11.xy = r10.yx * 2.0 - 1.0;
    ps = -r12.w;
    r2.xy = r11.zw * 0.5;
    ps = r6.z + ps;
    r19.w = dot(r2.wzz, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r1.w = (r19.w == 0.0) ? r5.x : r5.z;
    r11.zw = r10.xy * 2.0 + r2.xy;
    r2.z = max(r2.z, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r2.z = min(r2.z, 1.0);
    r2.w = ps;
    r15.x = saturate(r2.z * r2.w);
    ps = r10.z;
    r2 = r11 + r2.yxxy;
    ps = r6.w * ps;
    r5.xz = -r15.xy + 1.0;
    r3.w = ps;
    ps = r3.w;
    r8.x = r5.x * r6.w;
    ps = r5.x * ps;
    r19.xy = r8.xw * r10.zw;
    r19.z = ps;
    r8.yzw = r19.yww + float3(-1.0, -3.0, -2.0);
    r11.yz = float2((r19.xz >= 0.05));
    r5.y = (r8.w == 0.0) ? r5.y : r1.w;
    r5.w = (r8.z == 0.0) ? r5.w : r5.y;
    r5.y = max(r5.w, 0.0);
    r5.y = min(r5.y, 0.3);
    ps = r2.y;
    r11.x = r5.y * 3.3333333;
    r5.x = ps;
    ps = 0.01 * r5.x;
    r22.xzw = -r11.yzx + 1.0;
    r5.y = ps;
    r1.w = r15.y * r22.w + r11.x;
    ps = r10.z;
    r12.w = r5.y * r1.w;
    r5.x = ps;
    ps = (-0.3) * r5.x;
    r2.x = r1.w * r2.x;
    r8.x = ps;
    ps = 0.025 * r2.x;
    r20.xy = r8.xy * r1.ww;
    r3.w = ps;
    ps = r12.w;
    r5.y = r20.x + r0.y;
    ps = r0.x + ps;
    r8.y = r5.y + r3.w;
    r8.x = ps;
    r11 = tex2D(Texture2D_5, r8.xy).wyzx;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r9.w = float((UniformScalar_0.x > 0.0));
    r8.w = ps;
    ps = -r6.z;
    r8.z = UniformScalar_14.x * 0.05;
    ps = 1.0 + ps;
    r5.y = r4.w - 4e+02;
    r12.x = ps;
    ps = r1.z;
    r6.yz = saturate(UniformVector_3.yz);
    ps = 0.1 + ps;
    r6.x = -r11.x + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r6.zy * UniformScalar_5.xx;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.yz = floor(-r6.zw);
    r6.z = ps;
    ps = 1.0 / UniformScalar_5.x;
    r6.zw = r6.yz * abs(r7.xy);
    r6.y = ps;
    ps = 0.00022222222 * r5.y;
    r7.xy = -r12.yz * r6.yy;
    r17.w = saturate(ps);
    ps = 5.0 * r5.x;
    r12.yz = r7.xy + UniformScalar_6.xx;
    r17.y = saturate(ps);
    ps = r8.z;
    r13 = r12.xxyz - r7.xyxy;
    ps = r17.w * ps;
    r7 = r9.yyyx * r3.xyzx;
    r6.y = ps;
    ps = 1.0 / r13.z;
    r3.yz = r2.zw - 2.0;
    r3.x = ps;
    ps = 1.0 / r13.w;
    r25.yz = r3.yz + r10.xy;
    r3.y = ps;
    ps = r7.x;
    r5.xy = saturate(r13.yx * r3.yx);
    r25.xw = r5.yx * r6.xx + r11.xx;
    ps = r6.y * ps;
    r24.xyz = r25.xyz + r10.zxy;
    r12.x = ps;
    ps = r7.y;
    r22.y = float((r24.x >= 0.5));
    r3.xy = (-abs(r9.ww) >= 0.0) ? 1.0 : r22.xy;
    r18.zw = (-abs(r8.ww) >= 0.0) ? r22.zy : r3.xy;
    ps = r6.y * ps;
    r12.z = r3.w + r20.x;
    r12.y = ps;
    r12 = r12.xzwy + r0.wyxz;
    ps = r12.x;
    r6.y = -r12.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r18.x = r6.y * UniformVector_1.y;
    r18.y = ps;
    r3.xyw = r18.xyz - 0.5;
    r13.yz = float2((r18.xy >= 0.5));
    ps = r0.z;
    r3.xz = r3.xy - r18.xy;
    r3.y = ps;
    ps = r7.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.wwww)) clip(-1.0);
    r3.xz = r3.xz * r13.yz + r18.xy;
    ps = r0.w + ps;
    r3.zw = r3.zx + r3.zx;
    r3.x = ps;
    r14 = tex2D(Texture2D_4, r3.zw);
    r17.z = tex2D(Texture2D_5, r12.zy).w;
    r6.y = tex2D(Texture2D_7, r3.xy).z;
    r6.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r3.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    ps = r4.w;
    r16.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.0001 * ps;
    r6.yzw = r6.yzw * float3(0.5, 0.875, 0.875);
    r17.x = saturate(ps);
    r9.xyz = -r17.zxy + 1.0;
    ps = r0.w + r0.w;
    r8.yz = r9.zz * ModShadowGroupColor.xy;
    r13.x = ps;
    r8.x = r5.x * r9.x + r17.z;
    ps = r11.x;
    r23.yzw = -r8.xyz + 1.0;
    r5.x = ps;
    ps = r3.x + r3.x;
    r8.xy = r6.zw * r23.zw;
    r3.x = ps;
    ps = r3.y + r3.y;
    r8.z = dot(r13.zyy, float3(1.0, 1.0, 1.0));
    r3.y = ps;
    r5.y = (r8.z == 0.0) ? r14.x : r14.y;
    ps = r3.z + r3.z;
    r21 = r8.xyzz + float4(0.125, 0.125, -3.0, -2.0);
    r3.z = ps;
    r5.y = (r21.w == 0.0) ? r14.z : r5.y;
    r3.w = (r21.z == 0.0) ? r14.w : r5.y;
    ps = (-0.5) + r5.x;
    r14 = r3 - 1.0;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r20.z = r14.w * r5.z;
    r3.w = saturate(ps);
    ps = 1.0 - r5.w;
    r3.yz = r20.yz + float2(1.0, 2.25);
    r3.x = ps;
    ps = r0.z + r0.z;
    r9.xz = abs(r3.xy) * abs(r3.xy);
    r13.y = ps;
    ps = 1.0 / r4.w;
    r16.x = r9.z * r9.z;
    r16.w = ps;
    ps = r12.x + r12.x;
    r8.xyz = r16.yxz * r16.wxw;
    r5.x = ps;
    ps = r12.w + r12.w;
    r5.zw = r8.xz + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r10.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r17.xyw = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r12 = tex2D(Texture2D_2, r13.xy);
    r4.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    r0.xyz = r5.xyz * 2.0 - 1.0;
    r5.yzw = r4.xyw * 2.0 - 1.0;
    r5.x = r11.x * UniformScalar_11.x;
    r16.xyz = r6.xxx * UniformVector_6.xzy + r5.xxx;
    ps = r10.w;
    r0.xyz = r0.xyz - r5.yzw;
    r5.x = ps;
    r10.w = r0.z * r12.w - 2.0;
    r13.xyz = r0.xyz * r12.www + r5.yzw;
    ps = 1.0 - r5.x;
    r23.x = -r25.w + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r5 = r24.yzyz * r23.yyxx;
    r13.w = ps;
    r0.x = (abs(r9.w) > 0.0) ? r22.y : 1.0;
    r8.x = (abs(r8.w) > 0.0) ? r0.x : r22.y;
    r5.xy = (-abs(r9.ww) >= 0.0) ? 0.0 : r5.xy;
    r2.zw = (-abs(r8.ww) >= 0.0) ? r5.zw : r5.xy;
    ps = 2.5 * r3.x;
    r5.xzw = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = r2.y;
    r0.x = r21.x * r21.y;
    r0.xyz = r0.xxx * r5.xzw + ModShadowColor.xyz;
    ps = r1.w * ps;
    r5.xzw = r14.zxy * UniformVector_5.zxy;
    r2.y = ps;
    ps = (-1.0) - -r5.x;
    r14.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r0.w = ps;
    ps = r3.w;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = r0.w * ps;
    r1.w = r3.z + r20.z;
    r17.z = ps;
    ps = r1.w;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = -r19.y + ps;
    r5.xyz = r5.yzw * r3.yww;
    r8.z = saturate(ps);
    ps = (-0.5) + r5.x;
    r3.xyz = r17.xyw * LightColor.xyz;
    r14.w = saturate(ps);
    r17.x = dot(r2.yz, r18.ww) + r5.y;
    r17.y = dot(r2.xw, r18.ww) + r5.z;
    ps = rsqrt(abs(r0.w));
    r5.xyz = -r13.zxy + r17.zxy;
    r5.w = ps;
    ps = 1.0 + r5.x;
    r17 = r14 * r11.wyzx;
    r11.w = ps;
    ps = -r14.w;
    r2.xyz = r5.www * r1.xyz;
    ps = r17.w + ps;
    r11.xyz = r17.xyz * r11.xxx;
    r5.w = ps;
    r1.xyz = r11.xyz * UniformScalar_12.xxx + r16.xzy;
    r0.w = r15.y * r5.w + r14.w;
    r5.xy = r5.yz * r0.ww + r13.xy;
    ps = r0.w;
    r1.xyz = r8.yyy * r1.xzy;
    ps = r8.x * ps;
    r1.xyw = r1.yzx * r9.xxx;
    r8.y = ps;
    ps = r1.w;
    r13.xyz = r11.xyz - r6.yyy;
    r6 = r13 * r8.xxxz + r6.yyyx;
    ps = r8.x * ps;
    r10.xyz = r6.www * r10.xyz;
    r1.w = ps;
    ps = r1.y;
    r11.xyz = -r10.xyz + r12.xyz;
    r10.xyz = r11.xyz * r12.www + r10.xyz;
    r11.xyz = r9.xxx * r6.xyz - r10.xyz;
    r6 = r11 * r0.wwww + r10;
    r5.z = r4.w * 2.0 + r6.w;
    ps = r8.y * ps;
    r5.xyw = r5.xyz * r9.yyy;
    r1.y = ps;
    ps = r1.x;
    r5.z = r5.w + 1.0;
    r5.xyz = (r9.yyy > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r8.y * ps;
    r5.x = dot(r5.wyz, r5.wyz);
    r1.z = ps;
    ps = rsqrt(abs(r5.x));
    r1.x = r1.w * r0.w;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r7.zxy);
    r8.xyz = r5.yzw * r5.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r5.x = saturate(dot(r2.zxy, r7.zxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r4.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r2.zyx));
    r5.x = ps;
    r5.xyz = r1.xzy * r5.xxx;
    r5.y = r6.z * r5.w + r5.y;
    r5.xz = r6.xy * r5.ww + r5.xz;
    r5.xyz = r3.xzy * r5.xyz;
    r5.xyz = r5.xyz * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
