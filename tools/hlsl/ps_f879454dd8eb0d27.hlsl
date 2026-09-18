// ps_f879454dd8eb0d27.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041700 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
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
float4 LowerSkyColor : register(c23); // float3
float4 ModShadowAccumResolution : register(c27); // float2
float4 ModShadowColor : register(c25); // float3
float4 ModShadowGroupColor : register(c26); // float3
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
sampler2D ModShadowAccumTexture : register(s12);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = UniformVector_1.xy * 6.0;
    r7 = UniformVector_1.xyxy * float4(1.8, 1.8, 1.7, 1.7);
    r6.xy = r6.xy * r0.wz;
    r15 = r7 * r0.wzwz;
    r16.yzw = tex2D(Texture2D_3, r6.xy).xyw;
    r18.xzw = tex2D(Texture2D_3, r15.zw).wxy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = r16.w * r18.x;
    r6.x = ps;
    r6.yw = r0.xy * UniformScalar_3.xx;
    r10.xy = r0.xy * UniformScalar_2.xx;
    r9.xy = r0.wz * UniformScalar_7.xx;
    r10.zw = r0.wz * UniformScalar_9.xx;
    ps = -r0.z;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r9.w = float((r0.w >= 0.5));
    r7.z = ps;
    r11.y = r9.w * (-0.5) + r0.w;
    ps = rsqrt(abs(r6.z));
    r11.x = float((r7.z >= 0.5));
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xyz = r6.zzz * r2.xzy;
    r6.z = ps;
    ps = 0.1 - -r2.y;
    r6.xz = r6.xz * abs(r8.xy);
    r7.x = ps;
    ps = OpacityOverride.x;
    r7.w = saturate(r7.x * 5.0);
    r7.x = saturate(ps);
    r19 = -r7.wzxy + float4(1.0, 0.5, 1.0, 1.0);
    r7.x = r19.y - r0.z;
    r7.x = dot(r7.xx, r11.xx) - r0.z;
    ps = r11.y + r11.y;
    r7.x = r7.x + 2.0;
    r20.x = ps;
    ps = r11.x + r11.x;
    r20.y = r7.x - r0.z;
    r20.z = ps;
    r12.yzw = tex2D(Texture2D_7, r15.xy).xyz;
    r14.xyz = tex2D(Texture2D_11, r10.zw).xyz;
    r13.yzw = tex2D(Texture2D_9, r9.xy).xyz;
    r22 = tex2D(Texture2D_2, r20.xy);
    r8.xyw = tex2D(Texture2D_4, r10.xy).xyz;
    r9.xyz = tex2D(Texture2D_10, r6.yw).xyz;
    r11.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_5, r6.yw).zxy;
    r6.y = tex2D(Texture2D_6, r0.wz).x;
    r21.xyz = tex2D(Texture2D_1, r15.xy).xyz;
    ps = r21.z + r21.z;
    r7.xz = r0.wz * UniformScalar_0.xx;
    r10.w = ps;
    r17.yzw = tex2D(Texture2D_0, r7.xz).xyw;
    r7.xz = tex2D(ModShadowAccumTexture, r6.xz).xy;
    ps = UniformScalar_4.x * r6.y;
    r0.y = dot(r5.zxy, r5.zxy);
    r6.w = saturate(ps);
    ps = r10.x + r10.x;
    r0.x = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    ps = r10.y + r10.y;
    r0.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r10.y = ps;
    ps = r10.z + r10.z;
    r6.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r10.z = ps;
    ps = rsqrt(abs(r0.x));
    r6.xyz = r6.xxx - r9.xyz;
    r0.x = ps;
    ps = log2(r6.w);
    r15.xyz = r0.zzz - r11.xyz;
    r6.w = ps;
    r15.xyz = r15.xyz * UniformScalar_6.xxx + r11.xyz;
    r6.xyz = r6.zxy * UniformScalar_8.xxx + r9.zxy;
    ps = rsqrt(abs(r0.y));
    r23 = r10 - 1.0;
    r2.w = ps;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r17.y + r17.y;
    r0.yzw = r8.wyx + r8.wyx;
    r18.x = ps;
    ps = r17.z + r17.z;
    r8.xyz = r2.www * r5.xyz;
    r18.y = ps;
    ps = r18.z + r18.z;
    r9.xyz = r0.xxx * r4.xyz;
    r18.z = ps;
    ps = r18.w + r18.w;
    r13.x = r20.z + r9.w;
    r18.w = ps;
    ps = UniformVector_3.x * r6.y;
    r20 = r18 + float4(-1.0, -1.0, -3.0, -3.0);
    r4.x = ps;
    ps = UniformVector_3.y * r6.z;
    r5.xyz = r15.xyz * UniformVector_2.xyz;
    r4.y = ps;
    r0.x = (r13.x == 0.0) ? r22.x : r22.y;
    ps = UniformVector_3.z * r6.x;
    r13.yzw = r5.xyz * r13.yzw;
    r4.z = ps;
    ps = UniformScalar_5.x * r6.w;
    r14.xyz = r4.xyz * r14.xyz;
    r6.y = ps;
    r5.xyz = r14.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r4.xyz = r13.yzw * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = pow(2.0, r6.y);
    r6.xzw = r14.xyz - r13.yzw;
    r6.y = ps;
    r14.xyz = r6.xzw * r6.yyy + r13.yzw;
    ps = r3.w;
    r6.zw = r19.xx * ModShadowGroupColor.xy;
    ps = 0.0001 * ps;
    r5.xyz = r5.xyz - r4.xyz;
    r6.x = saturate(ps);
    r5.xyz = r5.xyz * r6.yyy + r4.xyz;
    r4.yzw = -r6.xzw + 1.0;
    ps = UniformScalar_1.x * r4.y;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    r13.yz = r4.xx * r20.xy;
    r18 = r13.xxyz + float4(-3.0, -2.0, -2.0, -2.0);
    r6.x = (r18.y == 0.0) ? r22.z : r0.x;
    r0.x = (r18.x == 0.0) ? r22.w : r6.x;
    ps = r23.w;
    r6.z = max(r0.x, 0.0);
    r6.x = ps;
    ps = 0.5 * r6.x;
    r21.w = min(r6.z, 0.3);
    r2.w = ps;
    ps = 1.0 - r0.x;
    r22 = r0.xywz + float4(-0.75, -1.0, -1.0, -1.0);
    r16.x = ps;
    ps = r22.x;
    r6.xzw = r23.xzy - r22.ywz;
    ps = r0.x + ps;
    r16.xyz = r16.xyz * float3(2.5, 4.0, 4.0);
    r0.x = ps;
    r16.w = saturate(r19.w * 0.5 + r0.x);
    r20.xy = r6.wz * r6.yy + r22.zw;
    r6.x = r6.x * r6.y - r2.w;
    ps = (-1.0) - -r7.y;
    r0.xyz = r21.xyw * float3(4.0, 4.0, 3.3333333);
    r6.y = ps;
    ps = (-2.0) + r0.x;
    r6.zw = r20.zw + r16.yz;
    r20.z = ps;
    r6.x = r8.w * 2.0 + r6.x;
    ps = (-2.0) + r0.y;
    r6.yzw = r0.zzz * r6.yzw;
    r20.w = ps;
    ps = 1.0 + r6.y;
    r13 = r20.xzwy + r13.yyzz;
    r12.x = ps;
    r6.yz = r6.zw * 4.0 + r13.xw;
    ps = abs(r12.x) * abs(r12.x);
    r6.w = float((r19.z >= 0.004));
    r7.y = ps;
    ps = r7.y * r7.y;
    r12 = r16.xwww * r12;
    r13.x = ps;
    ps = r12.x;
    r13.yz = r6.yz - r13.yz;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r12.xyz = r12.yzw * r17.www;
    r13.w = saturate(ps);
    r16.xyz = r13.xzy * r13.xww;
    ps = 0.875 * r7.x;
    r6.yz = r18.zw + r16.zy;
    r16.z = ps;
    ps = 0.875 * r7.z;
    r5.yzw = r16.xxx * r5.xyz;
    r16.w = ps;
    ps = (-1.0) + r6.x;
    r6.yz = r6.yz + r0.xy;
    r5.x = ps;
    ps = r6.y;
    r5 = r5.xywz * r13.wwww;
    ps = r4.y * ps;
    r17.x = r2.w + r5.x;
    r7.x = ps;
    ps = r6.z;
    r16.xy = r17.xw - 1.0;
    r7.zw = r16.xy * r4.yy + 1.0;
    r6.xy = r16.zw * r4.zw + 0.125;
    ps = r4.y * ps;
    r6.x = r6.x * r6.y;
    r7.y = ps;
    r6.xyz = r6.xxx * r15.xyz + ModShadowColor.xyz;
    r7 = (r4.xyyy > 0.0) ? r7.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r4 = (r4.yyyx >= 0.0) ? r7.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    r7.w = dot(r4.zxy, r4.zxy);
    r7.xyz = r14.xyz * r4.www - r12.xyz;
    r0.xyz = r7.xyz * r13.www + r12.xyz;
    r7.xyz = r11.xyz * r0.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r0.xyz * r10.xyz;
    r7.w = ps;
    r4.xyz = r4.xyz * r7.www;
    r7.w = dot(r4.zxy, r9.zxy);
    r10.xyz = r4.xyz * r7.www;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    r7.w = saturate(dot(r2.yxz, r9.zxy));
    ps = log2(r7.w);
    r2.x = dot(r8.zxy, r4.zxy);
    r2.y = ps;
    r2.xyz = r2.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r2.z);
    r4.xy = r2.xy + 0.5;
    r7.w = ps;
    ps = abs(r4.x) * abs(r4.x);
    r2.xyz = r4.zzz * r1.xyz;
    r0.w = ps;
    ps = abs(r4.y) * abs(r4.y);
    r1.xyz = r7.www * r1.xzy;
    r7.w = ps;
    r4.xyz = r0.xzy * r0.www;
    r8.xyz = r0.xzy * r7.www;
    r7.xyz = r8.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r5.yzw + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
