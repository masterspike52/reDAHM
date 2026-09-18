// ps_755811024246fb60.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006A8 10041200 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c18); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9.z = r1.x * UniformVector_2.x;
    r1.w = -r1.y + 1.0;
    ps = r1.x + r1.x;
    r1.z = r5.w - 4e+02;
    r10.x = ps;
    ps = r1.y + r1.y;
    r8.xy = r1.xy * UniformVector_1.xy;
    r10.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r10.z = saturate(r1.z * 0.00022222222);
    r0.w = ps;
    ps = UniformVector_2.x * r0.z;
    r7.xyz = r0.www * r4.xyz;
    r0.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r11.xyz = r10.xyz * float3(6.0, 6.0, -0.1);
    r0.z = ps;
    r8.xy = r7.xy * r11.zz + r8.xy;
    ps = r0.w;
    r8.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.z = -r8.y * r0.z + 1.0;
    ps = r8.x * ps;
    r9.yw = r1.zw * UniformVector_2.yy;
    r9.x = ps;
    r12 = r9 - 0.5;
    r4 = float4((r9.xywz >= 0.5));
    r12 = r12.xywz - r9.xywz;
    r9 = r12.xywz * r4.xywz + r9;
    r9 = r9 + r9;
    r15 = tex2D(Texture2D_3, r9.zw);
    r12.yzw = tex2D(Texture2D_4, r11.xy).xyw;
    r11.xyz = tex2D(Texture2D_4, r10.xy).wxy;
    r11.w = UniformScalar_1.x * UniformVector_4.x;
    r14.xy = r1.xy * UniformVector_8.xy;
    ps = 1.0 / r5.w;
    r10.xw = UniformVector_1.xy + UniformVector_1.xy;
    r1.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r1.xy - r0.xy;
    r12.x = ps;
    r10.yz = r11.yz * 2.0 - 1.0;
    r11.yz = r12.yz * 2.0 - 1.0;
    r0.zw = r0.zw * UniformScalar_4.xx + r0.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = r12.w * r11.x;
    r12.y = ps;
    ps = (-1.0) - -r1.z;
    r13.xy = r10.xw * r1.xy;
    r10.x = ps;
    r1.yw = r8.zw * r1.ww + ScreenPositionScaleBias.wz;
    ps = UniformVector_6.x * r0.z;
    r17.x = dot(r4.xyy, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    ps = UniformVector_6.y * r0.w;
    r17.y = dot(r4.wzz, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r0.w = (r17.y == 0.0) ? r15.x : r15.y;
    ps = r12.x;
    r4 = r17.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r0.w = (r4.x == 0.0) ? r15.z : r0.w;
    r3.w = (r4.y == 0.0) ? r15.w : r0.w;
    ps = abs(r6.x) * ps;
    r0.w = max(r3.w, 0.0);
    r13.z = ps;
    ps = r12.y;
    r11.x = min(r0.w, 0.3);
    ps = abs(r6.y) * ps;
    r11.xyz = r11.xyz * float3(3.3333333, 0.5, 0.5);
    r13.w = ps;
    ps = 1.0 / UniformScalar_2.x;
    r10.yz = r10.yz + r11.yz;
    r10.w = ps;
    ps = UniformVector_7.y + r0.z;
    r12 = r11.xwxx * r10.xwyz;
    r0.w = ps;
    r0.z = r12.y * UniformScalar_3.x + r1.x;
    r6.xyz = tex2D(LightAttenuationTexture, r1.yw).xyz;
    r11 = tex2D(Texture2D_2, r13.xy).wxyz;
    r10.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r15 = tex2D(Texture2D_3, r9.xy);
    r9 = tex2D(Texture2D_7, r0.zw);
    r16.xyz = tex2D(Texture2D_9, r14.xy).xyz;
    r1.xyw = tex2D(Texture2D_5, r0.xy).xyz;
    r14 = tex2D(Texture2D_6, r0.xy);
    r0.yw = tex2D(ModShadowAccumTexture, r13.zw).xy;
    r13.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    r18.xyz = UniformVector_5.xyz * 2e+01;
    ps = r5.w;
    r2.w = float((UniformScalar_17.x >= 1.0));
    ps = 0.0001 * ps;
    r5.w = float((UniformScalar_17.x > 1.0));
    r4.y = saturate(ps);
    ps = r2.z;
    r0.z = dot(r3.zxy, r3.zxy);
    r13.yzw = r13.zxy * 2.0 - 1.0;
    ps = 0.1 + ps;
    r5.xyz = r14.zxy * UniformScalar_18.xxx;
    r0.x = ps;
    r1.xyw = r1.wxy * 2.0 - 1.0;
    r16.xyz = (-abs(r5.www) >= 0.0) ? r16.xyz : 1.0;
    ps = 5.0 * r0.x;
    r9.xyz = r9.xyz * r9.www;
    r3.x = saturate(ps);
    ps = r14.w;
    r9.xyz = r18.xyz * r9.xyz;
    r0.x = ps;
    r16.yzw = (-abs(r2.www) >= 0.0) ? 1.0 : r16.xyz;
    r5.xyz = r5.xyz * r16.wyz + UniformScalar_19.xxx;
    ps = 1.0 - r0.x;
    r9 = r9.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r0.x = ps;
    r16.x = dot(r9.yx, r0.xx) + 0.0;
    ps = 0.875 * r0.y;
    r9.xyw = r9.zwy * r0.xxx;
    r4.x = ps;
    r13.x = dot(r9.yx, float2(0.11, 0.59)) + 0.0;
    r0.x = (r17.x == 0.0) ? r15.x : r15.y;
    r0.x = (r4.w == 0.0) ? r15.z : r0.x;
    r17.w = (r4.z == 0.0) ? r15.w : r0.x;
    ps = 1.0 - r3.w;
    r17.xyz = r8.wxy + r8.wxy;
    r3.y = ps;
    ps = 1.0 - r3.x;
    r15 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r3.z = ps;
    ps = ModShadowGroupColor.x * r3.z;
    r0.x = r15.w + r17.w;
    r4.z = ps;
    ps = ModShadowGroupColor.y * r3.z;
    r0.x = saturate(r0.x - r1.z);
    r4.w = ps;
    ps = 0.875 * r0.w;
    r8.xyz = -r4.yzw + 1.0;
    r4.y = ps;
    ps = 2.5 * r3.y;
    r10.xyz = r0.xxx * r10.xyz;
    r3.w = ps;
    r4.zw = r4.xy * r8.yz + 0.125;
    ps = -r10.z;
    r16.yzw = r16.yzw * r14.xyz;
    ps = r11.w + ps;
    r0.xy = -r10.xy + r11.yz;
    r14.y = ps;
    r11.yz = r0.xy * r11.xx + r10.xy;
    ps = r12.x;
    r14.xzw = r13.yzw - r15.xyz;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r14 = r14.zwxy * r11.xxxx;
    r3.x = ps;
    ps = UniformVector_4.z * r1.x;
    r0.xw = r3.xw * r3.yx;
    r1.x = ps;
    ps = UniformVector_4.y * r1.w;
    r0.x = float((r0.x > 0.9));
    r1.z = ps;
    ps = UniformVector_4.x * r1.y;
    r13.yzw = r9.wxy * r0.xxx;
    r1.y = ps;
    ps = 1.0 - r1.x;
    r13 = r16 + r13;
    r4.y = ps;
    ps = r14.z;
    r5.w = r13.y - r11.y;
    r0.x = ps;
    ps = (-2.0) + r0.x;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.w = ps;
    ps = r10.z;
    r10.xyw = -UniformVector_0.xyz + 1.0;
    ps = r14.w + ps;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r11.x = ps;
    ps = r13.x;
    r9.xyz = r15.xyz + r14.zxy;
    ps = -r9.w + ps;
    r12.xy = r13.wz - r11.xz;
    r4.x = saturate(ps);
    ps = (-0.5) + r0.w;
    r13.yz = -r1.yz * r4.xx;
    r10.z = saturate(ps);
    ps = 1.0 - r4.x;
    r13.xw = r4.yz * r4.xw;
    r0.x = ps;
    r3.xyz = r13.www * r3.xyz + ModShadowColor.xyz;
    ps = r5.x;
    r1.xyz = r1.xyz + r13.xyz;
    ps = r0.x * ps;
    r4.xy = r1.yz + r12.zw;
    r4.z = ps;
    ps = r1.x;
    r12.zw = r4.xy - r9.yz;
    ps = -r9.x + ps;
    r1 = r12.xwyz * r10.zzzz;
    r4.w = ps;
    ps = r11.z;
    r5.xy = r5.yz * r0.xx;
    ps = r1.z + ps;
    r5.z = r11.x + r1.x;
    r4.y = ps;
    ps = r9.y;
    r5 = r5.wxyz * r10.zzzw;
    ps = r1.w + ps;
    r4.x = r11.y + r5.x;
    r1.x = ps;
    ps = r9.z;
    r4 = r4.wxyz * r10.zxyz;
    ps = r1.y + ps;
    r0.x = r2.w + r4.x;
    r1.y = ps;
    r1.z = r8.w * 2.0 + r0.x;
    r1.xyz = r1.zxy * r8.xxx;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r8.xxx > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r8.xyz = (r8.xxx >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r8.zxy, r8.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r1.xyz = r0.yyy * r2.xyz;
    r0.x = ps;
    r2.xyz = r8.xyz * r0.xxx;
    r0.x = dot(r2.zxy, r7.zxy);
    ps = 1.0 - r0.z;
    r8.xyz = r2.xyz * r0.xxx;
    r0.x = saturate(ps);
    r0.yzw = r8.xyz * 2.0 - r7.xyz;
    ps = log2(r0.x);
    r0.y = saturate(dot(r1.zxy, r0.wyz));
    r0.x = ps;
    ps = log2(r0.y);
    r0.x = r0.x * LightColorAndFalloffExponent.w;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r2.zyx, r1.zyx));
    r1.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r5.yzw * r1.yyx;
    r0.x = ps;
    r0.yzw = r4.yzw * r1.xxy + r0.yzw;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xyz * r3.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
