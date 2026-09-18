// ps_7e3306fa406c1847.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041700 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.xy = r0.xy * UniformScalar_2.xx;
    r5 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r11 = r5 * r0.wzwz;
    r17.yzw = tex2D(Texture2D_3, r11.xy).xyw;
    r6.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    ps = -r0.z;
    r5.yw = r0.wz * UniformScalar_4.xx;
    ps = 1.0 + ps;
    r7.xy = UniformVector_1.xy * 1.7;
    r5.x = ps;
    ps = r4.w;
    r17.x = float((r0.w >= 0.5));
    ps = 0.0001 * ps;
    r6.xyz = r6.xyz + r6.xyz;
    r5.z = saturate(ps);
    ps = 0.5 - r5.x;
    r7.zw = r7.xy * r0.wz;
    r7.x = ps;
    ps = 1.0 - r5.z;
    r13.xyw = r17.yxz * float3(4.0, -0.5, 4.0);
    r7.y = ps;
    ps = r13.y;
    r5.x = float((r5.x >= 0.5));
    ps = r0.w + ps;
    r6.w = r7.x - r0.z;
    r5.z = ps;
    r6.w = dot(r6.ww, r5.xx) - r0.z;
    ps = r5.x + r5.x;
    r6 = r6.xywz + float4(-1.0, -1.0, 2.0, -1.0);
    r16.z = ps;
    ps = r5.z + r5.z;
    r16.y = r6.z - r0.z;
    r16.x = ps;
    r15 = tex2D(Texture2D_2, r16.xy);
    r14.xyz = tex2D(Texture2D_3, r7.zw).xyw;
    r5.y = tex2D(Texture2D_6, r5.yw).x;
    r9.xyz = tex2D(Texture2D_1, r11.zw).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r1.z + 0.1;
    r12.z = ps;
    ps = 5.0 * r5.x;
    r5.zw = r0.xy * UniformScalar_0.xx;
    r21.x = saturate(ps);
    ps = r9.z + r9.z;
    r7.zw = r0.wz * 1.8e+02;
    r21.w = ps;
    ps = 0.6 * r5.y;
    r12.xy = r0.wz * UniformScalar_8.xx;
    r21.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.x = r17.w * r14.z;
    r12.w = ps;
    ps = r14.x + r14.x;
    r13.yz = r4.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    ps = r14.y + r14.y;
    r0.y = r16.z + r17.x;
    r0.w = ps;
    r5.x = (r0.y == 0.0) ? r15.x : r15.y;
    ps = (-1.0) - -r0.x;
    r14 = r0.yyzw + float4(-3.0, -2.0, -3.0, -3.0);
    r0.w = ps;
    r5.x = (r14.y == 0.0) ? r15.z : r5.x;
    r21.y = (r14.x == 0.0) ? r15.w : r5.x;
    ps = r14.z;
    r5.x = max(r21.y, 0.0);
    ps = r13.x + ps;
    r19.x = min(r5.x, 0.3);
    r0.y = ps;
    ps = r14.w;
    r19.yz = r21.yw + float2(-0.75, -1.0);
    ps = r13.w + ps;
    r22.zw = r19.zx * float2(0.5, 3.3333333);
    r0.z = ps;
    ps = r12.z;
    r0.yzw = r22.www * r0.yzw;
    ps = abs(r8.x) * ps;
    r18.y = r0.w + 1.0;
    r10.z = ps;
    ps = 1.0 / r4.w;
    r13.x = abs(r18.y) * abs(r18.y);
    r13.w = ps;
    ps = r12.w;
    r4.xzw = r13.xyz * r13.xww;
    ps = abs(r8.y) * ps;
    r11.xy = r4.zw + ScreenPositionScaleBias.wz;
    r10.w = ps;
    r13.xyz = tex2D(Texture2D_9, r12.xy).xyz;
    r20.xyz = tex2D(Texture2D_7, r11.zw).xyz;
    r14.xy = tex2D(ModShadowAccumTexture, r10.zw).xy;
    r10.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r12.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r7.zw = tex2D(Texture2D_5, r7.zw).xy;
    r11.xyz = tex2D(Texture2D_0, r5.zw).xyw;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.w = dot(r3.zxy, r3.zxy);
    r5.x = dot(r2.zxy, r2.zxy);
    r14.zw = r7.zw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r16.zw = r9.xy * 4.0;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r8.xyz = r5.www * r3.xyz;
    r7.z = ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r23.xyz = r12.xyz * r2.www;
    ps = 1.0 - r5.x;
    r5.w = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r5.z = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r3.xyz = r7.zzz * r1.xyz;
    r5.x = ps;
    ps = r11.x + r11.x;
    r12.xyz = r5.xxx * -SpotDirection.xyz;
    r16.x = ps;
    ps = r11.y + r11.y;
    r1.xyz = r5.www - r10.xyz;
    r16.y = ps;
    ps = log2(r5.z);
    r17 = r14 * float4(0.875, 0.875, 0.018, 0.018);
    r5.x = ps;
    r10.xyz = r1.xyz * UniformScalar_7.xxx + r10.xyz;
    r1 = r16 + float4(-1.0, -1.0, -2.0, -2.0);
    ps = UniformScalar_1.x * r7.y;
    r5.z = dot(r12.zxy, r2.zxy);
    r7.z = ps;
    r14.zw = r7.zz * r1.xy;
    r22.xy = r1.zw + r14.zw;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xy = r6.xy + r14.zw;
    r7.w = ps;
    r5.xw = r1.xy * UniformVector_3.xy - r22.xy;
    ps = pow(2.0, r7.w);
    r6.xyz = -r21.zyx + 1.0;
    r18.x = ps;
    ps = 2.5 * r6.y;
    r12.xyz = r10.xyz * UniformVector_4.xyz;
    r23.w = ps;
    r14.xy = -r6.zz * ModShadowGroupColor.xy + 1.0;
    r0.w = r6.w * UniformVector_3.z - r22.z;
    r0.yz = r0.yz * 4.0 + r5.xw;
    r1 = r23.xzyw * r18.xxxy;
    ps = -SpotAngles.x - -r5.z;
    r7.w = saturate(r1.w - 0.5);
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r18.xyz = r0.yzw * r7.www;
    r4.y = saturate(ps);
    ps = r19.y;
    r0.yzw = r22.xyz + r18.xyz;
    ps = r21.y + ps;
    r19.xy = -r0.yz + r17.zw;
    r5.x = ps;
    ps = r17.x;
    r19.zw = -r0.wx + 1.0;
    r5.x = saturate(r19.w * 0.5 + r5.x);
    ps = r14.x * ps;
    r2.xyz = r5.xxx * r20.xyz;
    r17.x = ps;
    r11.w = r19.z * r5.y + r0.w;
    r5.xy = r19.xy * r5.yy + r18.xy;
    ps = r17.y;
    r17.zw = r5.xy + r14.zw;
    ps = r14.y * ps;
    r14.xw = r11.zw - 1.0;
    r17.y = ps;
    r5.w = r14.w * r7.y + 1.0;
    r0 = r17 + float4(0.125, 0.125, -2.0, -2.0);
    ps = r0.x * r0.y;
    r14.yz = r0.zw + r16.zw;
    r5.x = ps;
    r0.xyz = r5.xxx * r15.xyz + ModShadowColor.xyz;
    r5.xyz = r14.xyz * r7.yyy;
    ps = 1.0 + r5.x;
    r11.xyz = r2.xyz * r11.zzz;
    r6.w = ps;
    r5.xyz = (r7.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.w = (r7.z > 0.0) ? r6.w : 1.0;
    r2 = (r7.yyyz >= 0.0) ? r5 : float4(0.0, 0.0, 1.0, 1.0);
    r5.x = dot(r2.zxy, r2.zxy);
    r5.yzw = r2.www * r13.xyz;
    r7.xyz = r5.yzw * UniformVector_4.xyz;
    r5.yzw = r12.xyz * r5.yzw - r11.xyz;
    r5.yzw = r5.yzw * r7.www + r11.xyz;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r7.xyz * r10.xyz;
    r5.x = ps;
    r2.xyz = r2.xyz * r5.xxx;
    r7.xyz = r7.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r5.x = dot(r2.zxy, r8.zxy);
    r5.yzw = r6.xxx * r5.yzw;
    r6.yzw = r5.yzw * r9.xyz;
    ps = r4.x * r4.x;
    r5.xyw = r2.xyz * r5.xxx;
    r5.z = ps;
    r5.xyw = r5.xyw * 2.0 - r8.xyz;
    ps = r4.y * r4.y;
    r5.y = saturate(dot(r3.zxy, r5.wxy));
    r5.x = ps;
    ps = log2(r5.y);
    r7.xyz = r5.zzz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.x = saturate(dot(r2.zyx, r3.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r7.xyz = r7.xyz * r7.www;
    r5.y = ps;
    r5.yzw = r7.xyz * r5.yyy;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.yzw = r1.xzy * r5.yzw;
    r5.yzw = r5.yzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.ywz * r5.xxx;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
