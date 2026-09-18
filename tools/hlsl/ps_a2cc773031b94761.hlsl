// ps_a2cc773031b94761.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * UniformScalar_0.xx;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r14 = r6.zwxy * r0.wzwz;
    r10.yzw = tex2D(Texture2D_0, r5.xy).xyw;
    r12.yzw = tex2D(Texture2D_1, r14.xy).xyz;
    r13.xy = r0.wz * UniformScalar_4.xx;
    r11.yz = r0.wz * 1.8e+02;
    r6.xy = r0.xy * UniformScalar_2.xx;
    r9.xy = r0.wz * UniformScalar_8.xx;
    ps = -r0.z;
    r6.w = float((r0.w >= 0.5));
    ps = 1.0 + ps;
    r7.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yz = UniformVector_1.xy * 1.7;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r13.zw = r5.yz * r0.wz;
    r5.y = ps;
    r7.xy = r7.xy * r5.yy + ScreenPositionScaleBias.wz;
    r12.x = r6.w * (-0.5) + r0.w;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = -r5.w + 0.5;
    r5.y = ps;
    ps = r5.z;
    r18.x = float((r5.w >= 0.5));
    ps = -r0.z + ps;
    r7.zw = r5.xy * abs(r8.xy);
    r5.x = ps;
    r10.x = dot(r5.xx, r18.xx) - r0.z;
    ps = r12.x + r12.x;
    r11.xw = r10.wx + float2(-1.0, 2.0);
    r5.x = ps;
    ps = r12.w + r12.w;
    r5.y = r11.w - r0.z;
    r5.w = ps;
    r9.xyz = tex2D(Texture2D_9, r9.xy).xyz;
    r8.xyz = tex2D(Texture2D_7, r14.xy).xyz;
    r0 = tex2D(Texture2D_2, r5.xy).xzwy;
    r18.yzw = tex2D(Texture2D_4, r6.xy).xyz;
    r14.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r6.xyz = tex2D(Texture2D_8, r6.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r11.yz = tex2D(Texture2D_5, r11.yz).xy;
    r20.yzw = tex2D(Texture2D_3, r14.zw).xyw;
    r15.xyz = tex2D(Texture2D_3, r13.zw).xyw;
    r5.z = tex2D(Texture2D_6, r13.xy).x;
    ps = r4.w;
    r7.w = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r5.y = r1.z + 0.1;
    r19.x = saturate(ps);
    ps = 0.6 * r5.z;
    r1.w = dot(r3.zxy, r3.zxy);
    r19.w = ps;
    ps = 5.0 * r5.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r21.x = saturate(ps);
    r14.zw = r11.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r13.zw = r12.yz * 4.0;
    r1.w = ps;
    ps = rsqrt(abs(r7.w));
    r3.xyz = r1.www * r3.xyz;
    r1.w = ps;
    ps = 1.0 - r5.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = saturate(ps);
    ps = r20.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = r15.z * ps;
    r7.yzw = r7.xyz * r2.www;
    r21.y = ps;
    ps = r15.x + r15.x;
    r7.x = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    r16.y = ps;
    ps = r15.y + r15.y;
    r2.xyz = r1.www * r1.xyz;
    r16.z = ps;
    ps = r10.y + r10.y;
    r1.xyz = r7.xxx - r6.xyz;
    r13.x = ps;
    ps = r10.z + r10.z;
    r14 = r14 * float4(0.875, 0.875, 0.018, 0.018);
    r13.y = ps;
    ps = log2(r5.x);
    r17 = r13 + float4(-1.0, -1.0, -2.0, -2.0);
    r5.x = ps;
    r15.xyz = r18.yzw * 2.0 - 1.0;
    r16.x = r18.x * 2.0 + r6.w;
    r6.xyz = r1.zxy * UniformScalar_7.xxx + r6.zxy;
    r6.w = (r16.x == 0.0) ? r0.x : r0.w;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r16 = r16.yzxx + float4(-3.0, -3.0, -3.0, -2.0);
    r0.x = ps;
    r6.w = (r16.w == 0.0) ? r0.y : r6.w;
    r21.z = (r16.z == 0.0) ? r0.z : r6.w;
    ps = (-1.0) + r5.w;
    r6.w = max(r21.z, 0.0);
    r7.x = ps;
    ps = pow(2.0, r0.x);
    r18.zw = r21.yz + float2(-1.0, -0.75);
    r5.x = ps;
    ps = r6.w;
    r0.xyz = r7.ywz * r5.xxx;
    r5.y = ps;
    ps = 0.3;
    r7.yzw = -r21.zxy + 1.0;
    r5.w = ps;
    ps = min(r5.y, r5.w);
    r5.x = r18.w + r21.z;
    r20.x = ps;
    r6.w = saturate(r7.w * 0.5 + r5.x);
    ps = ModShadowGroupColor.x * r7.z;
    r16.zw = r7.xy * float2(0.5, 2.5);
    r19.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r5.xyw = r20.xyz * float3(3.3333333, 4.0, 4.0);
    r19.z = ps;
    r15.z = r15.z * UniformVector_3.z - r16.z;
    ps = r16.x;
    r8.xyz = r6.www * r8.xyz;
    ps = r5.y + ps;
    r1 = -r19 + 1.0;
    r18.x = ps;
    ps = r16.y;
    r0.w = r1.x * UniformScalar_1.x;
    ps = r5.w + ps;
    r7.zw = r0.ww * r17.xy;
    r18.y = ps;
    r5.xyw = r5.xxx * r18.zxy;
    r11.yz = r15.xy + r7.zw;
    ps = 1.0 + r5.x;
    r16.xy = r17.zw + r7.zw;
    r7.x = ps;
    r6.w = saturate(r16.w * r7.x - 0.5);
    r11.yz = r11.yz * UniformVector_3.xy - r16.xy;
    r15.xy = r5.yw * 4.0 + r11.yz;
    r15.xyz = r15.xyz * r6.www;
    r5.xyw = r16.zxy + r15.zxy;
    ps = 1.0 - r5.x;
    r16.xy = -r5.yw + r14.zw;
    r16.z = ps;
    r7.y = r16.z * r5.z + r5.x;
    r5.xy = r16.xy * r5.zz + r15.xy;
    r5.xz = r5.xy + r7.zw;
    ps = (-2.0) + r5.x;
    r7.zw = r14.xy * r1.yz;
    r11.y = ps;
    ps = (-2.0) + r5.z;
    r7.yzw = r7.yzw + float3(-1.0, 0.125, 0.125);
    r11.z = ps;
    r5.w = r7.y * r1.x + 1.0;
    ps = abs(r7.x) * abs(r7.x);
    r11.yz = r11.yz + r13.zw;
    r7.x = ps;
    r7.xw = r7.zx * r7.wx;
    r7.xyz = r7.xxx * r12.xyz + ModShadowColor.xyz;
    r5.xyz = r11.xyz * r1.xxx;
    ps = 1.0 + r5.x;
    r8.xyz = r8.xyz * r10.www;
    r2.w = ps;
    r5.xyz = (r1.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.w = (r0.w > 0.0) ? r2.w : 1.0;
    r0.w = (r0.w >= 0.0) ? r5.w : 1.0;
    r5.yzw = (r1.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = UniformVector_4.x * r6.y;
    r5.x = dot(r5.wyz, r5.wyz);
    r11.x = ps;
    ps = UniformVector_4.y * r6.z;
    r10.xyz = r0.www * r9.xyz;
    r11.y = ps;
    ps = UniformVector_4.z * r6.x;
    r9.xyz = r10.xyz * UniformVector_4.xyz;
    r11.z = ps;
    r10.xyz = r11.xyz * r10.xyz - r8.xyz;
    r8.xyz = r10.xyz * r6.www + r8.xyz;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r9.xyz * r6.yzx;
    r5.x = ps;
    r5.xzw = r5.yzw * r5.xxx;
    r1.xyz = r6.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r5.y = dot(r5.wxz, r3.zxy);
    r6.xyz = r1.www * r8.xyz;
    r6.xyz = r6.xyz * r4.xyz;
    r4.xyz = r5.xzw * r5.yyy;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    ps = r7.w * r7.w;
    r5.y = saturate(dot(r2.zxy, r3.zxy));
    r7.w = ps;
    ps = log2(r5.y);
    r1.xyz = r7.www * r1.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.w = saturate(dot(r5.wzx, r2.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
