// ps_35f9a2e765b85c61.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 366 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005B8 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r5.xy = r0.wz * 6.0;
    r13.z = ps;
    r9.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = -r0.z + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r4.w - 4e+02;
    r5.y = ps;
    r7.yw = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r12.xy = r6.xz * abs(r8.xy);
    r5.z = ps;
    ps = r1.z;
    r10.xy = r0.xy * UniformScalar_0.xx;
    ps = 0.1 + ps;
    r10.zw = r0.wz * UniformVector_7.xy;
    r5.w = ps;
    ps = 5.0 * r5.w;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r7.z = saturate(ps);
    ps = 0.00022222222 * r5.x;
    r6.xz = r0.wz * UniformVector_1.xy;
    r7.x = saturate(ps);
    ps = 1.0 / r4.w;
    r8.xyz = r5.zzz * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.xyz = r7.xyw * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    r11.xy = r8.xy * r9.xx + r6.xz;
    ps = UniformVector_2.x * r5.y;
    r7.xyw = r11.zwy * r5.zzx;
    r5.x = ps;
    ps = r5.x;
    r6.xz = -r7.wz + 1.0;
    ps = r11.x * ps;
    r13.yw = r6.xy * UniformVector_2.yy;
    r13.x = ps;
    r5 = r13 - 0.5;
    r18 = float4((r13.xywz >= 0.5));
    ps = ScreenPositionScaleBias.w + r7.x;
    r5 = r5.xywz - r13.xywz;
    r6.x = ps;
    r5 = r5.xywz * r18.xywz + r13;
    ps = ScreenPositionScaleBias.z + r7.y;
    r5 = r5 + r5;
    r6.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r17.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r15 = tex2D(Texture2D_1, r5.xy).wyxz;
    r19 = tex2D(Texture2D_1, r5.zw);
    r11.xyz = tex2D(Texture2D_0, r11.xy).xyz;
    r20.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r21.xyz = tex2D(Texture2D_8, r10.zw).xyz;
    r13.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r12 = tex2D(Texture2D_6, r0.xy);
    r6.xyw = tex2D(Texture2D_3, r10.xy).wxy;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r4.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = saturate(ps);
    ps = (-1.0) + r6.x;
    r5.y = float((UniformScalar_5.x >= 1.0));
    r10.z = ps;
    ps = 1.0 - r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r10.w = ps;
    ps = 1.0 - r5.x;
    r7.w = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = r12.w;
    r4.zw = r13.xy + r13.xy;
    r5.w = ps;
    ps = r6.y + r6.y;
    r5.z = float((UniformScalar_5.x > 1.0));
    r4.x = ps;
    r13.xyz = (-abs(r5.zzz) >= 0.0) ? r21.xyz : 1.0;
    r20.xyz = r20.xyz * 2.0 - 1.0;
    r2.xyw = r11.xzy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r5.z = r9.w * r13.w;
    r7.w = ps;
    ps = r6.w + r6.w;
    r1.xyz = r7.www * r1.xyz;
    r4.y = ps;
    r13.w = r20.z * UniformVector_4.z - r2.y;
    r13.xyz = (-abs(r5.yyy) >= 0.0) ? 1.0 : r13.xzy;
    ps = log2(r5.x);
    r7.w = r10.w * UniformScalar_1.x;
    r5.y = ps;
    ps = UniformScalar_6.x * r5.w;
    r4 = r4 - 1.0;
    r11.w = ps;
    r5.xw = r7.ww * r4.xy + r20.xy;
    r5.xw = r5.xw * UniformVector_4.xy - r2.xw;
    ps = (-1.0) - -r5.z;
    r10.x = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r4.z;
    r10.y = dot(r18.wzz, float3(1.0, 1.0, 1.0));
    r0.w = (r10.y == 0.0) ? r19.x : r19.y;
    r6.w = (r10.x == 0.0) ? r15.z : r15.y;
    ps = r9.y + ps;
    r18 = r10.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r9.y = ps;
    r6.w = (r18.y == 0.0) ? r15.w : r6.w;
    r0.w = (r18.z == 0.0) ? r19.z : r0.w;
    r15.z = (r18.w == 0.0) ? r19.w : r0.w;
    r6.w = (r18.x == 0.0) ? r15.x : r6.w;
    r9.x = r6.w * 2.0 - r5.z;
    ps = ModShadowGroupColor.x * r6.z;
    r6.w = max(r15.z, 0.0);
    r15.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r14.x = min(r6.w, 0.3);
    r15.y = ps;
    ps = r4.w;
    r6.yzw = -r15.zyx + 1.0;
    ps = r9.z + ps;
    r4.xyz = r14.yxz * float3(0.875, 3.3333333, 0.875);
    r9.z = ps;
    r14.xy = r4.yy * r9.yz + r5.xw;
    r15.yzw = r4.yxz * r6.xwz + float3(1.0, 0.125, 0.125);
    ps = r12.w;
    r15.x = abs(r15.y) * abs(r15.y);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r10.xy = r15.xz * r15.xw;
    r5.w = ps;
    r7.xyz = r10.yyy * r7.xyz + ModShadowColor.xyz;
    ps = UniformVector_5.x * r5.w;
    r9.yz = r10.xz * r10.xw;
    r2.y = ps;
    ps = UniformVector_5.y * r5.w;
    r14.zw = r9.xz + float2(1.25, 1.0);
    r2.z = ps;
    r5.x = (r7.w > 0.0) ? r14.w : 1.0;
    r16.w = (r7.w >= 0.0) ? r5.x : 1.0;
    ps = r14.z;
    r4 = r16 * r12;
    ps = -r5.z + ps;
    r13.xyz = r4.xzy * r13.xyz;
    r5.x = saturate(ps);
    ps = r13.x;
    r12.xyz = r5.xxx * r17.xyz;
    ps = r16.w * ps;
    r4.yz = r13.zy * r4.ww;
    r5.x = ps;
    ps = 2.5 * r6.y;
    r4.x = r5.x * r12.w;
    r4.w = ps;
    r13.xyz = r4.xyz * r15.yyy - r12.xyz;
    r5.z = saturate(r4.w * r15.y - 0.5);
    r6.xy = r14.xy * r5.zz + r2.xw;
    r2.x = r13.w * r5.z - 2.0;
    r12.xyz = r13.xyz * r5.zzz + r12.xyz;
    ps = UniformVector_5.z * r5.w;
    r0.xyz = r12.xyz * r0.xyz;
    r2.w = ps;
    r2 = r2 + r11.zwww;
    r4.xyz = r4.xyz * UniformScalar_7.xxx + r2.yzw;
    r6.z = r2.x + r11.z;
    r6.xyz = r6.zxy * r10.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r10.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r2.xyz = (r10.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r5.x));
    r6.xyz = r9.yyy * r4.xyz;
    r5.x = ps;
    r2.xyz = r2.xyz * r5.xxx;
    r5.x = dot(r2.zxy, r8.zxy);
    r4.xyz = r2.xyz * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r1.zxy, r4.zxy));
    ps = log2(r5.x);
    r6.yzw = r6.xyz * r5.zzz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r6.x = saturate(dot(r2.zyx, r1.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r6.yzw * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.xx + r5.yz;
    r5.w = r0.z * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
