// ps_2c96937dda90e89b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040B00 0000090A 00000000 00008929 003F01FF 00000001 0000F050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.y = r0.w * UniformVector_2.x;
    r7.w = 1.0 / ModShadowAccumResolution.y;
    r6.w = -r0.z + 1.0;
    r6.z = 1.0 / r5.w;
    r7.y = dot(r2.zxy, r2.zxy);
    r7.x = ScreenPositionScaleBias.x * r6.z;
    r6.x = r2.z + 0.1;
    r7.z = 1.0 / ModShadowAccumResolution.x;
    r8.xz = r7.zw * abs(r9.xy);
    r8.y = rsqrt(abs(r7.y));
    r7.w = dot(r4.zxy, r4.zxy);
    r7.y = ScreenPositionScaleBias.y * r6.z;
    r9.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.w));
    r7.xyz = r8.yyy * r2.zxy;
    r6.z = ps;
    ps = UniformVector_2.y * r6.w;
    r1.xyw = r6.zzz * r4.xyz;
    r6.z = ps;
    ps = (-0.5) + r6.y;
    r4.xy = r7.yz * -r1.xy;
    r4.z = ps;
    ps = (-0.5) + r6.z;
    r9.zw = float2((r6.yz >= 0.5));
    r4.w = ps;
    r4.zw = r4.zw - r6.yz;
    r4.zw = r4.zw * r9.zw + r6.yz;
    r5.xyw = r4.zwx + r4.zwy;
    r7.yzw = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r11 = tex2D(Texture2D_2, r5.xy);
    r4 = tex2D(Texture2D_1, r0.xy);
    r6.yw = tex2D(ModShadowAccumTexture, r8.xz).xy;
    ps = 0.875 * r6.y;
    r8.x = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = 0.875 * r6.w;
    r0.w = saturate(-r8.x + 1.0);
    r9.y = ps;
    ps = 5.0 * r6.x;
    r6.z = -r4.w + 1.0;
    r6.x = saturate(ps);
    ps = rsqrt(abs(r8.x));
    r8.w = saturate(r8.y * r2.z);
    r6.w = ps;
    ps = r4.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = UniformScalar_0.x * r6.y;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    r8.xyz = r6.zzz * UniformVector_1.xyz + r6.yyy;
    ps = log2(r0.w);
    r6.z = -r6.x + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.yzw = r6.www * -SpotDirection.xyz;
    r2.x = ps;
    r6.w = r1.w * 2.0 - r1.w;
    ps = ModShadowGroupColor.y * r6.z;
    r6.y = dot(r2.wyz, r3.zxy);
    r2.y = ps;
    ps = -SpotAngles.x - -r6.y;
    r0.w = dot(r9.zww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r6.y = (r0.w == 0.0) ? r11.x : r11.y;
    ps = SpotAngles.y * r6.z;
    r2.zw = r0.ww + float2(-3.0, -2.0);
    r9.z = saturate(ps);
    r6.y = (r2.w == 0.0) ? r11.z : r6.y;
    r2.z = (r2.z == 0.0) ? r11.w : r6.y;
    r7.x = saturate(r7.x * r6.w + r5.w);
    ps = log2(r7.x);
    r6.yzw = -r2.xyz + 1.0;
    r10.x = ps;
    r0.w = saturate(r6.w * 2.5 - 0.5);
    r9.xy = r9.xy * r6.yz + 0.125;
    ps = r9.x * r9.y;
    r2 = r10.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    r6.y = ps;
    ps = r9.z * r9.z;
    r3.xyz = r2.xyz * r4.www;
    r7.x = ps;
    r6.yzw = r6.yyy * r5.xyz + ModShadowColor.xyz;
    r8.xyz = r3.xyz * UniformScalar_1.xxx + r8.xyz;
    r3.xyz = r4.xyz * 2e+01 + r3.xyz;
    r2.xyz = r3.xyz - r1.xyz;
    ps = pow(2.0, r2.w);
    r3.xyz = r8.xyz * r0.www;
    r8.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r8.xyz = r3.xyz * r8.xxx;
    r6.x = ps;
    r1.xyz = r2.xyz * r0.www + r1.xyz;
    ps = pow(2.0, r6.x);
    r0.xyz = r1.xyz * r0.xyz;
    r6.x = ps;
    r8.xy = r0.xy * r8.ww + r8.xy;
    r8.z = r0.z * r8.w + r8.z;
    r8.xyz = r8.xyz * r6.xxx;
    r7.yzw = r8.xyz * r7.yzw;
    r7.yzw = r7.yzw * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.ywz * r7.xxx;
    r6.xyz = r7.xzy * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
