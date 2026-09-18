// ps_c3a7a909587b5278.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041A00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s13);
sampler2D ModShadowAccumTexture : register(s14);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    ps = 0.0001 * r5.w;
    r6.xy = UniformVector_1.xy * 1.7;
    r12.x = saturate(ps);
    r6.xy = r6.xy * r1.wz;
    r10 = r7 * r1.wzwz;
    r23.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    r9.xyz = tex2D(Texture2D_3, r6.xy).xyw;
    r10.xy = r1.wz * UniformScalar_0.xx;
    ps = r1.x;
    r6.yw = r1.xy * UniformScalar_3.xx;
    ps = UniformScalar_2.x * ps;
    r7.zw = r1.wz * UniformScalar_7.xx;
    r14.x = ps;
    ps = r1.y;
    r11.xy = r1.wz * UniformScalar_9.xx;
    ps = UniformScalar_2.x * ps;
    r12.w = -r1.z + 1.0;
    r14.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r2.z + 0.1;
    r11.z = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r5.xy = r7.xy * r6.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r6.x;
    r23.x = float((r1.w >= 0.5));
    r6.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r23.w * r9.z;
    r11.w = ps;
    ps = 1.0 - r6.x;
    r20.x = float((r12.w >= 0.5));
    r6.x = ps;
    r7.x = r23.x * (-0.5) + r1.w;
    ps = r11.z;
    r12.yz = r6.xx * ModShadowGroupColor.xy;
    ps = abs(r8.x) * ps;
    r13 = -r12 + float4(1.0, 1.0, 1.0, 0.5);
    r0.z = ps;
    ps = r11.w;
    r6.x = r13.w - r1.z;
    r6.x = dot(r6.xx, r20.xx) - r1.z;
    ps = abs(r8.y) * ps;
    r19.zw = r6.zx + float2(-1.0, 2.0);
    r0.w = ps;
    ps = r7.x + r7.x;
    r7.y = r19.w - r1.z;
    r7.x = ps;
    r12.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r15.x = tex2D(ShadowTexture, r0.xy).x;
    r15.yzw = tex2D(Texture2D_7, r10.zw).xyz;
    r0.xz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r22.xyz = tex2D(Texture2D_11, r11.xy).xyz;
    r17.xyz = tex2D(Texture2D_9, r7.zw).xyz;
    r11 = tex2D(Texture2D_2, r7.xy);
    r20.yzw = tex2D(Texture2D_4, r14.xy).xyz;
    r7.xyz = tex2D(Texture2D_10, r6.yw).xyz;
    r26.xyz = tex2D(Texture2D_8, r14.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r6.yw).xyz;
    r6.y = tex2D(Texture2D_6, r1.wz).x;
    r1.xzw = tex2D(Texture2D_1, r10.zw).yxz;
    r5.xyz = tex2D(Texture2D_0, r10.xy).wxy;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = r1.w + r1.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r16.x = ps;
    ps = 1.0 - r6.x;
    r1.y = dot(r2.zxy, r2.zxy);
    r7.w = saturate(ps);
    ps = UniformScalar_4.x * r6.y;
    r18.xy = r5.yz + r5.yz;
    r6.y = saturate(ps);
    ps = r9.x + r9.x;
    r8.yzw = r8.xyz + r8.xyz;
    r16.y = ps;
    ps = r9.y + r9.y;
    r0.y = dot(r26.zxy, float3(0.11, 0.3, 0.59));
    r16.z = ps;
    ps = rsqrt(abs(r1.y));
    r0.w = dot(r7.zxy, float3(0.11, 0.3, 0.59));
    r1.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r1.yyy * r2.xyz;
    r1.y = ps;
    ps = 1.0 - r6.z;
    r24.xyz = r1.yyy * -SpotDirection.xyz;
    r1.y = ps;
    ps = log2(r6.y);
    r25.xyz = r0.www - r7.xyz;
    r6.y = ps;
    ps = log2(r7.w);
    r2.xyz = r0.yyy - r26.xyz;
    r6.x = ps;
    r21.xyz = r20.yzw * 2.0 - 1.0;
    r2.yzw = r2.xyz * UniformScalar_6.xxx + r26.xyz;
    r7.xyz = r25.zxy * UniformScalar_8.xxx + r7.zxy;
    ps = UniformScalar_5.x * r6.y;
    r6.z = dot(r24.zxy, r3.zxy);
    r7.w = ps;
    r18.z = r20.x * 2.0 + r23.x;
    ps = rsqrt(abs(r6.w));
    r16.xzw = r16.xyz + float3(-1.0, -3.0, -3.0);
    r6.y = ps;
    r19.xy = r23.yz * 4.0 + r16.zw;
    r6.w = (r18.z == 0.0) ? r11.x : r11.y;
    ps = UniformVector_3.x * r7.y;
    r4.xyz = r6.yyy * r4.xyz;
    r2.x = ps;
    ps = UniformVector_3.y * r7.z;
    r3.xyz = r2.yzw * UniformVector_2.xyz;
    r2.y = ps;
    ps = UniformVector_3.z * r7.x;
    r17.xyz = r3.xyz * r17.xyz;
    r2.z = ps;
    ps = r1.z;
    r22.xyz = r2.xyz * r22.xyz;
    r6.y = ps;
    ps = 4.0 * r6.y;
    r18 = r18.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r7.x = ps;
    r3.xyz = r22.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r2.xyz = r17.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r6.w = (r18.w == 0.0) ? r11.z : r6.w;
    ps = 4.0 * r1.x;
    r0.w = r13.x * UniformScalar_1.x;
    r7.y = ps;
    ps = pow(2.0, r7.w);
    r22.xyz = r22.xyz - r17.xyz;
    r6.y = ps;
    r11.xyz = r22.xyz * r6.yyy + r17.xyz;
    r17.xy = r0.ww * r18.xy - 2.0;
    r8.x = (r18.z == 0.0) ? r11.w : r6.w;
    ps = 0.5 * r1.y;
    r3.xyz = r3.xyz - r2.xyz;
    r7.z = ps;
    r2.xyz = r3.xyz * r6.yyy + r2.xyz;
    ps = (-2.0) + r7.x;
    r6.w = max(r8.x, 0.0);
    r3.z = ps;
    ps = 1.0 - r8.x;
    r1 = r8 + float4(-0.75, -1.0, -1.0, -1.0);
    r16.y = ps;
    ps = r1.x;
    r0.y = min(r6.w, 0.3);
    ps = r8.x + ps;
    r1.xyz = r1.yzw - r21.xyz;
    r6.w = ps;
    r3.xy = r1.xy * r6.yy + r21.xy;
    ps = 3.3333333 * r0.y;
    r17.zw = r16.xy * float2(0.5, 2.5);
    r16.y = ps;
    r6.y = r1.z * r6.y - r17.z;
    ps = 0.875 * r0.x;
    r6.w = saturate(r6.w + r7.z);
    r16.z = ps;
    ps = 0.875 * r0.z;
    r1.xyz = r6.www * r15.yzw;
    r16.w = ps;
    r8.x = r20.w * 2.0 + r6.y;
    ps = (-2.0) + r7.y;
    r8.yzw = r16.yyy * r19.xyz;
    r3.w = ps;
    r3 = r0.wwww * r18.xyxy + r3.zwxy;
    r0.xy = r8.yz * 4.0 + r3.zw;
    r3.zw = r8.xw + float2(-1.0, 1.0);
    r6.w = saturate(r17.w * r3.w - 0.5);
    ps = (-1.0) + r5.x;
    r3.xy = r0.xy - r3.xy;
    r8.x = ps;
    r0.xyz = r3.zxy * r6.www + r17.zxy;
    ps = (-1.0) - -r0.x;
    r8.yz = r0.yz + r7.xy;
    r16.x = ps;
    r15.zw = r16.zw * r13.yz + 0.125;
    r7.w = r16.x * r13.x + 1.0;
    ps = abs(r3.w) * abs(r3.w);
    r7.xyz = r8.xyz * r13.xxx;
    r15.y = ps;
    ps = 1.0 + r7.x;
    r0.xyz = r1.xyz * r5.xxx;
    r6.y = ps;
    r1.xyz = (r13.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r6.y = (r0.w > 0.0) ? r6.y : 1.0;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r8.yzw = r15.zxy * r15.wxy;
    r6.x = ps;
    r7.xyz = r8.yyy * r14.xyz + ModShadowColor.xyz;
    r6.y = (r0.w >= 0.0) ? r6.y : 1.0;
    r3.xyz = (r13.xxx >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.x);
    r1.xyz = r8.zzz * r12.xyz;
    r6.x = ps;
    ps = -SpotAngles.x - -r6.z;
    r1.xyz = r1.xzy * r6.xxx;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r8.x = saturate(ps);
    r5.xyz = r11.xyz * r6.yyy - r0.xyz;
    r6.xy = r8.xw * r8.xw;
    r2.xyz = r6.yyy * r2.xyz;
    r0.xyz = r5.xyz * r6.www + r0.xyz;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r0.xyz * r10.xyz;
    r6.z = ps;
    r3.xyz = r3.xyz * r6.zzz;
    r6.z = dot(r3.zxy, r4.zxy);
    r5.xyz = r3.xyz * r6.zzz;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.z = saturate(dot(r9.zxy, r4.zxy));
    ps = log2(r6.z);
    r2.xyz = r2.xyz * r6.www;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r7.w = saturate(dot(r3.zyx, r9.zyx));
    r6.z = ps;
    r6.yzw = r2.xyz * r6.zzz;
    r0.xy = r0.xy * r7.ww + r6.yz;
    r0.z = r0.z * r7.w + r6.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
