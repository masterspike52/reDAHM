// ps_bb78367cb98ff099.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
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

    ps = UniformVector_1.x * r1.w;
    r11 = r1.wzwz * float4(4.0, 4.0, 6.0, 6.0);
    r10.x = ps;
    r19.yzw = tex2D(Texture2D_3, r11.zw).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r5.w - 4e+02;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    ps = rsqrt(abs(r6.x));
    r19.x = saturate(r6.y * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r13.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r17.xyw = r19.yzx * float3(4.0, 1.0, -0.125);
    r6.w = ps;
    r6.xy = r13.xy * r17.ww + r1.wz;
    ps = r9.x;
    r6.z = -r6.y + 1.0;
    ps = abs(r8.x) * ps;
    r10.yzw = r6.wxz * UniformVector_1.yxy;
    r0.z = ps;
    ps = r9.y;
    r4 = r10.wzxy - 0.5;
    ps = abs(r8.y) * ps;
    r22 = float4((r10.wzxy >= 0.5));
    r0.w = ps;
    ps = 2.5 * r6.x;
    r4 = r4 - r10.wzxy;
    r9.x = ps;
    r4 = r4.yxzw * r22.yxzw + r10.zwxy;
    ps = 2.5 * r6.y;
    r4 = r4 + r4;
    r9.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r20 = tex2D(Texture2D_2, r4.xy);
    r21 = tex2D(Texture2D_2, r4.zw);
    r18.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r10.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r0.w = tex2D(Texture2D_3, r11.xy).z;
    r6.yzw = tex2D(Texture2D_1, r9.xy).zxy;
    r16 = tex2D(Texture2D_3, r1.wz);
    ps = 1e+01 * r7.w;
    r9.zw = r1.xy * UniformScalar_0.xx;
    r0.z = saturate(ps);
    r8.yzw = tex2D(Texture2D_0, r9.zw).xyw;
    ps = r5.w;
    r11.w = -r7.w + UniformScalar_8.x;
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r4.y = saturate(ps);
    ps = 1.0 / r5.w;
    r4.xz = r5.xy * ScreenPositionScaleBias.xy;
    r2.w = ps;
    r9.zw = r4.xz * r2.ww + ScreenPositionScaleBias.wz;
    r12.zw = r8.yz * 2.0 - 1.0;
    r18.x = r16.x * 4.0 - 4.0;
    ps = r16.y + r16.y;
    r14.y = r6.y + r6.y;
    r14.x = ps;
    ps = 5.0 * r6.x;
    r0.w = r0.w * r7.w;
    r4.z = saturate(ps);
    ps = 4.0 * r6.z;
    r11.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r14.z = ps;
    ps = r19.w;
    r10.w = float((UniformScalar_7.x >= 1.0));
    ps = r16.w * ps;
    r11 = r11 * r10;
    r4.x = ps;
    ps = 4.0 * r6.w;
    r4.yzw = -r4.yxz + 1.0;
    r14.w = ps;
    ps = r11.w;
    r15 = r14.zwxy + float4(-2.0, -2.0, -2.0, -1.0);
    ps = r7.w + ps;
    r10.yz = r4.ww * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = -r6.x;
    r5.yzw = r18.ywz + r18.ywz;
    ps = r7.z + ps;
    r10.x = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r10.w = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r6.w = (r10.w == 0.0) ? r21.x : r21.y;
    r6.y = (r10.x == 0.0) ? r20.x : r20.y;
    ps = UniformScalar_9.x;
    r7 = r10.xwwx + float4(-3.0, -2.0, -3.0, -2.0);
    r6.z = ps;
    r6.y = (r7.w == 0.0) ? r20.z : r6.y;
    r6.w = (r7.y == 0.0) ? r21.z : r6.w;
    r10.x = (r7.z == 0.0) ? r21.w : r6.w;
    r7.x = (r7.x == 0.0) ? r20.w : r6.y;
    ps = max(r6.x, r6.z);
    r6.y = max(r10.x, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r6.xy = min(r6.xy, float2(1.0, 0.3));
    r6.z = ps;
    r10.w = saturate(r6.x * r6.z);
    ps = r15.z;
    r10 = -r10.wxyz + 1.0;
    ps = r19.z + ps;
    r6.z = r0.w * r10.x;
    r18.y = ps;
    ps = 3.3333333 * r6.y;
    r18.w = float((r6.z >= 0.05));
    r18.z = ps;
    r6.xy = -r18.zw + 1.0;
    r17.z = r0.z * r6.x;
    r6.z = (UniformScalar_8.x > 0.0) ? r6.y : 1.0;
    r10.x = (UniformScalar_8.x >= 0.0) ? r6.z : r6.y;
    ps = (-1.0) - -r4.x;
    r6.yzw = r18.xzy + r17.xzy;
    r6.x = ps;
    r6.yzw = r6.xyz * r6.zzw;
    ps = 1.0 + r6.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r0.w = ps;
    ps = 1.0 - r7.x;
    r7.w = r0.w * r10.y;
    r7.y = ps;
    r7.z = r7.w * r16.z - r7.w;
    r7.yz = r0.zz * r7.yz;
    ps = UniformScalar_1.x * r4.y;
    r7.xy = r7.wy + r7.zx;
    r4.x = ps;
    r7.x = saturate(r7.x * 2.5 - 0.5);
    ps = r15.w;
    r5.x = r7.y + r7.y;
    r6.y = ps;
    ps = 0.5 * r6.y;
    r5 = r5.xywz + float4(-0.75, -1.0, -1.0, -1.0);
    r7.y = ps;
    ps = r5.w;
    r7.z = r5.y + r6.z;
    r7.w = r6.w * 2.0 + r5.z;
    ps = -r7.y + ps;
    r6.zw = -r15.xy + r7.zw;
    r6.y = ps;
    r8.x = r6.y * r7.x + r7.y;
    r6.yz = r6.zw * r7.xx - 2.0;
    r7.yz = r4.xx * r12.zw + r6.yz;
    ps = r8.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = (-1.0) + r6.z;
    r7.yz = r7.yz + r14.zw;
    r6.y = ps;
    ps = (-1.0) + r8.x;
    r3.xy = r7.yz * r4.yy;
    r6.z = ps;
    r3.zw = r6.zy * r4.yy + 1.0;
    r3 = (r4.xyyy > 0.0) ? r3.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r3 = (r4.yyyx >= 0.0) ? r3.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r6.y = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r7.yzw = r6.zzz * r2.xyz;
    r6.y = ps;
    r2.xyw = r3.xyz * r6.yyy;
    r6.y = dot(r2.wxy, r13.zxy);
    r6.yzw = r2.xyw * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r13.xyz;
    r6.w = saturate(dot(r7.wyz, r6.wyz));
    ps = log2(r6.w);
    r6.yz = r1.wz * UniformVector_3.xy;
    r12.z = ps;
    r1.xyw = r12.xyz * float3(0.875, 0.875, 15.0);
    r10.yz = r1.xy * r10.zw;
    r5.yzw = r10.xyz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r3.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r2.z = tex2D(ShadowTexture, r0.xy).x;
    r10.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r6.yz).xyz;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r1.z = float((UniformScalar_4.x >= 1.0));
    ps = 1.0 - r6.x;
    r9.x = float((UniformScalar_4.x > 1.0));
    r6.x = saturate(ps);
    r0.xyz = (-abs(r9.xxx) >= 0.0) ? r0.xyz : 1.0;
    r0.xyz = (-abs(r1.zzz) >= 0.0) ? 1.0 : r0.xyz;
    ps = log2(r6.x);
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r0.xyz = r11.xyz * r0.xyz;
    r1.z = saturate(r4.z * 0.2 + r5.x);
    r4.xyz = r1.zzz * r10.xyz;
    r4.xyz = r4.xyz * r8.www;
    r8.xyz = r0.xyz * r3.www;
    r0.xyz = r8.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r8.xyz = r8.xyz - r4.xyz;
    r4.xyz = r8.xyz * r7.xxx + r4.xyz;
    r1.xyz = r4.xyz * r9.xyz;
    ps = abs(r0.w) * abs(r0.w);
    r7.w = saturate(dot(r2.wyx, r7.wzy));
    r5.x = ps;
    r2.xy = r5.xz * r5.xw;
    r6.yzw = r2.yyy * r6.yzw + ModShadowColor.xyz;
    r7.yz = r2.xz * r2.xz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r7.yyy * r0.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r0.xyz = r7.zzz * r3.xyz;
    r6.x = ps;
    r0.xyz = r0.xzy * r6.xxx;
    ps = pow(2.0, r1.w);
    r7.xyz = r2.xyz * r7.xxx;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r7.xy = r1.xy * r7.ww + r7.xy;
    r7.z = r1.z * r7.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.ywz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
