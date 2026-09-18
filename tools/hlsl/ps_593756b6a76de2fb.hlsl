// ps_593756b6a76de2fb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040B00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    r5.y = r0.w * UniformVector_2.x;
    r6.w = 1.0 / ModShadowAccumResolution.y;
    r5.w = -r0.z + 1.0;
    r5.z = 1.0 / r4.w;
    r6.y = dot(r1.zxy, r1.zxy);
    r6.x = ScreenPositionScaleBias.x * r5.z;
    r5.x = r1.z + 0.1;
    r6.z = 1.0 / ModShadowAccumResolution.x;
    r7.xz = r6.zw * abs(r8.xy);
    r7.y = rsqrt(abs(r6.y));
    r6.w = dot(r3.zxy, r3.zxy);
    r6.y = ScreenPositionScaleBias.y * r5.z;
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r7.yyy * r1.zxy;
    r5.z = ps;
    ps = UniformVector_2.y * r5.w;
    r3.xyw = r5.zzz * r3.xyz;
    r5.z = ps;
    ps = (-0.5) + r5.y;
    r8.xy = r6.yz * -r3.xy;
    r4.z = ps;
    ps = (-0.5) + r5.z;
    r9.zw = float2((r5.yz >= 0.5));
    r4.w = ps;
    r4.zw = r4.zw - r5.yz;
    r8.zw = r4.zw * r9.zw + r5.yz;
    r8.xyw = r8.zwx + r8.zwy;
    r6.yzw = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r3.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r11 = tex2D(Texture2D_2, r8.xy);
    r4 = tex2D(Texture2D_1, r0.xy);
    r5.yw = tex2D(ModShadowAccumTexture, r7.xz).xy;
    ps = 0.875 * r5.y;
    r7.x = dot(r2.zxy, r2.zxy);
    r9.x = ps;
    ps = 0.875 * r5.w;
    r0.w = saturate(-r7.x + 1.0);
    r9.y = ps;
    ps = 5.0 * r5.x;
    r5.z = -r4.w + 1.0;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r7.w = saturate(r7.y * r1.z);
    r5.w = ps;
    ps = r4.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = UniformScalar_0.x * r5.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r7.xyz = r5.zzz * UniformVector_1.xyz + r5.yyy;
    ps = log2(r0.w);
    r5.z = -r5.x + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1.yzw = r5.www * -SpotDirection.xyz;
    r1.x = ps;
    r5.w = r3.w * 2.0 - r3.w;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = dot(r1.wyz, r2.zxy);
    r1.y = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.w = dot(r9.zww, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r5.y = (r0.w == 0.0) ? r11.x : r11.y;
    ps = SpotAngles.y * r5.z;
    r1.zw = r0.ww + float2(-3.0, -2.0);
    r9.z = saturate(ps);
    r5.y = (r1.w == 0.0) ? r11.z : r5.y;
    r1.z = (r1.z == 0.0) ? r11.w : r5.y;
    r6.x = saturate(r6.x * r5.w + r8.w);
    ps = log2(r6.x);
    r5.yzw = -r1.xyz + 1.0;
    r10.x = ps;
    r0.w = saturate(r5.w * 2.5 - 0.5);
    r9.xy = r9.xy * r5.yz + 0.125;
    ps = r9.x * r9.y;
    r1 = r10.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    r5.y = ps;
    ps = r9.z * r9.z;
    r2.xyz = r1.xyz * r4.www;
    r6.x = ps;
    r5.yzw = r5.yyy * r8.xyz + ModShadowColor.xyz;
    r7.xyz = r2.xyz * UniformScalar_1.xxx + r7.xyz;
    r2.xyz = r4.xyz * 2e+01 + r2.xyz;
    r1.xyz = r2.xyz - r3.xyz;
    ps = pow(2.0, r1.w);
    r2.xyz = r7.xyz * r0.www;
    r7.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r7.xyz = r2.xyz * r7.xxx;
    r5.x = ps;
    r1.xyz = r1.xyz * r0.www + r3.xyz;
    ps = pow(2.0, r5.x);
    r0.xyz = r1.xyz * r0.xyz;
    r5.x = ps;
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r7.xyz = r7.xyz * r5.xxx;
    r6.yzw = r7.xyz * r6.yzw;
    r6.yzw = r6.yzw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.ywz * r6.xxx;
    r5.xyz = r6.xzy * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
