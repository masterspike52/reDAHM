// ps_9eedfd2654f44c73.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r10.w;
    r12.y = UniformScalar_2.x * UniformVector_6.y;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r11.x = ps;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = UniformVector_6.y;
    r6.xy = r0.wz * 6.0;
    ps = UniformScalar_5.x * ps;
    r11.z = -r0.z + 1.0;
    r12.w = ps;
    ps = r4.x;
    r6.zw = r0.wz * UniformVector_7.xy;
    ps = ScreenPositionScaleBias.x * ps;
    r2.xy = r0.wz * UniformVector_1.xy;
    r2.z = ps;
    ps = r4.y;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = ScreenPositionScaleBias.y * ps;
    r8.x = r1.z + 0.1;
    r2.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r8.y = r4.w - 4e+02;
    r11.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = UniformScalar_1.x * UniformVector_4.x;
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = UniformVector_4.x * UniformScalar_4.x;
    r15.y = ps;
    ps = UniformVector_6.x * r5.y;
    r9.xyz = r9.xyz + r9.xyz;
    r12.x = ps;
    ps = rsqrt(abs(r5.x));
    r5.yw = saturate(r8.yx * float2(0.00022222222, 5.0));
    r5.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r8.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r3.x = r5.y * (-0.025);
    r1.w = ps;
    r2.xy = r8.xy * r3.xx + r2.xy;
    r3.xy = r2.zw * r1.ww + ScreenPositionScaleBias.wz;
    r11.y = -r2.y * r5.x + 1.0;
    ps = UniformVector_6.x * r5.z;
    r11.yzw = r11.zyw * UniformVector_2.yyx;
    r12.z = ps;
    ps = r11.w;
    r12 = r12 + r0.xyxy;
    ps = r2.x * ps;
    r13.xyz = r11.zxy - 0.5;
    r9.w = ps;
    r17.x = float((r9.w >= 0.5));
    r17.yzw = float3((r11.xzy >= 0.5));
    ps = r15.x;
    r14.yzw = r13.xzy - r11.zyx;
    ps = abs(r7.x) * ps;
    r13 = r9 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.x = ps;
    ps = r15.y;
    r14.x = r13.w - r9.w;
    r9.x = r14.x * r17.x + r9.w;
    r9.yzw = r14.ywz * r17.zyw + r11.zxy;
    ps = abs(r7.y) * ps;
    r11 = r9.zwxy + r9.zwxy;
    r5.z = ps;
    r15.xyz = tex2D(Texture2D_6, r2.xy).xyz;
    r18.xy = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r9 = tex2D(Texture2D_1, r11.xy);
    r11 = tex2D(Texture2D_1, r11.zw);
    r16 = tex2D(Texture2D_4, r12.xy);
    r19 = tex2D(Texture2D_5, r12.zw);
    r7.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r2.xyw = tex2D(Texture2D_0, r2.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    r6.xyw = tex2D(Texture2D_2, r0.wz).wxy;
    r18.zw = r12.xy * 2.0 - 1.0;
    r5.x = r12.z * r6.x;
    r0.z = dot(r1.zxy, r1.zxy);
    r12.xyz = UniformVector_5.xyz * 2e+01;
    r5.z = float((UniformScalar_8.x >= 1.0));
    r6.z = float((UniformScalar_8.x > 1.0));
    r4.xyz = (-abs(r6.zzz) >= 0.0) ? r7.xyz : 1.0;
    r7.xyz = r10.xyz * UniformScalar_9.xxx;
    r0.xyw = r19.xyz * r19.www;
    r0.xyw = r16.xyz * r16.www + r0.xyw;
    r4.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r4.xyz;
    r7.xyz = r7.xyz * r4.xyz + UniformScalar_10.xxx;
    r12.xyz = r12.xyz * r0.xyw;
    ps = r2.x + r2.x;
    r5.z = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    r16.x = ps;
    ps = r2.y + r2.y;
    r5.z = r5.z - r12.x;
    r16.y = ps;
    ps = r5.z;
    r0.y = dot(r17.yww, float3(1.0, 1.0, 1.0));
    r0.x = r17.z * 2.0 + r17.x;
    r6.z = (r0.x == 0.0) ? r11.x : r11.y;
    r5.z = (r0.y == 0.0) ? r9.x : r9.y;
    ps = r12.x + ps;
    r14.xyz = r13.xyz * UniformVector_4.xyz;
    r6.x = saturate(ps);
    r11.xy = -r14.xy * r6.xx + r14.xy;
    ps = r2.w + r2.w;
    r13 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r16.z = ps;
    r5.z = (r13.z == 0.0) ? r9.z : r5.z;
    r6.z = (r13.y == 0.0) ? r11.z : r6.z;
    r16.w = (r13.x == 0.0) ? r11.w : r6.z;
    r5.z = (r13.w == 0.0) ? r9.w : r5.z;
    ps = 1.0 - r5.w;
    r6.z = max(r5.z, 0.0);
    r0.w = ps;
    ps = 1.0 - r5.z;
    r13 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.x = ps;
    r9.yw = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.0001 * r4.w;
    r5.y = r13.w + r16.w;
    r14.w = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r0.y = saturate(r5.y - r5.x);
    r5.y = ps;
    ps = r6.y + r6.y;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r17.z = ps;
    ps = r6.w + r6.w;
    r2.xyz = r3.xyz * LightColor.xyz;
    r17.w = ps;
    ps = (-1.0) - -r5.x;
    r3.xyz = r5.yyy * r1.xyz;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r5 = r18.zxwy * float4(0.5, 0.875, 0.5, 0.875);
    r6.w = ps;
    ps = r6.z;
    r7.xyz = r7.xyz * r6.www;
    r6.z = ps;
    ps = 0.3;
    r9.xz = -r14.zw + 1.0;
    r6.w = ps;
    ps = min(r6.z, r6.w);
    r17.xy = r5.yw * r9.yw;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r1 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r9.y = ps;
    ps = r1.x * r1.y;
    r6.zw = r1.zw + r5.xz;
    r5.x = ps;
    r1.xyz = r5.xxx * r16.xyz + ModShadowColor.xyz;
    ps = 2.5 * r0.x;
    r5 = r9.yyyx * r6.zwyx;
    r0.z = ps;
    ps = r14.z;
    r6.xyz = r0.yyy * r15.xyz;
    ps = r5.w + ps;
    r0.y = r5.z + 1.0;
    r5.w = ps;
    ps = r0.y * r0.x;
    r5.xz = r11.xy + r5.xy;
    r5.y = ps;
    ps = r0.z * r0.y;
    r11.xyz = -r13.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r6.w = saturate(ps);
    r5.xy = r11.xy * r6.ww + r13.xy;
    r0.xyz = r12.xyz * r5.zzz - r6.xyz;
    r5.z = r11.z * r6.w - 2.0;
    r5.z = r2.w * 2.0 + r5.z;
    r0.xyz = r4.xyz * r10.xyz + r0.xyz;
    r4.xyz = r0.xyz * r6.www + r6.xyz;
    r5.xyz = r5.zxy * r9.zzz;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r9.zzz > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r7.xyz * r6.www;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r6.xyz = r4.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r2.xyz * r5.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
