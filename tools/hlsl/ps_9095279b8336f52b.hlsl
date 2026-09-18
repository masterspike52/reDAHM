// ps_9095279b8336f52b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000005F4 10041300 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 color2 : COLOR2; // r8
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
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14.x = tex2D(ShadowTexture, r0.xy).x;
    ps = 0.0001 * r5.w;
    r8.xy = r1.xy * UniformScalar_2.xx;
    r7.y = saturate(ps);
    r12.xyw = tex2D(Texture2D_4, r8.xy).xyz;
    r0.zw = r1.wz * UniformScalar_4.xx;
    r10.xy = r1.wz * 1.8e+02;
    r11.zw = r1.xy * UniformScalar_0.xx;
    r3.zw = r1.wz * UniformScalar_8.xx;
    ps = UniformVector_1.x;
    r14.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = 1.7 * ps;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r7.z = ps;
    ps = UniformVector_1.y;
    r12.z = float((r1.w >= 0.5));
    ps = 1.7 * ps;
    r13.xyz = r12.xyw + r12.xyw;
    r7.w = ps;
    r12.x = r12.z * (-0.5) + r1.w;
    ps = 1.0 - r1.z;
    r10.zw = r7.zw * r1.wz;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = float((r7.x >= 0.5));
    r8.z = ps;
    ps = r7.w + r7.w;
    r6 = r6 * r1.wzwz;
    r12.y = ps;
    ps = 1.0 / r5.w;
    r0.xy = -r7.xy + float2(0.5, 1.0);
    r14.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = r14.yzx * r14.wwx;
    r8.w = ps;
    ps = ScreenPositionScaleBias.w + r7.x;
    r3.xy = r8.zw * abs(r9.xy);
    r8.z = ps;
    ps = ScreenPositionScaleBias.z + r7.y;
    r2.w = r0.x - r1.z;
    r8.w = ps;
    r13.w = dot(r2.ww, r7.ww) - r1.z;
    ps = r12.x + r12.x;
    r5 = r13.xywz + float4(-1.0, -1.0, 2.0, -1.0);
    r14.x = ps;
    ps = r12.y + r12.z;
    r14.y = r5.z - r1.z;
    r14.z = ps;
    r13.xyz = tex2D(Texture2D_9, r3.zw).xyz;
    r17.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r12 = tex2D(Texture2D_2, r14.xy);
    r19.yzw = tex2D(Texture2D_3, r6.xy).xyw;
    r8.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    r1.yzw = tex2D(Texture2D_0, r11.zw).xyw;
    r10.xy = tex2D(Texture2D_5, r10.xy).xy;
    r9.xyw = tex2D(Texture2D_3, r10.zw).xyw;
    r6.xyw = tex2D(Texture2D_1, r6.zw).xzy;
    r6.z = tex2D(Texture2D_6, r0.zw).x;
    r7.w = dot(r4.zxy, r4.zxy);
    r0.w = dot(r2.zxy, r2.zxy);
    r18.xy = r9.xy * 2.0 - 3.0;
    r11.zw = r10.xy * 2.0 - 1.0;
    r16.xy = r1.yz + r1.yz;
    ps = 4.0 * r6.x;
    r8.w = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    r16.z = ps;
    ps = 4.0 * r6.w;
    r10.xyz = r8.www - r8.xyz;
    r16.w = ps;
    r10.xyz = r10.xyz * UniformScalar_7.xxx + r8.xyz;
    ps = UniformScalar_1.x * r0.y;
    r8 = r16 + float4(-1.0, -1.0, -2.0, -2.0);
    r0.z = ps;
    r15.yz = r0.zz * r8.xy;
    r8.xy = r8.zw + r15.yz;
    r6.w = (r14.z == 0.0) ? r12.x : r12.y;
    r9.xy = r14.zz + float2(-3.0, -2.0);
    r6.w = (r9.y == 0.0) ? r12.z : r6.w;
    r8.zw = r5.xy + r15.yz;
    r1.x = (r9.x == 0.0) ? r12.w : r6.w;
    r8.zw = r8.zw * UniformVector_3.xy - r8.xy;
    ps = rsqrt(abs(r0.w));
    r15.xw = r1.wx + float2(-1.0, -0.75);
    r6.w = ps;
    ps = rsqrt(abs(r7.w));
    r0.w = r15.w + r1.x;
    r7.w = ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r5.xyz = r7.www * r4.xyz;
    r4.xyz = r6.www * r2.xyz;
    r11 = r11 * float4(0.875, 0.875, 0.018, 0.018);
    r12.xyz = r10.xyz * UniformVector_4.xyz;
    r6.w = max(r1.x, 0.0);
    ps = r19.w;
    r19.x = min(r6.w, 0.3);
    ps = r9.w * ps;
    r19.xyz = r19.xyz * float3(3.3333333, 4.0, 4.0);
    r6.w = ps;
    ps = (-1.0) - -r6.w;
    r18.xy = r18.xy + r19.yz;
    r18.z = ps;
    ps = r6.y + r6.y;
    r18.xyz = r19.xxx * r18.xyz;
    r18.w = ps;
    r19.xy = r18.xy * 4.0 + r8.zw;
    ps = 1.0 - r1.x;
    r18.yz = r18.zw + float2(1.0, -1.0);
    r18.x = ps;
    ps = r2.z;
    r8.zw = r18.zx * float2(0.5, 2.5);
    r7.w = saturate(r8.w * r18.y - 0.5);
    r19.z = r5.w * UniformVector_3.z - r8.z;
    ps = 0.1 + ps;
    r2.xyz = r19.xyz * r7.www;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r19.xyz = r8.xyz + r2.xyz;
    r19.w = saturate(ps);
    ps = 0.6 * r6.z;
    r8.zw = -r19.wz + 1.0;
    r6.y = ps;
    ps = ModShadowGroupColor.x * r8.z;
    r8.xy = -r19.xy + r11.zw;
    r6.x = ps;
    r11.z = r8.w * r6.z + r19.z;
    r2.xy = r8.xy * r6.zz + r2.xy;
    ps = ModShadowGroupColor.y * r8.z;
    r15.yz = r2.xy + r15.yz;
    r6.z = ps;
    r2 = -r6.wxzy + 1.0;
    r6.y = saturate(r2.x * 0.5 + r0.w);
    ps = abs(r18.y) * abs(r18.y);
    r6.xw = r15.yz - 2.0;
    r8.w = ps;
    ps = r6.x;
    r11.xy = r11.xy * r2.yz;
    ps = r16.z + ps;
    r6.xyz = r6.yyy * r17.xyz;
    r15.y = ps;
    ps = r6.w;
    r8.xyz = r11.xyz + float3(0.125, 0.125, -1.0);
    ps = r16.w + ps;
    r11.xyz = r6.xyz * r1.www;
    r15.z = ps;
    r6.w = r8.z * r0.y + 1.0;
    ps = r8.w * r8.w;
    r6.xyz = r15.xyz * r0.yyy;
    r8.w = ps;
    ps = 1.0 + r6.x;
    r8.xw = r8.xw * r8.yw;
    r0.w = ps;
    r8.xyz = r8.xxx * r14.xyz + ModShadowColor.xyz;
    r6.xyz = (r0.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.w = (r0.z > 0.0) ? r0.w : 1.0;
    r1 = (r0.yyyz >= 0.0) ? r6 : float4(0.0, 0.0, 1.0, 1.0);
    r6.w = dot(r1.zxy, r1.zxy);
    r0.xyz = r1.www * r13.xyz;
    r6.xyz = r0.xyz * UniformVector_4.xyz;
    r0.xyz = r12.xyz * r0.xyz - r11.xyz;
    r0.xyz = r0.xyz * r7.www + r11.xyz;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xyz * r10.xyz;
    r6.w = ps;
    r2.xyz = r1.xyz * r6.www;
    r6.w = saturate(dot(r2.zyx, r4.zyx));
    r1.xyz = r6.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r6.x = dot(r2.zxy, r5.zxy);
    r0.xyz = r2.www * r0.xyz;
    r0.xyz = r0.xyz * r9.xyz;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r5.xyz;
    r6.x = saturate(dot(r4.zxy, r6.zxy));
    ps = log2(r6.x);
    r1.xyz = r8.www * r1.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.xyz = r7.zzz * r3.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.xyz * r7.www;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
