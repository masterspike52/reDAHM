// ps_18bd0e2d7edeeba4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041400 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r12.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r13.x = r1.x * UniformVector_2.x;
    r10.y = UniformScalar_2.x * UniformVector_6.y;
    ps = UniformVector_6.y;
    r8.xy = r1.xy * UniformVector_7.xy;
    ps = UniformScalar_5.x * ps;
    r19.x = -r1.y + 1.0;
    r10.w = ps;
    ps = OpacityOverride.x;
    r1.w = UniformVector_4.x * UniformScalar_4.x;
    r9.z = saturate(ps);
    ps = UniformScalar_1.x;
    r9.xy = r1.xy * UniformVector_1.xy;
    ps = UniformVector_4.x * ps;
    r9.w = saturate(r3.w * 0.0001);
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = r3.w - 4e+02;
    r8.z = ps;
    ps = 0.00022222222 * r0.z;
    r0.w = dot(r4.zxy, r4.zxy);
    r11.x = saturate(ps);
    r11.yz = r7.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.yz = -r9.zw + 1.0;
    r8.w = ps;
    ps = UniformVector_6.x * r1.z;
    r0.z = dot(r2.zxy, r2.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r0.z));
    r8.zw = r8.zw * abs(r6.xy);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r2.xyz = r0.zzz * r2.xzy;
    r0.z = ps;
    ps = 0.1 - -r2.y;
    r6.yzw = r0.zzz * r4.xyz;
    r0.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r4.xzw = r11.xyz * float3(-0.025, 0.5, 0.5);
    r0.w = ps;
    r9.xy = r6.yz * r4.xx + r9.xy;
    ps = 5.0 * r0.z;
    r9.z = r9.y * r0.w;
    r9.w = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r19.yw = -r9.zw + 1.0;
    r19.z = ps;
    ps = UniformVector_6.x * r1.w;
    r13.yzw = r19.xyz * UniformVector_2.yyx;
    r10.z = ps;
    ps = r13.w;
    r11 = r10 + r0.xyxy;
    ps = r9.x * ps;
    r10.xyz = r13.zxy - 0.5;
    r3.x = ps;
    ps = (-0.5) - -r3.x;
    r17.xyz = float3((r13.xyz >= 0.5));
    r0.z = ps;
    ps = r0.z;
    r10.yzw = r10.yzx - r13.xyz;
    ps = -r3.x + ps;
    r4.xy = float2((r3.xy >= float2(0.5, 0.004)));
    r0.z = ps;
    r10.x = r0.z * r4.x + r3.x;
    r10.yzw = r10.wyz * r17.zxy + r13.zxy;
    r10 = r10.zwxy + r10.zwxy;
    r16.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15 = tex2D(Texture2D_1, r10.zw);
    r10 = tex2D(Texture2D_1, r10.xy).wyzx;
    r18 = tex2D(Texture2D_4, r11.xy);
    r20 = tex2D(Texture2D_5, r11.zw);
    r13.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r8.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r0.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r11.xyz = UniformVector_5.xyz * 2e+01;
    r1.w = float((UniformScalar_8.x >= 1.0));
    r0.z = float((UniformScalar_8.x > 1.0));
    r9.xyz = r0.wxy * 2.0 - 1.0;
    r0.xy = r8.xy * 2.0 - 1.0;
    r13.xyz = (-abs(r0.zzz) >= 0.0) ? r13.xyz : 1.0;
    ps = r7.w;
    r8.xyz = r12.xyz * UniformScalar_9.xxx;
    ps = r8.w * ps;
    r1.xyz = r20.xyz * r20.www;
    r0.z = ps;
    r1.xyz = r18.xyz * r18.www + r1.xyz;
    r13.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r13.xyz;
    r8.xyz = r8.xyz * r13.xyz + UniformScalar_10.xxx;
    ps = (-1.0) - -r0.z;
    r16.w = r0.x + r4.z;
    r18.x = ps;
    ps = r0.y;
    r11.xyz = r11.xyz * r1.xyz;
    ps = r4.w + ps;
    r1.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r18.w = ps;
    ps = r1.x;
    r6.x = dot(r5.zxy, r5.zxy);
    r18.yz = -r19.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r11.x + ps;
    r1.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r4.w = ps;
    r4.z = (r1.x == 0.0) ? r10.w : r10.y;
    r1.y = r17.z * 2.0 + r4.x;
    r2.w = (r1.y == 0.0) ? r15.x : r15.y;
    ps = r4.w;
    r1 = r1.xxyy + float4(-2.0, -3.0, -2.0, -3.0);
    r1.x = (r1.x == 0.0) ? r10.z : r4.z;
    r2.w = (r1.z == 0.0) ? r15.z : r2.w;
    r10.w = (r1.w == 0.0) ? r15.w : r2.w;
    r0.x = (r1.y == 0.0) ? r10.x : r1.x;
    ps = r11.x + ps;
    r1.x = max(r0.x, 0.0);
    r15.x = saturate(ps);
    ps = r1.x;
    r10.xyz = r7.zxy + r7.zxy;
    r1.x = ps;
    ps = 0.3;
    r7 = r10.xwzy + float4(-1.0, 0.25, -1.0, -1.0);
    r1.y = ps;
    ps = min(r1.x, r1.y);
    r15.yzw = r7.xzw * UniformVector_4.zyx;
    r14.x = ps;
    r7.xw = -r15.zw * r15.xx + r15.zw;
    ps = 1.0 - r0.x;
    r17.yzw = r14.xyz * float3(3.3333333, 0.875, 0.875);
    r1.x = ps;
    r14.y = r17.y * r18.w + r7.x;
    r1.yzw = r17.yzw * r18.xyz + float3(1.0, 0.125, 0.125);
    ps = 2.5 * r1.x;
    r0.xy = -r15.xy + 1.0;
    r2.w = ps;
    r14.z = r0.y * r15.x + r15.y;
    ps = rsqrt(abs(r6.x));
    r4.xzw = r8.xyz * r0.xxx;
    r6.x = ps;
    ps = r7.y;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = r10.w + ps;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = r7.y;
    r10.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    ps = -r0.z + ps;
    r7.xyz = r6.xxx * r5.xyz;
    r17.x = saturate(ps);
    r2.w = saturate(r2.w * r1.y - 0.5);
    r5 = r17.xxxy * r16;
    r0.xy = r1.yz * r1.xw;
    r1.xyz = r0.yyy * r15.xyz + ModShadowColor.xyz;
    ps = r7.w;
    r0.z = float((r0.x > 0.9));
    ps = r5.w + ps;
    r11.xyz = r11.xzy * r0.zzz;
    r14.x = ps;
    r0.xyz = -r9.xyz + r14.zxy;
    r0.yz = r0.yz * r2.ww + r9.yz;
    r9.xyz = r11.xyz * r2.www + UniformVector_0.xzy;
    r11.xyz = r13.xzy * r12.xzy + r11.xyz;
    r0.x = r0.x * r2.w - 2.0;
    r0.x = r0.w * 2.0 + r0.x;
    r11.xyz = r11.xyz - r5.xzy;
    r5.xyz = r11.xyz * r2.www + r5.xzy;
    r9.xyz = r10.xyz * r5.xzy + r9.xzy;
    r0.xyz = r0.xyz * r3.zzz;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r3.zzz > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r3.zzz >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r5.xyz = r5.xzy * r8.xyz;
    r0.x = ps;
    ps = r4.x;
    r0.xyz = r0.yzw * r0.xxx;
    ps = r2.w * ps;
    r0.w = dot(r0.zxy, r6.wyz);
    r6.x = ps;
    ps = r4.w;
    r8.xyz = r0.xyz * r0.www;
    r6.yzw = r8.xyz * 2.0 - r6.yzw;
    ps = r2.w * ps;
    r0.w = saturate(dot(r2.yxz, r6.wyz));
    r6.y = ps;
    ps = log2(r0.w);
    r2.x = dot(r7.zxy, r0.zxy);
    r2.y = ps;
    ps = r4.z;
    r0.xyw = r2.xxy * float3(-0.5, 0.5, 15.0);
    ps = r2.w * ps;
    r2.xy = r0.xy + 0.5;
    r6.z = ps;
    ps = pow(2.0, r0.w);
    r0.xy = abs(r2.xy) * abs(r2.xy);
    r0.w = ps;
    ps = ConstantLighting.x * r0.w;
    r2.xyz = r0.zzz * ConstantLighting.xyz;
    r7.x = ps;
    ps = ConstantLighting.z * r0.w;
    r8.xyz = r5.xzy * r0.xxx;
    r7.y = ps;
    ps = ConstantLighting.y * r0.w;
    r0.xyz = r5.xzy * r0.yyy;
    r7.z = ps;
    r0.xyz = r0.xyz * UpperSkyColor.xzy + r9.xzy;
    r0.xyz = r8.xzy * LowerSkyColor.xyz + r0.xzy;
    r0.xyz = r7.xyz * r6.xyz + r0.xzy;
    r0.xyz = r2.xyz * r5.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xzy * r1.xzy;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xzy - r0.xzy;
    r1.w = ps;
    oC0.w = r1.w * r4.y + r3.w;
    r0.xyz = r1.xyz * r4.yyy + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
