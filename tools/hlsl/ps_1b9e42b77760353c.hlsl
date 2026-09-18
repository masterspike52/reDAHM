// ps_1b9e42b77760353c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 375 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005DC 10041600 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c17); // float4
float4 ConstantLighting : register(c18); // float3
float4 LowerSkyColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
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

    r5.xy = r0.xy * UniformScalar_0.xx;
    r12.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    r5.xy = UniformVector_1.xy * 1.7;
    r10.zw = r5.xy * r0.wz;
    r10.xy = r0.xy * UniformScalar_2.xx;
    r6.xy = r0.wz * UniformScalar_5.xx;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = -r0.z;
    r9 = UniformVector_1.xyxy * float4(1.8, 1.8, 6.0, 6.0);
    ps = 1.0 + ps;
    r8.w = float((r0.w >= 0.5));
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9 = r9 * r0.wzwz;
    r5.x = ps;
    r6.w = r8.w * (-0.5) + r0.w;
    ps = rsqrt(abs(r5.z));
    r6.z = float((r5.y >= 0.5));
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyw = r5.zzz * r1.xzy;
    r5.z = ps;
    ps = 0.1 - -r0.y;
    r8.xy = r5.xz * abs(r7.xy);
    r5.x = ps;
    ps = OpacityOverride.x;
    r5.z = saturate(r5.x * 5.0);
    r5.x = saturate(ps);
    r5.xzw = -r5.yxz + float3(0.5, 1.0, 1.0);
    r5.y = r5.x - r0.z;
    r12.w = dot(r5.yy, r6.zz) - r0.z;
    ps = r6.z + r6.z;
    r20.xw = r12.zw + float2(-1.0, 2.0);
    r14.z = ps;
    ps = r6.w + r6.w;
    r14.y = r20.w - r0.z;
    r14.x = ps;
    r13.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r19.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r6 = tex2D(Texture2D_2, r14.xy).xwyz;
    r18.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r1 = tex2D(Texture2D_3, r10.zw).xywz;
    r15 = tex2D(Texture2D_3, r9.zw);
    r7.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r17.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r22.xyz = r7.zxy * 2.0 - 1.0;
    ps = r2.w;
    r11.x = r1.w + r15.z;
    ps = 0.0001 * ps;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = saturate(ps);
    ps = r17.z + r17.z;
    r7.w = dot(r3.zxy, r3.zxy);
    r14.w = ps;
    ps = 0.875 * r5.x;
    r0.z = dot(r4.zxy, r4.zxy);
    r20.y = ps;
    ps = 0.875 * r5.y;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r20.z = ps;
    ps = r12.x + r12.x;
    r8.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r10.x = ps;
    r11.yz = r1.xy * 2.0 - 3.0;
    ps = rsqrt(abs(r0.z));
    r5.y = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r0.z = ps;
    ps = r12.y + r12.y;
    r9.xyz = r0.zzz * r4.xyz;
    r10.y = ps;
    ps = r15.w;
    r4.xyz = r5.yyy - r18.xyz;
    r4.xyz = r4.xyz * UniformScalar_4.xxx + r18.xyz;
    r11.xyz = r15.zxy * float3(1.0, 4.0, 4.0) + r11.xyz;
    ps = r1.z * ps;
    r10.z = r14.z + r8.w;
    r1.x = ps;
    r0.z = (r10.z == 0.0) ? r6.x : r6.z;
    ps = (-1.0) - -r1.x;
    r15 = r10.yxzz + float4(-1.0, -1.0, -3.0, -2.0);
    r11.w = ps;
    ps = rsqrt(abs(r7.w));
    r1.yz = r5.ww * ModShadowGroupColor.xy;
    r5.y = ps;
    r6.x = (r15.w == 0.0) ? r6.w : r0.z;
    r6.z = (r15.z == 0.0) ? r6.y : r6.x;
    ps = 1.0 - r6.z;
    r10.xyz = r5.yyy * r3.xyz;
    r5.x = ps;
    ps = r6.z;
    r3 = -r1 + 1.0;
    r6.x = ps;
    ps = 0.0;
    r5.w = r3.w * UniformScalar_1.x;
    r6.y = ps;
    ps = max(r6.x, r6.y);
    r15.zw = r5.ww * r15.xy;
    r5.y = ps;
    ps = 2.5 * r5.x;
    r15.xy = r15.wz - 2.0;
    r18.y = ps;
    ps = r22.z;
    r17.w = min(r5.y, 0.3);
    ps = r15.z + ps;
    r5.y = r22.y + r15.w;
    r22.w = ps;
    ps = UniformVector_3.x * r5.y;
    r6.xyw = r20.yzx * r3.yzw;
    r20.x = ps;
    ps = 0.125 + r6.x;
    r14.xyz = r17.xyw * float3(4.0, 4.0, 3.3333333);
    r1.x = ps;
    ps = 0.125 + r6.y;
    r17 = r14.zzzz * r11;
    r1.z = ps;
    ps = r17.w;
    r11.xyz = r4.xyz * UniformVector_4.xyz;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r21.x = r17.x * 0.1;
    r18.z = ps;
    ps = r17.y + r17.y;
    r0.z = float((r5.z >= 0.004));
    r21.y = ps;
    ps = r17.z + r17.z;
    r5.xyz = r14.wxy + float3(-1.0, -2.0, -2.0);
    r21.z = ps;
    ps = 0.5 * r5.x;
    r1.yw = r6.wz + float2(1.0, -0.75);
    r17.x = ps;
    ps = r1.w;
    r20.yz = r22.xw * UniformVector_3.zy;
    ps = r6.z + ps;
    r17.yz = r5.yz + r15.wz;
    r5.y = ps;
    r5.x = (r5.w > 0.0) ? r1.y : 1.0;
    r5.x = (r5.w >= 0.0) ? r5.x : 1.0;
    r5.y = saturate(r3.x * 0.5 + r5.y);
    ps = abs(r18.z) * abs(r18.z);
    r6.xyz = r21.yxz + r20.xyz;
    r18.x = ps;
    ps = r18.x * r18.x;
    r3.xyz = r6.yxz - r17.xyz;
    r1.w = ps;
    ps = r18.y * r18.z;
    r6.xyz = r5.yyy * r19.xyz;
    r1.y = ps;
    ps = (-0.5) + r1.y;
    r5.xyz = r5.xxx * r13.zxy;
    r6.w = saturate(ps);
    ps = UniformVector_4.x * r5.y;
    r12.xyz = r6.xyz * r12.zzz;
    r6.x = ps;
    ps = UniformVector_4.y * r5.z;
    r13.xyz = r11.xyz * r5.yzx;
    r6.y = ps;
    r11.xyz = r13.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = UniformVector_4.z * r5.x;
    r13.xyz = r13.xyz - r12.xyz;
    r6.z = ps;
    r15.xy = r3.yz * r6.ww + r15.xy;
    r5.x = r3.x * r6.w + r17.x;
    r4.xyz = r6.xyz * r4.xyz - r12.xyz;
    r5.yz = r1.wx * r1.wz;
    r6.xyz = r5.zzz * r16.xyz + ModShadowColor.xyz;
    r4.xyz = r4.xyz * r6.www + r12.xyz;
    r5.zw = r15.xy + r14.xy;
    r1.xyz = r13.xyz * r6.www + r12.xyz;
    r11.xyz = r5.yyy * r11.xyz;
    ps = (-1.0) - -r5.x;
    r3.xyz = r11.xzy * r6.www;
    r5.y = ps;
    r8.xyz = r8.xyz * r1.xyz + UniformVector_0.xyz;
    r5.xyz = r5.yzw * r3.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r3.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r3.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r4.yzw = r4.xyz * r7.xyz;
    r5.x = ps;
    ps = r1.x;
    r5.xyz = r5.yzw * r5.xxx;
    ps = r7.x * ps;
    r5.w = dot(r5.zxy, r10.zxy);
    r1.x = ps;
    ps = r1.y;
    r11.xyz = r5.xyz * r5.www;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    ps = r7.y * ps;
    r5.w = saturate(dot(r0.yxw, r10.zxy));
    r1.y = ps;
    ps = log2(r5.w);
    r0.x = dot(r9.zxy, r5.zxy);
    r0.y = ps;
    ps = r1.z;
    r5.xyw = r0.xxy * float3(-0.5, 0.5, 15.0);
    ps = r7.z * ps;
    r0.xy = r5.xy + 0.5;
    r1.z = ps;
    ps = pow(2.0, r5.w);
    r5.xy = abs(r0.xy) * abs(r0.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r0.xyw = r5.zzz * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r4.ywz * r5.xxx;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r5.xyz = r1.xzy * r5.yyy;
    r4.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r8.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r4.xyz * r3.xyz + r5.xzy;
    r5.xyz = r0.xyw * r1.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.z + r2.w;
    r5.xyz = r6.xyz * r0.zzz + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
