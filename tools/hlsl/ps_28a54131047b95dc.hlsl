// ps_28a54131047b95dc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003E4 10041100 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = ps;
    ps = 1.0 / r4.w;
    r6.xy = r0.xy * UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.zw = r5.zw * abs(r8.xy);
    r8.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r11.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r10.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r12.xw = tex2D(Texture2D_5, r0.xy).xy;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = r1.z;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r0.x = dot(r3.zxy, r3.zxy);
    r0.y = ps;
    r8.w = r5.x * UniformScalar_9.x + UniformScalar_10.x;
    ps = r12.x + r12.w;
    r17.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r15.z = ps;
    r14.xyz = r6.xzy * 2.0 - 1.0;
    ps = r5.w + r5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = 1.0 - r5.x;
    r15.xyw = UniformVector_3.xyz * UniformVector_3.www;
    r6.w = saturate(ps);
    ps = 4.0 * r5.y;
    r10.xyz = r10.xyz + r10.xyz;
    r6.x = ps;
    ps = 4.0 * r5.z;
    r7.xyz = r7.xyz * r2.www;
    r6.y = ps;
    r13.xyz = (-abs(r0.zzz) >= 0.0) ? UniformVector_4.xyz : r15.xyw;
    r16.xyz = (-abs(r0.zzz) >= 0.0) ? UniformVector_6.xyz : r17.xyz;
    ps = rsqrt(abs(r0.x));
    r5.z = saturate(r0.y * 5.0);
    r5.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r5.yyy * r3.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    r1.yzw = (-abs(r7.www) >= 0.0) ? r17.xyz : r16.xyz;
    r13.xyz = (-abs(r7.www) >= 0.0) ? r15.xyw : r13.xyz;
    ps = log2(r6.w);
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r16.xyz = r5.yyy * -SpotDirection.xyz;
    r15.x = ps;
    ps = (-2.0) + r6.x;
    r12.xyz = r13.xyz * r12.xxx;
    r1.x = ps;
    ps = (-2.0) + r6.y;
    r13.xyz = r1.yzw * r12.www;
    r1.y = ps;
    ps = (-1.0) + r6.z;
    r5.y = dot(r16.zxy, r2.zxy);
    r1.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.xyz = -r14.xyz + r1.xzy;
    r15.y = ps;
    ps = UniformScalar_15.x;
    r1.xyz = -r15.zxy + 1.0;
    r6.yzw = r6.xzy * UniformScalar_2.xxx + r14.xzy;
    ps = -UniformScalar_14.x + ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r2.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r2.xyz = r1.xxx * r11.xyz;
    r7.w = ps;
    r5.yzw = r13.xyz * r11.xyz + r2.xyz;
    ps = rsqrt(abs(r6.x));
    r1.x = saturate(r7.w * SpotAngles.y);
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.yzw = r6.ywz * r6.xxx;
    r6.x = ps;
    r5.yzw = r12.xyz * r11.xyz + r5.yzw;
    r2.xyz = r5.yzw * r10.xyz - r5.yzw;
    ps = pow(2.0, r6.x);
    r5.x = dot(r6.zyw, r6.zyw);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r7.xzy * r6.xxx;
    r6.x = ps;
    r5.x = r2.w * UniformScalar_2.x + UniformScalar_14.x;
    r5.yzw = r2.xyz * UniformScalar_2.xxx + r5.yzw;
    r2.xyz = r6.ywz * r6.xxx;
    r6.w = saturate(dot(r2.zxy, r3.zxy));
    r6.xyz = r5.yzw * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r7.w = dot(r2.zxy, r0.zxy);
    ps = r5.x;
    r2.yzw = r2.xzy * r7.www;
    r2.x = ps;
    r0.xyz = r2.yzw * 2.0 - r0.xzy;
    ps = 0.0001;
    r5.x = saturate(dot(r3.zxy, r0.yxz));
    r2.y = ps;
    ps = log2(r5.x);
    r5.yzw = r5.yzw - UniformVector_2.xyz;
    r8.z = ps;
    ps = max(r2.x, r2.y);
    r0.xyw = r8.xyz * float3(0.875, 0.875, 4e+02);
    r5.x = ps;
    r5 = r5.yxwz * r8.wzww;
    r1.yz = r0.xy * r1.yz + 0.125;
    r2.xyz = r5.xwz + UniformVector_2.xyz;
    ps = pow(2.0, r0.w);
    r0.xyz = r2.xyz * r9.xyz;
    r7.w = ps;
    r6.xyz = r7.www * UniformScalar_8.xxx + r6.xyz;
    r5.xw = r1.yx * r1.zx;
    ps = pow(2.0, r5.y);
    r1.xyz = r6.xyz * r8.www;
    r6.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
