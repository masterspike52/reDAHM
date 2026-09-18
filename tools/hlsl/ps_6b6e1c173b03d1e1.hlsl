// ps_6b6e1c173b03d1e1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 375 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005DC 10041400 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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

    ps = r5.w;
    r0.z = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r0.w));
    r1.z = r2.z + 0.1;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r10.xyz = r0.www * r4.xyz;
    r0.w = ps;
    ps = 0.00022222222 * r1.w;
    r4.yzw = r0.www * -SpotDirection.xyz;
    r4.x = saturate(ps);
    ps = 5.0 * r1.z;
    r0.w = dot(r4.wyz, r3.zxy);
    r4.y = saturate(ps);
    ps = (-0.025) * r4.x;
    r1.zw = r1.xy * UniformVector_1.xy;
    r2.w = ps;
    r7.xy = r10.xy * r2.ww + r1.zw;
    ps = -SpotAngles.x - -r0.w;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r7.z = saturate(r0.w * SpotAngles.y);
    r7.w = ps;
    r4.zw = r7.yz * r7.wz;
    ps = 1.0 / UniformVector_1.x;
    r17.zw = -r4.zy + 1.0;
    r17.y = ps;
    r3.yz = r17.zy * UniformVector_2.yx;
    r3.x = r3.z * r7.x;
    r9 = tex2D(Texture2D_1, r3.xy).xzwy;
    r3.x = r1.x * UniformVector_2.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.zw = r1.xy * 6.0;
    r11.z = ps;
    ps = trunc(UniformScalar_1.x);
    r11.xy = r1.xy * UniformVector_6.xy;
    r3.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = -r1.y + 1.0;
    r11.w = ps;
    r2.w = (r3.z == 0.0) ? r9.x : r9.w;
    ps = UniformVector_2.y * r0.w;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r3.y = ps;
    ps = r11.z;
    r13 = r3.xyzz + float4(-0.5, -0.5, -3.0, -2.0);
    ps = abs(r6.x) * ps;
    r14.xy = float2((r3.xy >= 0.5));
    r9.x = ps;
    ps = 1.0 / r5.w;
    r12.xy = r13.xy - r3.xy;
    r14.z = ps;
    r0.w = (r13.w == 0.0) ? r9.y : r2.w;
    r3.w = (r13.z == 0.0) ? r9.z : r0.w;
    r9.zw = r12.zw * r14.zz + ScreenPositionScaleBias.wz;
    r3.yz = r12.xy * r14.xy + r3.xy;
    ps = r11.w;
    r3.x = r3.w + 0.25;
    ps = abs(r6.y) * ps;
    r3.xyw = r3.yzx + r3.yzw;
    r9.y = ps;
    r6.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r15.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r19.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r12 = tex2D(Texture2D_1, r3.xy);
    r9 = tex2D(Texture2D_4, r0.xy);
    r20.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r18.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r16.xyw = tex2D(Texture2D_2, r1.zw).xyw;
    r0.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r7.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r13.xyz = r7.xyw * 2.0 - 1.0;
    r11.xw = r0.xy * 2.0 - 1.0;
    r19.zw = r16.xy * 2.0 - 1.0;
    r16.xyz = r18.xyz * 2.0 - 1.0;
    r0.x = r16.w * r0.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r18.xyz = UniformVector_5.xzy * 2e+01;
    r1.w = float((UniformScalar_4.x >= 1.0));
    r0.y = float((UniformScalar_4.x > 1.0));
    r1.xyz = (-abs(r0.yyy) >= 0.0) ? r20.xyz : 1.0;
    ps = 1.0 - r0.z;
    r9.xyz = r9.xyz * r9.www;
    r0.y = saturate(ps);
    r1.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r1.yxz;
    ps = log2(r0.y);
    r9.xyz = r18.xzy * r9.xyz;
    r0.z = ps;
    r0.y = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    ps = r0.y;
    r16.xyz = r16.xyz * UniformVector_4.xyz;
    ps = -r9.x + ps;
    r17.x = dot(r14.xyy, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    r0.y = (r17.x == 0.0) ? r12.x : r12.y;
    r2.w = saturate(r1.w + r9.x);
    r14.xy = -r16.xy * r2.ww + r16.xy;
    ps = rsqrt(abs(r0.w));
    r3.w = saturate(r3.w - r0.x);
    r0.w = ps;
    ps = UniformScalar_5.x * r3.z;
    r18.xyz = -ModShadowColor.xyz + 1.0;
    r11.y = ps;
    ps = UniformScalar_5.x * r3.y;
    r7.xyz = r0.www * r2.xyz;
    r11.z = ps;
    ps = UniformScalar_5.x * r1.y;
    r11.yz = r11.zy * r1.xz;
    r0.w = ps;
    ps = r0.w;
    r19 = r19 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r3.x * ps;
    r2.yz = r11.xw + r19.zw;
    r11.x = ps;
    ps = r5.w;
    r11.xyz = r11.xyz + UniformScalar_6.xxx;
    ps = 0.0001 * ps;
    r5.yz = r17.ww * ModShadowGroupColor.xy;
    r5.x = saturate(ps);
    r5.xyw = -r5.yzx + 1.0;
    r17.yz = r19.xy * r5.xy;
    r17 = r17.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r0.y = (r17.y == 0.0) ? r12.z : r0.y;
    ps = r17.z * r17.w;
    r0.w = ps;
    r5.xyz = r0.www * r18.xyz + ModShadowColor.xyz;
    r16.w = (r17.x == 0.0) ? r12.w : r0.y;
    r0.y = max(r16.w, 0.0);
    ps = (-1.0) - -r0.x;
    r0.y = min(r0.y, 0.3);
    r2.x = ps;
    ps = 1.0 - r2.w;
    r0.xw = -r16.zw + 1.0;
    r1.w = ps;
    ps = 3.3333333 * r0.y;
    r11.xyz = r11.xyz * r1.www;
    r0.y = ps;
    r12 = r0.yyxy * r2.xywz;
    ps = 2.5 * r0.w;
    r12.z = r16.z + r12.z;
    r1.w = ps;
    ps = r12.x;
    r2.xyz = r3.www * r15.xyz;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r12.xy = r14.xy + r12.yw;
    r3.w = ps;
    r9.xyz = r1.yxz * r3.xyz + r9.xyz;
    r12.xyz = -r13.xyz + r12.xyz;
    r0.y = saturate(r1.w * r3.w - 0.5);
    r1.xy = r12.xy * r0.yy + r13.xy;
    r0.x = r12.z * r0.y - 2.0;
    r3.xyz = r9.xyz - r2.xyz;
    r9.xyz = r3.xyz * r0.yyy + r2.xyz;
    r1.z = r7.w * 2.0 + r0.x;
    r1.xyz = r1.zxy * r5.www;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r5.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r5.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r2.xyz = r11.xyz * r0.yyy;
    r0.x = ps;
    r3.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r3.zxy, r10.zxy);
    r0.xyw = r3.xyz * r0.xxx;
    r0.xyw = r0.xyw * 2.0 - r10.xyz;
    r0.x = saturate(dot(r7.zxy, r0.wxy));
    ps = log2(r0.x);
    r1.yzw = r9.xyz * r8.xyz;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.z;
    r0.y = r0.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r3.zyx, r7.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r2.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r4.www;
    r0.xyz = r0.xzy * r5.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
