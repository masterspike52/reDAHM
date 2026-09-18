// ps_056ea3d0aed1038d.bin
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
sampler2D ModShadowAccumTexture : register(s9);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = -r0.z + 1.0;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r11.y = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r8.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = r4.w;
    r6.xy = r0.wz * 6.0;
    ps = (-4e+02) + ps;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xw = r0.wz * UniformVector_1.xy;
    r7.z = ps;
    ps = 0.00022222222 * r5.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r10.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r11.zw = r8.xy + r8.xy;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r3.xyz = r5.xxx * r3.xyz;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r18.xyw = r10.yzx * float3(0.875, 0.875, -0.025);
    r5.x = ps;
    r9.xy = r3.xy * r18.ww + r7.xw;
    r5.xw = r9.zw * r5.xx + ScreenPositionScaleBias.wz;
    r7.x = -r9.y * r6.z + 1.0;
    r7.xyw = r7.zxy * UniformVector_2.xyy;
    ps = r7.x;
    r6.zw = r0.wz * UniformVector_7.xy;
    ps = r9.x * ps;
    r8.xy = r7.yw - 0.5;
    r11.x = ps;
    ps = r8.x;
    r21.xy = float2((r7.yw >= 0.5));
    ps = -r7.y + ps;
    r17 = r11 + float4(-0.5, -0.5, -1.0, -1.0);
    r10.x = ps;
    ps = r8.y;
    r21.zw = float2((r11.xy >= 0.5));
    ps = -r7.w + ps;
    r10.zw = r17.xy - r11.xy;
    r10.y = ps;
    r7.xz = r10.zw * r21.zw + r11.xy;
    r7.yw = r10.xy * r21.xy + r7.yw;
    r7 = r7 + r7;
    r14.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r19 = tex2D(Texture2D_1, r7.xy);
    r20 = tex2D(Texture2D_1, r7.zw);
    r13.yzw = tex2D(Texture2D_8, r6.zw).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r5.xw).xyz;
    r7.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r9.xy).xyz;
    r12.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r6.xyz = tex2D(Texture2D_3, r5.yz).xwy;
    r9 = tex2D(Texture2D_6, r0.xy).wxyz;
    ps = r4.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r5.z = r1.z + 0.1;
    r7.z = saturate(ps);
    ps = r9.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r17.xy = r6.xz * 2.0 - 1.0;
    ps = (-1.0) + r6.y;
    r5.w = dot(r1.zxy, r1.zxy);
    r18.z = ps;
    r6.yw = r12.xy * 2.0 - 1.0;
    r12.xyz = r8.xyz * 2.0 - 1.0;
    ps = 5.0 * r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = saturate(ps);
    ps = 1.0 - r5.x;
    r0.w = float((UniformScalar_5.x >= 1.0));
    r5.x = saturate(ps);
    ps = r12.w;
    r1.w = float((UniformScalar_5.x > 1.0));
    ps = r8.w * ps;
    r6.x = -r9.x + 1.0;
    r6.z = ps;
    ps = r7.x + r7.x;
    r0.xyz = r16.xyz * r2.www;
    r13.x = ps;
    r2.xyz = (-abs(r1.www) >= 0.0) ? r13.yzw : 1.0;
    r16.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r2.xzy;
    ps = log2(r5.x);
    r4.yzw = r6.xxx * UniformVector_5.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r5.w = ps;
    ps = pow(2.0, r5.x);
    r2.xyz = r5.www * r1.xyz;
    r5.x = ps;
    ps = r7.y + r7.y;
    r0.xyz = r0.xzy * r5.xxx;
    r13.y = ps;
    r1.xy = r21.xy * 2.0 + r21.zw;
    r5.x = (r1.y == 0.0) ? r20.x : r20.y;
    r5.w = (r1.x == 0.0) ? r19.x : r19.y;
    ps = r7.w + r7.w;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r13.z = ps;
    r5.w = (r1.y == 0.0) ? r19.z : r5.w;
    r5.x = (r1.z == 0.0) ? r20.z : r5.x;
    r5.x = (r1.w == 0.0) ? r20.w : r5.x;
    r5.w = (r1.x == 0.0) ? r19.w : r5.w;
    r13.w = r5.w * 2.0 - r6.z;
    ps = 1.0 - r5.z;
    r5.w = max(r5.x, 0.0);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r6.x = min(r5.w, 0.3);
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1 = r13.xzwy + float4(-1.0, -1.0, 1.25, -1.0);
    r7.x = ps;
    r11.w = r1.y * UniformVector_4.z - r12.z;
    ps = ModShadowGroupColor.y * r5.z;
    r13.xyz = r6.xyw * float3(3.3333333, 0.5, 0.5);
    r7.y = ps;
    ps = r1.z;
    r7.xyz = -r7.xzy + 1.0;
    ps = -r6.z + ps;
    r1.yz = r17.zw + r13.yz;
    r7.w = saturate(ps);
    ps = UniformScalar_1.x * r7.y;
    r6.xyw = r18.xyz * r7.xzy;
    r2.w = ps;
    r5.zw = r2.ww * r17.xy + r1.xw;
    r5.zw = r5.zw * UniformVector_4.xy - r12.xy;
    ps = 0.125 + r6.x;
    r1.xw = r6.zw + float2(-1.0, 1.0);
    r13.y = ps;
    r0.w = (r2.w > 0.0) ? r1.w : 1.0;
    r5.zw = r13.xx * r1.yz + r5.zw;
    r15.w = (r2.w >= 0.0) ? r0.w : 1.0;
    r0.w = r13.x * r1.x + 1.0;
    ps = 0.125 + r6.y;
    r1 = r15 * r9.yzwx;
    r13.z = ps;
    ps = abs(r0.w) * abs(r0.w);
    r6.xyw = r1.zyx * r16.yzx;
    r6.z = ps;
    ps = r6.z * r6.z;
    r6.w = r6.w * r15.w;
    r13.x = ps;
    ps = r13.x * r13.x;
    r1.xyz = r7.www * r14.xyz;
    r7.w = ps;
    ps = r13.y * r13.z;
    r9.yz = r6.yx * r1.ww;
    r6.x = ps;
    r6.xyz = r6.xxx * r11.xyz + ModShadowColor.xyz;
    ps = 2.5 * r5.x;
    r9.x = r6.w * r9.x;
    r9.w = ps;
    r11.xyz = r9.xyz * r0.www - r1.xyz;
    r6.w = saturate(r9.w * r0.w - 0.5);
    r5.xz = r5.zw * r6.ww + r12.xy;
    r4.x = r11.w * r6.w - 2.0;
    r1.xyz = r11.xyz * r6.www + r1.xyz;
    ps = UniformScalar_6.x * r5.y;
    r1.xyz = r1.xyz * r10.xyz;
    r8.w = ps;
    r4 = r4.yzwx + r8.wwwz;
    r4.xyz = r9.xyz * UniformScalar_7.xxx + r4.xyz;
    r5.w = r4.w + r8.z;
    r5.xyz = r5.wxz * r7.yyy;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r7.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r7.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r7.xyz = r7.www * r4.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r3.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    r5.x = saturate(dot(r2.zxy, r3.zxy));
    ps = log2(r5.x);
    r7.xyz = r7.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r2.zyx));
    r5.x = ps;
    r5.xyz = r7.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
