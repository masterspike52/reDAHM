// ps_162872f69cc6b325.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11.y = UniformScalar_2.x * UniformVector_5.y;
    r12.y = UniformVector_5.y * UniformScalar_5.x;
    ps = UniformScalar_13.x;
    r5.x = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.z = UniformScalar_1.x * UniformVector_3.x;
    r1.w = ps;
    ps = r1.z;
    r3.w = UniformVector_3.x * UniformScalar_4.x;
    ps = 0.1 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r12.x = r3.w * UniformVector_5.x;
    r3.w = ps;
    ps = 0.00022222222 * r5.x;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r3.www * r3.xyz;
    r5.x = saturate(ps);
    r5.y = r1.w * r5.w;
    ps = UniformVector_5.x * r5.z;
    r11.zw = r8.xy * r5.yy;
    r11.x = ps;
    r3 = r11.xzwy + r0.xwzy;
    ps = r3.y;
    r10.y = -r3.z + 1.0;
    r5.y = ps;
    ps = 1.0 - r0.z;
    r14.xy = r0.wz + r0.wz;
    r10.z = ps;
    ps = UniformVector_1.x * r5.y;
    r10.yz = r10.zy * UniformVector_1.yy;
    r10.w = ps;
    ps = UniformVector_1.x * r0.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r10.x = ps;
    ps = r12.x;
    r11 = r10.wzxy - 0.5;
    ps = r0.x + ps;
    r13 = float4((r10.wzxy >= 0.5));
    r5.y = ps;
    ps = r12.y;
    r11 = r11 - r10.wzxy;
    r10 = r11 * r13 + r10.wzxy;
    ps = r0.y + ps;
    r17 = r10.xywz + r10.xywz;
    r5.z = ps;
    r19 = tex2D(Texture2D_4, r9.xy);
    r15 = tex2D(Texture2D_3, r17.wz);
    r16 = tex2D(Texture2D_6, r3.xw);
    r20 = tex2D(Texture2D_7, r5.yz);
    r11 = tex2D(Texture2D_9, r0.xy);
    r18.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    ps = 15.0 * r6.w;
    r10.x = saturate(r4.w * 0.0001);
    r14.z = saturate(ps);
    r12.xyz = UniformVector_4.xyz * 2e+01;
    r5.z = float((UniformScalar_8.x >= 1.0));
    r9.xyz = r11.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r10.yzw = r20.xyz * r20.www;
    r10.yzw = r16.xyz * r16.www + r10.yzw;
    r12.xyz = r12.xyz * r10.yzw;
    r5.y = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    r5.y = r5.y - r12.x;
    ps = -r6.w;
    r17.w = saturate(r5.y + r12.x);
    ps = UniformScalar_9.x + ps;
    r5.y = -r17.w + 1.0;
    r9.w = ps;
    r9 = r9 * r5.yyyz;
    r5.y = r9.w + r6.w;
    r5.y = -r5.y + r6.z;
    r16.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    ps = r5.y;
    r16.y = dot(r13.zww, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    r5.y = (r16.y == 0.0) ? r15.x : r15.y;
    ps = UniformScalar_10.x;
    r13 = r16.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r10.w = ps;
    r5.y = (r13.x == 0.0) ? r15.z : r5.y;
    r5.y = (r13.y == 0.0) ? r15.w : r5.y;
    ps = max(r10.z, r10.w);
    r10.y = max(r5.y, 0.0);
    r10.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r3.xw = min(r10.yz, float2(0.3, 1.0));
    r5.z = ps;
    r14.w = saturate(r3.w * r5.z);
    ps = 1.0 - r5.x;
    r13.xy = -r14.zw + 1.0;
    r5.z = ps;
    ps = 1.0 - r5.y;
    r18.x = r13.y * r6.w;
    r5.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.xy = r18.wx * r19.wz;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r10.w = float((r6.y >= 0.05));
    r10.z = ps;
    ps = r18.y + r18.y;
    r10 = -r10.wxyz + 1.0;
    r15.x = ps;
    r5.x = (UniformScalar_9.x > 0.0) ? r10.x : 1.0;
    r5.x = (UniformScalar_9.x >= 0.0) ? r5.x : r10.x;
    ps = r18.z + r18.z;
    r15.z = r5.x * r11.w;
    r15.y = ps;
    r15.xyz = r15.xyz + float3(-1.0, -1.0, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r15.zzzz)) clip(-1.0);
    r18 = tex2D(Texture2D_3, r17.xy);
    r16.zw = r19.xy * 2.0 - 1.0;
    r5.x = (r16.x == 0.0) ? r18.x : r18.y;
    r5.x = (r13.w == 0.0) ? r18.z : r5.x;
    r16.x = (r13.z == 0.0) ? r18.w : r5.x;
    ps = 2.5 * r5.w;
    r18.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.y = r3.x * 3.3333333;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xw = -r16.yx + 1.0;
    r6.w = ps;
    ps = r14.z;
    r7.xy = r6.zw * abs(r7.xy);
    ps = r3.x * ps;
    r15.xy = r15.xy * 0.5;
    r15.z = ps;
    ps = (-1.0) - -r6.x;
    r15.xyz = r16.zyw + r15.xzy;
    r15.w = ps;
    r5.x = r15.w * r15.y + 1.0;
    ps = 1.0 / r4.w;
    r18.xy = r5.xy * r5.wx;
    r13.z = ps;
    ps = r3.y + r3.y;
    r13 = r18 * r13.xxzz;
    r5.x = ps;
    ps = r3.z + r3.z;
    r5.zw = r13.zw + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r4 = tex2D(Texture2D_2, r14.xy).xywz;
    r17.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r6.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(Texture2D_1, r14.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.xzw = r7.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r2.xyz = r0.xyw + r0.xyw;
    r5.x = saturate(ps);
    r6.yzw = r6.yzw * 2.0 - 1.0;
    ps = log2(r5.x);
    r6.yzw = r6.wyz * UniformVector_3.zxy;
    r5.x = ps;
    r14.xy = -r6.zw * r17.ww + r6.zw;
    r5.y = dot(r14.zz, r3.ww) + r16.x;
    r2.w = r5.y + r16.x;
    ps = 0.875 * r5.z;
    r16 = r2 + float4(-1.0, -1.0, -1.0, 0.25);
    r14.z = ps;
    ps = 0.875 * r5.w;
    r5.y = saturate(r16.w - r6.x);
    r14.w = ps;
    ps = 1.0 - r6.y;
    r5.yzw = r5.yyy * r17.xzy;
    r17.x = ps;
    ps = -r5.z;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r17.yz = r14.zw * r10.zw + 0.125;
    ps = r4.w + ps;
    r14.zw = -r5.yw + r4.xy;
    r7.y = ps;
    r4.xy = r14.zw * r4.zz + r5.yw;
    ps = r17.x * r17.w;
    r7.xzw = r7.wxz - r16.zxy;
    r5.y = ps;
    ps = r17.y * r17.z;
    r7 = r7.zwxy * r4.zzzz;
    r6.x = ps;
    r0.xyz = r6.xxx * r2.xyz + ModShadowColor.xyz;
    r4.z = r5.z + r7.w;
    ps = rsqrt(abs(r1.w));
    r7.w = r7.z - 2.0;
    r5.z = ps;
    ps = r6.y;
    r2.xyz = r5.zzz * r1.xyz;
    ps = r5.y + ps;
    r7.xyz = r16.xyz + r7.xyz;
    r5.w = ps;
    r5.yz = r15.xy * r15.yz + r14.xy;
    ps = r13.y;
    r6.xyz = -r7.xyz + r5.yzw;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r5.w = float((r13.x >= 0.9));
    r5.z = saturate(ps);
    r1.xyz = r12.xyz * r5.www + r11.xyz;
    r6.xyz = r6.xyz * r5.zzz + r7.xyw;
    r6.w = r0.w * 2.0 + r6.z;
    r1.xyz = r1.xyz - r4.xyz;
    r7.xyz = r1.xyz * r5.zzz + r4.xyz;
    r6.xyw = r6.xyw * r10.yyy;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r10.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r10.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r6.wyz, r6.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r9.xyz * r5.zzz;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r6.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r4.zxy, r8.zxy);
    r6.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r4.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r2.zxy, r5.wyz));
    r6.z = ps;
    ps = log2(r5.y);
    r6.yzw = r7.xyz * r6.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r4.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
