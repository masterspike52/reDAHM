// ps_c77a55f7ae539d75.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 303 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004BC 10040B00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    r0.z = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.yz = r0.yx * 2.0 - 1.0;
    ps = 1.0 / UniformScalar_2.x;
    r5.w = r1.z + 0.1;
    r5.x = ps;
    ps = min(abs(r5.y), abs(r5.z));
    r0.y = saturate(r5.w * 5.0);
    r6.x = ps;
    ps = 1.0 / r4.w;
    r0.x = float((abs(r5.y) > abs(r5.z)));
    r5.w = ps;
    r0.w = dot(r5.zy, r5.zy) + 0.0;
    ps = max(abs(r5.y), abs(r5.z));
    r8.x = float((-r5.z > r5.z));
    r3.w = ps;
    ps = min(r5.y, r5.z);
    r7.xy = r5.ww * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r4.xy = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = max(r5.y, r5.z);
    r6.w = float((-r5.w > r5.w));
    r5.y = ps;
    ps = 1.0 / r3.w;
    r5.w = float((r5.y >= -r5.y));
    r5.z = ps;
    ps = sqrt(abs(r0.w));
    r0.y = -r0.y + 1.0;
    r5.y = ps;
    r0.yw = -r0.yy * ModShadowGroupColor.yx + 1.0;
    ps = UniformScalar_0.x - r5.y;
    r11.yw = r6.xw * r5.zw;
    r11.z = ps;
    ps = UniformVector_1.y * r5.x;
    r10.x = float((r5.y >= UniformScalar_0.x));
    r11.x = ps;
    r6.xw = r11.xy * r11.zy;
    r5.xzw = r6.yzw * float3(0.875, 0.875, 0.0208351);
    r7.xw = r5.zx * r0.yw + 0.125;
    ps = UniformScalar_1.x;
    r5.x = r5.w - 0.085133;
    r5.x = r6.w * r5.x + 0.180141;
    r5.x = r6.w * r5.x - 0.3302995;
    ps = (-1.2) * ps;
    r5.z = r6.w * r5.x;
    r5.x = ps;
    r8.zw = r5.xz + float2(0.8, 0.999866);
    r8.y = r11.y * r8.w;
    r5.xzw = r8.zyx * float3(0.24999972, -2.0, -3.1415927);
    r5.xz = r5.xz + float2(0.5, 1.5707964);
    r5.z = r5.z * r0.x + r8.y;
    ps = UniformVector_2.y + r6.x;
    r0.x = frac(r5.x);
    r9.y = ps;
    r5.x = r0.x * 6.2831855 - 3.1415927;
    ps = sin(r5.x);
    r5.z = r5.z + r5.w;
    r7.y = ps;
    ps = cos(r5.x);
    r5.w = r5.z + r5.z;
    r5.x = ps;
    r5.z = r11.w * -r5.w + r5.z;
    ps = 1.0 / r5.x;
    r0.y = r5.z * 0.15915494;
    r7.z = ps;
    ps = -abs(r0.y);
    r5.xz = r7.zw * r7.yx;
    ps = 1.0 + ps;
    r0.x = r5.x * r9.y;
    r5.x = ps;
    r5.x = (-r0.y > 0.0) ? r5.x : r0.y;
    r5.w = r5.x * UniformVector_1.x + UniformVector_2.x;
    r9.x = r5.w + r0.x;
    r7.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r9.xy).xyz;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r9.xzw = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r3.zxy, r3.zxy);
    r10.yzw = r6.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r6.w = saturate(-r0.z + 1.0);
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r6.xxx * r1.xyz;
    r5.w = ps;
    r6.xyz = r5.www * r3.zxy;
    ps = log2(r6.w);
    r5.w = dot(r10.ywz, r10.ywz);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r1.x = float((UniformScalar_0.x >= r5.y));
    r5.y = ps;
    r3.xyz = r10.wzy * r5.yyy;
    r10.y = float((r11.z >= UniformScalar_2.x));
    r1.y = float((UniformScalar_2.x >= r11.z));
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.w = dot(r3.zxy, r6.xyz);
    r5.w = ps;
    r5.xy = (r10.xy > 0.0) ? r1.xy : 1.0;
    ps = pow(2.0, r5.w);
    r1.xyz = r3.zyx * r6.www;
    r6.w = ps;
    r1.xyz = r1.zyx * 2.0 - r6.yzx;
    p0 = (-r0.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.x = r5.x * r5.y;
    r6.xyz = r5.zzz * r9.xzw + ModShadowColor.xyz;
    if (!p0)
    {
        ps = r0.y;
        r5.y = ps;
    }
    if (p0)
    {
        r5.y = -abs(r0.y) + 1.0;
    }
    r5.y = r5.y * UniformVector_1.x + UniformVector_2.x;
    r9.x = r5.y + r0.x;
    r5.yzw = tex2D(Texture2D_1, r9.xy).xyz;
    r5.yzw = r5.xxx * r5.yzw;
    p0 = (-r0.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r5.yzw = r5.yzw * r8.xyz;
    if (p0)
    {
        r0.y = -abs(r0.y) + 1.0;
    }
    r0.y = r0.y * UniformVector_1.x + UniformVector_2.x;
    ps = (-0.5) - -r5.x;
    r9.x = r0.y + r0.x;
    r0.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.xyw = tex2D(Texture2D_1, r9.xy).xyz;
    r1.w = saturate(dot(r3.zxy, r4.zxy));
    r3.xyz = r0.xyw * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = rsqrt(abs(r0.z));
    r0.w = saturate(dot(r4.zxy, r1.zxy));
    r0.x = ps;
    ps = UniformScalar_9.x;
    r1.xyz = r0.xxx * -SpotDirection.xyz;
    r0.y = ps;
    ps = 0.0001;
    r0.x = dot(r1.zxy, r2.zxy);
    r0.z = ps;
    ps = max(r0.y, r0.z);
    r0.x = r0.x - SpotAngles.x;
    r0.y = ps;
    ps = log2(r0.w);
    r0.x = saturate(r0.x * SpotAngles.y);
    r0.z = ps;
    r0.xy = r0.xy * r0.xz;
    ps = pow(2.0, r0.y);
    r1.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    r0.yzw = r1.xyz * r5.xxx;
    r1.xy = r5.yz * r1.ww + r0.yz;
    r1.z = r5.w * r1.w + r0.w;
    r5.xyz = r1.xyz * r6.www;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r0.xxx;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
