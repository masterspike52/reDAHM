// ps_a7e8ea572c3d35ce.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10040A00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 ModShadowAccumResolution : register(c33); // float2
float4 ModShadowColor : register(c31); // float3
float4 ModShadowGroupColor : register(c32); // float3
float4 OpacityOverride : register(c30); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c14); // float
float4 UniformScalar_1 : register(c15); // float
float4 UniformScalar_2 : register(c16); // float
float4 UniformScalar_27 : register(c20); // float
float4 UniformScalar_34 : register(c21); // float
float4 UniformScalar_35 : register(c22); // float
float4 UniformScalar_36 : register(c23); // float
float4 UniformScalar_37 : register(c24); // float
float4 UniformScalar_38 : register(c25); // float
float4 UniformScalar_39 : register(c26); // float
float4 UniformScalar_4 : register(c17); // float
float4 UniformScalar_40 : register(c27); // float
float4 UniformScalar_41 : register(c28); // float
float4 UniformScalar_42 : register(c29); // float
float4 UniformScalar_8 : register(c18); // float
float4 UniformScalar_9 : register(c19); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
float4 UniformVector_7 : register(c10); // float4
float4 UniformVector_8 : register(c11); // float4
float4 UniformVector_9 : register(c12); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.zw = r0.xy * UniformScalar_1.xx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = UniformVector_3.xy * UniformScalar_8.xx;
    r5.y = ps;
    r5.zw = r5.zw * UniformScalar_4.xx + r0.xy;
    r5.xy = r5.xy * abs(r7.xy);
    r7 = r5.zwzw * float4(1.09, 1.09, 1.03, 1.03);
    r0 = r5.zwzw * float4(1.07, 1.07, 1.01, 1.01);
    r6.xw = r0.xy * UniformScalar_9.xx + UniformVector_6.xy;
    r4.xy = r7.xy * UniformScalar_9.xx + UniformVector_7.xy;
    r6.yz = r7.zw * UniformScalar_27.xx + UniformVector_9.xy;
    r5.zw = r0.zw * UniformScalar_27.xx + UniformVector_8.xy;
    r0.xy = r7.zw * UniformScalar_9.xx + UniformVector_5.xy;
    r0.zw = r0.zw * UniformScalar_9.xx + UniformVector_4.xy;
    r7.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r4.w = tex2D(Texture2D_0, r4.zw).x;
    r0.xyw = tex2D(Texture2D_1, r0.xy).zxy;
    r5.zw = tex2D(Texture2D_2, r5.zw).xy;
    r6.yz = tex2D(Texture2D_2, r6.yz).xy;
    r9.xyz = tex2D(Texture2D_1, r4.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r6.xw).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    r9.z = r9.z * 2.0 + r4.z;
    ps = rsqrt(abs(r6.x));
    r6.yz = r6.yz + r6.yz;
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = r6.x * r1.z;
    r6.w = ps;
    r8.xyz = r6.www * r3.xzy;
    ps = OpacityOverride.x;
    r6.xyz = r6.xyz + float3(0.1, -2.0, -2.0);
    r1.y = saturate(ps);
    ps = 5.0 * r6.x;
    r1.z = max(r8.y, 0.0);
    r1.x = saturate(ps);
    r5.zw = r5.zw * 2.0 + r6.yz;
    r5.zw = r5.zw * UniformScalar_34.xx + r9.xy;
    ps = 0.875 * r5.x;
    r6.xyz = -r1.zyx + 1.0;
    r1.z = ps;
    ps = 0.875 * r5.y;
    r9.xy = r5.zw + r9.xy;
    r1.w = ps;
    ps = abs(r6.x) * abs(r6.x);
    r5.xyz = r9.xyz + r4.xyz;
    r0.z = ps;
    ps = r5.z;
    r6.w = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    ps = r0.x + ps;
    r5.xy = r5.xy + r4.xy;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r4.xyz = r5.xyz + r0.ywx;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.yz = r4.xy + r0.yw;
    r0.y = ps;
    ps = (-4.0) + r5.y;
    r1.xy = -r8.xz * 1.8;
    r3.x = ps;
    ps = (-4.0) + r5.z;
    r5.xy = r4.zw + float2(-4.0, -1.0);
    r3.y = ps;
    ps = UniformScalar_2.x * r5.y;
    r0.xyz = -r0.zxy + 1.0;
    r4.z = ps;
    ps = r5.x;
    r4.xy = r1.zw * r0.yz;
    ps = r7.z + ps;
    r5.yzw = r4.zxy + float3(1.0, 0.125, 0.125);
    r3.z = ps;
    r4.yzw = r3.zxy + r7.zxy;
    ps = UniformScalar_35.x * r5.y;
    r0.yz = r4.zw + r7.xy;
    r1.z = ps;
    ps = 1.0 - r5.y;
    r1.xyz = r1.xyz * r0.xxx;
    r0.x = ps;
    r0 = r1.xyzz * r0.xxzy;
    ps = r0.y + r0.z;
    r5.x = r0.x + r0.w;
    r4.x = ps;
    ps = rsqrt(abs(r6.w));
    r3.xw = r5.xz * r5.xw;
    r6.w = ps;
    r0.x = dot(r4.yx, r4.yx) + r3.x;
    ps = rsqrt(abs(r0.x));
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = ps;
    ps = r5.x;
    r9.yzw = r6.www * UniformVector_2.xyz;
    ps = r0.y * ps;
    r0.zw = r4.xy * r0.yy;
    r9.x = ps;
    r1.w = dot(r8.yz, r0.wz) + 0.0;
    r1.xyz = r8.xxz * r9.xyz;
    r1.xw = r1.xy + r1.wz;
    r5.y = r1.x * 0.5 + 0.5;
    ps = abs(r5.y) * abs(r5.y);
    r5.y = ps;
    r5.y = -r5.y * r5.y + 1.0;
    ps = log2(abs(r5.y));
    r5.y = ps;
    ps = UniformScalar_39.x * r5.y;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r0.x = ps;
    ps = 1.0 - r0.x;
    r6.w = ps;
    ps = log2(abs(r6.w));
    r7 = r9.ywzw * r0.yyyw;
    r1.z = ps;
    r6.w = r9.z * r0.z + r7.w;
    r1.y = r9.y * r9.x + r6.w;
    r10.yzw = r0.zwx * r1.yyz;
    ps = pow(2.0, r10.w);
    r10.x = r9.x * r1.y;
    r6.w = ps;
    r1.xyz = tex2D(Texture2D_3, r6.ww).xyz;
    r4.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r5.xxx : r4.yyx;
    r0.xyz = r3.www * r3.xyz + ModShadowColor.xyz;
    ps = log2(abs(r1.w));
    r3.xyz = UniformVector_1.xzy * UniformScalar_0.xxx;
    r5.y = ps;
    ps = UniformScalar_36.x * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.w = r2.z - UniformScalar_41.x;
    r5.y = ps;
    r5.xzw = r10.xyz * 2.0 - r9.yzw;
    ps = UniformScalar_37.x * r5.y;
    r9.xyz = -r5.xzw + r8.xzy;
    r5.y = ps;
    r5.yzw = r5.yyy * r9.xyz + r5.xzw;
    ps = 1.0 / UniformScalar_42.x;
    r5.x = dot(r5.wyz, r5.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r6.w = saturate(r0.w * r6.w);
    r5.x = ps;
    r5.xyz = r5.yzw * r5.xxx;
    r5.x = saturate(dot(r5.zxy, r8.yxz));
    ps = log2(r5.x);
    r5.w = float((r6.y >= 0.004));
    r5.y = ps;
    ps = UniformScalar_38.x * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.x = saturate(dot(r7.yzx, r4.yzx));
    r5.x = ps;
    r5.xyz = r3.xzy * r5.xxx;
    r5.xyz = r1.xzy * UniformScalar_40.xxx + r5.xzy;
    r5.xyz = r6.xxx * r1.xyz + r5.xzy;
    r6.xyz = -r5.xyz + UniformVector_10.xyz;
    r5.xyz = r6.www * r6.xyz + r5.xyz;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r0.xyz;
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
