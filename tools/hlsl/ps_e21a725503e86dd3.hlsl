// ps_e21a725503e86dd3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12.y = UniformScalar_2.x * UniformVector_5.y;
    ps = UniformScalar_13.x;
    r5.x = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.z = UniformScalar_1.x * UniformVector_3.x;
    r5.w = ps;
    ps = r1.z;
    r3.w = UniformVector_3.x * UniformScalar_4.x;
    ps = 0.1 + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r1.w));
    r10.z = r3.w * UniformVector_5.x;
    r1.w = ps;
    ps = 0.00022222222 * r5.x;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r16.z = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r1.www * r3.xyz;
    r16.x = saturate(ps);
    ps = r0.w + r0.w;
    r5.x = r5.w * r16.z;
    r10.x = ps;
    ps = 1.0 - r0.z;
    r10.w = UniformVector_5.y * UniformScalar_5.x;
    r11.z = ps;
    ps = UniformVector_5.x * r5.z;
    r12.zw = r8.xy * r5.xx;
    r12.x = ps;
    ps = r0.z + r0.z;
    r15 = r12.zxyw + r0.wxyz;
    r10.y = ps;
    ps = r15.x;
    r11.y = -r15.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r11.yz = r11.zy * UniformVector_1.yy;
    r11.w = ps;
    ps = UniformVector_1.x * r0.w;
    r17.xyz = UniformVector_4.xyz * 2e+01;
    r11.x = ps;
    ps = r10.z;
    r5 = r11.wzxy - 0.5;
    ps = r0.x + ps;
    r14 = float4((r11.wzxy >= 0.5));
    r3.x = ps;
    ps = r10.w;
    r5 = r5 - r11.wzxy;
    r5 = r5 * r14 + r11.wzxy;
    ps = r0.y + ps;
    r13 = r5 + r5;
    r3.y = ps;
    r5 = tex2D(Texture2D_4, r9.xy);
    r21.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r19 = tex2D(Texture2D_3, r13.zw);
    r18 = tex2D(Texture2D_6, r15.yz);
    r20 = tex2D(Texture2D_7, r3.xy);
    r11 = tex2D(Texture2D_9, r0.xy);
    r12.xyz = tex2D(Texture2D_1, r10.xy).xyz;
    r3.y = float((UniformScalar_8.x >= 1.0));
    ps = 1.0 / r4.w;
    r3.xz = r4.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r10.zw = r3.xz * r1.ww + ScreenPositionScaleBias.wz;
    r9.xyz = r11.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r3.xzw = r20.xyz * r20.www;
    r3.xzw = r18.xyz * r18.www + r3.xzw;
    r17.xyz = r17.xyz * r3.xzw;
    r1.w = dot(r17.zxy, float3(0.11, 0.3, 0.59));
    r1.w = r1.w - r17.x;
    ps = -r6.w;
    r16.w = saturate(r1.w + r17.x);
    ps = UniformScalar_9.x + ps;
    r3.x = -r16.w + 1.0;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9 = r9 * r3.xxxy;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = r9.w + r6.w;
    r3.y = ps;
    ps = -r1.w;
    r3.yz = r3.xy * abs(r7.xy);
    ps = r6.z + ps;
    r18.y = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r18.z = dot(r14.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r6.x = (r18.z == 0.0) ? r19.x : r19.y;
    ps = UniformScalar_10.x;
    r14 = r18.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r7.y = ps;
    r6.x = (r14.z == 0.0) ? r19.z : r6.x;
    r3.x = (r14.w == 0.0) ? r19.w : r6.x;
    ps = max(r7.x, r7.y);
    r6.z = max(r3.x, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r7.xw = min(r6.xz, float2(1.0, 0.3));
    r6.x = ps;
    r16.y = saturate(r7.x * r6.x);
    r6.xz = -r16.yx + 1.0;
    r21.x = r6.x * r6.w;
    r6.xy = r21.xw * r5.zw;
    ps = r12.x + r12.x;
    r3.w = float((r6.x >= 0.05));
    r12.x = ps;
    ps = r12.y + r12.y;
    r3.xw = -r3.xw + 1.0;
    r12.y = ps;
    r1.w = (UniformScalar_9.x > 0.0) ? r3.w : 1.0;
    r1.w = (UniformScalar_9.x >= 0.0) ? r1.w : r3.w;
    ps = r12.z + r12.z;
    r12.w = r1.w * r11.w;
    r12.z = ps;
    ps = r15.x + r15.x;
    r12 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    r7.y = ps;
    ps = r15.w + r15.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r12.wwww)) clip(-1.0);
    r7.z = ps;
    r15.xyz = tex2D(LightAttenuationTexture, r10.zw).xyz;
    r10 = tex2D(Texture2D_2, r10.xy);
    r16.xyz = tex2D(Texture2D_8, r7.yz).xyz;
    r19 = tex2D(Texture2D_3, r13.xy);
    r20.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r7.yz).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r3.yz).xy;
    r1.w = dot(r1.zxy, r1.zxy);
    r4.x = saturate(r4.w * 0.0001);
    ps = r6.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 15.0 * ps;
    r13.xyz = r0.xyw + r0.xyw;
    r4.w = saturate(ps);
    r14.zw = r5.xy * 2.0 - 1.0;
    r20.xyz = r20.xyz * 2.0 - 1.0;
    r5.xy = r21.yz * 2.0 - 1.0;
    ps = 0.5 * r5.x;
    r0.xyz = r20.zxy * UniformVector_3.zxy;
    r18.x = ps;
    r3.yz = -r0.yz * r16.ww + r0.yz;
    r6.w = (r18.y == 0.0) ? r19.x : r19.y;
    r6.w = (r14.y == 0.0) ? r19.z : r6.w;
    r14.x = (r14.x == 0.0) ? r19.w : r6.w;
    ps = 0.5 * r5.y;
    r14.y = r7.w * 3.3333333;
    r18.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xy = -r14.xy + 1.0;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r18.z = r4.w * r5.y;
    r4.z = ps;
    r5.x = dot(r4.ww, r5.xx) + r14.x;
    ps = r5.x;
    r18.xyz = r14.zyw + r18.xzy;
    ps = r14.x + ps;
    r4 = -r4.wxyz + 1.0;
    r13.w = ps;
    r14 = r13 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = (-1.0) - -r6.y;
    r5.x = saturate(r14.w - r6.y);
    r18.w = ps;
    r13.xy = r18.xy * r18.yz + r3.yz;
    r3.y = r18.w * r18.y + 1.0;
    ps = 0.875 * r5.z;
    r6.xyw = r5.xxx * r16.xyz;
    r18.z = ps;
    ps = 2.5 * r3.x;
    r5.xy = -r6.xy + r10.xy;
    r3.z = ps;
    r10.xy = r5.xy * r10.ww + r6.xy;
    ps = 0.875 * r5.w;
    r18.xy = r3.yz * r3.xy;
    r18.w = ps;
    ps = 1.0 - r0.x;
    r5 = r18.yxzw * r4.xxzw;
    r16.x = ps;
    ps = -r6.w;
    r16.yz = r5.zw + 0.125;
    ps = r10.z + ps;
    r6.z = float((r5.y >= 0.9));
    r3.y = ps;
    r11.xyz = r17.xyz * r6.zzz + r11.xyz;
    ps = r16.x * r16.w;
    r3.xzw = r12.zxy - r14.zxy;
    r5.y = ps;
    ps = r16.y * r16.z;
    r12 = r3.zwxy * r10.wwww;
    r6.z = ps;
    r6.xyz = r6.zzz * r7.xyz + ModShadowColor.xyz;
    ps = rsqrt(abs(r1.w));
    r10.z = r6.w + r12.w;
    r5.z = ps;
    ps = r5.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r2.xyz = r15.xyz * r2.www;
    r6.w = saturate(ps);
    ps = r0.x;
    r3.xyz = r5.zzz * r1.xyz;
    ps = r5.y + ps;
    r1.xyz = r14.xyz + r12.xyz;
    r13.z = ps;
    ps = r12.z;
    r5.yzw = -r1.xyz + r13.xyz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r11.xyz = r11.xyz - r10.xyz;
    r1.w = ps;
    r0.xyz = r11.xyz * r6.www + r10.xyz;
    r5.xyz = r5.yzw * r6.www + r1.xyw;
    r5.w = r0.w * 2.0 + r5.z;
    r5.xyz = r5.wxy * r4.yyy;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r4.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r4.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r9.xyz * r6.www;
    r5.x = ps;
    r4.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r5.xyz = r4.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r5.x = ps;
    r5.xyz = r1.xzy * r5.xxx;
    r5.y = r0.z * r5.w + r5.y;
    r5.xz = r0.xy * r5.ww + r5.xz;
    r5.xyz = r2.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
