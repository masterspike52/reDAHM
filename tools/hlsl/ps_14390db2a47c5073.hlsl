// ps_14390db2a47c5073.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10041600 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.x;
    r5.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_2.x * ps;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r11.x = ps;
    ps = r0.y;
    r5.xy = r5.xy * r0.wz;
    ps = UniformScalar_2.x * ps;
    r10 = r6 * r0.wzwz;
    r11.y = ps;
    r22.xyz = tex2D(Texture2D_1, r10.zw).xyz;
    r15.xyz = tex2D(Texture2D_4, r11.xy).xyz;
    r16.xyz = tex2D(Texture2D_3, r10.xy).xyw;
    r14.xyz = tex2D(Texture2D_3, r5.xy).xyw;
    r8.zw = r0.wz * UniformScalar_0.xx;
    r8.xy = r0.xy * UniformScalar_3.xx;
    r9.xy = r0.wz * UniformScalar_7.xx;
    ps = -r0.z;
    r9.zw = r0.wz * UniformScalar_9.xx;
    ps = 1.0 + ps;
    r5.x = r1.z + 0.1;
    r5.w = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r11.zw = r6.xy * r5.yy + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r5.y = float((r0.w >= 0.5));
    r5.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r16.z * r14.z;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r15.w = float((r5.w >= 0.5));
    r5.x = ps;
    r13.w = r15.w * 2.0 + r5.y;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = -r5.wz + float2(0.5, 1.0);
    r6.z = ps;
    ps = 0.5 * r5.x;
    r6.zw = r6.yz * abs(r7.xy);
    r1.w = ps;
    ps = (-0.5) * r5.y;
    r5.z = r5.z - r0.z;
    r5.x = ps;
    r6.y = dot(r5.zz, r15.ww) - r0.z;
    r22.w = r5.x + r0.w;
    ps = r22.z + r22.z;
    r16.zw = r6.xy + float2(-1.0, 2.0);
    r13.z = ps;
    ps = r22.w + r22.w;
    r13.y = r16.w - r0.z;
    r13.x = ps;
    r17.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r6.xz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r10.xyz = tex2D(Texture2D_11, r9.zw).xyz;
    r9.xyz = tex2D(Texture2D_9, r9.xy).xyz;
    r20.xyz = tex2D(LightAttenuationTexture, r11.zw).xyz;
    r12 = tex2D(Texture2D_2, r13.xy);
    r18.xyz = tex2D(Texture2D_10, r8.xy).xyz;
    r19.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r7.yzw = tex2D(Texture2D_0, r8.zw).xyw;
    r5.y = tex2D(Texture2D_6, r0.wz).x;
    r0.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r21.x = saturate(r4.w * 0.0001);
    r8.xyz = r0.xyz * 2.0 - 1.0;
    ps = UniformScalar_4.x * r5.y;
    r0.z = dot(r3.zxy, r3.zxy);
    r6.y = saturate(ps);
    ps = r7.y + r7.y;
    r0.w = dot(r1.zxy, r1.zxy);
    r4.x = ps;
    ps = r7.z + r7.z;
    r6.w = dot(r19.zxy, float3(0.11, 0.3, 0.59));
    r4.y = ps;
    ps = r14.x + r14.x;
    r5.x = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r4.z = ps;
    ps = r14.y + r14.y;
    r0.xy = r22.xy * 4.0;
    r4.w = ps;
    ps = (-2.0) + r0.x;
    r5.xyz = r5.xxx - r18.xyz;
    r14.z = ps;
    ps = log2(r6.y);
    r21.yzw = r6.www - r19.xyz;
    r6.y = ps;
    r14.xyw = r15.xyz * 2.0 - 1.0;
    r19.xyz = r21.yzw * UniformScalar_6.xxx + r19.xyz;
    r5.xyz = r5.zxy * UniformScalar_8.xxx + r18.zxy;
    ps = UniformScalar_5.x * r6.y;
    r18 = r4 + float4(-1.0, -1.0, -3.0, -3.0);
    r6.w = ps;
    r16.xy = r16.xy * 4.0 + r18.zw;
    r6.y = (r13.w == 0.0) ? r12.x : r12.y;
    ps = UniformVector_3.x * r5.y;
    r4.xyz = r20.xyz * r2.www;
    r2.x = ps;
    ps = UniformVector_3.y * r5.z;
    r19.xyz = r19.xyz * UniformVector_2.xyz;
    r2.y = ps;
    ps = pow(2.0, r6.w);
    r8.xyw = r8.xyz - r14.xyw;
    r6.w = ps;
    r14.xy = r8.xy * r6.ww + r14.xy;
    ps = UniformVector_3.z * r5.x;
    r9.xyz = r19.xyz * r9.xyz;
    r2.z = ps;
    ps = ModShadowGroupColor.x * r5.w;
    r2.xyz = r2.xyz * r10.xyz;
    r21.y = ps;
    r19.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r10.xyz = r9.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = ModShadowGroupColor.y * r5.w;
    r20.xyz = r2.xyz - r9.xyz;
    r21.z = ps;
    ps = (-2.0) + r0.y;
    r2.xyz = -r21.yxz + 1.0;
    r14.w = ps;
    r9.xyz = r20.xyz * r6.www + r9.xyz;
    ps = UniformScalar_1.x * r2.y;
    r5.xyz = r19.xyz - r10.xyz;
    r2.w = ps;
    r10.xyz = r5.xyz * r6.www + r10.xyz;
    r5.xy = r2.ww * r18.xy - 2.0;
    r14 = r2.wwww * r18.xyxy + r14.zwxy;
    ps = rsqrt(abs(r0.w));
    r13.xzw = r13.zww + float3(-1.0, -3.0, -2.0);
    r5.z = ps;
    r5.w = (r13.w == 0.0) ? r12.z : r6.y;
    r7.x = (r13.z == 0.0) ? r12.w : r5.w;
    ps = 1.0 - r7.x;
    r1.xyz = r5.zzz * r1.xyz;
    r13.y = ps;
    ps = rsqrt(abs(r0.z));
    r5.z = max(r7.x, 0.0);
    r5.w = ps;
    ps = r5.z;
    r8.xyz = r5.www * r3.xyz;
    r5.z = ps;
    ps = 0.3;
    r12.xw = r7.wx + float2(-1.0, -0.75);
    r5.w = ps;
    ps = min(r5.z, r5.w);
    r0.z = r12.w + r7.x;
    r6.y = ps;
    ps = 3.3333333 * r6.y;
    r5.zw = r13.xy * float2(0.5, 2.5);
    r13.y = ps;
    r6.w = r8.w * r6.w - r5.z;
    ps = 0.875 * r6.x;
    r0.z = saturate(r0.z + r1.w);
    r13.z = ps;
    ps = 0.875 * r6.z;
    r3.xyz = r0.zzz * r17.xyz;
    r13.w = ps;
    r15.x = r15.z * 2.0 + r6.w;
    r15.yzw = r13.yyy * r16.xyz;
    r6.yz = r15.yz * 4.0 + r14.zw;
    r14.zw = r15.xw + float2(-1.0, 1.0);
    r6.x = saturate(r5.w * r14.w - 0.5);
    ps = abs(r14.w) * abs(r14.w);
    r14.xy = r6.yz - r14.xy;
    r6.y = ps;
    r5.xyz = r14.zxy * r6.xxx + r5.zxy;
    ps = (-1.0) - -r5.x;
    r12.yz = r5.yz + r0.xy;
    r13.x = ps;
    r6.zw = r13.zw * r2.xz + 0.125;
    r5.w = r13.x * r2.y + 1.0;
    ps = r6.y * r6.y;
    r5.xyz = r12.xyz * r2.yyy;
    r6.y = ps;
    ps = 1.0 + r5.x;
    r0.yzw = r3.xyz * r7.www;
    r0.x = ps;
    r3.xyz = (r2.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r3.w = (r2.w > 0.0) ? r0.x : 1.0;
    r5.xy = r6.zy * r6.wy;
    r5.xzw = r5.xxx * r11.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r6.yzw = r5.yyy * r10.xyz;
    r2 = (r2.yyyw >= 0.0) ? r3 : float4(0.0, 0.0, 1.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    r3.xyz = r9.xyz * r2.www - r0.yzw;
    r3.xyz = r3.xyz * r6.xxx + r0.yzw;
    ps = rsqrt(abs(r5.y));
    r6.yzw = r6.yzw * r6.xxx;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r2.xyz * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r2.zxy, r8.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r2.xyz * r5.yyy;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r1.zxy, r7.zxy));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r3.xyz * r0.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.y = saturate(dot(r2.zyx, r1.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.yy + r6.xy;
    r6.z = r0.z * r5.y + r6.z;
    r6.xyz = r4.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
