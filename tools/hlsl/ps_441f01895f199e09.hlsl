// ps_441f01895f199e09.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = r0.wzwz * float4(6.0, 6.0, 4.0, 4.0);
    r13.yzw = tex2D(Texture2D_3, r8.xy).xyw;
    ps = r0.w;
    r8.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_1.x * ps;
    r9.xy = r0.wz * UniformVector_3.xy;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.y = ps;
    ps = rsqrt(abs(r5.x));
    r13.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r14.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r19.xyw = r13.yzx * float3(4.0, 1.0, -0.125);
    r5.w = ps;
    r5.xy = r14.xy * r19.ww + r0.wz;
    ps = r11.x;
    r5.z = -r5.y + 1.0;
    ps = abs(r7.x) * ps;
    r10.yzw = r5.wxz * UniformVector_1.yxy;
    r9.z = ps;
    ps = r11.y;
    r3 = r10.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r21 = float4((r10.wzxy >= 0.5));
    r9.w = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r10.wzxy;
    r11.x = ps;
    r3 = r3.yxzw * r21.yxzw + r10.zwxy;
    ps = 2.5 * r5.y;
    r3 = r3 + r3;
    r11.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r7 = tex2D(Texture2D_2, r3.xy);
    r16 = tex2D(Texture2D_2, r3.zw);
    r10.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r18.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r17.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r5.w = tex2D(Texture2D_3, r8.zw).z;
    r3.yzw = tex2D(Texture2D_0, r8.xy).xyw;
    r8 = tex2D(Texture2D_3, r0.wz).xywz;
    r0.xyz = tex2D(Texture2D_1, r11.xy).xzy;
    ps = r6.w;
    r5.y = saturate(r4.w * 0.0001);
    ps = 1e+01 * ps;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r3.x = saturate(ps);
    ps = -r6.w;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = UniformScalar_8.x + ps;
    r5.x = r1.z + 0.1;
    r22.w = ps;
    ps = r0.y + r0.y;
    r20.yzw = UniformVector_2.xyz * UniformVector_2.www;
    r18.w = ps;
    r20.x = r8.x * 4.0 - 4.0;
    ps = 5.0 * r5.x;
    r10.w = float((UniformScalar_7.x >= 1.0));
    r6.y = saturate(ps);
    ps = r8.y + r8.y;
    r5.x = float((UniformScalar_4.x >= 1.0));
    r17.x = ps;
    ps = 4.0 * r0.x;
    r0.w = float((UniformScalar_4.x > 1.0));
    r9.x = ps;
    ps = 4.0 * r0.z;
    r9.zw = r3.yz + r3.yz;
    r9.y = ps;
    ps = r5.w;
    r17.yzw = r17.ywz + r17.ywz;
    ps = r6.w * ps;
    r22.xyz = r20.yzw * r18.xyz;
    r5.w = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? r10.xyz : 1.0;
    r10.xyz = (-abs(r5.xxx) >= 0.0) ? 1.0 : r0.xyz;
    ps = r13.w;
    r17 = r17.xywz + float4(-2.0, -1.0, -1.0, -1.0);
    ps = r8.z * ps;
    r10 = r22 * r10;
    r6.x = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = r10.w + r6.w;
    r5.z = ps;
    ps = -r5.x;
    r8.xyz = r5.zzz * r1.xyz;
    ps = r6.z + ps;
    r0.x = dot(r21.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r0.z = dot(r21.zww, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    r5.z = (r0.z == 0.0) ? r16.x : r16.y;
    r5.x = (r0.x == 0.0) ? r7.x : r7.y;
    ps = UniformScalar_9.x;
    r1 = r0.xzzx + float4(-3.0, -2.0, -3.0, -2.0);
    r0.z = ps;
    r5.x = (r1.w == 0.0) ? r7.z : r5.x;
    r5.z = (r1.y == 0.0) ? r16.z : r5.z;
    r6.z = (r1.z == 0.0) ? r16.w : r5.z;
    r0.x = (r1.x == 0.0) ? r7.w : r5.x;
    ps = max(r0.y, r0.z);
    r5.z = max(r6.z, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xz = min(r5.xz, float2(1.0, 0.3));
    r6.w = ps;
    ps = r17.x;
    r6.w = saturate(r5.x * r6.w);
    ps = r13.z + ps;
    r7 = -r6.wyzx + 1.0;
    r20.y = ps;
    ps = r5.w;
    r16 = r9 + float4(-2.0, -2.0, -1.0, -1.0);
    ps = r7.x * ps;
    r5.xw = r7.yy * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = 3.3333333 * r5.z;
    r20.w = float((r0.y >= 0.05));
    r20.z = ps;
    ps = (-1.0) - -r6.x;
    r0.yz = -r20.zw + 1.0;
    r13.x = ps;
    ps = 1.0 - r0.x;
    r19.z = r3.x * r0.y;
    r0.y = ps;
    r5.z = (UniformScalar_8.x > 0.0) ? r0.z : 1.0;
    r1.w = (UniformScalar_8.x >= 0.0) ? r5.z : r0.z;
    ps = 1.0 - r5.x;
    r13.yzw = r20.xzy + r19.xzy;
    r6.z = ps;
    ps = 1.0 - r5.w;
    r18.xyz = r13.xyz * r13.zzw;
    r6.w = ps;
    r1.y = r18.z * 2.0 + r17.z;
    ps = 1.0 - r5.y;
    r13.zw = r18.xw + float2(1.0, -1.0);
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r0.w = r13.z * r7.z;
    r6.x = ps;
    r0.z = r0.w * r8.w - r0.w;
    ps = r17.y;
    r0.yz = r3.xx * r0.yz;
    ps = r18.y + ps;
    r13.xy = r0.yw + r0.xz;
    r1.x = ps;
    ps = abs(r13.z) * abs(r13.z);
    r5.xy = r13.wy * float2(0.5, 2.5);
    r15.x = ps;
    ps = (-0.5) + r5.y;
    r0.yz = -r16.xy + r1.xy;
    r0.w = saturate(ps);
    ps = 1.0 / r4.w;
    r0.x = r17.w - r5.x;
    r15.w = ps;
    r3.x = r0.x * r0.w + r5.x;
    r5.xy = r0.yz * r0.ww - 2.0;
    r5.yz = r6.xx * r16.zw + r5.xy;
    ps = r3.w;
    r4.xyw = r15.yzx * r15.wwx;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r5.yw = r5.yz + r9.xy;
    r5.z = ps;
    ps = (-1.0) + r3.x;
    r5.xy = r5.yw * r6.yy;
    r5.w = ps;
    r5.zw = r5.wz * r6.yy + 1.0;
    r5 = (r6.xyyy > 0.0) ? r5.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r9 = (r6.yyyx >= 0.0) ? r5.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    r5.z = dot(r9.zxy, r9.zxy);
    ps = rsqrt(abs(r5.z));
    r5.xy = r4.xy + ScreenPositionScaleBias.wz;
    r5.z = ps;
    r9.xyz = r9.xyz * r5.zzz;
    r5.z = dot(r9.zxy, r14.zxy);
    r0.xyz = r9.xyz * r5.zzz;
    r0.xyz = r0.xyz * 2.0 - r14.xyz;
    r5.z = saturate(dot(r8.zxy, r0.zxy));
    ps = log2(r5.z);
    r1.z = r13.x + r13.x;
    r12.z = ps;
    r0.xyz = r12.xyz * float3(0.875, 0.875, 15.0);
    r1.xy = r0.xy * r6.zw;
    r1 = r1.wxzy + float4(-0.5, 0.125, -0.75, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.xxxx)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r7.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r5.x;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = r4.w * r4.w;
    r4.xyz = r10.xyz * r9.www;
    r6.w = ps;
    r2.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = -UniformVector_0.x;
    r2.xyz = r6.www * r2.xyz;
    ps = 1.0 + ps;
    r6.w = saturate(dot(r9.zyx, r8.zyx));
    r1.x = ps;
    ps = pow(2.0, r0.z);
    r2.xyz = r2.xyz * r0.www;
    r0.x = ps;
    ps = -UniformVector_0.y;
    r0.xyz = r2.xyz * r0.xxx;
    r1.z = saturate(r7.w * 0.2 + r1.z);
    ps = 1.0 + ps;
    r1.w = r1.y * r1.w;
    r1.y = ps;
    r5.yzw = r1.www * r5.yzw + ModShadowColor.xyz;
    ps = -UniformVector_0.z;
    r2.xyz = r1.zzz * r7.xyz;
    ps = 1.0 + ps;
    r2.xyz = r2.xyz * r3.www;
    r1.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.xyz = r4.xyz - r2.xyz;
    r5.x = ps;
    r2.xyz = r3.xyz * r0.www + r2.xyz;
    ps = pow(2.0, r5.x);
    r1.xyz = r2.xyz * r1.xyz;
    r5.x = ps;
    r0.xy = r1.xy * r6.ww + r0.xy;
    r0.z = r1.z * r6.w + r0.z;
    r0.xyz = r0.xyz * r5.xxx;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
