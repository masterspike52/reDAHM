// ps_184734dcc9121479.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041700 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c21); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17.xw = r1.xy * UniformScalar_3.xx;
    ps = r1.w;
    r6.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_0.x * ps;
    r7 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r6.z = ps;
    ps = r1.z;
    r6.xy = r6.xy * r1.wz;
    ps = UniformScalar_0.x * ps;
    r13 = r7.zxwy * r1.wwzz;
    r6.w = ps;
    r16.xyz = tex2D(Texture2D_0, r6.zw).xyw;
    r3.xyz = tex2D(Texture2D_1, r13.xz).xzy;
    r19.xyz = tex2D(Texture2D_5, r17.xw).xyz;
    r10.xyz = tex2D(Texture2D_3, r13.yw).xyw;
    r14.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    r9.x = saturate(r5.w * 0.0001);
    ps = -r1.z;
    r0.zw = r1.xy * UniformScalar_2.xx;
    ps = 1.0 + ps;
    r11.xy = r1.wz * UniformScalar_7.xx;
    r9.w = ps;
    ps = r2.z;
    r11.zw = r1.wz * UniformScalar_9.xx;
    ps = 0.1 + ps;
    r6.y = float((r1.w >= 0.5));
    r6.x = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r5.zw = r7.xy * r6.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r6.x;
    r7.x = r10.z * r14.x;
    r7.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r19.w = float((r9.w >= 0.5));
    r7.z = ps;
    r18.w = r19.w * 2.0 + r6.y;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = -r7.xy + 1.0;
    r7.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xy = r7.zw * abs(r8.xy);
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.zw = r6.yx * float2(-0.5, 0.5);
    r9.z = ps;
    ps = r7.z;
    r9 = -r9 + float4(1.0, 1.0, 1.0, 0.5);
    ps = r1.w + ps;
    r6.x = r9.w - r1.z;
    r3.w = ps;
    r16.w = dot(r6.xx, r19.ww) - r1.z;
    ps = r3.y + r3.y;
    r14.xw = r16.zw + float2(-1.0, 2.0);
    r18.z = ps;
    ps = r3.w + r3.w;
    r18.y = r14.w - r1.z;
    r18.x = ps;
    r12.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r13.y = tex2D(ShadowTexture, r0.xy).x;
    r13.xzw = tex2D(Texture2D_7, r13.xz).xyz;
    r17.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r15.xyz = tex2D(Texture2D_11, r11.zw).xyz;
    r8.xyz = tex2D(Texture2D_9, r11.xy).xyz;
    r11 = tex2D(Texture2D_2, r18.xy);
    r21.xyz = tex2D(Texture2D_10, r17.xw).xyz;
    r6.y = tex2D(Texture2D_6, r1.wz).x;
    r20.xyz = tex2D(Texture2D_8, r0.zw).xyz;
    r5.xyw = tex2D(Texture2D_4, r0.zw).xyz;
    r2.w = dot(r4.zxy, r4.zxy);
    r0.x = dot(r2.zxy, r2.zxy);
    r1.xy = r16.xy + r16.xy;
    ps = r14.y + r14.y;
    r0.yzw = r5.xyw + r5.xyw;
    r1.z = ps;
    ps = r14.z + r14.z;
    r6.x = dot(r20.zxy, float3(0.11, 0.3, 0.59));
    r1.w = ps;
    ps = UniformScalar_4.x * r6.y;
    r6.z = dot(r21.zxy, float3(0.11, 0.3, 0.59));
    r6.y = saturate(ps);
    ps = log2(r6.y);
    r22.xyz = r6.zzz - r21.xyz;
    r6.y = ps;
    r19.xyz = r19.xyz * 2.0 - 1.0;
    ps = UniformScalar_5.x * r6.y;
    r23.xyz = r6.xxx - r20.xyz;
    r6.w = ps;
    r20.yzw = r23.xyz * UniformScalar_6.xxx + r20.xyz;
    r6.xyz = r22.zxy * UniformScalar_8.xxx + r21.zxy;
    ps = rsqrt(abs(r0.x));
    r1 = r1.xywz + float4(-1.0, -1.0, -3.0, -3.0);
    r4.w = ps;
    r10.yz = r10.xy * 4.0 + r1.wz;
    r0.x = (r18.w == 0.0) ? r11.x : r11.y;
    ps = UniformVector_3.x * r6.y;
    r2.xyz = r4.www * r2.xyz;
    r20.x = ps;
    ps = UniformVector_3.y * r6.z;
    r21.xyz = r20.yzw * UniformVector_2.xyz;
    r20.y = ps;
    ps = UniformVector_3.z * r6.x;
    r8.xyz = r21.xyz * r8.xyz;
    r20.z = ps;
    ps = rsqrt(abs(r2.w));
    r21.xyz = r20.xyz * r15.xyz;
    r6.x = ps;
    r20.xyz = r21.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r15.xyz = r8.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = pow(2.0, r6.w);
    r21.xyz = r21.xyz - r8.xyz;
    r6.w = ps;
    r8.xyz = r21.xyz * r6.www + r8.xyz;
    ps = r9.x;
    r5.xyz = r6.xxx * r4.xyz;
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r4.xyz = r20.xyz - r15.xyz;
    r1.w = ps;
    r4.xyz = r4.xyz * r6.www + r15.xyz;
    r15.xy = r1.ww * r1.xy - 2.0;
    ps = 4.0 * r3.x;
    r18.xzw = r18.zww + float3(-1.0, -3.0, -2.0);
    r6.x = ps;
    r6.y = (r18.w == 0.0) ? r11.z : r0.x;
    r0.x = (r18.z == 0.0) ? r11.w : r6.y;
    ps = 4.0 * r3.z;
    r6.z = max(r0.x, 0.0);
    r6.y = ps;
    ps = 1.0 - r0.x;
    r11 = r0.yzwx + float4(-1.0, -1.0, -1.0, -0.75);
    r18.y = ps;
    ps = r11.w;
    r17.x = min(r6.z, 0.3);
    ps = r0.x + ps;
    r3.xyz = r19.xyz - r11.xyz;
    r6.z = ps;
    r11.xy = r3.xy * r6.ww + r11.xy;
    ps = r6.z;
    r15.zw = r18.xy * float2(0.5, 2.5);
    ps = r7.w + ps;
    r0.yzw = r17.xyz * float3(3.3333333, 0.875, 0.875);
    r6.z = saturate(ps);
    r6.w = r3.z * r6.w - r15.z;
    r10.x = r5.w * 2.0 + r6.w;
    ps = (-1.0) - -r7.x;
    r3.xyz = r6.zzz * r13.xzw;
    r10.w = ps;
    ps = (-2.0) + r6.x;
    r10.yzw = r0.yyy * r10.yzw;
    r11.z = ps;
    ps = (-2.0) + r6.y;
    r3.xyz = r3.xyz * r16.zzz;
    r11.w = ps;
    r7 = r1.wwww * r1.xyyx + r11.zwyx;
    r6.zw = r10.yz * 4.0 + r7.wz;
    r16.zw = r10.xw + float2(-1.0, 1.0);
    r7.w = saturate(r15.w * r16.w - 0.5);
    ps = abs(r16.w) * abs(r16.w);
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r13.x = ps;
    ps = r13.x * r13.x;
    r16.xy = r6.zw - r7.xy;
    r11.x = ps;
    r7.xyz = r16.zxy * r7.www + r15.zxy;
    ps = (-1.0) - -r7.x;
    r14.yz = r7.yz + r6.xy;
    r0.x = ps;
    r11.zw = r0.zw * r9.yz + 0.125;
    r6.w = r0.x * r9.x + 1.0;
    ps = r13.y * r13.y;
    r6.xyz = r14.xyz * r9.xxx;
    r11.y = ps;
    ps = 1.0 + r6.x;
    r0.xyz = r11.yyy * r12.xyz;
    r7.x = ps;
    r1.xyz = (r9.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.y = (r1.w > 0.0) ? r7.x : 1.0;
    r7.xy = r11.xz * r11.xw;
    r6.xzw = r7.yyy * r10.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r7.xyz = r7.xxx * r4.xyz;
    r0.w = (r1.w >= 0.0) ? r6.y : 1.0;
    r1.yzw = (r9.xxx >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.y = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    r4.xyz = r8.xyz * r0.www - r3.xyz;
    r4.xyz = r4.xyz * r7.www + r3.xyz;
    ps = rsqrt(abs(r6.y));
    r7.yzw = r7.xyz * r7.www;
    r6.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r1.yzw * r6.yyy;
    ps = 1.0 + ps;
    r6.y = dot(r3.zxy, r5.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r3.xyz * r6.yyy;
    r5.xyz = r8.xyz * 2.0 - r5.xyz;
    ps = 1.0 + ps;
    r6.y = saturate(dot(r2.zxy, r5.zxy));
    r1.z = ps;
    ps = log2(r6.y);
    r1.xyz = r4.xyz * r1.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.y = saturate(dot(r3.zyx, r2.zyx));
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r1.xy * r6.yy + r7.xy;
    r7.z = r1.z * r6.y + r7.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
