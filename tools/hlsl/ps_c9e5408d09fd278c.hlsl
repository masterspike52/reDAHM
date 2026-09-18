// ps_c9e5408d09fd278c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10040900 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r6.xy = r0.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r5.y = UniformScalar_1.x * (-1.2);
    r5.x = ps;
    r5.w = dot(r6.yx, r6.yx) + 0.0;
    ps = max(abs(r6.x), abs(r6.y));
    r6.z = min(r6.x, r6.y);
    r5.z = ps;
    ps = max(r6.x, r6.y);
    r9.x = float((-r6.z > r6.z));
    r6.z = ps;
    ps = 1.0 / r5.z;
    r9.w = float((r6.z >= -r6.z));
    r5.z = ps;
    ps = min(abs(r6.x), abs(r6.y));
    r6.z = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    r9.z = r6.w * r5.z;
    r0.xy = r9.xz * r9.wz;
    r5.z = r0.y * 0.0208351 - 0.085133;
    r5.z = r0.y * r5.z;
    r5.yz = r5.yz + float2(0.8, 0.180141);
    ps = 0.24999972 * r5.y;
    r0.w = r0.y * r5.z;
    r0.z = ps;
    r5.yz = r0.zw + float2(0.5, -0.3302995);
    ps = UniformVector_1.y * r5.x;
    r6.w = frac(r5.y);
    r9.y = ps;
    ps = r0.y;
    r0.z = float((-r6.y > r6.y));
    ps = r5.z * ps;
    r5.x = r6.w * 6.2831855;
    r5.y = ps;
    ps = sqrt(abs(r5.w));
    r5.xy = r5.xy + float2(-3.1415927, 0.999866);
    r6.w = ps;
    ps = sin(r5.x);
    r8.y = -r6.w + UniformScalar_0.x;
    r8.x = ps;
    ps = cos(r5.x);
    r0.w = r9.z * r5.y;
    r5.z = ps;
    ps = 1.0 / r5.z;
    r5.xy = r0.wz * float2(-2.0, -3.1415927);
    r9.x = ps;
    ps = 1.5707964 + r5.x;
    r8.z = float((abs(r6.x) > abs(r6.y)));
    r9.z = ps;
    r5.xzw = r9.zxy * r8.zxy;
    r6.x = r5.x + r0.w;
    r5.y = r6.x + r5.y;
    ps = UniformVector_2.y + r5.w;
    r6.x = r5.y + r5.y;
    r0.y = ps;
    r5.y = r0.x * -r6.x + r5.y;
    ps = r5.z;
    r0.z = r5.y * 0.15915494;
    ps = r0.y * ps;
    r5.x = -abs(r0.z) + 1.0;
    r0.w = ps;
    r5.x = (-r0.z > 0.0) ? r5.x : r0.z;
    r5.x = r5.x * UniformVector_1.x + UniformVector_2.x;
    r0.x = r5.x + r0.w;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = r5.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r5.z = saturate(OpacityOverride.x);
    r5.x = ps;
    r6.xyz = r5.xxx * r3.zxy;
    r5.x = dot(r9.xzy, r9.xzy);
    r3.z = float((r6.w >= UniformScalar_0.x));
    ps = rsqrt(abs(r5.x));
    r3.x = float((UniformScalar_0.x >= r6.w));
    r5.x = ps;
    r5.xyw = r9.yzx * r5.xxx;
    r3.w = float((r8.y >= UniformScalar_2.x));
    r3.y = float((UniformScalar_2.x >= r8.y));
    r6.w = dot(r5.wyx, r6.xyz);
    r3.xy = (r3.zw > 0.0) ? r3.xy : 1.0;
    r8.xyz = r5.wxy * r6.www;
    r8.xyz = r8.zyx * 2.0 - r6.yzx;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.y = r3.x * r3.y;
    if (!p0)
    {
        ps = r0.z;
        r6.x = ps;
    }
    if (p0)
    {
        r6.x = -abs(r0.z) + 1.0;
    }
    r6.x = r6.x * UniformVector_1.x + UniformVector_2.x;
    r0.x = r6.x + r0.w;
    r6.xzw = tex2D(Texture2D_1, r0.xy).xyz;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r6.xzw = r6.yyy * r6.xzw;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r6.xzw * r2.xyz;
    if (!p0)
    {
        ps = r0.z;
        r6.x = ps;
    }
    if (p0)
    {
        r6.x = -abs(r0.z) + 1.0;
    }
    r6.x = r6.x * UniformVector_1.x + UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.x = r6.x + r0.w;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xzw = -ModShadowColor.zyx + 1.0;
    r7.z = ps;
    r7.xy = r7.zw * abs(r7.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r9.xyz = r9.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r7.yz = r7.xy * 0.875;
    r0.x = ps;
    ps = ConstantLighting.x * r5.w;
    r1.xyz = r0.xxx * r1.xyz;
    r7.x = ps;
    ps = UniformScalar_9.x;
    r1.y = saturate(dot(r1.zxy, r8.zxy));
    r1.x = ps;
    ps = 0.0001;
    r0.x = r1.z + 0.1;
    r1.z = ps;
    ps = max(r1.x, r1.z);
    r0.x = saturate(r0.x * 5.0);
    r1.x = ps;
    ps = log2(r1.y);
    r0.x = -r0.x + 1.0;
    r1.w = ps;
    r1.yz = -r0.xx * ModShadowGroupColor.yx + 1.0;
    r1.yz = r7.zy * r1.yz + 0.125;
    ps = ConstantLighting.y * r5.w;
    r1.xw = r1.zx * r1.yw;
    r7.y = ps;
    r6.xzw = r1.xxx * r6.wxz + ModShadowColor.xzy;
    ps = pow(2.0, r1.w);
    r1.xyz = r6.yyy * r9.xyz;
    r0.x = ps;
    ps = ConstantLighting.z * r5.w;
    r8.xyz = r0.xxx * ConstantLighting.xyz;
    r7.z = ps;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = r8.xyz * r1.xyz;
    r7.xyz = r7.xzy * r3.xzy + r1.xzy;
    if (!p0)
    {
        ps = r0.z;
        r0.x = ps;
    }
    if (p0)
    {
        r0.x = -abs(r0.z) + 1.0;
    }
    r0.x = r0.x * UniformVector_1.x + UniformVector_2.x;
    r0.x = r0.x + r0.w;
    r1.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r0.x));
    r1.xyz = r6.yyy * r1.xyz;
    r0.x = ps;
    r1.xyz = r1.xyz * UniformScalar_6.xxx + UniformVector_0.xyz;
    r4.xyz = r0.xxx * r4.xyz;
    r5.x = dot(r4.zxy, r5.wyx);
    r5.xy = r5.xx * float2(-0.5, 0.5) + 0.5;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xy = abs(r5.yx) * abs(r5.yx);
    if (!p0)
    {
        ps = r0.z;
        r5.w = ps;
    }
    if (p0)
    {
        r5.w = -abs(r0.z) + 1.0;
    }
    r5.w = r5.w * UniformVector_1.x + UniformVector_2.x;
    r0.x = r5.w + r0.w;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r4.xyz = r6.yyy * r4.xyz;
    r4.xyz = r4.xyz * r2.xyz;
    p0 = (-r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r4.xyz * r5.xxx;
    if (p0)
    {
        r0.z = -abs(r0.z) + 1.0;
    }
    r5.x = r0.z * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r6.y;
    r0.x = r5.x + r0.w;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 - r5.z;
    r0.xyz = r6.yyy * r0.xyz;
    r5.x = ps;
    r5.w = float((r5.x >= 0.004));
    r0.xyz = r0.xyz * r2.xyz;
    r5.xyz = r0.xzy * r5.yyy;
    r5.xyz = r5.xyz * LowerSkyColor.xzy + r7.xyz;
    r5.xyz = r4.xzy * UpperSkyColor.xzy + r5.xyz;
    r5.xyz = r3.xzy * AmbientColorAndSkyFactor.xzy + r5.xyz;
    r5.xyz = r5.xzy + r1.xyz;
    r5.xyz = r5.xzy * r6.xzw;
    ps = OpacityOverride.x - r2.w;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
