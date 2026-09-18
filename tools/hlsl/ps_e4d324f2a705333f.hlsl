// ps_e4d324f2a705333f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10040D00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_2, r1.xy).wxyz;
    r6.xz = r1.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.yz = r1.wz * UniformVector_4.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.x = TwoSidedSign.x * UniformVector_2.z;
    r7.w = ps;
    ps = r9.x;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r0.zw = r7.xw * abs(r8.xy);
    r6.y = ps;
    ps = 1.0 / r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r6.y = ps;
    r6.yw = r12.yz * r6.yy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.yw).xyz;
    r7.x = tex2D(ShadowTexture, r0.xy).x;
    r10.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r11.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r7.yz).xyz;
    r6.yzw = tex2D(Texture2D_0, r6.xz).wxy;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = r5.w;
    r0.w = float((UniformScalar_5.x >= 1.0));
    ps = 0.0001 * ps;
    r2.w = r2.z + 0.1;
    r9.x = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r7.z = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r1.w = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r4.w = float((UniformScalar_5.x > 1.0));
    r5.z = ps;
    ps = (-1.0) + r6.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r11.x = ps;
    r7.yw = r6.zw * 2.0 - 1.0;
    r13.xyz = (-abs(r4.www) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r6.x));
    r6.y = saturate(r2.w * 5.0);
    r6.z = ps;
    r11.yzw = r11.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r9.yzw = r5.xyz * r9.yzw;
    r6.w = ps;
    ps = rsqrt(abs(r7.z));
    r5.xyz = r6.www * r2.xyz;
    r7.z = ps;
    r11.y = r12.x * r11.y - TwoSidedSign.x;
    ps = 1.0 - r6.x;
    r12.xyz = r6.zzz * -SpotDirection.xyz;
    r6.x = saturate(ps);
    r2.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r13.xyz;
    ps = log2(r6.x);
    r6.z = -r6.y + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r9.yzw * r2.xyz;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.y = dot(r12.zxy, r3.zxy);
    r9.z = ps;
    ps = r7.z;
    r9.xyz = -r9.xyz + 1.0;
    ps = r4.x * ps;
    r9.w = r9.x * UniformScalar_1.x;
    r12.x = ps;
    r6.zw = r9.ww * r7.yw + r11.zw;
    ps = r7.z;
    r11.zw = r6.zw * UniformVector_2.xy;
    r6.z = r11.y * r9.x + TwoSidedSign.x;
    r3.xyz = r11.xzw * r9.xxx + float3(1.0, 0.0, 0.0);
    r3.xyw = (r9.xxw > 0.0) ? r3.yzx : float3(0.0, 0.0, 1.0);
    r6.z = (r9.x > 0.0) ? r6.z : TwoSidedSign.x;
    r3.z = (r9.x >= 0.0) ? r6.z : TwoSidedSign.x;
    r3.xyw = (r9.xxw >= 0.0) ? r3.xyw : float3(0.0, 0.0, 1.0);
    ps = r4.y * ps;
    r11.xyz = r2.xyz * r3.www;
    r12.y = ps;
    r2.xyz = r11.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = -SpotAngles.x - -r6.y;
    r6.z = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r7.y = saturate(r6.y * SpotAngles.y);
    r6.y = ps;
    ps = r7.z;
    r6.yzw = r3.xyz * r6.yyy;
    ps = r4.z * ps;
    r3.xyz = r6.yzw * TwoSidedSign.xxx;
    r12.z = ps;
    r6.y = dot(r3.zxy, r12.zxy);
    r6.yzw = r3.xzy * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r12.xzy;
    r6.y = saturate(dot(r5.zxy, r6.zyw));
    ps = log2(r6.y);
    r0.xyw = r11.xyz * r0.xyz;
    r10.z = ps;
    r6.yzw = r10.xyz * float3(0.875, 0.875, 15.0);
    r7.zw = r6.yz * r9.yz + 0.125;
    ps = pow(2.0, r6.w);
    r0.z = saturate(dot(r3.zxy, r5.zxy));
    r6.y = ps;
    r6.yzw = r2.xyz * r6.yyy;
    r0.xy = r0.xy * r0.zz + r6.yz;
    r0.z = r0.w * r0.z + r6.w;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xyz = r7.zxy * r7.wxy;
    r6.w = ps;
    r6.xyz = r7.xxx * r1.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r7.yyy * r8.xyz;
    r6.w = ps;
    r1.xyz = r1.xzy * r6.www;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.zzz;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
