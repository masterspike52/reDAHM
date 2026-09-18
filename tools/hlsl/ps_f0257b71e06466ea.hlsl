// ps_f0257b71e06466ea.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041700 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * 6.0;
    r9.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r10.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r23.y = -r0.z + 1.0;
    ps = UniformVector_2.x * ps;
    r5.x = r4.w - 4e+02;
    r12.y = ps;
    ps = r1.z;
    r6.xy = r0.xy * UniformScalar_0.xx;
    ps = 0.1 + ps;
    r7.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 5.0 * r5.y;
    r6.zw = r0.wz * UniformVector_1.xy;
    r5.y = saturate(ps);
    ps = 0.00022222222 * r5.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r11.x = saturate(ps);
    r11.yz = r10.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r12.zw = r9.xy + r9.xy;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.xxx * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r18.xzw = r11.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    r7.xy = r9.xy * r18.xx + r6.zw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xzw = r7.zyw * r5.zxz;
    r3.z = ps;
    ps = ScreenPositionScaleBias.w + r5.x;
    r3.xy = r0.wz * UniformVector_7.xy;
    r6.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r23.xw = -r5.zy + 1.0;
    r23.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = r23.zxy * UniformVector_2.xyy;
    r3.w = ps;
    ps = r10.x;
    r3.zw = r3.zw * abs(r8.xy);
    ps = r7.x * ps;
    r8.xy = r10.yz - 0.5;
    r12.x = ps;
    ps = r8.x;
    r22.xy = float2((r10.yz >= 0.5));
    ps = -r10.y + ps;
    r19 = r12 + float4(-0.5, -0.5, -1.0, -1.0);
    r11.x = ps;
    ps = r8.y;
    r22.zw = float2((r12.xy >= 0.5));
    ps = -r10.z + ps;
    r11.zw = r19.xy - r12.xy;
    r11.y = ps;
    r8.xz = r11.zw * r22.zw + r12.xy;
    r8.yw = r11.xy * r22.xy + r10.yz;
    ps = ScreenPositionScaleBias.z + r5.w;
    r8 = r8 + r8;
    r6.w = ps;
    r12.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r16.zw = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r20 = tex2D(Texture2D_1, r8.xy);
    r21 = tex2D(Texture2D_1, r8.zw);
    r10.xyz = tex2D(Texture2D_8, r3.xy).xyz;
    r3.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8 = tex2D(Texture2D_6, r0.xy).wxyz;
    r5.xyz = tex2D(Texture2D_3, r6.xy).xyw;
    ps = 0.0001 * r4.w;
    r0.w = saturate(ps);
    ps = UniformVector_6.x * UniformVector_6.w;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.xzw = -ModShadowColor.xyz + 1.0;
    r14.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r7.w = dot(r1.zxy, r1.zxy);
    r14.z = ps;
    ps = (-1.0) + r5.z;
    r3.w = float((UniformScalar_5.x >= 1.0));
    r16.x = ps;
    ps = r8.x;
    r5.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r18.xy = r5.xy * 2.0 - 1.0;
    r17.xyz = r13.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.w;
    r0.x = float((UniformScalar_5.x > 1.0));
    r1.w = saturate(ps);
    ps = r8.x;
    r7.xyz = r7.xyz * r2.www;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r13.xyz = r3.xyz + r3.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = r10.w * r9.w;
    r5.x = ps;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : 1.0;
    r15.xyz = (-abs(r3.www) >= 0.0) ? 1.0 : r0.xzy;
    ps = log2(r1.w);
    r0.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = (-1.0) - -r5.z;
    r5.w = dot(r0.zxy, r2.zxy);
    r4.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = r5.w - SpotAngles.x;
    r5.x = ps;
    ps = SpotAngles.y * r5.w;
    r10.yzw = r5.yyy * UniformVector_5.xyz;
    r4.y = saturate(ps);
    ps = rsqrt(abs(r7.w));
    r0.yz = r23.ww * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = r19.z;
    r2.xyz = r5.yyy * r1.xyz;
    r1.xy = r22.xy * 2.0 + r22.zw;
    r5.w = (r1.y == 0.0) ? r21.x : r21.y;
    r5.y = (r1.x == 0.0) ? r20.x : r20.y;
    ps = r18.z + ps;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r4.z = ps;
    r5.y = (r1.y == 0.0) ? r20.z : r5.y;
    r5.w = (r1.z == 0.0) ? r21.z : r5.w;
    r0.x = (r1.w == 0.0) ? r21.w : r5.w;
    r5.y = (r1.x == 0.0) ? r20.w : r5.y;
    r13.w = r5.y * 2.0 - r5.z;
    ps = r19.w;
    r5.y = max(r0.x, 0.0);
    ps = r18.w + ps;
    r0 = -r0 + 1.0;
    r4.w = ps;
    ps = r0.w;
    r16.y = min(r5.y, 0.3);
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r13 = r13 + float4(-1.0, -1.0, -1.0, 1.25);
    r2.w = ps;
    r12.w = r17.z * UniformVector_4.z - r13.z;
    r5.yw = r2.ww * r18.xy + r17.xy;
    ps = pow(2.0, r5.x);
    r16.yzw = r16.zwy * float3(0.875, 0.875, 3.3333333);
    r5.x = ps;
    r7.w = r16.w * r4.x + 1.0;
    r5.yw = r5.yw * UniformVector_4.xy - r13.xy;
    r5.yw = r16.ww * r4.zw + r5.yw;
    ps = abs(r7.w) * abs(r7.w);
    r7.xyz = r7.xzy * r5.xxx;
    r1.x = ps;
    r1.yzw = r16.xyz * r0.wyz + float3(1.0, 0.125, 0.125);
    r5.x = (r2.w > 0.0) ? r1.y : 1.0;
    r14.w = (r2.w >= 0.0) ? r5.x : 1.0;
    ps = r0.x;
    r4.xz = r1.xz * r1.xw;
    r5.x = ps;
    r6.xzw = r4.zzz * r6.xzw + ModShadowColor.xyz;
    ps = r13.w;
    r1 = r14 * r8.yzwx;
    ps = -r5.z + ps;
    r0.xyz = r1.xzy * r15.xyz;
    r5.z = saturate(ps);
    ps = r0.x;
    r1.xyz = r5.zzz * r12.xyz;
    ps = r14.w * ps;
    r8.yz = r0.zy * r1.ww;
    r5.z = ps;
    ps = 2.5 * r5.x;
    r8.x = r5.z * r8.x;
    r8.w = ps;
    r12.xyz = r8.xyz * r7.www - r1.xyz;
    r5.z = saturate(r8.w * r7.w - 0.5);
    r5.xy = r5.yw * r5.zz + r13.xy;
    r10.x = r12.w * r5.z - 2.0;
    r1.xyz = r12.xyz * r5.zzz + r1.xyz;
    ps = UniformScalar_6.x * r6.y;
    r0.xyz = r1.xyz * r11.xyz;
    r3.w = ps;
    r1 = r10.yzwx + r3.wwwz;
    r1.xyz = r8.xyz * UniformScalar_7.xxx + r1.xyz;
    r5.w = r1.w + r3.z;
    r3.xyw = r5.xyw * r0.www;
    ps = r4.x * r4.x;
    r3.z = r3.w + 1.0;
    r5.w = ps;
    r3.xyz = (r0.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r0.www >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    ps = r4.y * r4.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r5.www * r1.xyz;
    r5.x = ps;
    r3.xyz = r3.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r9.zxy);
    r4.xyz = r3.xyz * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r5.zzz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.y = saturate(dot(r3.zyx, r2.zyx));
    r5.x = ps;
    r5.xzw = r1.xyz * r5.xxx;
    r5.xz = r0.xy * r6.yy + r5.xz;
    r5.w = r0.z * r6.y + r5.w;
    r5.xzw = r7.xzy * r5.xzw;
    r5.xzw = r5.xzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xwz * r5.yyy;
    r5.xyz = r5.xzy * r6.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
