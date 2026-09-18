// ps_d1bef932eb653052.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041600 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r9.z = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = 1.0 - r0.z;
    r7.y = ps;
    ps = r4.w;
    r5.zw = r0.xy * UniformScalar_0.xx;
    ps = 0.0001 * ps;
    r6 = r0.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r7.z = saturate(ps);
    ps = r4.w;
    r9.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r7.x = dot(r3.zxy, r3.zxy);
    r7.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r1.z + 0.1;
    r5.y = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r4.xy = r8.xy * r1.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.x));
    r10.x = saturate(r7.w * 0.00022222222);
    r7.x = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r7.xxx * r3.xyz;
    r7.w = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r14.xyz = r10.xyz * float3(-0.025, 0.875, 0.875);
    r5.x = ps;
    r3.xy = r8.xy * r14.xx + r9.xy;
    ps = UniformVector_2.x * r5.y;
    r7.x = r3.y * r5.x;
    r5.x = ps;
    ps = r5.x;
    r7.xzw = -r7.xwz + 1.0;
    ps = r3.x * ps;
    r9.yw = r7.xy * UniformVector_2.yy;
    r9.x = ps;
    ps = r0.w;
    r10 = r9 - 0.5;
    ps = UniformVector_7.x * ps;
    r20 = float4((r9.xywz >= 0.5));
    r5.x = ps;
    ps = r0.z;
    r10 = r10.xywz - r9.xywz;
    r9 = r10.xywz * r20.xywz + r9;
    ps = UniformVector_7.y * ps;
    r9 = r9 + r9;
    r5.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r12.xyz = tex2D(Texture2D_8, r3.xy).xyz;
    r3.zw = tex2D(Texture2D_3, r6.zw).xy;
    r19 = tex2D(Texture2D_1, r9.xy);
    r21 = tex2D(Texture2D_1, r9.zw);
    r17.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r22.xyz = tex2D(Texture2D_9, r5.xy).xyz;
    r9 = tex2D(Texture2D_6, r0.xy).zxyw;
    r13.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyz = tex2D(Texture2D_2, r6.xy).xwy;
    r11.xyz = tex2D(Texture2D_0, r3.xy).xyz;
    r5.yzw = tex2D(Texture2D_4, r5.zw).xwy;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = (-1.0) + r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    r10.xyz = r11.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r18.zw = r6.xz + r6.xz;
    r6.x = saturate(ps);
    ps = r5.y + r5.y;
    r6.z = float((UniformScalar_5.x >= 1.0));
    r2.x = ps;
    ps = r5.w + r5.w;
    r2.zw = r13.xy + r13.xy;
    r2.y = ps;
    ps = r6.y;
    r5.x = float((UniformScalar_5.x > 1.0));
    r0.xyz = (-abs(r5.xxx) >= 0.0) ? r22.xyz : 1.0;
    r5.xyw = r17.xyz * 2.0 - 1.0;
    ps = r13.z * ps;
    r6.y = float((r9.w >= 0.5));
    r1.w = ps;
    r13.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r0.xyz;
    ps = log2(r6.x);
    r14.w = r1.w - 1.0;
    r5.z = ps;
    ps = r16.x;
    r17 = r2 - 1.0;
    ps = r9.y * ps;
    r6.z = r7.w * UniformScalar_1.x;
    r4.w = ps;
    r0.xy = r6.zz * r17.xy + r5.xy;
    ps = r16.y;
    r6.x = dot(r20.xyy, float3(1.0, 1.0, 1.0));
    ps = r9.z * ps;
    r6.w = dot(r20.wzz, float3(1.0, 1.0, 1.0));
    r2.w = ps;
    r5.y = (r6.w == 0.0) ? r21.x : r21.y;
    r5.x = (r6.x == 0.0) ? r19.x : r19.y;
    ps = ModShadowGroupColor.x * r7.z;
    r20 = r6.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r2.x = ps;
    r5.x = (r20.y == 0.0) ? r19.z : r5.x;
    r5.y = (r20.z == 0.0) ? r21.z : r5.y;
    r2.z = (r20.w == 0.0) ? r21.w : r5.y;
    r3.x = (r20.x == 0.0) ? r19.w : r5.x;
    ps = ModShadowGroupColor.y * r7.z;
    r5.x = max(r2.z, 0.0);
    r2.y = ps;
    ps = 0.25 + r3.x;
    r19.yzw = -r2.xyz + 1.0;
    r3.y = ps;
    ps = r5.x;
    r2.xyz = r3.zwy + r3.zwx;
    r6.x = ps;
    ps = 0.3;
    r18.xy = r14.yz * r19.yz;
    r6.w = ps;
    ps = min(r6.x, r6.w);
    r5.xy = r2.xy - 1.0;
    r19.x = ps;
    ps = 0.012 * r5.x;
    r2.xy = r19.xw * float2(3.3333333, 2.5);
    r6.x = ps;
    ps = 0.012 * r5.y;
    r3 = r18.zwxy + float4(-1.0, -1.0, 0.125, 0.125);
    r6.w = ps;
    r14.yz = r3.xy * 0.5 + r17.zw;
    r3.xy = r0.xy * UniformVector_4.xy - r6.xw;
    ps = r16.z;
    r0.x = r3.z * r3.w;
    r0.xyz = r0.xxx * r15.xyz + ModShadowColor.xyz;
    r6.xw = r3.xy * r6.yy + r6.xw;
    ps = r9.x * ps;
    r9.yzw = r2.xxx * r14.yzw;
    r3.z = ps;
    ps = UniformVector_4.z * r5.w;
    r3.xy = r6.xw + r9.yz;
    r9.x = ps;
    ps = r4.w;
    r6.xw = r9.xw + float2(-1.0, 1.0);
    ps = r13.x * ps;
    r9.yz = -r10.xy + r3.xy;
    r3.x = ps;
    r9.w = saturate(r2.y * r6.w - 0.5);
    ps = r2.w;
    r9.x = abs(r6.w) * abs(r6.w);
    ps = r13.y * ps;
    r2.xyw = r9.yzx * r9.wwx;
    r3.y = ps;
    ps = r3.z;
    r14.yz = r10.xy + r2.xy;
    ps = r13.z * ps;
    r10.xyw = r14.yzx * r7.www;
    r3.z = ps;
    ps = r2.z;
    r5.x = r10.w + 1.0;
    r5.x = (r6.z > 0.0) ? r5.x : 1.0;
    r6.z = (r6.z >= 0.0) ? r5.x : 1.0;
    ps = -r1.w + ps;
    r5.xy = r6.yx * r6.zy;
    r5.w = saturate(ps);
    ps = -r10.z;
    r12.xyz = r5.www * r12.xyz;
    ps = r5.y + ps;
    r3.xyw = r3.xyz * r5.xxx;
    r5.x = ps;
    r13.yzw = r3.xyw * r6.www - r12.xyz;
    ps = 1.0 + r5.x;
    r3.z = -UniformVector_0.z + 1.0;
    r13.x = ps;
    r9 = r13.xywz * r9.wwww;
    ps = rsqrt(abs(r0.w));
    r9.z = r12.z + r9.z;
    r5.x = ps;
    ps = UniformScalar_6.x * r6.y;
    r5.yw = -UniformVector_0.xy + 1.0;
    r11.w = ps;
    ps = 1.0 - r6.y;
    r2.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = r9.x;
    r6.yzw = r5.xxx * UniformVector_5.xyz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r1.xy = r12.xy + r9.yw;
    r6.x = ps;
    ps = r2.w * r2.w;
    r6 = r6 + r11.zwww;
    r9.w = ps;
    ps = r6.x;
    r1.xy = r1.xy * r5.yw;
    r3.xyw = r3.xyw * UniformScalar_7.xxx + r6.yzw;
    ps = r11.z + ps;
    r9.xy = r9.ww * r3.xy;
    r5.x = ps;
    r10.z = r5.x * r7.w + 1.0;
    r5.xyw = (r7.www > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r7.www >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r7 = r9.wxyz * r3.wxyz;
    r5.x = ps;
    r6.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r6.zxy, r8.zxy);
    r5.xyw = r6.xyz * r5.xxx;
    r5.xyw = r5.xyw * 2.0 - r8.xyz;
    r5.x = saturate(dot(r2.zxy, r5.wxy));
    ps = log2(r5.x);
    r1.z = r7.x * r3.w;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r5.y = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.y = saturate(dot(r6.zyx, r2.zyx));
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r7.yzw * r6.xxy;
    r5.x = ps;
    r5.yzw = r1.xyz * r6.yyx + r5.yzw;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r4.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
