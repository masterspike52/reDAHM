// ps_b9c0655564e2b644.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 291 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000048C 10040B00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.yz = r0.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r5.w = r1.z + 0.1;
    r5.x = ps;
    ps = min(abs(r5.y), abs(r5.z));
    r0.w = saturate(r5.w * 5.0);
    r6.x = ps;
    ps = 1.0 / r4.w;
    r0.z = float((abs(r5.y) > abs(r5.z)));
    r5.w = ps;
    r1.w = dot(r5.zy, r5.zy) + 0.0;
    ps = max(abs(r5.y), abs(r5.z));
    r11.x = float((-r5.z > r5.z));
    r3.w = ps;
    ps = min(r5.y, r5.z);
    r0.xy = r5.ww * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r0.xy = r0.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = max(r5.y, r5.z);
    r6.w = float((-r5.w > r5.w));
    r5.y = ps;
    ps = 1.0 / r3.w;
    r5.w = float((r5.y >= -r5.y));
    r5.z = ps;
    ps = sqrt(abs(r1.w));
    r0.w = -r0.w + 1.0;
    r5.y = ps;
    r4.xy = -r0.ww * ModShadowGroupColor.yx + 1.0;
    ps = UniformScalar_0.x - r5.y;
    r10.yw = r6.xw * r5.zw;
    r10.z = ps;
    ps = UniformVector_1.y * r5.x;
    r7.z = float((r5.y >= UniformScalar_0.x));
    r10.x = ps;
    r6.xw = r10.xy * r10.zy;
    r5.xzw = r6.yzw * float3(0.875, 0.875, 0.0208351);
    r4.xw = r5.zx * r4.xy + 0.125;
    ps = UniformScalar_1.x;
    r5.x = r5.w - 0.085133;
    r5.x = r6.w * r5.x + 0.180141;
    r5.x = r6.w * r5.x - 0.3302995;
    ps = (-1.2) * ps;
    r5.z = r6.w * r5.x;
    r5.x = ps;
    r11.zw = r5.xz + float2(0.8, 0.999866);
    r11.y = r10.y * r11.w;
    r5.xzw = r11.zyx * float3(0.24999972, -2.0, -3.1415927);
    r5.xz = r5.xz + float2(0.5, 1.5707964);
    r5.z = r5.z * r0.z + r11.y;
    ps = UniformVector_2.y + r6.x;
    r0.z = frac(r5.x);
    r7.y = ps;
    r5.x = r0.z * 6.2831855 - 3.1415927;
    ps = sin(r5.x);
    r5.z = r5.z + r5.w;
    r4.y = ps;
    ps = cos(r5.x);
    r5.w = r5.z + r5.z;
    r5.x = ps;
    r5.z = r10.w * -r5.w + r5.z;
    ps = 1.0 / r5.x;
    r6.w = r5.z * 0.15915494;
    r4.z = ps;
    ps = -abs(r6.w);
    r4.xw = r4.zw * r4.yx;
    ps = 1.0 + ps;
    r0.w = r4.x * r7.y;
    r5.x = ps;
    r5.x = (-r6.w > 0.0) ? r5.x : r6.w;
    r5.x = r5.x * UniformVector_1.x + UniformVector_2.x;
    r7.x = r5.x + r0.w;
    r4.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r5.z = dot(r1.zxy, r1.zxy);
    r11.xyz = r6.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r5.zzz * r1.xyz;
    r5.x = ps;
    r5.xzw = r5.xxx * r3.zxy;
    r0.y = dot(r11.xzy, r11.xzy);
    ps = rsqrt(abs(r0.y));
    r0.x = float((UniformScalar_0.x >= r5.y));
    r5.y = ps;
    r3.xyz = r11.zyx * r5.yyy;
    r7.w = float((r10.z >= UniformScalar_2.x));
    r0.y = float((UniformScalar_2.x >= r10.z));
    r5.y = dot(r3.zxy, r5.xzw);
    r1.xy = (r7.zw > 0.0) ? r0.xy : 1.0;
    r0.xyz = r3.zyx * r5.yyy;
    r0.xyz = r0.zyx * 2.0 - r5.zwx;
    p0 = (-r6.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.x = r1.x * r1.y;
    r1.xyz = r4.www * r9.xyz + ModShadowColor.xyz;
    if (!p0)
    {
        ps = r6.w;
        r5.y = ps;
    }
    if (p0)
    {
        r5.y = -abs(r6.w) + 1.0;
    }
    r5.y = r5.y * UniformVector_1.x + UniformVector_2.x;
    r7.x = r5.y + r0.w;
    r5.yzw = tex2D(Texture2D_1, r7.xy).xyz;
    r5.yzw = r5.xxx * r5.yzw;
    p0 = (-r6.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yzw = r5.yzw * r8.xyz;
    if (p0)
    {
        if (p0)
        {
            r6.w = -abs(r6.w) + 1.0;
        }
    }
    r6.w = r6.w * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r5.x;
    r7.x = r6.w + r0.w;
    r6.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r7.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r6.w = saturate(dot(r3.zxy, r6.zxy));
    ps = UniformScalar_9.x;
    r6.x = saturate(dot(r6.zxy, r0.zxy));
    r3.x = ps;
    ps = 0.0001;
    r6.z = dot(r2.zxy, r2.zxy);
    r3.y = ps;
    r0.xyz = r7.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = max(r3.x, r3.y);
    r0.xyz = r5.xxx * r0.xyz;
    r6.y = ps;
    ps = log2(r6.x);
    r5.x = saturate(-r6.z + 1.0);
    r6.x = ps;
    ps = log2(r5.x);
    r6.x = r6.y * r6.x;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r0.xyz * r6.xxx;
    r5.x = ps;
    r6.xy = r5.yz * r6.ww + r6.xy;
    r6.z = r5.w * r6.w + r6.z;
    r5.xyz = r6.xyz * r5.xxx;
    r5.xyz = r5.xyz * r4.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
