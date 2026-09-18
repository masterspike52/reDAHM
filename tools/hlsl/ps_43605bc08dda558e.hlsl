// ps_43605bc08dda558e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040900 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_7 : register(c4); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.z = 1.0 / r4.w;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r2.y = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = 1.0 / ModShadowAccumResolution.x;
    r2.xy = r2.xy * abs(r5.xy);
    r0.zw = r0.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyw = tex2D(Texture2D_3, r0.xy).yzx;
    r1.w = tex2D(Texture2D_1, r0.xy).x;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.yzw = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r2.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r5.xyw = -UniformVector_0.xyz + 1.0;
    r8.x = UniformScalar_9.x;
    r2.w = dot(r1.zxy, r1.zxy);
    r8.y = 0.0001;
    r0.x = r1.z + 0.1;
    r5.z = max(r8.x, r8.y);
    r3.w = dot(r3.zxy, r3.zxy);
    r2.z = 0.875 * r2.x;
    r9.xyz = r7.xyz * 2.0 - 1.0;
    r1.w = -r1.w + 1.0;
    r3.w = rsqrt(abs(r3.w));
    r7.xyz = r3.www * r3.xyz;
    r2.w = rsqrt(abs(r2.w));
    r8.xyz = r2.www * r1.xyz;
    r2.w = 0.875 * r2.y;
    r1.xyz = r1.www * r4.wxy;
    r0.x = saturate(5.0 * r0.x);
    r2.y = dot(r9.zxy, r9.zxy);
    r2.x = 1.0 - r0.x;
    r4.xyz = r1.xyz * r5.xyw;
    r0.x = rsqrt(abs(r2.y));
    r2.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    r5.xy = r2.zw * r2.xy + 0.125;
    r3.xzw = r9.xyz * r0.xxx;
    r2.x = LightColor.x * r0.y;
    r2.w = saturate(dot(r3.wxz, r8.zxy));
    r0.y = r1.w;
    ps = UniformScalar_7.x * r0.y;
    r0.x = dot(r3.wxz, r7.zxy);
    r3.y = ps;
    ps = UniformScalar_7.x * r1.y;
    r9.xyz = r3.xwz * r0.xxx;
    r3.z = ps;
    r7.xyz = r9.xyz * 2.0 - r7.xzy;
    ps = UniformScalar_7.x * r1.z;
    r0.x = saturate(dot(r8.zxy, r7.yxz));
    r3.w = ps;
    ps = log2(r0.x);
    r3.x = r3.y * r4.w;
    r5.w = ps;
    ps = LightColor.z * r0.w;
    r1.xw = r5.xz * r5.yw;
    r2.y = ps;
    r1.xyz = r1.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r3.xyz = r3.xwz + UniformScalar_8.xxx;
    r0.x = ps;
    ps = LightColor.y * r0.z;
    r3.xyz = r3.xzy * r0.xxx;
    r2.z = ps;
    r0.xy = r4.xy * r2.ww + r3.xy;
    r0.z = r4.z * r2.w + r3.z;
    r0.xyz = r2.xzy * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
