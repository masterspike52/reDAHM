// ps_a8ef2b6406ea04cc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 351 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000057C 10041600 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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

    ps = r0.x;
    r5.zw = UniformVector_1.xy * 1.7;
    ps = UniformScalar_2.x * ps;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r9.y = ps;
    ps = r0.y;
    r5.zw = r5.zw * r0.wz;
    ps = UniformScalar_2.x * ps;
    r14 = r6 * r0.wzwz;
    r9.z = ps;
    r6.xyz = tex2D(Texture2D_1, r14.zw).xyz;
    r20.xyz = tex2D(Texture2D_4, r9.yz).xyz;
    r22 = tex2D(Texture2D_3, r14.xy);
    r12 = tex2D(Texture2D_3, r5.zw);
    ps = 0.0001 * r4.w;
    r5.xy = r0.xy * UniformScalar_0.xx;
    r13.x = saturate(ps);
    r11.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    ps = 1.0 - r0.z;
    r9.w = ps;
    ps = r1.z;
    r8.xy = r0.wz * UniformScalar_5.xx;
    ps = 0.1 + ps;
    r8.z = float((r0.w >= 0.5));
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.yz = r5.zw * r5.yy + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r10.xy = r11.xy + r11.xy;
    r9.x = saturate(ps);
    ps = r22.w;
    r20.w = float((r9.w >= 0.5));
    r10.z = r20.w * 2.0 + r8.z;
    ps = r12.w * ps;
    r5.xw = -r9.xw + float2(1.0, 0.5);
    r0.y = ps;
    ps = 1.0 - r0.y;
    r13.yz = r5.xx * ModShadowGroupColor.xy;
    r8.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xw = r8.zw * float2(-0.5, 0.5);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r5.w - r0.z;
    r5.w = ps;
    r16.y = dot(r6.ww, r20.ww) - r0.z;
    ps = r9.x;
    r5.xw = r5.xw * abs(r7.xy);
    ps = r0.w + ps;
    r4.yzw = -r13.xyz + 1.0;
    r6.w = ps;
    ps = UniformScalar_1.x * r4.y;
    r15 = r10.zyxz + float4(-3.0, -1.0, -1.0, -2.0);
    r3.w = ps;
    r16.zw = r3.ww * r15.yz;
    ps = r6.z + r6.z;
    r13.xyz = r16.ywz + float3(2.0, -2.0, -2.0);
    r0.x = ps;
    ps = r6.w + r6.w;
    r0.w = r13.x - r0.z;
    r0.z = ps;
    r8.yzw = tex2D(Texture2D_7, r8.xy).xyz;
    r19.xyz = tex2D(Texture2D_5, r14.zw).xyz;
    r15.yz = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r17 = tex2D(Texture2D_2, r0.zw);
    r18.xyz = tex2D(Texture2D_6, r9.yz).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = dot(r2.zxy, r2.zxy);
    r4.x = r22.z * 2.0 + r12.z;
    ps = 1.0 - r5.y;
    r12.zw = r12.xy + r12.xy;
    r5.x = saturate(ps);
    ps = 4.0 * r6.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r5.y));
    r21.xyz = r7.xyz * r2.www;
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r1.w = ps;
    ps = 4.0 * r6.y;
    r7.xyz = r5.zzz * r1.xyz;
    r12.y = ps;
    ps = log2(r5.x);
    r5.yzw = r5.yyy - r18.xyz;
    r5.x = ps;
    r20.xyz = r20.zxy * 2.0 - 1.0;
    r2.xyz = r5.yzw * UniformScalar_4.xxx + r18.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r18 = r12.zxyw + float4(-3.0, -2.0, -2.0, -3.0);
    r5.w = ps;
    r5.xz = r22.yx * 4.0 + r18.wx;
    r5.y = (r10.z == 0.0) ? r17.x : r17.y;
    ps = pow(2.0, r5.w);
    r10.xyz = r2.xyz * UniformVector_4.xyz;
    r5.w = ps;
    ps = r1.w;
    r1.xyz = r21.xzy * r5.www;
    r5.y = (r15.w == 0.0) ? r17.z : r5.y;
    r6.y = (r15.x == 0.0) ? r17.w : r5.y;
    ps = r3.x * ps;
    r5.y = max(r6.y, 0.0);
    r8.x = ps;
    ps = 1.0 - r6.y;
    r20.w = r20.z + r16.z;
    r15.w = ps;
    ps = r20.y;
    r15.x = min(r5.y, 0.3);
    ps = r16.w + ps;
    r17 = r15.yxzw * float4(0.875, 3.3333333, 0.875, 2.5);
    r5.y = ps;
    ps = UniformVector_3.x * r5.y;
    r6.xzw = r17.yxz * r4.xzw;
    r17.x = ps;
    ps = 0.1 * r6.x;
    r5.yw = r0.yx - 1.0;
    r18.x = ps;
    ps = 0.5 * r5.w;
    r15.yzw = r6.yzw + float3(-0.75, 0.125, 0.125);
    r16.x = ps;
    ps = r15.y;
    r16.yz = r18.yz + r16.wz;
    ps = r6.y + ps;
    r5.xyz = r17.yyy * r5.xyz;
    r6.x = ps;
    ps = 1.0 + r5.y;
    r17.yz = r20.xw * UniformVector_3.zy;
    r5.w = ps;
    ps = r5.z + r5.z;
    r6.y = saturate(r6.x + r9.w);
    r18.y = ps;
    r6.x = saturate(r17.w * r5.w - 0.5);
    ps = r5.x + r5.x;
    r0.xyz = r6.yyy * r19.xyz;
    r18.z = ps;
    ps = abs(r5.w) * abs(r5.w);
    r5.xyz = r18.yxz + r17.xyz;
    r5.w = ps;
    ps = r5.w * r5.w;
    r5.xyz = r5.yxz - r16.xyz;
    r15.x = ps;
    r11.w = r5.x * r6.x + r16.x;
    r13.xy = r5.yz * r6.xx + r13.yz;
    ps = r0.x;
    r6.yw = r15.xz * r15.xw;
    r5.xzw = r6.www * r14.xyz + ModShadowColor.xyz;
    ps = r11.z * ps;
    r12.xy = r13.xy + r12.xy;
    r0.x = ps;
    ps = r0.y;
    r12.zw = r11.zw - 1.0;
    ps = r11.z * ps;
    r12.xy = r12.xy * r4.yy;
    r0.y = ps;
    r12.zw = r12.wz * r4.yy + 1.0;
    r5.y = (r3.w > 0.0) ? r12.w : 1.0;
    r12.xyz = (r4.yyy > 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    r5.y = (r3.w >= 0.0) ? r5.y : 1.0;
    ps = r0.z;
    r8.yzw = r5.yyy * r8.yzw;
    r4.xyz = (r4.yyy >= 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    ps = r11.z * ps;
    r5.y = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    r10.xyz = r10.xyz * r8.yzw - r0.xyz;
    ps = r1.w;
    r8.yzw = r8.yzw * UniformVector_4.xyz;
    ps = r3.y * ps;
    r2.xyz = r8.yzw * r2.xyz;
    r8.y = ps;
    r0.xyz = r10.xyz * r6.xxx + r0.xyz;
    ps = rsqrt(abs(r5.y));
    r0.xyz = r0.xyz * r9.xyz;
    r5.y = ps;
    r2.xyz = r2.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r1.w;
    r4.xyz = r4.xyz * r5.yyy;
    ps = r3.z * ps;
    r6.w = saturate(dot(r4.zyx, r7.zyx));
    r8.z = ps;
    r5.y = dot(r4.zxy, r8.zxy);
    r3.xyz = r4.xyz * r5.yyy;
    r3.xyz = r3.xyz * 2.0 - r8.xyz;
    r5.y = saturate(dot(r7.zxy, r3.zxy));
    ps = log2(r5.y);
    r2.xyz = r6.yyy * r2.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r2.xyz * r6.xxx;
    r5.y = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xwz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
