// ps_84f0d6d55cfa0aa5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r9.xy = r0.xy * UniformVector_3.xy;
    r1.z = ps;
    r11 = tex2D(Texture2D_8, r9.xy);
    ps = (-0.5) + r11.w;
    r7.zw = r1.xy * 6.0;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r12.yzw = tex2D(Texture2D_3, r9.xy).xyz;
    r8.x = r1.x * UniformVector_2.x;
    r15.y = -r1.y + 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = dot(r4.zxy, r4.zxy);
    r9.w = ps;
    ps = rsqrt(abs(r1.w));
    r0.z = r2.z + 0.1;
    r1.w = ps;
    ps = 0.00022222222 * r0.w;
    r7.xy = r1.xy * UniformVector_1.xy;
    r8.w = saturate(ps);
    ps = 5.0 * r0.z;
    r10.xyz = r1.www * r4.xyz;
    r8.y = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r0.w = r8.w * (-0.025);
    r0.z = ps;
    r7.xy = r10.xy * r0.ww + r7.xy;
    r8.z = r7.y * r0.z;
    ps = 1.0 / UniformVector_1.x;
    r15.xw = -r8.zy + 1.0;
    r15.z = ps;
    r8.yzw = r15.yxz * UniformVector_2.yyx;
    ps = r8.w;
    r4.xyz = r8.zxy - 0.5;
    ps = r7.x * ps;
    r17.xyz = float3((r8.xzy >= 0.5));
    r12.x = ps;
    r17.w = float((r12.x >= 0.5));
    ps = r9.z;
    r14.xyz = r4.xzy - r8.zyx;
    ps = abs(r6.x) * ps;
    r13 = r12.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r0.z = ps;
    ps = r9.w;
    r14.w = r13.x - r12.x;
    r4.x = r14.w * r17.w + r12.x;
    r4.yzw = r14.xzy * r17.yxz + r8.zxy;
    ps = abs(r6.y) * ps;
    r8 = r4.zwxy + r4.zwxy;
    r0.w = ps;
    r14 = tex2D(Texture2D_1, r8.xy);
    r16.y = tex2D(Texture2D_4, r9.xy).x;
    r9.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r4.xyz = tex2D(Texture2D_2, r7.zw).xyw;
    r6.xyz = tex2D(Texture2D_2, r1.xy).xwy;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r6.w = r0.y + UniformScalar_8.x;
    r0.y = ps;
    ps = 1.0 / r5.w;
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r7.zw = r7.zw * r0.zz + ScreenPositionScaleBias.wz;
    r9.zw = r4.xy * 2.0 - 1.0;
    r0.y = (-abs(r0.y) >= 0.0) ? 1.0 : (-1.0);
    r16.x = (-abs(r1.z) >= 0.0) ? (-1.0) : r0.y;
    r9 = r9.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    ps = UniformScalar_4.x;
    r16.zw = r15.ww * ModShadowGroupColor.xy;
    ps = UniformScalar_3.x * ps;
    r4.xyw = -r16.zwy + 1.0;
    r13.x = ps;
    ps = r6.x + r6.x;
    r15.xy = r9.xw * r4.xy;
    r15.z = ps;
    r19.x = r17.y * 2.0 + r17.w;
    ps = r6.z + r6.z;
    r19.y = dot(r17.xzz, float3(1.0, 1.0, 1.0));
    r15.w = ps;
    ps = r1.x;
    r18 = r15.zwxy + float4(-1.0, -1.0, 0.125, 0.125);
    r0.y = (r19.y == 0.0) ? r14.x : r14.y;
    ps = UniformVector_5.x * ps;
    r12.xyz = r13.zyw + r12.ywz;
    r6.x = ps;
    ps = r4.z;
    r13.yzw = r12.xzy + float3(-1.0, -1.0, 0.0);
    ps = r6.y * ps;
    r12 = r19.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r0.w = ps;
    r0.y = (r12.z == 0.0) ? r14.z : r0.y;
    r1.z = (r12.w == 0.0) ? r14.w : r0.y;
    ps = (-1.0) - -r0.w;
    r14 = r13.xwyz * r16.xyxy;
    r9.x = ps;
    ps = floor(r14.x);
    r0.y = max(r1.z, 0.0);
    r6.z = ps;
    ps = 1.0 / UniformScalar_1.x;
    r0.y = min(r0.y, 0.3);
    r9.w = ps;
    ps = 3.3333333 * r0.y;
    r9.yz = r18.xy + r9.yz;
    r6.y = ps;
    ps = r1.y;
    r15 = r6.yyyz * r9;
    ps = UniformVector_5.y * ps;
    r6.z = r15.w + r0.x;
    r6.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r9.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r17 = tex2D(Texture2D_5, r6.zw);
    r8 = tex2D(Texture2D_1, r8.zw);
    r13.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r1.w = saturate(r5.w * 0.0001);
    ps = -ModShadowColor.x;
    r1.y = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r0.z = float((UniformScalar_11.x >= 1.0));
    r18.x = ps;
    ps = -ModShadowColor.y;
    r2.w = float((UniformScalar_11.x > 1.0));
    ps = 1.0 + ps;
    r0.x = dot(r3.zxy, r3.zxy);
    r18.y = ps;
    ps = rsqrt(abs(r0.x));
    r7.xyz = r6.xyw + r6.xyw;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r5.xyz = r11.xyz * UniformScalar_12.xxx;
    r1.x = saturate(ps);
    r13.xyz = (-abs(r2.www) >= 0.0) ? r13.xyz : 1.0;
    r13.xyz = (-abs(r0.zzz) >= 0.0) ? 1.0 : r13.xyz;
    ps = log2(r1.x);
    r0.xyz = r0.yyy * -SpotDirection.xyz;
    r1.x = ps;
    r5.xyw = r5.xyz * r13.xyz + UniformScalar_13.xxx;
    ps = -ModShadowColor.z;
    r0.y = dot(r0.zxy, r3.zxy);
    r0.x = (r19.x == 0.0) ? r8.x : r8.y;
    ps = 1.0 + ps;
    r0.z = r18.z * r18.w;
    r18.z = ps;
    r3.xyz = r0.zzz * r18.xyz + ModShadowColor.xyz;
    r0.x = (r12.y == 0.0) ? r8.z : r0.x;
    r7.w = (r12.x == 0.0) ? r8.w : r0.x;
    r12 = r7 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = rsqrt(abs(r1.y));
    r0.z = -r12.z + r14.y;
    r1.y = ps;
    ps = -SpotAngles.x - -r0.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = SpotAngles.y * r0.x;
    r18.xyz = UniformVector_4.xyz * 2e+01;
    r5.z = saturate(ps);
    ps = 1.0 - r1.z;
    r17.xyz = r17.xyz * r17.www;
    r2.w = ps;
    ps = 1.0 - r1.w;
    r6.xyz = r1.yyy * r2.xyz;
    r2.z = ps;
    ps = r12.w;
    r1.yzw = r18.xyz * r17.xyz;
    ps = r7.w + ps;
    r1.yzw = r1.yzw * r16.yyy;
    r0.x = ps;
    ps = 2.5 * r2.w;
    r0.x = saturate(r0.x - r0.w);
    r2.y = ps;
    ps = r15.z;
    r7.xyz = r5.xyw * r4.www;
    r0.y = r14.z * r16.y + r15.y;
    ps = r14.w + ps;
    r2.x = r15.x + 1.0;
    r0.w = ps;
    ps = r2.x * r2.w;
    r9.xyz = r0.xxx * r9.xyz;
    r0.x = ps;
    ps = r2.y * r2.x;
    r5.xy = -r12.xy + r0.yw;
    r0.y = ps;
    ps = (-0.5) + r0.y;
    r0.x = float((r0.x > 0.9));
    r5.w = saturate(ps);
    r0.xyw = r1.yzw * r0.xxx - r9.xyz;
    r11.xyz = r13.xyz * r11.xyz + r0.xyw;
    r1.yzw = r5.xyz * r5.wwz;
    ps = 1.0 + r0.z;
    r0.xy = r12.xy + r1.yz;
    r11.w = ps;
    r9.xyz = r11.xyz * r5.www + r9.xyz;
    r0.z = r11.w * r5.w - 2.0;
    r0.w = r6.w * 2.0 + r0.z;
    r0.xyz = r0.wxy * r2.zzz;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r2.zzz > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r2.zzz >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r5.xyz = r7.xyz * r5.www;
    r0.x = ps;
    r7.xyz = r0.yzw * r0.xxx;
    r0.x = dot(r7.zxy, r10.zxy);
    r0.xyz = r7.xyz * r0.xxx;
    r0.xyz = r0.xyz * 2.0 - r10.xyz;
    r0.x = saturate(dot(r6.zxy, r0.zxy));
    ps = log2(r0.x);
    r2.xyz = r9.xyz * r8.xyz;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r1.x;
    r0.y = r0.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r7.zyx, r6.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r5.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r2.xy * r1.xx + r0.yz;
    r0.w = r2.z * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r1.www;
    r0.xyz = r0.xzy * r3.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
