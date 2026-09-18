// ps_1f63bd3905f91ee7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10040F00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy).xywz;
    ps = UniformVector_2.x * r0.w;
    r5.z = -r0.z + 1.0;
    r5.x = ps;
    ps = UniformVector_2.y * r5.z;
    r5.y = r14.z - 0.5;
    r5.z = ps;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r5.y = ps;
    ps = (-0.5) + r5.z;
    r6.xw = float2((r5.xz >= 0.5));
    r5.w = ps;
    r5.yw = r5.yw - r5.xz;
    r5.xy = r5.yw * r6.xw + r5.xz;
    r5.xy = r5.xy + r5.xy;
    r10 = tex2D(Texture2D_1, r5.xy);
    r9.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = r0.w;
    r12.zw = r0.wz * 6.0;
    ps = UniformVector_7.x * ps;
    r13.zw = r0.wz * UniformVector_1.xy;
    r13.x = ps;
    ps = r0.z;
    r7.z = dot(r3.zxy, r3.zxy);
    ps = UniformVector_7.y * ps;
    r5.x = r4.w - 4e+02;
    r13.y = ps;
    ps = r1.z;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.1 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r11.yz = r9.xy + r9.xy;
    r5.w = ps;
    ps = 0.00022222222 * r5.x;
    r7.xyw = r5.www * -SpotDirection.xyz;
    r6.y = saturate(ps);
    ps = 5.0 * r5.y;
    r5.w = dot(r7.wxy, r2.zxy);
    r6.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r5.w - SpotAngles.x;
    r7.x = ps;
    ps = SpotAngles.y * r5.x;
    r11.x = dot(r6.xww, float3(1.0, 1.0, 1.0));
    r15.x = saturate(ps);
    r5.x = (r11.x == 0.0) ? r10.x : r10.y;
    ps = 1.0 / r4.w;
    r11 = r11.yzxx + float4(-1.0, -1.0, -3.0, -2.0);
    r15.w = ps;
    r6.x = (r11.w == 0.0) ? r10.z : r5.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyw = r15.yzx * r15.wwx;
    r7.y = ps;
    ps = ScreenPositionScaleBias.w + r5.x;
    r12.xy = r7.xy * abs(r8.xy);
    r7.x = ps;
    r6.w = (r11.z == 0.0) ? r10.w : r6.x;
    ps = ScreenPositionScaleBias.z + r5.y;
    r6.x = max(r6.w, 0.0);
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r6.x = min(r6.x, 0.3);
    r5.x = ps;
    ps = r6.y;
    r10.xyz = r5.xxx * r3.xyz;
    r5.y = ps;
    ps = (-0.025) * r5.y;
    r2.xw = -r6.wz + 1.0;
    r5.x = ps;
    ps = 3.3333333 * r6.x;
    r10.w = r2.x * 2.5;
    r7.w = ps;
    r5.xy = r10.xy * r5.xx + r13.zw;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r1.w = tex2D(Texture2D_4, r0.xy).x;
    r8.xyz = tex2D(Texture2D_7, r5.xy).xyz;
    r2.xyz = tex2D(Texture2D_6, r13.xy).xyz;
    r13.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r0.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r9.xyw = tex2D(Texture2D_2, r12.zw).xwy;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r4.w;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r14.z = saturate(ps);
    r11.z = r9.y * r9.z - 1.0;
    ps = r9.x + r9.x;
    r5.x = dot(r1.zxy, r1.zxy);
    r13.z = ps;
    r9.xyz = r0.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r12.yz = r12.xy * 0.875;
    r0.z = ps;
    ps = 1.0 - r5.z;
    r4.xyz = r15.xyz * r14.xyw;
    r6.x = saturate(ps);
    r5.xyz = r13.wxy * 2.0 - 1.0;
    ps = log2(r6.x);
    r1.xyz = r0.zzz * r1.xyz;
    r6.x = ps;
    ps = r9.w + r9.w;
    r14.xy = r2.ww * ModShadowGroupColor.xy;
    r13.w = ps;
    ps = UniformVector_4.x * r5.y;
    r0.xyz = -r14.xyz + 1.0;
    r12.x = ps;
    ps = UniformVector_4.y * r5.z;
    r13.xy = r12.yz * r0.xy;
    r12.y = ps;
    ps = UniformVector_4.z * r5.x;
    r13 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r12.z = ps;
    r11.xy = r13.zw * 0.5 + r11.xy;
    ps = -r9.z;
    r5.y = r13.x * r13.y;
    r6.yzw = r5.yyy * r6.yzw + ModShadowColor.xyz;
    r5.yz = r7.ww * r11.xy + r12.xy;
    r0.y = r7.w * r11.z + 1.0;
    r0.x = saturate(r10.w * r0.y - 0.5);
    ps = r12.z + ps;
    r11.xy = r5.yz - r9.xy;
    r11.z = ps;
    r9.xy = r11.xy * r0.xx + r9.xy;
    r5.y = r11.z * r0.x - 2.0;
    r9.z = r0.w * 2.0 + r5.y;
    r9.xyw = r9.xyz * r0.zzz;
    ps = abs(r0.y) * abs(r0.y);
    r9.z = r9.w + 1.0;
    r5.z = ps;
    r9.xyz = (r0.zzz > 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    r9.xyz = (r0.zzz >= 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.z * r5.z;
    r5.y = dot(r9.zxy, r9.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r5.z = r5.z * r5.z;
    r5.y = ps;
    r9.xyz = r9.xyz * r5.yyy;
    r5.y = dot(r9.zxy, r10.zxy);
    r11.xyz = r9.xyz * r5.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r5.y = saturate(dot(r1.zxy, r10.zxy));
    ps = log2(r5.y);
    r7.w = saturate(dot(r9.zyx, r1.zyx));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r0.w = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r5.y;
    r4.w = ps;
    r2 = r4 * r2.xyzx;
    r1.xyz = r2.xyz * r0.yyy - r8.xyz;
    r2.xyz = r2.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r2.xyz = r2.www * r1.www + r2.xyz;
    r1.xyz = r1.xyz * r0.xxx + r8.xyz;
    r1.xyz = r1.xyz * r3.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r5.zzz * r2.xyz;
    r5.z = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r2.xyz * r0.xxx;
    r6.x = ps;
    ps = pow(2.0, r5.z);
    r0.xyz = r0.xyz * r6.xxx;
    r5.z = ps;
    r0.xy = r1.xy * r7.ww + r0.xy;
    r0.z = r1.z * r7.w + r0.z;
    r0.xyz = r0.xyz * r5.zzz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r7.xyz * r5.www;
    r5.xyz = r5.xyz * r6.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
