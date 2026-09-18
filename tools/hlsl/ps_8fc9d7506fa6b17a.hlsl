// ps_8fc9d7506fa6b17a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 324 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000510 10040F00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r7 = In.color1;
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

    r14 = tex2D(Texture2D_5, r0.xy);
    r6.x = r1.x * UniformVector_2.x;
    r6.z = -r1.y + 1.0;
    ps = UniformVector_2.y * r6.z;
    r6.y = r14.w - 0.5;
    r6.z = ps;
    ps = (-0.5) + r6.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r6.y = ps;
    ps = (-0.5) + r6.z;
    r7.xw = float2((r6.xz >= 0.5));
    r6.w = ps;
    r6.yw = r6.yw - r6.xz;
    r6.xy = r6.yw * r7.xw + r6.xz;
    r6.xy = r6.xy + r6.xy;
    r10 = tex2D(Texture2D_1, r6.xy);
    r9.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    ps = r1.x;
    r12.xy = r1.xy * 6.0;
    ps = UniformVector_7.x * ps;
    r13.zw = r1.xy * UniformVector_1.xy;
    r13.x = ps;
    ps = r1.y;
    r1.z = dot(r4.zxy, r4.zxy);
    ps = UniformVector_7.y * ps;
    r6.x = r5.w - 4e+02;
    r13.y = ps;
    ps = r2.z;
    r15.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = 0.1 + ps;
    r6.z = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r1.yw = r9.xy + r9.xy;
    r6.w = ps;
    ps = 0.00022222222 * r6.x;
    r11.xyz = r6.www * -SpotDirection.xyz;
    r7.y = saturate(ps);
    ps = 5.0 * r6.y;
    r6.w = dot(r11.zxy, r3.zxy);
    r7.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r6.w - SpotAngles.x;
    r0.z = ps;
    ps = SpotAngles.y * r6.x;
    r1.x = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r15.x = saturate(ps);
    r6.x = (r1.x == 0.0) ? r10.x : r10.y;
    ps = 1.0 / r5.w;
    r11 = r1.ywxx + float4(-1.0, -1.0, -3.0, -2.0);
    r15.w = ps;
    r7.x = (r11.w == 0.0) ? r10.z : r6.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyw = r15.yzx * r15.wwx;
    r0.w = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r12.zw = r0.zw * abs(r8.xy);
    r0.z = ps;
    r7.w = (r11.z == 0.0) ? r10.w : r7.x;
    ps = ScreenPositionScaleBias.z + r6.y;
    r7.x = max(r7.w, 0.0);
    r0.w = ps;
    ps = rsqrt(abs(r1.z));
    r7.x = min(r7.x, 0.3);
    r6.x = ps;
    ps = r7.y;
    r10.xyz = r6.xxx * r4.xyz;
    r6.y = ps;
    ps = (-0.025) * r6.y;
    r3.xw = -r7.wz + 1.0;
    r6.x = ps;
    ps = 3.3333333 * r7.x;
    r10.w = r3.x * 2.5;
    r1.w = ps;
    r6.xy = r10.xy * r6.xx + r13.zw;
    r1.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.z = tex2D(Texture2D_4, r0.xy).x;
    r8.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r3.xyz = tex2D(Texture2D_6, r13.xy).xyz;
    r13.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r12.zw).xy;
    r9.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r12.xy).yxw;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r5.w;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    r0.w = saturate(ps);
    r11.z = r12.z * r9.w - 1.0;
    ps = r12.y + r12.y;
    r6.x = dot(r2.zxy, r2.zxy);
    r13.z = ps;
    r9.xyw = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r12.yz = r0.xy * 0.875;
    r0.x = ps;
    ps = 1.0 - r6.z;
    r5.xyz = r15.xyz * r14.xyz;
    r7.x = saturate(ps);
    r6.xyz = r13.wxy * 2.0 - 1.0;
    ps = log2(r7.x);
    r2.xyz = r0.xxx * r2.xyz;
    r7.x = ps;
    ps = r12.x + r12.x;
    r0.xy = r3.ww * ModShadowGroupColor.xy;
    r13.w = ps;
    ps = UniformVector_4.x * r6.y;
    r0.xyw = -r0.xyw + 1.0;
    r12.x = ps;
    ps = UniformVector_4.y * r6.z;
    r13.xy = r12.yz * r0.xy;
    r12.y = ps;
    ps = UniformVector_4.z * r6.x;
    r13 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r12.z = ps;
    r11.xy = r13.zw * 0.5 + r11.xy;
    ps = -r9.w;
    r6.y = r13.x * r13.y;
    r7.yzw = r6.yyy * r7.yzw + ModShadowColor.xyz;
    r6.yz = r1.ww * r11.xy + r12.xy;
    r0.y = r1.w * r11.z + 1.0;
    r0.x = saturate(r10.w * r0.y - 0.5);
    ps = r12.z + ps;
    r11.xy = r6.yz - r9.xy;
    r11.z = ps;
    r9.xy = r11.xy * r0.xx + r9.xy;
    r6.y = r11.z * r0.x - 2.0;
    r9.z = r9.z * 2.0 + r6.y;
    r9.xyw = r9.xyz * r0.www;
    ps = abs(r0.y) * abs(r0.y);
    r9.z = r9.w + 1.0;
    r6.z = ps;
    r9.xyz = (r0.www > 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    r9.xyz = (r0.www >= 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    ps = r6.z * r6.z;
    r6.y = dot(r9.zxy, r9.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r6.z = r6.z * r6.z;
    r6.y = ps;
    r9.xyz = r9.xyz * r6.yyy;
    r6.y = dot(r9.zxy, r10.zxy);
    r11.xyz = r9.xyz * r6.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.y = saturate(dot(r2.zxy, r10.zxy));
    ps = log2(r6.y);
    r0.w = saturate(dot(r9.zyx, r2.zyx));
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r2.x = ps;
    ps = pow(2.0, r2.x);
    r1.w = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_8.x * r6.y;
    r5.w = ps;
    r3 = r5 * r3.xyzx;
    r2.xyz = r3.xyz * r0.yyy - r8.xyz;
    r3.xyz = r3.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r3.xyz = r3.www * r0.zzz + r3.xyz;
    r2.xyz = r2.xyz * r0.xxx + r8.xyz;
    r2.xyz = r2.xyz * r4.xyz;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r3.xyz = r6.zzz * r3.xyz;
    r6.z = ps;
    ps = pow(2.0, r1.w);
    r0.xyz = r3.xyz * r0.xxx;
    r7.x = ps;
    ps = pow(2.0, r6.z);
    r0.xyz = r0.xyz * r7.xxx;
    r6.z = ps;
    r0.xy = r2.xy * r0.ww + r0.xy;
    r0.z = r2.z * r0.w + r0.z;
    r0.xyz = r0.xyz * r6.zzz;
    r0.xyz = r0.xyz * r1.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xyz * r6.www;
    r6.xyz = r6.xyz * r7.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
