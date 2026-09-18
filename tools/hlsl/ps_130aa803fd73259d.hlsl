// ps_130aa803fd73259d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 336 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000540 10041300 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.z + 1.0;
    r8.x = ps;
    r7.xy = r1.wz * 6.0;
    r7.zw = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r2.z + 0.1;
    r8.y = ps;
    ps = r5.w;
    r12.xy = r1.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r8.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r8.z));
    r6.w = r11.w - 0.5;
    r8.z = ps;
    ps = 0.00022222222 * r6.x;
    r10.xyz = r8.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = 5.0 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.x;
    r4.x = r1.w * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r10.xy * r6.ww;
    r4.y = ps;
    r8.zw = r4.xy - 0.5;
    r6.zw = float2((r4.xy >= 0.5));
    ps = r8.x;
    r8.zw = r8.zw - r4.xy;
    ps = abs(r9.x) * ps;
    r12.zw = r8.zw * r6.zw;
    r8.z = ps;
    ps = r8.y;
    r15 = r4.zwxy + r12;
    ps = abs(r9.y) * ps;
    r8.xy = r15.zw + r15.zw;
    r8.w = ps;
    r18.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r17 = tex2D(Texture2D_1, r8.xy);
    r8.xyz = tex2D(Texture2D_3, r7.zw).wxy;
    r12.xyw = tex2D(Texture2D_2, r7.xy).xyw;
    r9.xyz = tex2D(Texture2D_2, r1.wz).wxy;
    r7.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r13.xyz = r4.xyw * 2.0 - 1.0;
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = r12.x + r12.x;
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    r16.x = ps;
    ps = r12.y + r12.y;
    r16.zw = r8.yz + r8.yz;
    r16.y = ps;
    ps = r9.y + r9.y;
    r16 = r16 - 1.0;
    r19.y = ps;
    ps = r9.z + r9.z;
    r19.x = dot(r6.zww, float3(1.0, 1.0, 1.0));
    r19.z = ps;
    r6.z = (r19.x == 0.0) ? r17.x : r17.y;
    r19 = r19.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r0.zw = r16.xy * 0.5 + r19.zw;
    r6.z = (r19.y == 0.0) ? r17.z : r6.z;
    r6.z = (r19.x == 0.0) ? r17.w : r6.z;
    ps = r5.w;
    r6.w = max(r6.z, 0.0);
    ps = 0.0001 * ps;
    r6.xz = -r6.zy + 1.0;
    r17.x = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r18.x = min(r6.w, 0.3);
    r17.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r8.yzw = r18.xyz * float3(3.3333333, 0.875, 0.875);
    r17.z = ps;
    r9.yzw = -r17.zyx + 1.0;
    ps = 1.0 / r5.w;
    r6.z = r9.w * UniformScalar_1.x;
    r6.y = ps;
    r6.zw = r6.zz * r16.zw + r7.xy;
    r6.zw = r6.zw * UniformVector_4.xy - r13.xy;
    r14.xy = r8.yy * r0.zw + r6.zw;
    r6.yz = r14.zw * r6.yy + ScreenPositionScaleBias.wz;
    r1.w = tex2D(Texture2D_5, r1.xy).x;
    r5.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r7.x = tex2D(ShadowTexture, r0.xy).x;
    r12.xyz = tex2D(Texture2D_7, r15.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.z = dot(r3.zxy, r3.zxy);
    r0.y = ps;
    r9.x = r12.w * r9.x - 1.0;
    ps = rsqrt(abs(r6.z));
    r8.x = r8.x - 1.0;
    r7.y = ps;
    ps = 1.0 - r6.z;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.y = saturate(ps);
    r11.w = r7.z * UniformVector_4.z - r13.z;
    ps = log2(r6.y);
    r7.yzw = r7.yyy * -SpotDirection.xyz;
    r6.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.z = dot(r7.wyz, r3.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = r6.z - SpotAngles.x;
    r6.w = ps;
    ps = SpotAngles.y * r6.z;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = saturate(ps);
    ps = 2.5 * r6.x;
    r0.xyz = r0.xyz * r11.xyz;
    r0.w = ps;
    r8 = r8.yxzw * r9.xwzy + float4(1.0, 1.0, 0.125, 0.125);
    ps = abs(r8.x) * abs(r8.x);
    r4.xyz = r6.www * r2.xyz;
    r7.y = ps;
    ps = r8.z * r8.w;
    r0.xyz = r0.xyz * r8.yyy;
    r6.x = ps;
    r6.xzw = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r2.xyz = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r11.xyz = r0.xyz * r8.xxx - r12.xyz;
    r8.x = saturate(r0.w * r8.x - 0.5);
    r7.xyz = r7.zxy * r7.zxy;
    r0.xyz = r7.yyy * r5.xyz;
    r5.xy = r14.xy * r8.xx + r13.xy;
    r3.xyz = r11.xyz * r8.xxx + r12.xyz;
    r7.w = r11.w * r8.x - 2.0;
    r5.z = r4.w * 2.0 + r7.w;
    r5.xyw = r5.xyz * r9.www;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r5.z = r5.w + 1.0;
    r7.w = ps;
    r5.xyz = (r9.www > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.xyz = (r9.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.w);
    r6.y = dot(r5.zxy, r5.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r0.xzy * r7.www;
    r6.y = ps;
    r5.xyz = r5.xyz * r6.yyy;
    r6.y = dot(r5.zxy, r10.zxy);
    r9.xyz = r5.xyz * r6.yyy;
    r9.xyz = r9.xyz * 2.0 - r10.xyz;
    r6.y = saturate(dot(r4.zxy, r9.zxy));
    ps = log2(r6.y);
    r8.z = saturate(dot(r5.zyx, r4.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r7.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r3.w = r6.y * r8.y;
    r1 = r3 * r1;
    ps = r7.z * r7.z;
    r2.xyz = r2.xyz + r1.www;
    r6.y = ps;
    r2.xyz = r6.yyy * r2.xyz;
    ps = pow(2.0, r7.w);
    r8.xyw = r2.xyz * r8.xxx;
    r6.y = ps;
    r7.yzw = r8.xyw * r6.yyy;
    r8.xy = r1.xy * r8.zz + r7.yz;
    r8.z = r1.z * r8.z + r7.w;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.xxx;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
