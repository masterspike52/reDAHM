// ps_a13e76bdacdbcfd5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041000 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
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

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = r13.w - 0.5;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r6.yz = r6.yz * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r7.zw = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r6.y = r5.w - 4e+02;
    ps = r2.z;
    r7.x = -r1.y + 1.0;
    ps = 0.1 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r11.y = r7.x * UniformVector_2.y;
    r6.w = ps;
    ps = 0.00022222222 * r6.y;
    r8.xy = r1.xy * UniformVector_1.xy;
    r7.y = saturate(ps);
    ps = 5.0 * r6.z;
    r9.xyz = r6.www * r4.xyz;
    r7.x = saturate(ps);
    ps = r1.x;
    r10.xyz = r7.yzw * float3(-0.025, 0.875, 0.875);
    ps = UniformVector_2.x * ps;
    r11.zw = r9.xy * r10.xx;
    r11.x = ps;
    r0.zw = r11.xy - 0.5;
    r6.yz = float2((r11.xy >= 0.5));
    ps = r1.x;
    r0.zw = r0.zw - r11.xy;
    ps = 6.0 * ps;
    r8.zw = r0.zw * r6.yz;
    r0.z = ps;
    ps = r1.y;
    r15 = r11.zwxy + r8;
    ps = 6.0 * ps;
    r1.zw = r15.zw + r15.zw;
    r0.w = ps;
    r16 = tex2D(Texture2D_1, r1.zw);
    r14.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_2, r0.zw).xwy;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r1.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r11.xyz = r1.xyw * 2.0 - 1.0;
    r10.x = r4.y * r8.z - 1.0;
    ps = r4.x + r4.x;
    r12.xy = r5.xy * ScreenPositionScaleBias.xy;
    r14.z = ps;
    r4.xyz = r14.xyw * 2.0 - 1.0;
    ps = r4.w + r4.w;
    r8.yz = r8.xy + r8.xy;
    r14.w = ps;
    ps = 1.0 - r7.x;
    r8.x = dot(r6.yzz, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r6.y = (r8.x == 0.0) ? r16.x : r16.y;
    ps = ModShadowGroupColor.x * r6.z;
    r7 = r8.yzxx + float4(-1.0, -1.0, -2.0, -3.0);
    r8.y = ps;
    r6.y = (r7.z == 0.0) ? r16.z : r6.y;
    r8.x = (r7.w == 0.0) ? r16.w : r6.y;
    ps = ModShadowGroupColor.y * r6.z;
    r6.y = max(r8.x, 0.0);
    r8.z = ps;
    ps = r6.y;
    r4.xyw = r4.xyz * UniformVector_4.xyz;
    r6.y = ps;
    ps = 0.0001 * r5.w;
    r10.w = -r11.z + r4.w;
    r8.w = saturate(ps);
    ps = 0.3;
    r8 = -r8 + 1.0;
    r6.z = ps;
    ps = min(r6.y, r6.z);
    r14.xy = r10.yz * r8.yz;
    r6.y = ps;
    ps = 3.3333333 * r6.y;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r7.w = ps;
    r10.yz = r14.zw * 0.5 + r7.xy;
    r6.yz = r7.ww * r10.yz + r4.xy;
    ps = 1.0 / r5.w;
    r12.zw = r6.yz - r11.xy;
    r6.y = ps;
    r6.yz = r12.xy * r6.yy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r7.xyz = tex2D(Texture2D_6, r15.xy).xyz;
    r6.y = tex2D(Texture2D_4, r0.xy).x;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r6.x;
    r0.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.z = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r13.xyz = r0.xyz * r13.xyz;
    r6.x = ps;
    r4.xyz = r13.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r6.z);
    r0.xyz = r6.xxx * -SpotDirection.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r0.zxy, r3.zxy);
    r0.w = ps;
    ps = -SpotAngles.x - -r6.z;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = r8.x;
    r5.xyz = r0.www * r2.xyz;
    r6.z = ps;
    ps = 2.5 * r6.z;
    r0.w = r14.x * r14.y;
    r13.w = ps;
    r0.xyz = r0.www * r0.xyz + ModShadowColor.xyz;
    r7.w = r7.w * r10.x + 1.0;
    r6.z = saturate(r13.w * r7.w - 0.5);
    r10.xyz = r13.xyz * r7.www - r7.xyz;
    ps = SpotAngles.y * r6.w;
    r3.x = abs(r7.w) * abs(r7.w);
    r3.y = saturate(ps);
    r8.xyz = r10.xyz * r6.zzz + r7.xyz;
    r7.xy = r12.zw * r6.zz + r11.xy;
    r6.w = r10.w * r6.z - 2.0;
    r7.z = r1.w * 2.0 + r6.w;
    r7.xyz = r7.zxy * r8.www;
    ps = 1.0 + r7.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r8.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r8.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.w));
    r2.xyz = r8.xyz * r2.xyz;
    r6.w = ps;
    r8.xyz = r7.xyz * r6.www;
    r6.w = dot(r8.zxy, r9.zxy);
    ps = UniformScalar_8.x * r6.y;
    r7.yzw = r8.xyz * r6.www;
    r7.x = ps;
    r7.yzw = r7.yzw * 2.0 - r9.xyz;
    ps = r3.x * r3.x;
    r6.y = saturate(dot(r5.zxy, r7.wyz));
    r7.y = ps;
    ps = log2(r6.y);
    r0.w = saturate(dot(r8.zyx, r5.zyx));
    r6.y = ps;
    ps = r3.y * r3.y;
    r6.w = r6.y * UniformScalar_7.x;
    r7.w = ps;
    ps = pow(2.0, r6.w);
    r6.y = r6.y * 15.0;
    r7.z = ps;
    r3.xw = r7.xy * r7.zy;
    r3.xyz = r4.xyz + r3.xxx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r3.xyz = r3.www * r3.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r3.xyz = r3.xyz * r6.zzz;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r3.xyz * r6.yyy;
    r6.x = ps;
    r6.yz = r2.xy * r0.ww + r6.yz;
    r6.w = r2.z * r0.w + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r1.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r7.www;
    r6.xyz = r6.xyz * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
