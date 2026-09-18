// ps_1cbaf73b3f1cd183.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041700 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
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

    ps = UniformVector_1.x * r0.w;
    r10 = r0.wzwz * float4(6.0, 6.0, 4.0, 4.0);
    r11.x = ps;
    r22.xyz = tex2D(Texture2D_3, r10.xy).xyw;
    r9.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r3.w - 4e+02;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r13.y = ps;
    ps = rsqrt(abs(r6.x));
    r22.w = saturate(r6.y * 0.00022222222);
    r6.x = ps;
    ps = -r0.z;
    r12.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r21.xw = r22.xw * float2(4.0, -0.125);
    r6.w = ps;
    r6.xz = r12.xy * r21.ww + r0.wz;
    ps = r13.x;
    r6.y = -r6.z + 1.0;
    ps = abs(r8.x) * ps;
    r11.yzw = r6.wyx * UniformVector_1.yyx;
    r9.z = ps;
    ps = r13.y;
    r4 = r11.wzxy - 0.5;
    ps = abs(r8.y) * ps;
    r13 = float4((r11.wxzy >= 0.5));
    r9.w = ps;
    ps = 2.5 * r6.x;
    r4 = r4 - r11.wzxy;
    r15.x = ps;
    r4 = r4.zwxy * r13.ywxz + r11.xywz;
    ps = 2.5 * r6.z;
    r4 = r4.xywz + r4.xywz;
    r15.y = ps;
    r11.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r14.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r6 = tex2D(Texture2D_2, r4.xy).xwyz;
    r17 = tex2D(Texture2D_2, r4.wz).zwxy;
    r8.xzw = tex2D(Texture2D_0, r9.xy).wxy;
    r9 = tex2D(Texture2D_3, r0.wz).zyxw;
    r4.x = tex2D(Texture2D_3, r10.zw).z;
    r18.xyz = tex2D(Texture2D_1, r15.xy).xyz;
    r20.z = r9.z * 4.0 - 4.0;
    ps = r9.y + r9.y;
    r8.y = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r8.y));
    r4.zw = r8.zw + r8.zw;
    r10.z = ps;
    ps = -r7.w;
    r16.xyz = r4.yzw + float3(-2.0, -1.0, -1.0);
    r19.w = r22.y * 2.0 + r16.x;
    ps = UniformScalar_8.x + ps;
    r4.y = dot(r13.yww, float3(1.0, 1.0, 1.0));
    r13.y = ps;
    ps = r7.w;
    r4.z = dot(r13.xzz, float3(1.0, 1.0, 1.0));
    r7.x = (r4.z == 0.0) ? r17.z : r17.w;
    r7.y = (r4.y == 0.0) ? r6.x : r6.z;
    ps = 1e+01 * ps;
    r23 = r4.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r17.z = saturate(ps);
    r6.x = (r23.y == 0.0) ? r6.w : r7.y;
    r7.x = (r23.z == 0.0) ? r17.x : r7.x;
    r20.y = (r23.w == 0.0) ? r17.y : r7.x;
    r10.x = (r23.x == 0.0) ? r6.y : r6.x;
    ps = r3.w;
    r6.x = max(r10.x, 0.0);
    ps = 0.0001 * ps;
    r6.x = min(r6.x, 0.3);
    r20.w = saturate(ps);
    ps = r22.z;
    r20.x = r6.x * 3.3333333;
    ps = r9.w * ps;
    r4.yzw = -r20.wxy + 1.0;
    r6.y = ps;
    ps = (-1.0) - -r6.y;
    r21.yz = r17.zz * r4.zw;
    r19.x = ps;
    ps = r21.z;
    r13.z = float((UniformScalar_7.x >= 1.0));
    ps = r20.y + ps;
    r19.yz = r20.zx + r21.xy;
    r14.w = ps;
    r14 = r14.zxyw * 2.0 + float4(-1.0, -1.0, -1.0, -0.75);
    ps = r10.z;
    r6.xzw = r19.xzy * r19.zwz;
    r9.z = r6.z * 2.0 + r14.z;
    ps = r2.x * ps;
    r8.y = r6.x + 1.0;
    r7.x = ps;
    ps = r10.z;
    r13.x = abs(r8.y) * abs(r8.y);
    ps = r2.y * ps;
    r17.xy = r13.xy * r13.xz;
    r7.y = ps;
    ps = r10.z;
    r10.y = r17.y + r7.w;
    ps = r2.z * ps;
    r10.y = -r10.y + r7.z;
    r7.z = ps;
    ps = 0.1 - -r7.z;
    r2.x = max(r10.y, UniformScalar_9.x);
    r6.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r2.y = min(r2.x, 1.0);
    r2.x = ps;
    ps = 5.0 * r6.x;
    r6.z = saturate(r2.y * r2.x);
    r6.x = saturate(ps);
    r13.xyz = -r6.zxy + 1.0;
    ps = OpacityOverride.x;
    r10.yz = r13.yy * ModShadowGroupColor.xy;
    r10.w = saturate(ps);
    r10 = -r10 + 1.0;
    ps = r18.z + r18.z;
    r6.y = r8.y * r10.x;
    r2.w = ps;
    r17.w = r6.y * r9.x - r6.y;
    ps = r4.x;
    r9.xw = r17.zx * r17.wx;
    ps = r7.w * ps;
    r18.w = r6.y + r9.x;
    r17.w = ps;
    ps = r14.y;
    r2.xyz = r18.wxy * float3(2.5, 4.0, 4.0);
    ps = r6.w + ps;
    r6.xyz = r2.wyz + float3(-1.0, -2.0, -2.0);
    r9.y = ps;
    ps = 0.5 * r6.x;
    r17.yz = -r6.yz + r9.yz;
    r7.w = ps;
    ps = (-0.5) + r2.x;
    r17.x = r14.x - r7.w;
    r13.w = saturate(ps);
    ps = UniformScalar_1.x * r4.y;
    r6 = r17.wxyz * r13.xwww;
    r4.x = ps;
    ps = r7.w;
    r9.yz = r0.wz * UniformVector_3.xy;
    ps = r6.y + ps;
    r6.x = float((r6.x >= 0.05));
    r8.y = ps;
    ps = 1.0 - r6.x;
    r6.yz = r6.zw - 2.0;
    r7.w = ps;
    r6.yz = r4.xx * r16.yz + r6.yz;
    ps = r8.y;
    r11.z = dot(r5.zxy, r5.zxy);
    r6.x = ps;
    ps = (-1.0) + r6.x;
    r6.yw = r6.yz + r2.yz;
    r6.z = ps;
    r6.x = (UniformScalar_8.x > 0.0) ? r7.w : 1.0;
    r2.x = (UniformScalar_8.x >= 0.0) ? r6.x : r7.w;
    ps = (-1.0) + r8.x;
    r6.xy = r6.yw * r4.yy;
    r6.w = ps;
    r6.zw = r6.zw * r4.yy + 1.0;
    r6 = (r4.xyyy > 0.0) ? r6.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r4.xyyy >= 0.0) ? r6 : float4(1.0, 0.0, 0.0, 1.0);
    ps = rsqrt(abs(r11.z));
    r7.w = dot(r6.wyz, r6.wyz);
    r2.y = ps;
    ps = rsqrt(abs(r7.w));
    r2.yzw = r2.yyy * r5.xyz;
    r7.w = ps;
    r5.xyz = r6.yzw * r7.www;
    r11.z = dot(r2.wyz, r5.zxy);
    r11 = r11.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r2.yz = r11.xy * r10.yz;
    r10.xyz = r2.xyz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r10.xxxx)) clip(-1.0);
    r4.xyz = tex2D(Texture2D_5, r15.xy).xyz;
    r15.xyz = tex2D(Texture2D_7, r9.yz).xyz;
    r0.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    ps = UniformVector_2.x * UniformVector_2.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = ps;
    ps = UniformVector_2.y * UniformVector_2.w;
    r7.w = float((UniformScalar_4.x >= 1.0));
    r2.y = ps;
    ps = UniformVector_2.z * UniformVector_2.w;
    r0.x = float((UniformScalar_4.x > 1.0));
    r2.z = ps;
    r2.xyz = r2.xyz * r0.yzw;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r15.xyz : 1.0;
    r0.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = -UniformVector_0.x;
    r2.xyz = r2.xyz * r0.xyz;
    r7.w = saturate(r13.z * 0.2 + r14.w);
    ps = 1.0 + ps;
    r0.xyz = r7.www * r4.xyz;
    r6.y = ps;
    ps = -UniformVector_0.y;
    r0.xyz = r0.xyz * r8.xxx;
    ps = 1.0 + ps;
    r6.w = float((r10.w >= 0.004));
    r6.z = ps;
    ps = -UniformVector_0.z;
    r4.xyz = r2.xyz * r6.xxx;
    r2.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = 1.0 + ps;
    r4.xyz = r4.xyz - r0.xyz;
    r6.x = ps;
    r0.xyz = r4.xyz * r13.www + r0.xyz;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r4.xyz = r9.www * r2.xyz;
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r2.xyz = r5.zzz * r1.xyz;
    r8.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r4.xyz = r4.xzy * r13.www;
    r8.z = ps;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    r0.xyz = r0.xyz * r6.yzx;
    r6.x = dot(r5.zxy, r12.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r5.xyz = r6.xyz * 2.0 - r12.xyz;
    r6.xz = r11.zw + 0.5;
    r6.y = saturate(dot(r7.zxy, r5.zxy));
    ps = log2(r6.y);
    r6.xz = abs(r6.xz) * abs(r6.xz);
    r6.y = ps;
    r5.xyz = r0.xzy * r6.xxx;
    ps = 15.0 * r6.y;
    r7.xyz = r0.xzy * r6.zzz;
    r6.y = ps;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r6.y);
    r6.x = r10.y * r10.z;
    r7.w = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r1.xyz = r7.www * r1.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xzy;
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
