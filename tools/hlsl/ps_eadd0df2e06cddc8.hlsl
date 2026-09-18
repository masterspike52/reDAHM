// ps_eadd0df2e06cddc8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10041100 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r13.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r11.x = ps;
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r4.w;
    r5.yz = r0.wz * 6.0;
    ps = (-4e+02) + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r10.xyz = r6.xyz * float3(-0.025, 0.875, 0.875);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r11.zw = r8.xy * r10.xx;
    r11.y = ps;
    ps = r0.w;
    r5.xw = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r7.xz = float2((r11.xy >= 0.5));
    r6.x = ps;
    ps = r0.z;
    r5.xw = r5.xw - r11.xy;
    ps = UniformVector_1.y * ps;
    r6.zw = r5.xw * r7.xz;
    r6.y = ps;
    r16 = r11 + r6.zwxy;
    r5.xw = r16.xy + r16.xy;
    r15 = tex2D(Texture2D_1, r5.xw).xzwy;
    r17.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.yzw = tex2D(Texture2D_2, r5.yz).xyw;
    r5.yzw = tex2D(Texture2D_2, r0.wz).xwy;
    r6.xyz = tex2D(Texture2D_0, r16.zw).xyz;
    ps = r4.w;
    r5.x = r1.z + 0.1;
    ps = 0.0001 * ps;
    r16.xy = r0.wz * UniformVector_7.xy;
    r3.x = saturate(ps);
    r11.xyz = r6.xyz * 2.0 - 1.0;
    r10.x = r3.w * r5.z - 1.0;
    ps = 5.0 * r5.x;
    r14.zw = r3.yz + r3.yz;
    r3.y = saturate(ps);
    ps = r5.y + r5.y;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    r5.xyz = r17.zxy * 2.0 - 1.0;
    ps = r5.w + r5.w;
    r7.x = dot(r7.xzz, float3(1.0, 1.0, 1.0));
    r7.z = ps;
    r5.w = (r7.x == 0.0) ? r15.x : r15.w;
    ps = UniformVector_4.x * r5.y;
    r7 = r7.yzxx + float4(-1.0, -1.0, -2.0, -3.0);
    r15.x = ps;
    r5.w = (r7.z == 0.0) ? r15.y : r5.w;
    r3.z = (r7.w == 0.0) ? r15.z : r5.w;
    ps = UniformVector_4.y * r5.z;
    r6.w = max(r3.z, 0.0);
    r15.y = ps;
    ps = UniformVector_4.z * r5.x;
    r5.yw = -r3.yz + 1.0;
    r15.z = ps;
    ps = r6.w;
    r3.yz = r5.yy * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 0.3;
    r3.xyz = -r3.xzy + 1.0;
    r5.y = ps;
    ps = min(r5.x, r5.y);
    r14.xy = r10.yz * r3.zy;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r7.w = ps;
    r10.yz = r14.zw * 0.5 + r7.xy;
    r5.xy = r7.ww * r10.yz + r15.xy;
    ps = 1.0 / r4.w;
    r12.xy = r5.xy - r11.xy;
    r5.x = ps;
    r7.xy = r12.zw * r5.xx + ScreenPositionScaleBias.wz;
    r3.z = tex2D(Texture2D_4, r0.xy).x;
    r4.xyz = tex2D(Texture2D_7, r16.zw).xyz;
    r5.xyz = tex2D(Texture2D_6, r16.xy).yxz;
    r17.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r16.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.w = dot(r1.zxy, r1.zxy);
    r16.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r0.xyz = r0.xyz * r2.www;
    r16.z = ps;
    r2.xyz = r17.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r6.w));
    r13.xyz = r16.xyz * r13.xyz;
    r6.w = ps;
    r13.xyz = r13.xyz * r5.yxz;
    r10.w = -r11.z + r15.z;
    ps = 2.5 * r5.w;
    r0.w = r14.x * r14.y;
    r13.w = ps;
    r7.xyz = r0.www * r7.xyz + ModShadowColor.xyz;
    r0.w = r7.w * r10.x + 1.0;
    r7.w = saturate(r13.w * r0.w - 0.5);
    r10.xyz = r13.xyz * r0.www - r4.xyz;
    r4.xyz = r10.xyz * r7.www + r4.xyz;
    r6.xy = r12.xy * r7.ww + r11.xy;
    r5.w = r10.w * r7.w - 2.0;
    r6.z = r6.z * 2.0 + r5.w;
    r6.xyz = r6.zxy * r3.xxx;
    ps = 1.0 + r6.x;
    r1.xzw = r6.www * r1.xyz;
    r6.w = ps;
    r6.xyz = (r3.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r3.xyw = (r3.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r3.wxy, r3.wxy);
    ps = rsqrt(abs(r5.w));
    r6.xyz = r4.xyz * r9.xyz;
    r5.w = ps;
    r3.xyw = r3.xyw * r5.www;
    r5.w = dot(r3.wxy, r8.zxy);
    r4.xyz = r3.xyw * r5.www;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    ps = UniformScalar_8.x * r5.y;
    r6.w = saturate(dot(r1.wxz, r4.zxy));
    r1.y = ps;
    ps = log2(r6.w);
    r5.w = saturate(dot(r3.wyx, r1.wzx));
    r5.x = ps;
    ps = abs(r0.w) * abs(r0.w);
    r5.y = r5.x * UniformScalar_7.x;
    r1.x = ps;
    ps = pow(2.0, r5.y);
    r5.x = r5.x * 15.0;
    r1.z = ps;
    r3.xy = r1.yx * r1.zx;
    r5.yz = r3.xy * r3.zy;
    r1.xyz = r2.xyz + r5.yyy;
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
