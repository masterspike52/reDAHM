// ps_fb6d0b964a8975b1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xz = r0.xy * UniformScalar_0.xx;
    r8.y = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r6.zw = r6.xy * r5.yy + ScreenPositionScaleBias.wz;
    ps = r13.w;
    r6.xy = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r8.x = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r8.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r9.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r14.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r6.yzw = tex2D(Texture2D_3, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.yzw = tex2D(Texture2D_0, r5.xz).xyw;
    r5.x = dot(r3.zxy, r3.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    ps = r1.z;
    r0.x = float((UniformScalar_5.x > 1.0));
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    r8.yz = r0.yz * 2.0 - 1.0;
    r11.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r8.x = r0.w - 1.0;
    r5.w = ps;
    r12.xyz = (-abs(r0.xxx) >= 0.0) ? r6.yzw : 1.0;
    ps = rsqrt(abs(r6.x));
    r5.z = saturate(r5.z * 5.0);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r6.xxx * r1.xyz;
    r6.x = ps;
    ps = TwoSidedSign.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_2.z * ps;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = r4.w;
    r6.y = float((UniformScalar_5.x >= 1.0));
    ps = 0.0001 * ps;
    r13.xyz = r15.xyz * r13.xyz;
    r6.z = saturate(ps);
    ps = 1.0 - r5.y;
    r0.yzw = r14.xyz * r2.www;
    r5.x = saturate(ps);
    r12.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r5.x);
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r4.xyz = r6.xxx * r3.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.xyz = r5.www * -SpotDirection.xyz;
    r6.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = dot(r3.zxy, r2.zxy);
    r6.y = ps;
    ps = pow(2.0, r5.x);
    r6.yzw = -r6.zxy + 1.0;
    r11.w = ps;
    ps = UniformScalar_1.x * r6.y;
    r0 = r0 * r11.zwww;
    r6.x = ps;
    ps = r0.x;
    r2.xyz = r13.xyz * r12.xyz;
    r5.z = ps;
    r5.xw = r6.xx * r8.yz + r11.xy;
    ps = -TwoSidedSign.x - -r5.z;
    r8.zw = r5.xw * UniformVector_2.xy;
    r8.y = ps;
    r1.w = r8.y * r6.y + TwoSidedSign.x;
    r5.xzw = r8.xzw * r6.yyy + float3(1.0, 0.0, 0.0);
    r5.xzw = (r6.xyy > 0.0) ? r5.xzw : float3(1.0, 0.0, 0.0);
    r1.w = (r6.y > 0.0) ? r1.w : TwoSidedSign.x;
    r8.z = (r6.y >= 0.0) ? r1.w : TwoSidedSign.x;
    r8.xyw = (r6.yyx >= 0.0) ? r5.zwx : float3(0.0, 0.0, 1.0);
    r2.xyz = r2.xyz * r8.www;
    r3.xyz = r2.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = -SpotAngles.x - -r5.y;
    r5.z = dot(r8.zxy, r8.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = saturate(r5.x * SpotAngles.y);
    r5.y = ps;
    r5.yzw = r8.xyz * r5.yyy;
    r8.xyz = r5.yzw * TwoSidedSign.xxx;
    r5.y = dot(r8.zxy, r4.zxy);
    r5.yzw = r8.xzy * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r4.xzy;
    r5.y = saturate(dot(r7.zxy, r5.zyw));
    ps = log2(r5.y);
    r2.xyz = r2.xyz * r10.xyz;
    r9.x = ps;
    r4.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r5.yz = r4.yz * r6.zw + 0.125;
    ps = pow(2.0, r4.x);
    r5.w = saturate(dot(r8.zxy, r7.zxy));
    r6.x = ps;
    r6.xyz = r3.xyz * r6.xxx;
    r6.xy = r2.xy * r5.ww + r6.xy;
    r6.z = r2.z * r5.w + r6.z;
    r5.xw = r5.yx * r5.zx;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    r6.xyz = r0.yzw * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
