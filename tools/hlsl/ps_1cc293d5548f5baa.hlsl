// ps_1cc293d5548f5baa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041500 0000080A 00000000 00006908 003F00FF 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
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
    float4 color1 : COLOR1; // r7
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
    float4 r7 = In.color1;
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.yzw = UniformVector_6.xyz * UniformVector_6.www;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = 1.0 - r1.y;
    r8.z = r1.x * UniformVector_2.x;
    r4.w = ps;
    ps = r5.w;
    r6.zw = r0.xy * UniformScalar_0.xx;
    ps = 0.0001 * ps;
    r7 = r1.xyxy * float4(6.0, 6.0, 0.5, 0.5);
    r8.y = saturate(ps);
    ps = r5.w;
    r1.zw = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = r2.z + 0.1;
    r6.y = ps;
    ps = 1.0 / r5.w;
    r9.xy = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r0.zw = r9.xy * r0.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r2.w));
    r10.x = saturate(r8.x * 0.00022222222);
    r2.w = ps;
    ps = 5.0 * r6.x;
    r9.xyz = r2.www * r4.xyz;
    r8.w = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r16.xyz = r10.yzx * float3(0.875, 0.875, -0.025);
    r6.x = ps;
    r10.xy = r9.xy * r16.zz + r1.zw;
    ps = UniformVector_2.x * r6.y;
    r8.x = r10.y * r6.x;
    r6.x = ps;
    ps = r6.x;
    r4.xyz = -r8.xyw + 1.0;
    ps = r10.x * ps;
    r8.yw = r4.xw * UniformVector_2.yy;
    r8.x = ps;
    ps = r1.x;
    r5 = r8 - 0.5;
    ps = UniformVector_7.x * ps;
    r19 = float4((r8.xywz >= 0.5));
    r6.x = ps;
    ps = r1.y;
    r5 = r5.xywz - r8.xywz;
    r5 = r5.xywz * r19.xywz + r8;
    ps = UniformVector_7.y * ps;
    r8 = r5 + r5;
    r6.y = ps;
    r5.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r13.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r0.zw = tex2D(Texture2D_3, r7.zw).xy;
    r18 = tex2D(Texture2D_1, r8.xy).xwzy;
    r20 = tex2D(Texture2D_1, r8.zw);
    r8.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r21.xyz = tex2D(Texture2D_9, r6.xy).xyz;
    r14 = tex2D(Texture2D_6, r0.xy).zxyw;
    r1.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r7.xyz = tex2D(Texture2D_2, r7.xy).xwy;
    r12.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r6.yzw = tex2D(Texture2D_4, r6.zw).xwy;
    r2.w = dot(r2.zxy, r2.zxy);
    ps = (-1.0) + r6.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r11.x = ps;
    r10.xyz = r12.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r16.zw = r7.xz + r7.xz;
    r7.x = saturate(ps);
    ps = r6.y + r6.y;
    r7.z = float((UniformScalar_5.x >= 1.0));
    r17.x = ps;
    ps = r6.w + r6.w;
    r17.zw = r1.xy + r1.xy;
    r17.y = ps;
    ps = r7.y;
    r6.x = float((UniformScalar_5.x > 1.0));
    r1.xyz = (-abs(r6.xxx) >= 0.0) ? r21.xyz : 1.0;
    r6.xyw = r8.xyz * 2.0 - 1.0;
    ps = r1.w * ps;
    r7.y = float((r14.w >= 0.5));
    r1.w = ps;
    r8.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r1.xyz;
    ps = log2(r7.x);
    r3.w = r1.w - 1.0;
    r6.z = ps;
    ps = r11.y;
    r17 = r17 - 1.0;
    ps = r14.y * ps;
    r7.z = r4.y * UniformScalar_1.x;
    r3.z = ps;
    r17.xy = r7.zz * r17.xy + r6.xy;
    ps = r11.z;
    r7.x = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    ps = r14.z * ps;
    r7.w = dot(r19.wzz, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r6.y = (r7.w == 0.0) ? r20.x : r20.y;
    r6.x = (r7.x == 0.0) ? r18.x : r18.w;
    ps = ModShadowGroupColor.x * r4.z;
    r19 = r7.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r18.x = ps;
    r6.x = (r19.y == 0.0) ? r18.z : r6.x;
    r6.y = (r19.z == 0.0) ? r20.z : r6.y;
    r18.z = (r19.w == 0.0) ? r20.w : r6.y;
    r0.x = (r19.x == 0.0) ? r18.y : r6.x;
    ps = ModShadowGroupColor.y * r4.z;
    r6.x = max(r18.z, 0.0);
    r18.y = ps;
    ps = 0.25 + r0.x;
    r18.yzw = -r18.xyz + 1.0;
    r0.y = ps;
    ps = r6.x;
    r0.xyw = r0.zwy + r0.zwx;
    r7.x = ps;
    ps = 0.3;
    r16.xy = r16.xy * r18.yz;
    r7.w = ps;
    ps = min(r7.x, r7.w);
    r6.xy = r0.xy - 1.0;
    r18.x = ps;
    ps = 0.012 * r6.x;
    r1.yz = r18.xw * float2(3.3333333, 2.5);
    r7.x = ps;
    ps = 0.012 * r6.y;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r7.w = ps;
    r3.xy = r16.zw * 0.5 + r17.zw;
    r11.yz = r17.xy * UniformVector_4.xy - r7.xw;
    ps = r11.w;
    r0.z = r16.x * r16.y;
    r0.xyz = r0.zzz * r15.xyz + ModShadowColor.xyz;
    r7.xw = r11.yz * r7.yy + r7.xw;
    ps = r14.x * ps;
    r14.yzw = r1.yyy * r3.xyw;
    r5.w = ps;
    ps = UniformVector_4.z * r6.w;
    r3.xy = r7.xw + r14.yz;
    r14.x = ps;
    ps = r3.z;
    r7.xw = r14.xw + float2(-1.0, 1.0);
    ps = r8.x * ps;
    r3.yz = -r10.xy + r3.xy;
    r8.x = ps;
    r3.w = saturate(r1.z * r7.w - 0.5);
    ps = r1.x;
    r3.x = abs(r7.w) * abs(r7.w);
    ps = r8.y * ps;
    r1.xyz = r3.yzx * r3.wwx;
    r8.y = ps;
    ps = r5.w;
    r11.yz = r10.xy + r1.xy;
    ps = r8.z * ps;
    r11.xyw = r11.yzx * r4.yyy;
    r8.z = ps;
    ps = r0.w;
    r6.x = r11.w + 1.0;
    r6.x = (r7.z > 0.0) ? r6.x : 1.0;
    r7.z = (r7.z >= 0.0) ? r6.x : 1.0;
    ps = -r1.w + ps;
    r6.xy = r7.yx * r7.zy;
    r6.w = saturate(ps);
    ps = -r10.z;
    r1.xyw = r6.www * r13.xyz;
    ps = r6.y + ps;
    r8.xyw = r8.xyz * r6.xxx;
    r6.x = ps;
    r10.yzw = r8.xyw * r7.www - r1.xyw;
    ps = 1.0 + r6.x;
    r8.z = -UniformVector_0.z + 1.0;
    r10.x = ps;
    r10 = r10.xywz * r3.wwww;
    ps = rsqrt(abs(r2.w));
    r10.z = r1.w + r10.z;
    r6.x = ps;
    ps = UniformScalar_6.x * r7.y;
    r6.yw = -UniformVector_0.xy + 1.0;
    r12.w = ps;
    ps = 1.0 - r7.y;
    r3.xyz = r6.xxx * r2.xyz;
    r6.x = ps;
    ps = r10.x;
    r7.yzw = r6.xxx * UniformVector_5.xyz;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r1.xy = r1.xy + r10.yw;
    r7.x = ps;
    ps = r1.z * r1.z;
    r7 = r7 + r12.zwww;
    r10.w = ps;
    ps = r7.x;
    r1.xy = r1.xy * r6.yw;
    r8.xyw = r8.xyw * UniformScalar_7.xxx + r7.yzw;
    ps = r12.z + ps;
    r10.xy = r10.ww * r8.xy;
    r6.x = ps;
    r11.z = r6.x * r4.y + 1.0;
    r6.xyw = (r4.yyy > 0.0) ? r11.xyz : float3(0.0, 0.0, 1.0);
    r7.xyz = (r4.yyy >= 0.0) ? r6.xyw : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.x));
    r2 = r10.wxyz * r8.wxyz;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r6.x = dot(r7.zxy, r9.zxy);
    r6.xyw = r7.xyz * r6.xxx;
    r6.xyw = r6.xyw * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r6.wxy));
    ps = log2(r6.x);
    r1.z = r2.x * r8.w;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r6.y = r6.x * 15.0;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r7.y = saturate(dot(r7.zyx, r3.zyx));
    r7.x = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r2.yzw * r7.xxy;
    r6.x = ps;
    r6.yzw = r1.xyz * r7.yyx + r6.yzw;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r5.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
