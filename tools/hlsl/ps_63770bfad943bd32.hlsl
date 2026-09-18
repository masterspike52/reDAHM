// ps_63770bfad943bd32.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 447 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006FC 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_14 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_16.x;
    r5.x = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r1.z + 0.1;
    r5.w = ps;
    ps = 0.00022222222 * r5.x;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r18.w = saturate(ps);
    ps = 5.0 * r5.y;
    r11.xyz = r5.www * r3.xyz;
    r18.x = saturate(ps);
    ps = UniformScalar_12.x - r6.w;
    r21.xyz = UniformVector_4.xzy * 2e+01;
    r11.w = ps;
    ps = -r0.z;
    r5.x = r5.z * r18.w;
    r14.xy = r11.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r14.z = -r14.y + 1.0;
    r14.w = ps;
    r9.yzw = r14.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r1.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r9.x = ps;
    r5 = r9.wzxy - 0.5;
    r3 = float4((r9.wzxy >= 0.5));
    ps = r0.w + r0.w;
    r5 = r5 - r9.wzxy;
    r12.x = ps;
    r5 = r5.yxzw * r3.yxzw + r9.zwxy;
    ps = r0.z + r0.z;
    r9 = r5 + r5;
    r12.y = ps;
    r13 = tex2D(Texture2D_9, r0.xy);
    r10 = tex2D(Texture2D_4, r8.xy);
    r15.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r19 = tex2D(Texture2D_3, r9.zw);
    r20 = tex2D(Texture2D_6, r0.xy);
    r5.yzw = tex2D(Texture2D_1, r12.xy).xyz;
    r16 = tex2D(Texture2D_7, r0.xy);
    r8.xyz = UniformVector_5.xzy * 2e+01;
    r5.x = float((UniformScalar_11.x >= 1.0));
    ps = r16.x * r16.w;
    r17.yzw = r5.yzw + r5.yzw;
    r5.y = ps;
    ps = r16.z * r16.w;
    r20.xyz = r20.xzy * r20.www;
    r5.z = ps;
    ps = r16.y * r16.w;
    r20.xyz = r21.xyz * r20.xyz;
    r5.w = ps;
    r21.xyz = r8.xyz * r5.yzw;
    r16.xyz = (abs(r1.www) > 0.0) ? r20.xzy : r21.xzy;
    r5.x = r11.w * r5.x + r6.w;
    ps = -r5.x;
    r5.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    ps = r6.z + ps;
    r8.z = dot(r3.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r8.w = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r8.w == 0.0) ? r19.x : r19.y;
    ps = UniformScalar_13.x;
    r3 = r8.wzzw + float4(-2.0, -3.0, -2.0, -3.0);
    r5.w = ps;
    r5.x = (r3.x == 0.0) ? r19.z : r5.x;
    r8.x = (r3.w == 0.0) ? r19.w : r5.x;
    ps = max(r5.y, r5.w);
    r5.x = max(r8.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.xy = min(r5.yx, float2(1.0, 0.3));
    r5.w = ps;
    r8.y = saturate(r5.x * r5.w);
    ps = r5.z;
    r3.xw = -r8.xy + 1.0;
    ps = -r16.x + ps;
    r15.x = r3.w * r6.w;
    r5.z = ps;
    ps = r5.z;
    r6.xy = r15.xw * r10.zw;
    ps = r16.x + ps;
    r18.z = float((r6.x >= 0.05));
    r18.y = saturate(ps);
    r5.xzw = -r18.zxy + 1.0;
    r8.x = (UniformScalar_12.x > 0.0) ? r5.x : 1.0;
    r8.x = (UniformScalar_12.x >= 0.0) ? r8.x : r5.x;
    r17.x = r8.x * r13.w;
    r18 = r17 + float4(-0.5, -1.0, -1.0, -1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r18.xxxx)) clip(-1.0);
    r9 = tex2D(Texture2D_3, r9.xy);
    ps = r6.w;
    r8.xy = r15.yz + r15.yz;
    r17.zw = r10.xy * 2.0 - 1.0;
    r6.z = (r8.z == 0.0) ? r9.x : r9.y;
    r6.z = (r3.z == 0.0) ? r9.z : r6.z;
    r17.x = (r3.y == 0.0) ? r9.w : r6.z;
    ps = 15.0 * ps;
    r17.y = r5.y * 3.3333333;
    r8.z = saturate(ps);
    ps = 2.5 * r3.x;
    r6.zw = -r17.xy + 1.0;
    r3.z = ps;
    ps = r8.z;
    r10.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = dot(r8.zz, r6.zz) + r17.x;
    ps = r6.w * ps;
    r8.w = r5.y + r17.x;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = r8.xyw + float3(-1.0, -1.0, 0.25);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.xy = r9.xy * 0.5;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.zw = r6.zw * abs(r7.xy);
    r8.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r19.xyz = r17.zyw + r15.xzy;
    r8.y = ps;
    ps = (-1.0) - -r6.y;
    r8.yzw = -r8.xyz + 1.0;
    r19.w = ps;
    r3.y = r19.w * r19.y + 1.0;
    ps = 1.0 / r4.w;
    r10.zw = r3.yz * r3.xy;
    r8.x = ps;
    ps = r14.x + r14.x;
    r10 = r10 * r8.xxww;
    r5.x = ps;
    ps = r14.y + r14.y;
    r3.xy = r10.xy + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r17 = tex2D(Texture2D_2, r12.xy);
    r14.xyw = tex2D(Texture2D_8, r5.xy).xyz;
    r0.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r9.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.y = dot(r2.zxy, r2.zxy);
    r12.xyz = r13.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r15.xyz = r9.xyw * 2.0 - 1.0;
    r0.yzw = r0.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r5.x = saturate(-r5.y + 1.0);
    r5.y = ps;
    ps = log2(r5.x);
    r7.xyz = r5.yyy * -SpotDirection.xyz;
    r5.y = ps;
    r4.xyz = (-abs(r1.www) >= 0.0) ? r21.yxz : r20.yxz;
    ps = 0.0001 * r4.w;
    r5.z = dot(r7.zxy, r2.zxy);
    r0.x = saturate(ps);
    ps = -SpotAngles.x - -r5.z;
    r0.yzw = r0.yzw * UniformVector_3.xyz;
    r2.x = ps;
    ps = r0.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r7.z = saturate(dot(r4.zxy, float3(0.59, 0.11, 0.3)));
    r7.x = ps;
    r6.zw = -r0.yz * r7.zz + r0.yz;
    ps = 1.0 - r0.x;
    r7.y = saturate(r2.x * SpotAngles.y);
    r7.w = ps;
    r2.xy = r7.xy * r7.zy;
    ps = rsqrt(abs(r1.w));
    r14.z = r0.w + r2.x;
    r5.x = ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = saturate(r9.z - r6.y);
    r1.xyz = r5.xxx * r14.xyw;
    ps = -r1.z;
    r6.xy = -r1.xy + r17.xy;
    r1.xy = r6.xy * r17.ww + r1.xy;
    r14.xy = r19.xy * r19.yz + r6.zw;
    ps = r17.z + ps;
    r6.xzw = r18.wyz - r15.zxy;
    r6.y = ps;
    r6 = r6.zwyx * r17.wwww;
    ps = r10.w;
    r0.w = float((r10.z >= 0.9));
    r5.x = ps;
    r13.xyz = r0.www * r16.xyz + r13.xyz;
    ps = (-0.5) + r5.x;
    r1.z = r1.z + r6.z;
    r0.w = saturate(ps);
    ps = r6.w;
    r6.xyz = r15.xyz + r6.xyw;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r14.xyz = -r6.xyz + r14.xyz;
    r6.w = ps;
    r6.xyz = r14.xyz * r0.www + r6.xyw;
    r13.xyz = r13.xyz - r1.xyz;
    r9.xyz = r13.xyz * r0.www + r1.xyz;
    r6.w = r9.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r7.www;
    ps = 1.0 + r6.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r7.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.w));
    r6.xyz = r12.xyz * r5.www;
    r5.x = ps;
    r7.xyz = r7.xyz * r5.xxx;
    r5.x = dot(r7.zxy, r11.zxy);
    r5.xzw = r7.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r11.xyz;
    r5.x = saturate(dot(r4.zxy, r5.wxz));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r0.www;
    r10.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.xzw = r10.xzy * float3(0.875, 15.0, 0.875);
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r0.xyz = r9.xyz * r0.xyz;
    r5.z = ps;
    r5.xw = r5.xw * r8.yz + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r7.zyx, r4.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r2.yyy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
