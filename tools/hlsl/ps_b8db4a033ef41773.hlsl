// ps_b8db4a033ef41773.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10040A00 00000506 00000000 000048A5 001F001F 00000021 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r2.xy = r0.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r0.y = UniformScalar_1.x * (-1.2);
    r0.x = ps;
    r0.w = dot(r2.yx, r2.yx) + 0.0;
    ps = max(abs(r2.x), abs(r2.y));
    r1.w = min(r2.x, r2.y);
    r0.z = ps;
    ps = max(r2.x, r2.y);
    r8.y = float((-r1.w > r1.w));
    r1.w = ps;
    ps = 1.0 / r0.z;
    r8.w = float((r1.w >= -r1.w));
    r0.z = ps;
    ps = min(abs(r2.x), abs(r2.y));
    r6.y = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    r8.z = r1.w * r0.z;
    r6.xz = r8.zy * r8.zw;
    r0.z = r6.x * 0.0208351 - 0.085133;
    r0.z = r6.x * r0.z;
    r0.yz = r0.yz + float2(0.8, 0.180141);
    ps = 0.24999972 * r0.y;
    r7.y = r6.x * r0.z;
    r7.x = ps;
    r0.yz = r7.xy + float2(0.5, -0.3302995);
    ps = UniformVector_1.y * r0.x;
    r1.w = frac(r0.y);
    r9.y = ps;
    ps = r6.x;
    r8.x = float((-r2.y > r2.y));
    ps = r0.z * ps;
    r0.x = r1.w * 6.2831855;
    r0.y = ps;
    ps = sqrt(abs(r0.w));
    r0.xy = r0.xy + float2(-3.1415927, 0.999866);
    r6.x = ps;
    ps = sin(r0.x);
    r7.y = -r6.x + UniformScalar_0.x;
    r7.x = ps;
    ps = cos(r0.x);
    r8.y = r8.z * r0.y;
    r0.z = ps;
    ps = 1.0 / r0.z;
    r0.xy = r8.yx * float2(-2.0, -3.1415927);
    r9.x = ps;
    ps = 1.5707964 + r0.x;
    r7.z = float((abs(r2.x) > abs(r2.y)));
    r9.z = ps;
    r0.xzw = r9.zxy * r7.zxy;
    r1.w = r0.x + r8.y;
    r0.y = r1.w + r0.y;
    ps = UniformVector_2.y + r0.w;
    r1.w = r0.y + r0.y;
    r2.y = ps;
    r0.y = r6.z * -r1.w + r0.y;
    ps = r0.z;
    r1.w = r0.y * 0.15915494;
    ps = r2.y * ps;
    r0.x = -abs(r1.w) + 1.0;
    r2.z = ps;
    r0.x = (-r1.w > 0.0) ? r0.x : r1.w;
    r0.x = r0.x * UniformVector_1.x + UniformVector_2.x;
    r2.x = r0.x + r2.z;
    r0.xyz = tex2D(Texture2D_0, r2.xy).xyz;
    r8.xyz = r0.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r0.x = saturate(OpacityOverride.x);
    r0.y = ps;
    r0.yzw = r0.yyy * r3.zxy;
    r3.x = dot(r8.xzy, r8.xzy);
    r6.z = float((r6.x >= UniformScalar_0.x));
    ps = rsqrt(abs(r3.x));
    r6.x = float((UniformScalar_0.x >= r6.x));
    r3.x = ps;
    r3.xyw = r8.yzx * r3.xxx;
    r6.w = float((r7.y >= UniformScalar_2.x));
    r6.y = float((UniformScalar_2.x >= r7.y));
    r3.z = dot(r3.wyx, r0.yzw);
    r6.xy = (r6.zw > 0.0) ? r6.xy : 1.0;
    r7.xyz = r3.wxy * r3.zzz;
    r8.xyz = r7.zyx * 2.0 - r0.zwy;
    p0 = (-r1.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.y = r6.x * r6.y;
    if (!p0)
    {
        ps = r1.w;
        r0.z = ps;
    }
    if (p0)
    {
        r0.z = -abs(r1.w) + 1.0;
    }
    r0.z = r0.z * UniformVector_1.x + UniformVector_2.x;
    r2.x = r0.z + r2.z;
    r6.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.xyz = r0.yyy * r6.xyz;
    p0 = (-r1.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.xyz = r6.xyz * r7.xyz;
    if (!p0)
    {
        ps = r1.w;
        r0.z = ps;
    }
    if (p0)
    {
        r0.z = -abs(r1.w) + 1.0;
    }
    r0.z = r0.z * UniformVector_1.x + UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.x = r0.z + r2.z;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.zyx + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r9.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    r5.xyz = r5.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    r0.z = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.z));
    r9.yz = r9.xy * 0.875;
    r0.z = ps;
    ps = ConstantLighting.x * r3.w;
    r1.xyz = r0.zzz * r1.xzy;
    r9.x = ps;
    ps = UniformScalar_9.x;
    r0.w = saturate(dot(r1.yxz, r8.zxy));
    r1.x = ps;
    ps = 0.0001;
    r0.z = r1.y + 0.1;
    r1.y = ps;
    ps = max(r1.x, r1.y);
    r0.z = saturate(r0.z * 5.0);
    r8.x = ps;
    ps = log2(r0.w);
    r0.z = -r0.z + 1.0;
    r8.w = ps;
    r0.zw = -r0.zz * ModShadowGroupColor.yx + 1.0;
    r8.yz = r9.zy * r0.zw + 0.125;
    ps = ConstantLighting.y * r3.w;
    r0.zw = r8.xz * r8.wy;
    r9.y = ps;
    r1.xyz = r0.www * r10.zxy + ModShadowColor.xzy;
    ps = pow(2.0, r0.z);
    r5.xyz = r0.yyy * r5.xyz;
    r0.z = ps;
    ps = ConstantLighting.z * r3.w;
    r8.xyz = r0.zzz * ConstantLighting.xyz;
    r9.z = ps;
    p0 = (-r1.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r8.xyz * r5.xyz;
    r8.xyz = r9.xzy * r6.xzy + r5.xzy;
    if (!p0)
    {
        ps = r1.w;
        r0.z = ps;
    }
    if (p0)
    {
        r0.z = -abs(r1.w) + 1.0;
    }
    r0.z = r0.z * UniformVector_1.x + UniformVector_2.x;
    r2.x = r0.z + r2.z;
    r5.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r0.z));
    r5.xyz = r0.yyy * r5.xyz;
    r0.z = ps;
    r5.xyz = r5.xyz * UniformScalar_6.xxx + UniformVector_0.xyz;
    r4.xyz = r0.zzz * r4.xyz;
    r0.z = dot(r4.zxy, r3.wyx);
    r0.zw = r0.zz * float2(-0.5, 0.5) + 0.5;
    p0 = (-r1.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.zw = abs(r0.wz) * abs(r0.wz);
    if (!p0)
    {
        ps = r1.w;
        r2.x = ps;
    }
    if (p0)
    {
        r2.x = -abs(r1.w) + 1.0;
    }
    r2.x = r2.x * UniformVector_1.x + UniformVector_2.x;
    r2.x = r2.x + r2.z;
    r3.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    r3.xyz = r0.yyy * r3.xyz;
    r3.xyz = r3.xyz * r7.xyz;
    p0 = (-r1.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r3.xyz * r0.zzz;
    if (p0)
    {
        r1.w = -abs(r1.w) + 1.0;
    }
    r0.z = r1.w * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r0.y;
    r2.x = r0.z + r2.z;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r2.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    ps = 1.0 - r0.x;
    r2.xyz = r0.yyy * r2.xyz;
    r0.x = ps;
    r1.w = float((r0.x >= 0.004));
    r0.xyz = r2.xyz * r7.xyz;
    r0.xyz = r0.xzy * r0.www;
    r0.xyz = r0.xyz * LowerSkyColor.xzy + r8.xyz;
    r0.xyz = r3.xzy * UpperSkyColor.xzy + r0.xyz;
    r0.xyz = r6.xzy * AmbientColorAndSkyFactor.xzy + r0.xyz;
    r0.xyz = r0.xzy + r5.xyz;
    r0.xyz = r0.xzy * r1.xyz;
    ps = OpacityOverride.x - r2.w;
    r3.xyz = r0.xzy - r0.xzy;
    r3.w = ps;
    oC0.w = r3.w * r1.w + r2.w;
    r0.xyz = r3.xyz * r1.www + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
