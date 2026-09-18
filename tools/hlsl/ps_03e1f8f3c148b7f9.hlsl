// ps_03e1f8f3c148b7f9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r5.z = r0.y + UniformScalar_8.x;
    r10.z = ps;
    ps = r0.z + r0.z;
    r9.x = r0.w * UniformVector_1.x;
    r10.w = ps;
    ps = UniformScalar_16.x;
    r12.xy = r0.xy * UniformVector_2.xy;
    ps = 0.05 * ps;
    r8.x = saturate(r4.w * 0.0001);
    r5.y = ps;
    ps = r4.w;
    r15 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = (-4e+02) + ps;
    r8.z = r1.z + 0.1;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = UniformScalar_3.x * UniformVector_4.x;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r5.x * UniformScalar_4.x;
    r10.y = ps;
    ps = floor(r5.x);
    r5.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r8.yz = saturate(r8.zy * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r11.xyz = r5.www * r3.xyz;
    r8.w = ps;
    ps = -r0.z;
    r13.zw = r5.xy * r8.wz;
    ps = 1.0 + ps;
    r13.xy = r11.xy * r13.ww;
    r3.y = ps;
    ps = r10.x;
    r5.xyw = r13.zxy + r0.xwz;
    ps = abs(r7.x) * ps;
    r3.x = -r5.w + 1.0;
    r0.z = ps;
    ps = UniformVector_1.x * r5.y;
    r9.yz = r3.yx * UniformVector_1.yy;
    r9.w = ps;
    ps = r10.y;
    r3 = r9.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r22 = float4((r9.wzxy >= 0.5));
    r0.w = ps;
    ps = r5.y + r5.y;
    r3 = r3 - r9.wzxy;
    r0.x = ps;
    r3 = r3 * r22 + r9.wzxy;
    ps = r5.w + r5.w;
    r3 = r3 + r3;
    r0.y = ps;
    r10.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r9 = tex2D(Texture2D_9, r12.xy);
    r12.z = tex2D(Texture2D_6, r12.xy).x;
    r14.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r18.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    r19 = tex2D(Texture2D_7, r5.xz);
    r20 = tex2D(Texture2D_3, r3.zw);
    r21 = tex2D(Texture2D_3, r3.xy);
    r13 = tex2D(Texture2D_2, r10.zw);
    r17.yzw = tex2D(Texture2D_4, r15.zw).xyw;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r10.zw).xyz;
    r16 = tex2D(Texture2D_4, r15.xy);
    ps = r6.w;
    r5.w = dot(r2.zxy, r2.zxy);
    ps = 15.0 * ps;
    r23.z = -r6.w + UniformScalar_12.x;
    r12.w = saturate(ps);
    ps = 1.0 / r4.w;
    r23.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r15.zw = r16.xy * 2.0 - 1.0;
    r4.xyz = r0.xyz * 2.0 - 1.0;
    r3.yzw = r7.xyz * 2.0 - 1.0;
    r5.xz = r17.yz * 2.0 - 1.0;
    r0.yz = r23.xy * r5.yy + ScreenPositionScaleBias.wz;
    ps = 0.5 * r5.x;
    r5.y = float((UniformScalar_11.x >= 1.0));
    r3.x = ps;
    r5.y = r23.z * r5.y + r6.w;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r4.xyz - r3.yzw;
    r0.x = ps;
    r4.w = r4.z * r13.w - 2.0;
    r7.xyw = r4.xyz * r13.www + r3.yzw;
    ps = -r5.y;
    r3.yzw = r0.xxx * -SpotDirection.xyz;
    ps = r6.z + ps;
    r5.y = dot(r3.wyz, r2.zxy);
    r6.x = ps;
    ps = 0.5 * r5.z;
    r6.z = max(r6.x, UniformScalar_13.x);
    r3.y = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.w = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r8.y;
    r0.x = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r6.x = (r0.x == 0.0) ? r21.x : r21.y;
    r5.y = (r0.w == 0.0) ? r20.x : r20.y;
    ps = 1.0 - r5.z;
    r2 = r0.xwwx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r5.y = (r2.y == 0.0) ? r20.z : r5.y;
    r6.x = (r2.w == 0.0) ? r21.z : r6.x;
    r15.x = (r2.x == 0.0) ? r21.w : r6.x;
    r6.x = (r2.z == 0.0) ? r20.w : r5.y;
    ps = 1.0 - r8.x;
    r6.y = max(r6.x, 0.0);
    r0.x = ps;
    ps = 1.0 / UniformScalar_14.x;
    r6.yz = min(r6.yz, float2(0.3, 1.0));
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = saturate(r6.z * r5.y);
    r12.x = ps;
    ps = 3.3333333 * r6.y;
    r5.y = -r5.y + 1.0;
    r15.y = ps;
    ps = r5.y;
    r4.xyz = r19.xyz * r19.www;
    ps = r6.w * ps;
    r3.zw = -r15.xy + 1.0;
    r17.x = ps;
    ps = r12.w;
    r2.xyz = r18.xyz + r18.xyz;
    r5.y = dot(r12.ww, r3.zz) + r15.x;
    ps = r3.w * ps;
    r6.yw = r17.xw * r16.zw;
    r3.z = ps;
    ps = r5.y;
    r3.xyz = r15.zyw + r3.xzy;
    ps = r15.x + ps;
    r6.z = float((r6.y >= 0.05));
    r2.w = ps;
    ps = (-1.0) - -r6.w;
    r2 = r2 + float4(-1.0, -1.0, -1.0, 0.25);
    r3.w = ps;
    r6.y = r3.w * r3.y + 1.0;
    ps = ModShadowGroupColor.y * r5.z;
    r1.w = saturate(r2.w - r6.w);
    r12.y = ps;
    ps = 1.0 - r5.w;
    r8.xyz = UniformVector_5.xyz * 2e+01;
    r0.w = saturate(ps);
    ps = 1.0 - r6.x;
    r8.xyz = r8.xyz * r4.xyz;
    r6.x = ps;
    ps = 1.0 - r6.z;
    r5.yzw = r2.xzy * UniformVector_4.xzy;
    r6.w = ps;
    ps = (-1.0) - -r5.z;
    r2.xyz = r1.www * r14.xyz;
    r8.w = ps;
    r5.yz = r5.yw * r12.zz - r7.xy;
    r5.w = (UniformScalar_12.x > 0.0) ? r6.w : 1.0;
    r1.w = (UniformScalar_12.x >= 0.0) ? r5.w : r6.w;
    r3.xy = r3.xy * r3.yz + r5.yz;
    ps = 2.5 * r6.x;
    r5.yzw = -r2.xyz + r13.xyz;
    r6.z = ps;
    r4.xyz = r5.yzw * r13.www + r2.xyz;
    ps = r6.y * r6.x;
    r2 = -r12.wxyz + 1.0;
    r5.y = ps;
    ps = r6.z * r6.y;
    r8 = r8 * r12.zzzz;
    r5.z = ps;
    r3.w = saturate(r5.z * r2.x - 0.5);
    ps = SpotAngles.y * r5.x;
    r5.y = float((r5.y >= 0.9));
    r3.z = saturate(ps);
    r5.xyz = r8.xyz * r5.yyy + r9.xyz;
    ps = -r7.w;
    r6.xyz = r3.xyz * r3.wwz;
    ps = r8.w + ps;
    r8.xyz = r5.xyz - r4.xyz;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r5.yz = r7.xy + r6.xy;
    r8.w = ps;
    r8 = r8 * r3.wwww + r4;
    r5.w = r7.z * 2.0 + r8.w;
    r5.xyz = r5.wyz * r0.xxx;
    ps = 1.0 + r5.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    r5.xyz = (r0.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r6.www * r1.xyz;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r11.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r11.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r1.z = r1.w * r9.w;
    r10.z = ps;
    r5.xyz = r10.xzy * float3(0.875, 15.0, 0.875);
    r1.xy = r5.xz * r2.yz;
    r5.xzw = r1.zxy + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r0.xyz = tex2D(LightAttenuationTexture, r0.yz).xyz;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r9.xyz = r9.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r0.w);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r9.xyz = r9.xyz * r2.www;
    r3.xyz = r9.xyz * r3.www;
    r1.xyz = r8.xyz * r1.xyz;
    ps = pow(2.0, r5.y);
    r0.w = saturate(dot(r7.zyx, r4.zyx));
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xyw = r3.xyz * r5.yyy;
    r5.y = ps;
    r1.xy = r1.xy * r0.ww + r6.xy;
    r1.z = r1.z * r0.w + r6.w;
    ps = pow(2.0, r5.y);
    r5.x = r5.z * r5.w;
    r5.w = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * r5.www;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.zzz;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
