// ps_ded72a084659959c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040C00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c9); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * 0.5;
    r7.xy = tex2D(Texture2D_0, r5.xy).xy;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11 = tex2D(Texture2D_2, r0.xy);
    ps = 0.1 - -r1.z;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = float((r11.w >= 0.5));
    r5.z = ps;
    r6.xyw = r6.xzy * 2.0 - 1.0;
    r7.xy = r7.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xy = r7.xy * 0.012;
    r5.w = ps;
    ps = 1.0 / r4.w;
    r7.zw = r5.zw * abs(r8.xy);
    r5.z = ps;
    r10.xy = r6.xw * UniformVector_2.xy - r0.xy;
    r7.xy = r10.zw * r5.zz + ScreenPositionScaleBias.wz;
    r9.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    ps = r4.w;
    r12.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = 0.0001 * ps;
    r7.xyz = r7.xyz * r2.www;
    r4.x = saturate(ps);
    ps = UniformScalar_1.x * r5.y;
    r11.yzw = r12.zxy * r11.zxy;
    r5.w = ps;
    r11.x = r6.y * UniformVector_2.z - 1.0;
    ps = rsqrt(abs(r6.x));
    r5.xz = -r5.yx + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r2.xyz = r6.xxx * r1.xyz;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1 = r11.zwxy * r5.yyyy;
    r4.z = ps;
    r6.xyz = r5.xxx * UniformVector_3.xyz + r5.www;
    r6.xyz = r1.xyw * UniformScalar_2.xxx + r6.xyz;
    r0.xy = r10.xy * r5.yy + r0.xy;
    ps = -UniformVector_0.x;
    r5.xyz = -r4.yzx + 1.0;
    ps = 1.0 + ps;
    r0.yz = r0.xy * r5.zz;
    r0.x = ps;
    r0.w = r1.z * r5.z + 1.0;
    r0.yzw = (r5.zzz > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r5.zzz >= 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.w = dot(r0.wyz, r0.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r6.www * r3.xyz;
    r5.w = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r0.yzw * r5.www;
    ps = 1.0 + ps;
    r5.w = dot(r3.zxy, r4.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r3.xzy * r5.www;
    r4.xyz = r10.xyz * 2.0 - r4.xzy;
    ps = 1.0 + ps;
    r5.w = saturate(dot(r2.zxy, r4.yxz));
    r0.z = ps;
    ps = log2(r5.w);
    r0.xyz = r1.xyw * r0.xyz;
    r9.x = ps;
    r1.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    ps = pow(2.0, r1.x);
    r5.w = saturate(dot(r3.zxy, r2.zxy));
    r5.z = ps;
    r5.xy = r1.yz * r5.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
