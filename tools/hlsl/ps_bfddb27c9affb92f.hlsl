// ps_bfddb27c9affb92f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041000 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s9);
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
    float4 color2 : COLOR2; // r8
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
    float4 r8 = In.color2;
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

    r16 = tex2D(Texture2D_5, r1.xy);
    r6.z = r16.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r1.w;
    r6.xy = r1.wz * 6.0;
    r7.x = ps;
    r10.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = 1.0 - r1.z;
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r7.zw = r10.xy + r10.xy;
    r7.y = ps;
    r14 = r7 + float4(-0.5, -0.5, -1.0, -1.0);
    r0.zw = float2((r7.xy >= 0.5));
    r6.xy = r14.xy - r7.xy;
    r6.xy = r6.xy * r0.zw + r7.xy;
    r6.xy = r6.xy + r6.xy;
    r15 = tex2D(Texture2D_1, r6.xy);
    r12.x = tex2D(ShadowTexture, r0.xy).x;
    r8.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    ps = r5.w;
    r11.xy = r1.wz * UniformVector_7.xy;
    ps = 0.0001 * ps;
    r11.zw = r1.wz * UniformVector_1.xy;
    r7.z = saturate(ps);
    ps = r2.z;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r6.y = r5.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yz = r8.xy + r8.xy;
    r0.y = ps;
    ps = 1.0 / r5.w;
    r7.yw = saturate(r6.xy * float2(5.0, 0.00022222222));
    r12.w = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r12.yzx * r12.wwx;
    r6.w = ps;
    ps = r0.x;
    r12.xyz = r6.www * r4.xyz;
    ps = abs(r9.x) * ps;
    r13.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r6.w = (r13.x == 0.0) ? r15.x : r15.y;
    ps = r0.y;
    r13 = r13.yzxx + float4(-1.0, -1.0, -3.0, -2.0);
    r6.w = (r13.w == 0.0) ? r15.z : r6.w;
    r5.x = (r13.z == 0.0) ? r15.w : r6.w;
    ps = abs(r9.y) * ps;
    r6.w = max(r5.x, 0.0);
    r0.w = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r7.x = min(r6.w, 0.3);
    r0.x = ps;
    ps = ScreenPositionScaleBias.z + r6.y;
    r4.xw = -r7.yz + 1.0;
    r0.y = ps;
    ps = r7.w;
    r5.yz = r4.xx * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = (-0.025) * r6.y;
    r10.xyz = -r5.xyz + 1.0;
    r6.x = ps;
    ps = 3.3333333 * r7.x;
    r12.w = r10.x * 2.5;
    r6.w = ps;
    r7.yw = r12.xy * r6.xx + r11.zw;
    r2.w = tex2D(Texture2D_4, r1.xy).x;
    r4.xyz = tex2D(Texture2D_7, r7.yw).xyz;
    r9.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r7.xz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r7.yw).xyz;
    r7.w = dot(r2.zxy, r2.zxy);
    r7.y = dot(r3.zxy, r3.zxy);
    r13.z = r10.w * r8.w - 1.0;
    r8.xyw = r8.xyz * 2.0 - 1.0;
    r15.xyz = r1.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r6.x = saturate(-r7.y + 1.0);
    r7.w = ps;
    ps = rsqrt(abs(r7.y));
    r11.xyz = r7.www * r2.xyz;
    r7.y = ps;
    r1.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r1.xyz = r1.xyz * r16.xyz;
    r2.xyz = r15.xyz * UniformVector_4.xyz;
    ps = log2(r6.x);
    r15.xyz = r7.yyy * -SpotDirection.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xyz = r6.zzz * r0.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.y = dot(r15.zxy, r3.zxy);
    r6.x = ps;
    ps = -r8.w;
    r0.xyz = r0.xzy * r6.xxx;
    r13.xy = r14.zw * 0.5 + r13.xy;
    r3.x = r6.w * r13.z + 1.0;
    r6.xz = r6.ww * r13.xy + r2.xy;
    ps = r2.z + ps;
    r2.xy = r6.xz - r8.xy;
    r2.z = ps;
    r0.w = saturate(r12.w * r3.x - 0.5);
    r6.xz = r2.xy * r0.ww + r8.xy;
    r6.w = r2.z * r0.w - 2.0;
    r6.w = r8.z * 2.0 + r6.w;
    r8.xyz = r6.wxz * r4.www;
    ps = 1.0 + r8.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r8.w = ps;
    r6.xzw = (r4.www > 0.0) ? r8.yzw : float3(0.0, 0.0, 1.0);
    r8.xyz = (r4.www >= 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    r6.x = dot(r8.zxy, r8.zxy);
    ps = rsqrt(abs(r6.x));
    r6.z = abs(r3.x) * abs(r3.x);
    r6.x = ps;
    r3.yzw = r8.xyz * r6.xxx;
    r6.x = dot(r3.wyz, r12.zxy);
    ps = -SpotAngles.x - -r6.y;
    r8.xyz = r3.yzw * r6.xxx;
    r6.x = ps;
    r8.xyz = r8.xyz * 2.0 - r12.xyz;
    ps = SpotAngles.y * r6.x;
    r6.y = saturate(dot(r11.zxy, r8.zxy));
    r8.x = saturate(ps);
    ps = log2(r6.y);
    r8.y = r6.z * r6.z;
    r7.y = ps;
    ps = UniformScalar_7.x * r7.y;
    r6.w = saturate(dot(r3.wzy, r11.zyx));
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.xyw = r7.xzy * float3(0.875, 0.875, 15.0);
    r6.y = ps;
    r8.zw = r7.xy * r10.yz + 0.125;
    ps = UniformScalar_8.x * r6.y;
    r7.xyz = r8.zxy * r8.wxy;
    r1.w = ps;
    r1 = r1 * r9.xyzx;
    r6.xyz = r7.xxx * r5.xyz + ModShadowColor.xyz;
    r8.xyz = r1.xyz * r3.xxx - r4.xyz;
    r1.xyz = r1.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r1.xyz = r1.www * r2.www + r1.xyz;
    r8.xyz = r8.xyz * r0.www + r4.xyz;
    r8.xyz = r8.xyz * r2.xyz;
    r1.xyz = r7.zzz * r1.xyz;
    ps = pow(2.0, r7.w);
    r1.xyz = r1.xyz * r0.www;
    r7.w = ps;
    r7.xzw = r1.xyz * r7.www;
    r8.xy = r8.xy * r6.ww + r7.xz;
    r8.z = r8.z * r6.w + r7.w;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
