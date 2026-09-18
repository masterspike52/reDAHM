// ps_d0552a77820676ed.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 375 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005DC 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r2.xy = r0.xy * UniformVector_3.xy;
    r2.w = ps;
    r10 = tex2D(Texture2D_8, r2.xy);
    ps = (-0.5) + r10.w;
    r6.zw = r0.wz * 6.0;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.x = ps;
    r17.yzw = tex2D(Texture2D_3, r2.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r4.w - 4e+02;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r3.zxy, r3.zxy);
    r12.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = r1.z + 0.1;
    r6.x = ps;
    ps = 0.00022222222 * r5.x;
    r5.zw = r0.wz * UniformVector_1.xy;
    r9.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r9.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.y = r9.w * (-0.025);
    r5.x = ps;
    r14.xy = r8.xy * r5.yy + r5.zw;
    ps = 1.0 - r0.z;
    r9.y = r14.y * r5.x;
    r20.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r20.xw = -r9.yz + 1.0;
    r20.z = ps;
    r9.yzw = r20.yxz * UniformVector_2.yyx;
    ps = r9.w;
    r5.xyz = r9.zxy - 0.5;
    ps = r14.x * ps;
    r19.xyz = float3((r9.xzy >= 0.5));
    r17.x = ps;
    r19.w = float((r17.x >= 0.5));
    ps = r12.x;
    r11.xyz = r5.xzy - r9.zyx;
    ps = abs(r7.x) * ps;
    r5 = r17.wyzx + float4(-2.0, 0.0, 0.0, -0.5);
    r6.x = ps;
    ps = r12.y;
    r11.w = r5.w - r17.x;
    r3.x = r11.w * r19.w + r17.x;
    r3.yzw = r11.xzy * r19.yxz + r9.zxy;
    ps = abs(r7.y) * ps;
    r3 = r3.zwxy + r3.zwxy;
    r6.y = ps;
    r9.y = tex2D(Texture2D_4, r2.xy).x;
    r12 = tex2D(Texture2D_1, r3.xy);
    r18 = tex2D(Texture2D_1, r3.zw);
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7.yzw = tex2D(Texture2D_2, r6.zw).xyw;
    r3.xyz = tex2D(Texture2D_0, r14.xy).xyz;
    r2.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r11.w = r0.y + UniformScalar_8.x;
    r1.w = ps;
    ps = UniformScalar_4.x;
    r15.y = saturate(r4.w * 0.0001);
    ps = UniformScalar_3.x * ps;
    r11.xy = r0.wz * UniformVector_5.xy;
    r7.x = ps;
    ps = r2.x + r2.x;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r16.z = ps;
    r6.zw = r7.yz * 2.0 - 1.0;
    r1.w = (-abs(r1.w) >= 0.0) ? 1.0 : (-1.0);
    r9.x = (-abs(r2.w) >= 0.0) ? (-1.0) : r1.w;
    ps = r2.y + r2.y;
    r6 = r6.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r16.w = ps;
    ps = r3.x + r3.x;
    r15.zw = r20.ww * ModShadowGroupColor.xy;
    r15.x = ps;
    ps = r3.y + r3.y;
    r2.xyw = -r15.zwy + 1.0;
    r15.y = ps;
    ps = r7.w;
    r16.xy = r6.xw * r2.xy;
    ps = r2.z * ps;
    r7.w = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r7.z = r19.y * 2.0 + r19.w;
    r2.z = (r7.z == 0.0) ? r18.x : r18.y;
    r1.w = (r7.w == 0.0) ? r12.x : r12.y;
    ps = (-1.0) - -r5.w;
    r5.xyz = r5.yxz + r17.ywz;
    r6.x = ps;
    ps = (-1.0) + r5.x;
    r17 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r7.y = ps;
    ps = (-1.0) + r5.z;
    r16 = r7.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.z = ps;
    r1.w = (r16.z == 0.0) ? r12.z : r1.w;
    r2.z = (r16.y == 0.0) ? r18.z : r2.z;
    r15.w = (r16.x == 0.0) ? r18.w : r2.z;
    r9.z = (r16.w == 0.0) ? r12.w : r1.w;
    ps = 0.0 + r5.y;
    r1.w = max(r9.z, 0.0);
    r7.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r7 = r7 * r9.xxyy;
    r6.w = ps;
    ps = floor(r7.x);
    r5.x = min(r1.w, 0.3);
    r5.z = ps;
    ps = 3.3333333 * r5.x;
    r6.yz = r17.zw + r6.yz;
    r5.y = ps;
    ps = r3.z + r3.z;
    r6 = r5.yyyz * r6.yxzw;
    r15.z = ps;
    ps = r6.w;
    r12 = r15 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r0.x + ps;
    r5.y = r6.z + r7.z;
    r11.z = ps;
    r5.x = r7.y * r9.y + r6.x;
    ps = 1.0 / r4.w;
    r13.xy = -r12.xy + r5.xy;
    r5.x = ps;
    r5.xy = r13.zw * r5.xx + ScreenPositionScaleBias.wz;
    r14.xyz = tex2D(Texture2D_6, r14.xy).xyz;
    r16 = tex2D(Texture2D_5, r11.zw);
    r11.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).zxy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r18.xyz = UniformVector_4.xyz * 2e+01;
    r0.w = float((UniformScalar_11.x >= 1.0));
    r1.w = dot(r1.zxy, r1.zxy);
    r2.z = float((UniformScalar_11.x > 1.0));
    r4.xyz = r10.xyz * UniformScalar_12.xxx;
    r11.xyz = (-abs(r2.zzz) >= 0.0) ? r11.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r16.xyz = r16.xyz * r16.www;
    r1.w = ps;
    r16.xyz = r18.xyz * r16.xyz;
    r11.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r11.xyz;
    r4.xyz = r4.xyz * r11.xyz + UniformScalar_13.xxx;
    ps = r17.x * r17.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r0.xyz = r0.www * r0.xyz + ModShadowColor.xyz;
    r6.xw = -r9.zy + 1.0;
    ps = r12.w;
    r9.xyz = r16.xyz * r9.yyy;
    ps = r15.w + ps;
    r4.xyz = r4.xyz * r6.www;
    r0.w = ps;
    ps = 2.5 * r6.x;
    r5.w = saturate(r0.w - r5.w);
    r6.z = ps;
    ps = -r12.z;
    r7.xyz = r5.www * r14.xyz;
    ps = r7.w + ps;
    r6.y = r6.y + 1.0;
    r5.w = ps;
    ps = 1.0 + r5.w;
    r6.xy = r6.yz * r6.xy;
    r9.w = ps;
    ps = (-0.5) + r6.y;
    r5.w = float((r6.x > 0.9));
    r0.w = saturate(ps);
    r6.xy = r13.xy * r0.ww + r12.xy;
    r9.xyz = r9.xyz * r5.www - r7.xyz;
    r9.xyz = r11.xyz * r10.xyz + r9.xyz;
    r7.xyz = r9.xyz * r0.www + r7.xyz;
    r5.w = r9.w * r0.w - 2.0;
    r6.z = r3.z * 2.0 + r5.w;
    r6.xyz = r6.zxy * r2.www;
    ps = 1.0 + r6.x;
    r3.xyz = r1.www * r1.xyz;
    r6.w = ps;
    r6.xyz = (r2.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r2.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.w));
    r1.xyz = r4.xyz * r0.www;
    r5.w = ps;
    r4.xyz = r6.xyz * r5.www;
    r5.w = dot(r4.zxy, r8.zxy);
    r6.xyz = r4.xyz * r5.www;
    r6.xyz = r6.xyz * 2.0 - r8.xyz;
    ps = LightColor.x * r5.y;
    r5.w = saturate(dot(r3.zxy, r6.zxy));
    r6.x = ps;
    ps = log2(r5.w);
    r2.xyz = r7.xyz * r2.xyz;
    r5.w = ps;
    ps = LightColor.y * r5.z;
    r6.z = r5.w * 15.0;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r1.xyz = r1.xyz * r6.zzz;
    r6.z = ps;
    r5.xy = r2.xy * r5.ww + r1.xy;
    r5.z = r2.z * r5.w + r1.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
