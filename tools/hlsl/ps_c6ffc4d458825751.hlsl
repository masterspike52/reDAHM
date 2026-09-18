// ps_c6ffc4d458825751.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040C00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_2, r0.xy);
    r1.zw = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xy = r1.xy * UniformVector_4.xy;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = TwoSidedSign.x * UniformVector_2.z;
    r8.y = ps;
    ps = r11.w;
    r7.yz = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r8.xy = r8.xy * abs(r6.xy);
    r0.z = ps;
    ps = 1.0 / r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r0.z = ps;
    r0.zw = r7.yz * r0.zz + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r1.zw).wxy;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = r5.w;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r0.x = r2.z + 0.1;
    r5.z = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r0.z = float((UniformScalar_5.x >= 1.0));
    r5.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r2.w = float((UniformScalar_5.x > 1.0));
    r5.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.y = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r9.xw = r1.yz * 2.0 - 1.0;
    ps = 5.0 * r0.x;
    r11.xyz = r5.xyw * r11.xyz;
    r0.x = saturate(ps);
    r3.xyz = (-abs(r2.www) >= 0.0) ? r12.xyz : 1.0;
    r10.xyz = r10.xzy * 2.0 - 1.0;
    r10.y = r7.x * r10.y - TwoSidedSign.x;
    r3.xyz = (-abs(r0.zzz) >= 0.0) ? 1.0 : r3.xyz;
    ps = rsqrt(abs(r1.w));
    r0.z = -r0.x + 1.0;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r7.xyz = r0.xxx * r2.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r3.xyz = r11.xyz * r3.xyz;
    r5.y = ps;
    r2.yzw = -r5.zxy + 1.0;
    ps = UniformScalar_1.x * r2.y;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = ps;
    r0.xz = r2.xx * r9.xw + r10.xz;
    ps = (-1.0) + r1.x;
    r10.zw = r0.xz * UniformVector_2.xy;
    r10.x = ps;
    r0.x = r10.y * r2.y + TwoSidedSign.x;
    r1.xyz = r10.xzw * r2.yyy + float3(1.0, 0.0, 0.0);
    r1.xyz = (r2.xyy > 0.0) ? r1.xyz : float3(1.0, 0.0, 0.0);
    r0.x = (r2.y > 0.0) ? r0.x : TwoSidedSign.x;
    r10.z = (r2.y >= 0.0) ? r0.x : TwoSidedSign.x;
    r10.xyw = (r2.yyx >= 0.0) ? r1.yzx : float3(0.0, 0.0, 1.0);
    r3.xyz = r3.xyz * r10.www;
    r1.xyz = r3.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r0.w));
    r1.w = dot(r10.zxy, r10.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r1.w));
    r0.xzw = r0.xxx * r4.xyz;
    r1.w = ps;
    r4.xyz = r10.xyz * r1.www;
    r4.xyz = r4.xyz * TwoSidedSign.xxx;
    r1.w = dot(r4.zxy, r0.wxz);
    ps = 1.0 - r0.y;
    r10.xyz = r4.xzy * r1.www;
    r0.y = saturate(ps);
    r0.xzw = r10.xyz * 2.0 - r0.xwz;
    ps = log2(r0.y);
    r0.x = saturate(dot(r7.zxy, r0.zxw));
    r0.y = ps;
    ps = log2(r0.x);
    r0.y = r0.y * LightColorAndFalloffExponent.w;
    r9.x = ps;
    r0.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r0.z);
    r3.xyz = r3.xyz * r8.xyz;
    r0.z = ps;
    r0.xw = r0.xw * r2.zw + 0.125;
    ps = r0.x * r0.w;
    r1.w = saturate(dot(r4.zxy, r7.zxy));
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.zzz;
    r0.w = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r1.xy = r3.xy * r1.ww + r1.xy;
    r1.z = r3.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r6.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
