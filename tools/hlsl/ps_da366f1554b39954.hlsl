// ps_da366f1554b39954.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10040F00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.y + 1.0;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r5.w - 4e+02;
    r1.w = ps;
    ps = r2.z;
    r3.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r7.x));
    r6.w = r9.w - 0.5;
    r7.x = ps;
    ps = 5.0 * r6.x;
    r11.xyz = r7.xxx * r4.xyz;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.y;
    r4.x = r1.x * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r11.xy * r6.ww;
    r4.y = ps;
    r6.zw = r4.xy - 0.5;
    r7.xw = float2((r4.xy >= 0.5));
    ps = r1.z;
    r6.zw = r6.zw - r4.xy;
    ps = abs(r8.x) * ps;
    r3.zw = r6.zw * r7.xw;
    r0.z = ps;
    ps = r1.w;
    r10 = r4.zwxy + r3;
    ps = abs(r8.y) * ps;
    r6.zw = r10.zw + r10.zw;
    r0.w = ps;
    r3.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r4 = tex2D(Texture2D_1, r6.zw);
    ps = 0.0001 * r5.w;
    r7.yz = r1.xy * 6.0;
    r6.w = saturate(ps);
    r12.xyz = tex2D(Texture2D_2, r7.yz).xyw;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r0.zw = r0.xy * UniformScalar_0.xx;
    ps = r1.x;
    r7.yz = r5.xy * ScreenPositionScaleBias.xy;
    r13.w = r12.z * r8.z - 1.0;
    r1.xz = r12.xy * 2.0 - 1.0;
    ps = UniformVector_7.x * ps;
    r8.zw = r8.xy + r8.xy;
    r8.x = ps;
    ps = 1.0 - r6.x;
    r8.y = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r7.x = (r8.y == 0.0) ? r4.x : r4.y;
    ps = 1.0 - r6.w;
    r12 = r8.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r6.y = ps;
    r13.xy = r1.xz * 0.5 + r12.zw;
    r6.x = (r12.y == 0.0) ? r4.z : r7.x;
    r1.w = (r12.x == 0.0) ? r4.w : r6.x;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = max(r1.w, 0.0);
    r1.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r3.x = min(r6.x, 0.3);
    r1.z = ps;
    ps = 1.0 - r1.z;
    r4.xzw = r3.zxy * float3(0.875, 3.3333333, 0.875);
    r13.z = ps;
    r4.xy = r4.zx * r13.wz + float2(1.0, 0.125);
    ps = 1.0 / r5.w;
    r7.x = abs(r4.x) * abs(r4.x);
    r7.w = ps;
    ps = r1.y;
    r7.xyw = r7.yzx * r7.wwx;
    ps = UniformVector_7.y * ps;
    r6.xw = r7.xy + ScreenPositionScaleBias.wz;
    r8.y = ps;
    r3.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r5.y = tex2D(Texture2D_5, r0.xy).x;
    r8.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r5.xzw = tex2D(Texture2D_0, r10.xy).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r6.xw).zxy;
    r0.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    r10.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r2.zxy, r2.zxy);
    r15.xyz = r12.xyz * 2.0 - 1.0;
    r12.xyz = r5.xzw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r10.xyz * r9.xyz;
    r6.x = ps;
    ps = r0.y + r0.y;
    r10.xyz = r6.xxx * r2.xyz;
    r2.y = ps;
    r2.z = r15.z * UniformVector_4.z - r12.z;
    ps = r0.z + r0.z;
    r6.xw = -r1.wx + 1.0;
    r2.w = ps;
    ps = UniformScalar_1.x * r6.y;
    r2.x = r4.w * r6.w;
    r0.w = ps;
    ps = 2.5 * r6.x;
    r1.yzw = r2.xyw + float3(0.125, -1.0, -1.0);
    r1.x = ps;
    r6.xw = r0.ww * r1.zw + r15.xy;
    r2.xy = r6.xw * UniformVector_4.xy - r12.xy;
    r6.xw = r1.xy * r4.xy;
    r1.xyz = r6.www * r14.xyz + ModShadowColor.xyz;
    r2.xy = r4.zz * r13.xy + r2.xy;
    ps = (-1.0) + r0.x;
    r6.x = saturate(r6.x - 0.5);
    r2.w = ps;
    r0.xy = r2.xy * r6.xx + r12.xy;
    r5.xz = r2.wz * r6.yx + float2(1.0, -2.0);
    r0.z = r5.w * 2.0 + r5.z;
    r0.xyz = r0.zxy * r6.yyy;
    ps = 1.0 + r0.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r0.xyz = (r6.yyy > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r6.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r6.y));
    r1.w = r7.w * r7.w;
    r6.y = ps;
    r0.xyz = r0.xyz * r6.yyy;
    r6.y = dot(r0.zxy, r11.zxy);
    r12.xyz = r0.xyz * r6.yyy;
    r11.xyz = r12.xyz * 2.0 - r11.xyz;
    r6.y = saturate(dot(r10.zxy, r11.zxy));
    ps = log2(r6.y);
    r6.w = saturate(dot(r0.zyx, r10.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r7.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r0.x = ps;
    r9.w = r0.x * r5.x;
    r0 = r9 * r8.xyzx;
    r0 = r0 * r5.xxxy;
    r4.xyz = r0.xyz * r4.xxx - r3.xyz;
    r5.xyz = r0.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r0.yzw = r5.xyz + r0.www;
    r3.xyz = r4.xyz * r6.xxx + r3.xyz;
    ps = LightColor.x * r7.y;
    r2.xyz = r3.xyz * r2.xyz;
    r0.x = ps;
    ps = LightColor.y * r7.z;
    r3.xyz = r1.www * r0.yzw;
    r0.y = ps;
    ps = pow(2.0, r7.w);
    r3.xyz = r3.xyz * r6.xxx;
    r6.x = ps;
    ps = LightColor.z * r7.x;
    r6.xyz = r3.xyz * r6.xxx;
    r0.z = ps;
    r6.xy = r2.xy * r6.ww + r6.xy;
    r6.z = r2.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * r1.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
