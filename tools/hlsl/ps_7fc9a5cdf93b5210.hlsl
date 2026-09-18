// ps_7fc9a5cdf93b5210.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 276 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000450 10040A00 00000506 00000000 000040A5 001F001F 00000021 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.yz = r0.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r0.w = r1.z + 0.1;
    r0.x = ps;
    ps = min(abs(r0.y), abs(r0.z));
    r3.w = saturate(r0.w * 5.0);
    r2.x = ps;
    ps = 1.0 / r4.w;
    r1.w = float((abs(r0.y) > abs(r0.z)));
    r0.w = ps;
    r5.x = dot(r0.zy, r0.zy) + 0.0;
    ps = max(abs(r0.y), abs(r0.z));
    r7.x = float((-r0.z > r0.z));
    r5.y = ps;
    ps = min(r0.y, r0.z);
    r5.zw = r0.ww * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r4.xy = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = max(r0.y, r0.z);
    r2.w = float((-r0.w > r0.w));
    r0.y = ps;
    ps = 1.0 / r5.y;
    r0.w = float((r0.y >= -r0.y));
    r0.z = ps;
    ps = sqrt(abs(r5.x));
    r3.w = -r3.w + 1.0;
    r0.y = ps;
    r4.zw = -r3.ww * ModShadowGroupColor.yx + 1.0;
    ps = UniformScalar_0.x - r0.y;
    r9.yw = r2.xw * r0.zw;
    r9.z = ps;
    ps = UniformVector_1.y * r0.x;
    r5.x = float((r0.y >= UniformScalar_0.x));
    r9.x = ps;
    r2.xw = r9.xy * r9.zy;
    r0.xzw = r2.yzw * float3(0.875, 0.875, 0.0208351);
    r10.xw = r0.zx * r4.zw + 0.125;
    ps = UniformScalar_1.x;
    r0.x = r0.w - 0.085133;
    r0.x = r2.w * r0.x + 0.180141;
    r0.x = r2.w * r0.x - 0.3302995;
    ps = (-1.2) * ps;
    r0.z = r2.w * r0.x;
    r0.x = ps;
    r7.zw = r0.xz + float2(0.8, 0.999866);
    r7.y = r9.y * r7.w;
    r0.xzw = r7.zyx * float3(0.24999972, -2.0, -3.1415927);
    r0.xz = r0.xz + float2(0.5, 1.5707964);
    r0.z = r0.z * r1.w + r7.y;
    ps = UniformVector_2.y + r2.x;
    r1.w = frac(r0.x);
    r7.y = ps;
    r0.x = r1.w * 6.2831855 - 3.1415927;
    ps = sin(r0.x);
    r0.z = r0.z + r0.w;
    r10.y = ps;
    ps = cos(r0.x);
    r0.w = r0.z + r0.z;
    r0.x = ps;
    r0.z = r9.w * -r0.w + r0.z;
    ps = 1.0 / r0.x;
    r3.w = r0.z * 0.15915494;
    r10.z = ps;
    ps = -abs(r3.w);
    r2.xw = r10.zw * r10.yx;
    ps = 1.0 + ps;
    r1.w = r2.x * r7.y;
    r0.x = ps;
    r0.x = (-r3.w > 0.0) ? r0.x : r3.w;
    r0.x = r0.x * UniformVector_1.x + UniformVector_2.x;
    r7.x = r0.x + r1.w;
    r2.xyz = tex2D(LightAttenuationTexture, r4.xy).zxy;
    r4.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r0.z = dot(r1.zxy, r1.zxy);
    r5.yzw = r4.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r0.x = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyz = r0.zzz * r1.xyz;
    r0.x = ps;
    r0.xzw = r0.xxx * r3.zxy;
    r1.y = dot(r5.ywz, r5.ywz);
    ps = rsqrt(abs(r1.y));
    r1.x = float((UniformScalar_0.x >= r0.y));
    r0.y = ps;
    r3.xyz = r5.wzy * r0.yyy;
    r5.y = float((r9.z >= UniformScalar_2.x));
    r1.y = float((UniformScalar_2.x >= r9.z));
    r0.y = dot(r3.zxy, r0.xzw);
    r5.xy = (r5.xy > 0.0) ? r1.xy : 1.0;
    r1.xyz = r3.zyx * r0.yyy;
    r1.xyz = r1.zyx * 2.0 - r0.zwx;
    p0 = (-r3.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = r5.x * r5.y;
    r0.yzw = r2.www * r8.xyz + ModShadowColor.xyz;
    if (!p0)
    {
        ps = r3.w;
        r2.w = ps;
    }
    if (p0)
    {
        r2.w = -abs(r3.w) + 1.0;
    }
    r2.w = r2.w * UniformVector_1.x + UniformVector_2.x;
    r7.x = r2.w + r1.w;
    r5.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r5.xyz = r0.xxx * r5.xyz;
    p0 = (-r3.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.xyz = r5.xyz * r6.xyz;
    if (p0)
    {
        if (p0)
        {
            r3.w = -abs(r3.w) + 1.0;
        }
    }
    r2.w = r3.w * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r0.x;
    r7.x = r2.w + r1.w;
    r1.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r6.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r2.w = max(UniformScalar_9.x, 0.0001);
    r7.xyz = r6.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = LightColor.x * r2.y;
    r1.x = saturate(dot(r4.zxy, r1.zxy));
    r6.x = ps;
    ps = log2(r1.x);
    r1.w = saturate(dot(r3.zxy, r4.zxy));
    r1.x = ps;
    ps = LightColor.y * r2.z;
    r2.w = r2.w * r1.x;
    r6.y = ps;
    ps = pow(2.0, r2.w);
    r1.xyz = r0.xxx * r7.xyz;
    r0.x = ps;
    ps = LightColor.z * r2.x;
    r1.xyz = r1.xyz * r0.xxx;
    r6.z = ps;
    r1.xy = r5.xy * r1.ww + r1.xy;
    r1.z = r5.z * r1.w + r1.z;
    r1.xyz = r6.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.yzw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
