// ps_09433fab72aa9658.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040D00 00000706 00000000 000050E7 007F007F 00000001 00003050 00003151 00003252 00007354 0000F455 00007556 0000F657
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float2 vPos : VPOS;   // r7 (pixel parameters)
    float vFace : VFACE;  // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.xy = r0.xy * UniformScalar_0.xx;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.z = UniformScalar_1.x * 4.0;
    r1.w = ps;
    ps = 1.0 / r6.w;
    r4.xy = r6.xy * ScreenPositionScaleBias.xy;
    r2.w = ps;
    r4.xy = r4.xy * r2.ww + ScreenPositionScaleBias.wz;
    ps = r2.z;
    r1.xy = r1.xy * UniformScalar_4.xx;
    ps = r2.x * ps;
    r1.zw = r1.zw * abs(r7.xy);
    r4.z = ps;
    ps = UniformScalar_1.x * r2.y;
    r10.z = saturate(r6.w * 0.0001);
    r4.w = ps;
    r9.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r11.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r1.w = tex2D(Texture2D_2, r2.xy).x;
    r2.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_5, r4.zw).xyz;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r4.zw).xyz;
    r0.yzw = tex2D(Texture2D_3, r0.zw).wxy;
    r1.xyz = tex2D(LightAttenuationTexture, r4.xy).zxy;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_1.x * UniformVector_1.w;
    r2.x = dot(r5.zxy, r5.zxy);
    r10.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r3.w = dot(r3.zxy, r3.zxy);
    r10.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r0.x = r3.z + 0.1;
    r10.w = ps;
    r8.xy = r0.zw * 2.0 - 1.0;
    r12.xyz = r12.xyz * 2.0 - 1.0;
    r6.xyz = r7.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r3.w));
    r13.xyz = -r2.yzw + r13.xyz;
    r0.z = ps;
    ps = 5.0 * r0.x;
    r7.xyz = r0.zzz * r3.xyz;
    r0.x = saturate(ps);
    r2.yzw = r13.xyz * r1.www + r2.yzw;
    ps = 1.0 - r0.x;
    r3.xyz = r12.xyz - r6.xyz;
    r0.z = ps;
    r6.xy = r3.xy * r1.ww + r6.xy;
    r0.x = r3.z * r1.w - 2.0;
    ps = ModShadowGroupColor.x * r0.z;
    r2.yzw = r10.xyw * r2.yzw;
    r10.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r2.yzw = r2.yzw * r11.xyz;
    r10.y = ps;
    r3.y = r7.w * 2.0 + r0.x;
    ps = (-1.0) + r0.y;
    r0.xzw = -r10.xzy + 1.0;
    r3.x = ps;
    r6.zw = r3.yx * r0.zz + 1.0;
    ps = UniformScalar_3.x * r0.z;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = ps;
    r6.xy = r0.yy * r8.xy + r6.xy;
    r6.xy = r6.xy * r0.zz;
    r6 = (r0.yzzz > 0.0) ? r6.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r8 = (r0.yzzz >= 0.0) ? r6 : float4(1.0, 0.0, 0.0, 1.0);
    r1.w = dot(r8.wyz, r8.wyz);
    ps = rsqrt(abs(r2.x));
    r10.xyz = r2.yzw * r8.xxx;
    r2.x = ps;
    r6.xyz = r10.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r1.w));
    r2.yzw = r2.xxx * r5.xyz;
    r1.w = ps;
    r8.xyz = r8.yzw * r1.www;
    r1.w = dot(r8.zxy, r2.wyz);
    ps = LightColor.x * r1.y;
    r5.xyz = r8.xyz * r1.www;
    r2.x = ps;
    r2.yzw = r5.xyz * 2.0 - r2.yzw;
    ps = LightColor.y * r1.z;
    r1.w = saturate(dot(r7.zxy, r2.wyz));
    r2.y = ps;
    ps = log2(r1.w);
    r3.xyz = r10.xyz * r3.xyz;
    r9.x = ps;
    ps = LightColor.z * r1.x;
    r5.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r2.z = ps;
    ps = pow(2.0, r5.x);
    r1.w = saturate(dot(r8.zyx, r7.zyx));
    r1.x = ps;
    r0.xy = r5.yz * r0.xw + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r6.xyz * r1.xxx;
    r0.x = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xy = r3.xy * r1.ww + r1.xy;
    r1.z = r3.z * r1.w + r1.z;
    r1.xyz = r2.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
