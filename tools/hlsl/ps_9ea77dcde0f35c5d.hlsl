// ps_9ea77dcde0f35c5d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040C00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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

    r8 = tex2D(Texture2D_2, r0.xy).xywz;
    r9.zw = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xy = r1.xy * UniformVector_4.xy;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.x = TwoSidedSign.x * UniformVector_2.z;
    r1.y = ps;
    ps = r8.z;
    r11.yz = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    ps = (-0.5) + r0.z;
    r6.xy = r1.xy * abs(r6.xy);
    r0.z = ps;
    ps = 1.0 / r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r0.z = ps;
    r0.zw = r11.yz * r0.zz + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r10.xy).xyz;
    r0.xzw = tex2D(Texture2D_0, r9.zw).wxy;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    ps = r5.w;
    r2.w = float((UniformScalar_5.x >= 1.0));
    ps = 0.0001 * ps;
    r5.w = r2.z + 0.1;
    r8.z = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r1.w = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r4.w = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r6.w = float((UniformScalar_5.x > 1.0));
    r5.z = ps;
    ps = (-1.0) + r0.x;
    r0.y = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    r9.zw = r0.zw * 2.0 - 1.0;
    r12.xyz = (-abs(r6.www) >= 0.0) ? r12.xyz : 1.0;
    ps = rsqrt(abs(r0.y));
    r0.z = saturate(r5.w * 5.0);
    r0.x = ps;
    r7.yzw = r7.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.w));
    r8.xyw = r5.xyz * r8.xyw;
    r0.w = ps;
    ps = rsqrt(abs(r1.w));
    r5.xyz = r0.www * r2.xyz;
    r1.w = ps;
    r7.y = r11.x * r7.y - TwoSidedSign.x;
    ps = 1.0 - r0.y;
    r11.xyz = r0.xxx * -SpotDirection.xyz;
    r0.x = saturate(ps);
    r2.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r0.x);
    r0.z = -r0.z + 1.0;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r2.xyz = r8.xyw * r2.xyz;
    r8.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.y = dot(r11.zxy, r3.zxy);
    r8.y = ps;
    ps = r1.w;
    r8.yzw = -r8.xyz + 1.0;
    ps = r4.x * ps;
    r8.x = r8.w * UniformScalar_1.x;
    r11.x = ps;
    r0.zw = r8.xx * r9.zw + r7.zw;
    ps = r1.w;
    r7.zw = r0.zw * UniformVector_2.xy;
    r0.z = r7.y * r8.w + TwoSidedSign.x;
    r3.xyz = r7.xzw * r8.www + float3(1.0, 0.0, 0.0);
    r3.xyz = (r8.xww > 0.0) ? r3.xyz : float3(1.0, 0.0, 0.0);
    r0.z = (r8.w > 0.0) ? r0.z : TwoSidedSign.x;
    r7.z = (r8.w >= 0.0) ? r0.z : TwoSidedSign.x;
    r7.xyw = (r8.wwx >= 0.0) ? r3.yzx : float3(0.0, 0.0, 1.0);
    ps = r4.y * ps;
    r3.xyw = r2.xyz * r7.www;
    r11.y = ps;
    r2.xyz = r3.xyw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = -SpotAngles.x - -r0.y;
    r0.z = dot(r7.zxy, r7.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r3.z = saturate(r0.y * SpotAngles.y);
    r0.y = ps;
    ps = r1.w;
    r0.yzw = r7.xyz * r0.yyy;
    ps = r4.z * ps;
    r7.xyz = r0.yzw * TwoSidedSign.xxx;
    r11.z = ps;
    r0.y = dot(r7.zxy, r11.zxy);
    r0.yzw = r7.xzy * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r11.xzy;
    r0.y = saturate(dot(r5.zxy, r0.zyw));
    ps = log2(r0.y);
    r4.xyz = r3.xyw * r10.xyz;
    r9.z = ps;
    r0.yzw = r9.zxy * float3(15.0, 0.875, 0.875);
    r3.xy = r0.zw * r8.yz + 0.125;
    ps = pow(2.0, r0.y);
    r0.z = saturate(dot(r7.zxy, r5.zxy));
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2.xyz = r2.xyz * r0.yyy;
    r0.y = ps;
    r2.xy = r4.xy * r0.zz + r2.xy;
    r2.z = r4.z * r0.z + r2.z;
    ps = pow(2.0, r0.y);
    r0.xw = r3.xz * r3.yz;
    r1.w = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xyz * r1.www;
    r1.xyz = r2.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xyz * r0.www;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
