// ps_a5cff2c018016cd8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
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
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_5, r0.xy).xwyz;
    ps = (-0.5) + r9.y;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r12.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r4.w - 4e+02;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r6.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.z * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r6.xyz = r6.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r12.zw = r8.xy * r6.xx;
    r12.y = ps;
    r5.xz = r12.xy - 0.5;
    r11.xw = float2((r12.xy >= 0.5));
    ps = r5.y;
    r5.xz = r5.xz - r12.xy;
    ps = abs(r7.x) * ps;
    r10.zw = r5.xz * r11.xw;
    r5.z = ps;
    ps = r5.w;
    r10 = r12.zwxy + r10;
    ps = abs(r7.y) * ps;
    r5.xy = r10.zw + r10.zw;
    r5.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r14 = tex2D(Texture2D_1, r5.xy);
    r7.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r3.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r5.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyw = r5.xyz * 2.0 - 1.0;
    r12.xyz = r3.xyw * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = r7.y + r7.y;
    r15.x = dot(r11.xww, float3(1.0, 1.0, 1.0));
    r15.z = ps;
    r5.z = (r15.x == 0.0) ? r14.x : r14.y;
    ps = r0.w;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = UniformVector_6.x * ps;
    r6.zw = r15.zw + r6.yz;
    r6.x = ps;
    r5.z = (r15.y == 0.0) ? r14.z : r5.z;
    r9.y = (r15.x == 0.0) ? r14.w : r5.z;
    ps = r0.z;
    r5.z = max(r9.y, 0.0);
    ps = UniformVector_6.y * ps;
    r11.x = min(r5.z, 0.3);
    r6.y = ps;
    ps = 1.0 / r4.w;
    r16.xyz = r11.yxz * float3(0.875, 3.3333333, 0.875);
    r5.z = ps;
    r6.zw = r16.yy * r6.zw - r12.xy;
    r13.xy = r5.xy * UniformVector_4.xy + r6.zw;
    r6.zw = r13.zw * r5.zz + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r11.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r14.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.z = dot(r2.zxy, r2.zxy);
    ps = r1.z;
    r15.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r0.xyz = r0.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 0.1 + ps;
    r15.xyz = r15.xyz * r9.xzw;
    r5.x = ps;
    r9.x = r8.w * r7.z - 1.0;
    ps = rsqrt(abs(r6.w));
    r5.y = saturate(-r5.z + 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r7.xyz = r6.www * r1.xyz;
    r5.z = ps;
    r1.w = r5.w * UniformVector_4.z - r12.z;
    ps = log2(r5.y);
    r1.xyz = r5.zzz * -SpotDirection.xyz;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r5.y = dot(r1.zxy, r2.zxy);
    r9.z = saturate(ps);
    ps = r4.w;
    r5.xw = -r9.yz + 1.0;
    ps = 0.0001 * ps;
    r1.yz = r5.ww * ModShadowGroupColor.xy;
    r1.x = saturate(ps);
    ps = 2.5 * r5.x;
    r9.yzw = -r1.zyx + 1.0;
    r2.w = ps;
    r4.yzw = r16.yxz * r9.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r4.y) * abs(r4.y);
    r2.xyz = r15.xyz * r14.xyz;
    r4.x = ps;
    r1.xyz = r2.xyz * r4.yyy - r11.xyz;
    r5.w = saturate(r2.w * r4.y - 0.5);
    r2.xy = r13.xy * r5.ww + r12.xy;
    r6.w = r1.w * r5.w - 2.0;
    r1.xyz = r1.xyz * r5.www + r11.xyz;
    ps = -SpotAngles.x - -r5.y;
    r4.yz = r4.xz * r4.xw;
    r5.x = ps;
    r6.xyz = r4.zzz * r6.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r5.x;
    r1.xyz = r1.xyz * r10.xyz;
    r4.x = saturate(ps);
    r2.z = r3.w * 2.0 + r6.w;
    r2.xyw = r2.xyz * r9.www;
    ps = r4.x * r4.x;
    r2.z = r2.w + 1.0;
    r5.x = ps;
    r2.xyz = (r9.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r9.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = r4.y * r4.y;
    r5.y = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.y));
    r0.xyz = r6.www * r0.xyz;
    r5.y = ps;
    r2.xyz = r2.xyz * r5.yyy;
    r5.y = dot(r2.zxy, r8.zxy);
    r4.xyz = r2.xyz * r5.yyy;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.y = saturate(dot(r7.zxy, r4.zxy));
    ps = log2(r5.y);
    r0.xyz = r0.xyz * r5.www;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r5.w = r5.y * 15.0;
    r5.y = ps;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r2.zyx, r7.zyx));
    r5.w = ps;
    ps = pow(2.0, r5.y);
    r0.xyz = r0.xyz * r5.www;
    r5.y = ps;
    r0.xy = r1.xy * r5.zz + r0.xy;
    r0.z = r1.z * r5.z + r0.z;
    r5.yzw = r0.xyz * r5.yyy;
    r5.yzw = r5.yzw * r3.xyz;
    r5.yzw = r5.yzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.ywz * r5.xxx;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
