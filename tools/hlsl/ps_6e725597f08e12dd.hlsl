// ps_6e725597f08e12dd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r7.xy);
    r15.y = ps;
    r6.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / r4.w;
    r5.w = -r0.z + 1.0;
    r5.z = ps;
    r12.zw = r0.xy * UniformVector_3.xy;
    r9.xy = r0.xy + 0.5;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = dot(r1.zxy, r1.zxy);
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r6.xy = r5.zz * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r9.zw = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.x));
    r13.xyz = r5.yyy * r1.xyz;
    r6.x = ps;
    ps = r1.z;
    r4.xyz = r6.xxx * r3.zxy;
    ps = 0.1 + ps;
    r5.y = dot(r7.zxy, r7.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.z = max(r4.x, 0.0);
    r5.y = ps;
    ps = 5.0 * r5.x;
    r14.xyz = r7.xyz * r5.yyy;
    r5.y = saturate(ps);
    r5.xz = -r5.zy + 1.0;
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = dot(r14.zxy, r4.xyz);
    r7.x = ps;
    ps = log2(abs(r5.x));
    r1.xyz = r14.xzy * r5.yyy;
    r5.y = ps;
    r1.xyz = r1.xyz * 2.0 - r4.yxz;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = r5.y * UniformScalar_4.x;
    r7.y = ps;
    ps = pow(2.0, r5.y);
    r5.x = saturate(dot(r13.zxy, r1.yxz));
    r7.z = ps;
    ps = log2(r5.x);
    r1.yzw = -r7.xyz + 1.0;
    r6.y = ps;
    r6 = r6.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    r9.xy = r6.zz * r3.xy + r9.xy;
    ps = UniformVector_2.y * r5.w;
    r15.zw = r6.xy * r1.yz;
    r15.x = ps;
    r5.xw = r6.zz * r3.xy + 0.5;
    ps = r5.x;
    r11 = r15.zwyx + float4(0.125, 0.125, -0.5, -0.5);
    ps = r0.x + ps;
    r12.xy = float2((r15.xy >= 0.5));
    r5.x = ps;
    ps = r5.w;
    r5.yz = r11.zw - r15.yx;
    r5.yz = r5.yz * r12.yx + r15.yx;
    ps = r0.y + ps;
    r3.xy = r5.yz + r5.yz;
    r5.y = ps;
    r5.z = tex2D(Texture2D_3, r12.zw).x;
    r4 = tex2D(Texture2D_2, r3.xy);
    r15.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r3 = tex2D(Texture2D_1, r0.xy);
    r0.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r5.y = tex2D(Texture2D_1, r5.xy).w;
    r9.yzw = UniformVector_1.xyz * UniformVector_1.www;
    ps = 1.0 - r5.y;
    r0.xyz = r0.xyz * 0.15;
    r9.x = ps;
    r9.yzw = r9.yzw * r3.xyz - r0.xyz;
    r5.x = r9.x * r3.w + r5.y;
    r9.xyz = r9.yzw * r3.www + r0.xyz;
    r3.xyz = r9.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    ps = r9.x;
    r0.xyz = r15.xyz * r2.www;
    ps = r8.x * ps;
    r1.x = saturate(dot(r14.zxy, r13.zxy));
    r2.x = ps;
    ps = r9.y;
    r5.w = dot(r12.yxx, float3(1.0, 1.0, 1.0));
    ps = r8.y * ps;
    r5.y = r11.x * r11.y;
    r2.y = ps;
    r6.xyz = r5.yyy * r10.xyz + ModShadowColor.xyz;
    r0.w = (r5.w == 0.0) ? r4.x : r4.y;
    ps = r9.z;
    r5.yzw = r5.zww + float3(1.0, -3.0, -2.0);
    ps = r8.z * ps;
    r2.w = r5.y - r7.z;
    r2.z = ps;
    r5.y = (r5.w == 0.0) ? r4.z : r0.w;
    r5.y = (r5.z == 0.0) ? r4.w : r5.y;
    ps = 1.0 - r5.y;
    r1 = r2 * r1.xxxw;
    r5.w = ps;
    ps = pow(2.0, r6.w);
    r0.w = r1.w * r5.x;
    r5.z = ps;
    r5.xy = r3.xy * r5.zz + r1.xy;
    r5.z = r3.z * r5.z + r1.z;
    r5 = r0.wxyz * r5.wxyz;
    ps = r5.x;
    r5.yzw = r5.ywz * LightColor.xzy;
    r5.x = ps;
    ps = (-0.5) - -r5.x;
    r5.yzw = r5.ywz * r6.xyz;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    oC0.xyz = r5.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
