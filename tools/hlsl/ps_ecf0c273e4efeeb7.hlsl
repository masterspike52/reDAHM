// ps_ecf0c273e4efeeb7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10040E00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c13); // float3
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
    r7.xw = float2((r5.xz >= 0.5));
    r5.w = ps;
    r5.yw = r5.yw - r5.xz;
    r5.xy = r5.yw * r7.xw + r5.xz;
    r5.xy = r5.xy + r5.xy;
    r10 = tex2D(Texture2D_1, r5.xy).xzwy;
    r5.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r2.xyw = tex2D(Texture2D_2, r6.xy).xwy;
    r12.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = r4.w;
    r8.x = r4.w - 4e+02;
    ps = 0.0001 * ps;
    r6.xy = r0.wz * UniformVector_7.xy;
    r8.w = saturate(ps);
    ps = r4.x;
    r11.xy = r0.wz * UniformVector_1.xy;
    ps = ScreenPositionScaleBias.x * ps;
    r8.z = r1.z + 0.1;
    r8.y = ps;
    r11.z = r2.y * r12.z - 1.0;
    ps = r2.x + r2.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r2.z = ps;
    ps = 0.875 * r5.x;
    r7.yz = r12.xy + r12.xy;
    r6.z = ps;
    ps = rsqrt(abs(r5.z));
    r12.yz = saturate(r8.xz * float2(0.00022222222, 5.0));
    r5.x = ps;
    ps = r5.x;
    r7.x = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r5.z = (r7.x == 0.0) ? r10.x : r10.w;
    ps = r3.x * ps;
    r7 = r7.xyzx + float4(-3.0, -1.0, -1.0, -2.0);
    r10.x = ps;
    r5.z = (r7.w == 0.0) ? r10.y : r5.z;
    r12.w = (r7.x == 0.0) ? r10.z : r5.z;
    ps = r5.x;
    r5.z = max(r12.w, 0.0);
    ps = r3.y * ps;
    r12.x = min(r5.z, 0.3);
    r10.y = ps;
    ps = r5.x;
    r7.xw = r12.yx * float2(-0.025, 3.3333333);
    ps = r3.z * ps;
    r5.xz = -r12.wz + 1.0;
    r10.z = ps;
    ps = 2.5 * r5.x;
    r8.xz = r5.zz * ModShadowGroupColor.xy;
    r10.w = ps;
    r5.zw = r10.xy * r7.xx + r11.xy;
    ps = 0.875 * r5.y;
    r3.xyw = -r8.xzw + 1.0;
    r6.w = ps;
    ps = r2.w + r2.w;
    r2.xy = r6.zw * r3.xy;
    r2.w = ps;
    ps = r4.y;
    r13 = r2 + float4(0.125, 0.125, -1.0, -1.0);
    r11.xy = r13.zw * 0.5 + r7.yz;
    r2.w = r7.w * r11.z + 1.0;
    ps = ScreenPositionScaleBias.y * ps;
    r5.x = abs(r2.w) * abs(r2.w);
    r8.z = ps;
    ps = 1.0 / r4.w;
    r8.x = r5.x * r5.x;
    r8.w = ps;
    r2.xyz = r8.xyz * r8.xww;
    r5.xy = r2.yz + ScreenPositionScaleBias.wz;
    r1.w = tex2D(Texture2D_4, r0.xy).x;
    r4.xyz = tex2D(Texture2D_7, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r14.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r5.xzw = tex2D(LightAttenuationTexture, r5.xy).yxz;
    r0.w = dot(r1.zxy, r1.zxy);
    r0.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r6.xyw = r6.xyz * 2.0 - 1.0;
    r14.xyz = r14.xyz * 2.0 - 1.0;
    r3.xyz = r14.xyz * UniformVector_4.xyz;
    ps = -r6.w;
    r5.y = r13.x * r13.y;
    r7.xyz = r5.yyy * r12.xyz + ModShadowColor.xyz;
    r11.xy = r7.ww * r11.xy + r3.xy;
    r7.w = saturate(r10.w * r2.w - 0.5);
    ps = r3.z + ps;
    r11.xy = r11.xy - r6.xy;
    r11.z = ps;
    r6.xy = r11.xy * r7.ww + r6.xy;
    r5.y = r11.z * r7.w - 2.0;
    r6.z = r6.z * 2.0 + r5.y;
    r6.xyz = r6.zxy * r3.www;
    ps = 1.0 + r6.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r3.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r11.xyz = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r0.w));
    r5.y = dot(r11.zxy, r11.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r6.xxx * r1.xyz;
    r5.y = ps;
    r1.xyz = r11.xyz * r5.yyy;
    r5.y = dot(r1.zxy, r10.zxy);
    r11.xyz = r1.xyz * r5.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r5.y = saturate(dot(r6.zxy, r10.zxy));
    ps = log2(r5.y);
    r6.w = saturate(dot(r1.zyx, r6.zyx));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r0.xyz = r0.xyz * r9.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.z = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r5.y;
    r0.w = ps;
    r0 = r0 * r8.xyzx;
    r1.xyz = r0.xyz * r2.www - r4.xyz;
    r0.xyz = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r0.xyz = r0.www * r1.www + r0.xyz;
    r1.xyz = r1.xyz * r7.www + r4.xyz;
    ps = LightColor.x * r5.z;
    r1.xyz = r1.xyz * r3.xyz;
    r6.x = ps;
    ps = LightColor.y * r5.x;
    r0.xyz = r2.xxx * r0.xyz;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r0.xyz = r0.xyz * r7.www;
    r5.y = ps;
    ps = LightColor.z * r5.w;
    r0.xyz = r0.xyz * r5.yyy;
    r6.z = ps;
    r5.xy = r1.xy * r6.ww + r0.xy;
    r5.z = r1.z * r6.w + r0.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
