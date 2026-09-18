// ps_9811cf93b878eddc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 318 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004F8 10040E00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_5, r0.xy);
    ps = UniformVector_2.x * r0.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = -r0.z + 1.0;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r5.y * UniformVector_2.y;
    r6.w = ps;
    ps = r9.w;
    r6.xy = r0.wz * 6.0;
    r5.w = ps;
    ps = (-0.5) + r5.w;
    r6.zw = r6.zw * abs(r8.xy);
    r5.y = ps;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r5.y = ps;
    ps = (-0.5) + r5.z;
    r11.xy = float2((r5.xz >= 0.5));
    r5.w = ps;
    r5.yw = r5.yw - r5.xz;
    r5.xy = r5.yw * r11.xy + r5.xz;
    r5.xy = r5.xy + r5.xy;
    r10 = tex2D(Texture2D_1, r5.xy).xzwy;
    r5.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r6.xzw = tex2D(Texture2D_2, r6.xy).xyw;
    r8.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = r4.w;
    r11.z = r1.z + 0.1;
    ps = 0.0001 * ps;
    r7.xy = r0.wz * UniformVector_7.xy;
    r8.z = saturate(ps);
    ps = r4.x;
    r12.xy = r0.wz * UniformVector_1.xy;
    ps = ScreenPositionScaleBias.x * ps;
    r11.w = r4.w - 4e+02;
    r6.y = ps;
    r12.z = r6.w * r8.w - 1.0;
    ps = r6.x + r6.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r13.z = ps;
    ps = 0.875 * r5.x;
    r8.yw = r8.xy + r8.xy;
    r7.z = ps;
    ps = rsqrt(abs(r5.z));
    r14.xz = saturate(r11.zw * float2(5.0, 0.00022222222));
    r5.x = ps;
    ps = r5.x;
    r8.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r5.z = (r8.x == 0.0) ? r10.x : r10.w;
    ps = r3.x * ps;
    r11 = r8.xywx + float4(-3.0, -1.0, -1.0, -2.0);
    r10.x = ps;
    r5.z = (r11.w == 0.0) ? r10.y : r5.z;
    r14.y = (r11.x == 0.0) ? r10.z : r5.z;
    ps = r5.x;
    r5.z = max(r14.y, 0.0);
    ps = r3.y * ps;
    r14.w = min(r5.z, 0.3);
    r10.y = ps;
    ps = r5.x;
    r11.xw = r14.zw * float2(-0.025, 3.3333333);
    ps = r3.z * ps;
    r5.xz = -r14.yx + 1.0;
    r10.z = ps;
    ps = 2.5 * r5.x;
    r8.xy = r5.zz * ModShadowGroupColor.xy;
    r10.w = ps;
    r5.zw = r10.xy * r11.xx + r12.xy;
    ps = 0.875 * r5.y;
    r8.xyw = -r8.xyz + 1.0;
    r7.w = ps;
    ps = r6.z + r6.z;
    r13.xy = r7.zw * r8.xy;
    r13.w = ps;
    ps = r4.y;
    r14 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r12.xy = r14.zw * 0.5 + r11.yz;
    r3.w = r11.w * r12.z + 1.0;
    ps = ScreenPositionScaleBias.y * ps;
    r5.x = abs(r3.w) * abs(r3.w);
    r6.z = ps;
    ps = 1.0 / r4.w;
    r6.x = r5.x * r5.x;
    r6.w = ps;
    r6.xyw = r6.yzx * r6.wwx;
    r5.xy = r6.xy + ScreenPositionScaleBias.wz;
    r7.w = tex2D(Texture2D_4, r0.xy).x;
    r3.xyz = tex2D(Texture2D_7, r5.zw).xyz;
    r4.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.yzw = tex2D(Texture2D_0, r5.zw).xyz;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r1.zxy, r1.zxy);
    r5.x = dot(r2.zxy, r2.zxy);
    r8.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r11.xyz = r5.yzw * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r7.xyz = r7.xyz * r2.www;
    r5.x = saturate(ps);
    r0.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r2.xyz = r0.xyz * UniformVector_4.xyz;
    r6.z = ps;
    ps = log2(r5.x);
    r0.xyz = r6.zzz * r1.xyz;
    r5.x = ps;
    ps = -r11.z;
    r6.z = r14.x * r14.y;
    r6.xyz = r6.zzz * r13.xyz + ModShadowColor.xyz;
    r1.xy = r11.ww * r12.xy + r2.xy;
    r5.z = saturate(r10.w * r3.w - 0.5);
    ps = r2.z + ps;
    r2.xy = r1.xy - r11.xy;
    r2.z = ps;
    r1.xy = r2.xy * r5.zz + r11.xy;
    r5.y = r2.z * r5.z - 2.0;
    r1.z = r5.w * 2.0 + r5.y;
    r1.xyw = r1.xyz * r8.www;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.z = r1.w + 1.0;
    r5.y = ps;
    r1.xyz = (r8.www > 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r8.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r5.y);
    r5.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r7.xyz * r5.yyy;
    r5.x = ps;
    r1.xyz = r1.xyz * r5.xxx;
    r5.x = dot(r1.zxy, r10.zxy);
    r5.xyw = r1.xyz * r5.xxx;
    r5.xyw = r5.xyw * 2.0 - r10.xyz;
    r5.x = saturate(dot(r0.zxy, r5.wxy));
    ps = log2(r5.x);
    r5.w = saturate(dot(r1.zyx, r0.zyx));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r5.x = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r5.y;
    r1.xyz = r8.xyz * r9.xyz;
    r1.w = ps;
    r1 = r1 * r4.xyzx;
    r2.xyz = r1.xyz * r3.www - r3.xyz;
    r1.xyz = r1.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r1.xyz = r1.www * r7.www + r1.xyz;
    r2.xyz = r2.xyz * r5.zzz + r3.xyz;
    r0.xyz = r2.xyz * r0.xyz;
    r1.xyz = r6.www * r1.xyz;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xyz * r5.zzz;
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
