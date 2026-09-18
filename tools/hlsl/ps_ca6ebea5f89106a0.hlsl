// ps_ca6ebea5f89106a0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 450 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000708 10041600 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 ConstantLighting : register(c20); // float3
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c17); // float3
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
sampler2D ModShadowAccumTexture : register(s10);

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

    ps = -r6.w;
    r5.x = UniformScalar_13.x * 0.05;
    ps = UniformScalar_9.x + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r8.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = r2.w;
    r9.xyz = r5.yyy * r1.xyz;
    ps = (-4e+02) + ps;
    r5.z = r9.z + 0.1;
    r5.y = ps;
    ps = r0.w;
    r18.yw = saturate(r5.zy * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r5.y = r5.x * r18.w;
    r5.x = ps;
    r11.yz = r8.xy * r5.yy + r0.wz;
    ps = 1.0 - r0.z;
    r20.xyz = UniformVector_4.xzy * 2e+01;
    r11.w = ps;
    ps = r0.z;
    r11.x = -r11.z + 1.0;
    ps = 18.0 * ps;
    r10.yzw = r11.wxy * UniformVector_1.yyx;
    r5.y = ps;
    ps = UniformVector_1.x * r0.w;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r10.x = ps;
    ps = r0.w;
    r1 = r10.wzxy - 0.5;
    ps = 3.0 * ps;
    r16 = float4((r10.wzxy >= 0.5));
    r5.z = ps;
    ps = r0.z;
    r1 = r1 - r10.wzxy;
    r1 = r1.zwxy * r16.zwxy + r10.xywz;
    ps = 3.0 * ps;
    r1 = r1.xywz + r1.xywz;
    r5.w = ps;
    r10 = tex2D(Texture2D_9, r0.xy).wxyz;
    r15 = tex2D(Texture2D_3, r1.xy);
    r17 = tex2D(Texture2D_3, r1.wz);
    r12.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r13 = tex2D(Texture2D_4, r5.zw);
    r14.xyz = tex2D(Texture2D_4, r5.xy).xyw;
    ps = r6.w;
    r5.y = float((UniformScalar_8.x >= 1.0));
    ps = 15.0 * ps;
    r3.yz = r14.xy + r14.xy;
    r5.x = saturate(ps);
    r1.zw = r13.xy * 2.0 - 1.0;
    r5.y = r8.w * r5.y + r6.w;
    ps = -r5.y;
    r12.xyz = r12.zxy + r12.zxy;
    ps = r6.z + ps;
    r1.x = dot(r16.zww, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = r5.y;
    r1.y = dot(r16.xyy, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r5.z = (r1.y == 0.0) ? r17.x : r17.y;
    r5.y = (r1.x == 0.0) ? r15.x : r15.y;
    ps = UniformScalar_10.x;
    r16 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r3.w = ps;
    r5.y = (r16.y == 0.0) ? r15.z : r5.y;
    r5.z = (r16.z == 0.0) ? r17.z : r5.z;
    r1.y = (r16.w == 0.0) ? r17.w : r5.z;
    r5.y = (r16.x == 0.0) ? r15.w : r5.y;
    ps = max(r3.x, r3.w);
    r5.w = max(r5.y, 0.0);
    r5.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r5.zw = min(r5.zw, float2(1.0, 0.3));
    r6.x = ps;
    ps = 1.0 - r5.x;
    r1.x = saturate(r5.z * r6.x);
    r6.x = ps;
    ps = 3.3333333 * r5.w;
    r3.x = -r1.x + 1.0;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.w = r3.x * r6.w;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yw = -r1.yx + 1.0;
    r3.w = ps;
    r5.z = dot(r5.xx, r6.yy) + r1.y;
    ps = r5.z;
    r7.zw = r3.xw * abs(r7.xy);
    ps = r1.y + ps;
    r5.zw = r14.zw * r13.wz;
    r3.x = ps;
    ps = r5.x;
    r3.xyz = r3.yzx + float3(-1.0, -1.0, 0.25);
    ps = r6.w * ps;
    r6.yz = r3.xy * 0.5;
    r6.w = ps;
    ps = (-1.0) - -r5.z;
    r1.xyz = r1.zxw + r6.ywz;
    r1.w = ps;
    ps = 1.0 - r5.y;
    r1.xzw = r1.wxy * r1.yyz;
    r6.y = ps;
    ps = 2.5 * r6.y;
    r6.z = r1.x + 1.0;
    r6.w = ps;
    r5.xy = r6.zw * r6.yz;
    r5.xy = r5.yx * r6.xx;
    r18.xz = float2((r5.wy >= float2(0.05, 0.9)));
    ps = r0.w + r0.w;
    r6.xy = -r18.yx + 1.0;
    r6.z = ps;
    r6.w = (UniformScalar_9.x > 0.0) ? r6.y : 1.0;
    r6.w = (UniformScalar_9.x >= 0.0) ? r6.w : r6.y;
    ps = r0.z + r0.z;
    r12.w = r6.w * r10.x;
    r6.w = ps;
    ps = r11.y + r11.y;
    r16 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    r7.x = ps;
    ps = r11.z + r11.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.wwww)) clip(-1.0);
    r7.y = ps;
    r1.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r14.xyz = tex2D(Texture2D_8, r7.xy).xyz;
    r17 = tex2D(Texture2D_2, r6.zw);
    r15 = tex2D(Texture2D_7, r0.xy);
    r21 = tex2D(Texture2D_6, r0.xy);
    r11.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r7.xzw = tex2D(Texture2D_1, r6.zw).xyz;
    r19.w = saturate(r2.w * 0.0001);
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r7.y = dot(r4.zxy, r4.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r3.xyw = r10.yzw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r19.xyz = r7.wxz * 2.0 - 1.0;
    r12.yzw = r11.wxy * 2.0 - 1.0;
    ps = r21.x * r21.w;
    r13.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r7.x = ps;
    ps = r21.z * r21.w;
    r15.xyz = r15.xzy * r15.www;
    r7.z = ps;
    ps = r21.y * r21.w;
    r15.xyz = r22.xyz * r15.xyz;
    r7.w = ps;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r7.xzw = r20.xyz * r7.xzw;
    r0.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r19.xyz = r19.xyz - r12.yzw;
    r9.w = ps;
    r12.x = r19.x * r17.w - 2.0;
    r12.yzw = r19.xyz * r17.www + r12.yzw;
    r7.xzw = (-abs(r9.www) >= 0.0) ? r15.xyz : r7.xzw;
    r15.xyz = (-abs(r0.www) >= 0.0) ? r15.xyz : r7.xzw;
    ps = OpacityOverride.x;
    r0.w = dot(r15.yxz, float3(0.11, 0.3, 0.59));
    r7.x = saturate(ps);
    ps = rsqrt(abs(r7.y));
    r0.w = r0.w - r15.x;
    r7.y = ps;
    ps = r0.w;
    r4.xyz = r7.yyy * r4.xyz;
    ps = r15.x + ps;
    r10.x = saturate(r3.z - r5.z);
    r7.w = saturate(ps);
    ps = (-0.5) + r5.x;
    r11.xyz = r18.zzz * r15.xzy;
    r5.z = saturate(ps);
    r5.xyw = r11.xyz * r5.zzz + UniformVector_0.xyz;
    ps = r11.x;
    r14.w = saturate(dot(r15.zyx, float3(0.59, 0.11, 0.3)));
    ps = r10.y + ps;
    r7.yz = r6.xx * ModShadowGroupColor.xy;
    r15.x = ps;
    ps = r11.y;
    r7 = -r7.wxyz + 1.0;
    ps = r10.z + ps;
    r6.x = float((r7.y >= 0.004));
    r15.y = ps;
    ps = r11.z;
    r19.xyz = r16.xzy * UniformVector_3.zyx;
    r16.xy = -r19.zy * r14.ww + r19.zy;
    ps = r10.w + ps;
    r10.yz = -r19.xw + 1.0;
    r15.z = ps;
    ps = r3.x;
    r16.xy = r16.xy + r1.zw;
    ps = r7.x * ps;
    r14 = r10.xxxy * r14;
    r1.z = ps;
    ps = r19.x;
    r18.xyz = -r14.xzy + r17.xzy;
    r14.xyz = r18.xyz * r17.www + r14.xzy;
    ps = r14.w + ps;
    r15.xyz = r15.xyz - r14.xzy;
    r16.z = ps;
    ps = r3.y;
    r16.xyz = -r12.yzw + r16.zxy;
    r12.yzw = r16.xyz * r5.zzz + r12.xzw;
    r11.xyz = r15.xyz * r5.zzz + r14.xzy;
    r3.xyz = r13.xyz * r11.xyz + r5.xyw;
    r12.x = r11.w * 2.0 + r12.y;
    ps = r7.x * ps;
    r12.xyw = r12.zwx * r10.zzz;
    r0.w = ps;
    ps = r3.w;
    r12.z = r12.w + 1.0;
    r5.xyw = (r10.zzz > 0.0) ? r12.xyz : float3(0.0, 0.0, 1.0);
    r10.xyz = (r10.zzz >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = r7.x * ps;
    r5.x = dot(r10.zxy, r10.zxy);
    r3.w = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r11.xyz * r0.xyz;
    r5.x = ps;
    ps = r1.z;
    r5.xyw = r10.xyz * r5.xxx;
    ps = r5.z * ps;
    r1.z = dot(r4.zxy, r5.wxy);
    r4.x = ps;
    ps = r3.w;
    r1.w = dot(r5.wxy, r8.zxy);
    ps = r5.z * ps;
    r10.xyz = r5.xyw * r1.www;
    r4.y = ps;
    ps = r0.w;
    r1 = r1.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = r5.z * ps;
    r0.w = saturate(dot(r9.zxy, r8.zxy));
    r4.z = ps;
    r7.xy = r1.xy * r7.zw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r0.w);
    r5.z = r7.x * r7.y;
    r5.y = ps;
    r6.yzw = r5.zzz * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r5.y;
    r7.xyz = r0.xzy * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.xzy * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.xyz + r3.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
