// ps_d3279fdf577e2da3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10041000 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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
sampler2D ModShadowAccumTexture : register(s9);

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

    r13 = tex2D(Texture2D_6, r0.xy);
    r12.x = r1.x * UniformVector_2.x;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r5.w - 4e+02;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r2.z + 0.1;
    r7.y = ps;
    ps = rsqrt(abs(r6.z));
    r9.xy = r7.xy * abs(r8.xy);
    r6.w = ps;
    ps = -r1.y;
    r0.zw = r1.xy * 6.0;
    ps = 1.0 + ps;
    r10.xy = r1.xy * UniformVector_1.xy;
    r6.z = ps;
    ps = UniformVector_2.y * r6.z;
    r14.yz = r5.xy * ScreenPositionScaleBias.xy;
    r12.y = ps;
    ps = r13.w;
    r6.z = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.z));
    r8.xyz = r6.www * r4.xyz;
    r6.w = ps;
    ps = (-0.5) + r7.x;
    r4.xyz = r6.www * -SpotDirection.xyz;
    r6.w = ps;
    ps = 0.00022222222 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = 5.0 * r6.x;
    r7.x = dot(r4.zxy, r3.zxy);
    r6.w = saturate(ps);
    ps = (-0.025) * r6.y;
    r6.x = r7.x - SpotAngles.x;
    r7.x = ps;
    ps = SpotAngles.y * r6.x;
    r12.zw = r8.xy * r7.xx;
    r14.x = saturate(ps);
    ps = 1.0 / r5.w;
    r7.xw = r12.xy - 0.5;
    r14.w = ps;
    ps = r14.x * r14.x;
    r11.xy = float2((r12.xy >= 0.5));
    r1.z = ps;
    ps = r14.y * r14.w;
    r3.xy = r7.xw - r12.xy;
    r7.x = ps;
    ps = r14.z * r14.w;
    r10.zw = r3.xy * r11.xy;
    r6.x = ps;
    ps = ScreenPositionScaleBias.w + r7.x;
    r4 = r12.zwxy + r10;
    r3.x = ps;
    ps = ScreenPositionScaleBias.z + r6.x;
    r7.xw = r4.zw + r4.zw;
    r3.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r4.z = tex2D(Texture2D_5, r0.xy).x;
    r10.xyz = tex2D(Texture2D_7, r4.xy).xyz;
    r12.zw = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r15 = tex2D(Texture2D_1, r7.xw);
    r9.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r4.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    ps = 0.0001 * r5.w;
    r7.yz = r0.xy * UniformScalar_0.xx;
    r0.y = saturate(ps);
    r0.xzw = tex2D(Texture2D_2, r1.xy).wxy;
    r7.xyz = tex2D(Texture2D_3, r7.yz).wxy;
    ps = UniformVector_6.x * UniformVector_6.w;
    r1.xyw = -ModShadowColor.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.x = dot(r2.zxy, r2.zxy);
    r14.y = ps;
    r0.x = r16.z * r0.x - 1.0;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.xy = r16.xy + r16.xy;
    r14.z = ps;
    ps = rsqrt(abs(r6.x));
    r5.zw = r7.yz + r7.yz;
    r7.w = ps;
    ps = 1.0 - r6.z;
    r13.xyz = r14.xyz * r13.xyz;
    r6.x = saturate(ps);
    r14.xyz = r4.xyw * 2.0 - 1.0;
    r9.xyw = r9.xyz * 2.0 - 1.0;
    r11.w = r14.z * UniformVector_4.z - r9.w;
    ps = log2(r6.x);
    r4.xyw = r7.www * r2.xyz;
    r6.x = ps;
    ps = r0.z + r0.z;
    r2 = r5 - 1.0;
    r5.y = ps;
    ps = r0.w + r0.w;
    r5.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r6.z = (r5.x == 0.0) ? r15.x : r15.y;
    r5 = r5.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r11.xy = r2.xy * 0.5 + r5.zw;
    r6.z = (r5.y == 0.0) ? r15.z : r6.z;
    r6.z = (r5.x == 0.0) ? r15.w : r6.z;
    ps = 1.0 - r6.z;
    r7.w = max(r6.z, 0.0);
    r6.z = ps;
    ps = 1.0 - r6.w;
    r12.y = min(r7.w, 0.3);
    r6.y = ps;
    ps = (-1.0) + r7.x;
    r0.zw = r6.yy * ModShadowGroupColor.xy;
    r12.x = ps;
    ps = 2.5 * r6.z;
    r0.yzw = -r0.ywz + 1.0;
    r7.w = ps;
    ps = UniformScalar_1.x * r0.y;
    r12.yzw = r12.yzw * float3(3.3333333, 0.875, 0.875);
    r6.y = ps;
    r5 = r12 * r0.yxwz + float4(1.0, 1.0, 0.125, 0.125);
    r6.yz = r6.yy * r2.zw + r14.xy;
    r6.yz = r6.yz * UniformVector_4.xy - r9.xy;
    ps = r5.z * r5.w;
    r7.xyz = r13.xyz * r5.xxx;
    r6.w = ps;
    r1.xyw = r6.www * r1.xyw + ModShadowColor.xyz;
    r2.xyz = r7.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r6.yw = r12.yy * r11.xy + r6.yz;
    r11.xyz = r7.xyz * r5.yyy - r10.xyz;
    r6.z = saturate(r7.w * r5.y - 0.5);
    r7.xy = r6.yw * r6.zz + r9.xy;
    r10.xyz = r11.xyz * r6.zzz + r10.xyz;
    r6.y = r11.w * r6.z - 2.0;
    r7.z = r9.z * 2.0 + r6.y;
    r7.xyz = r7.zxy * r0.yyy;
    ps = 1.0 + r7.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r0.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r0.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r6.y));
    r7.yzw = r10.xyz * r9.xyz;
    r6.y = ps;
    r0.xyz = r0.xyz * r6.yyy;
    r6.y = dot(r0.zxy, r8.zxy);
    r9.xyz = r0.xyz * r6.yyy;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r6.y = saturate(dot(r4.wxy, r8.zxy));
    ps = log2(r6.y);
    r7.x = saturate(dot(r0.zyx, r4.wyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r6.y = r6.y * 15.0;
    r6.w = ps;
    ps = abs(r5.y) * abs(r5.y);
    r0.x = r6.w * UniformScalar_10.x;
    r6.w = ps;
    ps = r6.w * r6.w;
    r4.x = r0.x * r5.x;
    r4.y = ps;
    r0.xw = r4.xy * r4.zy;
    r0.xyz = r2.xyz + r0.xxx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xyz = r0.www * r0.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r0.xyz = r0.xyz * r6.zzz;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r0.xyz * r6.yyy;
    r6.x = ps;
    r6.yz = r7.yz * r7.xx + r6.yz;
    r6.w = r7.w * r7.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r1.zzz;
    r6.xyz = r6.xyz * r1.xyw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
