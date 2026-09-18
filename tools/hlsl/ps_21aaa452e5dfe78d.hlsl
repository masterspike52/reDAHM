// ps_21aaa452e5dfe78d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_9, r0.xy);
    ps = r0.w + r0.w;
    r10.zw = saturate(UniformVector_12.xy);
    r2.z = ps;
    ps = UniformScalar_4.x;
    r11.w = r0.w * UniformVector_2.x;
    ps = UniformScalar_5.x * ps;
    r12.y = -r0.z + 1.0;
    r8.y = ps;
    ps = r4.w;
    r10.xy = r0.wz * UniformVector_14.xy;
    ps = 0.0001 * ps;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.w = saturate(ps);
    ps = r4.w;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = (-2e+02) + ps;
    r2.y = r1.z + 0.1;
    r2.x = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = r5.zw * r0.wz;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = saturate(r2.yx * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.xy = r5.zw * abs(r7.xy);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.xxx * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.w = r2.y * (-0.1);
    r5.x = ps;
    r13.xy = r9.xy * r5.ww + r6.xy;
    ps = UniformScalar_5.x * r5.y;
    r6.xyz = r13.zwy * r5.zzx;
    r8.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r12.xw = -r6.zw + 1.0;
    r12.z = ps;
    ps = r16.w;
    r5.yzw = r12.zxy * UniformVector_2.xyy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r11.z = r5.y * r13.x;
    r2.w = ps;
    ps = (-0.5) + r5.z;
    r3.zw = float2((r5.zw >= 0.5));
    r1.w = ps;
    ps = (-0.5) + r5.w;
    r8.zw = r3.zw + r3.zw;
    r5.x = ps;
    ps = r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    ps = -r5.z + ps;
    r4.zw = r11.zw - 0.5;
    r22.x = ps;
    ps = floor(r8.x);
    r4.xy = float2((r11.zw >= 0.5));
    r3.x = ps;
    ps = floor(r8.y);
    r4.zw = r4.zw - r11.zw;
    r3.y = ps;
    r14.xz = r4.zw * r4.xy + r11.zw;
    r3.xy = r3.xy * UniformVector_11.xy - r8.xy;
    ps = r5.x;
    r4.zw = r3.xy * r10.zw;
    ps = -r5.w + ps;
    r8 = r8 + r4.zwxy;
    r22.y = ps;
    r3.xy = r0.xy * UniformVector_13.xy + r8.xy;
    ps = 1.0 / UniformVector_10.x;
    r4.xy = r3.xy * UniformVector_8.xy;
    r3.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r22.zw = frac(r4.xy);
    r3.y = ps;
    ps = r0.z + r0.z;
    r4 = r22 * r3.zwxy;
    r2.w = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r14.yw = r5.zw + r4.xy;
    r3.x = ps;
    ps = ScreenPositionScaleBias.z + r6.y;
    r5 = r14 + r14;
    r3.y = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r14 = tex2D(Texture2D_2, r11.xy).xywz;
    r20.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r19 = tex2D(Texture2D_3, r5.zw);
    r24 = tex2D(Texture2D_3, r5.xy);
    r10.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r21.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r13.xyz = tex2D(Texture2D_1, r11.xy).xyz;
    r17 = tex2D(Texture2D_6, r4.zw);
    r5.xyz = tex2D(Texture2D_4, r2.zw).wxy;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r18.xyz = UniformVector_5.xyz * 2e+01;
    ps = (-1.0) + r5.x;
    r5.w = float((UniformScalar_12.x >= 1.0));
    r6.x = ps;
    ps = r17.x * r17.w;
    r0.y = float((UniformScalar_12.x > 1.0));
    r0.x = ps;
    r6.yz = r5.yz * 2.0 - 1.0;
    r15.xyz = r13.xyz * 2.0 - 1.0;
    r13.xyz = r3.xyw * 2.0 - 1.0;
    ps = r17.y * r17.w;
    r21.xyz = r21.xyz + r21.xyz;
    r0.z = ps;
    ps = r17.z * r17.w;
    r5.xyz = r16.xyz * UniformScalar_13.xxx;
    r0.w = ps;
    r10.xyz = (-abs(r0.yyy) >= 0.0) ? r10.xyz : 1.0;
    r17.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r10.xyz;
    r10.xyz = r5.xyz * r17.xyz + UniformScalar_14.xxx;
    r5.y = (r8.z == 0.0) ? r24.x : r24.y;
    r5.x = (r8.w == 0.0) ? r19.x : r19.y;
    ps = 1.0 - r2.x;
    r23 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = ps;
    r5.x = (r23.z == 0.0) ? r19.z : r5.x;
    r5.y = (r23.y == 0.0) ? r24.z : r5.y;
    r21.w = (r23.x == 0.0) ? r24.w : r5.y;
    r2.x = (r23.w == 0.0) ? r19.w : r5.x;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = max(r2.x, 0.0);
    r5.w = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r2.yz = float2((UniformVector_10.xy >= r22.zw));
    r5.z = ps;
    ps = r2.y * r2.z;
    r5.x = min(r5.x, 0.3);
    r1.w = ps;
    ps = 3.3333333 * r5.x;
    r19 = r21 + float4(-1.0, -1.0, -1.0, -0.75);
    r0.y = ps;
    ps = r19.w;
    r5.xy = float2((UniformVector_10.xy > r22.zw));
    ps = r21.w + ps;
    r1.w = r1.w * r5.y;
    r5.y = saturate(ps);
    ps = r1.w;
    r15.xzw = r15.zxy - r13.zxy;
    ps = r5.x * ps;
    r6.xyz = r0.yyy * r6.xyz;
    r5.x = ps;
    ps = 1.0 + r6.x;
    r3.xyz = r5.yyy * r20.xyz;
    r0.y = ps;
    ps = -r3.z;
    r2.yzw = r19.xyz * UniformVector_4.xyz;
    ps = r14.w + ps;
    r8.zw = -r3.xy + r14.xy;
    r15.y = ps;
    ps = r2.w;
    r0.xzw = r0.xzw * r5.xxx;
    r5.x = ps;
    r14.xy = r8.zw * r14.zz + r3.xy;
    ps = 1.0 - r5.x;
    r18.xyz = r18.xyz * r0.xzw;
    r0.w = ps;
    ps = 1.0 - r2.x;
    r15 = r15.zwxy * r14.zzzz;
    r0.x = ps;
    ps = 2.5 * r0.x;
    r13.w = r15.z - 2.0;
    r0.z = ps;
    ps = r3.z;
    r5.x = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    ps = r15.w + ps;
    r1.w = r5.x - r18.x;
    r14.z = ps;
    ps = rsqrt(abs(r6.w));
    r5.xy = r0.zy * r0.yx;
    r4.w = ps;
    ps = (-0.5) + r5.x;
    r3.xyz = r7.xyz * LightColor.xyz;
    r6.w = saturate(ps);
    ps = r1.w;
    r7.xyz = r4.www * r1.xyz;
    ps = r18.x + ps;
    r5.y = float((r5.y > 0.9));
    r5.x = saturate(ps);
    r1.w = r0.w * r5.x + r2.w;
    r0.xyz = r18.xyz * r5.yyy - r14.xyz;
    r1.xy = -r2.yz * r5.xx + r2.yz;
    r1.yz = r6.yz * 2.0 + r1.xy;
    r6.xyz = r17.xyz * r16.xyz + r0.xyz;
    ps = 1.0 - r5.x;
    r13.xyz = r13.xyz + r15.xyz;
    r1.x = ps;
    r0.xyz = r6.xyz * r6.www + r14.xyz;
    ps = 1.0 - r5.w;
    r6.xyz = -r13.xyz + r1.yzw;
    r1.y = ps;
    r2.xyz = r6.xyz * r6.www + r13.xyw;
    r2.w = r3.w * 2.0 + r2.z;
    ps = 1.0 - r5.z;
    r2.xyw = r2.xyw * r12.www;
    r1.z = ps;
    ps = r10.x;
    r2.z = r2.w + 1.0;
    r5.xyz = (r12.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r12.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r1.x * ps;
    r5.x = dot(r6.zxy, r6.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r0.xyz * r11.xyz;
    r5.x = ps;
    ps = r10.y;
    r2.xyz = r6.xyz * r5.xxx;
    ps = r1.x * ps;
    r5.x = dot(r2.zxy, r9.zxy);
    r5.z = ps;
    ps = r10.z;
    r6.xyz = r2.xyz * r5.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    ps = r1.x * ps;
    r5.x = saturate(dot(r7.zxy, r6.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r6.xyz = r5.yzw * r6.www;
    r8.z = ps;
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r2.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r1.yz + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xzy * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.y = r0.z * r5.w + r6.y;
    r6.xz = r0.xy * r5.ww + r6.xz;
    r6.xyz = r3.xzy * r6.xyz;
    r5.xyz = r6.xyz * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
