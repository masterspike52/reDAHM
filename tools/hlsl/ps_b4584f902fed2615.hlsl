// ps_b4584f902fed2615.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006A8 10041600 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
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
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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

    ps = 1.0 - r0.z;
    r11.w = ps;
    ps = -r6.w;
    r5.x = UniformScalar_8.x * 0.05;
    ps = UniformScalar_4.x + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r9.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r9.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = r2.w;
    r10.xyz = r5.yyy * r1.xyz;
    ps = (-4e+02) + ps;
    r5.z = r10.z + 0.1;
    r5.y = ps;
    ps = r0.w;
    r21.xw = saturate(r5.zy * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r5.y = r5.x * r21.w;
    r5.x = ps;
    r11.yz = r9.xy * r5.yy + r0.wz;
    ps = r0.z;
    r11.x = -r11.z + 1.0;
    ps = 18.0 * ps;
    r12.yzw = r11.wxy * UniformVector_1.yyx;
    r5.y = ps;
    ps = UniformVector_1.x * r0.w;
    r15.xyz = UniformVector_4.xyz * 2e+01;
    r12.x = ps;
    ps = r0.w;
    r1 = r12.wzxy - 0.5;
    ps = 3.0 * ps;
    r8 = float4((r12.wzxy >= 0.5));
    r5.z = ps;
    ps = r0.z;
    r1 = r1 - r12.wzxy;
    r1 = r1.zwxy * r8.zwxy + r12.xywz;
    ps = 3.0 * ps;
    r3 = r1.xywz + r1.xywz;
    r5.w = ps;
    r18 = tex2D(Texture2D_8, r0.xy);
    r20 = tex2D(Texture2D_4, r5.zw);
    r14.xyz = tex2D(Texture2D_4, r5.xy).xyw;
    r1 = tex2D(Texture2D_3, r3.xy);
    r12 = tex2D(Texture2D_6, r0.xy);
    r13.xyz = tex2D(Texture2D_5, r0.xy).zxy;
    ps = r0.w + r0.w;
    r5.w = float((UniformScalar_3.x >= 1.0));
    r5.x = ps;
    ps = r0.z + r0.z;
    r12.xyz = r12.xyz * r12.www;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = r15.xyz * r12.xyz;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r0.y = ps;
    r5.w = r9.w * r5.w + r6.w;
    ps = -r5.w;
    r7.xy = r0.xy * abs(r7.xy);
    ps = r6.z + ps;
    r12.w = dot(r8.xyy, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    ps = r5.w;
    r12.z = dot(r8.zww, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r5.w = (r12.z == 0.0) ? r1.x : r1.y;
    ps = UniformScalar_5.x;
    r8 = r12.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r0.w = ps;
    r5.w = (r8.w == 0.0) ? r1.z : r5.w;
    r0.y = (r8.x == 0.0) ? r1.w : r5.w;
    ps = max(r0.z, r0.w);
    r0.x = max(r0.y, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_6.x;
    r0.xw = min(r0.zx, float2(1.0, 0.3));
    r5.w = ps;
    ps = r13.x + r13.x;
    r0.z = saturate(r0.x * r5.w);
    r13.x = ps;
    ps = r5.z;
    r1.zw = -r0.yz + 1.0;
    ps = -r15.x + ps;
    r14.w = r1.w * r6.w;
    r5.z = ps;
    ps = r5.z;
    r1.xy = r14.zw * r20.wz;
    ps = r15.x + ps;
    r21.z = float((r1.y >= 0.05));
    r21.y = saturate(ps);
    ps = r13.y + r13.y;
    r0.xyz = -r21.zyx + 1.0;
    r13.y = ps;
    r5.z = (UniformScalar_4.x > 0.0) ? r0.x : 1.0;
    r5.z = (UniformScalar_4.x >= 0.0) ? r5.z : r0.x;
    ps = r13.z + r13.z;
    r13.w = r5.z * r18.w;
    r13.z = ps;
    ps = r11.y + r11.y;
    r16 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.z = ps;
    ps = r11.z + r11.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.wwww)) clip(-1.0);
    r5.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r17.xyz = tex2D(Texture2D_7, r5.zw).xyz;
    r22 = tex2D(Texture2D_3, r3.wz);
    r19 = tex2D(Texture2D_2, r5.xy);
    r11.xyw = tex2D(Texture2D_0, r5.zw).xyz;
    r13.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    ps = OpacityOverride.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = saturate(ps);
    ps = r6.w;
    r5.w = dot(r4.zxy, r4.zxy);
    ps = 15.0 * ps;
    r5.xyz = -UniformVector_0.zxy + 1.0;
    r8.w = saturate(ps);
    r3.xyw = r18.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r20.zw = r20.xy * 2.0 - 1.0;
    r13.xyz = r13.zxy * 2.0 - 1.0;
    r6.xzw = r11.wxy * 2.0 - 1.0;
    ps = r14.x + r14.x;
    r13.yzw = r13.xyz - r6.xzw;
    r6.y = ps;
    r13.x = r13.y * r19.w - 2.0;
    r13.yzw = r13.yzw * r19.www + r6.xzw;
    r6.x = (r12.w == 0.0) ? r22.x : r22.y;
    r6.x = (r8.y == 0.0) ? r22.z : r6.x;
    r20.y = (r8.z == 0.0) ? r22.w : r6.x;
    ps = r14.y + r14.y;
    r20.x = r0.w * 3.3333333;
    r6.z = ps;
    ps = rsqrt(abs(r5.w));
    r6.xw = -r20.yx + 1.0;
    r5.w = ps;
    ps = r8.w;
    r4.xyz = r5.www * r4.xyz;
    r5.w = dot(r8.ww, r6.xx) + r20.y;
    ps = r6.w * ps;
    r6.x = r5.w + r20.y;
    r14.z = ps;
    ps = (-1.0) - -r1.x;
    r6.xyz = r6.yzx + float3(-1.0, -1.0, 0.25);
    r14.w = ps;
    ps = 0.5 * r6.x;
    r5.w = saturate(r6.z - r1.x);
    r14.x = ps;
    ps = 0.5 * r6.y;
    r17.xyz = r5.www * r17.xyz;
    r14.y = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r14.xyz = r20.zxw + r14.xzy;
    r8.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r6.xyz = -r17.xzy + r19.xzy;
    r8.z = ps;
    r17.xyz = r6.xyz * r19.www + r17.xzy;
    r1.x = r14.w * r14.y + 1.0;
    r8 = -r8.wxyz + 1.0;
    ps = 2.5 * r1.z;
    r6.z = float((r8.y >= 0.004));
    r1.y = ps;
    ps = r2.w;
    r6.xy = r1.xy * r1.zx;
    ps = 0.0001 * ps;
    r6.xy = r6.yx * r8.xx;
    r20.w = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r20.xyz = r16.xzy * UniformVector_3.zyx;
    r16.x = ps;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r5.w = float((r6.y >= 0.9));
    r16.y = ps;
    r1.xy = -r20.zy * r21.yy + r20.zy;
    r14.xy = r14.xy * r14.yz + r1.xy;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r1.xw = -r20.xw + 1.0;
    r16.z = ps;
    ps = (-0.5) + r6.x;
    r19.xyz = r15.xyz * r5.www;
    r6.y = saturate(ps);
    r15.xyz = r19.xyz * r6.yyy + UniformVector_0.xyz;
    r14.z = r1.x * r21.y + r20.x;
    ps = r3.x;
    r18.xyz = r19.xyz + r18.xyz;
    ps = r0.y * ps;
    r18.xyz = r18.xyz - r17.xzy;
    r0.w = ps;
    ps = r3.y;
    r14.xyz = -r13.yzw + r14.zxy;
    r11.xyz = r18.xyz * r6.yyy + r17.xzy;
    r3.xyz = r16.xyz * r11.xyz + r15.xyz;
    r13.yzw = r14.xyz * r6.yyy + r13.xzw;
    r13.x = r11.w * 2.0 + r13.y;
    ps = r0.y * ps;
    r13.xyw = r13.zwx * r1.www;
    r6.x = ps;
    ps = r3.w;
    r13.z = r13.w + 1.0;
    r1.xyz = (r1.www > 0.0) ? r13.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r1.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.y * ps;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r11.xyz * r5.yzx;
    r5.x = ps;
    ps = r0.w;
    r5.xyw = r1.xyz * r5.xxx;
    ps = r6.y * ps;
    r12.z = dot(r4.zxy, r5.wxy);
    r4.x = ps;
    ps = r6.w;
    r5.z = dot(r5.wxy, r9.zxy);
    ps = r6.y * ps;
    r11.xyz = r5.xyw * r5.zzz;
    r4.y = ps;
    ps = r6.x;
    r1 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r9.xyz = r11.xyz * 2.0 - r9.xyz;
    ps = r6.y * ps;
    r6.x = saturate(dot(r10.zxy, r9.zxy));
    r4.z = ps;
    r6.yw = r1.xy * r8.zw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.x);
    r5.z = r6.y * r6.w;
    r5.x = ps;
    r6.xyw = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
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
    r5.xyz = r5.xyz * r6.xyw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.z + r2.w;
    r5.xyz = r0.xyz * r6.zzz + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
