// ps_6a33dfc5ca1810c6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10041100 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r6.z = ps;
    r7.xy = r0.wz * 6.0;
    r6.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r6.w = ps;
    ps = r1.z;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r7.z = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r7.z));
    r5.w = r13.w - 0.5;
    r7.z = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r7.zzz * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.zw = r9.xy * r5.ww;
    r3.y = ps;
    r7.zw = r3.xy - 0.5;
    r5.zw = float2((r3.xy >= 0.5));
    ps = r6.z;
    r7.zw = r7.zw - r3.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r7.zw * r5.zw;
    r7.z = ps;
    ps = r6.w;
    r3 = r3.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.zw = r3.zw + r3.zw;
    r7.w = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16 = tex2D(Texture2D_1, r6.zw);
    r6.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    r14.xyw = tex2D(Texture2D_2, r7.xy).xyw;
    r8.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r10.xyz = r7.xyw * 2.0 - 1.0;
    r7.xyz = r11.xyz * 2.0 - 1.0;
    ps = r14.x + r14.x;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r15.x = ps;
    ps = r14.y + r14.y;
    r15.zw = r6.yz + r6.yz;
    r15.y = ps;
    ps = r8.y + r8.y;
    r15 = r15 - 1.0;
    r17.y = ps;
    ps = r8.z + r8.z;
    r17.x = dot(r5.zww, float3(1.0, 1.0, 1.0));
    r17.z = ps;
    r5.z = (r17.x == 0.0) ? r16.x : r16.y;
    r17 = r17.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r11.xy = r15.xy * 0.5 + r17.zw;
    r5.z = (r17.y == 0.0) ? r16.z : r5.z;
    r5.z = (r17.x == 0.0) ? r16.w : r5.z;
    ps = r4.w;
    r5.w = max(r5.z, 0.0);
    ps = 0.0001 * ps;
    r5.xz = -r5.zx + 1.0;
    r16.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r12.x = min(r5.w, 0.3);
    r16.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r12.yzw = r12.xyz * float3(3.3333333, 0.875, 0.875);
    r16.z = ps;
    r8.yzw = -r16.zyx + 1.0;
    ps = 1.0 / r4.w;
    r5.z = r8.w * UniformScalar_1.x;
    r5.y = ps;
    r5.zw = r5.zz * r15.zw + r7.xy;
    r5.zw = r5.zw * UniformVector_4.xy - r10.xy;
    r11.xy = r12.yy * r11.xy + r5.zw;
    r5.yz = r11.zw * r5.yy + ScreenPositionScaleBias.wz;
    r3.z = tex2D(Texture2D_5, r0.xy).x;
    r4.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r3.xyw = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r14.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = (-1.0) + r6.x;
    r5.z = dot(r2.zxy, r2.zxy);
    r12.x = ps;
    r8.x = r14.w * r8.x - 1.0;
    ps = 1.0 - r5.z;
    r6.xyz = r14.xyz * r13.xyz;
    r5.y = saturate(ps);
    r0.w = r7.z * UniformVector_4.z - r10.z;
    ps = log2(r5.y);
    r2.xyz = r3.xyw * r2.www;
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r5.w = ps;
    ps = pow(2.0, r5.y);
    r3.xyw = r5.www * r1.xyz;
    r5.y = ps;
    ps = 2.5 * r5.x;
    r7.xyz = r2.xyz * r5.yyy;
    r5.w = ps;
    r2 = r12 * r8.wxzy + float4(1.0, 1.0, 0.125, 0.125);
    ps = r2.z * r2.w;
    r5.xyz = r6.xyz * r2.xxx;
    r6.x = ps;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r1.xyz = r5.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r0.xyz = r5.xyz * r2.yyy - r4.xyz;
    r6.w = saturate(r5.w * r2.y - 0.5);
    r5.xy = r11.xy * r6.ww + r10.xy;
    r4.xyz = r0.xyz * r6.www + r4.xyz;
    r5.z = r0.w * r6.w - 2.0;
    r5.z = r7.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r8.www;
    ps = 1.0 + r5.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r8.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r8.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r4.xyz * r0.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r9.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r3.wxy, r4.zxy));
    ps = log2(r5.x);
    r5.w = saturate(dot(r5.wzy, r3.wyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r5.x = r5.y * 15.0;
    r5.y = ps;
    ps = abs(r2.y) * abs(r2.y);
    r5.z = r5.y * UniformScalar_10.x;
    r5.y = ps;
    ps = r5.y * r5.y;
    r3.x = r5.z * r2.x;
    r3.y = ps;
    r5.yz = r3.xy * r3.zy;
    r1.xyz = r1.xyz + r5.yyy;
    r1.xyz = r5.zzz * r1.xyz;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r7.xyz * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
