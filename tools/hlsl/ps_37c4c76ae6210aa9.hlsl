// ps_37c4c76ae6210aa9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003F0 10041100 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_15 : register(c18); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D Texture2D_5 : register(s4);
sampler2D Texture2D_6 : register(s5);
sampler2D Texture2D_7 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = ps;
    ps = 1.0 / r4.w;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r6.zw = r0.xy * UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = UniformScalar_15.x - UniformScalar_14.x;
    r5.y = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r6.xy = r5.yw * abs(r8.xy);
    r5.y = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r10.xyz = tex2D(Texture2D_6, r6.zw).xyz;
    r8.yzw = tex2D(Texture2D_7, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r11.xw = tex2D(Texture2D_5, r0.xy).xy;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    ps = r1.z;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r3.w = dot(r3.zxy, r3.zxy);
    r4.w = ps;
    r7.w = r5.x * UniformScalar_9.x + UniformScalar_10.x;
    ps = r11.x + r11.w;
    r12.zw = r11.yz * 0.875;
    r13.x = ps;
    r14.xyz = r9.xyz * 2.0 - 1.0;
    ps = r5.w + r5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r17.z = ps;
    ps = 1.0 - r5.x;
    r16.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r6.w = saturate(ps);
    ps = 4.0 * r5.y;
    r13.yzw = UniformVector_5.xyz * UniformVector_5.www;
    r17.x = ps;
    ps = 4.0 * r5.z;
    r9.xyz = r8.yzw + r8.yzw;
    r17.y = ps;
    r0.xyz = (-abs(r8.xxx) >= 0.0) ? UniformVector_6.xyz : r13.yzw;
    r15.xyz = (-abs(r8.xxx) >= 0.0) ? UniformVector_4.xyz : r16.xyz;
    ps = rsqrt(abs(r3.w));
    r5.z = saturate(r4.w * 5.0);
    r5.y = ps;
    ps = rsqrt(abs(r1.w));
    r8.xyz = r5.yyy * r3.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    r16.xyz = (-abs(r0.www) >= 0.0) ? r16.xyz : r15.xyz;
    r0.xyw = (-abs(r0.www) >= 0.0) ? r13.yzw : r0.xyz;
    ps = log2(r6.w);
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r15.xyz = r5.yyy * -SpotDirection.xyz;
    r13.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r17.xyz + float3(-2.0, -2.0, -1.0);
    r13.z = ps;
    ps = r0.x;
    r11.xyz = r16.xyz * r11.xxx;
    ps = r11.w * ps;
    r5.y = dot(r15.zxy, r2.zxy);
    r12.x = ps;
    ps = r0.y;
    r1.xyz = r1.xyz - r14.xyz;
    r0.xyz = r1.xyz * UniformScalar_2.xxx + r14.xyz;
    ps = r11.w * ps;
    r1.xyz = -r13.xyz + 1.0;
    r12.y = ps;
    r2.xy = r12.zw * r1.yz + 0.125;
    ps = r0.w;
    r5.z = dot(r0.zxy, r0.zxy);
    ps = r11.w * ps;
    r1.xyz = r1.xxx * r10.xyz;
    r12.z = ps;
    r1.xyz = r12.xyz * r10.xyz + r1.xyz;
    ps = rsqrt(abs(r5.z));
    r5.w = r2.x * r2.y;
    r5.z = ps;
    r6.xyz = r5.www * r6.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r5.zzz;
    r1.xyz = r11.xyz * r10.xyz + r1.xyz;
    r9.xyz = r1.xyz * r9.xyz - r1.xyz;
    ps = -SpotAngles.x - -r5.y;
    r5.z = dot(r0.zxy, r0.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(r5.y * SpotAngles.y);
    r5.z = ps;
    r0.w = r9.w * UniformScalar_2.x + UniformScalar_14.x;
    r1.xyz = r9.xyz * UniformScalar_2.xxx + r1.xyz;
    r2.xyz = r0.xyz * r5.zzz;
    r5.w = saturate(dot(r2.zxy, r3.zxy));
    r0.xyz = r1.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.z = dot(r2.zxy, r8.zxy);
    r1.xyz = r1.xyz - UniformVector_2.xyz;
    r1.xyz = r1.xyz * r7.www + UniformVector_2.xyz;
    r2.xyz = r2.xzy * r5.zzz;
    r2.xyz = r2.xyz * 2.0 - r8.xzy;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.z = saturate(dot(r3.zxy, r2.yxz));
    r6.w = ps;
    ps = log2(r5.z);
    r5.x = max(r0.w, 0.0001);
    r5.z = ps;
    ps = 4e+02 * r5.z;
    r1.xyz = r1.xyz * r4.xyz;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r5.xy = r5.yx * r5.yz;
    r5.z = ps;
    r0.xyz = r5.zzz * UniformScalar_8.xxx + r0.xyz;
    ps = pow(2.0, r5.y);
    r0.xyz = r0.xyz * r7.www;
    r5.z = ps;
    ps = pow(2.0, r6.w);
    r0.xyz = r0.xyz * r5.zzz;
    r5.z = ps;
    r0.xy = r1.xy * r5.ww + r0.xy;
    r0.z = r1.z * r5.w + r0.z;
    r0.xyz = r0.xyz * r5.zzz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r7.xzy * r5.xxx;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
