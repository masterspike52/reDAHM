// ps_98d2c6860bf9177e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040E00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r1.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = float((UniformScalar_0.x > UniformScalar_1.x));
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r0.y = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 - r5.y;
    r0.w = dot(r1.zxy, r1.zxy);
    r0.z = saturate(ps);
    ps = 0.875 * r5.x;
    r14.xyz = r13.zxy + float3(-2.0, 0.0, 0.0);
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r6.yzw = r12.xyz * r6.yzw;
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r0.www * r1.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r5.y));
    r3.xyz = r0.yyy * r3.xyz;
    r5.y = ps;
    ps = 0.875 * r5.z;
    r11.xyz = r5.yyy * -SpotDirection.xyz;
    r0.y = ps;
    r6.yzw = (-abs(r5.www) >= 0.0) ? r12.xyz : r6.yzw;
    ps = log2(r0.z);
    r5.xzw = r14.yzx + r13.xyz;
    r5.y = ps;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r12.xyz : r6.yzw;
    ps = 5.0 * r6.x;
    r6.yzw = r5.xzw + float3(-1.0, -1.0, 0.0);
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.z = dot(r11.zxy, r2.zxy);
    r5.x = ps;
    r5.xw = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r0.xy = r0.xy * r5.xw + 0.125;
    ps = -SpotAngles.x - -r5.z;
    r6.xyz = r6.wyz * UniformScalar_0.xxx;
    r5.x = ps;
    ps = 1.0 + r6.x;
    r1.xyz = r1.xyz - r10.xyz;
    r6.w = ps;
    r2.xyz = r1.xyz * UniformScalar_0.xxx + r10.xyz;
    r1.xyz = r2.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = SpotAngles.y * r5.x;
    r0.z = dot(r6.wyz, r6.wyz);
    r0.w = saturate(ps);
    r0.xy = r0.xw * r0.yw;
    r5.xzw = r0.xxx * r9.xyz + ModShadowColor.xyz;
    ps = rsqrt(abs(r0.z));
    r2.xyz = r2.xyz * r8.xyz;
    r0.z = ps;
    ps = UniformScalar_9.x;
    r6.xzw = r6.yzw * r0.zzz;
    r0.z = ps;
    ps = 0.0001;
    r6.y = dot(r6.wxz, r3.zxy);
    r0.w = ps;
    ps = max(r0.z, r0.w);
    r8.xyz = r6.xwz * r6.yyy;
    r2.w = ps;
    r3.xyz = r8.xyz * 2.0 - r3.xzy;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r6.y = saturate(dot(r7.zxy, r3.yxz));
    r5.y = ps;
    ps = log2(r6.y);
    r6.x = saturate(dot(r6.wxz, r7.zxy));
    r6.y = ps;
    ps = pow(2.0, r5.y);
    r6 = r2 * r6.xxxy;
    r5.y = ps;
    ps = pow(2.0, r6.w);
    r0.z = ps;
    r6.xy = r1.xy * r0.zz + r6.xy;
    r6.z = r1.z * r0.z + r6.z;
    r6.xyz = r6.xyz * r5.yyy;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.yyy;
    r5.xyz = r6.xzy * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
