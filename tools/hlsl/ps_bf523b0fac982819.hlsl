// ps_bf523b0fac982819.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040B00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c13); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    r6.xy = r0.xy * UniformScalar_0.xx;
    r5.zw = r0.wz * UniformVector_4.xy;
    r11.x = TwoSidedSign.x * UniformVector_2.z;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.yz = r4.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r10.w - 0.5;
    r6.w = ps;
    ps = 1.0 / r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r5.x = ps;
    r5.xy = r11.yz * r5.xx + ScreenPositionScaleBias.wz;
    r6.zw = r6.zw * abs(r7.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r5.zw).xyz;
    r5.xyw = tex2D(LightAttenuationTexture, r5.xy).yxz;
    r6.xyz = tex2D(Texture2D_0, r6.xy).wxy;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = r4.w;
    r6.w = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r5.z = r1.z + 0.1;
    r0.z = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r0.x = dot(r1.zxy, r1.zxy);
    r4.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r0.y = float((UniformScalar_5.x >= 1.0));
    r4.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r0.w = float((UniformScalar_5.x > 1.0));
    r4.z = ps;
    r9.xw = r6.yz * 2.0 - 1.0;
    ps = 5.0 * r5.z;
    r10.xyz = r4.xyz * r10.xyz;
    r5.z = saturate(ps);
    r4.xyz = (-abs(r0.www) >= 0.0) ? r8.xyz : 1.0;
    r8.xyz = r7.xzy * 2.0 - 1.0;
    r8.y = r11.x * r8.y - TwoSidedSign.x;
    r4.xyz = (-abs(r0.yyy) >= 0.0) ? 1.0 : r4.xyz;
    ps = rsqrt(abs(r0.x));
    r5.z = -r5.z + 1.0;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r7.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r10.xyz * r4.xyz;
    r0.y = ps;
    r0.yzw = -r0.zxy + 1.0;
    ps = UniformScalar_1.x * r0.y;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    r8.xz = r0.xx * r9.xw + r8.xz;
    ps = (-1.0) + r6.x;
    r8.zw = r8.xz * UniformVector_2.xy;
    r8.x = ps;
    r5.z = r8.y * r0.y + TwoSidedSign.x;
    r6.xyz = r8.xzw * r0.yyy + float3(1.0, 0.0, 0.0);
    r6.xyz = (r0.xyy > 0.0) ? r6.xyz : float3(1.0, 0.0, 0.0);
    r5.z = (r0.y > 0.0) ? r5.z : TwoSidedSign.x;
    r8.z = (r0.y >= 0.0) ? r5.z : TwoSidedSign.x;
    r8.xyw = (r0.yyx >= 0.0) ? r6.yzx : float3(0.0, 0.0, 1.0);
    r10.xyz = r1.xyz * r8.www;
    r6.xyz = r10.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r6.w));
    r5.z = dot(r8.zxy, r8.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r1.yzw = r6.www * r3.xyz;
    r5.z = ps;
    r3.xyz = r8.xyz * r5.zzz;
    r8.xyz = r3.xyz * TwoSidedSign.xxx;
    r5.z = dot(r8.zxy, r1.wyz);
    ps = LightColor.x * r5.y;
    r3.xyz = r8.xzy * r5.zzz;
    r1.x = ps;
    r1.yzw = r3.xyz * 2.0 - r1.ywz;
    ps = LightColor.y * r5.x;
    r5.z = saturate(dot(r7.zxy, r1.zyw));
    r1.y = ps;
    ps = log2(r5.z);
    r2.xyz = r10.xyz * r2.xyz;
    r9.x = ps;
    ps = LightColor.z * r5.w;
    r3.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r1.z = ps;
    ps = pow(2.0, r3.x);
    r5.w = saturate(dot(r8.zxy, r7.zxy));
    r5.z = ps;
    r5.xy = r3.yz * r0.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xy = r2.xy * r5.ww + r6.xy;
    r6.z = r2.z * r5.w + r6.z;
    r6.xyz = r1.xyz * r6.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
