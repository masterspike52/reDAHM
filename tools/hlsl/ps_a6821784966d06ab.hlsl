// ps_a6821784966d06ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10040C00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ShadowTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r12.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.zw = r1.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r6.y = r2.z + 0.1;
    r6.x = ps;
    ps = UniformVector_1.y * r6.x;
    r7.w = min(abs(r6.z), abs(r6.w));
    r7.z = ps;
    ps = 5.0 * r6.y;
    r8.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = saturate(ps);
    ps = 1.0 / r5.w;
    r0.z = float((abs(r6.z) > abs(r6.w)));
    r7.x = ps;
    r6.y = dot(r6.wz, r6.wz) + 0.0;
    ps = max(abs(r6.z), abs(r6.w));
    r11.x = float((-r6.w > r6.w));
    r0.w = ps;
    ps = min(r6.z, r6.w);
    r7.xy = r7.xx * ScreenPositionScaleBias.xy;
    r1.x = ps;
    r7.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    ps = max(r6.z, r6.w);
    r1.x = float((-r1.x > r1.x));
    r6.z = ps;
    ps = 1.0 / r0.w;
    r1.z = float((r6.z >= -r6.z));
    r6.w = ps;
    ps = sqrt(abs(r6.y));
    r6.x = -r6.x + 1.0;
    r6.y = ps;
    r6.xz = -r6.xx * ModShadowGroupColor.yx + 1.0;
    ps = UniformScalar_0.x - r6.y;
    r1.y = r7.w * r6.w;
    r8.x = ps;
    r5.y = r7.z * r8.x + UniformVector_2.y;
    r12.xy = r1.xy * r1.zy;
    r10.xyw = r12.zwy * float3(0.875, 0.875, 0.0208351);
    ps = UniformScalar_1.x;
    r6.w = r10.w - 0.085133;
    r6.w = r12.y * r6.w + 0.180141;
    r6.w = r12.y * r6.w - 0.3302995;
    ps = (-1.2) * ps;
    r7.w = r12.y * r6.w;
    r7.z = ps;
    r11.zw = r7.zw + float2(0.8, 0.999866);
    r11.y = r1.y * r11.w;
    r1.xyz = r11.zxy * float3(0.24999972, -3.1415927, -2.0);
    r7.zw = r1.xz + float2(0.5, 1.5707964);
    r6.w = r7.w * r0.z + r11.y;
    ps = frac(r7.z);
    r11.z = float((UniformScalar_2.x >= r8.x));
    r7.z = ps;
    r7.z = r7.z * 6.2831855 - 3.1415927;
    ps = sin(r7.z);
    r7.w = r6.w + r1.y;
    r6.w = ps;
    ps = cos(r7.z);
    r0.z = r7.w + r7.w;
    r7.z = ps;
    r7.w = r12.x * -r0.z + r7.w;
    ps = 1.0 / r7.z;
    r1.x = r7.w * 0.15915494;
    r10.z = ps;
    ps = -abs(r1.x);
    r5.xzw = r10.zyx * r6.wxz;
    ps = 1.0 + ps;
    r0.w = r5.x * r5.y;
    r6.x = ps;
    r6.x = (-r1.x > 0.0) ? r6.x : r1.x;
    r6.x = r6.x * UniformVector_1.x + UniformVector_2.x;
    r5.x = r6.x + r0.w;
    r10.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r11.x = tex2D(ShadowTexture, r0.xy).x;
    r7.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.w = dot(r2.zxy, r2.zxy);
    r1.yzw = r7.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(-r2.w + 1.0);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyz = r6.www * r2.xyz;
    r6.z = ps;
    r0.xyz = r6.zzz * r4.zxy;
    ps = log2(r6.x);
    r6.z = dot(r1.ywz, r1.ywz);
    r6.x = ps;
    r4.x = float((r6.y >= UniformScalar_0.x));
    ps = rsqrt(abs(r6.z));
    r11.y = float((UniformScalar_0.x >= r6.y));
    r6.y = ps;
    r2.xyz = r1.wzy * r6.yyy;
    r4.y = float((r8.x >= UniformScalar_2.x));
    r6.y = dot(r2.zxy, r0.xyz);
    ps = LightColorAndFalloffExponent.w * r6.x;
    r1.yzw = r2.zyx * r6.yyy;
    r6.w = ps;
    r6.xy = (r4.xy > 0.0) ? r11.yz : 1.0;
    r1.yzw = r1.wzy * 2.0 - r0.yzx;
    ps = r6.x * r6.y;
    r11.yz = r5.zw + 0.125;
    r6.x = ps;
    ps = pow(2.0, r6.w);
    r6.yz = r11.xz * r11.xy;
    r7.w = ps;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r6.yyy * r10.xyz;
    r6.yzw = r6.zzz * r8.yzw + ModShadowColor.xyz;
    if (!p0)
    {
        ps = r1.x;
        r0.x = ps;
    }
    if (p0)
    {
        r0.x = -abs(r1.x) + 1.0;
    }
    r0.x = r0.x * UniformVector_1.x + UniformVector_2.x;
    r5.x = r0.x + r0.w;
    r0.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r0.xyz = r6.xxx * r0.xyz;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r0.xyz * r9.xyz;
    if (p0)
    {
        r1.x = -abs(r1.x) + 1.0;
    }
    r1.x = r1.x * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r6.x;
    r5.x = r1.x + r0.w;
    r0.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r0.w = saturate(dot(r2.zxy, r7.zxy));
    r2.xyz = r5.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = rsqrt(abs(r2.w));
    r7.z = saturate(dot(r7.zxy, r1.wyz));
    r7.x = ps;
    ps = UniformScalar_9.x;
    r1.yzw = r7.xxx * -SpotDirection.xyz;
    r1.x = ps;
    ps = 0.0001;
    r7.x = dot(r1.wyz, r3.zxy);
    r1.y = ps;
    ps = max(r1.x, r1.y);
    r7.x = r7.x - SpotAngles.x;
    r7.y = ps;
    ps = log2(r7.z);
    r7.x = saturate(r7.x * SpotAngles.y);
    r7.z = ps;
    r7.xy = r7.xy * r7.xz;
    ps = pow(2.0, r7.y);
    r1.xyz = r6.xxx * r2.xyz;
    r6.x = ps;
    r1.xyz = r1.xyz * r6.xxx;
    r1.xy = r0.xy * r0.ww + r1.xy;
    r1.z = r0.z * r0.w + r1.z;
    r0.xyz = r1.xyz * r7.www;
    r0.xyz = r4.xyz * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xyz * r7.xxx;
    r6.xyz = r7.xyz * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
