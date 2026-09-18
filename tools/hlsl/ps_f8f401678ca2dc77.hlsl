// ps_f8f401678ca2dc77.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 282 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000468 10040F00 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.y + 1.0;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r5.w - 4e+02;
    r7.w = ps;
    ps = r2.z;
    r3.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r0.z));
    r6.w = r14.w - 0.5;
    r0.z = ps;
    ps = 5.0 * r6.x;
    r9.xyz = r0.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.y;
    r4.x = r1.x * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r9.xy * r6.ww;
    r4.y = ps;
    r0.zw = r4.xy - 0.5;
    r6.zw = float2((r4.xy >= 0.5));
    ps = r7.z;
    r0.zw = r0.zw - r4.xy;
    ps = abs(r8.x) * ps;
    r3.zw = r0.zw * r6.zw;
    r0.z = ps;
    ps = r7.w;
    r11 = r4.zwxy + r3;
    ps = abs(r8.y) * ps;
    r7.zw = r11.zw + r11.zw;
    r0.w = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r12 = tex2D(Texture2D_1, r7.zw);
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = 0.0001 * r5.w;
    r7.xy = r1.xy * 6.0;
    r3.x = saturate(ps);
    r3.yzw = tex2D(Texture2D_2, r7.xy).xyw;
    r7.xyw = tex2D(Texture2D_2, r1.xy).xwy;
    r1.xyz = tex2D(Texture2D_0, r11.xy).xzy;
    r1.xzw = r1.yxz * 2.0 - 1.0;
    r8.x = r3.w * r7.y - 1.0;
    ps = r7.x + r7.x;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    r7.xyz = r13.zxy * 2.0 - 1.0;
    ps = r7.w + r7.w;
    r8.y = dot(r6.zww, float3(1.0, 1.0, 1.0));
    r8.w = ps;
    r6.z = (r8.y == 0.0) ? r12.x : r12.y;
    r15 = r8.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r6.z = (r15.y == 0.0) ? r12.z : r6.z;
    r6.z = (r15.x == 0.0) ? r12.w : r6.z;
    ps = r3.y + r3.y;
    r6.w = max(r6.z, 0.0);
    r12.z = ps;
    ps = r3.z + r3.z;
    r6.xz = -r6.zx + 1.0;
    r12.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r4.x = min(r6.w, 0.3);
    r3.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4.xyw = r4.yzx * float3(0.875, 0.875, 3.3333333);
    r3.z = ps;
    ps = UniformVector_4.x * r7.y;
    r3.xyw = -r3.yzx + 1.0;
    r13.x = ps;
    ps = UniformVector_4.y * r7.z;
    r12.xy = r4.xy * r3.xy;
    r13.y = ps;
    ps = UniformVector_4.z * r7.x;
    r12 = r12 + float4(0.125, 0.125, -1.0, -1.0);
    r13.z = ps;
    r8.yz = r12.zw * 0.5 + r15.zw;
    r6.yw = r4.ww * r8.yz + r13.xy;
    ps = 1.0 / r5.w;
    r10.xy = r6.yw - r1.zw;
    r6.y = ps;
    r6.yw = r10.zw * r6.yy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r6.yw).zxy;
    r6.y = tex2D(Texture2D_4, r0.xy).x;
    ps = UniformVector_6.x * UniformVector_6.w;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r0.xyz * r14.xyz;
    r7.w = ps;
    r3.xyz = r0.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r8.w = -r1.x + r13.z;
    ps = 2.5 * r6.x;
    r6.w = r12.x * r12.y;
    r0.w = ps;
    r6.xzw = r6.www * r11.xyz + ModShadowColor.xyz;
    r2.w = r4.w * r8.x + 1.0;
    r1.x = saturate(r0.w * r2.w - 0.5);
    r8.xyz = r0.xyz * r2.www - r5.xyz;
    r5.xyz = r8.xyz * r1.xxx + r5.xyz;
    r0.xy = r10.xy * r1.xx + r1.zw;
    r0.z = r8.w * r1.x - 2.0;
    r0.z = r1.y * 2.0 + r0.z;
    r0.xyz = r0.zxy * r3.www;
    ps = 1.0 + r0.x;
    r1.yzw = r7.www * r2.xyz;
    r0.w = ps;
    r0.xyz = (r3.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r3.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r7.w = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r7.w));
    r2.xyz = r5.xyz * r4.xyz;
    r7.w = ps;
    r4.xyz = r0.xyz * r7.www;
    r7.w = dot(r4.zxy, r9.zxy);
    ps = UniformScalar_8.x * r6.y;
    r0.yzw = r4.xyz * r7.www;
    r0.x = ps;
    r0.yzw = r0.yzw * 2.0 - r9.xyz;
    ps = abs(r2.w) * abs(r2.w);
    r7.w = saturate(dot(r1.wyz, r0.wyz));
    r0.y = ps;
    ps = log2(r7.w);
    r6.y = saturate(dot(r4.zyx, r1.wzy));
    r7.w = ps;
    ps = r0.y * r0.y;
    r0.z = r7.w * UniformScalar_7.x;
    r0.y = ps;
    ps = pow(2.0, r0.z);
    r7.w = r7.w * 15.0;
    r0.z = ps;
    r1.yz = r0.xy * r0.zy;
    ps = LightColor.x * r7.y;
    r0.yzw = r3.xyz + r1.yyy;
    r0.x = ps;
    ps = LightColor.y * r7.z;
    r1.yzw = r1.zzz * r0.yzw;
    r0.y = ps;
    ps = pow(2.0, r7.w);
    r1.xyz = r1.yzw * r1.xxx;
    r7.w = ps;
    ps = LightColor.z * r7.x;
    r1.xyz = r1.xyz * r7.www;
    r0.z = ps;
    r7.xy = r2.xy * r6.yy + r1.xy;
    r7.z = r2.z * r6.y + r1.z;
    r7.xyz = r0.xyz * r7.xyz;
    r6.xyz = r7.xzy * r6.xwz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
