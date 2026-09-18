// ps_8c8f3ea581533d55.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
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
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = -r0.z + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.y = r0.w * UniformVector_2.x;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r0.x;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = 0.5 + ps;
    r5.y = dot(r1.zxy, r1.zxy);
    r12.z = ps;
    r7.xyz = r6.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r12.x = r6.x * UniformVector_2.y;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r8.xyz = r5.yyy * r1.xyz;
    r5.x = ps;
    ps = r0.y;
    r6.xyw = r5.xxx * r3.xyz;
    ps = 0.5 + ps;
    r5.y = dot(r7.zxy, r7.zxy);
    r12.w = ps;
    r11.yz = float2((r12.xy >= 0.5));
    ps = rsqrt(abs(r5.y));
    r10.xy = r12.yx - 0.5;
    r5.y = ps;
    ps = r10.x;
    r9.xyz = r7.xyz * r5.yyy;
    ps = -r12.y + ps;
    r5.y = dot(r9.zxy, r6.wxy);
    r7.x = ps;
    ps = r10.y;
    r7.yzw = r9.xzy * r5.yyy;
    r7.yzw = r7.yzw * 2.0 - r6.xwy;
    ps = -r12.x + ps;
    r5.y = saturate(dot(r8.zxy, r7.zyw));
    r7.y = ps;
    ps = log2(r5.y);
    r10.xy = r7.xy * r11.zy;
    r5.y = ps;
    r7 = r5.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    r10.zw = r7.zz * r3.xy;
    ps = r0.x;
    r5.xy = r10.zw + 0.5;
    ps = UniformVector_3.x * ps;
    r5.xy = r5.xy + r0.xy;
    r3.x = ps;
    ps = r0.y;
    r12 = r12.yxzw + r10;
    ps = UniformVector_3.y * ps;
    r5.zw = r12.xy + r12.xy;
    r3.y = ps;
    r11.x = tex2D(Texture2D_3, r3.xy).x;
    r10 = tex2D(Texture2D_2, r5.zw);
    r3 = tex2D(Texture2D_1, r0.xy);
    r0.yzw = tex2D(Texture2D_1, r12.zw).xyz;
    r5.y = tex2D(Texture2D_1, r5.xy).w;
    ps = 1.0 / r4.w;
    r5.x = r1.z + 0.1;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r5.w = dot(r2.zxy, r2.zxy);
    r1.x = saturate(ps);
    ps = ScreenPositionScaleBias.x * r5.z;
    r1.yzw = UniformVector_1.xyz * UniformVector_1.www;
    r0.x = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r6.xyz = r0.yzw * 0.15;
    r0.y = ps;
    r0.xy = r0.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.yzw = r1.yzw * r3.xyz - r6.xyz;
    ps = 1.0 - r5.y;
    r5.x = max(r6.w, 0.0);
    r4.x = ps;
    r0.w = r4.x * r3.w + r5.y;
    ps = 1.0 - r5.w;
    r5.x = -r5.x + 1.0;
    r5.y = saturate(ps);
    ps = log2(r5.y);
    r11.y = dot(r11.zyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r4.xyz = r4.yzw * r3.www + r6.xyz;
    r3.xyz = r4.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r6.w = (r11.y == 0.0) ? r10.x : r10.y;
    ps = log2(abs(r5.x));
    r0.z = r5.y * LightColorAndFalloffExponent.w;
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r1.y = ps;
    ps = pow(2.0, r1.y);
    r5.xyz = r11.xyy + float3(1.0, -3.0, -2.0);
    r1.z = ps;
    r6.w = (r5.z == 0.0) ? r10.z : r6.w;
    r1.y = (r5.y == 0.0) ? r10.w : r6.w;
    ps = r5.x;
    r6.xyz = r4.xyz * r6.xyz;
    ps = -r1.z + ps;
    r5.yz = -r1.zx + 1.0;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = saturate(dot(r9.zxy, r8.zxy));
    r1.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6 = r6 * r5.xxxy;
    r1.w = ps;
    ps = pow(2.0, r0.z);
    r6.w = r6.w * r0.w;
    r1.x = ps;
    ps = pow(2.0, r7.w);
    r1.yzw = -r1.yzw + 1.0;
    r5.x = ps;
    r6.xy = r3.xy * r5.xx + r6.xy;
    r6.z = r3.z * r5.x + r6.z;
    ps = rsqrt(abs(r5.w));
    r6 = r6 * r1.xxxy;
    r5.y = ps;
    ps = (-0.5) - -r6.w;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r5.xzw = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r0.xyz = r5.yyy * -SpotDirection.xyz;
    r5.y = dot(r0.zxy, r2.zxy);
    ps = -SpotAngles.x - -r5.y;
    r6.xyz = r6.xyz * r5.xzw;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = saturate(ps);
    r5.yz = r7.xy * r1.zw + 0.125;
    r5.xw = r5.yx * r5.zx;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
