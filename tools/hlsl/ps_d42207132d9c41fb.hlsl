// ps_d42207132d9c41fb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 348 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000570 10041000 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_9 : register(c11); // float
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
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

    r10 = tex2D(Texture2D_6, r0.xy).xwyz;
    r6.xy = r1.xy * 6.0;
    r6.z = r10.y - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r7.xyz = tex2D(Texture2D_2, r6.xy).wxy;
    ps = 0.1 - -r2.z;
    r6.x = r5.w - 4e+02;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = -r1.y + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r13.zw = r7.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r11.y = r6.w * UniformVector_2.y;
    r6.z = ps;
    ps = 0.00022222222 * r6.x;
    r9.xy = r1.xy * UniformVector_1.xy;
    r13.x = saturate(ps);
    ps = 5.0 * r6.y;
    r12.xyz = r6.zzz * r4.xyz;
    r13.y = saturate(ps);
    ps = r1.x;
    r4.xyw = r13.zxw * float3(0.5, -0.025, 0.5);
    ps = UniformVector_2.x * ps;
    r11.zw = r12.xy * r4.yy;
    r11.x = ps;
    r6.xy = r11.xy - 0.5;
    r7.yz = float2((r11.xy >= 0.5));
    ps = r0.z;
    r6.xy = r6.xy - r11.xy;
    ps = abs(r8.x) * ps;
    r9.zw = r6.xy * r7.yz;
    r1.z = ps;
    ps = r0.w;
    r6 = r11.zwxy + r9;
    ps = abs(r8.y) * ps;
    r0.zw = r6.zw + r6.zw;
    r1.w = ps;
    r8.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r11 = tex2D(Texture2D_1, r0.zw);
    r9.xyz = tex2D(Texture2D_2, r1.xy).yxw;
    r15.w = r7.x * r9.z - 1.0;
    ps = r9.y + r9.y;
    r0.zw = r0.xy * UniformScalar_0.xx;
    r9.y = ps;
    ps = r9.x + r9.x;
    r6.z = -r13.y + 1.0;
    r9.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r1.xy = r1.xy * UniformVector_7.xy;
    r7.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r9.x = dot(r7.yzz, float3(1.0, 1.0, 1.0));
    r7.y = ps;
    r7.z = (r9.x == 0.0) ? r11.x : r11.y;
    ps = 1.0 - r7.y;
    r9 = r9.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r15.z = ps;
    ps = r9.z;
    r4.yz = r5.xy * ScreenPositionScaleBias.xy;
    r7.z = (r9.y == 0.0) ? r11.z : r7.z;
    r7.z = (r9.x == 0.0) ? r11.w : r7.z;
    ps = r4.x + ps;
    r7.w = max(r7.z, 0.0);
    r15.x = ps;
    ps = r9.w;
    r8.x = min(r7.w, 0.3);
    ps = r4.w + ps;
    r9.xzw = r8.zxy * float3(0.875, 3.3333333, 0.875);
    r15.y = ps;
    r9.xy = r9.zx * r15.wz + float2(1.0, 0.125);
    ps = 1.0 / r5.w;
    r4.x = abs(r9.x) * abs(r9.x);
    r4.w = ps;
    r13.yzw = r4.xyz * r4.xww;
    r1.zw = r13.zw + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r8.xyz = tex2D(Texture2D_8, r6.xy).xyz;
    r10.y = tex2D(Texture2D_5, r0.xy).x;
    r11.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r1.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    r14.xyw = -ModShadowColor.xyz + 1.0;
    r1.x = dot(r2.zxy, r2.zxy);
    r0.w = dot(r3.zxy, r3.zxy);
    ps = r5.w;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = 0.0001 * ps;
    r5.xyz = r16.xyz * r10.xzw;
    r7.w = saturate(ps);
    r16.xyz = r1.yzw * 2.0 - 1.0;
    r10.xzw = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r6.w = saturate(-r0.w + 1.0);
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r2.xyz = r1.xxx * r2.xyz;
    r0.w = ps;
    r14.z = r16.z * UniformVector_4.z - r10.w;
    ps = log2(r6.w);
    r1.xyz = r0.www * -SpotDirection.xyz;
    r6.x = ps;
    ps = r0.y + r0.y;
    r6.y = dot(r1.zxy, r3.zxy);
    r1.z = ps;
    ps = r0.z + r0.z;
    r7.xyz = -r7.zwx + 1.0;
    r1.w = ps;
    ps = 2.5 * r7.x;
    r1.y = r9.w * r7.z;
    r1.x = ps;
    ps = UniformScalar_1.x * r7.y;
    r1.yzw = r1.yzw + float3(0.125, -1.0, -1.0);
    r6.w = ps;
    r3.xy = r6.ww * r1.zw + r16.xy;
    r3.xy = r3.xy * UniformVector_4.xy - r10.xz;
    r1.xw = r1.yx * r9.yx;
    r1.xyz = r1.xxx * r14.xyw + ModShadowColor.xyz;
    r14.xy = r9.zz * r15.xy + r3.xy;
    ps = (-1.0) + r0.x;
    r7.w = saturate(r1.w - 0.5);
    r14.w = ps;
    r0.xy = r14.xy * r7.ww + r10.xz;
    r10.xz = r14.wz * r7.yw + float2(1.0, -2.0);
    r0.z = r6.z * 2.0 + r10.z;
    r0.xyw = r0.xyz * r7.yyy;
    ps = -SpotAngles.x - -r6.y;
    r0.z = r0.w + 1.0;
    r6.z = ps;
    r0.xyz = (r7.yyy > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r7.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = SpotAngles.y * r6.z;
    r6.y = dot(r0.zxy, r0.zxy);
    r13.x = saturate(ps);
    ps = rsqrt(abs(r6.y));
    r6.zw = r13.xy * r13.xy;
    r6.y = ps;
    r0.xyz = r0.xyz * r6.yyy;
    r6.y = dot(r0.zxy, r12.zxy);
    r3.xyz = r0.xyz * r6.yyy;
    r3.xyz = r3.xyz * 2.0 - r12.xyz;
    r6.y = saturate(dot(r2.zxy, r3.zxy));
    ps = log2(r6.y);
    r0.x = saturate(dot(r0.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r2.x = ps;
    ps = pow(2.0, r2.x);
    r1.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r5.w = r6.y * r10.x;
    r2 = r5 * r11.xyzx;
    r2 = r2 * r10.xxxy;
    r3.xyz = r2.xyz * r9.xxx - r8.xyz;
    r5.xyz = r2.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r2.xyz = r5.xyz + r2.www;
    r3.xyz = r3.xyz * r7.www + r8.xyz;
    r0.yzw = r3.xyz * r0.yzw;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r6.www * r2.xyz;
    r6.x = ps;
    ps = pow(2.0, r1.w);
    r7.xyz = r2.xyz * r7.www;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r7.xyz = r7.xyz * r6.yyy;
    r6.x = ps;
    r7.xy = r0.yz * r0.xx + r7.xy;
    r7.z = r0.w * r0.x + r7.z;
    r7.xyz = r7.xyz * r6.xxx;
    r7.xyz = r7.xyz * r4.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xyz * r6.zzz;
    r6.xyz = r6.xyz * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
