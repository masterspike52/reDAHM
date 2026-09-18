// ps_41d409598ee84a4f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 384 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000600 10041500 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ShadowTexture : register(s9);
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    ps = UniformVector_2.x * r1.w;
    r6.xy = r1.wz * 6.0;
    r13.y = ps;
    r8.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = -r1.z;
    r0.zw = r1.wz * UniformVector_7.xy;
    ps = 1.0 + ps;
    r6.x = r5.w - 4e+02;
    r12.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r11.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r10.xy = r1.wz * UniformVector_1.xy;
    r12.z = ps;
    ps = 0.00022222222 * r6.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r11.x = saturate(ps);
    r11.yw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r13.zw = r7.xy + r7.xy;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r4.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = 1.0 / r5.w;
    r17.xyz = r11.xyw * float3(-0.025, 0.5, 0.5);
    r6.w = ps;
    r10.xy = r4.xy * r17.xx + r10.xy;
    r11.xy = r10.zw * r6.ww + ScreenPositionScaleBias.wz;
    r12.x = -r10.y * r6.x + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyw = r12.zxy * UniformVector_2.xyy;
    r11.w = ps;
    ps = r7.x;
    r6.xw = r11.zw * abs(r9.xy);
    ps = r10.x * ps;
    r8.xy = r7.yw - 0.5;
    r13.x = ps;
    ps = r8.x;
    r20.xy = float2((r7.yw >= 0.5));
    ps = -r7.y + ps;
    r18 = r13.xzwy + float4(-0.5, -1.0, -1.0, -0.5);
    r12.x = ps;
    ps = r8.y;
    r20.zw = float2((r13.xy >= 0.5));
    ps = -r7.w + ps;
    r12.zw = r18.xw - r13.xy;
    r12.y = ps;
    r9.xz = r12.zw * r20.zw + r13.xy;
    r9.yw = r12.xy * r20.xy + r7.yw;
    r9 = r9 + r9;
    r11.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r15.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r16.y = tex2D(ShadowTexture, r0.xy).x;
    r16.zw = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r19 = tex2D(Texture2D_1, r9.xy);
    r21 = tex2D(Texture2D_1, r9.zw);
    r0.xyz = tex2D(Texture2D_8, r0.zw).xyz;
    r13.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    ps = 0.0001 * r5.w;
    r6.yz = r1.xy * UniformScalar_0.xx;
    r7.x = saturate(ps);
    r6.xyw = tex2D(Texture2D_3, r6.yz).wxy;
    r10 = tex2D(Texture2D_6, r1.xy);
    ps = 0.1 - -r2.z;
    r6.z = ps;
    ps = UniformVector_6.x * UniformVector_6.w;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r14.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r9.w = r10.w * UniformScalar_6.x;
    r14.z = ps;
    r5.xy = r6.yw * 2.0 - 1.0;
    ps = (-1.0) + r6.x;
    r7.w = float((UniformScalar_5.x >= 1.0));
    r18.x = ps;
    r12.xyz = r9.xyz * 2.0 - 1.0;
    ps = 5.0 * r6.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.y = saturate(ps);
    ps = 1.0 - r6.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    ps = r8.w;
    r6.z = float((UniformScalar_5.x > 1.0));
    ps = r7.z * ps;
    r13.xyz = r13.xyz + r13.xyz;
    r7.z = ps;
    r0.xyz = (-abs(r6.zzz) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r6.y));
    r6.w = -r10.w + 1.0;
    r6.y = ps;
    r0.yzw = (-abs(r7.www) >= 0.0) ? 1.0 : r0.xzy;
    ps = log2(r6.x);
    r2.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    ps = UniformVector_5.x * r6.w;
    r17.yz = r18.yz + r17.yz;
    r3.y = ps;
    r3.xz = r20.xy * 2.0 + r20.zw;
    r6.z = (r3.z == 0.0) ? r21.x : r21.y;
    r6.x = (r3.x == 0.0) ? r19.x : r19.y;
    ps = UniformVector_5.y * r6.w;
    r20 = r3.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r3.z = ps;
    r6.x = (r20.y == 0.0) ? r19.z : r6.x;
    r6.z = (r20.z == 0.0) ? r21.z : r6.z;
    r7.w = (r20.w == 0.0) ? r21.w : r6.z;
    r6.x = (r20.x == 0.0) ? r19.w : r6.x;
    r13.w = r6.x * 2.0 - r7.z;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r6.xz = -r7.wy + 1.0;
    r0.x = ps;
    ps = 2.5 * r6.x;
    r6.y = max(r7.w, 0.0);
    r5.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r16.x = min(r6.y, 0.3);
    r7.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r13 = r13 + float4(-1.0, -1.0, -1.0, 1.25);
    r7.w = ps;
    r11.w = r13.z * UniformVector_4.z - r12.z;
    ps = r13.w;
    r18.yzw = r16.zwx * float3(0.875, 0.875, 3.3333333);
    ps = -r7.z + ps;
    r6.xyz = -r7.yxw + 1.0;
    r1.w = saturate(ps);
    ps = UniformScalar_1.x * r6.y;
    r7.xyw = r18.yzx * r6.xzy;
    r2.w = ps;
    r3.xw = r2.ww * r5.xy + r13.xy;
    r3.xw = r3.xw * UniformVector_4.xy - r12.xy;
    ps = 0.125 + r7.x;
    r17.xw = r7.zw + float2(-1.0, 1.0);
    r13.y = ps;
    r8.w = (r2.w > 0.0) ? r17.w : 1.0;
    r3.xw = r18.ww * r17.yz + r3.xw;
    r14.w = (r2.w >= 0.0) ? r8.w : 1.0;
    r8.w = r18.w * r17.x + 1.0;
    ps = 0.125 + r7.y;
    r16.x = abs(r8.w) * abs(r8.w);
    r13.z = ps;
    ps = r16.x * r16.x;
    r7 = r14 * r10;
    r13.x = ps;
    ps = r16.y * r16.y;
    r0.yzw = r7.xzy * r0.yzw;
    r13.w = ps;
    ps = r0.y;
    r10.xyz = r1.www * r15.xyz;
    ps = r14.w * ps;
    r5.yz = r0.wz * r7.ww;
    r7.x = ps;
    ps = pow(2.0, r0.x);
    r5.x = r7.x * r10.w;
    r7.x = ps;
    ps = r13.x * r13.x;
    r7.yzw = r13.www * r11.xyz;
    r0.w = ps;
    ps = r13.y * r13.z;
    r0.xyz = r7.ywz * r7.xxx;
    r7.x = ps;
    r8.xyz = r7.xxx * r8.xyz + ModShadowColor.xyz;
    r11.xyz = r5.xyz * r8.www - r10.xyz;
    r8.w = saturate(r5.w * r8.w - 0.5);
    r7.xy = r3.xw * r8.ww + r12.xy;
    r3.x = r11.w * r8.w - 2.0;
    r10.xyz = r11.xyz * r8.www + r10.xyz;
    ps = UniformVector_5.z * r6.w;
    r1.xyz = r10.xyz * r1.xyz;
    r3.w = ps;
    r3 = r3.yzwx + r9.wwwz;
    r3.xyz = r5.xyz * UniformScalar_7.xxx + r3.xyz;
    r7.z = r3.w + r9.z;
    r7.xyz = r7.zxy * r6.yyy;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r0.www * r3.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r3.xyz = r6.yzw * r6.xxx;
    r3.xyz = r3.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r2.zxy, r3.zxy));
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r8.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.x = ps;
    r6.xyz = r7.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r8.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
