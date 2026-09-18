// ps_995a6aa8d3167d36.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041700 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r9 = r5 * r0.wzwz;
    r17.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    ps = 1.0 - r0.z;
    r10.zw = r0.xy * UniformScalar_3.xx;
    r12.y = ps;
    r11.xyz = tex2D(Texture2D_5, r10.zw).zxy;
    r8.zw = r0.wz * UniformScalar_0.xx;
    ps = r0.w;
    r5.yw = r0.xy * UniformScalar_2.xx;
    ps = UniformScalar_7.x * ps;
    r14.xy = r0.wz * UniformScalar_9.xx;
    r13.x = ps;
    ps = r0.z;
    r17.w = float((r0.w >= 0.5));
    ps = UniformScalar_7.x * ps;
    r5.x = r1.z + 0.1;
    r13.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = UniformVector_1.xy * 1.7;
    r6.x = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r10.xy = r8.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r8.xy = r6.yz * r0.wz;
    r12.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r16.x = float((r12.y >= 0.5));
    r6.y = ps;
    ps = r11.y + r11.y;
    r7.zw = r6.xy * abs(r7.xy);
    r11.y = ps;
    ps = r11.z + r11.z;
    r6.xyz = r17.xwy * float3(4.0, -0.5, 4.0);
    r11.z = ps;
    ps = r11.x + r11.x;
    r5.xz = -r12.yx + float2(0.5, 1.0);
    r11.w = ps;
    ps = r6.y;
    r5.x = r5.x - r0.z;
    r11.x = dot(r5.xx, r16.xx) - r0.z;
    ps = r0.w + ps;
    r12 = r11 + float4(2.0, -1.0, -1.0, -1.0);
    r5.x = ps;
    ps = r5.x + r5.x;
    r7.y = r12.x - r0.z;
    r7.x = ps;
    r11.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r19.xyz = tex2D(Texture2D_11, r14.xy).xyz;
    r21.xyz = tex2D(Texture2D_9, r13.xw).xyz;
    r15 = tex2D(Texture2D_2, r7.xy).zxyw;
    r16.yzw = tex2D(Texture2D_4, r5.yw).xyz;
    r9.xyz = tex2D(Texture2D_3, r9.xy).xyw;
    r22.xyz = tex2D(Texture2D_10, r10.zw).xyz;
    r23.xyz = tex2D(Texture2D_8, r5.yw).xyz;
    r5.y = tex2D(Texture2D_6, r0.wz).x;
    r14.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r7.yzw = tex2D(Texture2D_0, r8.zw).xyw;
    r8.xyz = tex2D(Texture2D_3, r8.xy).xyw;
    ps = r4.w;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r0.w = dot(r1.zxy, r1.zxy);
    r0.y = saturate(ps);
    ps = r17.z + r17.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = r8.x + r8.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r20.y = ps;
    ps = r8.y + r8.y;
    r4.yz = r7.yz + r7.yz;
    r20.z = ps;
    ps = rsqrt(abs(r5.w));
    r18.xyz = r14.xyz * r2.www;
    r0.z = ps;
    ps = UniformScalar_4.x * r5.y;
    r5.w = dot(r23.zxy, float3(0.11, 0.3, 0.59));
    r5.y = saturate(ps);
    ps = 1.0 - r5.x;
    r6.w = dot(r22.zxy, float3(0.11, 0.3, 0.59));
    r5.x = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r0.x = r9.z * r8.z;
    r0.w = ps;
    ps = log2(r5.x);
    r2.xyz = r0.www * r1.xyz;
    r5.x = ps;
    ps = log2(r5.y);
    r8.xyz = r0.zzz * r3.xyz;
    r5.y = ps;
    r14.xyz = r16.yzw * 2.0 - 1.0;
    ps = UniformScalar_5.x * r5.y;
    r3.xyz = r6.www - r22.xyz;
    r6.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r5.www - r23.xyz;
    r4.w = ps;
    r1.yzw = r1.xyz * UniformScalar_6.xxx + r23.xyz;
    r5.xyw = r3.yxz * UniformScalar_8.xxx + r22.yxz;
    r20.x = r16.x * 2.0 + r17.w;
    r2.w = (r20.x == 0.0) ? r15.y : r15.z;
    ps = UniformVector_3.x * r5.y;
    r17.xzw = r4.xyz - 1.0;
    r1.x = ps;
    ps = UniformVector_3.y * r5.x;
    r3.xyz = r1.yzw * UniformVector_2.xyz;
    r1.y = ps;
    ps = UniformVector_3.z * r5.w;
    r4.xyz = r3.xyz * r21.xyz;
    r1.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r19.xyz = r1.xyz * r19.xyz;
    r0.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1 = r20.xxyz + float4(-2.0, -3.0, -3.0, -3.0);
    r0.w = ps;
    r15.yz = r9.xy * 4.0 + r1.zw;
    r9.xyz = r19.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.xzw = r4.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = pow(2.0, r4.w);
    r3 = -r0.zwxy + 1.0;
    r5.y = ps;
    r1.x = (r1.x == 0.0) ? r15.x : r2.w;
    ps = pow(2.0, r6.w);
    r19.xyz = r19.xyz - r4.xyz;
    r6.w = ps;
    r4.xyz = r19.xyz * r6.www + r4.xyz;
    r7.x = (r1.y == 0.0) ? r15.w : r1.x;
    ps = r3.w;
    r1.xyz = r18.xzy * r5.yyy;
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r9.xyz = r9.xyz - r5.xzw;
    r1.w = ps;
    r9.xyz = r9.xyz * r6.www + r5.xzw;
    r5.xy = r1.ww * r17.zw - 2.0;
    r5.z = max(r7.x, 0.0);
    ps = (-2.0) + r6.x;
    r12.xyw = r12.ywz - r14.xzy;
    r14.z = ps;
    ps = (-2.0) + r6.z;
    r13.x = min(r5.z, 0.3);
    r14.w = ps;
    r14.xy = r12.xw * r6.ww + r14.xy;
    ps = 1.0 - r7.x;
    r12.xw = r7.wx + float2(-1.0, -0.75);
    r17.y = ps;
    ps = r12.w;
    r5.zw = r17.xy * float2(0.5, 2.5);
    r14 = r1.wwww * r17.zwzw + r14.zwxy;
    ps = r7.x + ps;
    r13.yzw = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r2.w = ps;
    r6.w = r12.y * r6.w - r5.z;
    r2.w = saturate(r3.z * 0.5 + r2.w);
    ps = (-1.0) - -r0.x;
    r11.xyz = r2.www * r11.xyz;
    r15.w = ps;
    r15.x = r16.w * 2.0 + r6.w;
    r15.yzw = r13.yyy * r15.yzw;
    r0.xy = r15.yz * 4.0 + r14.zw;
    r14.zw = r15.xw + float2(-1.0, 1.0);
    r6.w = saturate(r5.w * r14.w - 0.5);
    ps = abs(r14.w) * abs(r14.w);
    r14.xy = r0.xy - r14.xy;
    r0.x = ps;
    r5.xyz = r14.zxy * r6.www + r5.zxy;
    ps = (-1.0) - -r5.x;
    r12.yz = r5.yz + r6.xz;
    r13.x = ps;
    r6.yz = r13.zw * r3.xy + 0.125;
    r5.w = r13.x * r3.w + 1.0;
    ps = r0.x * r0.x;
    r5.xyz = r12.xyz * r3.www;
    r6.x = ps;
    ps = 1.0 + r5.x;
    r3.xyz = r11.xyz * r7.www;
    r0.w = ps;
    r0.xyz = (r3.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.y = (r1.w > 0.0) ? r0.w : 1.0;
    r6.xy = r6.xy * r6.xz;
    r5.xzw = r6.yyy * r10.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r6.xyz = r6.xxx * r9.xyz;
    r1.w = (r1.w >= 0.0) ? r5.y : 1.0;
    r0.yzw = (r3.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    r4.xyz = r4.xyz * r1.www - r3.xyz;
    r4.xyz = r4.xyz * r6.www + r3.xyz;
    ps = rsqrt(abs(r5.y));
    r6.yzw = r6.xyz * r6.www;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r0.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r8.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r3.xyz * r5.yyy;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r2.zxy, r7.zxy));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r4.xyz * r0.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.y = saturate(dot(r3.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.yy + r6.xy;
    r6.z = r0.z * r5.y + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xwz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
