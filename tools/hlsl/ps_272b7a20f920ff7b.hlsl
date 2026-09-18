// ps_272b7a20f920ff7b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041900 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c24); // float4
float4 LightMapScale : register(c25); // float3
float4 LowerSkyColor : register(c23); // float3
float4 ModShadowAccumResolution : register(c28); // float2
float4 ModShadowColor : register(c26); // float3
float4 ModShadowGroupColor : register(c27); // float3
float4 OpacityOverride : register(c21); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c22); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D Texture2D_10 : register(s10);
sampler2D Texture2D_11 : register(s11);
sampler2D LightMapTexture : register(s12);
sampler2D ModShadowAccumTexture : register(s13);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r1.x;
    r6.xy = UniformVector_1.xy * 6.0;
    ps = UniformScalar_3.x * ps;
    r7 = UniformVector_1.xyxy * float4(1.8, 1.8, 1.7, 1.7);
    r0.z = ps;
    ps = r1.y;
    r6.xy = r6.xy * r1.wz;
    ps = UniformScalar_3.x * ps;
    r13 = r7 * r1.wzwz;
    r0.w = ps;
    r7.xzw = tex2D(Texture2D_5, r0.zw).zxy;
    r21.xyz = tex2D(Texture2D_3, r6.xy).xwy;
    r10.xzw = tex2D(Texture2D_3, r13.zw).wxy;
    r24.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    r6.yw = r1.wz * UniformScalar_0.xx;
    r6.xz = r1.xy * UniformScalar_2.xx;
    r12.xy = r1.wz * UniformScalar_7.xx;
    ps = OpacityOverride.x;
    r12.zw = r1.wz * UniformScalar_9.xx;
    r9.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.y = -r1.z + 1.0;
    r15.x = ps;
    ps = r24.z + r24.z;
    r9.z = dot(r2.zxy, r2.zxy);
    r11.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.x = r21.y * r10.x;
    r15.y = ps;
    ps = r7.x + r7.x;
    r14.z = float((r1.w >= 0.5));
    r7.y = ps;
    r14.y = r14.z * (-0.5) + r1.w;
    ps = rsqrt(abs(r9.z));
    r7.x = float((r9.y >= 0.5));
    r9.z = ps;
    ps = r7.x + r7.x;
    r11.xyz = r9.zzz * r2.xyz;
    r14.x = ps;
    ps = r7.z + r7.z;
    r23.zw = r11.wz + float2(-1.0, 0.1);
    r7.z = ps;
    ps = r7.w + r7.w;
    r9.z = saturate(r23.w * 5.0);
    r7.w = ps;
    ps = r15.x;
    r2.xw = -r9.zw + 1.0;
    ps = abs(r8.x) * ps;
    r9.zw = r2.xx * ModShadowGroupColor.xy;
    r2.y = ps;
    ps = r15.y;
    r17 = -r9.yzwx + float4(0.5, 1.0, 1.0, 1.0);
    ps = abs(r8.y) * ps;
    r10.y = r17.x - r1.z;
    r2.z = ps;
    r7.x = dot(r10.yy, r7.xx) - r1.z;
    ps = r14.x + r14.z;
    r22 = r7 + float4(2.0, -1.0, -1.0, -1.0);
    r7.w = ps;
    ps = r14.y + r14.y;
    r7.y = r22.x - r1.z;
    r7.x = ps;
    r19.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r23.xy = tex2D(ModShadowAccumTexture, r2.yz).xy;
    r8.xyz = tex2D(Texture2D_11, r12.zw).xyz;
    r14.xyz = tex2D(Texture2D_9, r12.xy).xyz;
    r13 = tex2D(Texture2D_2, r7.xy).xwyz;
    r25.xyz = tex2D(Texture2D_10, r0.zw).xyz;
    r15.xyz = tex2D(Texture2D_8, r6.xz).xyz;
    r16.yzw = tex2D(Texture2D_0, r6.yw).xyw;
    r6.y = tex2D(Texture2D_6, r1.wz).x;
    r12.xyw = tex2D(Texture2D_4, r6.xz).xyz;
    r6.xzw = tex2D(LightMapTexture, r0.xy).yxz;
    r21.y = saturate(r3.w * 0.0001);
    r20.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = dot(r4.zxy, r4.zxy);
    r0.y = dot(r5.zxy, r5.zxy);
    r7.xyz = -UniformVector_0.zxy + 1.0;
    r18.xyz = r12.wxy * 2.0 - 1.0;
    ps = UniformScalar_4.x * r6.y;
    r10.xy = r16.yz + r16.yz;
    r6.y = saturate(ps);
    ps = r10.z + r10.z;
    r1.y = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r10.z = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r25.zxy, float3(0.11, 0.3, 0.59));
    r0.w = ps;
    ps = r10.w + r10.w;
    r0.xyz = r0.xxx - r25.xyz;
    r10.w = ps;
    ps = log2(r6.y);
    r1.yzw = r1.yyy - r15.xyz;
    r6.y = ps;
    r15.xyz = r1.yzw * UniformScalar_6.xxx + r15.xyz;
    r0.xyz = r0.xyz * UniformScalar_8.xxx + r25.xyz;
    r10 = r10.zwxy + float4(-3.0, -3.0, -1.0, -1.0);
    r1.zw = r21.xz * 4.0 + r10.xy;
    ps = LightMapScale.x * r6.z;
    r0.xyz = r0.xyz * UniformVector_3.xyz;
    r10.x = ps;
    ps = UniformScalar_5.x * r6.y;
    r15.xyz = r15.xyz * UniformVector_2.xyz;
    r2.y = ps;
    r6.y = (r7.w == 0.0) ? r13.x : r13.z;
    ps = (-3.0) + r7.w;
    r14.xyz = r15.xyz * r14.xyz;
    r1.y = ps;
    ps = (-2.0) + r7.w;
    r15.xyz = r0.xyz * r8.xyz;
    r7.w = ps;
    r8.xyz = r15.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r0.xyz = r14.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r6.y = (r7.w == 0.0) ? r13.w : r6.y;
    ps = pow(2.0, r2.y);
    r15.xyz = r15.xyz - r14.xyz;
    r13.x = ps;
    r14.xyz = r15.xyz * r13.xxx + r14.xyz;
    r21.x = (r1.y == 0.0) ? r13.y : r6.y;
    ps = LightMapScale.y * r6.x;
    r8.xyz = r8.xyz - r0.xyz;
    r10.y = ps;
    r15.yzw = r8.xyz * r13.xxx + r0.xyz;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r6.x = max(r21.x, 0.0);
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r24.w = min(r6.x, 0.3);
    r8.y = ps;
    ps = (-1.0) - -r9.x;
    r0.xyz = r24.xwy * float3(4.0, 3.3333333, 4.0);
    r1.y = ps;
    ps = (-2.0) + r0.x;
    r9.xyz = r23.zxy * float3(0.5, 0.875, 0.875);
    r13.z = ps;
    ps = (-2.0) + r0.z;
    r2.xyz = r0.yyy * r1.yzw;
    r13.w = ps;
    ps = 1.0 + r2.x;
    r21.zw = r9.yz * r17.yz;
    r13.y = ps;
    ps = rsqrt(abs(r1.x));
    r1.yz = -r21.yx + 1.0;
    r6.x = ps;
    ps = abs(r13.y) * abs(r13.y);
    r12.xyz = r6.xxx * r4.xyz;
    r6.y = ps;
    ps = UniformScalar_1.x * r1.y;
    r4.yzw = r21.xzw + float3(-0.75, 0.125, 0.125);
    r1.x = ps;
    ps = r4.y;
    r7.w = float((r2.w >= 0.004));
    r8.zw = r1.xx * r10.zw - 2.0;
    ps = r21.x + ps;
    r17.xyz = r22.ywz - r18.xzy;
    r6.x = ps;
    r6.x = saturate(r17.w * 0.5 + r6.x);
    ps = 2.5 * r1.z;
    r4.x = r6.y * r6.y;
    r17.w = ps;
    ps = r4.x * r4.x;
    r19.xyz = r6.xxx * r19.xyz;
    r2.w = ps;
    ps = r4.z * r4.w;
    r17 = r17.xzyw * r13.xxxy;
    r6.x = ps;
    r4.xyz = r6.xxx * r20.xyz + ModShadowColor.xyz;
    ps = r17.w;
    r9.yzw = r19.xyz * r16.www;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r6.x = -r9.x + r17.x;
    r1.w = saturate(ps);
    r6.x = r12.w * 2.0 + r6.x;
    ps = (-1.0) + r6.x;
    r13.xy = r18.yz + r17.yz;
    r15.x = ps;
    r13 = r1.xxxx * r10.zwzw + r13;
    r10.zw = r2.yz * 4.0 + r13.xy;
    ps = r10.z;
    r15.yzw = r2.www * r15.yzw;
    ps = -r13.z + ps;
    r2 = r15.xywz * r1.wwww;
    r15.x = ps;
    ps = r10.w;
    r16.x = r9.x + r2.x;
    ps = -r13.w + ps;
    r15.zw = r16.xw - 1.0;
    r15.y = ps;
    r13.zw = r15.zw * r1.yy + 1.0;
    r8.zw = r15.xy * r1.ww + r8.zw;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r0.xy = r8.zw + r0.xz;
    r8.z = ps;
    ps = r0.w;
    r13.xy = r0.xy * r1.yy;
    r13 = (r1.xyyy > 0.0) ? r13.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r13 = (r1.yyyx >= 0.0) ? r13.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    ps = r5.x * ps;
    r6.y = dot(r13.zxy, r13.zxy);
    r9.x = ps;
    r0.xyz = r14.xyz * r13.www - r9.yzw;
    r0.xyz = r0.xyz * r1.www + r9.yzw;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r0.xyz * r7.yzx;
    r6.y = ps;
    ps = r0.w;
    r0.xyz = r13.xyz * r6.yyy;
    ps = r5.y * ps;
    r6.y = dot(r0.zxy, r12.zxy);
    r9.y = ps;
    ps = r0.w;
    r1.xyz = r0.xyz * r6.yyy;
    r1.xyz = r1.xyz * 2.0 - r12.xyz;
    ps = r5.z * ps;
    r6.y = saturate(dot(r11.zxy, r1.zxy));
    r9.z = ps;
    ps = log2(r6.y);
    r1.x = dot(r9.zxy, r0.zxy);
    r1.y = ps;
    ps = LightMapScale.z * r6.w;
    r0.xyw = r1.xxy * float3(-0.5, 0.5, 15.0);
    r10.z = ps;
    ps = pow(2.0, r0.w);
    r6.xy = r0.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r0.xyz = r10.xzy * r0.zzz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1.xyz = r10.xzy * r6.zzz;
    r6.x = ps;
    r5.xyz = r7.xzy * r6.yyy;
    r6.xyz = r7.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r2.yzw + r6.xzy;
    r6.xyz = r0.xzy * r7.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r4.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.w + r3.w;
    r6.xyz = r0.xyz * r7.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
