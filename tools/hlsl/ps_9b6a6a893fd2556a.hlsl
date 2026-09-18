// ps_9b6a6a893fd2556a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040B00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * 0.5;
    r5.yz = tex2D(Texture2D_0, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10 = tex2D(Texture2D_2, r0.xy);
    ps = 0.1 - -r1.z;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = float((r10.w >= 0.5));
    r5.x = ps;
    r0.xyz = r7.xyz * 2.0 - 1.0;
    r5.yz = r5.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r5.yz * 0.012;
    r5.y = ps;
    ps = 1.0 / r4.w;
    r5.zw = r5.xy * abs(r8.xy);
    r6.z = ps;
    r11.xy = r0.xy * UniformVector_2.xy - r7.xy;
    r5.xy = r11.zw * r6.zz + ScreenPositionScaleBias.wz;
    r9.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).zxy;
    ps = -UniformVector_0.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = r4.w;
    r7.z = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r4.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r0.y = saturate(ps);
    ps = UniformScalar_1.x * r6.y;
    r8.yzw = r4.zxy * r10.zxy;
    r5.w = ps;
    r8.x = r0.z * UniformVector_2.z - 1.0;
    ps = rsqrt(abs(r7.z));
    r6.xz = -r6.yx + 1.0;
    r7.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r4.xyz = r7.zzz * r1.xyz;
    r0.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r10 = r8.zwxy * r6.yyyy;
    r0.w = ps;
    r1.xyz = r6.xxx * UniformVector_3.xyz + r5.www;
    r1.xyz = r10.xyw * UniformScalar_2.xxx + r1.xyz;
    r7.xy = r11.xy * r6.yy + r7.xy;
    ps = -UniformVector_0.y;
    r6.xyz = -r0.yzw + 1.0;
    ps = 1.0 + ps;
    r7.xy = r7.xy * r6.xx;
    r0.y = ps;
    r7.z = r10.z * r6.x + 1.0;
    r7.xyz = (r6.xxx > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r8.xyz = (r6.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.w = dot(r8.zxy, r8.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r7.yzw = r6.www * r3.xyz;
    r5.w = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r8.xyz * r5.www;
    ps = 1.0 + ps;
    r5.w = dot(r8.zxy, r7.wyz);
    r0.z = ps;
    ps = LightColor.x * r5.y;
    r3.xyz = r8.xzy * r5.www;
    r7.x = ps;
    r7.yzw = r3.xyz * 2.0 - r7.ywz;
    ps = LightColor.z * r5.x;
    r5.w = saturate(dot(r4.zxy, r7.zyw));
    r7.y = ps;
    ps = log2(r5.w);
    r0.xyz = r10.xyw * r0.xyz;
    r9.x = ps;
    ps = LightColor.y * r5.z;
    r3.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r7.z = ps;
    ps = pow(2.0, r3.x);
    r5.w = saturate(dot(r8.zxy, r4.zxy));
    r5.z = ps;
    r5.xy = r3.yz * r6.yz + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r1.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
