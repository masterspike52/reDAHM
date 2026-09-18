// ps_0c99c533024f1f40.bin
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
sampler2D ModShadowAccumTexture : register(s8);

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

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r13.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r12.x = ps;
    r5.xyz = tex2D(Texture2D_2, r5.xy).xyw;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r4.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r9.yz = r5.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r9.x = saturate(r6.z * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r8.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r9.xyz = r9.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r12.zw = r8.xy * r9.zz;
    r12.y = ps;
    r6.zw = r12.xy - 0.5;
    r11.xw = float2((r12.xy >= 0.5));
    ps = r6.x;
    r6.zw = r6.zw - r12.xy;
    ps = abs(r7.x) * ps;
    r10.zw = r6.zw * r11.xw;
    r6.z = ps;
    ps = r6.y;
    r10 = r12.zwxy + r10;
    ps = abs(r7.y) * ps;
    r6.xy = r10.zw + r10.zw;
    r6.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r15 = tex2D(Texture2D_1, r6.xy);
    r5.xyw = tex2D(Texture2D_2, r0.wz).wxy;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r7.xy = r0.wz * UniformVector_6.xy;
    r6.xyz = r3.xwy * 2.0 - 1.0;
    r0.xyz = r12.xyz * 2.0 - 1.0;
    ps = r5.y + r5.y;
    r12.xy = r4.xy * ScreenPositionScaleBias.xy;
    r14.y = ps;
    ps = r5.w + r5.w;
    r14.x = dot(r11.xww, float3(1.0, 1.0, 1.0));
    r14.z = ps;
    r6.w = (r14.x == 0.0) ? r15.x : r15.y;
    r14 = r14.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r14.z;
    r0.xyw = r0.xyz * UniformVector_4.xyz;
    r6.w = (r14.y == 0.0) ? r15.z : r6.w;
    r9.z = (r14.x == 0.0) ? r15.w : r6.w;
    ps = r9.x + ps;
    r6.w = max(r9.z, 0.0);
    r7.z = ps;
    ps = r14.w;
    r11.x = min(r6.w, 0.3);
    ps = r9.y + ps;
    r14.xyz = r11.yxz * float3(0.875, 3.3333333, 0.875);
    r7.w = ps;
    r7.zw = r14.yy * r7.zw + r0.xy;
    ps = 1.0 / r4.w;
    r12.zw = r7.zw - r6.xz;
    r6.w = ps;
    r9.xy = r12.xy * r6.ww + ScreenPositionScaleBias.wz;
    r11.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r7.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9.y = saturate(r4.w * 0.0001);
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r15.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r15.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.y = r1.z + 0.1;
    r15.z = ps;
    r9.x = r5.z * r5.x - 1.0;
    ps = 5.0 * r5.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r9.w = saturate(ps);
    ps = 1.0 - r5.x;
    r0.xyz = r16.xyz * r2.www;
    r5.z = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r13.xyz = r15.xyz * r13.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = log2(r5.z);
    r13.xyz = r13.xyz * r7.xyz;
    r5.x = ps;
    r7.xyz = r13.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r5.yyy * -SpotDirection.xyz;
    r5.w = ps;
    ps = -r6.y;
    r5.y = dot(r1.zxy, r2.zxy);
    ps = r0.w + ps;
    r5.xz = -r9.zw + 1.0;
    r1.w = ps;
    ps = 2.5 * r5.x;
    r9.zw = r5.zz * ModShadowGroupColor.xy;
    r13.w = ps;
    ps = pow(2.0, r5.w);
    r9.yzw = -r9.wzy + 1.0;
    r5.x = ps;
    r2.xyz = r14.yxz * r9.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r2.x) * abs(r2.x);
    r0.xyz = r0.xzy * r5.xxx;
    r2.w = ps;
    r1.xyz = r13.xyz * r2.xxx - r11.xyz;
    r6.y = saturate(r13.w * r2.x - 0.5);
    r6.xz = r12.zw * r6.yy + r6.xz;
    r6.w = r1.w * r6.y - 2.0;
    r1.xyz = r1.xyz * r6.yyy + r11.xyz;
    ps = -SpotAngles.x - -r5.y;
    r2.yz = r2.wy * r2.wz;
    r5.x = ps;
    r5.yzw = r2.zzz * r10.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r5.x;
    r1.xyz = r1.xyz * r4.xyz;
    r2.x = saturate(ps);
    r6.w = r3.w * 2.0 + r6.w;
    r4.xyw = r6.xzw * r9.www;
    ps = r2.x * r2.x;
    r4.z = r4.w + 1.0;
    r6.x = ps;
    r4.xyz = (r9.www > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r9.www >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.y * r2.y;
    r5.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r5.x));
    r2.xyz = r6.zzz * r7.xyz;
    r5.x = ps;
    r4.xyz = r4.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r7.xyz = r4.xyz * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r6.yyy;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r5.x = saturate(dot(r4.zyx, r3.zyx));
    r6.y = ps;
    r6.yzw = r2.xyz * r6.yyy;
    r6.yz = r1.xy * r5.xx + r6.yz;
    r6.w = r1.z * r5.x + r6.w;
    r6.yzw = r0.xzy * r6.yzw;
    r6.yzw = r6.yzw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.ywz * r6.xxx;
    r5.xyz = r6.xzy * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
