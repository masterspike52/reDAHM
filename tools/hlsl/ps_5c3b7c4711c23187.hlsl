// ps_5c3b7c4711c23187.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
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
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_7, r0.xy);
    ps = (-4e+02) - -r4.w;
    r5.x = ps;
    ps = r1.z;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r11.w - 0.5;
    r6.y = ps;
    ps = 0.00022222222 * r5.x;
    r9.xyz = r6.yyy * r3.xyz;
    r3.x = saturate(ps);
    ps = 5.0 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r3.y = saturate(ps);
    ps = (-0.025) * r3.x;
    r19.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r14.zw = r9.xy * r5.xx + r5.zw;
    r8.xyw = tex2D(Texture2D_0, r14.zw).xyz;
    r3.zw = r0.wz * UniformVector_7.xy;
    ps = r0.w;
    r6.yz = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r10.y = -r0.z + 1.0;
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.z = dot(r2.zxy, r2.zxy);
    r10.z = ps;
    ps = rsqrt(abs(r5.z));
    r13.xyz = r8.xyw + r8.xyw;
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r12.xyz = r5.yyy * -SpotDirection.xyz;
    r5.w = ps;
    ps = 1.0 / r4.w;
    r5.y = dot(r12.zxy, r2.zxy);
    r6.x = ps;
    r2.xy = r14.xy * r6.xx + ScreenPositionScaleBias.wz;
    r10.x = -r14.w * r5.w + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.yzw = r10.yxz * UniformVector_2.yyx;
    r5.w = ps;
    ps = r15.w;
    r10.xy = r5.xw * abs(r7.xy);
    ps = r14.z * ps;
    r7.xyz = r15.zxy - 0.5;
    r13.w = ps;
    r20.z = float((r13.w >= 0.5));
    r8.xyz = float3((r15.xzy >= 0.5));
    r7.xyz = r7.xzy - r15.zyx;
    ps = -SpotAngles.x - -r5.y;
    r12 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.x = ps;
    r7.yzw = r7.xzy * r8.yxz + r15.zxy;
    ps = SpotAngles.y * r5.x;
    r20.x = r12.w - r13.w;
    r20.y = saturate(ps);
    r6.xw = r20.xy * r20.zy;
    r7.x = r13.w + r6.x;
    r13 = r7.zwxy + r7.zwxy;
    r7.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r14.xyz = tex2D(Texture2D_6, r14.zw).xyz;
    r2 = tex2D(Texture2D_1, r13.xy);
    r18 = tex2D(Texture2D_1, r13.zw);
    r15.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r13 = tex2D(Texture2D_5, r0.xy);
    r22.xyz = tex2D(Texture2D_8, r3.zw).xyz;
    r23 = tex2D(Texture2D_4, r0.xy);
    r5.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r6.yz).xyw;
    r0.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r21.xyz = UniformVector_5.xzy * 2e+01;
    r0.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r24.xyz = UniformVector_6.xzy * 2e+01;
    r1.w = ps;
    ps = r4.w;
    r6.y = float((UniformScalar_8.x >= 1.0));
    ps = 0.0001 * ps;
    r6.z = dot(r1.zxy, r1.zxy);
    r3.w = saturate(ps);
    ps = r0.x + r0.x;
    r3.z = float((UniformScalar_8.x > 1.0));
    r16.z = ps;
    r15.zw = r10.xy * 2.0 - 1.0;
    ps = 1.0 - r5.z;
    r17.xyz = r5.xyw + r5.xyw;
    r5.x = saturate(ps);
    ps = r23.x * r23.w;
    r5.yw = r11.yz * UniformScalar_9.xx;
    r16.x = ps;
    r22.xyz = (-abs(r3.zzz) >= 0.0) ? r22.xyz : 1.0;
    ps = rsqrt(abs(r6.z));
    r13.xyz = r13.xzy * r13.www;
    r5.z = ps;
    ps = r23.z * r23.w;
    r4.xyz = r5.zzz * r1.xyz;
    r16.y = ps;
    ps = r23.y * r23.w;
    r13.xyz = r24.xyz * r13.xyz;
    r16.w = ps;
    r6.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r22.yxz;
    ps = log2(r5.x);
    r21.xyz = r21.xyz * r16.xyw;
    r5.x = ps;
    ps = r0.z + r0.z;
    r15 = r15 * float4(0.875, 0.875, 0.5, 0.5);
    r16.w = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r13.yxz : r21.yxz;
    r21.xyz = (abs(r1.www) > 0.0) ? r21.xzy : r13.xzy;
    r10.xyz = (abs(r0.www) > 0.0) ? r21.xyz : r13.xzy;
    r1.xyz = (-abs(r0.www) >= 0.0) ? r13.yxz : r1.xyz;
    ps = r10.w;
    r13.w = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    ps = r0.y * ps;
    r0.x = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    ps = (-1.0) - -r5.z;
    r0.x = r0.x - r10.x;
    r13.x = ps;
    ps = r5.y;
    r3.z = saturate(r0.x + r10.x);
    ps = r6.x * ps;
    r1.xyw = -r3.yzw + 1.0;
    r3.y = ps;
    r0.xy = -r1.xx * ModShadowGroupColor.xy + 1.0;
    ps = r5.w;
    r16.xy = r15.xy * r0.xy;
    ps = r6.z * ps;
    r0.y = dot(r8.xzz, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r0.x = r8.y * 2.0 + r20.z;
    r5.w = (r0.x == 0.0) ? r18.x : r18.y;
    r5.y = (r0.y == 0.0) ? r2.x : r2.y;
    ps = UniformScalar_9.x * r6.y;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r1.z = ps;
    ps = r1.z;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.y = (r0.z == 0.0) ? r2.z : r5.y;
    r5.w = (r0.y == 0.0) ? r18.z : r5.w;
    ps = r11.x * ps;
    r1.z = r16.x * r16.y;
    r3.x = ps;
    r2.xyz = r1.zzz * r19.xyz + ModShadowColor.xyz;
    r17.w = (r0.x == 0.0) ? r18.w : r5.w;
    r5.w = (r0.w == 0.0) ? r2.w : r5.y;
    ps = 1.0 - r5.w;
    r5.y = max(r5.w, 0.0);
    r1.x = ps;
    ps = 2.5 * r1.x;
    r5.y = min(r5.y, 0.3);
    r1.z = ps;
    ps = 3.3333333 * r5.y;
    r0 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r15.y = ps;
    ps = r0.w;
    r3.xyz = r3.xyz + UniformScalar_10.xxx;
    ps = r17.w + ps;
    r0.xyz = r0.zxy * UniformVector_4.zxy;
    r0.w = ps;
    r5.yw = -r0.yz * r13.ww + r0.yz;
    ps = 1.0 - r0.x;
    r3.xyz = r3.xyz * r1.yyy;
    r15.x = ps;
    ps = r0.w;
    r13.yz = r16.zw + r15.zw;
    ps = -r5.z + ps;
    r13 = r15.xyyy * r13.wxyz;
    r5.z = saturate(ps);
    ps = r0.x;
    r8.xyz = r5.zzz * r14.xyz;
    ps = r13.x + ps;
    r1.y = r13.y + 1.0;
    r0.z = ps;
    ps = r1.y * r1.x;
    r0.xy = r5.yw + r13.zw;
    r5.z = ps;
    ps = r1.z * r1.y;
    r0.xyz = -r12.xyz + r0.xyz;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r5.w = float((r5.z > 0.9));
    r5.z = saturate(ps);
    r0.xy = r0.xy * r5.zz + r12.xy;
    r10.xyz = r5.www * r10.xyz - r8.xyz;
    r5.y = r0.z * r5.z - 2.0;
    r0.z = r8.w * 2.0 + r5.y;
    r10.xyz = r6.yxz * r11.xyz + r10.xyz;
    r8.xyz = r10.xyz * r5.zzz + r8.xyz;
    r0.xyw = r0.xyz * r1.www;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r0.xyz = (r1.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r1.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r3.xyz * r5.zzz;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r0.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r9.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r3.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r4.zxy, r5.wyz));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r8.xyz * r0.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.y = saturate(dot(r3.zyx, r4.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.yy + r5.yz;
    r5.w = r0.z * r6.y + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r2.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
