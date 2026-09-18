// ps_74f6069ed9d82081.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_2, r0.xy).xywz;
    r5.xz = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.zw = r0.wz * UniformVector_4.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.x = TwoSidedSign.x * UniformVector_2.z;
    r6.y = ps;
    ps = r9.z;
    r12.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r5.y = ps;
    r5.yw = r12.yz * r5.yy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.yw).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r8.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r10.zw).xyz;
    r5.xzw = tex2D(Texture2D_0, r5.xz).wxy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    ps = r4.w;
    r0.w = float((UniformScalar_5.x >= 1.0));
    ps = 0.0001 * ps;
    r3.w = r1.z + 0.1;
    r9.z = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r6.w = dot(r3.zxy, r3.zxy);
    r4.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r4.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r4.w = float((UniformScalar_5.x > 1.0));
    r4.z = ps;
    ps = (-1.0) + r5.x;
    r5.y = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    r10.zw = r5.zw * 2.0 - 1.0;
    r0.xyz = (-abs(r4.www) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r5.y));
    r5.z = saturate(r3.w * 5.0);
    r5.x = ps;
    r8.yzw = r8.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r9.xyw = r4.xyz * r9.xyw;
    r5.w = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r5.www * r1.xyz;
    r6.w = ps;
    r8.y = r12.x * r8.y - TwoSidedSign.x;
    ps = 1.0 - r5.y;
    r1.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = saturate(ps);
    r0.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = log2(r5.x);
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r0.xyz = r9.xyw * r0.xyz;
    r9.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = dot(r1.zxy, r2.zxy);
    r9.y = ps;
    ps = r6.w;
    r9.yzw = -r9.xyz + 1.0;
    ps = r3.x * ps;
    r9.x = r9.w * UniformScalar_1.x;
    r2.x = ps;
    r5.zw = r9.xx * r10.zw + r8.zw;
    ps = r6.w;
    r8.zw = r5.zw * UniformVector_2.xy;
    r5.z = r8.y * r9.w + TwoSidedSign.x;
    r1.xyz = r8.xzw * r9.www + float3(1.0, 0.0, 0.0);
    r1.xyz = (r9.xww > 0.0) ? r1.xyz : float3(1.0, 0.0, 0.0);
    r5.z = (r9.w > 0.0) ? r5.z : TwoSidedSign.x;
    r8.z = (r9.w >= 0.0) ? r5.z : TwoSidedSign.x;
    r8.xyw = (r9.wwx >= 0.0) ? r1.yzx : float3(0.0, 0.0, 1.0);
    ps = r3.y * ps;
    r1.xyw = r0.xyz * r8.www;
    r2.y = ps;
    r0.xyz = r1.xyw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = -SpotAngles.x - -r5.y;
    r5.z = dot(r8.zxy, r8.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r1.z = saturate(r5.y * SpotAngles.y);
    r5.y = ps;
    ps = r6.w;
    r5.yzw = r8.xyz * r5.yyy;
    ps = r3.z * ps;
    r8.xyz = r5.yzw * TwoSidedSign.xxx;
    r2.z = ps;
    r5.y = dot(r8.zxy, r2.zxy);
    r5.yzw = r8.xzy * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r2.xzy;
    r5.y = saturate(dot(r4.zxy, r5.zyw));
    ps = log2(r5.y);
    r2.xyz = r1.xyw * r11.xyz;
    r10.z = ps;
    r5.yzw = r10.zxy * float3(15.0, 0.875, 0.875);
    r1.xy = r5.zw * r9.yz + 0.125;
    ps = pow(2.0, r5.y);
    r5.z = saturate(dot(r8.zxy, r4.zxy));
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r0.xyz * r5.yyy;
    r5.y = ps;
    r0.xy = r2.xy * r5.zz + r0.xy;
    r0.z = r2.z * r5.z + r0.z;
    ps = pow(2.0, r5.y);
    r5.xw = r1.xz * r1.yz;
    r6.w = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r6.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
