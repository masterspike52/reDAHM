// ps_b239888be6f7cf19.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10040E00 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.zw = r0.xy + 0.5;
    r9.xy = r0.xy * UniformVector_3.xy;
    r7.z = dot(r2.zxy, r2.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = -r0.z + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    r10.yzw = r10.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r6.y = dot(r5.zxy, r5.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r10.x = r6.w * UniformVector_2.y;
    r6.y = ps;
    ps = r6.y;
    r6.xw = r6.xz * abs(r8.xy);
    ps = r5.x * ps;
    r8.xyz = r7.xxx * r4.zxy;
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r6.z = dot(r10.yzw, r10.yzw);
    r7.z = ps;
    ps = rsqrt(abs(r6.z));
    r12.yzw = r7.zzz * r2.xyz;
    r6.z = ps;
    ps = r6.y;
    r2.xyz = r10.zwy * r6.zzz;
    ps = r5.y * ps;
    r6.z = dot(r2.zxy, r8.xyz);
    r7.z = ps;
    ps = r6.y;
    r10.yzw = r2.xyz * r6.zzz;
    r10.yzw = r10.yzw * 2.0 - r8.yzx;
    ps = r5.z * ps;
    r6.y = saturate(dot(r12.wyz, r10.wyz));
    r7.w = ps;
    ps = log2(r6.y);
    r7.z = dot(r7.wyz, r2.zxy);
    r7.y = ps;
    ps = r0.w;
    r7 = r7.yzzx * float4(15.0, -0.5, 0.5, -0.05);
    ps = UniformVector_2.x * ps;
    r10.zw = r7.ww * r4.xy;
    r10.y = ps;
    r4 = r10.zyxw + float4(0.5, -0.5, -0.5, 0.5);
    ps = r9.z;
    r5.zw = float2((r10.xy >= 0.5));
    ps = r10.z + ps;
    r6.yz = r4.xw + r0.xy;
    r4.x = ps;
    ps = r9.w;
    r4.yz = r4.yz - r10.yx;
    r4.yz = r4.yz * r5.wz + r10.yx;
    ps = r10.w + ps;
    r4.zw = r4.yz + r4.yz;
    r4.y = ps;
    r5.x = tex2D(Texture2D_3, r9.xy).x;
    r9 = tex2D(Texture2D_2, r4.zw).zxwy;
    r13 = tex2D(Texture2D_1, r0.xy);
    r4.xyz = tex2D(Texture2D_1, r4.xy).xyz;
    r6.xw = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r6.y = tex2D(Texture2D_1, r6.yz).w;
    r14.xyz = UniformVector_1.xyz * UniformVector_1.www;
    ps = OpacityOverride.x;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r11.w = saturate(ps);
    ps = 1.0 - r6.y;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r14.w = ps;
    ps = 0.875 * r6.x;
    r4.xyz = r4.xyz * 0.15;
    r5.y = ps;
    r0.x = r14.w * r13.w + r6.y;
    r11.xyz = r14.xyz * r13.xyz - r4.xyz;
    r8.yzw = r11.xyz * r13.www + r4.xyz;
    r4.xyz = r8.ywz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    ps = 0.875 * r6.w;
    r12.x = dot(r5.wzz, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r2.w = (r12.x == 0.0) ? r9.y : r9.w;
    ps = r8.x;
    r6.xyz = r12.wxx + float3(0.1, -3.0, -2.0);
    r9.y = ps;
    ps = 5.0 * r6.x;
    r7.yz = r7.yz + 0.5;
    r6.w = saturate(ps);
    r2.w = (r6.z == 0.0) ? r9.x : r2.w;
    r9.x = (r6.y == 0.0) ? r9.z : r2.w;
    ps = 0.0;
    r6.x = -r6.w + 1.0;
    r9.z = ps;
    ps = max(r9.y, r9.z);
    r11.yz = r6.xx * ModShadowGroupColor.xy;
    r11.x = ps;
    ps = pow(2.0, r7.x);
    r6 = -r11.yxwz + 1.0;
    r7.x = ps;
    ps = log2(abs(r6.y));
    r7.zw = abs(r7.yz) * abs(r7.yz);
    r6.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r5.yz = r5.yz * r6.xw;
    r7.y = ps;
    ps = pow(2.0, r7.y);
    r6.xyw = r5.yxz + float3(0.125, 1.0, 0.125);
    r9.y = ps;
    ps = r6.x * r6.w;
    r5.xyz = r7.xxx * r1.xzy;
    r6.x = ps;
    ps = r6.y;
    r6.w = float((r6.z >= 0.004));
    r6.xyz = r6.xxx * r10.xyz + ModShadowColor.xyz;
    ps = -r9.y + ps;
    r7.xy = -r9.xy + 1.0;
    r2.w = ps;
    ps = r2.z;
    r8.x = r2.w * r7.y;
    ps = r1.x * ps;
    r0 = r8 * r0;
    r2.x = ps;
    ps = r2.z;
    r8.xyz = r0.ywz * r7.zzz;
    ps = r1.y * ps;
    r7 = r0.ywzx * r7.wwwx;
    r2.y = ps;
    r9.xyz = r0.yzw * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r9.xzy;
    ps = r2.z;
    r7.w = r7.w - 0.5;
    ps = r1.z * ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r2.z = ps;
    r7.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r5.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.yzw + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
