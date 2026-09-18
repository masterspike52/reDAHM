// ps_26eff7df5de26f2d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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

    r17 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r10.x = ps;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r6.zw = r0.wz * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r10.y = ps;
    ps = r4.w;
    r12.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r9.xy = r8.xy * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r1.w));
    r5.w = r17.w - 0.5;
    r1.w = ps;
    ps = 0.00022222222 * r5.y;
    r8.xyz = r1.www * r3.xyz;
    r5.y = saturate(ps);
    ps = 5.0 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.z = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r8.xy * r5.ww;
    r3.y = ps;
    r5.xw = r3.xy - 0.5;
    r13.xw = float2((r3.xy >= 0.5));
    ps = r10.x;
    r5.xw = r5.xw - r3.xy;
    ps = abs(r7.x) * ps;
    r12.zw = r5.xw * r13.xw;
    r11.x = ps;
    ps = r10.y;
    r3 = r3.zwxy + r12;
    ps = abs(r7.y) * ps;
    r5.xw = r3.zw + r3.zw;
    r11.y = ps;
    r10.xyz = tex2D(Texture2D_5, r3.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r14 = tex2D(Texture2D_1, r5.xw);
    r15.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    ps = 0.0001 * r4.w;
    r9.zw = r0.wz * 6.0;
    r5.x = saturate(ps);
    r19.xyz = tex2D(Texture2D_2, r9.zw).xyw;
    r16.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r0.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r18.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r2.xyz = r7.xyz * r2.www;
    r18.y = ps;
    r7.xyz = r0.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r0.y = r19.z * r16.z - 1.0;
    ps = UniformVector_5.z * UniformVector_5.w;
    r4.xy = r19.xy + r19.xy;
    r18.z = ps;
    r0.xzw = r11.xzy * 2.0 - 1.0;
    r11.xyz = r3.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r17.xyz = r18.xyz * r17.xyz;
    r5.w = ps;
    ps = r6.y + r6.y;
    r3.xyz = r5.www * r1.xyz;
    r4.z = ps;
    r1.w = r0.z * UniformVector_4.z - r11.z;
    ps = r6.z + r6.z;
    r1.xyz = r17.xyz * r15.xyz;
    r4.w = ps;
    r15 = r4 - 1.0;
    r5.xz = -r5.xz + 1.0;
    ps = r16.x + r16.x;
    r5.y = r5.x * UniformScalar_1.x;
    r0.z = ps;
    r5.yw = r5.yy * r15.zw + r0.xw;
    r5.yw = r5.yw * UniformVector_4.xy - r11.xy;
    ps = r16.y + r16.y;
    r0.x = dot(r13.xww, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r6.w = (r0.x == 0.0) ? r14.x : r14.y;
    r4 = r0.zwxx + float4(-1.0, -1.0, -3.0, -2.0);
    r4.xy = r15.xy * 0.5 + r4.xy;
    r6.w = (r4.w == 0.0) ? r14.z : r6.w;
    r0.w = (r4.z == 0.0) ? r14.w : r6.w;
    ps = ModShadowGroupColor.x * r5.z;
    r6.w = max(r0.w, 0.0);
    r0.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r13.x = min(r6.w, 0.3);
    r0.z = ps;
    ps = (-1.0) + r6.x;
    r0.xzw = -r0.wzx + 1.0;
    r6.w = ps;
    ps = r6.w;
    r6.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r4.yz = r6.xx * r4.xy + r5.yw;
    ps = r5.x * ps;
    r6.xyz = r6.xzy * r0.yzw;
    r6.w = ps;
    ps = 2.5 * r0.x;
    r6 = r6.xzyw + float4(1.0, 0.125, 0.125, 1.0);
    r12.w = ps;
    ps = abs(r6.x) * abs(r6.x);
    r5.w = r6.y * r6.z;
    r5.y = ps;
    r0.xyz = r5.www * r12.xyz + ModShadowColor.xyz;
    ps = r5.y * r5.y;
    r12.xyz = r1.xyz * r6.www;
    r4.x = ps;
    r4.w = saturate(r12.w * r6.x - 0.5);
    r1.xyz = r12.xyz * r6.xxx - r10.xyz;
    r5.y = r1.w * r4.w - 2.0;
    r10.xyz = r1.xyz * r4.www + r10.xyz;
    r1.xyw = r4.yzx * r4.wwx;
    r6.xy = r11.xy + r1.xy;
    r6.z = r3.w * 2.0 + r5.y;
    r6.xyz = r6.zxy * r5.xxx;
    ps = 1.0 + r6.x;
    r1.xyz = r10.xyz * r9.xyz;
    r6.w = ps;
    r6.xyz = (r5.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r5.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r6.xyz = r1.www * r7.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r4.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r6.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r2.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
