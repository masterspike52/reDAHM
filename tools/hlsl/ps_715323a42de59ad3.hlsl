// ps_715323a42de59ad3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040E00 00000706 00000000 000050E7 007F007F 00000001 00003050 00003151 00003252 00007354 0000F455 00007556 0000F657
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

float4 LightColorAndFalloffExponent : register(c12); // float4
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
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_1.x * r2.y;
    r0.zw = r0.xy * UniformScalar_2.xx;
    r1.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.xy = r0.xy * UniformScalar_0.xx;
    r2.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = UniformScalar_1.x * 4.0;
    r2.w = ps;
    ps = 1.0 / r6.w;
    r8.xy = r6.xy * ScreenPositionScaleBias.xy;
    r3.w = ps;
    r8.xy = r8.xy * r3.ww + ScreenPositionScaleBias.wz;
    ps = r1.z;
    r1.xy = r1.xy * UniformScalar_4.xx;
    ps = r2.x * ps;
    r2.zw = r2.zw * abs(r7.xy);
    r1.z = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r2.zw).xy;
    r11.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r2.w = tex2D(Texture2D_2, r2.xy).x;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_5, r1.zw).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r1.zw).xyz;
    r1.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    ps = r6.w;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r0.x = r3.z + 0.1;
    r10.x = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r0.w = dot(r5.zxy, r5.zxy);
    r10.y = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r0.z = dot(r3.zxy, r3.zxy);
    r10.z = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r0.y = dot(r4.zxy, r4.zxy);
    r10.w = ps;
    r9.xw = r1.yz * 2.0 - 1.0;
    r12.xyz = r12.xyz * 2.0 - 1.0;
    r4.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r1.yzw = -r13.xyz + r14.xyz;
    r0.z = ps;
    ps = 5.0 * r0.x;
    r6.xyz = r0.zzz * r3.xyz;
    r0.x = saturate(ps);
    r1.yzw = r1.yzw * r2.www + r13.xyz;
    ps = 1.0 - r0.x;
    r3.xyz = r12.xyz - r4.xyz;
    r0.z = ps;
    r8.xy = r3.xy * r2.ww + r4.xy;
    r0.x = r3.z * r2.w - 2.0;
    ps = ModShadowGroupColor.x * r0.z;
    r1.yzw = r10.yzw * r1.yzw;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r4.xyz = r1.yzw * r11.xyz;
    r10.z = ps;
    r0.z = r8.z * 2.0 + r0.x;
    ps = (-1.0) + r1.x;
    r1.yzw = -r10.xyz + 1.0;
    r0.x = ps;
    r8.zw = r0.zx * r1.yy + 1.0;
    ps = UniformScalar_3.x * r1.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    r0.xz = r1.xx * r9.xw + r8.xy;
    r8.xy = r0.xz * r1.yy;
    r8 = (r1.xyyy > 0.0) ? r8.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r10 = (r1.xyyy >= 0.0) ? r8 : float4(1.0, 0.0, 0.0, 1.0);
    r2.w = dot(r10.wyz, r10.wyz);
    ps = rsqrt(abs(r0.w));
    r8.xyz = r4.xyz * r10.xxx;
    r0.x = ps;
    r4.xyz = r8.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r2.w));
    r0.xzw = r0.xxx * r5.xyz;
    r2.w = ps;
    r5.xyz = r10.yzw * r2.www;
    r2.w = dot(r5.zxy, r0.wxz);
    ps = 1.0 - r0.y;
    r10.xyz = r5.xyz * r2.www;
    r0.y = saturate(ps);
    r0.xzw = r10.xyz * 2.0 - r0.xzw;
    ps = log2(r0.y);
    r0.x = saturate(dot(r6.zxy, r0.wxz));
    r0.y = ps;
    ps = log2(r0.x);
    r0.y = r0.y * LightColorAndFalloffExponent.w;
    r9.x = ps;
    r0.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r0.z);
    r2.xyz = r8.xyz * r2.xyz;
    r0.z = ps;
    r0.xw = r0.xw * r1.zw + 0.125;
    ps = r0.x * r0.w;
    r1.w = saturate(dot(r5.zyx, r6.zyx));
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r4.xyz * r0.zzz;
    r0.w = ps;
    r0.xyz = r0.xxx * r3.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r7.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
