// ps_fd172fda0c0ceb96.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040F00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r3.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r15.y = r1.x * UniformVector_2.x;
    ps = 1.0 / r5.w;
    r1.x = -r1.y + 1.0;
    r1.w = ps;
    r7.xy = r0.xy * UniformVector_3.xy;
    r1.yz = r0.xy + 0.5;
    r0.z = dot(r4.zxy, r4.zxy);
    r0.w = dot(r2.zxy, r2.zxy);
    r9.xyz = r3.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r3.xy = r1.ww * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r13.xy = r3.xy * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r0.z));
    r11.xyz = r0.www * r2.xyz;
    r6.x = ps;
    ps = r2.z;
    r3.xyz = r6.xxx * r4.zxy;
    ps = 0.1 + ps;
    r0.w = dot(r9.zxy, r9.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r2.y = max(r3.x, 0.0);
    r0.w = ps;
    ps = 5.0 * r0.z;
    r12.xyz = r9.xyz * r0.www;
    r2.x = saturate(ps);
    r0.zw = -r2.xy + 1.0;
    ps = ModShadowGroupColor.x * r0.z;
    r1.w = dot(r12.zxy, r3.xyz);
    r9.x = ps;
    ps = log2(abs(r0.w));
    r2.xyz = r12.xzy * r1.www;
    r1.w = ps;
    r2.xyz = r2.xyz * 2.0 - r3.yxz;
    ps = ModShadowGroupColor.y * r0.z;
    r1.w = r1.w * UniformScalar_4.x;
    r9.y = ps;
    ps = pow(2.0, r1.w);
    r0.z = saturate(dot(r11.zxy, r2.yxz));
    r9.z = ps;
    ps = log2(r0.z);
    r3.yzw = -r9.xyz + 1.0;
    r6.y = ps;
    r5 = r6.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    r14.xy = r5.zz * r4.xy + r1.yz;
    ps = UniformVector_2.y * r1.x;
    r15.zw = r5.xy * r3.yz;
    r15.x = ps;
    r2.xy = r5.zz * r4.xy + 0.5;
    ps = r2.x;
    r1 = r15.zwyx + float4(0.125, 0.125, -0.5, -0.5);
    ps = r0.x + ps;
    r6.yz = float2((r15.xy >= 0.5));
    r6.x = ps;
    ps = r2.y;
    r0.zw = r1.zw - r15.yx;
    r0.zw = r0.zw * r6.zy + r15.yx;
    ps = r0.y + ps;
    r2.xy = r0.zw + r0.zw;
    r6.w = ps;
    r0.z = tex2D(Texture2D_3, r7.xy).x;
    r7 = tex2D(Texture2D_2, r2.xy);
    r2.xyz = tex2D(LightAttenuationTexture, r13.xy).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    r4.xyz = tex2D(Texture2D_1, r14.xy).xyz;
    r0.y = tex2D(Texture2D_1, r6.xw).w;
    r14.yzw = UniformVector_1.xyz * UniformVector_1.www;
    ps = 1.0 - r0.y;
    r4.xyz = r4.xyz * 0.15;
    r14.x = ps;
    r14.yzw = r14.yzw * r13.xyz - r4.xyz;
    r0.x = r14.x * r13.w + r0.y;
    r5.xyz = r14.yzw * r13.www + r4.xyz;
    r4.xyz = r5.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    ps = r5.x;
    r2.xyz = r2.xyz * LightColor.xyz;
    ps = r8.x * ps;
    r3.x = saturate(dot(r12.zxy, r11.zxy));
    r6.x = ps;
    ps = r5.y;
    r0.w = dot(r6.zyy, float3(1.0, 1.0, 1.0));
    ps = r8.y * ps;
    r0.y = r1.x * r1.y;
    r6.y = ps;
    r1.xyz = r0.yyy * r10.xyz + ModShadowColor.xyz;
    r1.w = (r0.w == 0.0) ? r7.x : r7.y;
    ps = r5.z;
    r0.yzw = r0.zww + float3(1.0, -3.0, -2.0);
    ps = r8.z * ps;
    r6.w = r0.y - r9.z;
    r6.z = ps;
    r0.y = (r0.w == 0.0) ? r7.z : r1.w;
    r0.y = (r0.z == 0.0) ? r7.w : r0.y;
    ps = 1.0 - r0.y;
    r3 = r6 * r3.xxxw;
    r0.w = ps;
    ps = pow(2.0, r5.w);
    r2.w = r3.w * r0.x;
    r0.z = ps;
    r0.xy = r4.xy * r0.zz + r3.xy;
    r0.z = r4.z * r0.z + r3.z;
    r0 = r2 * r0;
    ps = (-0.5) - -r0.w;
    r0.xyz = r0.xzy * r1.xzy;
    r0.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
