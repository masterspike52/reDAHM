// ps_e88e57b673d73890.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r10.xy = r0.xy * UniformVector_3.xy;
    r13.x = ps;
    r11 = tex2D(Texture2D_8, r10.xy);
    ps = (-0.5) + r11.w;
    r5.z = -r0.z + 1.0;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r20.yzw = tex2D(Texture2D_3, r10.xy).xyz;
    ps = r0.w;
    r6.zw = r0.wz * 6.0;
    ps = UniformVector_1.x * ps;
    r16.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = r0.z;
    r5.y = dot(r3.zxy, r3.zxy);
    ps = UniformVector_1.y * ps;
    r8.x = r4.w - 4e+02;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.y = r1.z + 0.1;
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r17.zw = saturate(r8.yx * float2(5.0, 0.00022222222));
    r5.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r9.xyz = r5.yyy * r3.xyz;
    r5.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.y = r17.w * (-0.025);
    r16.x = ps;
    r12.zw = r9.xy * r5.yy + r6.xy;
    r5.y = -r12.w * r16.x + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r5.zyw * UniformVector_2.yyx;
    r5.y = ps;
    ps = r13.w;
    r6.xy = r5.xy * abs(r7.xy);
    ps = r12.z * ps;
    r5.xyz = r13.zxy - 0.5;
    r20.x = ps;
    r21.x = float((r20.x >= 0.5));
    r21.yzw = float3((r13.xzy >= 0.5));
    r3.yzw = r5.xzy - r13.zyx;
    r8 = r20.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r3.x = r8.x - r20.x;
    r5.x = r3.x * r21.x + r20.x;
    r5.yzw = r3.ywz * r21.zyw + r13.zxy;
    r3 = r5.zwxy + r5.zwxy;
    r5 = tex2D(Texture2D_1, r3.xy).zwyx;
    r19 = tex2D(Texture2D_1, r3.zw);
    r17.y = tex2D(Texture2D_4, r10.xy).x;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r3.xyz = tex2D(Texture2D_2, r6.zw).xyw;
    r7.xyw = tex2D(Texture2D_0, r12.zw).xyz;
    r15.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r8.x = UniformScalar_4.x * UniformScalar_3.x;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r12.xy = r0.wz * UniformVector_5.xy;
    r3.w = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r14.zw = r4.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r6.zw = r3.xy * 2.0 - 1.0;
    r1.w = (-abs(r1.w) >= 0.0) ? 1.0 : (-1.0);
    r17.x = (-abs(r3.w) >= 0.0) ? (-1.0) : r1.w;
    r10 = r6.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    ps = r4.w;
    r6.xw = -r17.zy + 1.0;
    ps = 0.0001 * ps;
    r13.xy = r6.xx * ModShadowGroupColor.xy;
    r13.z = saturate(ps);
    ps = r15.x + r15.x;
    r3.xyw = -r13.xyz + 1.0;
    r13.z = ps;
    ps = r15.y + r15.y;
    r13.xy = r10.xw * r3.xy;
    r13.w = ps;
    r18 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    ps = r7.x + r7.x;
    r13.y = dot(r21.yww, float3(1.0, 1.0, 1.0));
    r15.x = ps;
    r13.x = r21.z * 2.0 + r21.x;
    r6.y = (r13.x == 0.0) ? r19.x : r19.y;
    r6.z = (r13.y == 0.0) ? r5.w : r5.z;
    ps = r7.y + r7.y;
    r8.yzw = r8.zyw + r20.ywz;
    r15.y = ps;
    ps = r3.z;
    r8.yzw = r8.ywz + float3(-1.0, -1.0, 0.0);
    ps = r15.z * ps;
    r13 = r13.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.w = ps;
    r5.x = (r13.z == 0.0) ? r5.x : r6.z;
    r6.y = (r13.y == 0.0) ? r19.z : r6.y;
    r15.w = (r13.x == 0.0) ? r19.w : r6.y;
    r5.x = (r13.w == 0.0) ? r5.y : r5.x;
    ps = (-1.0) - -r5.w;
    r8 = r8 * r17.xxyy;
    r10.x = ps;
    ps = floor(r8.x);
    r5.y = max(r5.x, 0.0);
    r6.z = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.y = min(r5.y, 0.3);
    r10.w = ps;
    ps = 3.3333333 * r5.y;
    r10.yz = r18.zw + r10.yz;
    r6.y = ps;
    ps = r7.w + r7.w;
    r10 = r6.yyzy * r10.yzwx;
    r15.z = ps;
    ps = r10.z;
    r13 = r15 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r0.x + ps;
    r6.z = r10.y + r8.z;
    r5.y = ps;
    r6.y = r8.y * r17.y + r10.x;
    ps = 1.0 / r4.w;
    r14.xy = -r13.xy + r6.yz;
    r5.z = ps;
    r4.xy = r14.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = r18.x * r18.y;
    r5.z = r0.y + UniformScalar_8.x;
    r6.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.xyz = tex2D(Texture2D_6, r12.zw).xyz;
    r0.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r12 = tex2D(Texture2D_5, r5.yz);
    ps = UniformVector_4.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r6.z = float((UniformScalar_11.x >= 1.0));
    r19.x = ps;
    ps = UniformVector_4.y;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r0.w = float((UniformScalar_11.x > 1.0));
    r19.y = ps;
    ps = UniformVector_4.z;
    r5.z = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r18.xyz = r12.xyz * r12.www;
    r19.z = ps;
    r12.xyz = (-abs(r0.www) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r5.y));
    r0.xyz = r11.xyz * UniformScalar_12.xxx;
    r5.y = ps;
    ps = 1.0 - r5.z;
    r2.xyz = r5.yyy * r1.xyz;
    r5.y = saturate(ps);
    r12.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r5.y);
    r1.xyz = r19.xyz * r18.xyz;
    r5.y = ps;
    r10.xyz = r1.xyz * r17.yyy;
    r1.xyz = r0.xyz * r12.xyz + UniformScalar_13.xxx;
    r0.xyz = r6.yyy * r16.yzw + ModShadowColor.xyz;
    ps = 1.0 - r5.x;
    r5.z = r13.w + r15.w;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r5.x = saturate(r5.z - r5.w);
    r6.z = ps;
    ps = -r13.z;
    r8.xyz = r5.xxx * r4.xyz;
    ps = r8.w + ps;
    r6.y = r10.w + 1.0;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r5.zw = r6.yz * r6.xy;
    r10.w = ps;
    ps = (-0.5) + r5.w;
    r5.x = float((r5.z > 0.9));
    r5.z = saturate(ps);
    r4.xy = r14.xy * r5.zz + r13.xy;
    r10.xyz = r10.xyz * r5.xxx - r8.xyz;
    r10.xyz = r12.xyz * r11.xyz + r10.xyz;
    r8.xyz = r10.xyz * r5.zzz + r8.xyz;
    r5.x = r10.w * r5.z - 2.0;
    r4.z = r7.w * 2.0 + r5.x;
    r6.xyz = r4.zxy * r3.www;
    ps = 1.0 + r6.x;
    r1.xyz = r1.xyz * r6.www;
    r6.w = ps;
    r6.xyz = (r3.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r5.zzz;
    r5.x = ps;
    r4.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r9.zxy);
    r5.xzw = r4.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r9.xyz;
    r5.x = saturate(dot(r2.zxy, r5.wxz));
    ps = log2(r5.x);
    r6.yzw = r8.xyz * r7.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r6.x = saturate(dot(r4.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
