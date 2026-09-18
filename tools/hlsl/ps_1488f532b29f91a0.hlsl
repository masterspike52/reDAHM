// ps_1488f532b29f91a0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041800 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c21); // float4
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c23); // float2
float4 SpotDirection : register(c22); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c17); // float
float4 UniformScalar_11 : register(c18); // float
float4 UniformScalar_12 : register(c19); // float
float4 UniformScalar_13 : register(c20); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformScalar_8 : register(c15); // float
float4 UniformScalar_9 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
sampler2D Texture2D_10 : register(s11);
sampler2D Texture2D_11 : register(s12);
sampler2D ModShadowAccumTexture : register(s13);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.zw = r0.xy * UniformScalar_2.xx;
    r5 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r6 = r5 * r0.wzwz;
    r16.yzw = tex2D(Texture2D_4, r8.zw).xyz;
    r19.yzw = tex2D(Texture2D_3, r6.xy).xyw;
    r5.zw = r0.wz * UniformScalar_0.xx;
    r11.xy = r0.xy * UniformScalar_3.xx;
    r9.xy = r0.wz * UniformScalar_7.xx;
    r9.zw = r0.wz * UniformScalar_9.xx;
    r19.x = float((r0.w >= 0.5));
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r10.x = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r4.xy = r8.xy * r5.yy + ScreenPositionScaleBias.wz;
    ps = 0.5 - r5.x;
    r8.xy = UniformVector_1.xy * 1.7;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r8.xy * r0.wz;
    r10.y = ps;
    ps = r5.y;
    r16.x = float((r5.x >= 0.5));
    ps = -r0.z + ps;
    r7.xy = r10.xy * abs(r7.xy);
    r5.y = ps;
    r5.x = r19.x * (-0.5) + r0.w;
    r18.x = dot(r5.yy, r16.xx) - r0.z;
    r18.y = r16.x * 2.0 + r19.x;
    r14.xzw = r18.xyy + float3(2.0, -3.0, -2.0);
    ps = r5.x + r5.x;
    r5.y = r14.x - r0.z;
    r5.x = ps;
    r13.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r12.xyw = tex2D(Texture2D_7, r6.zw).xyz;
    r10.yzw = tex2D(Texture2D_11, r9.zw).xyz;
    r17.xyz = tex2D(Texture2D_9, r9.xy).xyz;
    r9 = tex2D(Texture2D_2, r5.xy);
    r23.xyz = tex2D(Texture2D_10, r11.xy).xyz;
    r24.xyz = tex2D(Texture2D_8, r8.zw).xyz;
    r5.y = tex2D(Texture2D_6, r0.wz).x;
    r7.xyz = tex2D(Texture2D_3, r8.xy).xyw;
    r8.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r0.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r21.xyz = tex2D(Texture2D_1, r6.zw).xyz;
    r4.xyz = tex2D(Texture2D_0, r5.zw).xyw;
    ps = r4.w;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r5.z = r1.z + 0.1;
    r10.x = saturate(ps);
    ps = (-1.0) + r4.z;
    r6.z = dot(r3.zxy, r3.zxy);
    r13.x = ps;
    ps = r21.z + r21.z;
    r0.w = dot(r1.zxy, r1.zxy);
    r17.w = ps;
    ps = 5.0 * r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.w = saturate(ps);
    r0.xyz = r0.xyz * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r20.xyz = r8.xyz * r2.www;
    r22.x = ps;
    ps = r4.y + r4.y;
    r22.zw = r7.xy + r7.xy;
    r22.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r6.y = dot(r24.zxy, float3(0.11, 0.3, 0.59));
    r5.y = saturate(ps);
    ps = 1.0 - r5.x;
    r5.z = dot(r23.zxy, float3(0.11, 0.3, 0.59));
    r5.w = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r6.x = r19.w * r7.z;
    r0.w = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyz = r0.www * r1.xyz;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r8.xyz = r6.zzz * r3.xyz;
    r21.w = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.zzz - r23.xyz;
    r5.z = ps;
    ps = log2(r5.w);
    r1.xyz = r6.yyy - r24.xyz;
    r5.x = ps;
    ps = log2(r5.y);
    r15.xyz = r5.zzz * -SpotDirection.xyz;
    r5.y = ps;
    ps = UniformScalar_5.x * r5.y;
    r6.y = dot(r15.zxy, r2.zxy);
    r0.w = ps;
    r15.xyz = r16.yzw * 2.0 - 1.0;
    r1.xyz = r1.xyz * UniformScalar_6.xxx + r24.xyz;
    r5.yzw = r3.xyz * UniformScalar_8.xxx + r23.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3 = r22.zwxy + float4(-3.0, -3.0, -1.0, -1.0);
    r5.x = ps;
    r14.xy = r19.yz * 4.0 + r3.xy;
    r6.z = (r18.y == 0.0) ? r9.x : r9.y;
    ps = UniformVector_3.x * r5.y;
    r19.xyz = r1.xyz * UniformVector_2.xyz;
    r18.x = ps;
    ps = UniformVector_3.y * r5.z;
    r2.xyw = r0.xyz - r15.xyz;
    r18.y = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r21.xyw * float3(4.0, 4.0, 0.5);
    r5.x = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r20.xzy * r5.xxx;
    r1.w = ps;
    r15.xy = r2.xy * r1.ww + r15.xy;
    ps = UniformVector_3.z * r5.w;
    r17.xyz = r19.xyz * r17.xyz;
    r18.z = ps;
    ps = -SpotAngles.x - -r6.y;
    r18.xyz = r18.xyz * r10.yzw;
    r5.x = ps;
    r10.yzw = r18.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.yzw = r17.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r6.y = (r14.w == 0.0) ? r9.z : r6.z;
    ps = SpotAngles.y * r5.x;
    r18.xyz = r18.xyz - r17.xyz;
    r12.z = saturate(ps);
    r9.xyz = r18.xyz * r1.www + r17.xyz;
    r6.z = (r14.z == 0.0) ? r9.w : r6.y;
    ps = (-2.0) + r0.x;
    r10.yzw = r10.yzw - r5.yzw;
    r15.z = ps;
    r2.xyz = r10.yzw * r1.www + r5.yzw;
    ps = (-2.0) + r0.y;
    r5.x = max(r6.z, 0.0);
    r15.w = ps;
    ps = 1.0 - r6.w;
    r14.zw = r6.xz + float2(-1.0, -0.75);
    r5.z = ps;
    ps = 1.0 - r6.z;
    r13.y = min(r5.x, 0.3);
    r5.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = r14.w + r6.z;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.x = saturate(r5.x + r0.z);
    r10.z = ps;
    ps = r6.x;
    r6.yzw = r13.yzw * float3(3.3333333, 0.875, 0.875);
    ps = r12.x * ps;
    r17.xyz = r6.yyy * r14.xyz;
    r3.x = ps;
    ps = r6.x;
    r10.xyz = -r10.xyz + 1.0;
    ps = r12.y * ps;
    r10.w = r10.x * UniformScalar_1.x;
    r3.y = ps;
    r14.xy = r10.ww * r3.zw - 2.0;
    r15 = r10.wwww * r3.zwzw + r15;
    ps = r6.x;
    r5.xy = r17.wz + float2(-1.0, 1.0);
    r12.xy = r17.xy * 4.0 + r15.xy;
    ps = r12.w * ps;
    r14.zw = r5.xw * float2(0.5, 2.5);
    r3.z = ps;
    r0.w = saturate(r14.w * r5.y - 0.5);
    r5.x = r2.w * r1.w - r14.z;
    r5.x = r16.w * 2.0 + r5.x;
    ps = (-1.0) + r5.x;
    r12.xy = r12.xy - r15.zw;
    r12.w = ps;
    r5.xzw = r12.xyw * r0.www + r14.xyz;
    ps = (-1.0) - -r5.w;
    r13.yz = r5.xz + r0.xy;
    r6.x = ps;
    r12.xy = r6.zw * r10.yz + 0.125;
    r6.w = r6.x * r10.x + 1.0;
    ps = abs(r5.y) * abs(r5.y);
    r6.xyz = r13.xyz * r10.xxx;
    r12.w = ps;
    ps = 1.0 + r6.x;
    r4.xyz = r3.xyz * r4.zzz;
    r5.x = ps;
    r3.xyz = (r10.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r3.w = (r10.w > 0.0) ? r5.x : 1.0;
    r6.xyz = r12.wxz * r12.wyz;
    r5.xzw = r6.yyy * r11.xyz + ModShadowColor.xyz;
    ps = r6.x * r6.x;
    r5.y = ps;
    ps = -UniformVector_0.x;
    r2.xyz = r5.yyy * r2.xyz;
    r3 = (r10.xxxw >= 0.0) ? r3 : float4(0.0, 0.0, 1.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    r9.xyz = r9.xyz * r3.www - r4.xyz;
    r4.xyz = r9.xyz * r0.www + r4.xyz;
    ps = rsqrt(abs(r5.y));
    r2.xyz = r2.xyz * r0.www;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r3.xyz * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r8.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r9.xyz = r3.xyz * r5.yyy;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r7.zxy, r8.zxy));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r4.xyz * r0.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5.y = saturate(dot(r3.zyx, r7.zyx));
    r6.w = ps;
    r6.xyw = r2.xyz * r6.www;
    r0.xy = r0.xy * r5.yy + r6.xy;
    r0.z = r0.z * r5.y + r6.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.zzz;
    r5.xyz = r6.xzy * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
