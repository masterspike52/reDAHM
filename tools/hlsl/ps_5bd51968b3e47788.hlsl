// ps_5bd51968b3e47788.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 453 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000714 10041900 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
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
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.w = UniformVector_5.y * UniformScalar_5.x;
    ps = UniformScalar_1.x;
    r6.z = UniformVector_3.x * UniformScalar_4.x;
    ps = UniformVector_3.x * ps;
    r10 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    r6.x = ps;
    r6.xz = r6.xz * UniformVector_5.xx;
    ps = UniformVector_1.x * r0.w;
    r6.y = UniformScalar_2.x * UniformVector_5.y;
    r18.x = ps;
    r6 = r6 + r0.xyxy;
    r9 = tex2D(Texture2D_9, r0.xy).wxyz;
    r12 = tex2D(Texture2D_4, r10.zw).zwxy;
    r13.xyz = tex2D(Texture2D_4, r10.xy).xyw;
    r15.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r16 = tex2D(Texture2D_6, r6.xy);
    r17 = tex2D(Texture2D_7, r6.zw);
    ps = r3.w;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = (-4e+02) + ps;
    r14.yzw = UniformVector_4.xyz * 2e+01;
    r6.x = ps;
    ps = -r7.w;
    r11.x = float((UniformScalar_8.x >= 1.0));
    ps = UniformScalar_9.x + ps;
    r6.y = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    ps = rsqrt(abs(r6.y));
    r10.yzw = r17.xyz * r17.www;
    r6.y = ps;
    r11.yzw = r16.xyz * r16.www + r10.yzw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = r6.yyy * r2.xzy;
    r10.y = ps;
    ps = 0.1 - -r2.y;
    r17.xyz = r15.zxy + r15.zxy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14 = r14 * r11;
    r10.z = ps;
    ps = r14.x;
    r15.xy = r10.yz * abs(r8.xy);
    ps = r7.w + ps;
    r23.xw = saturate(r6.yx * float2(5.0, 0.00022222222));
    r6.x = ps;
    ps = 0.0001 * r3.w;
    r10.x = UniformScalar_13.x * 0.05;
    r6.z = saturate(ps);
    ps = r10.x;
    r6.y = dot(r14.wyz, float3(0.11, 0.3, 0.59));
    ps = r23.w * ps;
    r6.x = -r6.x + r7.z;
    r23.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.y = r6.y - r14.y;
    r6.w = ps;
    ps = r6.y;
    r11.xyz = r6.www * r4.xyz;
    ps = r14.y + ps;
    r6.x = max(r6.x, UniformScalar_10.x);
    r23.y = saturate(ps);
    ps = 1.0 / UniformScalar_11.x;
    r6.x = min(r6.x, 1.0);
    r6.w = ps;
    ps = r6.x;
    r4.xw = -r23.xy + 1.0;
    ps = r6.w * ps;
    r6.xy = r4.xx * ModShadowGroupColor.xy;
    r6.w = saturate(ps);
    r10 = -r6.wxyz + 1.0;
    r13.w = r10.x * r7.w;
    r6.xw = r13.wz * r12.xy;
    ps = OpacityOverride.x;
    r6.x = float((r6.x >= 0.05));
    r6.y = saturate(ps);
    r16.zw = -r6.xy + 1.0;
    r6.x = (UniformScalar_9.x > 0.0) ? r16.z : 1.0;
    r6.x = (UniformScalar_9.x >= 0.0) ? r6.x : r16.z;
    r17.w = r6.x * r9.x;
    r8 = r17 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.xyz = r8.xzy * UniformVector_3.zyx;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.wwww)) clip(-1.0);
    ps = -r0.z;
    r11.w = -r6.x + 1.0;
    r17.yz = r11.xy * r23.zz + r0.wz;
    ps = 1.0 + ps;
    r17.x = -r17.z + 1.0;
    r17.w = ps;
    r18.yzw = r17.wxy * UniformVector_1.yyx;
    ps = r0.w + r0.w;
    r8 = r18.wzxy - 0.5;
    r4.y = ps;
    ps = r0.z + r0.z;
    r22 = float4((r18.wzxy >= 0.5));
    r4.z = ps;
    ps = r17.y + r17.y;
    r8 = r8 - r18.wzxy;
    r0.x = ps;
    r8 = r8.zwxy * r22.zwxy + r18.xywz;
    ps = r17.z + r17.z;
    r8 = r8.xywz + r8.xywz;
    r0.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r15.xy).xy;
    r15.xyw = tex2D(Texture2D_8, r0.xy).xyz;
    r20 = tex2D(Texture2D_3, r8.xy);
    r21 = tex2D(Texture2D_3, r8.wz);
    r18 = tex2D(Texture2D_2, r4.yz);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r17.xyz = tex2D(Texture2D_1, r4.yz).xyz;
    r0.w = dot(r5.zxy, r5.zxy);
    r8.xyz = r9.yzw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r19.zw = r12.zw * 2.0 - 1.0;
    r25.xyz = r17.zxy * 2.0 - 1.0;
    r24.xyz = r0.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r17.yz = r13.xy + r13.xy;
    r0.w = ps;
    r13.xyz = r0.www * r5.xyz;
    r5.yzw = r25.xyz - r24.xyz;
    r5.x = r5.y * r18.w - 2.0;
    r5.yzw = r5.yzw * r18.www + r24.xyz;
    r12.zw = -r6.zy * r23.yy + r6.zy;
    r15.z = r11.w * r23.y + r6.x;
    r4.y = dot(r22.zww, float3(1.0, 1.0, 1.0));
    ps = r7.w;
    r4.z = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r6.y = (r4.z == 0.0) ? r21.x : r21.y;
    r6.x = (r4.y == 0.0) ? r20.x : r20.y;
    ps = 15.0 * ps;
    r7 = r4.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = saturate(ps);
    r6.x = (r7.y == 0.0) ? r20.z : r6.x;
    r6.y = (r7.z == 0.0) ? r21.z : r6.y;
    r19.y = (r7.w == 0.0) ? r21.w : r6.y;
    r6.x = (r7.x == 0.0) ? r20.w : r6.x;
    ps = -UniformVector_0.x;
    r6.y = max(r6.x, 0.0);
    ps = 1.0 + ps;
    r7.x = min(r6.y, 0.3);
    r6.y = ps;
    ps = (-1.0) - -r6.w;
    r19.x = r7.x * 3.3333333;
    r17.w = ps;
    ps = 1.0 - r6.x;
    r0.xy = -r19.xy + 1.0;
    r7.w = ps;
    r7.x = dot(r6.zz, r0.yy) + r19.y;
    ps = r6.z;
    r17.x = r7.x + r19.y;
    ps = r0.x * ps;
    r7.xyz = r17.yzx + float3(-1.0, -1.0, 0.25);
    r17.z = ps;
    ps = 0.5 * r7.x;
    r6.w = saturate(r7.z - r6.w);
    r17.x = ps;
    ps = 0.5 * r7.y;
    r15.xyw = r6.www * r15.xyw;
    r17.y = ps;
    ps = 1.0 - r6.z;
    r17.xyz = r19.zxw + r17.xzy;
    r7.z = ps;
    ps = 2.5 * r7.w;
    r6.xzw = -r15.xwy + r18.xzy;
    r7.y = ps;
    r4.xyz = r6.xzw * r18.www + r15.xwy;
    r15.xy = r17.xy * r17.yz + r12.zw;
    r7.x = r17.w * r17.y + 1.0;
    ps = r7.x * r7.w;
    r8.xyz = r8.xyz * r4.www;
    r6.x = ps;
    ps = r7.y * r7.x;
    r15.xyz = -r5.yzw + r15.zxy;
    r6.z = ps;
    ps = -UniformVector_0.y;
    r16.xy = r6.xz * r7.zz;
    ps = 1.0 + ps;
    r6.w = saturate(r16.y - 0.5);
    r6.z = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r8.xzy * r6.www;
    ps = 1.0 + ps;
    r0.xy = float2((r16.xw >= float2(0.9, 0.004)));
    r6.x = ps;
    r7.yzw = r15.xyz * r6.www + r5.xzw;
    r7.x = r0.z * 2.0 + r7.y;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r14.xyz = r14.yzw * r0.xxx;
    r9.x = ps;
    r5.xyz = r14.xyz * r6.www + UniformVector_0.xyz;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r14.xyz = r14.xyz + r9.yzw;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r7.xyz = r7.xzw * r10.www;
    r9.z = ps;
    ps = 1.0 + r7.x;
    r14.xyz = r14.xyz - r4.xzy;
    r7.w = ps;
    r4.xyz = r14.xyz * r6.www + r4.xzy;
    r9.xyz = r9.xyz * r4.xyz + r5.xyz;
    r7.xyz = (r10.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r10.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.w));
    r4.xyz = r4.xyz * r6.yzx;
    r6.x = ps;
    r6.yzw = r7.xyz * r6.xxx;
    r5.xyz = r6.www * r1.xyz;
    r12.z = dot(r13.zxy, r6.wyz);
    ps = -ModShadowColor.x;
    r6.x = dot(r6.wyz, r11.zxy);
    ps = 1.0 + ps;
    r6.xzw = r6.yzw * r6.xxx;
    r6.y = ps;
    ps = -ModShadowColor.y;
    r7 = r12.zxyz * float4(-0.5, 0.875, 0.875, 0.5);
    r6.xzw = r6.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r2.yxz, r6.wxz));
    r6.z = ps;
    r7.yz = r7.yz * r10.yz + 0.125;
    ps = -ModShadowColor.z;
    r7.xw = r7.xw + 0.5;
    ps = 1.0 + ps;
    r7.xw = abs(r7.wx) * abs(r7.wx);
    r6.w = ps;
    ps = log2(r6.x);
    r7.y = r7.y * r7.z;
    r6.x = ps;
    r6.yzw = r7.yyy * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r2.xyz = r4.xzy * r7.xxx;
    r6.x = ps;
    r7.xyz = r2.xyz * UpperSkyColor.xzy + r9.xzy;
    ps = pow(2.0, r6.x);
    r2.xyz = r4.xzy * r7.www;
    r6.x = ps;
    r1.xyz = r6.xxx * r1.xzy;
    r7.xyz = r2.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r8.xyz + r7.xzy;
    r7.xyz = r5.xyz * r4.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r0.y + r3.w;
    r6.xyz = r7.xyz * r0.yyy + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
