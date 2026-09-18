// ps_aaa525f8995ea829.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 342 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000558 10041200 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = UniformVector_1.xy * 1.7;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r5.xy = r5.xy * r0.wz;
    r10 = r6 * r0.wzwz;
    r14 = tex2D(Texture2D_3, r10.xy);
    r11 = tex2D(Texture2D_3, r5.xy).zwxy;
    ps = -r0.z;
    r10.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 + ps;
    r15.xy = r0.xy * UniformScalar_2.xx;
    r6.z = ps;
    ps = r1.z;
    r8.zw = r0.wz * UniformScalar_5.xx;
    ps = 0.1 + ps;
    r5.y = float((r0.w >= 0.5));
    r5.x = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r9.xy = r6.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r6.x = r14.w * r11.y;
    r6.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.x = float((r6.z >= 0.5));
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xzw = -r6.xyz + float3(1.0, 1.0, 0.5);
    r8.y = ps;
    ps = r5.w;
    r8.xy = r8.xy * abs(r7.xy);
    ps = -r0.z + ps;
    r7.xw = r5.yx * float2(-0.5, 0.5);
    r5.x = ps;
    r5.x = dot(r5.xx, r0.xx) - r0.z;
    ps = 2.0 + r5.x;
    r6.y = r7.x + r0.w;
    r5.x = ps;
    ps = r6.y + r6.y;
    r6.z = r5.x - r0.z;
    r6.y = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9.xyz = tex2D(Texture2D_7, r8.zw).xyz;
    r12.xyz = tex2D(Texture2D_5, r10.zw).xyz;
    r17.zw = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8 = tex2D(Texture2D_2, r6.yz).xwyz;
    r13.xyz = tex2D(Texture2D_6, r15.xy).xyz;
    r6.yzw = tex2D(Texture2D_4, r15.xy).xyz;
    r15.xyz = tex2D(Texture2D_1, r10.zw).xyz;
    r0.yzw = tex2D(Texture2D_0, r10.xy).xyw;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = r4.w;
    r1.w = r11.x + r14.z;
    ps = 0.0001 * ps;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r11.x = saturate(ps);
    ps = r15.z + r15.z;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r11.y = ps;
    ps = 1.0 - r5.x;
    r2.w = dot(r3.zxy, r3.zxy);
    r5.x = saturate(ps);
    ps = r11.z + r11.z;
    r2.x = dot(r1.zxy, r1.zxy);
    r11.z = ps;
    ps = r11.w + r11.w;
    r6.yzw = r6.yzw + r6.yzw;
    r11.w = ps;
    ps = rsqrt(abs(r2.x));
    r3.w = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r2.x = ps;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r2.xxx * r1.xyz;
    r2.w = ps;
    ps = log2(r5.x);
    r1.xyz = r3.www - r13.xyz;
    r5.x = ps;
    r4.xyz = r1.xyz * UniformScalar_4.xxx + r13.xyz;
    ps = (-1.0) + r0.w;
    r1.xyz = r11.zwy + float3(-3.0, -3.0, -1.0);
    r17.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r13.xyw = r0.yzx + r0.yzx;
    r11.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r13.z = r13.w + r5.y;
    r11.z = ps;
    r18.xyz = r14.xyz * float3(4.0, 4.0, 1.0) + r1.xyw;
    r5.y = (r13.z == 0.0) ? r8.x : r8.z;
    ps = (-1.0) - -r6.x;
    r11.yzw = -r11.xyz + 1.0;
    r11.x = ps;
    ps = r2.w;
    r13 = r13.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r5.y = (r13.w == 0.0) ? r8.w : r5.y;
    ps = r3.x * ps;
    r3.w = r11.y * UniformScalar_1.x;
    r8.x = ps;
    ps = 0.5 * r1.z;
    r14.xy = r3.ww * r13.xy;
    r12.w = ps;
    r6.x = (r13.z == 0.0) ? r8.y : r5.y;
    ps = 1.0 - r6.x;
    r8.yz = r14.xy - 2.0;
    r15.w = ps;
    ps = r6.x;
    r13.xyz = r4.xyz * UniformVector_4.xyz;
    r5.y = ps;
    ps = 0.0;
    r1 = r6.wxyz + float4(-1.0, -0.75, -1.0, -1.0);
    r5.z = ps;
    ps = max(r5.y, r5.z);
    r1.x = r1.x * UniformVector_3.z;
    r5.y = ps;
    ps = r1.y;
    r17.y = min(r5.y, 0.3);
    ps = r6.x + ps;
    r5.yzw = r15.xwy * float3(4.0, 2.5, 4.0);
    r6.x = ps;
    ps = (-2.0) + r5.y;
    r6.yz = r1.zw + r14.xy;
    r15.x = ps;
    ps = (-2.0) + r5.w;
    r14.zw = r6.yz * UniformVector_3.xy;
    r15.y = ps;
    ps = r6.x;
    r17.yzw = r17.yzw * float3(3.3333333, 0.875, 0.875);
    ps = r7.w + ps;
    r6.xyz = r17.yyy * r18.xyz;
    r6.w = saturate(ps);
    r13.w = r6.z * 0.1 + r1.x;
    ps = r6.x + r6.x;
    r1.xyz = r6.www * r12.xyz;
    r15.z = ps;
    ps = r6.y + r6.y;
    r12.xyz = r1.xyz * r0.www;
    r15.w = ps;
    r6 = r17.zywx * r11.zxwy + float4(0.125, 1.0, 0.125, 1.0);
    r1.w = saturate(r5.z * r6.y - 0.5);
    r6.w = (r3.w > 0.0) ? r6.w : 1.0;
    ps = abs(r6.y) * abs(r6.y);
    r6.x = r6.x * r6.z;
    r0.x = ps;
    r6.xyz = r6.xxx * r16.xyz + ModShadowColor.xyz;
    r6.w = (r3.w >= 0.0) ? r6.w : 1.0;
    ps = r0.x * r0.x;
    r14 = r15 + r14;
    r1.x = ps;
    ps = r14.z - r14.x;
    r9.xyz = r6.www * r9.xyz;
    r1.y = ps;
    ps = r14.w - r14.y;
    r0.xyz = r9.xyz * UniformVector_4.xyz;
    r1.z = ps;
    ps = r1.x * r1.x;
    r13.xyz = r13.xyz * r9.xyz;
    r9.x = ps;
    ps = r1.y * r1.w;
    r4.xyz = r0.xyz * r4.xyz;
    r9.y = ps;
    ps = r1.z * r1.w;
    r0 = r13 - r12;
    r9.z = ps;
    r4.xyz = r4.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r2.w;
    r8.yz = r8.yz + r9.yz;
    ps = r3.y * ps;
    r5.yz = r8.yz + r5.yw;
    r8.y = ps;
    r0 = r0 * r1.wwww + r12;
    ps = r2.w;
    r5.w = r0.w - 1.0;
    ps = r3.z * ps;
    r12.xyw = r5.yzw * r11.yyy;
    r8.z = ps;
    ps = r9.x;
    r12.z = r12.w + 1.0;
    r5.yzw = (r11.yyy > 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r11.yyy >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = r4.x * ps;
    r5.y = dot(r3.zxy, r3.zxy);
    r4.x = ps;
    ps = rsqrt(abs(r5.y));
    r0.xyz = r0.xyz * r10.xyz;
    r5.y = ps;
    ps = r9.x;
    r3.xyz = r3.xyz * r5.yyy;
    ps = r4.y * ps;
    r5.y = dot(r3.zxy, r8.zxy);
    r4.y = ps;
    ps = r9.x;
    r5.yzw = r3.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r8.xyz;
    ps = r4.z * ps;
    r5.y = saturate(dot(r2.zxy, r5.wyz));
    r4.z = ps;
    ps = log2(r5.y);
    r1.xyz = r4.xyz * r1.www;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.w = saturate(dot(r3.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.ww + r5.yz;
    r5.w = r0.z * r6.w + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
