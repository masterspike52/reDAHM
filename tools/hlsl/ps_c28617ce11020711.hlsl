// ps_c28617ce11020711.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 303 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004BC 10041000 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r13.w - 0.5;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.x = r1.x * UniformVector_2.x;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r7.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r5.w;
    r6.yz = r1.xy * 6.0;
    ps = (-4e+02) + ps;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.x = saturate(r6.w * 0.00022222222);
    r6.x = ps;
    ps = -r1.y;
    r8.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r7.xzw = r7.xyz * float3(-0.025, 0.875, 0.875);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r9.zw = r8.xy * r7.xx;
    r9.y = ps;
    ps = r1.x;
    r6.xw = r9.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r0.zw = float2((r9.xy >= 0.5));
    r3.x = ps;
    ps = r1.y;
    r6.xw = r6.xw - r9.xy;
    ps = UniformVector_1.y * ps;
    r3.zw = r6.xw * r0.zw;
    r3.y = ps;
    r9 = r9.zwxy + r3;
    r6.xw = r9.zw + r9.zw;
    r14 = tex2D(Texture2D_1, r6.xw).xzwy;
    r10.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_2, r6.yz).xyw;
    r6.yzw = tex2D(Texture2D_2, r1.xy).xwy;
    r4.xyz = tex2D(Texture2D_0, r9.xy).zyx;
    ps = r5.w;
    r6.x = r2.z + 0.1;
    ps = 0.0001 * ps;
    r7.xy = r1.xy * UniformVector_7.xy;
    r3.z = saturate(ps);
    r11.xyz = r4.zyx * 2.0 - 1.0;
    r10.x = r3.w * r6.z - 1.0;
    ps = 5.0 * r6.x;
    r1.zw = r3.xy + r3.xy;
    r1.x = saturate(ps);
    ps = r6.y + r6.y;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r3.y = ps;
    r6.xyz = r10.wyz * 2.0 - 1.0;
    ps = r6.w + r6.w;
    r3.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r3.w = ps;
    r6.w = (r3.x == 0.0) ? r14.x : r14.w;
    ps = UniformVector_4.x * r6.y;
    r15 = r3.xxyw + float4(-3.0, -2.0, -1.0, -1.0);
    r14.x = ps;
    r6.w = (r15.y == 0.0) ? r14.y : r6.w;
    r1.y = (r15.x == 0.0) ? r14.z : r6.w;
    ps = UniformVector_4.y * r6.z;
    r0.z = max(r1.y, 0.0);
    r14.y = ps;
    ps = UniformVector_4.z * r6.x;
    r6.yw = -r1.xy + 1.0;
    r14.z = ps;
    ps = r0.z;
    r3.xy = r6.yy * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 0.3;
    r3.xyw = -r3.xyz + 1.0;
    r6.y = ps;
    ps = min(r6.x, r6.y);
    r1.xy = r7.zw * r3.xy;
    r6.y = ps;
    ps = 3.3333333 * r6.y;
    r1 = r1 + float4(0.125, 0.125, -1.0, -1.0);
    r7.w = ps;
    r10.yz = r1.zw * 0.5 + r15.zw;
    r6.xy = r7.ww * r10.yz + r14.xy;
    ps = 1.0 / r5.w;
    r12.xy = r6.xy - r11.xy;
    r6.x = ps;
    r6.xy = r12.zw * r6.xx + ScreenPositionScaleBias.wz;
    r4.z = tex2D(Texture2D_4, r0.xy).x;
    r9.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r7.xyz = tex2D(Texture2D_6, r7.xy).yxz;
    r16.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).zxy;
    ps = UniformVector_6.x * UniformVector_6.w;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r15.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r15.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r15.z = ps;
    r3.xyz = r16.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r0.w));
    r13.xyz = r15.xyz * r13.xyz;
    r0.w = ps;
    r13.xyz = r13.xyz * r7.yxz;
    r10.w = -r11.z + r14.z;
    ps = 2.5 * r6.w;
    r1.x = r1.x * r1.y;
    r13.w = ps;
    r1.xyz = r1.xxx * r0.xyz + ModShadowColor.xyz;
    r1.w = r7.w * r10.x + 1.0;
    r7.w = saturate(r13.w * r1.w - 0.5);
    r10.xyz = r13.xyz * r1.www - r9.xyz;
    r9.xyz = r10.xyz * r7.www + r9.xyz;
    r0.xy = r12.xy * r7.ww + r11.xy;
    r6.w = r10.w * r7.w - 2.0;
    r0.z = r4.x * 2.0 + r6.w;
    r0.xyz = r0.zxy * r3.www;
    ps = 1.0 + r0.x;
    r4.xyw = r0.www * r2.xyz;
    r0.w = ps;
    r0.xyz = (r3.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r3.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r6.w));
    r2.xyz = r9.xyz * r5.xyz;
    r6.w = ps;
    r5.xyz = r0.xyz * r6.www;
    r6.w = dot(r5.zxy, r8.zxy);
    r0.xyz = r5.xyz * r6.www;
    r0.xyz = r0.xyz * 2.0 - r8.xyz;
    ps = UniformScalar_8.x * r7.y;
    r0.x = saturate(dot(r4.wxy, r0.zxy));
    r0.y = ps;
    ps = log2(r0.x);
    r6.w = saturate(dot(r5.zyx, r4.wyx));
    r7.y = ps;
    ps = abs(r1.w) * abs(r1.w);
    r7.x = r7.y * UniformScalar_7.x;
    r0.x = ps;
    ps = pow(2.0, r7.x);
    r7.z = r7.y * 15.0;
    r0.z = ps;
    r4.xy = r0.yx * r0.zx;
    r7.xy = r4.xy * r4.zy;
    ps = LightColor.x * r6.y;
    r0.xyz = r3.xyz + r7.xxx;
    r7.x = ps;
    ps = LightColor.y * r6.z;
    r0.xyz = r7.yyy * r0.xyz;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r0.xyz = r0.xyz * r7.www;
    r7.z = ps;
    ps = LightColor.z * r6.x;
    r0.xyz = r0.xyz * r7.zzz;
    r7.z = ps;
    r6.xy = r2.xy * r6.ww + r0.xy;
    r6.z = r2.z * r6.w + r0.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * r1.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
