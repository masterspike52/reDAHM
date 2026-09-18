// ps_8fc3c20140b5ad76.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 291 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000048C 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r14.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r9.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r4.w - 4e+02;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r9.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r9.y = saturate(r5.z * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r10.xyz = r9.ywz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r9.zw = r8.xy * r10.xx;
    r9.y = ps;
    r5.xz = r9.xy - 0.5;
    r11.xw = float2((r9.xy >= 0.5));
    ps = r5.y;
    r5.xz = r5.xz - r9.xy;
    ps = abs(r7.x) * ps;
    r6.zw = r5.xz * r11.xw;
    r5.z = ps;
    ps = r5.w;
    r9 = r9 + r6.zwxy;
    ps = abs(r7.y) * ps;
    r5.xy = r9.xy + r9.xy;
    r5.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r16 = tex2D(Texture2D_1, r5.xy);
    r3.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_0, r9.zw).xyz;
    r7.xz = r0.wz * UniformVector_6.xy;
    r12.xyz = r5.xyw * 2.0 - 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = r3.x + r3.x;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = r3.y + r3.y;
    r15.x = dot(r11.xww, float3(1.0, 1.0, 1.0));
    r15.z = ps;
    r5.z = (r15.x == 0.0) ? r16.x : r16.y;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r15.z;
    r6.xyw = r6.xyz * UniformVector_4.xyz;
    r5.z = (r15.y == 0.0) ? r16.z : r5.z;
    r7.y = (r15.x == 0.0) ? r16.w : r5.z;
    ps = r10.z + ps;
    r5.z = max(r7.y, 0.0);
    r10.x = ps;
    ps = r15.w;
    r11.x = min(r5.z, 0.3);
    ps = r10.y + ps;
    r3.xyz = r11.yxz * float3(0.875, 3.3333333, 0.875);
    r10.y = ps;
    r10.xy = r3.yy * r10.xy + r6.xy;
    ps = 1.0 / r4.w;
    r13.xy = r10.xy - r12.xy;
    r5.z = ps;
    r9.xy = r13.zw * r5.zz + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(Texture2D_4, r9.zw).xyz;
    r11.xyz = tex2D(Texture2D_6, r7.xz).xyz;
    r7.xzw = tex2D(Texture2D_7, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = dot(r1.zxy, r1.zxy);
    r4.x = saturate(r4.w * 0.0001);
    ps = r1.z;
    r4.yzw = UniformVector_5.xyz * UniformVector_5.www;
    ps = 0.1 + ps;
    r0.xyz = r0.xyz * r2.www;
    r5.x = ps;
    r2.xyz = r7.xzw * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r7.x = r8.w * r3.w - 1.0;
    ps = 5.0 * r5.x;
    r4.yzw = r4.yzw * r14.xyz;
    r7.z = saturate(ps);
    ps = -r12.z;
    r14.xyz = r4.yzw * r11.xyz;
    ps = r6.w + ps;
    r5.xy = -r7.yz + 1.0;
    r11.w = ps;
    ps = 2.5 * r5.x;
    r4.yz = r5.yy * ModShadowGroupColor.xy;
    r14.w = ps;
    ps = rsqrt(abs(r5.z));
    r7.yzw = -r4.zyx + 1.0;
    r5.z = ps;
    r4.xyz = r3.yxz * r7.xzy + float3(1.0, 0.125, 0.125);
    r11.xyz = r14.xyz * r4.xxx - r10.xyz;
    ps = abs(r4.x) * abs(r4.x);
    r3.xyz = r5.zzz * r1.xyz;
    r0.w = ps;
    r6.w = saturate(r14.w * r4.x - 0.5);
    r5.xy = r13.xy * r6.ww + r12.xy;
    r5.z = r11.w * r6.w - 2.0;
    r1.xyz = r11.xyz * r6.www + r10.xyz;
    ps = r0.w * r0.w;
    r1.xyz = r1.xyz * r9.xyz;
    r4.w = ps;
    r5.z = r5.w * 2.0 + r5.z;
    r4.xy = r4.yw * r4.zw;
    r6.xyz = r4.xxx * r6.xyz + ModShadowColor.xyz;
    r5.xyz = r5.zxy * r7.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r7.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r7.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r4.yyy * r2.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
