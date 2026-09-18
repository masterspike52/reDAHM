// ps_467c4705d2f2cf1c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 333 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000534 10041100 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_6, r0.xy);
    r5.xy = r0.wz * 6.0;
    r5.z = r15.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r6.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r11.xy = r0.wz * UniformVector_1.xy;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = r4.w - 4e+02;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    r10.yz = r6.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r10.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r10.xyz = r10.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r13.zw = r8.xy * r10.zz;
    r13.y = ps;
    r5.xw = r13.xy - 0.5;
    r12.xy = float2((r13.xy >= 0.5));
    ps = r9.x;
    r5.xw = r5.xw - r13.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r5.xw * r12.xy;
    r3.x = ps;
    ps = r9.y;
    r11 = r13 + r11.zwxy;
    ps = abs(r7.y) * ps;
    r5.xw = r11.xy + r11.xy;
    r3.y = ps;
    r13.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r17 = tex2D(Texture2D_1, r5.xw);
    r3.xyw = tex2D(Texture2D_0, r11.zw).xyz;
    r6.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    r5.yzw = tex2D(Texture2D_3, r5.yz).xyw;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    ps = r4.w;
    r5.x = r1.z + 0.1;
    r7.xyw = r7.xyz * 2.0 - 1.0;
    r12.zw = r5.yz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.y = r5.w - 1.0;
    r5.w = saturate(ps);
    ps = 5.0 * r5.x;
    r11.xy = r0.wz * UniformVector_6.xy;
    r5.z = saturate(ps);
    ps = r6.x + r6.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r14.y = ps;
    ps = r6.z + r6.z;
    r5.zw = -r5.zw + 1.0;
    r14.z = ps;
    ps = UniformScalar_1.x * r5.w;
    r9.xyz = r3.xyw + r3.xyw;
    r14.w = ps;
    ps = r5.y;
    r14.x = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r5.x = (r14.x == 0.0) ? r17.x : r17.y;
    ps = r5.w * ps;
    r16 = r14.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r9.w = ps;
    ps = r16.z;
    r9 = r9 + float4(-1.0, -1.0, -1.0, 1.0);
    r5.x = (r16.y == 0.0) ? r17.z : r5.x;
    r6.x = (r16.x == 0.0) ? r17.w : r5.x;
    ps = r10.x + ps;
    r5.x = max(r6.x, 0.0);
    r12.x = ps;
    ps = r16.w;
    r13.x = min(r5.x, 0.3);
    ps = r10.y + ps;
    r14.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r12.y = ps;
    r12 = r14.xxww * r12;
    r5.xy = r7.xy + r12.zw;
    r5.xy = r5.xy * UniformVector_4.xy + r12.xy;
    ps = 1.0 / r4.w;
    r10.xy = r5.xy - r9.xy;
    r5.x = ps;
    r5.xy = r10.zw * r5.xx + ScreenPositionScaleBias.wz;
    r12.xyz = tex2D(Texture2D_5, r11.zw).xyz;
    r13.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.y = dot(r1.zxy, r1.zxy);
    r16.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r16.y = ps;
    r7.xyz = r0.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r6.y = r6.w * r6.y - 1.0;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.xyz = r17.xyz * r2.www;
    r16.z = ps;
    ps = rsqrt(abs(r5.y));
    r15.xyz = r16.xyz * r15.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r3.xyz = r5.yyy * r1.xyz;
    r5.y = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r15.xyz * r13.xyz;
    r5.x = ps;
    ps = log2(r5.y);
    r13.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r5.y = dot(r13.zxy, r2.zxy);
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.zw = r5.zz * ModShadowGroupColor.xy;
    r5.x = ps;
    r1.w = r7.w * UniformVector_4.z - r9.z;
    ps = pow(2.0, r5.x);
    r6.xzw = -r6.xwz + 1.0;
    r5.x = ps;
    ps = 2.5 * r6.x;
    r0.xyz = r0.xzy * r5.xxx;
    r13.w = ps;
    r2.yzw = r14.xyz * r6.ywz + float3(1.0, 0.125, 0.125);
    ps = abs(r2.y) * abs(r2.y);
    r13.xyz = r1.xyz * r9.www;
    r2.x = ps;
    r6.w = saturate(r13.w * r2.y - 0.5);
    r1.xyz = r13.xyz * r2.yyy - r12.xyz;
    r0.w = r1.w * r6.w - 2.0;
    r1.xyz = r1.xyz * r6.www + r12.xyz;
    ps = -SpotAngles.x - -r5.y;
    r2.yz = r2.xz * r2.xw;
    r5.x = ps;
    r6.xyz = r2.zzz * r11.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r5.x;
    r1.xyz = r1.xyz * r4.xyz;
    r2.x = saturate(ps);
    r4.z = r3.w * 2.0 + r0.w;
    r4.xy = r10.xy * r6.ww + r9.xy;
    r4.xyw = r4.xyz * r5.www;
    ps = r2.x * r2.x;
    r4.z = r4.w + 1.0;
    r5.y = ps;
    r4.xyz = (r5.www > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r5.www >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.y * r2.y;
    r5.x = dot(r4.zxy, r4.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r2.xyz = r5.zzz * r7.xyz;
    r5.x = ps;
    r4.xyz = r4.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r5.xzw = r4.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r5.wxz));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.w = saturate(dot(r4.zyx, r3.zyx));
    r5.x = ps;
    r5.xzw = r2.xyz * r5.xxx;
    r5.xz = r1.xy * r6.ww + r5.xz;
    r5.w = r1.z * r6.w + r5.w;
    r5.xzw = r0.xzy * r5.xzw;
    r5.xzw = r5.xzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xwz * r5.yyy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
