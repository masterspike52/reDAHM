// ps_1003d48b39d3ddd5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006A8 10041A00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_13.x;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r2.y = saturate(r6.w * 15.0);
    r5.x = ps;
    ps = r4.w;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r2.z = r1.z + 0.1;
    r2.x = ps;
    ps = rsqrt(abs(r5.w));
    r2.xz = saturate(r2.zx * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.www * r3.xyz;
    r2.w = ps;
    ps = UniformScalar_9.x - r6.w;
    r11 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r8.w = ps;
    ps = -r0.z;
    r5.xyw = r5.xyz * r2.zww;
    r10.xy = r8.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r10.z = -r10.y + 1.0;
    r10.w = ps;
    ps = UniformVector_1.x * r0.w;
    r9.yzw = r10.wxz * UniformVector_1.yxy;
    r9.x = ps;
    r3 = r9.wzxy - 0.5;
    r14 = float4((r9.wzxy >= 0.5));
    r3 = r3 - r9.wzxy;
    r3 = r3.yxzw * r14.yxzw + r9.zwxy;
    r9 = r3 + r3;
    r13 = tex2D(Texture2D_9, r0.xy);
    r26 = tex2D(Texture2D_4, r11.xy);
    r24.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r12 = tex2D(Texture2D_3, r9.zw);
    r11.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.zw = r0.wz + r0.wz;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = float((UniformScalar_8.x >= 1.0));
    r0.w = ps;
    r5.x = r8.w * r5.x + r6.w;
    ps = -r5.x;
    r3.xy = r0.zw * abs(r7.xy);
    ps = r6.z + ps;
    r21.x = dot(r14.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r21.y = dot(r14.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r5.x = (r21.y == 0.0) ? r12.x : r12.y;
    ps = UniformScalar_10.x;
    r20 = r21.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r7.y = ps;
    r5.x = (r20.y == 0.0) ? r12.z : r5.x;
    r0.w = (r20.z == 0.0) ? r12.w : r5.x;
    ps = max(r7.x, r7.y);
    r5.x = max(r0.w, 0.0);
    r5.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r5.xz = min(r5.zx, float2(1.0, 0.3));
    r0.z = ps;
    r5.x = saturate(r5.x * r0.z);
    ps = 1.0 - r5.x;
    r18.y = r5.z * 3.3333333;
    r5.z = ps;
    ps = r11.x + r11.x;
    r24.x = r5.z * r6.w;
    r7.x = ps;
    ps = r11.y + r11.y;
    r6.xy = r24.xw * r26.zw;
    r7.y = ps;
    ps = r11.z + r11.z;
    r0.z = float((r6.x >= 0.05));
    r7.z = ps;
    ps = ScreenPositionScaleBias.w + r5.y;
    r0.zw = -r0.wz + 1.0;
    r6.x = ps;
    r5.z = (UniformScalar_9.x > 0.0) ? r0.w : 1.0;
    r5.z = (UniformScalar_9.x >= 0.0) ? r5.z : r0.w;
    ps = ScreenPositionScaleBias.z + r5.w;
    r7.w = r5.z * r13.w;
    r6.z = ps;
    ps = r10.x + r10.x;
    r7 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.x = ps;
    ps = r10.y + r10.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r5.y = ps;
    r12 = tex2D(Texture2D_2, r3.zw);
    r16.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r11 = tex2D(Texture2D_3, r9.xy);
    r25 = tex2D(Texture2D_7, r0.xy);
    r17.xyz = tex2D(Texture2D_1, r3.zw).xyz;
    r14 = tex2D(Texture2D_6, r0.xy);
    r22.yzw = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r6.xz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r3.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r10.xyz = UniformVector_4.xzy * 2e+01;
    r6.w = ps;
    ps = r4.w;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r23.xyz = UniformVector_5.xzy * 2e+01;
    r22.x = saturate(ps);
    r15.xyz = r3.xyw * 2.0 - 1.0;
    r19.xyz = r13.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r18.zw = r26.xy * 2.0 - 1.0;
    ps = 0.875 * r6.x;
    r3.xyz = r22.yzw * LightColor.xyz;
    r0.x = ps;
    ps = r14.x * r14.w;
    r17.yzw = r17.xyz + r17.xyz;
    r4.x = ps;
    ps = r14.z * r14.w;
    r22.yzw = r25.xzy * r25.www;
    r4.y = ps;
    r5.yw = r24.yz * 2.0 - 1.0;
    ps = r14.y * r14.w;
    r22.yzw = r23.xyz * r22.yzw;
    r4.z = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r10.xyz * r4.xyz;
    r5.x = ps;
    r10.xyz = (-abs(r6.www) >= 0.0) ? r22.zyw : r4.yxz;
    r4.xyz = (abs(r6.www) > 0.0) ? r4.xzy : r22.ywz;
    r14.xyz = (abs(r5.zzz) > 0.0) ? r4.xyz : r22.ywz;
    ps = r2.y;
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    r1.xyz = (-abs(r5.zzz) >= 0.0) ? r22.zyw : r10.xyz;
    ps = 1.0 - r5.x;
    r10.w = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    r5.x = ps;
    ps = 1.0 - r2.x;
    r6.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.w = r6.w - r14.x;
    r22.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r22.w = saturate(r6.w + r14.x);
    r22.z = ps;
    ps = 0.875 * r6.z;
    r1 = -r22.wyzx + 1.0;
    r0.y = ps;
    r10.yz = r0.xy * r1.yz + 0.125;
    r5.z = (r21.x == 0.0) ? r11.x : r11.y;
    r5.z = (r20.w == 0.0) ? r11.z : r5.z;
    r18.x = (r20.x == 0.0) ? r11.w : r5.z;
    ps = 0.5 * r5.y;
    r6.zw = -r18.xy + 1.0;
    r11.x = ps;
    ps = 0.5 * r5.w;
    r11.z = r2.y * r6.w;
    r11.y = ps;
    r5.y = dot(r2.yy, r6.zz) + r18.x;
    ps = r5.y;
    r1.xyz = r19.xyz * r1.xxx;
    ps = r18.x + ps;
    r11.xyz = r18.zyw + r11.xzy;
    r17.x = ps;
    r2 = r17.yxzw + float4(-1.0, 0.25, -1.0, -1.0);
    ps = (-1.0) - -r6.y;
    r2.xzw = r2.wxz - r15.zxy;
    r11.w = ps;
    r0.x = r11.w * r11.y + 1.0;
    r5.y = saturate(r2.y - r6.y);
    r5.yzw = r5.yyy * r16.xzy;
    ps = 2.5 * r0.z;
    r6.xy = -r5.yw + r12.xy;
    r0.y = ps;
    r12.xy = r6.xy * r12.ww + r5.yw;
    ps = -r5.z;
    r6.xy = r0.xy * r0.zx;
    ps = r12.z + ps;
    r5.xy = r6.yx * r5.xx;
    r2.y = ps;
    r6 = r2.zwyx * r12.wwww;
    ps = (-0.5) + r5.x;
    r2.xyz = r15.xyz + r6.xyw;
    r5.w = saturate(ps);
    ps = r5.z;
    r5.x = float((r5.y >= 0.9));
    r0.xyz = r5.xxx * r14.xyz + r13.xyz;
    ps = r6.z + ps;
    r5.xyz = r7.zxy * UniformVector_3.zxy;
    r12.z = ps;
    r7.xy = -r5.yz * r10.ww + r5.yz;
    ps = 1.0 - r5.x;
    r0.xyz = r0.xyz - r12.xyz;
    r10.x = ps;
    r0.xyz = r0.xyz * r5.www + r12.xyz;
    r7.xy = r11.xy * r11.yz + r7.xy;
    r7.zw = r10.xy * r10.wz;
    r6.xyz = r7.www * r9.xyz + ModShadowColor.xyz;
    ps = r6.w;
    r7.z = r5.x + r7.z;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r7.xyz = -r2.xyz + r7.xyz;
    r2.w = ps;
    r2.xyz = r7.xyz * r5.www + r2.xyw;
    r2.w = r3.w * 2.0 + r2.z;
    r2.xyw = r2.xyw * r1.www;
    ps = -UniformVector_0.x;
    r2.z = r2.w + 1.0;
    r5.xyz = (r1.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r1.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r5.www;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r2.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r8.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r2.xyz * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r4.zxy, r7.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r5.yzw;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r2.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r1.xzy * r5.xxx;
    r5.y = r0.z * r5.w + r5.y;
    r5.xz = r0.xy * r5.ww + r5.xz;
    r5.xyz = r3.xzy * r5.xyz;
    r5.xyz = r5.xyz * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
