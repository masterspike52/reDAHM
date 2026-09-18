// ps_6e2207641a76bddb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000006A8 10041600 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = r0.wzwz * float4(6.0, 6.0, 4.0, 4.0);
    r20.xyz = tex2D(Texture2D_3, r13.xy).xyw;
    ps = r0.w;
    r6.y = r3.w - 4e+02;
    ps = UniformVector_1.x * ps;
    r6.x = dot(r4.zxy, r4.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r6.x));
    r20.w = saturate(r6.y * 0.00022222222);
    r6.x = ps;
    ps = -r0.z;
    r15.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r19.xw = r20.xw * float2(4.0, -0.125);
    r6.w = ps;
    r6.xz = r15.xy * r19.ww + r0.wz;
    ps = r0.x;
    r6.y = -r6.z + 1.0;
    ps = UniformScalar_0.x * ps;
    r12.yzw = r6.wyx * UniformVector_1.yyx;
    r9.x = ps;
    ps = r0.y;
    r4 = r12.wzxy - 0.5;
    ps = UniformScalar_0.x * ps;
    r10 = float4((r12.xywz >= 0.5));
    r9.y = ps;
    ps = 2.5 * r6.x;
    r4 = r4 - r12.wzxy;
    r11.z = ps;
    r4 = r4.zwxy * r10 + r12.xywz;
    ps = 2.5 * r6.z;
    r14 = r4.xywz + r4.xywz;
    r11.w = ps;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4 = tex2D(Texture2D_2, r14.xy);
    r22 = tex2D(Texture2D_2, r14.wz);
    r9.xzw = tex2D(Texture2D_0, r9.xy).wxy;
    r6 = tex2D(Texture2D_3, r0.wz).wyxz;
    r8.z = tex2D(Texture2D_3, r13.zw).z;
    r17.xyz = tex2D(Texture2D_1, r11.zw).xyz;
    r16.x = r8.z * r7.w;
    r11.y = float((UniformScalar_7.x >= 1.0));
    r8.z = dot(r2.zxy, r2.zxy);
    r18.z = r6.z * 4.0 - 4.0;
    ps = rsqrt(abs(r8.z));
    r13.yz = r9.zw + r9.zw;
    r8.z = ps;
    ps = r6.y + r6.y;
    r2.xyz = r8.zzz * r2.xzy;
    r13.x = ps;
    ps = r3.w;
    r13.xyz = r13.yzx + float3(-1.0, -1.0, -2.0);
    r14.w = r20.y * 2.0 + r13.z;
    ps = 0.0001 * ps;
    r10.y = dot(r10.xyy, float3(1.0, 1.0, 1.0));
    r10.x = saturate(ps);
    ps = r7.w;
    r10.z = dot(r10.zww, float3(1.0, 1.0, 1.0));
    r8.z = (r10.z == 0.0) ? r22.x : r22.y;
    r2.w = (r10.y == 0.0) ? r4.x : r4.y;
    ps = 1e+01 * ps;
    r21 = r10.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = saturate(ps);
    r2.w = (r21.y == 0.0) ? r4.z : r2.w;
    r8.z = (r21.z == 0.0) ? r22.z : r8.z;
    r18.y = (r21.w == 0.0) ? r22.w : r8.z;
    r18.w = (r21.x == 0.0) ? r4.w : r2.w;
    ps = r20.z;
    r2.w = max(r18.w, 0.0);
    ps = r6.x * ps;
    r2.w = min(r2.w, 0.3);
    r8.z = ps;
    ps = (-1.0) - -r8.z;
    r18.x = r2.w * 3.3333333;
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = -r18.wxy + 1.0;
    r10.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r19.yz = r6.zz * r4.yz;
    r10.z = ps;
    ps = r19.z;
    r8.xy = r10.yz * abs(r8.xy);
    ps = r18.y + ps;
    r14.yz = r18.zx + r19.xy;
    r12.w = ps;
    r12 = r12.zxwy * 2.0 + float4(-1.0, -1.0, -0.75, -1.0);
    ps = -r7.w;
    r10.yzw = r14.xzy * r14.zwz;
    r10.z = r10.z * 2.0 + r12.w;
    ps = UniformScalar_8.x + ps;
    r2.w = r10.y + 1.0;
    r14.w = ps;
    ps = abs(r2.w) * abs(r2.w);
    r6.x = r2.w * r4.x;
    r6.y = ps;
    r6.w = r6.x * r6.w - r6.x;
    ps = r17.z + r17.z;
    r13.zw = r6.yz * r6.yw;
    r4.w = ps;
    ps = 0.1 - -r2.y;
    r17.w = r6.x + r13.w;
    r6.x = ps;
    ps = r12.y;
    r4.xyz = r17.wxy * float3(2.5, 4.0, 4.0);
    ps = r10.w + ps;
    r6.yzw = r4.wyz + float3(-1.0, -2.0, -2.0);
    r10.y = ps;
    ps = 0.5 * r6.y;
    r14.yz = -r6.zw + r10.yz;
    r6.y = ps;
    ps = (-0.5) + r4.x;
    r14.x = r12.x - r6.y;
    r11.x = saturate(ps);
    ps = 5.0 * r6.x;
    r14 = r14.xwyz * r11.xyxx;
    r10.y = saturate(ps);
    ps = r6.y;
    r6.x = r14.y + r7.w;
    ps = r14.x + ps;
    r6.x = -r6.x + r7.z;
    r9.y = ps;
    ps = r9.y;
    r6.y = max(r6.x, UniformScalar_9.x);
    r6.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r6.z = min(r6.y, 1.0);
    r6.y = ps;
    ps = (-1.0) + r6.x;
    r10.z = saturate(r6.z * r6.y);
    r16.y = ps;
    ps = (-1.0) + r9.x;
    r10.yzw = -r10.xyz + 1.0;
    r16.z = ps;
    r7.xyz = r16.yzx * r10.yyw;
    r6.x = float((r7.z >= 0.05));
    ps = 1.0 - r6.x;
    r6.yz = r0.wz * UniformVector_3.xy;
    r6.x = ps;
    r6.w = (UniformScalar_8.x > 0.0) ? r6.x : 1.0;
    r6.x = (UniformScalar_8.x >= 0.0) ? r6.w : r6.x;
    ps = (-0.5) - -r6.x;
    r0.xy = r0.xy * 3.0;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r14.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r18.xyz = tex2D(Texture2D_5, r11.zw).xyz;
    r16.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r6.yz).xyz;
    r17.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r6.w = float((UniformScalar_4.x >= 1.0));
    ps = OpacityOverride.x;
    r7.w = dot(r5.zxy, r5.zxy);
    r8.x = saturate(ps);
    ps = -ModShadowColor.x;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    ps = 1.0 + ps;
    r0.w = float((UniformScalar_4.x > 1.0));
    r12.x = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r7.w));
    r17.xyz = r17.xyz * r16.xyz;
    r7.w = ps;
    ps = -ModShadowColor.y;
    r16.xyz = r7.www * r5.xyz;
    r0.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = 1.0 + ps;
    r5.xyz = r17.xyz * r0.xyz;
    r12.y = ps;
    ps = UniformScalar_1.x * r10.y;
    r8.yw = r10.zz * ModShadowGroupColor.xy;
    r10.x = ps;
    ps = 1.0 + r7.x;
    r0.xy = r14.zw - 2.0;
    r17.z = ps;
    r0.xy = r10.xx * r13.xy + r0.xy;
    ps = 1.0 + r7.y;
    r0.xy = r0.xy + r4.yz;
    r17.w = ps;
    ps = r0.x;
    r4 = -r8.zywx + 1.0;
    ps = r10.y * ps;
    r6.w = float((r4.w >= 0.004));
    r17.x = ps;
    r7.x = saturate(r4.x * 0.2 + r12.z);
    ps = r0.y;
    r7.xyz = r7.xxx * r18.xyz;
    ps = r10.y * ps;
    r0.xyz = r7.xyz * r9.xxx;
    r17.y = ps;
    r7 = (r10.xyyy > 0.0) ? r17.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r7 = (r10.xyyy >= 0.0) ? r7 : float4(1.0, 0.0, 0.0, 1.0);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r0.w = dot(r7.wyz, r7.wyz);
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r9.xyz = r5.xyz * r7.xxx;
    r8.y = ps;
    r5.xyz = r9.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.w));
    r9.xyz = r9.xyz - r0.xyz;
    r7.x = ps;
    r0.xyz = r9.xyz * r11.xxx + r0.xyz;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r7.xyw = r7.yzw * r7.xxx;
    r8.z = ps;
    r9.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    ps = -ModShadowColor.z;
    r14.z = dot(r16.zxy, r7.wxy);
    ps = 1.0 + ps;
    r7.z = dot(r7.wxy, r15.zxy);
    r12.z = ps;
    ps = r7.w;
    r8.xyz = r7.xyw * r7.zzz;
    r8.xyz = r8.xyz * 2.0 - r15.xyz;
    ps = r1.x * ps;
    r10 = r14.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r4.x = ps;
    r13.xy = r10.xy * r4.yz + 0.125;
    ps = r7.w;
    r4.zw = r10.zw + 0.5;
    ps = r1.y * ps;
    r0.w = saturate(dot(r2.yxz, r8.zxy));
    r4.y = ps;
    ps = log2(r0.w);
    r7.yz = abs(r4.zw) * abs(r4.zw);
    r7.x = ps;
    ps = 15.0 * r7.x;
    r0.xyz = r0.xyz * r6.yzx;
    r0.w = ps;
    ps = r13.x * r13.y;
    r8.xyz = r0.xzy * r7.yyy;
    r6.x = ps;
    ps = r13.z * r13.z;
    r2.yzw = r0.xzy * r7.zzz;
    r2.x = ps;
    r6.xyz = r6.xxx * r12.xyz + ModShadowColor.xyz;
    r7.xyz = r2.yzw * UpperSkyColor.xzy + r9.xzy;
    ps = pow(2.0, r0.w);
    r2.xyz = r2.xxx * r5.xyz;
    r0.w = ps;
    ps = r7.w;
    r5.xyz = r0.www * r1.xzy;
    ps = r1.z * ps;
    r2.xyz = r2.xzy * r11.xxx;
    r4.z = ps;
    r7.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r5.xyz * r2.xyz + r7.xzy;
    r7.xyz = r4.xyz * r0.xyz + r7.xzy;
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
