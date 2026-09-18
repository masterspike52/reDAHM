// ps_6608a98405ed5a43.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041100 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
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

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r13.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyw = UniformVector_6.xyz * UniformVector_6.www;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r8.x = ps;
    r5.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.x = r4.w - 4e+02;
    ps = r0.w;
    r6.xy = r0.wz * UniformVector_7.xy;
    ps = 6.0 * ps;
    r7.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r7.yz = r4.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r6.zw = r7.yz * r6.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.x));
    r5.x = saturate(r5.x * 0.00022222222);
    r7.x = ps;
    ps = -r0.z;
    r10.xyz = r7.xxx * r3.xyz;
    ps = 1.0 + ps;
    r9.xyz = r5.xzw * float3(-0.025, 0.875, 0.875);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r8.zw = r10.xy * r9.xx;
    r8.y = ps;
    ps = r0.w;
    r5.xz = r8.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r14.xw = float2((r8.xy >= 0.5));
    r7.x = ps;
    ps = r0.z;
    r5.xz = r5.xz - r8.xy;
    ps = UniformVector_1.y * ps;
    r7.zw = r5.xz * r14.xw;
    r7.y = ps;
    ps = r0.z;
    r7 = r8.zwxy + r7;
    ps = 6.0 * ps;
    r5.xw = r7.zw + r7.zw;
    r5.z = ps;
    r8.z = tex2D(Texture2D_4, r0.xy).x;
    r12.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r17 = tex2D(Texture2D_1, r5.xw);
    r16.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r11.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r8.xyw = tex2D(Texture2D_2, r5.yz).xyw;
    r5.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r7.xyz = tex2D(Texture2D_6, r6.xy).yxz;
    r6.xyw = tex2D(Texture2D_8, r0.xy).xyz;
    r4.xyz = r6.xyw * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r9.x = r8.w * r5.w - 1.0;
    ps = 0.0001 * r4.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.z = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r14.yz = r5.yz + r5.yz;
    r5.z = ps;
    r6.xyw = r3.zxy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    r0.xyz = r11.xyz * 2.0 - 1.0;
    ps = log2(r5.x);
    r3.xyw = r0.xyz * UniformVector_4.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r9.w = -r6.x + r3.w;
    r5.w = ps;
    ps = r1.z;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = r8.x + r8.x;
    r16.xyz = r16.xyz * r2.www;
    r15.z = ps;
    ps = r8.y + r8.y;
    r13.xyz = r15.xyw * r13.xyz;
    r15.w = ps;
    ps = 5.0 * r5.x;
    r8.xyw = r5.www * r1.xyz;
    r6.x = saturate(ps);
    ps = LightColorAndFalloffExponent.w * r5.y;
    r13.xyz = r13.xyz * r7.yxz;
    r5.y = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r5.zzz * -SpotDirection.xyz;
    r5.z = ps;
    ps = 1.0 - r6.z;
    r5.w = dot(r1.zxy, r2.zxy);
    r7.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r14.x = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r5.x = (r14.x == 0.0) ? r17.x : r17.y;
    ps = ModShadowGroupColor.y * r5.z;
    r14 = r14.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r2.w = ps;
    r5.x = (r14.y == 0.0) ? r17.z : r5.x;
    r2.y = (r14.x == 0.0) ? r17.w : r5.x;
    ps = pow(2.0, r5.y);
    r5.x = max(r2.y, 0.0);
    r5.y = ps;
    ps = r5.x;
    r1.xyz = r16.xzy * r5.yyy;
    r2.x = ps;
    ps = 0.3;
    r5.xyz = -r2.yzw + 1.0;
    r2.y = ps;
    ps = min(r2.x, r2.y);
    r15.xy = r9.yz * r5.yz;
    r5.y = ps;
    ps = 2.5 * r5.x;
    r2 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r13.w = ps;
    r9.yz = r2.zw * 0.5 + r14.zw;
    ps = 3.3333333 * r5.y;
    r5.z = r2.x * r2.y;
    r5.x = ps;
    r0.xyz = r5.zzz * r0.xyz + ModShadowColor.xyz;
    r5.yz = r5.xx * r9.yz + r3.xy;
    r5.x = r5.x * r9.x + 1.0;
    r2.w = saturate(r13.w * r5.x - 0.5);
    r9.xyz = r13.xyz * r5.xxx - r12.xyz;
    ps = abs(r5.x) * abs(r5.x);
    r5.x = ps;
    ps = r5.x * r5.x;
    r2.yz = r5.yz - r6.yw;
    r2.x = ps;
    r12.xyz = r9.xyz * r2.www + r12.xyz;
    r5.x = r9.w * r2.w - 2.0;
    r5.z = r3.z * 2.0 + r5.x;
    r3.xyz = r2.xyz * r2.xww;
    r5.xy = r6.yw + r3.yz;
    r6.xyz = r5.zxy * r7.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r5.xyz = (r7.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r9.xyz = (r7.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r9.zxy, r9.zxy);
    ps = rsqrt(abs(r5.x));
    r6.xyw = r12.xyz * r11.xyz;
    r5.x = ps;
    r9.xyz = r9.xyz * r5.xxx;
    r5.x = dot(r9.zxy, r10.zxy);
    r5.xyz = r9.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    ps = UniformScalar_8.x * r7.y;
    r5.x = saturate(dot(r8.wxy, r5.zxy));
    r7.x = ps;
    ps = log2(r5.x);
    r6.z = saturate(dot(r9.zyx, r8.wyx));
    r5.z = ps;
    ps = -SpotAngles.x - -r5.w;
    r5.y = r5.z * UniformScalar_7.x;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r5.z = r5.z * 15.0;
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r8.y = r7.x * r5.y;
    r8.x = saturate(ps);
    r5.xy = r8.xy * r8.xz;
    r7.xyz = r4.xyz + r5.yyy;
    r7.xyz = r3.xxx * r7.xyz;
    ps = pow(2.0, r5.z);
    r7.xyz = r7.xyz * r2.www;
    r5.z = ps;
    r5.yzw = r7.xyz * r5.zzz;
    r6.xy = r6.xy * r6.zz + r5.yz;
    r6.z = r6.w * r6.z + r5.w;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xxx;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
