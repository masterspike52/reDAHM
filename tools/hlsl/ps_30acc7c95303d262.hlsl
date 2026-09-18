// ps_30acc7c95303d262.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041300 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
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

    ps = UniformVector_2.x * r0.w;
    r5 = r0.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r10.y = ps;
    r9.xy = tex2D(Texture2D_3, r5.zw).xy;
    r7.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r4.w;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = (-4e+02) + ps;
    r5.zw = r0.wz * UniformVector_1.xy;
    r5.y = ps;
    ps = 0.00022222222 * r5.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r6.x = saturate(ps);
    r6.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r10.zw = r9.xy + r9.xy;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.xxx * r3.xyz;
    r5.y = ps;
    ps = 0.0001 * r4.w;
    r12.zw = r0.xy * UniformScalar_0.xx;
    r6.w = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r4.xyw = r6.yxz * float3(0.5, -0.025, 0.5);
    r5.x = ps;
    r13.xy = r9.xy * r4.yy + r5.zw;
    r6.xyz = r13.zwy * r5.yyx;
    ps = 1.0 / UniformVector_1.x;
    r11.xw = -r6.zw + 1.0;
    r11.z = ps;
    ps = 1.0 - r0.z;
    r14.zw = r0.wz * UniformVector_7.xy;
    r11.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyz = r11.xyz * UniformVector_2.yyx;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.x = r5.z * r13.x;
    r3.y = ps;
    ps = (-0.5) + r5.x;
    r3.zw = r3.xy * abs(r8.xy);
    r3.x = ps;
    ps = (-0.5) + r5.y;
    r14.xy = float2((r5.xy >= 0.5));
    r3.y = ps;
    r3.xy = r3.xy - r5.xy;
    r5.yw = r3.xy * r14.xy + r5.xy;
    r18 = r10 + float4(-0.5, -0.5, -1.0, -1.0);
    r12.xy = float2((r10.xy >= 0.5));
    ps = ScreenPositionScaleBias.w + r6.x;
    r5.xz = r18.xy - r10.xy;
    r3.x = ps;
    r5.xz = r5.xz * r12.xy + r10.xy;
    ps = ScreenPositionScaleBias.z + r6.y;
    r5 = r5 + r5;
    r3.y = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r10.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r3 = tex2D(Texture2D_1, r5.zw);
    r17 = tex2D(Texture2D_1, r5.xy);
    r8 = tex2D(Texture2D_6, r0.xy);
    r19.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_9, r14.zw).xyz;
    r13.xyz = tex2D(Texture2D_0, r13.xy).xyz;
    r0.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyz = tex2D(Texture2D_4, r12.zw).wxy;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r5.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = r6.y + r6.y;
    r5.y = float((UniformScalar_5.x >= 1.0));
    r16.x = ps;
    ps = r6.z + r6.z;
    r16.zw = r0.xy + r0.xy;
    r16.y = ps;
    ps = r7.w;
    r5.w = float((UniformScalar_5.x > 1.0));
    r15.xyz = (-abs(r5.www) >= 0.0) ? r15.xyz : 1.0;
    r0.xyz = r19.zxy * 2.0 - 1.0;
    ps = r0.w * ps;
    r6.y = float((r8.w >= 0.5));
    r7.w = ps;
    r6.z = r0.x * UniformVector_4.z - 1.0;
    r15.xyw = (-abs(r5.yyy) >= 0.0) ? 1.0 : r15.xyz;
    ps = log2(r5.x);
    r15.z = r7.w - 1.0;
    r5.y = ps;
    r16 = r16 - 1.0;
    ps = r13.x + r13.x;
    r5.w = r11.w * UniformScalar_1.x;
    r0.x = ps;
    r0.yz = r5.ww * r16.xy + r0.yz;
    ps = r14.x + r14.x;
    r14.zw = r18.zw * 0.012;
    r14.x = ps;
    r0.yz = r0.yz * UniformVector_4.xy - r14.zw;
    ps = r14.y + r14.y;
    r12.zw = r0.yz * r6.yy;
    r14.y = ps;
    ps = r13.y + r13.y;
    r14 = r14.zxyw + r12.zxyw;
    r0.y = ps;
    r0.w = (r14.y == 0.0) ? r17.x : r17.y;
    r5.x = (r14.z == 0.0) ? r3.x : r3.y;
    ps = r13.z + r13.z;
    r12 = r14.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r0.z = ps;
    r5.x = (r12.z == 0.0) ? r3.z : r5.x;
    r0.w = (r12.y == 0.0) ? r17.z : r0.w;
    r0.w = (r12.x == 0.0) ? r17.w : r0.w;
    r5.x = (r12.w == 0.0) ? r3.w : r5.x;
    r12 = r0 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.x = r12.w + r0.w;
    ps = rsqrt(abs(r6.w));
    r3.w = saturate(r0.x - r7.w);
    r6.w = ps;
    r17.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.xyz = r7.xyz * r2.www;
    r2.xyz = r17.xyz * r8.xyz;
    r8.xyz = r6.www * r1.xyz;
    ps = 0.1 - -r1.z;
    r6.w = max(r5.x, 0.0);
    r5.z = ps;
    r1.yzw = r2.xyz * r15.xyw;
    r15.xy = r16.zw + r4.xw;
    ps = 1.0 - r5.x;
    r2.y = min(r6.w, 0.3);
    r2.x = ps;
    r14.yz = r2.xy * float2(2.5, 3.3333333);
    r2.xy = r14.zz * r15.xy + r14.xw;
    r14.w = r14.z * r15.z + 1.0;
    ps = abs(r14.w) * abs(r14.w);
    r2.xy = -r12.xy + r2.xy;
    r14.x = ps;
    ps = 5.0 * r5.z;
    r2.zw = r14.xy * r14.xw;
    r6.w = saturate(ps);
    ps = (-1.0) + r6.x;
    r7.w = saturate(r2.w - 0.5);
    r15.x = ps;
    r15.yz = r2.xy * r7.ww + r12.xy;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r12.xyw = r15.yzx * r11.www;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.y = r12.w + 1.0;
    r5.x = ps;
    r5.y = (r5.w > 0.0) ? r5.y : 1.0;
    r6.x = (r5.w >= 0.0) ? r5.y : 1.0;
    ps = r6.y * r6.x;
    r7.xyz = r7.xzy * r5.xxx;
    r1.x = ps;
    ps = r6.z * r6.y;
    r5.xw = -r6.wy + 1.0;
    r0.w = ps;
    r5.yz = -r5.xx * ModShadowGroupColor.xy + 1.0;
    ps = UniformScalar_6.x * r6.y;
    r0.w = -r12.z + r0.w;
    r13.w = ps;
    ps = UniformVector_5.x * r5.w;
    r10.xyz = r3.www * r10.xyz;
    r6.y = ps;
    ps = UniformVector_5.y * r5.w;
    r1.xyz = r1.yzw * r1.xxx;
    r6.z = ps;
    r14.yzw = r1.xyz * r14.www - r10.xyz;
    ps = UniformVector_5.z * r5.w;
    r14.x = r0.w + 1.0;
    r6.w = ps;
    r10.xyz = r14.yzw * r7.www + r10.xyz;
    r6.x = r14.x * r7.w - 2.0;
    r6 = r6 + r13.zwww;
    r1.xyz = r1.xyz * UniformScalar_7.xxx + r6.yzw;
    r5.x = r6.x + r13.z;
    r12.z = r5.x * r11.w + 1.0;
    r6.xyz = (r11.www > 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r11.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r10.xyz * r0.xyz;
    r5.x = ps;
    r6.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r6.zxy, r9.zxy);
    r10.xyz = r6.xyz * r5.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r8.zxy, r9.zxy));
    ps = log2(r5.x);
    r5.w = saturate(dot(r6.zyx, r8.zyx));
    r4.x = ps;
    r6.xyz = r4.xyz * float3(15.0, 0.875, 0.875);
    r2.xy = r6.yz * r5.yz + 0.125;
    r6.yz = r2.xz * r2.yz;
    r5.xyz = r6.yyy * r3.xyz + ModShadowColor.xyz;
    r2.xyz = r6.zzz * r1.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r2.xyz * r1.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
