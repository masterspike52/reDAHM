// ps_cc8db974cbf26ceb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 447 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006FC 10041900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c18); // float4
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c20); // float2
float4 SpotDirection : register(c19); // float3
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r4.w;
    r5.y = r1.z + 0.1;
    ps = (-4e+02) + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r6.x));
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    ps = 0.00022222222 * r5.w;
    r6.zw = r0.wz * UniformVector_1.xy;
    r6.y = saturate(ps);
    ps = 5.0 * r5.y;
    r9.xyz = r6.xxx * r3.xyz;
    r6.x = saturate(ps);
    ps = 1.0 / r4.w;
    r5.w = r6.y * (-0.1);
    r5.y = ps;
    r13.xy = r9.xy * r5.ww + r6.zw;
    r5.yw = r13.zw * r5.yy + ScreenPositionScaleBias.wz;
    r3.xzw = tex2D(LightAttenuationTexture, r5.yw).xyz;
    ps = UniformVector_2.x * r0.w;
    r5.xz = r0.wz + r0.wz;
    r15.y = ps;
    r10.xyw = tex2D(Texture2D_4, r5.xz).xyw;
    ps = UniformVector_1.x + UniformVector_1.x;
    r3.y = -r0.z + 1.0;
    r11.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r8.w = UniformScalar_1.x * UniformVector_4.x;
    r11.y = ps;
    ps = r0.w - r0.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = r0.z - r0.y;
    r8.xyz = r3.xzw * r2.www;
    r5.w = ps;
    r3.xz = r5.yw * UniformScalar_4.xx + r0.xy;
    ps = 1.0 / UniformScalar_2.x;
    r5.y = saturate(-r6.z + 1.0);
    r5.w = ps;
    ps = log2(r5.y);
    r16.xy = r3.xz * UniformVector_6.xy;
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.y = r5.y * LightColorAndFalloffExponent.w;
    r6.w = ps;
    ps = pow(2.0, r5.y);
    r23.y = r16.y + UniformVector_7.y;
    r5.y = ps;
    r3.x = -r13.y * r6.w + 1.0;
    ps = 1.0 / UniformVector_1.x;
    r8 = r8.xzyw * r5.yyyw;
    r3.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = r3.xyz * UniformVector_2.yyx;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.x = r3.z * r13.x;
    r5.w = ps;
    ps = r10.x + r10.x;
    r12.zw = r0.wz * UniformVector_8.xy;
    r15.z = ps;
    ps = r10.y + r10.y;
    r12.xy = r11.xy * r0.wz;
    r15.w = ps;
    ps = (-0.5) + r3.x;
    r14.xy = r5.yw * abs(r7.xy);
    r5.y = ps;
    ps = (-0.5) + r3.y;
    r7.yz = float2((r3.xy >= 0.5));
    r5.w = ps;
    ps = r8.w;
    r7.xw = r5.yw - r3.xy;
    r5.y = ps;
    r3.yw = r7.xw * r7.yz + r3.xy;
    ps = UniformScalar_3.x * r5.y;
    r11 = r15.zxyw + float4(-1.0, -0.5, -0.5, -1.0);
    r7.x = ps;
    ps = r7.y + r7.y;
    r16.zw = float2((r15.xy >= 0.5));
    r7.y = ps;
    ps = r7.z + r7.z;
    r3.xz = r11.yz - r15.xy;
    r7.z = ps;
    ps = 6.0 * r5.x;
    r23.xzw = r7.xyz + r16.xzw;
    r5.y = ps;
    r3.xz = r3.xz * r16.zw + r15.xy;
    ps = 6.0 * r5.z;
    r7 = r3 + r3;
    r5.w = ps;
    r3 = tex2D(Texture2D_2, r12.xy);
    r19.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r20.yz = tex2D(ModShadowAccumTexture, r14.xy).xy;
    r21 = tex2D(Texture2D_3, r7.xy);
    r22 = tex2D(Texture2D_3, r7.zw);
    r25 = tex2D(Texture2D_7, r23.xy);
    r17.xyz = tex2D(Texture2D_9, r12.zw).xyz;
    r14 = tex2D(Texture2D_6, r0.xy);
    r5.xyz = tex2D(Texture2D_4, r5.yw).xyw;
    r7.xyz = tex2D(Texture2D_0, r13.xy).xyz;
    r15.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    r0.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r12.yzw = -ModShadowColor.xyz + 1.0;
    r18.xyw = UniformVector_5.xyz * 2e+01;
    r5.w = float((UniformScalar_17.x >= 1.0));
    ps = r4.w;
    r6.w = float((UniformScalar_17.x > 1.0));
    r13.xyz = r0.zxy * 2.0 - 1.0;
    r16.xzw = r15.zxy * 2.0 - 1.0;
    r15.xyz = r7.zxy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r24.xyz = r14.zxy * UniformScalar_18.xxx;
    r13.w = saturate(ps);
    r17.xyz = (-abs(r6.www) >= 0.0) ? r17.xyz : 1.0;
    ps = r5.x + r5.x;
    r0.xyz = r25.xyz * r25.www;
    r18.z = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r18.xyw * r0.xyz;
    r6.z = ps;
    ps = r5.y + r5.y;
    r4.xyz = r6.zzz * -SpotDirection.xyz;
    r18.w = ps;
    r17.yzw = (-abs(r5.www) >= 0.0) ? 1.0 : r17.xyz;
    r10.xyz = r24.yzx * r17.yzw + UniformScalar_19.xxx;
    ps = r14.w;
    r5.y = dot(r4.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r0 = r0.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r5.w = ps;
    r17.x = dot(r0.yx, r5.ww) + 0.0;
    ps = r5.z;
    r2.xyz = r0.yzw * r5.www;
    r12.x = dot(r2.zy, float2(0.11, 0.59)) + 0.0;
    r5.z = (r23.w == 0.0) ? r22.x : r22.y;
    r5.x = (r23.z == 0.0) ? r21.x : r21.y;
    ps = r10.w * ps;
    r0 = r23.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r4.y = ps;
    r5.x = (r0.y == 0.0) ? r21.z : r5.x;
    r5.z = (r0.z == 0.0) ? r22.z : r5.z;
    r6.z = (r0.w == 0.0) ? r22.w : r5.z;
    r4.z = (r0.x == 0.0) ? r21.w : r5.x;
    ps = -SpotAngles.x - -r5.y;
    r4.xw = r4.yz + float2(-1.0, 0.25);
    r5.x = ps;
    ps = 1.0 - r6.x;
    r5.y = max(r6.z, 0.0);
    r5.z = ps;
    ps = 1.0 - r6.z;
    r20.x = min(r5.y, 0.3);
    r5.y = ps;
    r6.xy = -r5.zz * ModShadowGroupColor.xy + 1.0;
    ps = SpotAngles.y * r5.x;
    r5.w = r4.w + r4.z;
    r6.z = saturate(ps);
    ps = r5.w;
    r0.xyw = r20.yzx * float3(0.875, 0.875, 3.3333333);
    ps = -r4.y + ps;
    r18.xy = r0.xy * r6.xy;
    r5.x = saturate(ps);
    ps = 2.5 * r5.y;
    r6.xyw = r5.xxx * r19.xyz;
    r5.w = ps;
    ps = -r6.w;
    r4.yz = -r6.xy + r3.xy;
    r11.yz = r4.yz * r3.ww + r6.xy;
    ps = r3.z + ps;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r16.y = ps;
    r4.yz = r18.zw * 0.5 + r11.xw;
    ps = r18.x * r18.y;
    r16.xzw = r16.xzw - r15.xyz;
    r5.x = ps;
    ps = r16.z;
    r17.yzw = r17.yzw * r14.xyz;
    r0.xyz = r5.xxx * r12.yzw + ModShadowColor.xyz;
    ps = r3.w * ps;
    r4.xyz = r0.www * r4.xyz;
    r14.x = ps;
    ps = r16.w;
    r5.x = r4.x + 1.0;
    ps = r3.w * ps;
    r5.xy = r5.xw * r5.yx;
    r14.y = ps;
    ps = r16.x;
    r5.x = float((r5.x > 0.9));
    ps = r3.w * ps;
    r12.yzw = r2.xyz * r5.xxx;
    r14.z = ps;
    ps = r16.y;
    r12 = r17 + r12;
    ps = r3.w * ps;
    r4.w = r12.y - r11.y;
    r14.w = ps;
    ps = r14.z;
    r0.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r3.xyw = -UniformVector_0.xyz + 1.0;
    r1.w = ps;
    ps = r6.w;
    r13.xyz = r13.xzy * UniformVector_4.zyx;
    ps = r14.w + ps;
    r6.yw = -r13.xw + 1.0;
    r11.x = ps;
    ps = r12.x;
    r7.xyw = r15.xyz + r14.zxy;
    ps = -r2.x + ps;
    r12.xy = r12.wz - r11.xz;
    r6.x = saturate(ps);
    ps = (-0.5) + r5.y;
    r2.yz = -r13.zy * r6.xx;
    r3.z = saturate(ps);
    ps = 1.0 - r6.x;
    r2.xw = r6.yz * r6.xz;
    r4.x = ps;
    ps = r10.z;
    r5.xyz = r13.xzy + r2.xyz;
    ps = r4.x * ps;
    r4.yz = r5.yz + r4.yz;
    r10.z = ps;
    ps = r5.x;
    r12.zw = r4.yz - r7.yw;
    ps = -r7.x + ps;
    r5 = r12.xwyz * r3.zzzz;
    r10.w = ps;
    ps = r11.z;
    r4.xy = r10.xy * r4.xx;
    ps = r5.z + ps;
    r4.z = r11.x + r5.x;
    r10.y = ps;
    ps = r7.y;
    r4 = r4.wxyz * r3.zzzw;
    ps = r5.w + ps;
    r10.x = r11.y + r4.x;
    r5.x = ps;
    ps = r7.w;
    r3 = r10.wxyz * r3.zxyz;
    ps = r5.y + ps;
    r5.z = r1.w + r3.x;
    r5.y = ps;
    r5.z = r7.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r6.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r6.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r6.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r0.w));
    r5.x = dot(r6.zxy, r6.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r1.xyz;
    r5.x = ps;
    r6.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r6.zxy, r9.zxy);
    r1.xyz = r6.xyz * r5.xxx;
    r1.xyz = r1.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r5.wyz, r1.zxy));
    ps = log2(r5.x);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.x = saturate(dot(r6.zyx, r5.wzy));
    r6.y = ps;
    r5.xyz = r4.yzw * r6.yyx;
    r5.xyz = r3.yzw * r6.xxy + r5.xyz;
    r5.xyz = r8.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.www;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
