// ps_40eb7a081af45db3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r11 = tex2D(Texture2D_2, r0.xy);
    r5.xz = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r0.wz * UniformVector_4.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.x = TwoSidedSign.x * UniformVector_2.z;
    r6.w = ps;
    ps = r11.w;
    r12.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r6.zw = r6.zw * abs(r7.xy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r5.y = ps;
    r5.yw = r12.yz * r5.yy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.yw).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyw = tex2D(Texture2D_3, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r5.xz).wxy;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = r4.w;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r5.x = r1.z + 0.1;
    r0.z = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r5.z = float((UniformScalar_5.x >= 1.0));
    r4.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r1.w = float((UniformScalar_5.x > 1.0));
    r4.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r5.y = dot(r2.zxy, r2.zxy);
    r4.z = ps;
    r9.xw = r6.yz * 2.0 - 1.0;
    ps = 5.0 * r5.x;
    r11.xyz = r4.xyz * r11.xyz;
    r5.x = saturate(ps);
    r0.xyw = (-abs(r1.www) >= 0.0) ? r0.xyw : 1.0;
    r10.xyz = r10.xzy * 2.0 - 1.0;
    r10.y = r12.x * r10.y - TwoSidedSign.x;
    r2.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r0.xyw;
    ps = rsqrt(abs(r6.w));
    r5.z = -r5.x + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4.xyz = r5.xxx * r1.xyz;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r11.xyz * r2.xyz;
    r0.y = ps;
    r0.yzw = -r0.zxy + 1.0;
    ps = UniformScalar_1.x * r0.y;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    r5.xz = r0.xx * r9.xw + r10.xz;
    ps = (-1.0) + r6.x;
    r10.zw = r5.xz * UniformVector_2.xy;
    r10.x = ps;
    r5.x = r10.y * r0.y + TwoSidedSign.x;
    r6.xyz = r10.xzw * r0.yyy + float3(1.0, 0.0, 0.0);
    r6.xyz = (r0.xyy > 0.0) ? r6.xyz : float3(1.0, 0.0, 0.0);
    r5.x = (r0.y > 0.0) ? r5.x : TwoSidedSign.x;
    r10.z = (r0.y >= 0.0) ? r5.x : TwoSidedSign.x;
    r10.xyw = (r0.yyx >= 0.0) ? r6.yzx : float3(0.0, 0.0, 1.0);
    r1.xyz = r1.xyz * r10.www;
    r6.xyz = r1.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r5.w));
    r6.w = dot(r10.zxy, r10.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r5.xzw = r5.xxx * r3.xyz;
    r6.w = ps;
    r3.xyz = r10.xyz * r6.www;
    r3.xyz = r3.xyz * TwoSidedSign.xxx;
    r6.w = dot(r3.zxy, r5.wxz);
    ps = 1.0 - r5.y;
    r10.xyz = r3.xzy * r6.www;
    r5.y = saturate(ps);
    r5.xzw = r10.xyz * 2.0 - r5.xwz;
    ps = log2(r5.y);
    r5.x = saturate(dot(r4.zxy, r5.zxw));
    r5.y = ps;
    ps = log2(r5.x);
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r9.x = ps;
    r5.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r5.z);
    r1.xyz = r1.xyz * r8.xyz;
    r5.z = ps;
    r5.xw = r5.xw * r0.zw + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r3.zxy, r4.zxy));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
