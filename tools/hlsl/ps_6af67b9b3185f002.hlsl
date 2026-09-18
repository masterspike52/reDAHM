// ps_6af67b9b3185f002.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041500 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c17); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r8 = r0.wzwz * float4(6.0, 6.0, 4.0, 4.0);
    r11.x = ps;
    r20.xyz = tex2D(Texture2D_3, r8.xy).xyw;
    r9.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r2.w - 4e+02;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r12.y = ps;
    ps = rsqrt(abs(r5.x));
    r20.w = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r10.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r19.xw = r20.xw * float2(4.0, -0.125);
    r5.w = ps;
    r5.xz = r10.xy * r19.ww + r0.wz;
    ps = r12.x;
    r5.y = -r5.z + 1.0;
    ps = abs(r7.x) * ps;
    r11.yzw = r5.wyx * UniformVector_1.yyx;
    r9.z = ps;
    ps = r12.y;
    r3 = r11.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r12 = float4((r11.wzxy >= 0.5));
    r9.w = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r11.wzxy;
    r14.z = ps;
    r3 = r3.zwxy * r12.zwxy + r11.xywz;
    ps = 2.5 * r5.z;
    r3 = r3.xywz + r3.xywz;
    r14.w = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5 = tex2D(Texture2D_2, r3.xy).xwyz;
    r15 = tex2D(Texture2D_2, r3.wz).zwxy;
    r7.xzw = tex2D(Texture2D_0, r9.xy).wxy;
    r11 = tex2D(Texture2D_3, r0.wz).xywz;
    r3.x = tex2D(Texture2D_3, r8.zw).z;
    r16.xyz = tex2D(Texture2D_1, r14.zw).xyz;
    r18.z = r11.x * 4.0 - 4.0;
    ps = r11.y + r11.y;
    r7.y = dot(r1.zxy, r1.zxy);
    r3.y = ps;
    ps = rsqrt(abs(r7.y));
    r3.zw = r7.zw + r7.zw;
    r9.w = ps;
    ps = -r6.w;
    r9.xyz = r3.yzw + float3(-2.0, -1.0, -1.0);
    r17.w = r20.y * 2.0 + r9.x;
    ps = UniformScalar_8.x + ps;
    r8.z = dot(r12.zww, float3(1.0, 1.0, 1.0));
    r12.z = ps;
    ps = r6.w;
    r8.w = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r3.y = (r8.w == 0.0) ? r15.z : r15.w;
    r3.z = (r8.z == 0.0) ? r5.x : r5.z;
    ps = 1e+01 * ps;
    r21 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r15.z = saturate(ps);
    r5.x = (r21.y == 0.0) ? r5.w : r3.z;
    r3.y = (r21.z == 0.0) ? r15.x : r3.y;
    r18.y = (r21.w == 0.0) ? r15.y : r3.y;
    r12.x = (r21.x == 0.0) ? r5.y : r5.x;
    ps = r2.w;
    r5.x = max(r12.x, 0.0);
    ps = 0.0001 * ps;
    r5.x = min(r5.x, 0.3);
    r18.w = saturate(ps);
    ps = r20.z;
    r18.x = r5.x * 3.3333333;
    ps = r11.z * ps;
    r3.yzw = -r18.wxy + 1.0;
    r5.y = ps;
    ps = (-1.0) - -r5.y;
    r19.yz = r15.zz * r3.zw;
    r17.x = ps;
    ps = r19.z;
    r12.w = float((UniformScalar_7.x >= 1.0));
    ps = r18.y + ps;
    r17.yz = r18.zx + r19.xy;
    r13.w = ps;
    r13 = r13.zxyw * 2.0 + float4(-1.0, -1.0, -1.0, -0.75);
    ps = r9.w;
    r5.xzw = r17.xzy * r17.zwz;
    r8.w = r5.z * 2.0 + r13.z;
    ps = r1.x * ps;
    r7.y = r5.x + 1.0;
    r1.x = ps;
    ps = r9.w;
    r12.y = abs(r7.y) * abs(r7.y);
    ps = r1.y * ps;
    r15.xy = r12.yz * r12.yw;
    r1.y = ps;
    ps = r9.w;
    r8.z = r15.y + r6.w;
    ps = r1.z * ps;
    r6.y = -r8.z + r6.z;
    r1.z = ps;
    ps = 0.1 - -r1.z;
    r6.y = max(r6.y, UniformScalar_9.x);
    r5.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r1.w = min(r6.y, 1.0);
    r6.y = ps;
    ps = 5.0 * r5.x;
    r5.z = saturate(r1.w * r6.y);
    r5.x = saturate(ps);
    r11.xyz = -r5.zxy + 1.0;
    ps = OpacityOverride.x;
    r12.yz = r11.yy * ModShadowGroupColor.xy;
    r12.w = saturate(ps);
    r12 = -r12.wxyz + 1.0;
    ps = r16.z + r16.z;
    r5.y = r7.y * r12.y;
    r6.y = ps;
    r15.w = r5.y * r11.w - r5.y;
    ps = r3.x;
    r9.xw = r15.zx * r15.wx;
    ps = r6.w * ps;
    r16.w = r5.y + r9.x;
    r15.w = ps;
    ps = r13.y;
    r6.xzw = r16.wxy * float3(2.5, 4.0, 4.0);
    ps = r5.w + ps;
    r5.xyz = r6.yzw + float3(-1.0, -2.0, -2.0);
    r8.z = ps;
    ps = 0.5 * r5.x;
    r15.yz = -r5.yz + r8.zw;
    r1.w = ps;
    ps = (-0.5) + r6.x;
    r15.x = r13.x - r1.w;
    r11.w = saturate(ps);
    ps = UniformScalar_1.x * r3.y;
    r5 = r15.wxyz * r11.xwww;
    r3.x = ps;
    ps = r1.w;
    r14.xy = r0.wz * UniformVector_3.xy;
    ps = r5.y + ps;
    r5.x = float((r5.x >= 0.05));
    r7.y = ps;
    ps = 1.0 - r5.x;
    r5.yz = r5.zw - 2.0;
    r8.z = ps;
    r5.yz = r3.xx * r9.yz + r5.yz;
    ps = r7.y;
    r1.w = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r5.yw = r5.yz + r6.zw;
    r5.z = ps;
    r5.x = (UniformScalar_8.x > 0.0) ? r8.z : 1.0;
    r15.x = (UniformScalar_8.x >= 0.0) ? r5.x : r8.z;
    ps = (-1.0) + r7.x;
    r5.xy = r5.yw * r3.yy;
    r5.w = ps;
    r5.zw = r5.zw * r3.yy + 1.0;
    r5 = (r3.xyyy > 0.0) ? r5.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r5 = (r3.xyyy >= 0.0) ? r5 : float4(1.0, 0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r6.x = dot(r5.wyz, r5.wyz);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r3.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    r6.xyw = r5.yzw * r6.xxx;
    r8.z = dot(r3.zxy, r6.wxy);
    r8 = r8.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r15.yz = r8.xy * r12.zw;
    r9.xyz = r15.xyz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r9.xxxx)) clip(-1.0);
    r4.xyz = tex2D(Texture2D_5, r14.zw).xyz;
    r14.xyz = tex2D(Texture2D_7, r14.xy).xyz;
    r0.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    r3.xyz = UniformVector_2.xyz * UniformVector_2.www;
    ps = -ModShadowColor.x;
    r6.z = float((UniformScalar_4.x >= 1.0));
    ps = 1.0 + ps;
    r0.x = float((UniformScalar_4.x > 1.0));
    r8.x = ps;
    ps = -UniformVector_0.x;
    r3.xyz = r3.xyz * r0.yzw;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r14.xyz : 1.0;
    r0.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r0.xyz;
    ps = 1.0 + ps;
    r3.xyz = r3.xyz * r0.xyz;
    r5.y = ps;
    r6.z = saturate(r11.z * 0.2 + r13.w);
    ps = -UniformVector_0.y;
    r0.xyz = r6.zzz * r4.xyz;
    ps = 1.0 + ps;
    r0.xyz = r0.xyz * r7.xxx;
    r5.z = ps;
    ps = -UniformVector_0.z;
    r5.w = float((r12.x >= 0.004));
    ps = 1.0 + ps;
    r4.xyz = r3.xyz * r5.xxx;
    r5.x = ps;
    r3.yzw = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r4.xyz = r4.xyz - r0.xyz;
    r3.x = ps;
    r0.xyz = r4.xyz * r11.www + r0.xyz;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r4.xyz = r9.www * r3.yzw;
    r3.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r4.xyz = r4.xzy * r11.www;
    r3.z = ps;
    r3.xyz = r3.xyz * r0.xyz + UniformVector_0.xyz;
    ps = -ModShadowColor.y;
    r0.xyz = r0.xyz * r5.yzx;
    ps = 1.0 + ps;
    r5.x = dot(r6.wxy, r10.zxy);
    r8.y = ps;
    ps = -ModShadowColor.z;
    r5.xyz = r6.xyw * r5.xxx;
    r7.xyz = r5.xyz * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r5.xz = r8.zw + 0.5;
    r8.z = ps;
    ps = ConstantLighting.x * r6.w;
    r5.y = saturate(dot(r1.zxy, r7.zxy));
    r1.x = ps;
    ps = log2(r5.y);
    r5.xz = abs(r5.xz) * abs(r5.xz);
    r5.y = ps;
    ps = ConstantLighting.y * r6.w;
    r7.xyz = r0.xzy * r5.xxx;
    r1.y = ps;
    ps = 15.0 * r5.y;
    r10.xyz = r0.xzy * r5.zzz;
    r5.y = ps;
    r3.xyz = r10.xyz * UpperSkyColor.xzy + r3.xzy;
    ps = pow(2.0, r5.y);
    r5.x = r9.y * r9.z;
    r6.z = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r6.w;
    r7.xyz = r6.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r6.xyz = r7.xyz * r4.xyz + r3.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
