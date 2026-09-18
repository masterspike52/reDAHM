// ps_f5fbae872a32494a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040A00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xw = r0.xy * UniformScalar_0.xx;
    r1.w = ps;
    ps = 1.0 / r5.w;
    r3.xy = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r3.xy = r3.xy * r0.zz + ScreenPositionScaleBias.wz;
    ps = r10.w;
    r1.xy = r1.xy * UniformVector_2.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r1.z = ps;
    ps = (-0.5) + r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r8.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r9.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r1.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r0.yzw = tex2D(Texture2D_1, r8.xw).wxy;
    ps = r5.w;
    r2.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r0.x = r2.z + 0.1;
    r5.z = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r3.w = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r4.w = float((UniformScalar_4.x >= 1.0));
    r6.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r6.w = float((UniformScalar_4.x > 1.0));
    r6.z = ps;
    r8.xw = r0.zw * 2.0 - 1.0;
    ps = (-1.0) + r0.y;
    r3.xyz = r3.xyz * LightColor.xyz;
    r1.z = ps;
    ps = 5.0 * r0.x;
    r5.xyw = r1.wxy + float3(-2.0, 0.0, 0.0);
    r0.y = saturate(ps);
    r0.xzw = (-abs(r6.www) >= 0.0) ? r9.xyz : 1.0;
    r9.xyz = (-abs(r4.www) >= 0.0) ? 1.0 : r0.xzw;
    ps = 1.0 - r0.y;
    r10.xyz = r6.xyz * r10.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r3.w));
    r1.xyw = r5.ywx + r1.xyw;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r6.xyz = r0.xxx * r2.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r2.xyz = r10.xyz * r9.xyz;
    r5.y = ps;
    ps = (-1.0) + r1.x;
    r5.yzw = -r5.zxy + 1.0;
    r0.x = ps;
    r0.zw = r1.wz * r5.yy + 1.0;
    ps = (-1.0) + r1.y;
    r5.x = r5.y * UniformScalar_1.x;
    r0.y = ps;
    r0.xy = r5.xx * r8.xw + r0.xy;
    ps = -UniformVector_0.x;
    r0.xy = r0.xy * r5.yy;
    r0 = (r5.xyyy > 0.0) ? r0.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r10 = (r5.xyyy >= 0.0) ? r0 : float4(1.0, 0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r0.x = dot(r10.wyz, r10.wyz);
    r0.y = ps;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r2.xyz * r10.xxx;
    r0.z = ps;
    r1.xyz = r2.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r0.zzz * r4.xyz;
    r0.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r10.yzw * r0.xxx;
    ps = 1.0 + ps;
    r0.x = dot(r4.zxy, r9.zxy);
    r0.z = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r4.xyz * r0.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r0.x = saturate(dot(r6.zxy, r9.zxy));
    r0.w = ps;
    ps = log2(r0.x);
    r2.xyz = r2.xyz * r0.yzw;
    r8.x = ps;
    r0.xyz = r8.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r0.z);
    r0.w = saturate(dot(r4.zyx, r6.zyx));
    r0.z = ps;
    r0.xy = r0.xy * r5.zw + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r1.xyz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r0.ww + r1.xy;
    r1.z = r2.z * r0.w + r1.z;
    r1.xyz = r3.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
