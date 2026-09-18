// ps_7d78a7c33e5c35d3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 453 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000714 10041900 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 ConstantLighting : register(c23); // float3
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 OpacityOverride : register(c19); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c20); // float3
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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.y = UniformScalar_2.x * UniformVector_5.y;
    r5.w = UniformVector_5.y * UniformScalar_5.x;
    ps = UniformScalar_1.x;
    r5.z = UniformVector_3.x * UniformScalar_4.x;
    ps = UniformVector_3.x * ps;
    r8 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    r5.x = ps;
    r5.xz = r5.xz * UniformVector_5.xx;
    r13 = tex2D(Texture2D_9, r0.xy).wxyz;
    r9 = tex2D(Texture2D_4, r8.zw).zwxy;
    r12.xyz = tex2D(Texture2D_4, r8.xy).xyw;
    r14.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    ps = UniformVector_1.x * r0.w;
    r5 = r5 + r0.xyxy;
    r8.x = ps;
    r15 = tex2D(Texture2D_6, r5.xy);
    r16 = tex2D(Texture2D_7, r5.zw);
    r5.z = saturate(r2.w * 0.0001);
    r8.y = UniformScalar_13.x * 0.05;
    ps = r2.w;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r11.yzw = UniformVector_4.xyz * 2e+01;
    r5.x = ps;
    ps = -r6.w;
    r10.x = float((UniformScalar_8.x >= 1.0));
    ps = UniformScalar_9.x + ps;
    r5.y = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r5.y));
    r10.yzw = r16.xyz * r16.www;
    r5.y = ps;
    r10.yzw = r15.xyz * r15.www + r10.yzw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xyz = r5.yyy * r1.xzy;
    r8.z = ps;
    ps = 0.1 - -r1.y;
    r14.xyz = r14.zxy + r14.zxy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15 = r11 * r10;
    r8.w = ps;
    ps = r15.x;
    r7.zw = r8.zw * abs(r7.xy);
    ps = r6.w + ps;
    r23.xw = saturate(r5.yx * float2(5.0, 0.00022222222));
    r5.x = ps;
    ps = r8.y;
    r5.y = dot(r15.wyz, float3(0.11, 0.3, 0.59));
    ps = r23.w * ps;
    r5.x = -r5.x + r6.z;
    r23.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r5.y - r15.y;
    r5.w = ps;
    ps = r5.y;
    r11.xyz = r5.www * r3.xyz;
    ps = r15.y + ps;
    r5.x = max(r5.x, UniformScalar_10.x);
    r23.y = saturate(ps);
    ps = 1.0 / UniformScalar_11.x;
    r5.x = min(r5.x, 1.0);
    r5.w = ps;
    ps = r5.x;
    r3.xz = -r23.yx + 1.0;
    ps = r5.w * ps;
    r5.xy = r3.zz * ModShadowGroupColor.xy;
    r5.w = saturate(ps);
    r10 = -r5.wxyz + 1.0;
    r12.w = r10.x * r6.w;
    r5.xw = r12.wz * r9.xy;
    ps = OpacityOverride.x;
    r5.x = float((r5.x >= 0.05));
    r5.y = saturate(ps);
    r3.zw = -r5.xy + 1.0;
    r5.x = (UniformScalar_9.x > 0.0) ? r3.z : 1.0;
    r5.x = (UniformScalar_9.x >= 0.0) ? r5.x : r3.z;
    r14.w = r5.x * r13.x;
    r14 = r14 + float4(-1.0, -1.0, -1.0, -0.5);
    r22.xyz = r14.xzy * UniformVector_3.zyx;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.wwww)) clip(-1.0);
    ps = -r0.z;
    r11.w = -r22.x + 1.0;
    r14.yz = r11.xy * r23.zz + r0.wz;
    ps = 1.0 + ps;
    r14.x = -r14.z + 1.0;
    r14.w = ps;
    r8.yzw = r14.wxy * UniformVector_1.yyx;
    ps = r0.w + r0.w;
    r16 = r8.wzxy - 0.5;
    r5.x = ps;
    ps = r0.z + r0.z;
    r18 = float4((r8.xwzy >= 0.5));
    r5.y = ps;
    ps = r14.y + r14.y;
    r0 = r16 - r8.wzxy;
    r7.x = ps;
    r0 = r0.zwxy * r18.xwyz + r8.xywz;
    ps = r14.z + r14.z;
    r8 = r0.xywz + r0.xywz;
    r7.y = ps;
    r9.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r14.xyz = tex2D(Texture2D_8, r7.xy).xyz;
    r0 = tex2D(Texture2D_3, r8.xy);
    r21 = tex2D(Texture2D_3, r8.wz);
    r19 = tex2D(Texture2D_2, r5.xy);
    r7.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r16.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r4.zxy, r4.zxy);
    r5.xyz = -UniformVector_0.zxy + 1.0;
    r17.xyz = r13.yzw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r20.zw = r9.zw * 2.0 - 1.0;
    r25.xyz = r16.zxy * 2.0 - 1.0;
    r24.xyz = r7.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r16.yw = r12.xy + r12.xy;
    r1.w = ps;
    r12.xyz = r1.www * r4.xyz;
    r4.yzw = r25.xyz - r24.xyz;
    r4.x = r4.y * r19.w - 2.0;
    r4.yzw = r4.yzw * r19.www + r24.xyz;
    r9.zw = -r22.zy * r23.yy + r22.zy;
    r16.z = r11.w * r23.y + r22.x;
    r18.x = dot(r18.xww, float3(1.0, 1.0, 1.0));
    r18.y = dot(r18.yzz, float3(1.0, 1.0, 1.0));
    r1.w = (r18.y == 0.0) ? r21.x : r21.y;
    r3.y = (r18.x == 0.0) ? r0.x : r0.y;
    ps = r6.w;
    r18 = r18.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = (r18.y == 0.0) ? r0.z : r3.y;
    r6.y = (r18.z == 0.0) ? r21.z : r1.w;
    r20.y = (r18.w == 0.0) ? r21.w : r6.y;
    r6.x = (r18.x == 0.0) ? r0.w : r6.x;
    ps = 15.0 * ps;
    r6.y = max(r6.x, 0.0);
    r6.z = saturate(ps);
    r6.y = min(r6.y, 0.3);
    ps = (-1.0) - -r5.w;
    r20.x = r6.y * 3.3333333;
    r18.w = ps;
    ps = 1.0 - r6.x;
    r0.yz = -r20.xy + 1.0;
    r0.x = ps;
    r6.y = dot(r6.zz, r0.zz) + r20.y;
    ps = r6.z;
    r16.x = r6.y + r20.y;
    ps = r0.y * ps;
    r6.xyw = r16.xyw + float3(0.25, -1.0, -1.0);
    r0.w = ps;
    ps = 0.5 * r6.y;
    r5.w = saturate(r6.x - r5.w);
    r0.y = ps;
    ps = 0.5 * r6.w;
    r14.xyz = r5.www * r14.xyz;
    r0.z = ps;
    ps = 1.0 - r6.z;
    r18.xyz = r20.zxw + r0.ywz;
    r0.w = ps;
    ps = 2.5 * r0.x;
    r6.xyz = -r14.xzy + r19.xzy;
    r0.z = ps;
    r14.xyz = r6.xyz * r19.www + r14.xzy;
    r16.xy = r18.xy * r18.yz + r9.zw;
    r0.y = r18.w * r18.y + 1.0;
    ps = r0.y * r0.x;
    r7.xyz = r17.xzy * r3.xxx;
    r3.x = ps;
    ps = r0.z * r0.y;
    r6.xyz = -r4.yzw + r16.zxy;
    r3.y = ps;
    r3.xy = r3.yx * r0.ww;
    ps = (-0.5) + r3.x;
    r0.xy = float2((r3.yw >= float2(0.9, 0.004)));
    r0.z = saturate(ps);
    r6.yzw = r6.xyz * r0.zzz + r4.xzw;
    r6.x = r7.w * 2.0 + r6.y;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r3.xyz = r15.yzw * r0.xxx;
    r13.x = ps;
    r4.xyz = r3.xyz * r0.zzz + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r3.xyz = r3.xyz + r13.yzw;
    r13.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r6.xyz = r6.xzw * r10.www;
    r13.z = ps;
    ps = 1.0 + r6.x;
    r3.xyz = r3.xyz - r14.xzy;
    r6.w = ps;
    r3.xyz = r3.xyz * r0.zzz + r14.xzy;
    r4.xyz = r13.xyz * r3.xyz + r4.xyz;
    r6.xyz = (r10.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r10.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.w));
    r3.xyz = r3.xyz * r5.yzx;
    r5.x = ps;
    ps = r7.x;
    r5.xyw = r6.xyz * r5.xxx;
    ps = r0.z * ps;
    r9.z = dot(r12.zxy, r5.wxy);
    r7.x = ps;
    ps = r7.y;
    r5.z = dot(r5.wxy, r11.zxy);
    ps = r0.z * ps;
    r6.xyz = r5.xyw * r5.zzz;
    r7.y = ps;
    ps = r7.z;
    r9 = r9.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = r0.z * ps;
    r6.x = saturate(dot(r1.yxz, r6.zxy));
    r7.z = ps;
    r6.yz = r9.xy * r10.yz + 0.125;
    ps = ConstantLighting.x * r5.w;
    r0.zw = r9.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r0.xz = abs(r0.zw) * abs(r0.zw);
    r1.y = ps;
    ps = log2(r6.x);
    r5.z = r6.y * r6.z;
    r5.y = ps;
    r6.xyz = r5.zzz * r8.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.y;
    r8.xyz = r3.xzy * r0.xxx;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r9.xyz = r3.xzy * r0.zzz;
    r5.z = ps;
    r4.xyz = r9.xyz * UpperSkyColor.xzy + r4.xzy;
    r4.xyz = r8.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = ConstantLighting.z * r5.w;
    r8.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r8.xyz * r7.xyz + r4.xzy;
    r5.xyz = r1.xyz * r3.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.y + r2.w;
    r5.xyz = r6.xyz * r0.yyy + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
