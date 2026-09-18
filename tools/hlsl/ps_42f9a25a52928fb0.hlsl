// ps_42f9a25a52928fb0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040C00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c9); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
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
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r2.x = float((UniformScalar_0.x > UniformScalar_1.x));
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r2.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.w = dot(r3.zxy, r3.zxy);
    r2.y = ps;
    r2.yz = r2.yz * abs(r5.xy);
    r0.zw = r0.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.zw).zxy;
    r9.xy = tex2D(ModShadowAccumTexture, r2.yz).xy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r2.yzw = -UniformVector_0.xyz + 1.0;
    r1.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    ps = r1.z;
    r4.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r9.xy = r9.xy * 0.875;
    r0.w = ps;
    r12.xyz = r8.xyz * 2.0 - 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.w));
    r11.xyz = r10.xyz * r5.xyz;
    r4.w = ps;
    ps = rsqrt(abs(r3.w));
    r5.xyz = r4.www * r1.xyz;
    r1.x = ps;
    ps = 5.0 * r0.w;
    r8.xyz = r1.xxx * r3.xyz;
    r0.w = saturate(ps);
    ps = 1.0 - r0.w;
    r1.xyz = r12.xyz - r6.xyz;
    r0.w = ps;
    r3.xyz = (-abs(r2.xxx) >= 0.0) ? r10.xyz : r11.xyz;
    r3.xyz = (-abs(r1.www) >= 0.0) ? r10.xyz : r3.xyz;
    r6.xyz = r1.xyz * UniformScalar_0.xxx + r6.xyz;
    r1.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r1.yz = r9.xy * r1.xy + 0.125;
    r0.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r0.w));
    r3.xyz = r3.xyz - r4.xyz;
    r0.w = ps;
    r4.xyz = r3.xyz * UniformScalar_0.xxx + r4.xyz;
    r3.xyz = r4.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = UniformScalar_7.x;
    r6.xyz = r6.xyz * r0.www;
    r1.x = ps;
    ps = 0.0001;
    r0.w = dot(r6.zxy, r8.zxy);
    r1.w = ps;
    ps = max(r1.x, r1.w);
    r9.xyz = r6.xzy * r0.www;
    r1.x = ps;
    r8.xyz = r9.xyz * 2.0 - r8.xzy;
    ps = LightColor.x * r0.y;
    r0.w = saturate(dot(r5.zxy, r8.yxz));
    r2.x = ps;
    ps = log2(r0.w);
    r4.xyz = r4.xyz * r2.yzw;
    r1.w = ps;
    ps = LightColor.z * r0.x;
    r1.xw = r1.yx * r1.zw;
    r2.y = ps;
    r1.xyz = r1.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r0.w = saturate(dot(r6.zxy, r5.zxy));
    r1.w = ps;
    ps = LightColor.y * r0.z;
    r3.xyz = r3.xyz * r1.www;
    r2.z = ps;
    r0.xy = r4.xy * r0.ww + r3.xy;
    r0.z = r4.z * r0.w + r3.z;
    r0.xyz = r2.xzy * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
