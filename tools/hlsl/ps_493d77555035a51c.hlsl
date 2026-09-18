// ps_493d77555035a51c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041700 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r12.xy = r0.xy * UniformScalar_2.xx;
    r6.xy = r0.xy * UniformScalar_3.xx;
    r5 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r10 = r5 * r0.wzwz;
    r8.xyz = tex2D(Texture2D_1, r10.zw).xzy;
    r23.xyz = tex2D(Texture2D_5, r6.xy).xyz;
    r18.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    r9.xyw = tex2D(Texture2D_4, r12.xy).xyz;
    r5.yw = r0.wz * UniformScalar_0.xx;
    r6.zw = r0.wz * UniformScalar_7.xx;
    r11.xy = r0.wz * UniformScalar_9.xx;
    r18.x = float((r0.w >= 0.5));
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r12.z = ps;
    ps = 1.0 / r4.w;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r11.zw = r11.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = 0.5 - r5.x;
    r4.xy = UniformVector_1.xy * 1.7;
    r1.w = ps;
    ps = r9.x + r9.x;
    r4.xy = r4.xy * r0.wz;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r23.w = float((r5.x >= 0.5));
    r12.w = ps;
    ps = r9.y + r9.y;
    r5.xz = r12.zw * abs(r7.xy);
    r13.y = ps;
    r8.w = r18.x * (-0.5) + r0.w;
    ps = r9.w + r9.w;
    r1.w = r1.w - r0.z;
    r13.z = ps;
    r17.w = r23.w * 2.0 + r18.x;
    r13.w = dot(r1.ww, r23.ww) - r0.z;
    ps = r8.y + r8.y;
    r15 = r13 + float4(-1.0, -1.0, -1.0, 2.0);
    r17.z = ps;
    ps = r8.w + r8.w;
    r17.y = r15.w - r0.z;
    r17.x = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r11.zw).xyz;
    r10.yzw = tex2D(Texture2D_7, r10.zw).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r11.xyz = tex2D(Texture2D_11, r11.xy).xyz;
    r20.xyz = tex2D(Texture2D_9, r6.zw).xyz;
    r14 = tex2D(Texture2D_2, r17.xy).zwxy;
    r6.xyz = tex2D(Texture2D_10, r6.xy).xyz;
    r5.z = tex2D(Texture2D_6, r0.wz).x;
    r19.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    r0.xyw = tex2D(Texture2D_3, r4.xy).xyw;
    r4.xyz = tex2D(Texture2D_0, r5.yw).xyw;
    ps = 0.1 - -r1.z;
    r10.x = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r5.y = dot(r2.zxy, r2.zxy);
    r0.z = saturate(ps);
    ps = 1.0 - r5.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = saturate(ps);
    ps = r18.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = r0.w * ps;
    r16.zw = r0.xy + r0.xy;
    r0.y = ps;
    ps = r4.x + r4.x;
    r0.w = dot(r1.zxy, r1.zxy);
    r16.x = ps;
    ps = r4.y + r4.y;
    r5.w = dot(r19.zxy, float3(0.11, 0.3, 0.59));
    r16.y = ps;
    ps = UniformScalar_4.x * r5.z;
    r6.w = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    r5.y = saturate(ps);
    ps = log2(r5.y);
    r21.xyz = r6.www - r6.xyz;
    r5.y = ps;
    ps = log2(r5.x);
    r22.xyz = r5.www - r19.xyz;
    r5.x = ps;
    r2.xyz = r23.xyz * 2.0 - 1.0;
    r19.yzw = r22.xyz * UniformScalar_6.xxx + r19.xyz;
    r6.xyz = r21.zxy * UniformScalar_8.xxx + r6.zxy;
    ps = 4.0 * r8.x;
    r16 = r16 + float4(-1.0, -1.0, -3.0, -3.0);
    r6.w = ps;
    r18.xy = r18.yz * 4.0 + r16.zw;
    r0.x = (r17.w == 0.0) ? r14.z : r14.w;
    ps = UniformVector_3.x * r6.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r19.x = ps;
    ps = UniformVector_3.y * r6.z;
    r21.xyz = r19.yzw * UniformVector_2.xyz;
    r19.y = ps;
    ps = UniformVector_3.z * r6.x;
    r20.xyz = r21.xyz * r20.xyz;
    r19.z = ps;
    ps = 4.0 * r8.z;
    r21.xyz = r19.xyz * r11.xyz;
    r6.x = ps;
    r19.xyz = r21.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r11.xyz = r20.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = UniformScalar_5.x * r5.y;
    r2.xyw = r2.xyz - r15.xyz;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r5.yzw = r21.xyz - r20.xyz;
    r6.z = ps;
    r8.xyz = r5.yzw * r6.zzz + r20.xyz;
    r15.xy = r2.xy * r6.zz + r15.xy;
    ps = rsqrt(abs(r1.w));
    r5.yzw = r19.xyz - r11.xyz;
    r6.y = ps;
    r11.xyz = r5.yzw * r6.zzz + r11.xyz;
    ps = rsqrt(abs(r0.w));
    r5.yzw = r17.zww + float3(-1.0, -3.0, -2.0);
    r0.w = ps;
    ps = 0.5 * r5.y;
    r2.xyz = r0.www * r1.xyz;
    r14.z = ps;
    r0.x = (r5.w == 0.0) ? r14.x : r0.x;
    r0.x = (r5.z == 0.0) ? r14.y : r0.x;
    r5.y = r2.w * r6.z - r14.z;
    r17.x = r9.w * 2.0 + r5.y;
    ps = (-1.0) + r0.y;
    r3.xyz = r6.yyy * r3.xyz;
    r18.z = ps;
    ps = (-0.75) + r0.x;
    r5.yzw = -r0.yzx + 1.0;
    r18.w = ps;
    ps = r18.w;
    r0.w = max(r0.x, 0.0);
    ps = r0.x + ps;
    r6.yz = r5.yw * float2(0.5, 2.5);
    r0.x = ps;
    ps = r0.x;
    r13.x = min(r0.w, 0.3);
    ps = r6.y + ps;
    r13.yzw = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r0.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r0.xyz = r0.xxx * r10.yzw;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r17.yzw = r13.yyy * r18.xyz;
    r10.z = ps;
    ps = (-2.0) + r6.w;
    r10.xyz = -r10.xyz + 1.0;
    r15.z = ps;
    ps = (-2.0) + r6.x;
    r10.w = r10.x * UniformScalar_1.x;
    r15.w = ps;
    r14.xy = r10.ww * r16.xy - 2.0;
    r16 = r10.wwww * r16.xyxy + r15;
    ps = (-1.0) + r4.z;
    r15.zw = r17.xw + float2(-1.0, 1.0);
    r1.y = ps;
    r1.x = saturate(r6.z * r15.w - 0.5);
    r5.yz = r17.yz * 4.0 + r16.xy;
    ps = abs(r15.w) * abs(r15.w);
    r15.xy = r5.yz - r16.zw;
    r0.w = ps;
    r5.yzw = r15.zxy * r1.xxx + r14.zxy;
    ps = (-1.0) - -r5.y;
    r1.zw = r5.zw + r6.wx;
    r13.x = ps;
    r5.zw = r13.zw * r10.yz + 0.125;
    r6.w = r13.x * r10.x + 1.0;
    ps = r0.w * r0.w;
    r6.xyz = r1.yzw * r10.xxx;
    r5.y = ps;
    ps = 1.0 + r6.x;
    r0.xyz = r0.xyz * r4.zzz;
    r0.w = ps;
    r6.xyz = (r10.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.w = (r10.w > 0.0) ? r0.w : 1.0;
    r1.yz = r5.yz * r5.yw;
    r5.yzw = r1.zzz * r12.xyz + ModShadowColor.xyz;
    r1.yzw = r1.yyy * r11.xyz;
    r6 = (r10.wxxx >= 0.0) ? r6.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r0.w = dot(r6.wyz, r6.wyz);
    r4.xyz = r8.xyz * r6.xxx - r0.xyz;
    r0.xyz = r4.xyz * r1.xxx + r0.xyz;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r1.yzw * r1.xxx;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r3.zxy);
    r4.xyz = r6.yzw * r6.xxx;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    r6.x = saturate(dot(r2.zxy, r3.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r9.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.x = r6.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r1.xyz * r6.xxx;
    r5.x = ps;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
