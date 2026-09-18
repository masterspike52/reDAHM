// ps_38b93042ff56fc2b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040D00 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c12); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r0.xy * UniformScalar_0.xx;
    r9.y = ps;
    ps = r12.w;
    r7.yz = r0.wz * UniformVector_2.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r9.x = ps;
    ps = (-0.5) + r6.y;
    r8.xy = r9.xy * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_3, r7.yz).xyz;
    r6.xyz = tex2D(Texture2D_1, r6.xz).wxy;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = float((UniformScalar_4.x >= 1.0));
    ps = OpacityOverride.x;
    r7.w = dot(r5.zxy, r5.zxy);
    r13.z = saturate(ps);
    ps = r3.w;
    r13.xyw = UniformVector_1.xyz * UniformVector_1.www;
    ps = 0.0001 * ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r7.y = saturate(ps);
    r8.yz = r6.yz * 2.0 - 1.0;
    ps = (-1.0) + r6.x;
    r8.x = float((UniformScalar_4.x > 1.0));
    r6.w = ps;
    r9.xyz = (-abs(r8.xxx) >= 0.0) ? r9.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r12.xyz = r13.xyw * r12.xyz;
    r0.w = ps;
    r6.xyz = r10.xyz * 2.0 + float3(0.0, 0.0, -2.0);
    ps = rsqrt(abs(r7.w));
    r10.xyz = r0.www * r4.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r7.x));
    r5.xyz = r7.www * r5.xyz;
    r7.x = ps;
    r4.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r9.xyz;
    ps = (-1.0) + r6.x;
    r9.xyz = r7.xxx * r2.xyz;
    r2.y = ps;
    ps = (-1.0) + r6.y;
    r7.x = r9.z + 0.1;
    r2.z = ps;
    ps = r12.x;
    r7.x = saturate(r7.x * 5.0);
    ps = r4.x * ps;
    r7.yz = -r7.yx + 1.0;
    r2.x = ps;
    r8.xw = r6.zw * r7.yy + 1.0;
    ps = UniformScalar_1.x * r7.y;
    r13.xy = r7.zz * ModShadowGroupColor.xy;
    r7.x = ps;
    r2.yz = r7.xx * r8.yz + r2.yz;
    ps = r12.y;
    r6.xyz = -r13.zxy + 1.0;
    ps = r4.y * ps;
    r8.yz = r2.yz * r7.yy;
    r2.y = ps;
    ps = r12.z;
    r6.w = float((r6.x >= 0.004));
    r8 = (r7.xyyy > 0.0) ? r8.wxyz : float4(1.0, 1.0, 0.0, 0.0);
    r7 = (r7.xyyy >= 0.0) ? r8 : float4(1.0, 1.0, 0.0, 0.0);
    ps = r4.z * ps;
    r0.w = dot(r7.yzw, r7.yzw);
    r2.z = ps;
    r2.xyz = r2.xyz * r7.xxx;
    r4.xyz = r2.xzy * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r2.xyz * r0.xyz;
    r7.x = ps;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r7.yzw = r7.yzw * r7.xxx;
    r2.xyz = r7.yyy * r1.xyz;
    r11.x = dot(r5.zxy, r7.yzw);
    ps = -ModShadowColor.x;
    r7.x = dot(r7.yzw, r10.zxy);
    ps = 1.0 + ps;
    r7.yzw = r7.zwy * r7.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.yzw = r7.yzw * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r9.zxy, r7.wyz));
    r7.y = ps;
    r6.yz = r5.zw * r6.yz + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r5.xy + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r4.xyz + r6.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
