// ps_6cfef0ce54583896.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040B00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_19 : register(c10); // float
float4 UniformScalar_20 : register(c11); // float
float4 UniformScalar_21 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_7 : register(c6); // float4
float4 UniformVector_8 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_3, r0.xy);
    ps = (-0.5) + r8.w;
    r2.xy = r0.xy * UniformScalar_0.xx;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.x = UniformVector_2.z * (-1.0);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r0.wz * UniformVector_8.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r0.xyz = r9.zxy * 2.0 - 1.0;
    ps = 1.0 / r4.w;
    r2.zw = r5.xy * abs(r7.xy);
    r0.w = ps;
    r6.xyz = r6.yzx * r0.wwx;
    r5.xy = r6.xy + ScreenPositionScaleBias.wz;
    r10.xyw = tex2D(Texture2D_4, r5.zw).xyz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).zxy;
    r6.xy = tex2D(ModShadowAccumTexture, r2.zw).xy;
    r11.xyz = tex2D(Texture2D_0, r2.xy).xyw;
    ps = r4.w;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r5.w = r1.z + 0.1;
    r4.x = saturate(ps);
    ps = UniformVector_7.x * UniformVector_7.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r7.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.y = ps;
    ps = UniformVector_7.z * UniformVector_7.w;
    r6.w = float((UniformScalar_19.x >= 1.0));
    r7.z = ps;
    ps = 5.0 * r5.w;
    r2.w = dot(r3.zxy, r3.zxy);
    r5.w = saturate(ps);
    ps = r11.x + r11.x;
    r3.w = float((UniformScalar_19.x > 1.0));
    r10.z = ps;
    r4.yzw = (-abs(r3.www) >= 0.0) ? r10.xyw : 1.0;
    ps = rsqrt(abs(r2.w));
    r8.xyz = r7.xyz * r8.xyz;
    r2.w = ps;
    ps = r11.y + r11.y;
    r7.xyz = r2.www * r3.zxy;
    r10.w = ps;
    r3.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r4.yzw;
    ps = 0.875 * r6.x;
    r5.w = -r5.w + 1.0;
    r4.z = ps;
    ps = UniformVector_2.z * r0.x;
    r4.yw = r5.ww * ModShadowGroupColor.xy;
    r5.w = ps;
    r11.w = (r7.x >= 0.0) ? r5.w : r6.z;
    ps = 0.875 * r6.y;
    r6.xzw = -r4.yxw + 1.0;
    r4.w = ps;
    ps = r8.x;
    r4.xy = r11.zw - 1.0;
    ps = r3.x * ps;
    r10.xy = r4.zw * r6.xw;
    r3.x = ps;
    r4.zw = r4.yx * r6.zz + 1.0;
    ps = UniformScalar_1.x * r6.z;
    r10 = r10 + float4(0.125, 0.125, -1.0, -1.0);
    r6.y = ps;
    r4.xy = r6.yy * r10.zw + r0.yz;
    ps = r8.y;
    r5.w = r10.x * r10.y;
    r0.xyz = r5.www * r9.xyz + ModShadowColor.xyz;
    ps = r3.y * ps;
    r4.xy = r4.xy * UniformVector_2.xy;
    r3.y = ps;
    ps = r8.z;
    r4.xy = r4.xy * r6.zz;
    r4 = (r6.yzzz > 0.0) ? r4.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r4 = (r6.yzzz >= 0.0) ? r4 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r3.z * ps;
    r5.w = dot(r4.wyz, r4.wyz);
    r3.z = ps;
    ps = rsqrt(abs(r1.w));
    r6.yzw = r3.xyz * r4.xxx;
    r6.x = ps;
    r3.xyz = r6.yzw * UniformScalar_20.xxx + UniformScalar_21.xxx;
    ps = rsqrt(abs(r5.w));
    r1.xyz = r6.xxx * r1.xyz;
    r5.w = ps;
    r4.xyz = r4.yzw * r5.www;
    r4.xyz = r4.xyz * TwoSidedSign.xxx;
    r5.w = dot(r4.zxy, r7.xyz);
    r8.xyz = r4.xzy * r5.www;
    r7.xyz = r8.xyz * 2.0 - r7.yxz;
    ps = LightColor.x * r5.y;
    r5.w = saturate(dot(r1.zxy, r7.yxz));
    r6.x = ps;
    ps = log2(r5.w);
    r2.xyz = r6.yzw * r2.xyz;
    r5.w = ps;
    ps = LightColor.y * r5.z;
    r6.z = r5.w * 15.0;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r4.zxy, r1.zxy));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r1.xyz = r3.xyz * r6.zzz;
    r6.z = ps;
    r5.xy = r2.xy * r5.ww + r1.xy;
    r5.z = r2.z * r5.w + r1.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xyz * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
