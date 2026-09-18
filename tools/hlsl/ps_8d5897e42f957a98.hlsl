// ps_8d5897e42f957a98.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041400 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
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

    r8.xy = r0.xy * UniformVector_3.xy;
    r11 = tex2D(Texture2D_8, r8.xy);
    ps = (-0.5) + r11.w;
    r7.y = -r1.y + 1.0;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r18.yzw = tex2D(Texture2D_3, r8.xy).xyz;
    r13.x = r1.x * UniformVector_2.x;
    ps = r1.x;
    r0.zw = r1.xy * 6.0;
    ps = UniformVector_1.x * ps;
    r17.yzw = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = r1.y;
    r1.w = dot(r4.zxy, r4.zxy);
    ps = UniformVector_1.y * ps;
    r8.z = r5.w - 4e+02;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.w = r2.z + 0.1;
    r1.z = ps;
    ps = rsqrt(abs(r1.w));
    r10.zw = saturate(r8.wz * float2(5.0, 0.00022222222));
    r1.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r9.xyz = r1.www * r4.xyz;
    r7.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r1.w = r10.w * (-0.025);
    r17.x = ps;
    r12.zw = r9.xy * r1.ww + r7.xw;
    r7.x = -r12.w * r17.x + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r7.yxz * UniformVector_2.yyx;
    r1.w = ps;
    ps = r13.w;
    r1.zw = r1.zw * abs(r6.xy);
    ps = r12.z * ps;
    r4.xyz = r13.zxy - 0.5;
    r18.x = ps;
    r20.x = float((r18.x >= 0.5));
    r20.yzw = float3((r13.xzy >= 0.5));
    r6.yzw = r4.xzy - r13.zyx;
    r7 = r18.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r6.x = r7.x - r18.x;
    r4.x = r6.x * r20.x + r18.x;
    r4.yzw = r6.ywz * r20.zyw + r13.zxy;
    r4 = r4.zwxy + r4.zwxy;
    r13 = tex2D(Texture2D_1, r4.xy);
    r19 = tex2D(Texture2D_1, r4.zw);
    r10.y = tex2D(Texture2D_4, r8.xy).x;
    r8.xy = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r4.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r6.xyz = tex2D(Texture2D_0, r12.zw).xyz;
    r16.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r7.x = UniformScalar_4.x * UniformScalar_3.x;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r12.xy = r1.xy * UniformVector_5.xy;
    r0.w = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r8.zw = r4.xy * 2.0 - 1.0;
    r0.z = (-abs(r0.z) >= 0.0) ? 1.0 : (-1.0);
    r10.x = (-abs(r0.w) >= 0.0) ? (-1.0) : r0.z;
    r8 = r8.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    ps = r5.w;
    r1.xw = -r10.zy + 1.0;
    ps = 0.0001 * ps;
    r15.xy = r1.xx * ModShadowGroupColor.xy;
    r15.z = saturate(ps);
    ps = r16.x + r16.x;
    r4.xyw = -r15.xyz + 1.0;
    r15.z = ps;
    ps = r16.y + r16.y;
    r15.xy = r8.xw * r4.xy;
    r15.w = ps;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    ps = r6.x + r6.x;
    r14.y = dot(r20.yww, float3(1.0, 1.0, 1.0));
    r16.x = ps;
    r14.x = r20.z * 2.0 + r20.x;
    r1.y = (r14.x == 0.0) ? r19.x : r19.y;
    r0.z = (r14.y == 0.0) ? r13.x : r13.y;
    ps = r6.y + r6.y;
    r7.yzw = r7.zyw + r18.ywz;
    r16.y = ps;
    ps = r4.z;
    r7.yzw = r7.ywz + float3(-1.0, -1.0, 0.0);
    ps = r16.z * ps;
    r18 = r14.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r0.w = ps;
    r0.z = (r18.z == 0.0) ? r13.z : r0.z;
    r1.y = (r18.y == 0.0) ? r19.z : r1.y;
    r16.w = (r18.x == 0.0) ? r19.w : r1.y;
    r1.x = (r18.w == 0.0) ? r13.w : r0.z;
    ps = (-1.0) - -r0.w;
    r7 = r7 * r10.xxyy;
    r8.x = ps;
    ps = floor(r7.x);
    r0.z = max(r1.x, 0.0);
    r1.z = ps;
    ps = 1.0 / UniformScalar_1.x;
    r0.z = min(r0.z, 0.3);
    r8.w = ps;
    ps = 3.3333333 * r0.z;
    r8.yz = r15.zw + r8.yz;
    r1.y = ps;
    ps = r6.z + r6.z;
    r8 = r1.yyzy * r8.yzwx;
    r16.z = ps;
    ps = r8.z;
    r13 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r0.x + ps;
    r14.y = r8.y + r7.z;
    r1.y = ps;
    r14.x = r7.y * r10.y + r8.x;
    ps = 1.0 / r5.w;
    r14.xy = -r13.xy + r14.xy;
    r0.z = ps;
    r5.xy = r14.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r15.x * r15.y;
    r1.z = r0.y + UniformScalar_8.x;
    r0.z = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r15.xyz = tex2D(Texture2D_6, r12.zw).xyz;
    r5.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r12 = tex2D(Texture2D_5, r1.yz);
    ps = UniformVector_4.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r0.y = float((UniformScalar_11.x >= 1.0));
    r19.x = ps;
    ps = UniformVector_4.y;
    r1.y = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r1.z = float((UniformScalar_11.x > 1.0));
    r19.y = ps;
    ps = UniformVector_4.z;
    r0.x = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r18.xyz = r12.xyz * r12.www;
    r19.z = ps;
    r12.xyz = (-abs(r1.zzz) >= 0.0) ? r5.xyz : 1.0;
    ps = rsqrt(abs(r1.y));
    r3.xyz = r11.xyz * UniformScalar_12.xxx;
    r1.y = ps;
    ps = 1.0 - r0.x;
    r5.xyz = r1.yyy * r2.xyz;
    r0.x = saturate(ps);
    r12.xyz = (-abs(r0.yyy) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r0.x);
    r2.xyz = r19.xyz * r18.xyz;
    r0.y = ps;
    r10.xyz = r2.xyz * r10.yyy;
    r3.xyz = r3.xyz * r12.xyz + UniformScalar_13.xxx;
    r2.xyz = r0.zzz * r17.yzw + ModShadowColor.xyz;
    ps = 1.0 - r1.x;
    r0.x = r13.w + r16.w;
    r1.x = ps;
    ps = 2.5 * r1.x;
    r0.x = saturate(r0.x - r0.w);
    r1.z = ps;
    ps = -r13.z;
    r8.xyz = r0.xxx * r15.xyz;
    ps = r7.w + ps;
    r1.y = r8.w + 1.0;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r0.zw = r1.yz * r1.xy;
    r10.w = ps;
    ps = (-0.5) + r0.w;
    r0.x = float((r0.z > 0.9));
    r0.z = saturate(ps);
    r6.xy = r14.xy * r0.zz + r13.xy;
    r10.xyz = r10.xyz * r0.xxx - r8.xyz;
    r10.xyz = r12.xyz * r11.xyz + r10.xyz;
    r8.xyz = r10.xyz * r0.zzz + r8.xyz;
    r0.x = r10.w * r0.z - 2.0;
    r6.z = r6.z * 2.0 + r0.x;
    r1.xyz = r6.zxy * r4.www;
    ps = 1.0 + r1.x;
    r3.xyz = r3.xyz * r1.www;
    r1.w = ps;
    r1.xyz = (r4.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r4.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r3.xyz = r3.xyz * r0.zzz;
    r0.x = ps;
    r6.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r6.zxy, r9.zxy);
    r0.xzw = r6.xyz * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r9.xyz;
    r0.x = saturate(dot(r5.zxy, r0.wxz));
    ps = log2(r0.x);
    r1.yzw = r8.xyz * r7.xyz;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.z = r0.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.z);
    r1.x = saturate(dot(r6.zyx, r5.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r3.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r2.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
