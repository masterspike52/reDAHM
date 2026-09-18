// ps_77fe18ffc2789298.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10040B00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c17); // float3
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
sampler2D LightMapTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r7.xy = r1.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r6.y = UniformScalar_1.x * (-1.2);
    r6.x = ps;
    r6.w = dot(r7.yx, r7.yx) + 0.0;
    ps = max(abs(r7.x), abs(r7.y));
    r7.z = min(r7.x, r7.y);
    r6.z = ps;
    ps = max(r7.x, r7.y);
    r1.y = float((-r7.z > r7.z));
    r7.z = ps;
    ps = 1.0 / r6.z;
    r1.w = float((r7.z >= -r7.z));
    r6.z = ps;
    ps = min(abs(r7.x), abs(r7.y));
    r7.w = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    r1.z = r7.z * r6.z;
    r0.zw = r1.yz * r1.wz;
    r6.z = r0.w * 0.0208351 - 0.085133;
    r6.z = r0.w * r6.z;
    r6.yz = r6.yz + float2(0.8, 0.180141);
    ps = 0.24999972 * r6.y;
    r9.y = r0.w * r6.z;
    r9.x = ps;
    r6.yz = r9.xy + float2(0.5, -0.3302995);
    ps = UniformVector_1.y * r6.x;
    r7.z = frac(r6.y);
    r10.y = ps;
    ps = r0.w;
    r1.x = float((-r7.y > r7.y));
    ps = r6.z * ps;
    r6.x = r7.z * 6.2831855;
    r6.y = ps;
    ps = sqrt(abs(r6.w));
    r6.xy = r6.xy + float2(-3.1415927, 0.999866);
    r7.z = ps;
    ps = sin(r6.x);
    r9.y = -r7.z + UniformScalar_0.x;
    r9.x = ps;
    ps = cos(r6.x);
    r1.y = r1.z * r6.y;
    r6.z = ps;
    ps = 1.0 / r6.z;
    r6.xy = r1.yx * float2(-2.0, -3.1415927);
    r10.x = ps;
    ps = 1.5707964 + r6.x;
    r9.z = float((abs(r7.x) > abs(r7.y)));
    r10.z = ps;
    r6.xzw = r10.zxy * r9.zxy;
    r7.x = r6.x + r1.y;
    r6.y = r7.x + r6.y;
    ps = UniformVector_2.y + r6.w;
    r7.x = r6.y + r6.y;
    r0.w = ps;
    r6.y = r0.z * -r7.x + r6.y;
    ps = r6.z;
    r1.x = r6.y * 0.15915494;
    ps = r0.w * ps;
    r6.x = -abs(r1.x) + 1.0;
    r7.x = ps;
    r6.x = (-r1.x > 0.0) ? r6.x : r1.x;
    r6.x = r6.x * UniformVector_1.x + UniformVector_2.x;
    r0.z = r6.x + r7.x;
    r6.xyz = tex2D(Texture2D_0, r0.zw).xyz;
    r10.xyz = r6.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r6.x = saturate(OpacityOverride.x);
    r6.y = ps;
    r6.yzw = r6.yyy * r4.zxy;
    r7.y = dot(r10.xzy, r10.xzy);
    r1.y = float((r7.z >= UniformScalar_0.x));
    ps = rsqrt(abs(r7.y));
    r7.z = float((UniformScalar_0.x >= r7.z));
    r7.y = ps;
    r4.xyz = r10.xyz * r7.yyy;
    r1.z = float((r9.y >= UniformScalar_2.x));
    r7.w = float((UniformScalar_2.x >= r9.y));
    r7.y = dot(r4.xzy, r6.yzw);
    r1.yz = (r1.yz > 0.0) ? r7.zw : 1.0;
    r7.yzw = r4.xyz * r7.yyy;
    r7.yzw = r7.wzy * 2.0 - r6.zwy;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.w = r1.y * r1.z;
    if (!p0)
    {
        ps = r1.x;
        r6.y = ps;
    }
    if (p0)
    {
        r6.y = -abs(r1.x) + 1.0;
    }
    r6.y = r6.y * UniformVector_1.x + UniformVector_2.x;
    r0.z = r6.y + r7.x;
    r3.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r1.yzw = -UniformVector_0.xyz + 1.0;
    r3.xyz = r6.www * r3.xyz;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.xyz = r3.xyz * r1.yzw;
    if (!p0)
    {
        ps = r1.x;
        r6.y = ps;
    }
    if (p0)
    {
        r6.y = -abs(r1.x) + 1.0;
    }
    r6.y = r6.y * UniformVector_1.x + UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = r6.y + r7.x;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.zyx + 1.0;
    r6.y = ps;
    r6.yz = r6.yz * abs(r8.xy);
    r8.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r0.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r0.xyz = r0.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    r9.xyz = r8.zyx * LightMapScale.zyx;
    ps = UniformScalar_9.x;
    r2.w = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r2.w));
    r8.xyz = r9.zyx * r4.xxx;
    r2.w = ps;
    ps = 0.0001;
    r2.xyz = r2.www * r2.xzy;
    r11.y = ps;
    ps = max(r11.x, r11.y);
    r7.w = saturate(dot(r2.yxz, r7.wyz));
    r2.x = ps;
    ps = 0.875 * r6.y;
    r7.z = r2.y + 0.1;
    r7.y = ps;
    ps = 0.875 * r6.z;
    r2.y = saturate(r7.z * 5.0);
    r7.z = ps;
    ps = log2(r7.w);
    r6.y = -r2.y + 1.0;
    r2.w = ps;
    r6.yz = -r6.yy * ModShadowGroupColor.yx + 1.0;
    r2.yz = r7.zy * r6.yz + 0.125;
    r6.yz = r2.xz * r2.wy;
    r7.yzw = r6.zzz * r10.zxy + ModShadowColor.xzy;
    ps = pow(2.0, r6.y);
    r0.xyz = r6.www * r0.xyz;
    r6.y = ps;
    r2.xyz = r9.zyx * r6.yyy;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.xyz = r2.xyz * r0.xyz;
    r8.xyz = r8.xzy * r3.xzy + r0.xzy;
    if (!p0)
    {
        ps = r1.x;
        r6.y = ps;
    }
    if (p0)
    {
        r6.y = -abs(r1.x) + 1.0;
    }
    r6.y = r6.y * UniformVector_1.x + UniformVector_2.x;
    r0.z = r6.y + r7.x;
    r0.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r6.y = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.y));
    r0.xyz = r6.www * r0.xyz;
    r6.y = ps;
    r2.xyz = r0.xyz * UniformScalar_6.xxx + UniformVector_0.xyz;
    r0.xyz = r6.yyy * r5.xyz;
    r6.y = dot(r0.zxy, r4.xzy);
    r6.yz = r6.yy * float2(-0.5, 0.5) + 0.5;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r6.yz = abs(r6.zy) * abs(r6.zy);
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
    r0.z = r0.x + r7.x;
    r0.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r0.xyz = r6.www * r0.xyz;
    r0.xyz = r0.xyz * r1.yzw;
    p0 = (-r1.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.xyz = r0.xyz * r6.yyy;
    if (p0)
    {
        r1.x = -abs(r1.x) + 1.0;
    }
    r6.y = r1.x * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r6.w;
    r0.z = r6.y + r7.x;
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r0.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    ps = 1.0 - r6.x;
    r0.xyz = r6.www * r0.xyz;
    r6.x = ps;
    r6.w = float((r6.x >= 0.004));
    r0.xyz = r0.xyz * r1.yzw;
    r6.xyz = r0.xzy * r6.zzz;
    r6.xyz = r6.xyz * LowerSkyColor.xzy + r8.xyz;
    r6.xyz = r4.xzy * UpperSkyColor.xzy + r6.xyz;
    r6.xyz = r3.xzy * AmbientColorAndSkyFactor.xzy + r6.xyz;
    r6.xyz = r6.xzy + r2.xyz;
    r6.xyz = r6.xzy * r7.yzw;
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
