// ps_396ca417945e2863.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 285 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000474 10040A00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r3.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.zw = r1.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r6.y = r2.z + 0.1;
    r6.x = ps;
    ps = UniformVector_1.y * r6.x;
    r0.w = min(abs(r6.z), abs(r6.w));
    r0.z = ps;
    ps = 5.0 * r6.y;
    r8.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = saturate(ps);
    ps = 1.0 / r5.w;
    r7.w = float((abs(r6.z) > abs(r6.w)));
    r7.y = ps;
    r6.y = dot(r6.wz, r6.wz) + 0.0;
    ps = max(abs(r6.z), abs(r6.w));
    r9.x = float((-r6.w > r6.w));
    r1.x = ps;
    ps = min(r6.z, r6.w);
    r7.yz = r7.yy * ScreenPositionScaleBias.xy;
    r1.y = ps;
    r7.yz = r7.yz * r5.xy + ScreenPositionScaleBias.wz;
    ps = max(r6.z, r6.w);
    r5.x = float((-r1.y > r1.y));
    r6.z = ps;
    ps = 1.0 / r1.x;
    r5.w = float((r6.z >= -r6.z));
    r6.w = ps;
    ps = sqrt(abs(r6.y));
    r6.x = -r6.x + 1.0;
    r6.y = ps;
    r6.xz = -r6.xx * ModShadowGroupColor.yx + 1.0;
    ps = UniformScalar_0.x - r6.y;
    r5.z = r0.w * r6.w;
    r8.x = ps;
    r5.y = r0.z * r8.x + UniformVector_2.y;
    r3.xy = r5.xz * r5.wz;
    r1.xyw = r3.zwy * float3(0.875, 0.875, 0.0208351);
    ps = UniformScalar_1.x;
    r6.w = r1.w - 0.085133;
    r6.w = r3.y * r6.w + 0.180141;
    r6.w = r3.y * r6.w - 0.3302995;
    ps = (-1.2) * ps;
    r0.w = r3.y * r6.w;
    r0.z = ps;
    r9.zw = r0.zw + float2(0.8, 0.999866);
    r9.y = r5.z * r9.w;
    r5.xzw = r9.zxy * float3(0.24999972, -3.1415927, -2.0);
    r0.zw = r5.xw + float2(0.5, 1.5707964);
    r6.w = r0.w * r7.w + r9.y;
    ps = frac(r0.z);
    r10.x = float((r6.y >= UniformScalar_0.x));
    r7.w = ps;
    r7.w = r7.w * 6.2831855 - 3.1415927;
    ps = sin(r7.w);
    r0.z = r6.w + r5.z;
    r6.w = ps;
    ps = cos(r7.w);
    r0.w = r0.z + r0.z;
    r7.w = ps;
    r0.z = r3.x * -r0.w + r0.z;
    ps = 1.0 / r7.w;
    r0.z = r0.z * 0.15915494;
    r1.z = ps;
    ps = -abs(r0.z);
    r5.xzw = r1.zyx * r6.wxz;
    ps = 1.0 + ps;
    r7.w = r5.x * r5.y;
    r6.x = ps;
    r6.x = (-r0.z > 0.0) ? r6.x : r0.z;
    r6.x = r6.x * UniformVector_1.x + UniformVector_2.x;
    r5.x = r6.x + r7.w;
    r3.xyz = tex2D(LightAttenuationTexture, r7.yz).xyz;
    r9.x = tex2D(ShadowTexture, r0.xy).x;
    r6.xzw = tex2D(Texture2D_0, r5.xy).xyz;
    r1.xyz = r6.wzx * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r6.z = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r6.xzw = r6.xxx * r4.zxy;
    r0.x = dot(r1.xzy, r1.xzy);
    ps = rsqrt(abs(r0.x));
    r4.x = float((UniformScalar_0.x >= r6.y));
    r6.y = ps;
    ps = r0.w;
    r1.xyz = r1.zyx * r6.yyy;
    ps = r2.x * ps;
    r10.y = float((r8.x >= UniformScalar_2.x));
    r0.x = ps;
    ps = r0.w;
    r4.y = float((UniformScalar_2.x >= r8.x));
    ps = r2.y * ps;
    r6.y = dot(r1.zxy, r6.xzw);
    r0.y = ps;
    ps = r0.w;
    r9.yzw = r1.zyx * r6.yyy;
    r4.xy = (r10.xy > 0.0) ? r4.xy : 1.0;
    r6.yzw = r9.wzy * 2.0 - r6.zwx;
    ps = r2.z * ps;
    r9.yz = r5.zw + 0.125;
    r0.w = ps;
    ps = r4.x * r4.y;
    r2.xy = r9.xz * r9.xy;
    r6.x = ps;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r2.xxx * r3.xyz;
    r2.xyz = r2.yyy * r8.yzw + ModShadowColor.xyz;
    if (!p0)
    {
        ps = r0.z;
        r1.w = ps;
    }
    if (p0)
    {
        r1.w = -abs(r0.z) + 1.0;
    }
    r1.w = r1.w * UniformVector_1.x + UniformVector_2.x;
    r5.x = r1.w + r7.w;
    r4.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r4.xyz = r6.xxx * r4.xyz;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r4.xyz * r7.xyz;
    if (p0)
    {
        r0.z = -abs(r0.z) + 1.0;
    }
    r0.z = r0.z * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r6.x;
    r5.x = r0.z + r7.w;
    r7.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r4.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r7.w = max(UniformScalar_9.x, 0.0001);
    r4.xyz = r4.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    r6.y = saturate(dot(r0.wxy, r6.wyz));
    ps = log2(r6.y);
    r6.w = saturate(dot(r1.zxy, r0.wxy));
    r6.y = ps;
    r6.y = r7.w * r6.y;
    ps = pow(2.0, r6.y);
    r0.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    r6.xyz = r0.xyz * r6.xxx;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r3.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xyz;
    r6.xyz = r6.xyz * r2.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
