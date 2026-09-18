// ps_fe63ffdabb70a99a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10040C00 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
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
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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

    r7.xy = r0.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r6.y = UniformScalar_1.x * (-1.2);
    r6.x = ps;
    r6.w = dot(r7.yx, r7.yx) + 0.0;
    ps = max(abs(r7.x), abs(r7.y));
    r7.z = min(r7.x, r7.y);
    r6.z = ps;
    ps = max(r7.x, r7.y);
    r10.x = float((-r7.z > r7.z));
    r7.z = ps;
    ps = 1.0 / r6.z;
    r10.w = float((r7.z >= -r7.z));
    r6.z = ps;
    ps = min(abs(r7.x), abs(r7.y));
    r7.z = dot(r4.zxy, r4.zxy);
    r7.w = ps;
    r10.z = r7.w * r6.z;
    r0.xy = r10.xz * r10.wz;
    r6.z = r0.y * 0.0208351 - 0.085133;
    r6.z = r0.y * r6.z;
    r6.yz = r6.yz + float2(0.8, 0.180141);
    ps = 0.24999972 * r6.y;
    r0.w = r0.y * r6.z;
    r0.z = ps;
    r6.yz = r0.zw + float2(0.5, -0.3302995);
    ps = UniformVector_1.y * r6.x;
    r7.w = frac(r6.y);
    r10.y = ps;
    ps = r0.y;
    r0.z = float((-r7.y > r7.y));
    ps = r6.z * ps;
    r6.x = r7.w * 6.2831855;
    r6.y = ps;
    ps = sqrt(abs(r6.w));
    r6.xy = r6.xy + float2(-3.1415927, 0.999866);
    r9.w = ps;
    ps = sin(r6.x);
    r9.y = -r9.w + UniformScalar_0.x;
    r9.x = ps;
    ps = cos(r6.x);
    r0.w = r10.z * r6.y;
    r6.z = ps;
    ps = 1.0 / r6.z;
    r6.xy = r0.wz * float2(-2.0, -3.1415927);
    r10.x = ps;
    ps = 1.5707964 + r6.x;
    r9.z = float((abs(r7.x) > abs(r7.y)));
    r10.z = ps;
    r6.xzw = r10.zxy * r9.zxy;
    r7.x = r6.x + r0.w;
    r6.y = r7.x + r6.y;
    ps = UniformVector_2.y + r6.w;
    r7.x = r6.y + r6.y;
    r3.y = ps;
    r6.y = r0.x * -r7.x + r6.y;
    ps = r6.z;
    r7.w = r6.y * 0.15915494;
    ps = r3.y * ps;
    r6.x = -abs(r7.w) + 1.0;
    r6.z = ps;
    r6.x = (-r7.w > 0.0) ? r6.x : r7.w;
    r6.x = r6.x * UniformVector_1.x + UniformVector_2.x;
    r3.x = r6.x + r6.z;
    r6.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r0.xzw = r6.wyx * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r6.x = saturate(OpacityOverride.x);
    r6.y = ps;
    r7.xyz = r6.yyy * r4.zxy;
    r6.w = dot(r0.xwz, r0.xwz);
    r0.y = float((r9.w >= UniformScalar_0.x));
    ps = rsqrt(abs(r6.w));
    r6.y = float((UniformScalar_0.x >= r9.w));
    r6.w = ps;
    r10.xyz = r0.xzw * r6.www;
    r0.z = float((r9.y >= UniformScalar_2.x));
    r6.w = float((UniformScalar_2.x >= r9.y));
    r0.x = dot(r10.xzy, r7.xyz);
    r6.yw = (r0.yz > 0.0) ? r6.yw : 1.0;
    r0.xyz = r10.xyz * r0.xxx;
    r7.xyz = r0.zyx * 2.0 - r7.yzx;
    p0 = (-r7.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.y = r6.y * r6.w;
    if (!p0)
    {
        ps = r7.w;
        r6.w = ps;
    }
    if (p0)
    {
        r6.w = -abs(r7.w) + 1.0;
    }
    r6.w = r6.w * UniformVector_1.x + UniformVector_2.x;
    r3.x = r6.w + r6.z;
    r0.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = r6.yyy * r0.xyz;
    p0 = (-r7.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r9.xyz = r0.xyz * r4.xyz;
    if (!p0)
    {
        ps = r7.w;
        r6.w = ps;
    }
    if (p0)
    {
        r6.w = -abs(r7.w) + 1.0;
    }
    r6.w = r6.w * UniformVector_1.x + UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.x = r6.w + r6.z;
    r0.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -ModShadowColor.zyx + 1.0;
    r0.x = ps;
    r0.xy = r0.xy * abs(r8.xy);
    r0.xy = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r11.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r8.xyz = r10.xxx * r1.xyz;
    r11.xyz = r11.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.w));
    r0.yz = r0.xy * 0.875;
    r6.w = ps;
    r2.xyz = r6.www * r2.xyz;
    ps = UniformScalar_9.x;
    r7.x = saturate(dot(r2.zxy, r7.zxy));
    r7.y = ps;
    ps = 0.0001;
    r6.w = r2.z + 0.1;
    r7.z = ps;
    ps = max(r7.y, r7.z);
    r6.w = saturate(r6.w * 5.0);
    r0.x = ps;
    ps = log2(r7.x);
    r6.w = -r6.w + 1.0;
    r0.w = ps;
    r7.xy = -r6.ww * ModShadowGroupColor.yx + 1.0;
    r0.yz = r0.zy * r7.xy + 0.125;
    r0.xw = r0.zx * r0.yw;
    r0.xyz = r0.xxx * r12.zxy + ModShadowColor.xzy;
    ps = pow(2.0, r0.w);
    r7.xyz = r6.yyy * r11.xyz;
    r6.w = ps;
    r1.xyz = r6.www * r1.xyz;
    p0 = (-r7.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r7.xyz = r1.xyz * r7.xyz;
    r7.xyz = r8.xzy * r9.xzy + r7.xzy;
    if (!p0)
    {
        ps = r7.w;
        r6.w = ps;
    }
    if (p0)
    {
        r6.w = -abs(r7.w) + 1.0;
    }
    r6.w = r6.w * UniformVector_1.x + UniformVector_2.x;
    r3.x = r6.w + r6.z;
    r1.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r6.w = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.w));
    r1.xyz = r6.yyy * r1.xyz;
    r6.w = ps;
    r2.xyz = r1.xyz * UniformScalar_6.xxx + UniformVector_0.xyz;
    r1.xyz = r6.www * r5.xyz;
    r6.w = dot(r1.zxy, r10.xzy);
    r1.xy = r6.ww * float2(-0.5, 0.5) + 0.5;
    p0 = (-r7.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xy = abs(r1.yx) * abs(r1.yx);
    if (!p0)
    {
        ps = r7.w;
        r6.w = ps;
    }
    if (p0)
    {
        r6.w = -abs(r7.w) + 1.0;
    }
    r6.w = r6.w * UniformVector_1.x + UniformVector_2.x;
    r3.x = r6.w + r6.z;
    r5.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r5.xyz = r6.yyy * r5.xyz;
    r5.xyz = r5.xyz * r4.xyz;
    p0 = (-r7.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xzw = r5.xyz * r1.xxx;
    if (p0)
    {
        r7.w = -abs(r7.w) + 1.0;
    }
    r6.w = r7.w * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r6.y;
    r3.x = r6.w + r6.z;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r3.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    ps = 1.0 - r6.x;
    r3.xyz = r6.yyy * r3.xyz;
    r6.x = ps;
    r6.w = float((r6.x >= 0.004));
    r6.xyz = r3.xyz * r4.xyz;
    r6.xyz = r6.xzy * r1.yyy;
    r6.xyz = r6.xyz * LowerSkyColor.xzy + r7.xyz;
    r6.xyz = r1.xwz * UpperSkyColor.xzy + r6.xyz;
    r6.xyz = r9.xzy * AmbientColorAndSkyFactor.xzy + r6.xyz;
    r6.xyz = r6.xzy + r2.xyz;
    r6.xyz = r6.xzy * r0.xyz;
    ps = OpacityOverride.x - r3.w;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
