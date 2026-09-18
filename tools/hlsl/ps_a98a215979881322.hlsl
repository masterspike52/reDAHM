// ps_a98a215979881322.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 330 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000528 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r14 = tex2D(Texture2D_6, r0.xy);
    r5.xy = r0.wz * 6.0;
    r5.z = r14.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.xyz = tex2D(Texture2D_2, r5.xy).xwy;
    ps = r0.w;
    r9.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r11.xy = r0.wz * UniformVector_1.xy;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r4.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r10.yz = r5.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r10.x = saturate(r6.z * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r8.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r10.xyz = r10.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r12.zw = r8.xy * r10.zz;
    r12.y = ps;
    r6.zw = r12.xy - 0.5;
    r13.xy = float2((r12.xy >= 0.5));
    ps = r6.x;
    r6.zw = r6.zw - r12.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r6.zw * r13.xy;
    r6.z = ps;
    ps = r6.y;
    r12 = r12.zwxy + r11;
    ps = abs(r7.y) * ps;
    r6.xy = r12.zw + r12.zw;
    r6.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r16 = tex2D(Texture2D_1, r6.xy);
    r3.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r6.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    r9.xyz = tex2D(Texture2D_3, r9.xy).xyw;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    ps = r4.w;
    r5.x = r1.z + 0.1;
    r11.xyw = r11.xyz * 2.0 - 1.0;
    r13.zw = r9.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.w = r9.z - 1.0;
    r7.w = saturate(ps);
    ps = 5.0 * r5.x;
    r0.zw = r0.wz * UniformVector_6.xy;
    r7.x = saturate(ps);
    ps = r6.x + r6.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = r6.z + r6.z;
    r5.zw = -r7.xw + 1.0;
    r15.z = ps;
    ps = UniformScalar_1.x * r5.w;
    r9.xyz = r3.xyw + r3.xyw;
    r7.w = ps;
    ps = r6.w;
    r15.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r6.w = (r15.x == 0.0) ? r16.x : r16.y;
    ps = r5.w * ps;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r9.w = ps;
    ps = r15.z;
    r9 = r9 + float4(-1.0, -1.0, -1.0, 1.0);
    r6.w = (r15.y == 0.0) ? r16.z : r6.w;
    r6.x = (r15.x == 0.0) ? r16.w : r6.w;
    ps = r10.x + ps;
    r6.w = max(r6.x, 0.0);
    r13.x = ps;
    ps = r15.w;
    r7.x = min(r6.w, 0.3);
    ps = r10.y + ps;
    r7.xyz = r7.xyz * float3(3.3333333, 0.875, 0.875);
    r13.y = ps;
    r13 = r7.xxww * r13;
    r0.xy = r11.xy + r13.zw;
    r0.xy = r0.xy * UniformVector_4.xy + r13.xy;
    ps = 1.0 / r4.w;
    r10.xy = r0.xy - r9.xy;
    r6.w = ps;
    r0.xy = r10.zw * r6.ww + ScreenPositionScaleBias.wz;
    r12.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r0.w = dot(r1.zxy, r1.zxy);
    r15.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r15.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.xyz = r0.xyz * r2.www;
    r15.z = ps;
    r6.y = r5.y * r6.y - 1.0;
    ps = 1.0 - r5.x;
    r14.xyz = r15.xyz * r14.xyz;
    r5.y = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r13.xyz = r14.xyz * r13.xyz;
    r5.x = ps;
    ps = log2(r5.y);
    r14.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r5.y = dot(r14.zxy, r2.zxy);
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.zw = r5.zz * ModShadowGroupColor.xy;
    r5.x = ps;
    r13.w = r11.w * UniformVector_4.z - r9.z;
    ps = rsqrt(abs(r0.w));
    r14.xyz = r13.xyz * r9.www;
    r0.w = ps;
    r2.xyz = r14.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = pow(2.0, r5.x);
    r6.xzw = -r6.xwz + 1.0;
    r5.x = ps;
    ps = 2.5 * r6.x;
    r3.xyz = r0.www * r1.xyz;
    r14.w = ps;
    r7.yzw = r7.xyz * r6.ywz + float3(1.0, 0.125, 0.125);
    ps = abs(r7.y) * abs(r7.y);
    r0.xyz = r0.xzy * r5.xxx;
    r7.x = ps;
    r6.w = saturate(r14.w * r7.y - 0.5);
    r13.xyz = r14.xyz * r7.yyy - r12.xyz;
    r0.w = r13.w * r6.w - 2.0;
    r1.xyz = r13.xyz * r6.www + r12.xyz;
    ps = -SpotAngles.x - -r5.y;
    r7.yz = r7.xz * r7.xw;
    r5.x = ps;
    r6.xyz = r7.zzz * r11.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r5.x;
    r1.xyz = r1.xyz * r4.xyz;
    r7.x = saturate(ps);
    r4.z = r3.w * 2.0 + r0.w;
    r4.xy = r10.xy * r6.ww + r9.xy;
    r4.xyw = r4.xyz * r5.www;
    ps = r7.x * r7.x;
    r4.z = r4.w + 1.0;
    r5.y = ps;
    r4.xyz = (r5.www > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r5.www >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r7.y * r7.y;
    r5.x = dot(r4.zxy, r4.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r2.xyz = r5.zzz * r2.xyz;
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
