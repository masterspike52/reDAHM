// ps_49c882157b7b40cc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 285 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000474 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r13.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r10.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r2.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r6.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r9.xyz = r6.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r10.zw = r8.xy * r9.xx;
    r10.y = ps;
    r6.xy = r10.xy - 0.5;
    r5.xy = float2((r10.xy >= 0.5));
    ps = r5.z;
    r6.xy = r6.xy - r10.xy;
    ps = abs(r7.x) * ps;
    r2.zw = r6.xy * r5.xy;
    r6.x = ps;
    ps = r5.w;
    r3 = r10.zwxy + r2;
    ps = abs(r7.y) * ps;
    r5.zw = r3.zw + r3.zw;
    r6.y = ps;
    r7.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r14 = tex2D(Texture2D_1, r5.zw);
    r2.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r5.zw = r0.wz * UniformVector_6.xy;
    r11.xyz = r6.xyw * 2.0 - 1.0;
    r15.xyz = r10.xyz * 2.0 - 1.0;
    ps = r2.x + r2.x;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r10.y = ps;
    ps = r2.y + r2.y;
    r10.x = dot(r5.xyy, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    r5.x = (r10.x == 0.0) ? r14.x : r14.y;
    r10 = r10.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r10.z;
    r6.xyz = r15.xyz * UniformVector_4.xyz;
    r5.x = (r10.y == 0.0) ? r14.z : r5.x;
    r7.z = (r10.x == 0.0) ? r14.w : r5.x;
    ps = r9.y + ps;
    r5.y = max(r7.z, 0.0);
    r5.x = ps;
    ps = r10.w;
    r7.x = min(r5.y, 0.3);
    ps = r9.z + ps;
    r2.xyz = r7.yxw * float3(0.875, 3.3333333, 0.875);
    r5.y = ps;
    r5.xy = r2.yy * r5.xy + r6.xy;
    ps = 1.0 / r4.w;
    r12.xy = r5.xy - r11.xy;
    r5.x = ps;
    r5.xy = r12.zw * r5.xx + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_4, r3.xy).xyz;
    r10.xyz = tex2D(Texture2D_6, r5.zw).xyz;
    r15.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).zxy;
    r7.y = saturate(r4.w * 0.0001);
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = r1.z;
    r14.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r4.xyz = r15.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 0.1 + ps;
    r13.xyz = r14.xyz * r13.xyz;
    r0.w = ps;
    r7.x = r8.w * r2.w - 1.0;
    ps = rsqrt(abs(r5.w));
    r7.w = saturate(r0.w * 5.0);
    r5.w = ps;
    ps = -r11.z;
    r6.xy = -r7.zw + 1.0;
    ps = r6.z + ps;
    r7.zw = r6.yy * ModShadowGroupColor.xy;
    r10.w = ps;
    ps = 2.5 * r6.x;
    r7.yzw = -r7.wzy + 1.0;
    r13.w = ps;
    r2.yzw = r2.yxz * r7.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r2.y) * abs(r2.y);
    r13.xyz = r13.xyz * r10.xyz;
    r2.x = ps;
    r10.xyz = r13.xyz * r2.yyy - r9.xyz;
    r0.w = saturate(r13.w * r2.y - 0.5);
    r6.xy = r12.xy * r0.ww + r11.xy;
    r6.z = r10.w * r0.w - 2.0;
    r9.xyz = r10.xyz * r0.www + r9.xyz;
    r2.xw = r2.zx * r2.wx;
    r0.xyz = r2.xxx * r0.xyz + ModShadowColor.xyz;
    r2.xyz = r9.xyz * r3.xyz;
    r6.z = r6.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.www;
    ps = 1.0 + r6.x;
    r3.xyz = r5.www * r1.xyz;
    r6.w = ps;
    r6.xyz = (r7.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.w * r2.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.yzw = r6.xxx * r4.xyz;
    r5.w = ps;
    r4.xyz = r1.xyz * r5.www;
    r5.w = dot(r4.zxy, r8.zxy);
    r1.xyz = r4.xyz * r5.www;
    r1.xyz = r1.xyz * 2.0 - r8.xyz;
    ps = LightColor.x * r5.y;
    r5.w = saturate(dot(r3.zxy, r1.zxy));
    r6.x = ps;
    ps = log2(r5.w);
    r1.xyz = r6.yzw * r0.www;
    r5.w = ps;
    ps = LightColor.y * r5.z;
    r6.z = r5.w * 15.0;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r1.xyz = r1.xyz * r6.zzz;
    r6.z = ps;
    r5.xy = r2.xy * r5.ww + r1.xy;
    r5.z = r2.z * r5.w + r1.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
