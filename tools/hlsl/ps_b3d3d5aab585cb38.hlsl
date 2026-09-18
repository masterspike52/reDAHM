// ps_b3d3d5aab585cb38.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041600 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_7, r0.xy).xzyw;
    ps = 0.1 - -r2.z;
    r0.w = ps;
    ps = r5.w;
    r1.zw = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r3.x = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r3.x));
    r2.w = r7.w - 0.5;
    r3.x = ps;
    ps = 5.0 * r0.w;
    r8.xyz = r3.xxx * r4.xyz;
    r3.y = saturate(ps);
    ps = 0.00022222222 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    r3.x = saturate(ps);
    ps = (-0.025) * r3.x;
    r0.z = ps;
    r10.xy = r8.xy * r0.zz + r1.zw;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    ps = r1.x;
    r11.xy = r1.xy * UniformVector_7.xy;
    ps = UniformVector_2.x * ps;
    r1.zw = r1.xy * 6.0;
    r12.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.y = -r1.y + 1.0;
    r2.w = ps;
    ps = 1.0 / r5.w;
    r3.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r0.zw = r3.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.z = r10.y * r2.w;
    r10.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r9.xw = -r3.zy + 1.0;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.yzw = r9.yxz * UniformVector_2.yyx;
    r10.w = ps;
    ps = r12.w;
    r3.xy = r10.zw * abs(r6.xy);
    ps = r10.x * ps;
    r13.xyz = r12.zxy - 0.5;
    r6.w = ps;
    ps = r4.x + r4.x;
    r17.x = float((r6.w >= 0.5));
    r6.x = ps;
    ps = r4.y + r4.y;
    r17.yzw = float3((r12.xzy >= 0.5));
    r6.y = ps;
    ps = r4.w + r4.w;
    r14.yzw = r13.xzy - r12.zyx;
    r6.z = ps;
    r13 = r6 + float4(-1.0, -1.0, -1.0, -0.5);
    r14.x = r13.w - r6.w;
    r6.x = r14.x * r17.x + r6.w;
    r6.yzw = r14.ywz * r17.zyw + r12.zxy;
    r6 = r6.zwxy + r6.zwxy;
    r10.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r16 = tex2D(Texture2D_1, r6.xy);
    r18 = tex2D(Texture2D_1, r6.zw);
    r20.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r19 = tex2D(Texture2D_5, r0.xy);
    r6 = tex2D(Texture2D_4, r0.xy);
    r22.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r14.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyw = tex2D(Texture2D_2, r1.zw).xyw;
    r0.xzw = tex2D(LightAttenuationTexture, r0.zw).yxz;
    r1.xyz = tex2D(Texture2D_2, r1.xy).wxy;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r15.w = saturate(r5.w * 0.0001);
    r3.x = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r2.w = ps;
    ps = UniformVector_5.x;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r21.xyz = UniformVector_6.xzy * 2e+01;
    r12.x = ps;
    ps = UniformVector_5.z;
    r3.y = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r12.y = ps;
    ps = UniformVector_5.y;
    r1.w = float((UniformScalar_8.x > 1.0));
    ps = 2e+01 * ps;
    r3.zw = r1.yz + r1.yz;
    r12.z = ps;
    r20.zw = r11.xy * 2.0 - 1.0;
    ps = r7.z;
    r14.yzw = r14.xyz + r14.xyz;
    r0.y = ps;
    r1.yzw = (-abs(r1.www) >= 0.0) ? r22.xyz : 1.0;
    ps = UniformScalar_9.x * r0.y;
    r11.xyz = r6.xzy * r6.www;
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r19.xyz = r19.xzy * r19.www;
    r0.y = ps;
    ps = UniformScalar_9.x * r7.y;
    r5.xyz = r0.yyy * r2.xyz;
    r6.y = ps;
    ps = r11.w;
    r19.xyz = r21.xyz * r19.xyz;
    ps = r1.x * ps;
    r2.xyz = r12.xyz * r11.xyz;
    r1.x = ps;
    r1.yzw = (-abs(r3.yyy) >= 0.0) ? 1.0 : r1.yzw;
    ps = (-1.0) - -r1.x;
    r6.yz = r6.xy * r1.zw;
    r11.x = ps;
    r11.yzw = (-abs(r2.www) >= 0.0) ? r19.yxz : r2.yxz;
    r12.xyz = (abs(r2.www) > 0.0) ? r2.xzy : r19.xzy;
    ps = UniformScalar_9.x * r1.y;
    r2 = r20.xwzy * float4(0.875, 0.5, 0.5, 0.875);
    r0.y = ps;
    r12.xyz = (abs(r3.xxx) > 0.0) ? r12.xyz : r19.xzy;
    r11.yzw = (-abs(r3.xxx) >= 0.0) ? r19.yxz : r11.yzw;
    ps = r0.y;
    r11.w = saturate(dot(r11.wyz, float3(0.59, 0.11, 0.3)));
    ps = r7.x * ps;
    r0.y = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = r0.y;
    r6.xyz = r6.xyz + UniformScalar_10.xxx;
    r3.xy = -r9.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r12.x + ps;
    r3.xy = r2.xw * r3.xy;
    r0.y = ps;
    ps = r0.y;
    r3 = r3 + float4(0.125, 0.125, -1.0, -1.0);
    ps = r12.x + ps;
    r9.z = dot(r17.yww, float3(1.0, 1.0, 1.0));
    r9.y = saturate(ps);
    r9.x = r17.z * 2.0 + r17.x;
    ps = r3.z;
    r0.y = r3.x * r3.y;
    r3.xyz = r0.yyy * r15.xyz + ModShadowColor.xyz;
    r5.w = (r9.x == 0.0) ? r18.x : r18.y;
    r0.y = (r9.z == 0.0) ? r16.x : r16.y;
    ps = r2.z + ps;
    r17 = r9.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r11.y = ps;
    r0.y = (r17.z == 0.0) ? r16.z : r0.y;
    r5.w = (r17.y == 0.0) ? r18.z : r5.w;
    r14.x = (r17.x == 0.0) ? r18.w : r5.w;
    r9.x = (r17.w == 0.0) ? r16.w : r0.y;
    ps = r3.w;
    r0.y = max(r9.x, 0.0);
    ps = r2.y + ps;
    r2.xw = -r9.xy + 1.0;
    r11.z = ps;
    ps = 2.5 * r2.x;
    r0.y = min(r0.y, 0.3);
    r2.z = ps;
    ps = 3.3333333 * r0.y;
    r16 = r14 + float4(0.25, -1.0, -1.0, -1.0);
    r9.y = ps;
    ps = r16.x;
    r6.xyz = r6.xyz * r2.www;
    ps = r14.x + ps;
    r15.xyz = r16.yzw * UniformVector_4.xyz;
    r0.y = ps;
    r14.xy = -r15.xy * r11.ww + r15.xy;
    ps = r0.y;
    r9.xz = -r15.zw + 1.0;
    ps = -r1.x + ps;
    r11 = r9.yyxy * r11.yzwx;
    r0.y = saturate(ps);
    ps = r15.z;
    r10.xyz = r0.yyy * r10.xyz;
    ps = r11.z + ps;
    r2.y = r11.w + 1.0;
    r11.z = ps;
    ps = r2.y * r2.x;
    r11.xy = r14.xy + r11.xy;
    r0.y = ps;
    ps = r2.z * r2.y;
    r11.xyw = -r13.xyz + r11.xyz;
    r1.x = ps;
    ps = (-0.5) + r1.x;
    r0.y = float((r0.y > 0.9));
    r2.x = saturate(ps);
    r2.yz = r11.xy * r2.xx + r13.xy;
    r11.xyz = r0.yyy * r12.xyz - r10.xyz;
    r0.y = r11.w * r2.x - 2.0;
    r2.w = r4.w * 2.0 + r0.y;
    r1.xyz = r1.yzw * r7.xzy + r11.xyz;
    r7.xyz = r1.xyz * r2.xxx + r10.xyz;
    r1.xyz = r2.wyz * r9.zzz;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r9.zzz > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r9.zzz >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.y));
    r2.xyz = r6.xyz * r2.xxx;
    r0.y = ps;
    r6.xyz = r1.xyz * r0.yyy;
    r0.y = dot(r6.zxy, r8.zxy);
    r1.xyz = r6.xyz * r0.yyy;
    r1.xyz = r1.xyz * 2.0 - r8.xyz;
    ps = LightColor.x * r0.z;
    r0.y = saturate(dot(r5.zxy, r1.zxy));
    r1.x = ps;
    ps = log2(r0.y);
    r4.xyz = r7.xyz * r4.xyz;
    r0.y = ps;
    ps = LightColor.y * r0.x;
    r0.y = r0.y * 15.0;
    r1.y = ps;
    ps = pow(2.0, r0.y);
    r1.w = saturate(dot(r6.zyx, r5.zyx));
    r0.y = ps;
    ps = LightColor.z * r0.w;
    r2.xyz = r2.xyz * r0.yyy;
    r1.z = ps;
    r0.xy = r4.xy * r1.ww + r2.xy;
    r0.z = r4.z * r1.w + r2.z;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xzy * r3.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
