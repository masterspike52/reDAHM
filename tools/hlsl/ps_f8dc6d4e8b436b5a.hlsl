// ps_f8dc6d4e8b436b5a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 444 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006F0 10041800 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 ConstantLighting : register(c21); // float3
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_14 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c18); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_16.x;
    r5.x = r2.w - 4e+02;
    ps = 0.05 * ps;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = saturate(r5.x * 0.00022222222);
    r5.y = ps;
    ps = r5.z;
    r8 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    ps = r5.x * ps;
    r9.xyz = r5.yyy * r3.xyz;
    r5.x = ps;
    ps = UniformScalar_12.x - r6.w;
    r23.xyz = UniformVector_4.xzy * 2e+01;
    r9.w = ps;
    r15.yz = r9.xy * r5.xx + r0.wz;
    ps = 1.0 - r0.z;
    r24.xyz = UniformVector_5.xzy * 2e+01;
    r15.w = ps;
    ps = r0.w;
    r15.x = -r15.z + 1.0;
    ps = UniformVector_1.x * ps;
    r3.yzw = r15.wxy * UniformVector_1.yyx;
    r3.x = ps;
    r10 = r3.wzxy - 0.5;
    r5 = float4((r3.wxyz >= 0.5));
    r10 = r10 - r3.wzxy;
    r3 = r10.zwxy * r5.yzxw + r3.xywz;
    r12 = r3.xywz + r3.xywz;
    r14 = tex2D(Texture2D_9, r0.xy);
    r16 = tex2D(Texture2D_4, r8.zw);
    r13.xyz = tex2D(Texture2D_4, r8.xy).xyw;
    r10 = tex2D(Texture2D_3, r12.xy);
    r8.xyz = tex2D(Texture2D_5, r0.xy).zxy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r18.y = saturate(r6.w * 15.0);
    r3.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.x = float((UniformScalar_11.x >= 1.0));
    r3.z = ps;
    r3.x = r9.w * r3.x + r6.w;
    ps = -r3.x;
    r7.xy = r3.yz * abs(r7.xy);
    ps = r6.z + ps;
    r11.w = dot(r5.xww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r11.z = dot(r5.yzz, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r11.z == 0.0) ? r10.x : r10.y;
    ps = UniformScalar_13.x;
    r3 = r11.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r5.x = (r3.w == 0.0) ? r10.z : r5.x;
    r7.w = (r3.x == 0.0) ? r10.w : r5.x;
    ps = max(r5.y, r5.z);
    r5.x = max(r7.w, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.xz = min(r5.xy, float2(0.3, 1.0));
    r5.y = ps;
    ps = r0.w + r0.w;
    r7.z = saturate(r5.z * r5.y);
    r5.y = ps;
    ps = r0.z + r0.z;
    r3.xw = -r7.wz + 1.0;
    r5.w = ps;
    ps = r2.w;
    r13.w = r3.w * r6.w;
    ps = 0.0001 * ps;
    r6.xy = r13.zw * r16.wz;
    r18.x = saturate(ps);
    ps = r8.x + r8.x;
    r18.z = float((r6.y >= 0.05));
    r8.x = ps;
    ps = r8.y + r8.y;
    r10.xyz = -r18.zxy + 1.0;
    r8.y = ps;
    r6.y = (UniformScalar_12.x > 0.0) ? r10.x : 1.0;
    r6.y = (UniformScalar_12.x >= 0.0) ? r6.y : r10.x;
    ps = r8.z + r8.z;
    r8.w = r6.y * r14.w;
    r8.z = ps;
    ps = r15.y + r15.y;
    r8 = r8 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.y = ps;
    ps = r15.z + r15.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.wwww)) clip(-1.0);
    r6.z = ps;
    r11.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r19.xyz = tex2D(Texture2D_8, r6.yz).xyz;
    r21 = tex2D(Texture2D_3, r12.wz);
    r17 = tex2D(Texture2D_2, r5.yw);
    r20 = tex2D(Texture2D_7, r0.xy);
    r0 = tex2D(Texture2D_6, r0.xy);
    r7.xyw = tex2D(Texture2D_0, r6.yz).xyz;
    r15.xyz = tex2D(Texture2D_1, r5.yw).xyz;
    r6.y = dot(r4.zxy, r4.zxy);
    r5.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r5.y = dot(r1.zxy, r1.zxy);
    r12.xyw = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r16.zw = r16.xy * 2.0 - 1.0;
    r22.xyz = r15.zxy * 2.0 - 1.0;
    r15.yzw = r7.wxy * 2.0 - 1.0;
    r0.xyz = r0.xzy * r0.www;
    ps = rsqrt(abs(r5.y));
    r20.xyz = r20.xzy * r20.www;
    r5.y = ps;
    r20.xyz = r24.xyz * r20.xyz;
    ps = OpacityOverride.x;
    r0.xyz = r23.xyz * r0.xyz;
    r8.w = saturate(ps);
    ps = r13.x + r13.x;
    r22.xyz = r22.xyz - r15.yzw;
    r5.z = ps;
    r15.x = r22.x * r17.w - 2.0;
    r15.yzw = r22.xyz * r17.www + r15.yzw;
    r20.xyz = (-abs(r5.www) >= 0.0) ? r20.xyz : r0.xyz;
    ps = r13.y + r13.y;
    r6.z = dot(r20.yxz, float3(0.11, 0.3, 0.59));
    r5.w = ps;
    ps = rsqrt(abs(r6.y));
    r0.w = r6.z - r20.x;
    r6.z = ps;
    ps = r5.y;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.x * ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = r5.y;
    r13.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r1.y * ps;
    r4.xyz = r6.zzz * r4.xyz;
    r6.z = ps;
    ps = r5.y;
    r19.w = saturate(dot(r20.zyx, float3(0.59, 0.11, 0.3)));
    r5.y = (r11.w == 0.0) ? r21.x : r21.y;
    r5.y = (r3.y == 0.0) ? r21.z : r5.y;
    r16.y = (r3.z == 0.0) ? r21.w : r5.y;
    ps = r1.z * ps;
    r16.x = r5.x * 3.3333333;
    r6.w = ps;
    ps = 0.1 - -r6.w;
    r1.xz = -r16.yx + 1.0;
    r5.x = ps;
    r5.y = dot(r18.yy, r1.xx) + r16.y;
    ps = 2.5 * r3.x;
    r5.y = r5.y + r16.y;
    r3.z = ps;
    ps = r18.y;
    r5.yzw = r5.ywz + float3(0.25, -1.0, -1.0);
    ps = r1.z * ps;
    r1.xy = r5.wz * 0.5;
    r1.z = ps;
    ps = (-1.0) - -r6.x;
    r1.xyz = r16.zxw + r1.xzy;
    r1.w = ps;
    r3.y = r1.w * r1.y + 1.0;
    ps = 5.0 * r5.x;
    r3.xy = r3.yz * r3.xy;
    r18.w = saturate(ps);
    ps = r0.w;
    r5.xw = r3.xy * r10.zz;
    ps = r20.x + ps;
    r18.xyz = r8.xzy * UniformVector_3.zyx;
    r8.x = saturate(ps);
    ps = r5.y;
    r0.w = float((r5.x >= 0.9));
    r5.xy = -r18.zy * r19.ww + r18.zy;
    r16.xy = r1.xy * r1.yz + r5.xy;
    ps = -r6.x + ps;
    r5.yz = -r18.xw + 1.0;
    r5.x = saturate(ps);
    ps = (-0.5) + r5.w;
    r3.xyz = r0.www * r20.xzy;
    r0.w = saturate(ps);
    r1.yzw = r3.xyz * r0.www + UniformVector_0.xyz;
    ps = ModShadowGroupColor.x * r5.z;
    r14.xyz = r3.xyz + r14.xyz;
    r8.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r3 = r5.xxxy * r19;
    r8.z = ps;
    ps = r18.x;
    r5.xyz = -r3.xzy + r17.xzy;
    ps = r3.w + ps;
    r8 = -r8.wxyz + 1.0;
    r16.z = ps;
    r3.xyz = r5.xyz * r17.www + r3.xzy;
    ps = r12.x;
    r6.x = float((r8.x >= 0.004));
    ps = r8.y * ps;
    r14.xyz = r14.xyz - r3.xzy;
    r1.x = ps;
    ps = r12.y;
    r5.xyz = -r15.yzw + r16.zxy;
    r5.yzw = r5.xyz * r0.www + r15.xzw;
    r12.xyz = r14.xyz * r0.www + r3.xzy;
    r3.xyz = r13.xyz * r12.xyz + r1.yzw;
    r5.x = r7.w * 2.0 + r5.y;
    ps = r8.y * ps;
    r13.xyw = r5.zwx * r10.yyy;
    r5.z = ps;
    ps = r12.w;
    r13.z = r13.w + 1.0;
    r5.xyw = (r10.yyy > 0.0) ? r13.xyz : float3(0.0, 0.0, 1.0);
    r10.xyz = (r10.yyy >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = r8.y * ps;
    r5.x = dot(r10.zxy, r10.zxy);
    r1.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r12.xyz * r0.xyz;
    r5.x = ps;
    ps = r1.x;
    r5.xyw = r10.xyz * r5.xxx;
    ps = r0.w * ps;
    r11.z = dot(r4.zxy, r5.wxy);
    r4.x = ps;
    ps = r1.y;
    r1.x = dot(r5.wxy, r9.zxy);
    ps = r0.w * ps;
    r10.xyz = r5.xyw * r1.xxx;
    r4.y = ps;
    ps = r5.z;
    r1 = r11.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = r0.w * ps;
    r6.y = saturate(dot(r6.wyz, r9.zxy));
    r4.z = ps;
    r6.zw = r1.xy * r8.zw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.y);
    r5.z = r6.z * r6.w;
    r5.y = ps;
    r6.yzw = r5.zzz * r7.xyz + ModShadowColor.xyz;
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
