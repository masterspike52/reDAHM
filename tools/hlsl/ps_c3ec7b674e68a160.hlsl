// ps_c3ec7b674e68a160.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 555 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000008AC 10041B00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c16); // float
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_14 : register(c18); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r6.w;
    r1.w = dot(r3.zxy, r3.zxy);
    ps = UniformScalar_8.x + ps;
    r5.x = -r0.z + 1.0;
    r5.z = ps;
    ps = UniformVector_1.y * r5.x;
    r3.w = float((UniformScalar_7.x >= 1.0));
    r5.y = ps;
    ps = r0.z;
    r5.x = r0.w * UniformVector_1.x;
    r22.z = ps;
    ps = r5.z;
    r8.yz = r0.wz * 3.0;
    ps = r3.w * ps;
    r5.zw = float2((r5.xy >= 0.5));
    r8.x = ps;
    r10.yzw = r6.www * float3(0.16, -0.8, 1.0) + r8.yzx;
    ps = 15.0 * r6.w;
    r8.xy = r5.yx - 0.5;
    r25.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r9.xy = r8.xy - r5.yx;
    r10.x = ps;
    r5.xy = r9.yx * r5.zw + r5.xy;
    r5.xy = r5.xy + r5.xy;
    r9 = tex2D(Texture2D_4, r5.xy);
    ps = (-4e+02) - -r4.w;
    r8 = r10.xxyz * float4(-0.125, 1.0, 6.0, 6.0);
    r5.y = ps;
    r12.yzw = tex2D(Texture2D_3, r8.zw).xyw;
    r20 = tex2D(Texture2D_3, r10.yz);
    ps = 0.1 - -r1.z;
    r5.x = ps;
    r11.xy = r20.yx * 2.0 - 1.0;
    ps = -r10.w;
    r25.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = r6.z + ps;
    r17.w = dot(r5.zww, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.z = (r17.w == 0.0) ? r9.x : r9.y;
    r5.w = max(r5.w, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r5.w = min(r5.w, 1.0);
    r1.w = ps;
    ps = r20.z;
    r5.w = saturate(r5.w * r1.w);
    ps = r6.w * ps;
    r5.w = -r5.w + 1.0;
    r1.w = ps;
    ps = r1.w;
    r12.x = r5.w * r6.w;
    ps = r5.w * ps;
    r17.xy = r12.xw * r20.zw;
    r17.z = ps;
    ps = UniformScalar_14.x;
    r13.yzw = r17.yww + float3(-1.0, -3.0, -2.0);
    r5.z = (r13.w == 0.0) ? r9.z : r5.z;
    r5.w = (r13.z == 0.0) ? r9.w : r5.z;
    ps = 0.05 * ps;
    r5.z = max(r5.w, 0.0);
    r6.x = ps;
    ps = r12.y + r12.y;
    r5.z = min(r5.z, 0.3);
    r15.z = ps;
    ps = r20.z;
    r25.y = r5.z * 3.3333333;
    r5.z = ps;
    ps = (-0.3) * r5.z;
    r9.xz = -r25.yx + 1.0;
    r13.x = ps;
    r10.w = r25.x * r9.x + r25.y;
    ps = r12.z + r12.z;
    r15.xy = r13.xy * r10.ww;
    r15.w = ps;
    ps = 1.0 - r5.w;
    r27.xyz = r15.yzw + float3(1.0, -1.0, -1.0);
    r27.w = ps;
    ps = 0.00022222222 * r5.y;
    r9.xyw = r27.wzy * float3(2.5, 0.5, 0.5);
    r23.z = saturate(ps);
    r11.zw = r20.xy * 2.0 + r9.wy;
    ps = 5.0 * r5.x;
    r11 = r11.xzwy + r9.ywyw;
    r23.x = saturate(ps);
    ps = r6.x;
    r5.x = r11.w * 0.01;
    ps = r23.z * ps;
    r3.w = r10.w * r11.x;
    r5.y = ps;
    ps = 0.025 * r3.w;
    r8 = r8.yyyx * r3.xyzx;
    r12.w = ps;
    ps = r5.x;
    r14.xy = r8.xy * r5.yy;
    ps = r10.w * ps;
    r14.z = r12.w + r15.x;
    r14.w = ps;
    r13 = r14.xzwy + r0.wyxz;
    ps = r13.x;
    r5.x = -r13.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r5.z = r5.x * UniformVector_1.y;
    r5.x = ps;
    ps = r15.x;
    r5.yw = r5.xz - 0.5;
    ps = r0.y + ps;
    r22.xw = float2((r5.xz >= 0.5));
    r12.x = ps;
    ps = r14.w;
    r5.yw = r5.yw - r5.xz;
    r12.yz = r5.yw * r22.xw + r5.xz;
    ps = r0.x + ps;
    r19.yzw = r12.xyz + r12.wyz;
    r19.x = ps;
    r6.x = tex2D(Texture2D_5, r13.zy).w;
    r15 = tex2D(Texture2D_5, r19.xy);
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r18.xy = r0.wz + r0.wz;
    r9.w = ps;
    ps = UniformVector_3.y;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.x = saturate(ps);
    ps = UniformVector_3.z;
    r6.y = -r20.w + 1.0;
    r5.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yz = r5.yx * UniformScalar_5.xx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xy = floor(-r5.yz);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r18.zw = r5.xy * abs(r7.xy);
    r5.x = ps;
    ps = 1.0 / UniformScalar_5.x;
    r5.xyz = r5.xxx * -SpotDirection.xyz;
    r1.w = ps;
    ps = -r6.z;
    r3.xy = -r3.xy * r1.ww;
    ps = 1.0 + ps;
    r5.y = dot(r5.zxy, r2.zxy);
    r7.x = ps;
    ps = r15.w;
    r7.yz = r3.xy + UniformScalar_6.xx;
    r5.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r7 = r7.xxyz - r3.xyxy;
    r5.y = ps;
    ps = 1.0 / r7.z;
    r12.z = saturate(r5.y * SpotAngles.y);
    r5.y = ps;
    ps = 1.0 / r7.w;
    r22.y = r8.w + r0.w;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r3.xy = saturate(r7.xy * r5.yz);
    r16.y = ps;
    ps = 1.0 / r4.w;
    r5.xy = float2((r17.xz >= 0.05));
    r5.z = ps;
    r14.xy = r25.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = 1.0 - r6.x;
    r12.xy = abs(r27.xw) * abs(r27.xw);
    r16.x = ps;
    ps = 1.0 - r6.y;
    r6.zw = r12.xz * r12.xz;
    r16.z = ps;
    ps = r6.z * r6.z;
    r0.yz = r11.yz - 2.0;
    r16.w = ps;
    r0.xw = r3.xy * r16.yy + r15.ww;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r0.yz = r0.yz + r20.xy;
    r3.x = ps;
    ps = 1.0 - r5.x;
    r11.xyz = r0.xyz + r20.zxy;
    r21.x = ps;
    ps = 1.0 - r5.y;
    r21.y = float((r11.x >= 0.5));
    r21.z = ps;
    r5.xy = (-abs(r3.xx) >= 0.0) ? 1.0 : r21.xy;
    r7.xw = (-abs(r9.ww) >= 0.0) ? r21.zy : r5.xy;
    ps = r13.x + r13.x;
    r5.y = r7.x - 0.5;
    r5.x = ps;
    ps = r13.w + r13.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r5.y = ps;
    r7.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r13 = tex2D(Texture2D_2, r18.xy);
    r20 = tex2D(Texture2D_4, r19.zw);
    r10.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r14.xyz = tex2D(LightAttenuationTexture, r14.xy).xyz;
    r24.x = tex2D(Texture2D_7, r22.yz).z;
    r24.yz = tex2D(ModShadowAccumTexture, r18.zw).xy;
    r5.xyz = tex2D(Texture2D_6, r19.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r18.xy).xyz;
    r18.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r19.xyz = r0.xyz * 2.0 - 1.0;
    r0.xyz = r5.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.w;
    r5.y = r15.w * UniformScalar_11.x;
    r5.x = saturate(ps);
    r26.xyz = r16.yyy * UniformVector_6.xzy + r5.yyy;
    ps = log2(r5.x);
    r0.xyz = r0.zxy * UniformVector_5.zxy;
    r5.z = ps;
    r18.w = saturate(r9.x * r27.x - 0.5);
    r27 = r18 * r15;
    ps = -r18.w;
    r24.xyz = r24.xyz * float3(0.5, 0.875, 0.875);
    ps = r27.w + ps;
    r5.xyw = r27.xyz * r15.www;
    r1.w = ps;
    r15.xyz = r5.xyw * UniformScalar_12.xxx + r26.xzy;
    r1.w = r25.x * r1.w + r18.w;
    r18.xyz = r5.xyw - r24.xxx;
    r23.y = r3.y * r16.x + r6.x;
    ps = 1.0 - r0.w;
    r5.yw = -r23.yx + 1.0;
    r5.x = ps;
    r0.w = (abs(r3.x) > 0.0) ? r21.y : 1.0;
    r23 = r11.yzyz * r5.xxyy;
    r3.yz = (-abs(r3.xx) >= 0.0) ? 0.0 : r23.zw;
    r9.x = (abs(r9.w) > 0.0) ? r0.w : r21.y;
    r11.xyz = r18.xyz * r9.xxx + r24.xxx;
    ps = r4.w;
    r9.y = r1.w * r9.x;
    ps = 0.0001 * ps;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r25.x = saturate(ps);
    ps = r15.w;
    r4.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r21.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r14.xyz = r14.xyz * r2.www;
    r2.z = saturate(ps);
    ps = ModShadowGroupColor.x * r5.w;
    r18.yzw = r10.xyz + r10.xyz;
    r25.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r10.xy = r0.yz * r2.zz;
    r25.z = ps;
    ps = r11.w;
    r2.xyw = -r25.xyz + 1.0;
    ps = r10.w * ps;
    r22.yz = r24.yz * r2.yw;
    r3.x = ps;
    r3.yz = (-abs(r9.ww) >= 0.0) ? r23.xy : r3.yz;
    r5.x = dot(r3.xy, r7.ww) + r10.x;
    r5.y = dot(r3.wz, r7.ww) + r10.y;
    r22.x = dot(r22.xww, float3(1.0, 1.0, 1.0));
    r0.w = (r22.x == 0.0) ? r20.x : r20.y;
    ps = (-1.0) - -r0.x;
    r3 = r22.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r5.w = ps;
    r0.w = (r3.y == 0.0) ? r20.z : r0.w;
    ps = r2.z;
    r0.x = r3.z * r3.w;
    r0.xyz = r0.xxx * r21.xyz + ModShadowColor.xyz;
    r18.x = (r3.x == 0.0) ? r20.w : r0.w;
    ps = r5.w * ps;
    r18 = r18 - 1.0;
    r5.w = ps;
    r0.w = dot(r18.xx, r9.zz) + 2.25;
    ps = rsqrt(abs(r4.w));
    r19.xyz = r19.xyz - r18.yzw;
    r2.z = ps;
    r7.w = r19.z * r13.w - 2.0;
    ps = r0.w;
    r3.xyz = r2.zzz * r1.xyz;
    r1.xyz = r19.xyz * r13.www + r18.yzw;
    ps = -r17.y + ps;
    r5.xyw = -r1.zxy + r5.wxy;
    r15.w = saturate(ps);
    r10.xy = r5.yw * r1.ww + r1.xy;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r15 = r16.wwwz * r15.xzyw;
    r0.w = ps;
    ps = 1.0 + r5.x;
    r5.z = r6.y + r15.w;
    r5.w = ps;
    ps = pow(2.0, r0.w);
    r6.xyz = r15.xzy * r12.yyy;
    r5.x = ps;
    ps = r6.x;
    r1.xyz = r14.xzy * r5.xxx;
    ps = r9.x * ps;
    r5.xyz = r5.zzz * r7.xyz;
    r2.w = ps;
    ps = r6.y;
    r7.xyz = -r5.xyz + r13.xyz;
    r7.xyz = r7.xyz * r13.www + r5.xyz;
    r5.xyz = r12.yyy * r11.xyz - r7.xyz;
    r7 = r5 * r1.wwww + r7;
    r10.z = r10.z * 2.0 + r7.w;
    ps = r9.y * ps;
    r5.xyw = r10.xyz * r2.xxx;
    r2.y = ps;
    ps = r6.z;
    r5.z = r5.w + 1.0;
    r5.xyz = (r2.xxx > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r2.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.y * ps;
    r5.x = dot(r5.wyz, r5.wyz);
    r2.z = ps;
    ps = rsqrt(abs(r5.x));
    r2.x = r2.w * r1.w;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r9.xyz = r5.yzw * r5.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r8.zxy));
    ps = log2(r5.x);
    r6.xyz = r7.xyz * r4.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r1.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
