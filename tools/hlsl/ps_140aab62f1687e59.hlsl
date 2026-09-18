// ps_140aab62f1687e59.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 573 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000008F4 10040C00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c22); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_11 : register(c16); // float
float4 UniformScalar_13 : register(c17); // float
float4 UniformScalar_14 : register(c18); // float
float4 UniformScalar_15 : register(c19); // float
float4 UniformScalar_16 : register(c20); // float
float4 UniformScalar_17 : register(c21); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D SceneColorTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r0.xy * UniformScalar_2.xx;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.w = tex2D(Texture2D_0, r5.zw).x;
    ps = r0.x;
    r5.z = r0.y - 0.5;
    ps = (-0.5) + ps;
    r6.x = dot(r1.zxy, r1.zxy);
    r7.x = ps;
    r6.z = r5.w * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r5.w = r5.z * r5.z;
    r6.x = ps;
    r5.w = r7.x * r7.x + r5.w;
    ps = rsqrt(abs(r5.w));
    r1.y = r6.x * r1.z;
    r5.w = ps;
    ps = r7.x;
    r4.xyz = UniformVector_1.zyx * UniformVector_1.www;
    ps = r5.w * ps;
    r2.x = r5.z * r5.w;
    r2.y = ps;
    r6.xy = r2.yx * UniformScalar_1.xx;
    ps = r6.x;
    r0.z = r6.y * r6.z;
    ps = r6.z * ps;
    r1.x = r0.z - 1.0;
    r1.z = ps;
    r6.xy = r1.xz + r0.yx;
    ps = r6.x;
    r5.z = r6.y + r1.z;
    ps = r0.z + ps;
    r6.y = r5.z - 1.0;
    r6.x = ps;
    r6.xy = r6.yx + r0.xy;
    ps = min(abs(r6.y), abs(r6.x));
    r9.yzw = -ModShadowColor.zyx + 1.0;
    r6.w = ps;
    ps = max(abs(r6.y), abs(r6.x));
    r9.x = float((abs(r6.y) > abs(r6.x)));
    r1.x = ps;
    ps = min(r6.y, r6.x);
    r5.z = float((-r6.x > r6.x));
    r1.z = ps;
    ps = max(r6.y, r6.x);
    r3.w = float((-r1.z > r1.z));
    r1.z = ps;
    ps = 1.0 / r1.x;
    r7.w = float((r1.z >= -r1.z));
    r1.x = ps;
    r6.w = r6.w * r1.x;
    ps = r6.w * r6.w;
    r10.x = ps;
    ps = 0.875 * r5.x;
    r1.x = r10.x * 0.0208351;
    r3.x = ps;
    ps = 0.875 * r5.y;
    r1.xy = r1.xy + float2(-0.085133, 0.1);
    r3.y = ps;
    ps = (-3.1415927) * r5.z;
    r1.z = saturate(r1.y * 5.0);
    r3.z = ps;
    ps = r10.x;
    r5.x = -r1.z + 1.0;
    r7.yz = -r5.xx * ModShadowGroupColor.yx + 1.0;
    ps = r1.x * ps;
    r1.yzw = r3.yxw * r7.yzw;
    r1.x = ps;
    r10.yzw = r1.yzx + float3(0.125, 0.125, 0.180141);
    r5.xy = r10.xz * r10.wy;
    r8.xyz = r5.yyy * r9.wzy + ModShadowColor.xyz;
    ps = (-0.3302995) + r5.x;
    r5.x = ps;
    r5.x = r10.x * r5.x + 0.999866;
    r5.x = r6.w * r5.x;
    r5.y = r5.x * (-2.0) + 1.5707964;
    r5.x = r5.y * r9.x + r5.x;
    r5.x = r5.x + r3.z;
    ps = r5.x + r5.x;
    r5.y = ps;
    r5.x = r1.w * -r5.y + r5.x;
    ps = OpacityOverride.x;
    r3.y = r5.x * 0.15915494;
    r7.y = saturate(ps);
    p0 = (-r3.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = UniformVector_2.zyx * UniformVector_2.www;
    if (!p0)
    {
        ps = r3.y;
        r5.y = ps;
    }
    if (p0)
    {
        r5.y = -abs(r3.y) + 1.0;
    }
    r5.x = r0.y * 2.0 + r0.z;
    ps = UniformScalar_1.x * r5.w;
    r5.z = ps;
    r5.z = r5.z * r7.x;
    r5.z = dot(r5.zz, r6.zz) + r0.x;
    r5.xz = r5.xz + r0.zx;
    r5.xz = r5.zx - 1.0;
    ps = min(abs(r5.z), abs(r5.x));
    r6.w = ps;
    ps = max(abs(r5.z), abs(r5.x));
    r6.z = float((abs(r5.z) > abs(r5.x)));
    r1.w = ps;
    ps = min(r5.z, r5.x);
    r7.w = float((-r5.x > r5.x));
    r3.x = ps;
    ps = max(r5.z, r5.x);
    r9.x = float((-r3.x > r3.x));
    r3.x = ps;
    ps = 1.0 / r1.w;
    r9.z = float((r3.x >= -r3.x));
    r1.w = ps;
    r9.y = r6.w * r1.w;
    r3.xz = r9.yx * r9.yz;
    r6.w = r3.x * 0.0208351 - 0.085133;
    r6.w = r3.x * r6.w + 0.180141;
    r6.w = r3.x * r6.w - 0.3302995;
    r6.w = r3.x * r6.w + 0.999866;
    ps = UniformScalar_3.x;
    r7.z = r9.y * r6.w;
    ps = -UniformScalar_0.x + ps;
    r3.xw = r7.zw * float2(-2.0, -3.1415927);
    r6.w = ps;
    ps = 0.75 + r5.y;
    r1.w = r3.x + 1.5707964;
    r5.y = ps;
    r6.z = r1.w * r6.z + r7.z;
    ps = frac(r5.y);
    r1.w = r6.z + r3.w;
    r5.y = ps;
    ps = -UniformScalar_0.x - -r5.y;
    r3.x = r1.w + r1.w;
    r6.z = ps;
    r5.y = r3.z * -r3.x + r1.w;
    ps = 1.0 / r6.w;
    r3.x = r5.y * 0.15915494;
    r5.y = ps;
    p0 = (-r3.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r4.w = saturate(r6.z * r5.y);
    if (!p0)
    {
        ps = r3.x;
        r7.z = ps;
    }
    if (p0)
    {
        r7.z = -abs(r3.x) + 1.0;
    }
    ps = r3.x;
    r3.z = ps;
    ps = r3.y;
    r0.w = UniformScalar_14.x * 1.0000007;
    r3.w = ps;
    r5.x = dot(r5.xz, r5.xz) + 0.0;
    r5.y = dot(r6.xy, r6.xy) + 0.0;
    ps = sqrt(abs(r5.y));
    r1.w = UniformScalar_13.x - 0.03;
    r6.y = ps;
    ps = sqrt(abs(r5.x));
    r2.yz = r2.xy * UniformScalar_16.xx;
    r7.w = ps;
    r11.y = r7.w * 0.02 + UniformScalar_6.x;
    ps = UniformScalar_11.x * r6.y;
    r5.yz = -abs(r3.yx) + 1.0;
    r5.x = ps;
    r6.xzw = (-r3.xyy > 0.0) ? r5.zyy : r3.zyw;
    ps = r1.w;
    r12.xyz = r7.zww + float3(0.75, -0.8, -1.0);
    ps = r5.x + ps;
    r12.w = frac(r12.x);
    r5.y = ps;
    r5.yz = r6.xz * UniformScalar_10.xx + r5.yy;
    r9.xy = r0.ww * r5.yz + 0.5;
    r5.yz = saturate(r12.wz * float2(5e+01, 9.999998));
    ps = 1.0 - r5.y;
    r9.z = ps;
    r9.xyw = frac(r9.xyz);
    r6.xz = r9.xy * 6.2831855;
    r9.xyz = r6.zyx + float3(-3.1415927, -0.8, -3.1415927);
    ps = sin(r9.z);
    r0.z = saturate(r9.y * 5.0000005);
    r10.y = ps;
    ps = sin(r9.x);
    r10.x = -r0.z + 1.0;
    r10.z = ps;
    r11.zw = r10.zy * 0.5 + 0.5;
    ps = log2(abs(r11.w));
    r3.z = saturate(r12.y * 5.0000005);
    r5.y = ps;
    ps = UniformScalar_15.x * r5.y;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r2.x = r3.z - r5.z;
    r11.x = ps;
    r9.xyz = r2.xzy * r11.xzz;
    r5.yz = r0.zz * r9.yz + r0.xy;
    ps = (-2.0) * r5.z;
    r11.z = r5.y + r5.y;
    r11.x = ps;
    ps = UniformScalar_4.x * r6.w;
    r5.yz = r11.xz + float2(1.0, -1.0);
    r11.x = ps;
    r5.yz = r5.yz * ScreenPositionScaleBias.yx + ScreenPositionScaleBias.zw;
    r6.xyz = tex2D(SceneColorTexture, r5.zy).xyz;
    r5.y = tex2D(Texture2D_1, r11.xy).x;
    ps = log2(abs(r5.y));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r1.xyz = r1.xyz - r4.xyz;
    r5.y = ps;
    ps = UniformScalar_8.x * r5.y;
    r5.z = saturate(r4.w + r9.w);
    r5.y = ps;
    r1.xyz = r1.zyx * r5.zzz + r4.zyx;
    r6.w = r10.x * 0.8 + 0.2;
    r5.y = r5.y * r3.z + r9.x;
    ps = UniformScalar_11.x * r5.y;
    r5.y = ps;
    p0 = (-r3.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.xyz = r5.yyy * r1.xyz;
    if (!p0)
    {
        ps = r3.y;
        r5.y = ps;
    }
    if (p0)
    {
        r5.y = -abs(r3.y) + 1.0;
    }
    r1.w = r7.w * UniformScalar_11.x + r1.w;
    r5.y = r5.y * UniformScalar_10.x + r1.w;
    r5.y = r0.w * r5.y + 0.5;
    ps = UniformScalar_16.x * r5.w;
    r5.y = frac(r5.y);
    r5.z = ps;
    r5.y = r5.y * 6.2831855 - 3.1415927;
    ps = sin(r5.y);
    r2.x = r5.z * r7.x;
    r5.y = ps;
    r5.y = r5.y * 0.5 + 0.5;
    r5.yz = r2.yx * r5.yy;
    r5.yz = r0.zz * r5.yz + r0.yx;
    ps = (-2.0) * r5.y;
    r4.y = r5.z + r5.z;
    r4.x = ps;
    r5.yz = r4.xy + float2(1.0, -1.0);
    r5.yz = r5.yz * ScreenPositionScaleBias.yx + ScreenPositionScaleBias.zw;
    r5.yzw = tex2D(SceneColorTexture, r5.zy).xyz;
    p0 = (-r3.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.z = dot(r5.wyz, float3(0.11, 0.3, 0.59));
    if (p0)
    {
        r3.x = -abs(r3.x) + 1.0;
    }
    ps = (-0.03) + r5.x;
    r5.y = ps;
    ps = UniformScalar_13.x + r5.y;
    r5.x = ps;
    r5.x = r3.x * UniformScalar_10.x + r5.x;
    r5.x = r0.w * r5.x + 0.5;
    ps = frac(r5.x);
    r5.x = ps;
    r5.x = r5.x * 6.2831855 - 3.1415927;
    ps = sin(r5.x);
    r5.x = ps;
    r5.x = r5.x * 0.5 + 0.5;
    r5.xy = r2.zy * r5.xx;
    r5.xy = r3.zz * r5.yx + r0.yx;
    ps = (-2.0) * r5.x;
    r3.z = r5.y + r5.y;
    r3.x = ps;
    r5.xy = r3.xz + float2(1.0, -1.0);
    r5.xy = r5.xy * ScreenPositionScaleBias.yx + ScreenPositionScaleBias.zw;
    r5.xyw = tex2D(SceneColorTexture, r5.yx).xyz;
    p0 = (-r3.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.x = dot(r5.wxy, float3(0.11, 0.3, 0.59));
    if (p0)
    {
        r3.y = -abs(r3.y) + 1.0;
    }
    r5.y = r3.y * UniformScalar_10.x + r1.w;
    r5.w = r0.w * r5.y + 0.5;
    ps = frac(r5.w);
    r5.y = -r7.y + 1.0;
    r5.w = ps;
    r5.w = r5.w * 6.2831855 - 3.1415927;
    ps = sin(r5.w);
    r5.w = ps;
    r5.w = r5.w * 0.5 + 0.5;
    r2.xy = r2.xy * r5.ww;
    r0.xy = r0.zz * r2.xy + r0.xy;
    ps = r0.x + r0.x;
    r0.y = r0.y * (-2.0);
    r0.x = ps;
    r0.xy = r0.xy + float2(-1.0, 1.0);
    r0.xy = r0.xy * ScreenPositionScaleBias.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(SceneColorTexture, r0.xy).xyz;
    ps = r5.z;
    r0.xyz = UniformVector_3.xyz * UniformVector_3.www;
    ps = -r6.x + ps;
    r5.w = float((r5.y >= 0.004));
    r2.x = ps;
    ps = r5.x;
    r5.y = dot(r3.zxy, float3(0.11, 0.3, 0.59));
    ps = -r6.y + ps;
    r2.z = r5.y - r6.z;
    r2.y = ps;
    r5.xyz = r2.xyz * UniformScalar_17.xxx + r6.xyz;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * r6.www + UniformVector_0.xyz;
    r5.xyz = r5.xyz + r1.xyz;
    r5.xyz = r5.xyz * r8.xyz;
    ps = OpacityOverride.x - r2.w;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
