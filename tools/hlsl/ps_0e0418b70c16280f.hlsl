// ps_0e0418b70c16280f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000006A8 10041500 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
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

    r11 = r0.wzwz * float4(6.0, 6.0, 4.0, 4.0);
    r13.xyz = tex2D(Texture2D_3, r11.xy).xyw;
    ps = r0.w;
    r5.y = r2.w - 4e+02;
    ps = UniformVector_1.x * ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r5.x));
    r13.w = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r14.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r19.xw = r13.xw * float2(4.0, -0.125);
    r5.w = ps;
    r5.xz = r14.xy * r19.ww + r0.wz;
    ps = r0.x;
    r5.y = -r5.z + 1.0;
    ps = UniformScalar_0.x * ps;
    r10.yzw = r5.wyx * UniformVector_1.yyx;
    r8.x = ps;
    ps = r0.y;
    r3 = r10.wzxy - 0.5;
    ps = UniformScalar_0.x * ps;
    r16 = float4((r10.xwzy >= 0.5));
    r8.y = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r10.wzxy;
    r9.z = ps;
    r3 = r3.zwxy * r16.xwyz + r10.xywz;
    ps = 2.5 * r5.z;
    r12 = r3.xywz + r3.xywz;
    r9.w = ps;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r3 = tex2D(Texture2D_2, r12.xy);
    r21 = tex2D(Texture2D_2, r12.wz);
    r8.xzw = tex2D(Texture2D_0, r8.xy).wxy;
    r5 = tex2D(Texture2D_3, r0.wz).wyxz;
    r8.y = tex2D(Texture2D_3, r11.zw).z;
    r12.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    r15.x = r8.y * r6.w;
    r9.y = float((UniformScalar_7.x >= 1.0));
    r8.y = dot(r1.zxy, r1.zxy);
    r18.z = r5.z * 4.0 - 4.0;
    ps = rsqrt(abs(r8.y));
    r11.yz = r8.zw + r8.zw;
    r8.y = ps;
    ps = r5.y + r5.y;
    r1.xyz = r8.yyy * r1.xzy;
    r11.x = ps;
    ps = r2.w;
    r11.xyz = r11.yzx + float3(-1.0, -1.0, -2.0);
    r17.w = r13.y * 2.0 + r11.z;
    ps = 0.0001 * ps;
    r15.y = dot(r16.xww, float3(1.0, 1.0, 1.0));
    r16.x = saturate(ps);
    ps = r6.w;
    r15.z = dot(r16.yzz, float3(1.0, 1.0, 1.0));
    r1.w = (r15.z == 0.0) ? r21.x : r21.y;
    r6.x = (r15.y == 0.0) ? r3.x : r3.y;
    ps = 1e+01 * ps;
    r20 = r15.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = saturate(ps);
    r6.x = (r20.y == 0.0) ? r3.z : r6.x;
    r1.w = (r20.z == 0.0) ? r21.z : r1.w;
    r18.y = (r20.w == 0.0) ? r21.w : r1.w;
    r18.w = (r20.x == 0.0) ? r3.w : r6.x;
    ps = r13.z;
    r6.x = max(r18.w, 0.0);
    ps = r5.x * ps;
    r1.w = min(r6.x, 0.3);
    r6.x = ps;
    ps = (-1.0) - -r6.x;
    r18.x = r1.w * 3.3333333;
    r17.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -r18.wxy + 1.0;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r19.yz = r5.zz * r3.yz;
    r13.y = ps;
    ps = r19.z;
    r13.xy = r13.xy * abs(r7.xy);
    ps = r18.y + ps;
    r17.yz = r18.zx + r19.xy;
    r10.w = ps;
    r10 = r10.zxyw * 2.0 + float4(-1.0, -1.0, -1.0, -0.75);
    ps = -r6.w;
    r7.xyw = r17.yzx * r17.zwz;
    r7.y = r7.y * 2.0 + r10.z;
    ps = UniformScalar_8.x + ps;
    r1.w = r7.w + 1.0;
    r7.w = ps;
    ps = abs(r1.w) * abs(r1.w);
    r5.x = r1.w * r3.x;
    r5.y = ps;
    r5.w = r5.x * r5.w - r5.x;
    ps = r12.z + r12.z;
    r11.zw = r5.yz * r5.yw;
    r3.w = ps;
    ps = 0.1 - -r1.y;
    r12.w = r5.x + r11.w;
    r5.x = ps;
    ps = r10.y;
    r3.xyz = r12.wxy * float3(2.5, 4.0, 4.0);
    ps = r7.x + ps;
    r5.yzw = r3.wyz + float3(-1.0, -2.0, -2.0);
    r7.x = ps;
    ps = 0.5 * r5.y;
    r7.yz = -r5.zw + r7.xy;
    r5.y = ps;
    ps = (-0.5) + r3.x;
    r7.x = r10.x - r5.y;
    r9.x = saturate(ps);
    ps = 5.0 * r5.x;
    r12 = r7 * r9.xxxy;
    r16.y = saturate(ps);
    ps = r5.y;
    r5.x = r12.w + r6.w;
    ps = r12.x + ps;
    r5.x = -r5.x + r6.z;
    r8.y = ps;
    ps = r8.y;
    r5.y = max(r5.x, UniformScalar_9.x);
    r5.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.z = min(r5.y, 1.0);
    r5.y = ps;
    ps = (-1.0) + r5.x;
    r16.z = saturate(r5.z * r5.y);
    r15.y = ps;
    ps = (-1.0) + r8.x;
    r7.yzw = -r16.xyz + 1.0;
    r15.z = ps;
    r5.xyz = r15.xyz * r7.wyy;
    r5.x = float((r5.x >= 0.05));
    ps = 1.0 - r5.x;
    r6.yz = r0.wz * UniformVector_3.xy;
    r5.x = ps;
    r5.w = (UniformScalar_8.x > 0.0) ? r5.x : 1.0;
    r5.x = (UniformScalar_8.x >= 0.0) ? r5.w : r5.x;
    ps = (-0.5) - -r5.x;
    r0.xy = r0.xy * 3.0;
    r5.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r13.xy = tex2D(ModShadowAccumTexture, r13.xy).xy;
    r18.xyz = tex2D(Texture2D_5, r9.zw).xyz;
    r17.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_7, r6.yz).xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = saturate(ps);
    ps = UniformVector_2.x * UniformVector_2.w;
    r5.w = float((UniformScalar_4.x >= 1.0));
    r19.x = ps;
    ps = UniformVector_2.y * UniformVector_2.w;
    r6.z = dot(r4.zxy, r4.zxy);
    r19.y = ps;
    ps = UniformVector_2.z * UniformVector_2.w;
    r6.w = float((UniformScalar_4.x > 1.0));
    r19.z = ps;
    r15.xyz = (-abs(r6.www) >= 0.0) ? r15.xyz : 1.0;
    ps = rsqrt(abs(r6.z));
    r16.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r0.w = ps;
    ps = r0.w;
    r17.xyz = r19.xyz * r17.xyz;
    r15.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r15.xyz;
    ps = r4.x * ps;
    r15.yzw = r17.xyz * r15.xyz;
    r15.x = ps;
    ps = UniformScalar_1.x * r7.y;
    r6.zw = r7.zz * ModShadowGroupColor.xy;
    r7.x = ps;
    ps = 1.0 + r5.y;
    r9.zw = r12.yz - 2.0;
    r17.z = ps;
    r9.zw = r7.xx * r11.xy + r9.zw;
    ps = 1.0 + r5.z;
    r3.xy = r9.zw + r3.yz;
    r17.w = ps;
    ps = r3.x;
    r12 = -r6 + 1.0;
    ps = r7.y * ps;
    r5.w = float((r12.y >= 0.004));
    r17.x = ps;
    r5.x = saturate(r12.x * 0.2 + r10.w);
    ps = r3.y;
    r5.xyz = r5.xxx * r18.xyz;
    ps = r7.y * ps;
    r5.xyz = r5.xyz * r8.xxx;
    r17.y = ps;
    r6 = (r7.xyyy > 0.0) ? r17.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r7.xyyy >= 0.0) ? r6 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r0.w;
    r1.w = dot(r6.wyz, r6.wyz);
    ps = r4.y * ps;
    r3.xyz = r15.yzw * r6.xxx;
    r15.y = ps;
    r8.xyz = r3.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r1.w));
    r3.xyz = r3.xyz - r5.xyz;
    r6.x = ps;
    r5.xyz = r3.zxy * r9.xxx + r5.zxy;
    ps = r0.w;
    r6.yzw = r6.yzw * r6.xxx;
    ps = r4.z * ps;
    r3.xyz = r6.www * ConstantLighting.xyz;
    r15.z = ps;
    r4.xyz = r16.xyz * r5.yzx + UniformVector_0.xyz;
    ps = r5.y;
    r13.z = dot(r15.zxy, r6.wyz);
    ps = r0.x * ps;
    r6.x = dot(r6.wyz, r14.zxy);
    r0.x = ps;
    ps = r5.z;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r14.xyz;
    ps = r0.y * ps;
    r7 = r13.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r0.y = ps;
    r11.xy = r7.xy * r12.zw + 0.125;
    ps = r5.x;
    r5.yz = r7.zw + 0.5;
    ps = r0.z * ps;
    r5.x = saturate(dot(r1.yxz, r6.zxy));
    r0.z = ps;
    ps = log2(r5.x);
    r5.yz = abs(r5.zy) * abs(r5.zy);
    r5.x = ps;
    ps = r11.x * r11.y;
    r7.xyz = r0.xzy * r5.zzz;
    r5.z = ps;
    ps = r11.z * r11.z;
    r1.xyz = r0.xzy * r5.yyy;
    r5.y = ps;
    r6.xyz = r5.zzz * r10.xyz + ModShadowColor.xyz;
    r4.xyz = r1.xyz * UpperSkyColor.xzy + r4.xzy;
    ps = 15.0 * r5.x;
    r1.xyz = r5.yyy * r8.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xzy * r9.xxx;
    r6.w = ps;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r4.xzy;
    r4.xyz = r6.www * ConstantLighting.xzy;
    r5.xyz = r4.xyz * r1.xyz + r5.xzy;
    r5.xyz = r3.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
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
