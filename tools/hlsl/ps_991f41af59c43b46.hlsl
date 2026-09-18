// ps_991f41af59c43b46.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041000 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
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

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = -r1.y + 1.0;
    r7.z = ps;
    r3.yw = r0.xy * UniformScalar_0.xx;
    r7.xy = r1.xy * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = r5.w - 4e+02;
    r7.w = ps;
    ps = r2.z;
    r8.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r2.w));
    r0.w = r14.w - 0.5;
    r2.w = ps;
    ps = 5.0 * r1.w;
    r9.xyz = r2.www * r4.xyz;
    r3.z = saturate(ps);
    ps = 0.00022222222 * r1.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r3.x = saturate(ps);
    ps = (-0.025) * r3.x;
    r10.x = r1.x * UniformVector_2.x;
    r0.w = ps;
    ps = UniformVector_2.y * r0.z;
    r10.zw = r9.xy * r0.ww;
    r10.y = ps;
    r1.zw = r10.xy - 0.5;
    r0.zw = float2((r10.xy >= 0.5));
    ps = r7.z;
    r1.zw = r1.zw - r10.xy;
    ps = abs(r6.x) * ps;
    r8.zw = r1.zw * r0.zw;
    r4.x = ps;
    ps = r7.w;
    r8 = r10.zwxy + r8;
    ps = abs(r6.y) * ps;
    r1.zw = r8.zw + r8.zw;
    r4.y = ps;
    r6.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r13 = tex2D(Texture2D_1, r1.zw);
    r11.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r7.xyz = tex2D(Texture2D_2, r7.xy).xyw;
    r1.xyz = tex2D(Texture2D_3, r3.yw).wxy;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r10.xyz = r4.xyw * 2.0 - 1.0;
    r4.xyz = r12.xyz * 2.0 - 1.0;
    r12.zw = r1.yz * 2.0 - 1.0;
    r3.w = r7.z * r11.z - 1.0;
    ps = r11.x + r11.x;
    r11.zw = r5.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = (-1.0) + r1.x;
    r3.y = saturate(r5.w * 0.0001);
    r1.x = ps;
    ps = r11.y + r11.y;
    r1.yz = -r3.yz + 1.0;
    r15.z = ps;
    ps = ModShadowGroupColor.x * r1.z;
    r15.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    r0.x = (r15.x == 0.0) ? r13.x : r13.y;
    ps = ModShadowGroupColor.y * r1.z;
    r16 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r0.z = ps;
    r0.x = (r16.y == 0.0) ? r13.z : r0.x;
    r0.x = (r16.x == 0.0) ? r13.w : r0.x;
    ps = 1.0 - r0.x;
    r0.w = max(r0.x, 0.0);
    r3.z = ps;
    ps = 1.0 - r0.z;
    r6.x = min(r0.w, 0.3);
    r3.x = ps;
    ps = 1.0 - r0.y;
    r15.xyz = r6.xyz * float3(3.3333333, 0.875, 0.875);
    r3.y = ps;
    r6.xyw = r15.yzx * r3.yxw + float3(0.125, 0.125, 1.0);
    ps = r7.x + r7.x;
    r1.w = abs(r6.w) * abs(r6.w);
    r13.z = ps;
    ps = r7.y + r7.y;
    r13.xy = r1.xw * r1.yw;
    r13.w = ps;
    ps = UniformScalar_1.x * r1.y;
    r7.xyw = r13.zwx + float3(-1.0, -1.0, 1.0);
    r15.w = ps;
    r12.xy = r7.xy * 0.5 + r16.zw;
    ps = r6.x * r6.y;
    r0 = r15.xxww * r12;
    r2.w = ps;
    r11.xy = r4.xy + r0.zw;
    r0.xy = r11.xy * UniformVector_4.xy + r0.xy;
    ps = 1.0 / r5.w;
    r11.xy = r0.xy - r10.xy;
    r0.x = ps;
    r0.xy = r11.zw * r0.xx + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).zxy;
    ps = UniformVector_5.x * UniformVector_5.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r0.w));
    r5.xyz = r5.xyz * r14.xyz;
    r0.w = ps;
    r5.w = r4.z * UniformVector_4.z - r10.z;
    r4.xyz = r2.www * r12.xyz + ModShadowColor.xyz;
    ps = r13.y * r13.y;
    r12.xyz = r5.xyz * r7.www;
    r2.w = ps;
    r5.xyz = r12.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 2.5 * r3.z;
    r6.xyz = r2.www * r5.xyz;
    r12.w = ps;
    r2.w = saturate(r12.w * r6.w - 0.5);
    r5.xyz = r12.xyz * r6.www - r8.xyz;
    r8.xyz = r5.xyz * r2.www + r8.xyz;
    r3.x = r5.w * r2.w - 2.0;
    r3.z = r4.w * 2.0 + r3.x;
    r3.xy = r11.xy * r2.ww + r10.xy;
    r3.xyz = r3.zxy * r1.yyy;
    ps = 1.0 + r3.x;
    r5.xyz = r0.www * r2.xyz;
    r3.w = ps;
    r2.xyz = (r1.yyy > 0.0) ? r3.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r1.yyy >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r0.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.w));
    r2.xyz = r6.xyz * r2.www;
    r0.w = ps;
    r6.xyz = r1.xyz * r0.www;
    r0.w = dot(r6.zxy, r9.zxy);
    r1.xyz = r6.xyz * r0.www;
    r1.xyz = r1.xyz * 2.0 - r9.xyz;
    ps = LightColor.x * r0.y;
    r0.w = saturate(dot(r5.zxy, r1.zxy));
    r1.x = ps;
    ps = log2(r0.w);
    r3.xyz = r8.xyz * r7.xyz;
    r0.w = ps;
    ps = LightColor.y * r0.z;
    r1.z = r0.w * 15.0;
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r0.w = saturate(dot(r6.zyx, r5.zyx));
    r1.z = ps;
    ps = LightColor.z * r0.x;
    r2.xyz = r2.xyz * r1.zzz;
    r1.z = ps;
    r0.xy = r3.xy * r0.ww + r2.xy;
    r0.z = r3.z * r0.w + r2.z;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xzy * r4.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
