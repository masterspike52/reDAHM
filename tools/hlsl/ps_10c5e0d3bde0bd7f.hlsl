// ps_10c5e0d3bde0bd7f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041000 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
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
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_6, r0.xy);
    ps = 0.0001 * r4.w;
    r5.z = r10.w - 0.5;
    r3.w = saturate(ps);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r0.wz * 6.0;
    r7.x = ps;
    r9.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r4.w;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r6.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r9.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r13.xyw = r6.yxz * float3(0.5, -0.025, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r7.zw = r9.xy * r13.yy;
    r7.y = ps;
    ps = r0.w;
    r5.xw = r7.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r3.xz = float2((r7.xy >= 0.5));
    r6.x = ps;
    ps = r0.z;
    r5.xw = r5.xw - r7.xy;
    ps = UniformVector_1.y * ps;
    r6.zw = r5.xw * r3.xz;
    r6.y = ps;
    r7 = r7 + r6.zwxy;
    r5.xw = r7.xy + r7.xy;
    r11 = tex2D(Texture2D_1, r5.xw);
    r6.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r5.yzw = tex2D(Texture2D_3, r5.yz).xyw;
    ps = 0.1 - -r1.z;
    r5.x = ps;
    r14.xy = r5.yz * 2.0 - 1.0;
    ps = r6.y + r6.y;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r3.y = ps;
    ps = r6.z + r6.z;
    r3.x = dot(r3.xzz, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r5.y = (r3.x == 0.0) ? r11.x : r11.y;
    ps = 5.0 * r5.x;
    r16 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r12.w = saturate(ps);
    r5.x = (r16.y == 0.0) ? r11.z : r5.y;
    r12.z = (r16.x == 0.0) ? r11.w : r5.x;
    ps = 1.0 / r4.w;
    r5.xy = -r12.zw + 1.0;
    r14.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.yz = r5.yy * ModShadowGroupColor.xy;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yzw = -r3.wzy + 1.0;
    r3.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r3.xy = r3.xy * abs(r8.xy);
    r15.x = ps;
    r7.xy = r15.yz * r14.zz + ScreenPositionScaleBias.wz;
    r3.z = tex2D(Texture2D_5, r0.xy).x;
    r8.xyz = tex2D(Texture2D_7, r7.zw).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r4.xyz = tex2D(Texture2D_0, r7.zw).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r3.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r7.w = dot(r1.zxy, r1.zxy);
    r3.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r0.xyz = r0.xyz * r2.www;
    r3.w = ps;
    r6.x = r9.w * r6.x - 1.0;
    r11.xyw = r11.xyz * 2.0 - 1.0;
    r4.xyw = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r10.xyz = r3.xyw * r10.xyz;
    r7.w = ps;
    r3.xyw = r7.www * r1.xyz;
    r10.w = r11.w * UniformVector_4.z - r4.w;
    r12.xy = r16.zw + r13.xw;
    r7.w = max(r12.z, 0.0);
    ps = (-1.0) + r5.w;
    r13.x = min(r7.w, 0.3);
    r13.w = ps;
    ps = 2.5 * r5.x;
    r13.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r11.w = ps;
    r2 = r13 * r6.xwzy + float4(1.0, 0.125, 0.125, 1.0);
    r5.xy = r15.xx * r14.xy + r11.xy;
    ps = r2.y * r2.z;
    r11.xyz = r10.xyz * r2.www;
    r5.z = ps;
    r7.xyz = r5.zzz * r7.xyz + ModShadowColor.xyz;
    r1.xyz = r11.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r5.xy = r5.xy * UniformVector_4.xy - r4.xy;
    r10.xyz = r11.xyz * r2.xxx - r8.xyz;
    r5.xy = r13.xx * r12.xy + r5.xy;
    r7.w = saturate(r11.w * r2.x - 0.5);
    r5.xy = r5.xy * r7.ww + r4.xy;
    r8.xyz = r10.xyz * r7.www + r8.xyz;
    r5.z = r10.w * r7.w - 2.0;
    r5.z = r4.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r6.yyy;
    ps = 1.0 + r5.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r6.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r6.xyz = r8.xyz * r4.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r9.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r3.wxy, r4.zxy));
    ps = log2(r5.x);
    r5.w = saturate(dot(r5.wzy, r3.wyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r5.x = r5.y * 15.0;
    r5.y = ps;
    ps = abs(r2.x) * abs(r2.x);
    r5.z = r5.y * UniformScalar_10.x;
    r5.y = ps;
    ps = r5.y * r5.y;
    r3.x = r5.z * r2.w;
    r3.y = ps;
    r5.yz = r3.xy * r3.zy;
    r1.xyz = r1.xyz + r5.yyy;
    r1.xyz = r5.zzz * r1.xyz;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xyz * r7.www;
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
