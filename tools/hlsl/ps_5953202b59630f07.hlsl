// ps_5953202b59630f07.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r2.z = ps;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r2.xy = r0.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r4.w - 4e+02;
    r2.w = ps;
    ps = r1.z;
    r8.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.z = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.z));
    r5.w = r12.w - 0.5;
    r6.z = ps;
    ps = 5.0 * r5.y;
    r9.xyz = r6.zzz * r3.xyz;
    r6.w = saturate(ps);
    ps = 0.00022222222 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.z = saturate(ps);
    ps = (-0.025) * r6.z;
    r3.x = r0.w * UniformVector_2.x;
    r5.y = ps;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r9.xy * r5.yy;
    r3.y = ps;
    r5.xy = r3.xy - 0.5;
    r10.xy = float2((r3.xy >= 0.5));
    ps = r2.z;
    r5.xy = r5.xy - r3.xy;
    ps = abs(r7.x) * ps;
    r8.zw = r5.xy * r10.xy;
    r5.z = ps;
    ps = r2.w;
    r11 = r3.zwxy + r8;
    ps = abs(r7.y) * ps;
    r5.xy = r11.zw + r11.zw;
    r5.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r13 = tex2D(Texture2D_1, r5.xy);
    r15.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r8.xyz = tex2D(Texture2D_2, r2.xy).xyw;
    r5.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    r0.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r2.xyw = tex2D(Texture2D_0, r11.xy).xyz;
    r3.xyz = r2.xyw * 2.0 - 1.0;
    r2.xyz = r0.xyz * 2.0 - 1.0;
    r14.zw = r5.yz * 2.0 - 1.0;
    r0.y = r8.z * r15.z - 1.0;
    ps = r15.x + r15.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    ps = (-1.0) + r5.x;
    r6.y = saturate(r4.w * 0.0001);
    r6.x = ps;
    ps = r15.y + r15.y;
    r6.yz = -r6.yw + 1.0;
    r0.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r0.x = dot(r10.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r0.x == 0.0) ? r13.x : r13.y;
    ps = ModShadowGroupColor.y * r6.z;
    r16 = r0.xxzw + float4(-3.0, -2.0, -1.0, -1.0);
    r5.z = ps;
    r5.x = (r16.y == 0.0) ? r13.z : r5.x;
    r5.x = (r16.x == 0.0) ? r13.w : r5.x;
    ps = 1.0 - r5.x;
    r5.w = max(r5.x, 0.0);
    r0.x = ps;
    ps = 1.0 - r5.z;
    r7.x = min(r5.w, 0.3);
    r0.z = ps;
    ps = 1.0 - r5.y;
    r15.xyz = r7.xyz * float3(3.3333333, 0.875, 0.875);
    r0.w = ps;
    r7.xyw = r15.yzx * r0.wzy + float3(0.125, 0.125, 1.0);
    ps = r8.x + r8.x;
    r6.w = abs(r7.w) * abs(r7.w);
    r13.z = ps;
    ps = r8.y + r8.y;
    r13.xy = r6.xw * r6.yw;
    r13.w = ps;
    ps = UniformScalar_1.x * r6.y;
    r8.xyw = r13.zwx + float3(-1.0, -1.0, 1.0);
    r15.w = ps;
    r14.xy = r8.xy * 0.5 + r16.zw;
    ps = r7.x * r7.y;
    r5 = r15.xxww * r14;
    r1.w = ps;
    r10.xy = r2.xy + r5.zw;
    r5.xy = r10.xy * UniformVector_4.xy + r5.xy;
    ps = 1.0 / r4.w;
    r10.xy = r5.xy - r3.xy;
    r5.x = ps;
    r5.xy = r10.zw * r5.xx + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).zxy;
    ps = UniformVector_5.x * UniformVector_5.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r4.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r4.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r4.z = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r4.xyz * r12.xyz;
    r5.w = ps;
    r11.w = r2.z * UniformVector_4.z - r3.z;
    r2.xyz = r1.www * r11.xyz + ModShadowColor.xyz;
    ps = r13.y * r13.y;
    r12.xyz = r4.xyz * r8.www;
    r1.w = ps;
    r4.xyz = r12.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 2.5 * r0.x;
    r4.xyz = r1.www * r4.xyz;
    r12.w = ps;
    r1.w = saturate(r12.w * r7.w - 0.5);
    r11.xyz = r12.xyz * r7.www - r8.xyz;
    r8.xyz = r11.xyz * r1.www + r8.xyz;
    r0.x = r11.w * r1.w - 2.0;
    r0.z = r2.w * 2.0 + r0.x;
    r0.xy = r10.xy * r1.ww + r3.xy;
    r0.xyz = r0.zxy * r6.yyy;
    ps = 1.0 + r0.x;
    r3.xyz = r5.www * r1.xyz;
    r0.w = ps;
    r0.xyz = (r6.yyy > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r6.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.w));
    r0.xyz = r4.xyz * r1.www;
    r5.w = ps;
    r4.xyz = r6.xyz * r5.www;
    r5.w = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xyz * r5.www;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    ps = LightColor.x * r5.y;
    r5.w = saturate(dot(r3.zxy, r6.zxy));
    r6.x = ps;
    ps = log2(r5.w);
    r1.xyz = r8.xyz * r7.xyz;
    r5.w = ps;
    ps = LightColor.y * r5.z;
    r6.z = r5.w * 15.0;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r0.xyz = r0.xyz * r6.zzz;
    r6.z = ps;
    r5.xy = r1.xy * r5.ww + r0.xy;
    r5.z = r1.z * r5.w + r0.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
