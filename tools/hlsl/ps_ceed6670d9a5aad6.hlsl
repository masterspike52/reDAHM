// ps_ceed6670d9a5aad6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041000 00000706 00000000 000058E7 007F007F 00000001 00003050 00003151 00003252 0000F354 0000F456 0000F557 0000F658
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x3)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c13); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
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
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy * UniformScalar_2.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = r0.xy * UniformScalar_0.xx;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.z = UniformScalar_1.x * 4.0;
    r0.y = ps;
    ps = r2.z;
    r1.xy = r1.xy * UniformScalar_4.xx;
    ps = r2.x * ps;
    r2.zw = r0.xy * abs(r7.xy);
    r0.x = ps;
    ps = OpacityOverride.x;
    r0.y = r2.y * UniformScalar_1.x;
    r8.z = saturate(ps);
    r11.yz = tex2D(ModShadowAccumTexture, r2.zw).xy;
    r10.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r2.w = tex2D(Texture2D_2, r2.xy).x;
    r15.xyz = tex2D(Texture2D_4, r1.zw).xyz;
    r7.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r1.xyw = tex2D(Texture2D_0, r1.zw).xyz;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    ps = r4.w;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r0.w = dot(r3.zxy, r3.zxy);
    r8.y = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r1.z = dot(r6.zxy, r6.zxy);
    r12.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r7.x = dot(r5.zxy, r5.zxy);
    r12.y = ps;
    r11.xw = r0.yz * 2.0 - 1.0;
    r14.xyz = r9.zxy * 2.0 - 1.0;
    r13.xyz = r1.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r16.xyz = -r15.xyz + r7.yzw;
    r7.x = ps;
    ps = rsqrt(abs(r1.z));
    r9.xyz = r7.xxx * r5.xyz;
    r1.z = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r1.zzz * r6.xyz;
    r0.w = ps;
    r6.xyz = r16.xyz * r2.www + r15.xyz;
    ps = UniformVector_1.z * UniformVector_1.w;
    r1.xyz = r0.www * r3.zxy;
    r12.z = ps;
    ps = (-1.0) + r0.x;
    r3.xyz = r14.xyz - r13.xyz;
    r0.w = ps;
    r5.yz = r3.yz * r2.ww + r13.yz;
    r0.x = r3.x * r2.w - 2.0;
    ps = 0.1 - -r1.x;
    r3.xyz = r12.xyz * r6.xyz;
    r0.y = ps;
    r0.x = r1.w * 2.0 + r0.x;
    ps = r3.x;
    r8.x = saturate(r0.y * 5.0);
    ps = r10.x * ps;
    r0.yz = -r8.yx + 1.0;
    r3.x = ps;
    r5.xw = r0.xw * r0.yy + 1.0;
    ps = UniformScalar_3.x * r0.y;
    r8.xy = r0.zz * ModShadowGroupColor.xy;
    r0.x = ps;
    r5.yz = r0.xx * r11.xw + r5.yz;
    ps = r3.y;
    r8.xyz = -r8.xyz + 1.0;
    ps = r10.y * ps;
    r5.yz = r5.yz * r0.yy;
    r3.y = ps;
    ps = r3.z;
    r1.w = float((r8.z >= 0.004));
    r5 = (r0.xyyy > 0.0) ? r5.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r0 = (r0.xyyy >= 0.0) ? r5 : float4(1.0, 1.0, 0.0, 0.0);
    ps = r10.z * ps;
    r2.w = dot(r0.yzw, r0.yzw);
    r3.z = ps;
    r3.xyz = r3.xyz * r0.xxx;
    r6.xyz = r3.xzy * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r3.xyz * r2.xyz;
    r0.x = ps;
    r5.xyz = r2.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = -ModShadowColor.x;
    r0.xyw = r0.zwy * r0.xxx;
    ps = 1.0 + ps;
    r11.x = dot(r7.zxy, r0.wxy);
    r7.x = ps;
    ps = -ModShadowColor.y;
    r0.z = dot(r0.wxy, r9.zxy);
    ps = 1.0 + ps;
    r10.xyz = r0.xyw * r0.zzz;
    r7.y = ps;
    ps = -ModShadowColor.z;
    r3 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r1.x = saturate(dot(r1.xyz, r9.zxy));
    r7.z = ps;
    r1.yz = r3.zw * r8.xy + 0.125;
    ps = ConstantLighting.x * r0.w;
    r3.yz = r3.xy + 0.5;
    r3.x = ps;
    ps = ConstantLighting.y * r0.w;
    r3.zw = abs(r3.yz) * abs(r3.yz);
    r3.y = ps;
    ps = log2(r1.x);
    r0.z = r1.y * r1.z;
    r0.x = ps;
    r1.xyz = r0.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r2.xzy * r3.zzz;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r8.xyz = r2.xzy * r3.www;
    r0.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r0.zzz * ConstantLighting.xzy;
    r3.z = ps;
    r0.xyz = r7.xyz * r6.xyz + r5.xzy;
    r0.xyz = r3.xyz * r2.xyz + r0.xzy;
    ps = -r4.w;
    r0.xyz = r0.xyz * r1.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.w + r4.w;
    r0.xyz = r2.xyz * r1.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
