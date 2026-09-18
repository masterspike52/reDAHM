// ps_404ed429163e14f8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 570 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000008E8 10041700 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
sampler2D Texture2D_8 : register(s9);
sampler2D Texture2D_9 : register(s10);
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 color2 : COLOR2; // r8
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
    float4 r8 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_8.x - r8.w;
    r7 = r1.wzwz * float4(0.5, 0.5, 3.0, 3.0);
    r13.x = ps;
    r7.xy = tex2D(Texture2D_6, r7.xy).xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.x = float((UniformScalar_7.x >= 1.0));
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = -r1.z + 1.0;
    r6.w = ps;
    r11.yz = r8.ww * float2(0.16, -0.8) + r7.zw;
    ps = UniformVector_1.y * r6.x;
    r7.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r7.z));
    r6.zw = r6.zw * abs(r9.xy);
    r11.x = ps;
    ps = UniformVector_1.x * r1.w;
    r12.z = saturate(r8.w * 15.0);
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r10 = r11.xxyz * float4(-0.125, 1.0, 6.0, 6.0);
    r7.z = ps;
    ps = (-0.5) + r6.x;
    r12.yw = float2((r6.xy >= 0.5));
    r7.w = ps;
    ps = 0.0001 * r5.w;
    r13.yz = r7.zw - r6.yx;
    r11.x = saturate(ps);
    r7.zw = r13.zy * r12.yw + r6.xy;
    r15 = r7.xywz + r7.xywz;
    r7 = tex2D(Texture2D_4, r15.zw).xwyz;
    r16.yzw = tex2D(Texture2D_3, r10.zw).xyw;
    r6.xw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r18 = tex2D(Texture2D_3, r11.yz);
    ps = UniformScalar_13.x;
    r6.y = r2.z + 0.1;
    ps = 0.05 * ps;
    r6.z = r5.w - 4e+02;
    r0.w = ps;
    ps = r18.z;
    r14.zw = r6.xw * 0.875;
    r6.x = ps;
    r9.xy = r18.yx * 2.0 - 1.0;
    ps = (-0.3) * r6.x;
    r11.zw = r16.yz + r16.yz;
    r14.x = ps;
    ps = r18.z;
    r11.y = dot(r12.wyy, float3(1.0, 1.0, 1.0));
    r6.x = (r11.y == 0.0) ? r7.x : r7.z;
    r6.w = r13.x * r12.x + r8.w;
    ps = r8.w * ps;
    r13 = r11.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r0.z = ps;
    r6.x = (r13.y == 0.0) ? r7.w : r6.x;
    ps = 5.0 * r6.y;
    r6.w = -r6.w + r8.z;
    r7.x = saturate(ps);
    ps = r6.w;
    r7.zw = r13.zw * 0.5;
    r6.y = ps;
    r9.zw = r18.xy * 2.0 + r7.zw;
    r7.y = (r13.x == 0.0) ? r7.y : r6.x;
    ps = UniformScalar_9.x;
    r6.x = max(r7.y, 0.0);
    r6.w = ps;
    ps = max(r6.y, r6.w);
    r13 = r9.xzyw + r7.wzzw;
    r6.y = ps;
    ps = 1.0 / UniformScalar_0.x;
    r6.xy = min(r6.yx, float2(1.0, 0.3));
    r6.w = ps;
    ps = 0.00022222222 * r6.z;
    r6.x = saturate(r6.x * r6.w);
    r7.z = saturate(ps);
    ps = r13.z;
    r7.w = -r6.x + 1.0;
    r6.x = ps;
    ps = 0.01 * r6.x;
    r16.x = r7.w * r8.w;
    r6.z = ps;
    ps = 3.3333333 * r6.y;
    r9.zw = r0.zw * r7.wz;
    r11.w = ps;
    ps = r7.y;
    r9.xy = r16.wx * r18.wz;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r11.yz = float2((r9.yz >= 0.05));
    r7.w = ps;
    ps = 1.0 - r7.x;
    r20.xzw = -r11.yzw + 1.0;
    r7.z = ps;
    r11.w = r12.z * r20.w + r11.w;
    ps = ModShadowGroupColor.x * r7.z;
    r6.w = r6.z * r11.w;
    r11.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r16.x = r6.w + r1.x;
    r11.z = ps;
    ps = (-1.0) - -r9.x;
    r10 = r10.yyyx * r4.xyzx;
    r14.y = ps;
    ps = r11.w;
    r6.xy = r10.xy * r9.ww;
    ps = r13.x * ps;
    r11.xyz = -r11.xyz + 1.0;
    r8.x = ps;
    ps = 0.025 * r8.x;
    r4 = r14.zwxy * r11.yzww;
    r14.w = ps;
    r6.z = r14.w + r4.z;
    r17 = r6.zwxy + r1.yxwz;
    ps = r17.z;
    r6.x = -r17.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r6.z = r6.x * UniformVector_1.y;
    r6.x = ps;
    r6.yw = r6.zx - 0.5;
    ps = r4.z;
    r0.zw = float2((r6.xz >= 0.5));
    ps = r1.y + ps;
    r6.yw = r6.yw - r6.zx;
    r14.x = ps;
    r14.yz = r6.yw * r0.wz + r6.zx;
    r16.yzw = r14.xzy + r14.wzy;
    r14.x = tex2D(Texture2D_5, r17.yx).w;
    r22 = tex2D(Texture2D_5, r16.xy);
    r6.w = dot(r3.zxy, r3.zxy);
    r6.xy = saturate(UniformVector_2.xy);
    r6.xy = r6.yx * UniformScalar_4.xx;
    ps = rsqrt(abs(r6.w));
    r7.xy = floor(-r6.xy);
    r6.x = ps;
    r6.xyz = r6.xxx * -SpotDirection.xyz;
    ps = 1.0 / UniformScalar_4.x;
    r6.x = dot(r6.zxy, r3.zxy);
    r6.y = ps;
    ps = -r8.z;
    r6.yz = -r7.xy * r6.yy;
    ps = 1.0 + ps;
    r8.zw = r6.yz + UniformScalar_5.xx;
    r8.y = ps;
    r3 = r8.yyzw - r6.yzyz;
    ps = 1.0 / r3.z;
    r6.y = r6.x - SpotAngles.x;
    r6.x = ps;
    ps = 1.0 / r3.w;
    r7.y = saturate(r6.y * SpotAngles.y);
    r6.y = ps;
    r6.yz = saturate(r3.xy * r6.xy);
    r8.yz = r13.yw - 2.0;
    r3.yz = r8.yz + r18.xy;
    ps = r22.w;
    r21.xyz = r4.xyw + float3(0.125, 0.125, 1.0);
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r7.x = abs(r21.z) * abs(r21.z);
    r23.x = ps;
    ps = r7.x * r7.x;
    r14.y = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r7.y * r7.y;
    r23.yzw = r14.xyy + float3(-0.5, -3.0, -2.0);
    r8.w = ps;
    ps = r6.x * r6.x;
    r12.xy = saturate(r23.xy * 3.3333333);
    r12.w = ps;
    r13.xyw = -r12.xyz + 1.0;
    r3.x = r6.y * r13.x + r12.x;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r18.xyz = r3.xyz + r18.zxy;
    r2.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r20.y = float((r18.x >= 0.5));
    r4.w = ps;
    r7.xy = (-abs(r4.ww) >= 0.0) ? 1.0 : r20.xy;
    r6.xy = (-abs(r2.ww) >= 0.0) ? r20.zy : r7.xy;
    ps = (-0.5) - -r6.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r19 = tex2D(Texture2D_4, r16.zw);
    r3.xyz = tex2D(Texture2D_7, r16.xy).xyz;
    r0.zw = r1.wz + r1.wz;
    ps = r1.z;
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    r17.y = ps;
    ps = r10.w;
    r3.yzw = r3.xyz + r3.xyz;
    ps = r1.w + ps;
    r7.xy = r15.xy - 1.0;
    r17.x = ps;
    ps = r13.z;
    r16.xyz = r7.wxy * float3(2.5, 0.036, 0.036);
    r15.x = saturate(r16.x * r21.z - 0.5);
    r6.x = (r14.y == 0.0) ? r19.x : r19.y;
    r6.x = (r23.w == 0.0) ? r19.z : r6.x;
    r3.x = (r23.z == 0.0) ? r19.w : r6.x;
    ps = r11.w * ps;
    r1 = r3 - 1.0;
    r8.y = ps;
    r15.yz = r1.yz * UniformVector_4.xy - r16.yz;
    r15.w = r1.w * UniformVector_4.z - 1.0;
    r6.xz = r6.zz * r13.xy + r12.xy;
    ps = 1.0 - r6.x;
    r3 = r12.xxxx * r15;
    r16.x = ps;
    ps = 1.0 - r6.z;
    r14.xy = r16.yz + r3.yz;
    r16.y = ps;
    ps = r17.z + r17.z;
    r16 = r18.yzyz * r16.xxyy;
    r6.x = ps;
    ps = r17.w + r17.w;
    r14.xy = r14.xy + r8.yx;
    r6.z = ps;
    r8.xy = (-abs(r4.ww) >= 0.0) ? 0.0 : r16.zw;
    r8.xy = (-abs(r2.ww) >= 0.0) ? r16.xy : r8.xy;
    ps = 1.0 / r5.w;
    r14.xy = r14.xy + r8.xy;
    r8.x = ps;
    r8.xy = r14.zw * r8.xx + ScreenPositionScaleBias.wz;
    r16 = tex2D(Texture2D_2, r0.zw);
    r19.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r17.xyz = tex2D(Texture2D_8, r17.xy).xyz;
    r1.yzw = tex2D(Texture2D_0, r6.xz).xyz;
    r18.xyz = tex2D(Texture2D_9, r6.xz).xyz;
    r21.w = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r5.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r0.xyz = r8.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.w;
    r0.w = r22.w * UniformScalar_10.x;
    r6.z = saturate(ps);
    ps = r22.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r23.xyz = r5.xyz * r22.xyz;
    r6.x = ps;
    r5.xyz = r6.xxx * UniformVector_5.xzy + r0.www;
    ps = log2(r6.z);
    r13.xyz = r23.xyz * r22.www;
    r6.x = ps;
    r5.xyz = r13.xyz * UniformScalar_11.xxx + r5.xzy;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.zw = r21.wx * r21.wy;
    r0.w = ps;
    r8.xyz = r6.www * r8.xyz + ModShadowColor.xyz;
    r1.x = dot(r1.xx, r13.ww) + 2.25;
    ps = r1.x;
    r5.w = -r15.x + r3.x;
    r1.x = (abs(r4.w) > 0.0) ? r20.y : 1.0;
    r18.w = (abs(r2.w) > 0.0) ? r1.x : r20.y;
    ps = -r9.x + ps;
    r12 = r12.wwwz * r5.xzyw;
    r5.x = saturate(ps);
    ps = r15.x;
    r1.x = dot(r2.zxy, r2.zxy);
    ps = r12.w + ps;
    r5.yzw = r12.xzy * r7.www;
    r13.w = ps;
    ps = rsqrt(abs(r1.x));
    r12 = r5.xxxy * r18;
    r6.w = ps;
    ps = pow(2.0, r0.w);
    r1.x = r12.w * r13.w;
    r0.w = ps;
    r15.xyz = r1.yzw + r1.yzw;
    r13.xyz = r13.xyz - r17.xyz;
    r3.xyz = r6.zzz * r19.xyz;
    r9 = r13 * r18.wwww;
    ps = r3.w;
    r17.xyz = r9.xyz + r17.xyz;
    ps = r6.y * ps;
    r18.xyz = -r12.xyz + r16.xyz;
    r15.w = ps;
    r15 = r15 + float4(-1.0, -1.0, -1.0, 1.0);
    r0.xyz = r0.xyz - r15.xyz;
    r12.xyz = r18.xyz * r16.www + r12.xyz;
    r7.xyz = r7.www * r17.xyz - r12.xyz;
    r12.w = r0.z * r16.w - 2.0;
    r0.xyz = r0.xyz * r16.www + r15.xyz;
    r7.w = r15.w - r0.z;
    r6.xy = r14.xy * r6.yy - r0.xy;
    r6.xy = r6.xy * r13.ww + r0.xy;
    r7 = r7 * r13.wwww + r12;
    r6.z = r1.w * 2.0 + r7.w;
    r6.xyz = r6.zxy * r11.xxx;
    ps = 1.0 + r6.x;
    r2.xyz = r6.www * r2.xyz;
    r6.w = ps;
    r6.xyz = (r11.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r11.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.yz = r9.ww * r5.zw;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r10.zxy);
    r0.xyz = r6.yzw * r6.xxx;
    r0.xyz = r0.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r2.zxy, r0.zxy));
    ps = log2(r6.x);
    r0.xyz = r7.xyz * r4.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.xyz = r3.xzy * r0.www;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wyz, r2.zxy));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r8.www;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
