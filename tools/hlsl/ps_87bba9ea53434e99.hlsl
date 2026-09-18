// ps_87bba9ea53434e99.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r2.zw = UniformVector_2.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = float((UniformScalar_1.x > UniformScalar_0.x));
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_4, r2.zw).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.x = tex2D(Texture2D_3, r0.xy).x;
    r0.y = dot(r3.zxy, r3.zxy);
    r0.z = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.z));
    r7.xy = r4.xy * 0.875;
    r2.w = ps;
    ps = rsqrt(abs(r0.y));
    r0.w = saturate(r2.w * r1.z);
    r3.w = ps;
    r7.z = max(UniformScalar_9.x, 0.0001);
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = float((UniformScalar_1.x >= UniformScalar_0.x));
    r2.xyz = r2.xzy * LightColor.xzy;
    ps = r1.z;
    r8.xyz = r8.xyz * UniformVector_1.xyz;
    ps = 0.1 + ps;
    r5.xyz = r5.xyz * r0.xxx;
    r0.z = ps;
    ps = 5.0 * r0.z;
    r9.xyz = r11.xyz * r9.xyz;
    r0.y = saturate(ps);
    r10.xyz = (-abs(r6.www) >= 0.0) ? r11.xyz : r9.xyz;
    ps = 1.0 - r0.y;
    r3.xyz = r3.www * r3.zxy;
    r0.y = ps;
    ps = -r3.y;
    r9.xyz = r2.www * r1.zxy;
    r3.y = ps;
    r3.x = r3.x * 2.0 - r3.x;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r11.xyz : r10.xyz;
    r0.yz = -r0.yy * ModShadowGroupColor.xy + 1.0;
    r7.xy = r7.xy * r0.yz + 0.125;
    ps = -r3.z;
    r1.yzw = -r8.xyz + r1.xyz;
    r3.z = ps;
    ps = 1.0 - r0.x;
    r1.x = saturate(dot(r9.yzx, r3.yzx));
    r5.w = ps;
    r0.xyz = r1.yzw * UniformScalar_1.xxx + r8.xyz;
    r1.yzw = r0.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = log2(r1.x);
    r3 = r5.xzwy * r0.xzzy;
    r7.w = ps;
    r5.xy = r5.ww * r0.xy + r3.xw;
    ps = r3.y + r3.z;
    r3.xw = r7.xz * r7.yw;
    r5.z = ps;
    r0.xyz = r3.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r3.w);
    r3.xyz = r5.xyz * r4.xyz;
    r1.x = ps;
    r1.xyz = r1.ywz * r1.xxx;
    r1.y = r3.z * r0.w + r1.y;
    r1.xz = r3.xy * r0.ww + r1.xz;
    r1.xyz = r2.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
