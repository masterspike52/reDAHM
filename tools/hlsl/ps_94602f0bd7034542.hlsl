// ps_94602f0bd7034542.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r5 = r0.wzwz * float4(4.0, 4.0, 6.0, 6.0);
    r9.x = ps;
    r17.yzw = tex2D(Texture2D_3, r5.zw).xyw;
    ps = 1e+01 * r6.w;
    r3.w = r4.w - 4e+02;
    r8.w = saturate(ps);
    ps = UniformScalar_8.x - r6.w;
    r1.w = dot(r3.zxy, r3.zxy);
    r14.w = ps;
    ps = rsqrt(abs(r1.w));
    r17.x = saturate(r3.w * 0.00022222222);
    r1.w = ps;
    r13.xyz = r1.www * r3.xyz;
    ps = -r0.z;
    r15.xyw = r17.yzx * float3(4.0, 1.0, -0.125);
    r3.xy = r13.xy * r15.ww + r0.wz;
    ps = 1.0 + ps;
    r3.z = -r3.y + 1.0;
    r3.w = ps;
    r9.yzw = r3.wxz * UniformVector_1.yxy;
    ps = r0.w;
    r10 = r9.wzxy - 0.5;
    ps = UniformVector_3.x * ps;
    r20 = float4((r9.wzxy >= 0.5));
    r8.x = ps;
    ps = r0.z;
    r10 = r10 - r9.wzxy;
    r9 = r10.yxzw * r20.yxzw + r9.zwxy;
    ps = UniformVector_3.y * ps;
    r11 = r9 + r9;
    r8.y = ps;
    r19 = tex2D(Texture2D_2, r11.zw);
    r9.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r18.yzw = tex2D(Texture2D_7, r8.xy).xyz;
    r16.yzw = tex2D(Texture2D_4, r0.xy).xzy;
    r5.x = tex2D(Texture2D_3, r5.xy).z;
    r10 = tex2D(Texture2D_3, r0.wz).xywz;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r12.zw = r8.xy * r5.zz + ScreenPositionScaleBias.wz;
    r18.x = r10.x * 4.0 - 4.0;
    ps = 0.0001 * r4.w;
    r5.z = r5.x * r6.w;
    r5.y = saturate(ps);
    ps = r1.z;
    r14.xyz = UniformVector_2.xyz * UniformVector_2.www;
    ps = 0.1 + ps;
    r8.xy = r0.xy * UniformScalar_0.xx;
    r5.x = ps;
    ps = r10.y + r10.y;
    r4.w = float((UniformScalar_7.x >= 1.0));
    r16.x = ps;
    ps = 5.0 * r5.x;
    r0.w = float((UniformScalar_4.x >= 1.0));
    r5.x = saturate(ps);
    ps = r16.y + r16.y;
    r5.w = float((UniformScalar_4.x > 1.0));
    r16.y = ps;
    r0.xyz = (-abs(r5.www) >= 0.0) ? r18.yzw : 1.0;
    ps = r16.z + r16.z;
    r5.w = r17.w * r10.z;
    r16.z = ps;
    r4.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = r16.w + r16.w;
    r0.yzw = -r5.yxw + 1.0;
    r16.w = ps;
    r16 = r16.xywz + float4(-2.0, -1.0, -1.0, -1.0);
    ps = ModShadowGroupColor.x * r0.z;
    r14.xyz = r14.xyz * r9.xyz;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14 = r14 * r4;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r14.w + r6.w;
    r4.y = ps;
    ps = -r5.x;
    r12.xy = r4.xy * abs(r7.xy);
    ps = r6.z + ps;
    r7.y = dot(r20.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r7.z = dot(r20.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.x = (r7.z == 0.0) ? r19.x : r19.y;
    ps = UniformScalar_9.x;
    r4 = r7.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r6.y = ps;
    r5.x = (r4.y == 0.0) ? r19.z : r5.x;
    r9.z = (r4.z == 0.0) ? r19.w : r5.x;
    ps = max(r6.x, r6.y);
    r5.x = max(r9.z, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xy = min(r5.yx, float2(1.0, 0.3));
    r6.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r9.w = saturate(r5.x * r6.x);
    r9.y = ps;
    ps = r16.x;
    r9 = -r9.wxyz + 1.0;
    ps = r17.z + ps;
    r5.z = r5.z * r9.x;
    r18.y = ps;
    ps = 3.3333333 * r5.y;
    r18.w = float((r5.z >= 0.05));
    r18.z = ps;
    r6.xy = -r18.zw + 1.0;
    r15.z = r8.w * r6.x;
    r5.z = (UniformScalar_8.x > 0.0) ? r6.y : 1.0;
    r17.w = (UniformScalar_8.x >= 0.0) ? r5.z : r6.y;
    ps = (-1.0) - -r5.w;
    r6.yzw = r18.xzy + r15.xzy;
    r6.x = ps;
    r17.xyz = r6.xyz * r6.zzw;
    ps = 2.5 * r3.x;
    r7.xw = r17.wx + float2(-0.5, 1.0);
    r5.x = ps;
    ps = 2.5 * r3.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r5.y = ps;
    r10.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r12.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r15.yzw = tex2D(LightAttenuationTexture, r12.zw).xyz;
    r18 = tex2D(Texture2D_2, r11.xy);
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r6.yzw = tex2D(Texture2D_0, r8.xy).xyw;
    r4.yz = r6.yz * 2.0 - 1.0;
    ps = r5.z + r5.z;
    r11.yz = r5.xy * 4.0;
    r11.x = ps;
    r5.xyz = r11.xyz + float3(-1.0, -2.0, -2.0);
    ps = 0.5 * r5.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    r15.x = r16.w - r6.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = (r7.y == 0.0) ? r18.x : r18.y;
    r5.x = (r4.w == 0.0) ? r18.z : r5.x;
    r5.x = (r4.x == 0.0) ? r18.w : r5.x;
    ps = 1.0 - r5.x;
    r7.y = r16.y + r17.y;
    r4.x = ps;
    r7.z = r17.z * 2.0 + r16.z;
    ps = r7.w;
    r2.xyz = r15.yzw * r2.www;
    ps = r9.w * ps;
    r15.yz = -r5.yz + r7.yz;
    r5.w = ps;
    r4.w = r5.w * r10.w - r5.w;
    ps = UniformScalar_1.x * r0.y;
    r5.yz = r8.ww * r4.xw;
    r0.x = ps;
    ps = rsqrt(abs(r1.w));
    r4.xw = r5.wy + r5.zx;
    r5.x = ps;
    r1.w = saturate(r4.x * 2.5 - 0.5);
    r6.x = r15.x * r1.w + r6.x;
    r5.yz = r15.yz * r1.ww - 2.0;
    r4.yz = r0.xx * r4.yz + r5.yz;
    ps = r6.w;
    r5.yzw = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r1.yz = r4.yz + r11.yz;
    r1.x = ps;
    ps = (-1.0) + r6.x;
    r11.xy = r1.yz * r0.yy;
    r1.y = ps;
    r11.zw = r1.yx * r0.yy + 1.0;
    r11 = (r0.xyyy > 0.0) ? r11.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r11 = (r0.xyyy >= 0.0) ? r11 : float4(1.0, 0.0, 0.0, 1.0);
    r5.x = dot(r11.wyz, r11.wyz);
    r4.xyz = r14.xyz * r11.xxx;
    r7.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r5.x));
    r9.x = abs(r7.w) * abs(r7.w);
    r5.x = ps;
    r11.xyz = r11.yzw * r5.xxx;
    r5.x = dot(r11.zxy, r13.zxy);
    r1.xyz = r11.xyz * r5.xxx;
    r1.xyz = r1.xyz * 2.0 - r13.xyz;
    r5.x = saturate(dot(r5.wyz, r1.zxy));
    ps = log2(r5.x);
    r9.w = r4.w + r4.w;
    r12.z = ps;
    r1.xyz = r12.xyz * float3(0.875, 0.875, 15.0);
    r9.yz = r1.xy * r9.yz;
    r9.yzw = r9.yzw + float3(0.125, 0.125, -0.75);
    r5.x = saturate(r0.w * 0.2 + r9.w);
    ps = r9.x * r9.x;
    r5.w = saturate(dot(r11.zyx, r5.wzy));
    r0.w = ps;
    ps = r9.y * r9.z;
    r0.xyz = r5.xxx * r10.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r6.www;
    ps = r0.w * r0.w;
    r4.xyz = r4.xyz - r0.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r7.xyz;
    r6.yzw = r6.xyz * r1.www;
    r0.xyz = r4.xyz * r1.www + r0.xyz;
    ps = pow(2.0, r1.z);
    r0.xyz = r0.xyz * r3.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r2.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
