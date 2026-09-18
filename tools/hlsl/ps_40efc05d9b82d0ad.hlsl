// ps_40efc05d9b82d0ad.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040E00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xw = r5.xw * abs(r7.xy);
    r11.y = ps;
    r9.zw = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / r4.w;
    r5.x = -r0.z + 1.0;
    r5.w = ps;
    r10.xy = r0.xy * UniformVector_3.xy;
    r11.zw = r0.xy + 0.5;
    r8.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r6.xy = r5.ww * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r6.zw = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.y));
    r7.xyz = r5.zzz * r1.xyz;
    r9.x = ps;
    r5.yzw = r9.xxx * r3.xyz;
    ps = UniformVector_2.y * r5.x;
    r1.w = dot(r8.zxy, r8.zxy);
    r11.x = ps;
    r14.xy = float2((r11.xy >= 0.5));
    ps = rsqrt(abs(r1.w));
    r6.xy = r11.yx - 0.5;
    r5.x = ps;
    ps = r6.x;
    r8.xyz = r8.xyz * r5.xxx;
    ps = -r11.y + ps;
    r5.x = dot(r8.zxy, r5.wyz);
    r6.x = ps;
    ps = r6.y;
    r4.xyz = r8.xzy * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r5.ywz;
    ps = -r11.x + ps;
    r5.x = saturate(dot(r7.zxy, r4.yxz));
    r6.y = ps;
    ps = log2(r5.x);
    r4.xy = r6.xy * r14.yx;
    r9.y = ps;
    r9 = r9.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    r4.zw = r9.zz * r3.xy;
    r6.xy = r4.zw + 0.5;
    r6.xy = r6.xy + r0.xy;
    r3 = r11.yzwx + r4.xzwy;
    r4.xy = r3.xw + r3.xw;
    r3.x = tex2D(Texture2D_3, r10.xy).x;
    r10 = tex2D(Texture2D_2, r4.xy);
    r12 = tex2D(Texture2D_1, r0.xy);
    r3.yzw = tex2D(Texture2D_1, r3.yz).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r5.z = tex2D(Texture2D_1, r6.xy).w;
    ps = r1.z;
    r0.yzw = UniformVector_1.xyz * UniformVector_1.www;
    ps = 0.1 + ps;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = saturate(ps);
    ps = 1.0 - r5.z;
    r5.y = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    ps = 1.0 - r5.y;
    r1.xyz = r4.xyz * r2.www;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r4.xyz = r3.yzw * 0.15;
    r6.w = ps;
    r13.yzw = r0.yzw * r12.xyz - r4.xyz;
    ps = r5.w;
    r3.yzw = r6.www * -SpotDirection.xyz;
    r0.y = ps;
    ps = log2(r5.x);
    r6.w = dot(r3.wyz, r2.zxy);
    r5.x = ps;
    r5.w = r13.x * r12.w + r5.z;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.y = dot(r14.yxx, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r4.xyz = r13.yzw * r12.www + r4.xyz;
    ps = pow(2.0, r5.y);
    r5.x = r6.w - SpotAngles.x;
    r5.y = ps;
    ps = 0.0;
    r1.xyz = r1.xzy * r5.yyy;
    r0.z = ps;
    ps = max(r0.y, r0.z);
    r2.xyz = r4.xyz * r11.xyz;
    r0.y = ps;
    r4.xyz = r4.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r5.z = (r3.y == 0.0) ? r10.x : r10.y;
    r0.xy = -r0.xy + 1.0;
    ps = log2(abs(r0.y));
    r3.xyz = r3.xyy + float3(1.0, -3.0, -2.0);
    r5.y = ps;
    r5.z = (r3.z == 0.0) ? r10.z : r5.z;
    ps = UniformScalar_4.x * r5.y;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r0.xy = r0.xx * ModShadowGroupColor.xy;
    r0.z = ps;
    r5.y = (r3.y == 0.0) ? r10.w : r5.z;
    ps = SpotAngles.y * r5.x;
    r4.w = r3.x - r0.z;
    r3.x = saturate(ps);
    ps = pow(2.0, r9.w);
    r0.yzw = -r0.xyz + 1.0;
    r0.x = ps;
    r3.yz = r9.xy * r0.yz + 0.125;
    ps = r3.x * r3.x;
    r5.x = saturate(dot(r8.zxy, r7.zxy));
    r5.z = ps;
    ps = r3.y * r3.z;
    r0 = r4 * r0.xxxw;
    r6.w = ps;
    r6.xyz = r6.www * r6.xyz + ModShadowColor.xyz;
    ps = 1.0 - r5.y;
    r1.w = r0.w * r5.w;
    r0.w = ps;
    r0.xy = r2.xy * r5.xx + r0.xy;
    r0.z = r2.z * r5.x + r0.z;
    r0 = r1.xzyw * r0;
    ps = r0.w;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.x = ps;
    ps = (-0.5) - -r5.x;
    r5.yzw = r0.xzy * r5.zzz;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r5.xyz = r5.ywz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
