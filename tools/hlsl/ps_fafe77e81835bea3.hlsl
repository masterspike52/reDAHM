// ps_fafe77e81835bea3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041700 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c17); // float4
float4 LowerSkyColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c14); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UpperSkyColor : register(c15); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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

    r6.xy = r0.xy * UniformScalar_0.xx;
    r14.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    r6.xy = UniformVector_1.xy * 1.7;
    r10.xy = r6.xy * r0.wz;
    r11.zw = r0.xy * UniformScalar_2.xx;
    r7.xy = r0.wz * UniformScalar_5.xx;
    r9.w = dot(r2.zxy, r2.zxy);
    ps = -r0.z;
    r6 = UniformVector_1.xyxy * float4(1.8, 1.8, 6.0, 6.0);
    ps = 1.0 + ps;
    r9.z = float((r0.w >= 0.5));
    r9.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6 = r6.zwxy * r0.wzwz;
    r9.x = ps;
    r7.w = r9.z * (-0.5) + r0.w;
    ps = rsqrt(abs(r9.w));
    r7.z = float((r9.y >= 0.5));
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyw = r0.xxx * r2.xzy;
    r9.w = ps;
    ps = 0.1 - -r0.y;
    r11.xy = r9.xw * abs(r8.xy);
    r2.x = ps;
    ps = OpacityOverride.x;
    r9.w = saturate(r2.x * 5.0);
    r9.x = saturate(ps);
    r9.xyw = -r9.wyx + float3(1.0, 0.5, 1.0);
    r2.x = r9.y - r0.z;
    r14.w = dot(r2.xx, r7.zz) - r0.z;
    ps = r7.z + r7.z;
    r22.xw = r14.zw + float2(-1.0, 2.0);
    r2.z = ps;
    ps = r7.w + r7.w;
    r2.y = r22.w - r0.z;
    r2.x = ps;
    r19.xyz = tex2D(Texture2D_5, r6.zw).xyz;
    r20.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r7 = tex2D(Texture2D_2, r2.xy);
    r15.xyz = tex2D(Texture2D_6, r11.zw).xyz;
    r10 = tex2D(Texture2D_3, r10.xy);
    r18 = tex2D(Texture2D_3, r6.xy);
    r8.xyz = tex2D(Texture2D_4, r11.zw).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r23.xyz = tex2D(Texture2D_1, r6.zw).xyz;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * r3.w;
    r6.z = dot(r4.zxy, r4.zxy);
    r2.w = saturate(ps);
    ps = r23.z + r23.z;
    r6.w = dot(r5.zxy, r5.zxy);
    r12.w = ps;
    ps = 0.875 * r6.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r22.y = ps;
    r8.yzw = r8.zxy * 2.0 - 1.0;
    ps = 0.875 * r6.y;
    r12.xy = r14.xy + r14.xy;
    r22.z = ps;
    ps = r10.z;
    r13.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r17.yz = r10.xy * 2.0 - 3.0;
    ps = r18.z + ps;
    r6.x = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r17.x = ps;
    ps = r18.w;
    r21.xyz = r6.xxx - r15.xyz;
    r15.xyz = r21.xyz * UniformScalar_4.xxx + r15.xyz;
    r10.xyz = r18.zxy * float3(1.0, 4.0, 4.0) + r17.xyz;
    ps = r10.w * ps;
    r12.z = r2.z + r9.z;
    r2.x = ps;
    r6.y = (r12.z == 0.0) ? r7.x : r7.y;
    ps = (-1.0) - -r2.x;
    r17 = r12.yxzz + float4(-1.0, -1.0, -3.0, -2.0);
    r10.w = ps;
    ps = rsqrt(abs(r6.w));
    r2.yz = r9.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    r6.y = (r17.w == 0.0) ? r7.z : r6.y;
    r7.z = (r17.z == 0.0) ? r7.w : r6.y;
    ps = 1.0 - r7.z;
    r9.xyz = r6.xxx * r5.xyz;
    r6.x = ps;
    ps = r7.z;
    r5 = -r2 + 1.0;
    r7.x = ps;
    ps = 0.0;
    r6.w = r5.w * UniformScalar_1.x;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r17.xy = r6.ww * r17.xy;
    r6.y = ps;
    ps = 2.5 * r6.x;
    r18.xy = r17.yx - 2.0;
    r21.y = ps;
    ps = r8.w;
    r23.w = min(r6.y, 0.3);
    ps = r17.x + ps;
    r6.y = r8.z + r17.y;
    r8.x = ps;
    ps = UniformVector_3.x * r6.y;
    r7.xyw = r22.yzx * r5.yzw;
    r22.x = ps;
    ps = 0.125 + r7.x;
    r12.xyz = r23.xyw * float3(4.0, 4.0, 3.3333333);
    r2.x = ps;
    ps = 0.125 + r7.y;
    r23 = r12.zzzz * r10;
    r2.z = ps;
    ps = rsqrt(abs(r6.z));
    r23.yz = r23.yz + r23.yz;
    r6.x = ps;
    ps = r23.x;
    r10.xyz = r6.xxx * r4.xyz;
    r6.y = ps;
    ps = 0.1 * r6.y;
    r21.z = r23.w + 1.0;
    r23.x = ps;
    ps = r8.y;
    r4.xyz = r15.xyz * UniformVector_4.xyz;
    r6.x = ps;
    ps = UniformVector_3.z * r6.x;
    r2.yw = r7.wz + float2(1.0, -0.75);
    r22.y = ps;
    ps = UniformVector_3.y * r8.x;
    r6.xyz = r12.wxy + float3(-1.0, -2.0, -2.0);
    r22.z = ps;
    ps = 0.5 * r6.x;
    r17.yz = r6.yz + r17.yx;
    r17.x = ps;
    r6.x = (r6.w > 0.0) ? r2.y : 1.0;
    ps = abs(r21.z) * abs(r21.z);
    r6.y = r2.w + r7.z;
    r21.x = ps;
    r7.x = saturate(r5.x * 0.5 + r6.y);
    r6.x = (r6.w >= 0.0) ? r6.x : 1.0;
    ps = r21.x * r21.x;
    r6.yzw = r23.yxz + r22.xyz;
    r2.w = ps;
    ps = r21.y * r21.z;
    r5.xyz = r6.zyw - r17.xyz;
    r2.y = ps;
    ps = (-0.5) + r2.y;
    r6.xyz = r6.xxx * r20.zxy;
    r6.w = saturate(ps);
    ps = UniformVector_4.x * r6.y;
    r7.yzw = r7.xxx * r19.xyz;
    r7.x = ps;
    ps = UniformVector_4.y * r6.z;
    r8.xyz = r7.yzw * r14.zzz;
    r7.y = ps;
    ps = UniformVector_4.z * r6.x;
    r14.xyz = r4.xyz * r6.yzx;
    r7.z = ps;
    r4.xyz = r14.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r6.yz = r5.yz * r6.ww + r18.xy;
    r6.x = r5.x * r6.w + r17.x;
    r15.xyz = r7.xyz * r15.xyz - r8.xyz;
    r2.xw = r2.xw * r2.zw;
    r7.yzw = r2.xxx * r16.xyz + ModShadowColor.xyz;
    r5.xyz = r15.xyz * r6.www + r8.xyz;
    ps = (-1.0) - -r6.x;
    r7.x = float((r9.w >= 0.004));
    r6.x = ps;
    ps = r6.y;
    r14.xyz = r14.xyz - r8.xyz;
    r2.xyz = r14.xyz * r6.www + r8.xyz;
    ps = r12.x + ps;
    r4.xyz = r2.www * r4.xyz;
    r6.y = ps;
    ps = r6.z;
    r4.xyz = r4.xzy * r6.www;
    r8.xyz = r13.xyz * r2.xyz + UniformVector_0.xyz;
    ps = r12.y + ps;
    r2.xyz = r2.xyz * r11.xyz;
    r6.z = ps;
    r6.xyz = r6.xyz * r5.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r5.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r5.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r5.xyz = r5.xyz * r11.xyz;
    r6.x = ps;
    r6.xyw = r6.yzw * r6.xxx;
    r6.z = dot(r6.wxy, r10.zxy);
    r11.xyz = r6.xyw * r6.zzz;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.z = saturate(dot(r0.yxw, r10.zxy));
    ps = log2(r6.z);
    r0.x = dot(r9.zxy, r6.wxy);
    r0.y = ps;
    r6.xyz = r0.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r6.xy = r6.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r0.xyz = r6.www * r1.xyz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1.xyz = r6.zzz * r1.xzy;
    r6.x = ps;
    r5.xyz = r5.xzy * r6.yyy;
    r6.xyz = r2.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r4.xyz + r6.xzy;
    r6.xyz = r0.xyz * r2.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
