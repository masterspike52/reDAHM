// ps_c5039af0feff1f44.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
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

    ps = r0.x;
    r5.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_0.x * ps;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r5.z = ps;
    ps = r0.y;
    r5.xy = r5.xy * r0.wz;
    ps = UniformScalar_0.x * ps;
    r9 = r6 * r0.wzwz;
    r5.w = ps;
    r10.xyz = tex2D(Texture2D_0, r5.zw).xyw;
    r11.yzw = tex2D(Texture2D_3, r9.xy).xyw;
    r14.xzw = tex2D(Texture2D_3, r5.xy).wxy;
    r5.w = -r0.z + 1.0;
    ps = r1.z;
    r6.z = float((r0.w >= 0.5));
    r6.x = r6.z * (-0.5) + r0.w;
    ps = 0.1 + ps;
    r5.y = r11.w * r14.x;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.w = float((r5.w >= 0.5));
    r5.x = saturate(ps);
    ps = 0.0001 * r4.w;
    r14.xy = r0.xy * UniformScalar_2.xx;
    r5.z = saturate(ps);
    ps = r6.w + r6.w;
    r7 = -r5.xwyz + float4(1.0, 0.5, 1.0, 1.0);
    r6.y = ps;
    r1.w = r7.y - r0.z;
    r10.w = dot(r1.ww, r6.ww) - r0.z;
    ps = r6.x + r6.x;
    r13.xw = r10.zw + float2(-1.0, 2.0);
    r15.x = ps;
    ps = r6.y + r6.z;
    r15.y = r13.w - r0.z;
    r15.z = ps;
    r12 = tex2D(Texture2D_2, r15.xy);
    r9.xy = r0.wz * UniformScalar_4.xx;
    r13.yz = r0.wz * 1.8e+02;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r0.wz * UniformScalar_8.xx;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.yz = r4.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r0.xw = r14.zw * 2.0 - 3.0;
    r1.w = (r15.z == 0.0) ? r12.x : r12.y;
    r14.zw = r15.zz + float2(-3.0, -2.0);
    r1.w = (r14.w == 0.0) ? r12.z : r1.w;
    r20.z = (r14.z == 0.0) ? r12.w : r1.w;
    r1.w = max(r20.z, 0.0);
    r11.x = min(r1.w, 0.3);
    r12.xyz = r11.xyz * float3(3.3333333, 4.0, 4.0);
    ps = (-1.0) - -r5.y;
    r11.xy = r0.xw + r12.yz;
    r11.z = ps;
    r16.xzw = r12.xxx * r11.zxy;
    ps = r6.z;
    r12.w = r16.x + 1.0;
    ps = abs(r8.x) * ps;
    r5.y = abs(r12.w) * abs(r12.w);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r0.x = r5.y * r5.y;
    r0.w = ps;
    ps = r6.w;
    r4.xyw = r0.yzx * r0.wwx;
    ps = abs(r8.y) * ps;
    r5.zw = r4.xy + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r11.yzw = tex2D(Texture2D_9, r6.xy).xyz;
    r12.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r19.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.yzw = tex2D(Texture2D_8, r14.xy).xyz;
    r0.xyz = tex2D(Texture2D_4, r14.xy).xyz;
    r8.xy = tex2D(Texture2D_5, r13.yz).xy;
    r5.yzw = tex2D(Texture2D_1, r9.zw).zxy;
    r5.x = tex2D(Texture2D_6, r9.xy).x;
    r0.w = dot(r1.zxy, r1.zxy);
    r1.w = dot(r3.zxy, r3.zxy);
    ps = 0.6 * r5.x;
    r3.w = dot(r2.zxy, r2.zxy);
    r20.w = ps;
    r19.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r6.x = saturate(-r3.w + 1.0);
    r1.w = ps;
    ps = rsqrt(abs(r0.w));
    r8.xyz = r1.www * r3.xyz;
    r3.x = ps;
    ps = r5.y + r5.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = r10.x + r10.x;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r15.x = ps;
    ps = r10.y + r10.y;
    r0.xyz = r0.xyz + r0.xyz;
    r15.y = ps;
    ps = 4.0 * r5.z;
    r1.w = dot(r6.wyz, float3(0.11, 0.3, 0.59));
    r15.z = ps;
    ps = rsqrt(abs(r3.w));
    r3.xyz = r3.xxx * r1.xyz;
    r1.x = ps;
    ps = 4.0 * r5.w;
    r1.xyz = r1.xxx * -SpotDirection.xyz;
    r15.w = ps;
    ps = log2(r6.x);
    r5.yzw = r1.www - r6.yzw;
    r6.x = ps;
    ps = r19.x;
    r21 = r15 + float4(-1.0, -1.0, -2.0, -2.0);
    r6.yzw = r5.yzw * UniformScalar_7.xxx + r6.yzw;
    ps = 0.875 * ps;
    r5.z = dot(r1.zxy, r2.zxy);
    r16.x = ps;
    ps = r7.w;
    r0 = r0.zwxy - 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r18.z = r0.y * 0.5;
    r1.y = ps;
    r17.z = r0.x * UniformVector_3.z - r18.z;
    ps = r7.x;
    r0.xy = r1.yy * r21.xy;
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.y;
    r0.zw = r0.zw + r0.xy;
    r20.x = ps;
    ps = ModShadowGroupColor.y * r7.x;
    r18.xy = r21.zw + r0.xy;
    r20.y = ps;
    r0.zw = r0.zw * UniformVector_3.xy - r18.xy;
    r5.y = r20.z * 2.0 - 0.75;
    r5.y = saturate(r7.z * 0.5 + r5.y);
    ps = r19.y;
    r2 = -r20.wxyz + 1.0;
    ps = 0.875 * ps;
    r5.w = r2.w * 2.5;
    r16.y = ps;
    r17.xy = r16.zw * 4.0 + r0.zw;
    ps = r19.z;
    r12 = r5.yyyw * r12;
    ps = 0.018 * ps;
    r1.x = saturate(r12.w - 0.5);
    r16.z = ps;
    ps = r19.w;
    r17.xyz = r17.xyz * r1.xxx;
    ps = 0.018 * ps;
    r7.xyz = r18.zxy + r17.zxy;
    r16.w = ps;
    ps = 1.0 - r7.x;
    r18.xy = -r7.yz + r16.zw;
    r18.z = ps;
    r0.z = r18.z * r5.x + r7.x;
    r5.xy = r18.xy * r5.xx + r17.xy;
    ps = -SpotAngles.x - -r5.z;
    r5.xy = r5.xy + r0.xy;
    r5.z = ps;
    ps = (-2.0) + r5.x;
    r0.xy = r16.xy * r2.yz;
    r1.z = ps;
    ps = (-2.0) + r5.y;
    r0.xyz = r0.xyz + float3(0.125, 0.125, -1.0);
    r1.w = ps;
    r5.x = r0.z * r7.w + 1.0;
    ps = SpotAngles.y * r5.z;
    r13.yz = r1.zw + r15.zw;
    r0.w = saturate(ps);
    r0.xw = r0.xw * r0.yw;
    r0.xyz = r0.xxx * r14.xyz + ModShadowColor.xyz;
    r5.yzw = r13.xyz * r7.www;
    ps = 1.0 + r5.y;
    r10.xyz = r12.xyz * r10.zzz;
    r1.z = ps;
    r5.yzw = (r7.www > 0.0) ? r5.zwx : float3(0.0, 0.0, 1.0);
    r5.x = (r1.y > 0.0) ? r1.z : 1.0;
    r5.x = (r1.y >= 0.0) ? r5.x : 1.0;
    r1.yzw = (r7.www >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = UniformVector_4.x * r6.y;
    r5.w = dot(r1.wyz, r1.wyz);
    r11.x = ps;
    ps = UniformVector_4.y * r6.z;
    r7.xyz = r5.xxx * r11.yzw;
    r11.y = ps;
    ps = UniformVector_4.z * r6.w;
    r5.xyz = r7.xyz * UniformVector_4.xyz;
    r11.z = ps;
    r7.xyz = r11.xyz * r7.xyz - r10.xyz;
    r7.xyz = r7.xyz * r1.xxx + r10.xyz;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.xyz * r6.yzw;
    r5.w = ps;
    r1.yzw = r1.yzw * r5.www;
    r6.y = saturate(dot(r1.wzy, r3.zyx));
    r5.yzw = r5.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r5.x = dot(r1.wyz, r8.zxy);
    r7.xyz = r2.xxx * r7.xyz;
    r7.xyz = r7.xyz * r9.xyz;
    r1.yzw = r1.yzw * r5.xxx;
    r1.yzw = r1.yzw * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r1.wyz));
    ps = log2(r5.x);
    r1.yzw = r4.www * r5.yzw;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r5.y = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xzw = r1.yzw * r1.xxx;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r6.xzw * r5.yyy;
    r5.x = ps;
    r5.yz = r7.xy * r6.yy + r5.yz;
    r5.w = r7.z * r6.y + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r4.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.www;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
