// ps_729b760e7c02138f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 453 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000714 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_9.x - r6.w;
    r11.w = ps;
    ps = UniformScalar_13.x;
    r5.x = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r1.z + 0.1;
    r5.w = ps;
    ps = 0.00022222222 * r5.x;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r18.w = saturate(ps);
    ps = 5.0 * r5.y;
    r11.xyz = r5.www * r3.xyz;
    r18.x = saturate(ps);
    ps = -r0.z;
    r5.x = r5.z * r18.w;
    r13.xy = r11.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r13.z = -r13.y + 1.0;
    r13.w = ps;
    r8.yzw = r13.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r21.xyz = UniformVector_4.xzy * 2e+01;
    r8.x = ps;
    r5 = r8.wzxy - 0.5;
    r3 = float4((r8.wzxy >= 0.5));
    ps = r0.w + r0.w;
    r5 = r5 - r8.wzxy;
    r12.x = ps;
    r5 = r5.yxzw * r3.yxzw + r8.zwxy;
    ps = r0.z + r0.z;
    r8 = r5 + r5;
    r12.y = ps;
    r10 = tex2D(Texture2D_9, r0.xy);
    r14 = tex2D(Texture2D_4, r9.xy);
    r16.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r19 = tex2D(Texture2D_3, r8.zw);
    r20 = tex2D(Texture2D_6, r0.xy);
    r5.yzw = tex2D(Texture2D_1, r12.xy).xyz;
    r15 = tex2D(Texture2D_7, r0.xy);
    r9.xyz = UniformVector_5.xzy * 2e+01;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r5.x = float((UniformScalar_8.x >= 1.0));
    r1.w = ps;
    ps = r15.x * r15.w;
    r17.yzw = r5.yzw + r5.yzw;
    r5.y = ps;
    ps = r15.z * r15.w;
    r20.xyz = r20.xzy * r20.www;
    r5.z = ps;
    ps = r15.y * r15.w;
    r21.xyz = r21.xyz * r20.xyz;
    r5.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r20.xyz = r9.xyz * r5.yzw;
    r9.z = ps;
    r5.yzw = (abs(r9.zzz) > 0.0) ? r21.xzy : r20.xzy;
    r15.xyz = (abs(r1.www) > 0.0) ? r5.yzw : r20.xzy;
    r5.x = r11.w * r5.x + r6.w;
    ps = -r5.x;
    r5.z = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    ps = r6.z + ps;
    r12.z = dot(r3.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r12.w = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r12.w == 0.0) ? r19.x : r19.y;
    ps = UniformScalar_10.x;
    r3 = r12.wzzw + float4(-2.0, -3.0, -2.0, -3.0);
    r5.w = ps;
    r5.x = (r3.x == 0.0) ? r19.z : r5.x;
    r9.x = (r3.w == 0.0) ? r19.w : r5.x;
    ps = max(r5.y, r5.w);
    r5.x = max(r9.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_11.x;
    r5.xy = min(r5.yx, float2(1.0, 0.3));
    r5.w = ps;
    r9.y = saturate(r5.x * r5.w);
    ps = r5.z;
    r3.xw = -r9.xy + 1.0;
    ps = -r15.x + ps;
    r16.x = r3.w * r6.w;
    r5.z = ps;
    ps = r5.z;
    r6.xy = r16.xw * r14.zw;
    ps = r15.x + ps;
    r18.z = float((r6.x >= 0.05));
    r18.y = saturate(ps);
    r5.xzw = -r18.zxy + 1.0;
    r9.x = (UniformScalar_9.x > 0.0) ? r5.x : 1.0;
    r9.x = (UniformScalar_9.x >= 0.0) ? r9.x : r5.x;
    r17.x = r9.x * r10.w;
    r17 = r17 + float4(-0.5, -1.0, -1.0, -1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r17.xxxx)) clip(-1.0);
    r8 = tex2D(Texture2D_3, r8.xy);
    ps = r6.w;
    r9.xy = r16.yz + r16.yz;
    r18.zw = r14.xy * 2.0 - 1.0;
    r6.z = (r12.z == 0.0) ? r8.x : r8.y;
    r6.z = (r3.z == 0.0) ? r8.z : r6.z;
    r18.x = (r3.y == 0.0) ? r8.w : r6.z;
    ps = 15.0 * ps;
    r18.y = r5.y * 3.3333333;
    r14.z = saturate(ps);
    ps = 2.5 * r3.x;
    r6.zw = -r18.xy + 1.0;
    r3.z = ps;
    ps = r14.z;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = dot(r14.zz, r6.zz) + r18.x;
    ps = r6.w * ps;
    r9.w = r5.y + r18.x;
    r16.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyw = r9.xyw + float3(-1.0, -1.0, 0.25);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r16.xy = r9.xy * 0.5;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.zw = r6.zw * abs(r7.xy);
    r14.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r18.xyz = r18.zyw + r16.xzy;
    r14.y = ps;
    ps = (-1.0) - -r6.y;
    r7.yzw = -r14.xyz + 1.0;
    r18.w = ps;
    r3.y = r18.w * r18.y + 1.0;
    ps = 1.0 / r4.w;
    r8.zw = r3.yz * r3.xy;
    r7.x = ps;
    ps = r13.x + r13.x;
    r8 = r8 * r7.xxww;
    r5.x = ps;
    ps = r13.y + r13.y;
    r3.xy = r8.xy + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r16 = tex2D(Texture2D_2, r12.xy);
    r13.xyw = tex2D(Texture2D_8, r5.xy).xyz;
    r19.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    r12.xyz = r10.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r14.xyz = r0.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r6.z = dot(r1.zxy, r1.zxy);
    r5.y = saturate(ps);
    r19.xyz = r19.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r19.xyz = r19.xyz * UniformVector_3.xyz;
    r5.x = ps;
    ps = log2(r5.y);
    r22.xyz = r5.xxx * -SpotDirection.xyz;
    r5.z = ps;
    r5.y = dot(r22.zxy, r2.zxy);
    r2.xyz = (-abs(r9.zzz) >= 0.0) ? r20.yxz : r21.yxz;
    ps = -SpotAngles.x - -r5.y;
    r19.w = saturate(r4.w * 0.0001);
    r5.x = ps;
    r4.xw = -r19.zw + 1.0;
    r2.xyz = (-abs(r1.www) >= 0.0) ? r20.yxz : r2.xyz;
    ps = SpotAngles.y * r5.x;
    r4.z = saturate(dot(r2.zxy, float3(0.59, 0.11, 0.3)));
    r4.y = saturate(ps);
    r5.xy = -r19.xy * r4.zz + r19.xy;
    r0.xy = r4.xy * r4.zy;
    ps = rsqrt(abs(r6.z));
    r13.z = r19.z + r0.x;
    r6.z = ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r2.xyz = r6.zzz * r1.xyz;
    r6.x = saturate(r9.w - r6.y);
    r1.xyz = r6.xxx * r13.xyw;
    ps = -r1.z;
    r6.xy = -r1.xy + r16.xy;
    r1.xy = r6.xy * r16.ww + r1.xy;
    r13.xy = r18.xy * r18.yz + r5.xy;
    ps = r16.z + ps;
    r6.xzw = r17.wyz - r14.zxy;
    r6.y = ps;
    r6 = r6.zwyx * r16.wwww;
    ps = r8.w;
    r5.y = float((r8.z >= 0.9));
    r5.x = ps;
    r10.xyz = r5.yyy * r15.xyz + r10.xyz;
    ps = (-0.5) + r5.x;
    r1.z = r1.z + r6.z;
    r5.y = saturate(ps);
    ps = r6.w;
    r6.xyz = r14.xyz + r6.xyw;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r13.xyz = -r6.xyz + r13.xyz;
    r6.w = ps;
    r6.xyz = r13.xyz * r5.yyy + r6.xyw;
    r10.xyz = r10.xyz - r1.xyz;
    r10.xyz = r10.xyz * r5.yyy + r1.xyz;
    r6.w = r0.z * 2.0 + r6.z;
    r6.xyz = r6.wxy * r4.www;
    ps = 1.0 + r6.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r4.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r4.xyz = (r4.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.w));
    r6.xyz = r12.xyz * r5.www;
    r5.x = ps;
    r4.xyz = r4.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r11.zxy);
    r12.xyz = r4.xyz * r5.xxx;
    r11.xyz = r12.xyz * 2.0 - r11.xyz;
    r5.x = saturate(dot(r2.zxy, r11.zxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.yyy;
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r8.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    r5.y = ps;
    ps = pow(2.0, r8.z);
    r0.xzw = r10.xyz * r9.xyz;
    r5.z = ps;
    r5.xw = r8.xy * r7.yz + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r4.zyx, r2.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    r6.xy = r0.xz * r6.ww + r6.xy;
    r6.z = r0.w * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.yyy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
