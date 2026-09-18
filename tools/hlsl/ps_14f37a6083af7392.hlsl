// ps_14f37a6083af7392.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
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

    ps = UniformVector_2.x * r1.w;
    r7.xy = r1.xy * UniformVector_3.xy;
    r6.z = ps;
    r13 = tex2D(Texture2D_8, r7.xy);
    ps = 1.0 - r1.z;
    r9.y = ps;
    ps = r1.w;
    r6.yw = r1.wz * 6.0;
    ps = UniformVector_1.x * ps;
    r19.yzw = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    ps = r1.z;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = UniformVector_1.y * ps;
    r9.x = r2.z + 0.1;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.z = r5.w - 4e+02;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r13.w - 0.5;
    r11.y = ps;
    ps = rsqrt(abs(r0.z));
    r16.zw = saturate(r9.xz * float2(5.0, 0.00022222222));
    r0.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r10.xyz = r0.zzz * r4.xyz;
    r9.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r0.z = r16.w * (-0.025);
    r19.x = ps;
    r0.zw = r10.xy * r0.zz + r7.zw;
    r9.x = -r0.w * r19.x + 1.0;
    ps = r11.x;
    r4.xyw = r9.zxy * UniformVector_2.xyy;
    ps = abs(r8.x) * ps;
    r9.xy = r4.yw - 0.5;
    r7.z = ps;
    ps = r4.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    ps = r0.z * ps;
    r15.xy = float2((r4.yw >= 0.5));
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r9.xy = r9.xy - r4.yw;
    r9.z = ps;
    ps = (-0.5) + r6.z;
    r15.zw = float2((r6.xz >= 0.5));
    r9.w = ps;
    ps = r11.y;
    r9.zw = r9.zw - r6.xz;
    r4.xz = r9.zw * r15.zw + r6.xz;
    r4.yw = r9.xy * r15.xy + r4.yw;
    ps = abs(r8.y) * ps;
    r14 = r4 + r4;
    r7.w = ps;
    r11 = tex2D(Texture2D_1, r14.zw);
    r18.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16.y = tex2D(Texture2D_4, r7.xy).x;
    r4.xyw = tex2D(Texture2D_3, r7.xy).xyz;
    r6.xzw = tex2D(Texture2D_2, r6.yw).wxy;
    r7.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r12.x = UniformScalar_4.x * UniformScalar_3.x;
    r7.w = ps;
    ps = 1.0 / r5.w;
    r8.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r8.zw = r8.xy * r6.yy + ScreenPositionScaleBias.wz;
    r18.zw = r6.zw * 2.0 - 1.0;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r5.xyz = r4.wxy + float3(-2.0, 0.0, 0.0);
    r6.y = ps;
    r6.y = (-abs(r6.y) >= 0.0) ? 1.0 : (-1.0);
    r16.x = (-abs(r7.w) >= 0.0) ? (-1.0) : r6.y;
    ps = r1.w;
    r4.xyw = r5.yxz + r4.xwy;
    ps = UniformVector_5.x * ps;
    r12.yzw = r4.xwy + float3(-1.0, -1.0, 0.0);
    r8.x = ps;
    ps = r7.x + r7.x;
    r6.zw = -r16.zy + 1.0;
    r17.z = ps;
    ps = UniformScalar_8.x + r1.y;
    r4.z = saturate(r5.w * 0.0001);
    r9.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5 = r18.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r4.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r12 = r12.xwyz * r16.xyxy;
    r4.y = ps;
    ps = r7.y + r7.y;
    r4.xyw = -r4.xyz + 1.0;
    r17.w = ps;
    ps = r6.x;
    r17.xy = r5.xw * r4.xy;
    ps = r7.z * ps;
    r20 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r7.x = ps;
    r7.yz = r15.xy * 2.0 + r15.zw;
    r6.x = (r7.z == 0.0) ? r11.x : r11.y;
    ps = (-1.0) - -r7.x;
    r18 = r7.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r5.x = ps;
    r6.x = (r18.z == 0.0) ? r11.z : r6.x;
    r7.z = (r18.w == 0.0) ? r11.w : r6.x;
    ps = floor(r12.x);
    r6.x = max(r7.z, 0.0);
    r6.z = ps;
    ps = 1.0 / UniformScalar_1.x;
    r6.x = min(r6.x, 0.3);
    r5.w = ps;
    ps = 3.3333333 * r6.x;
    r5.yz = r20.zw + r5.yz;
    r6.y = ps;
    ps = r1.z;
    r5 = r6.yyzy * r5.xywz;
    ps = UniformVector_5.y * ps;
    r9.x = r5.z + r1.x;
    r8.y = ps;
    r1.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r5.z = tex2D(ShadowTexture, r0.xy).x;
    r11.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r17 = tex2D(Texture2D_1, r14.xy);
    r8.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r14 = tex2D(Texture2D_5, r9.xy);
    r0.xyw = tex2D(Texture2D_0, r0.zw).xyz;
    ps = UniformVector_4.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r6.y = float((UniformScalar_11.x >= 1.0));
    r22.x = ps;
    ps = UniformVector_4.y;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r7.w = float((UniformScalar_11.x > 1.0));
    r22.y = ps;
    ps = UniformVector_4.z;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r15.xyz = r14.xyz * r14.www;
    r22.z = ps;
    r14.xyz = (-abs(r7.www) >= 0.0) ? r8.xyz : 1.0;
    ps = rsqrt(abs(r6.z));
    r21.xyz = r13.xyz * UniformScalar_12.xxx;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.zzz * r2.xyz;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r8.xyz = r6.zzz * -SpotDirection.xyz;
    r6.x = saturate(ps);
    r14.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r14.xyz;
    ps = log2(r6.x);
    r2.xyz = r22.xyz * r15.xyz;
    r6.z = ps;
    r15.xyz = r2.xyz * r16.yyy;
    r2.xyz = r21.xyz * r14.xyz + UniformScalar_13.xxx;
    ps = r0.x + r0.x;
    r6.y = dot(r8.zxy, r3.zxy);
    r3.x = ps;
    ps = r0.y + r0.y;
    r8.xyz = r2.xyz * r6.www;
    r3.y = ps;
    ps = r0.w + r0.w;
    r6.x = r20.x * r20.y;
    r3.z = ps;
    r0.xyz = r6.xxx * r19.yzw + ModShadowColor.xyz;
    r6.x = (r7.y == 0.0) ? r17.x : r17.y;
    r6.x = (r18.y == 0.0) ? r17.z : r6.x;
    r3.w = (r18.x == 0.0) ? r17.w : r6.x;
    ps = -SpotAngles.x - -r6.y;
    r2 = r3 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r6.y = r2.w + r3.w;
    r7.y = saturate(ps);
    ps = 1.0 - r7.z;
    r6.x = saturate(r6.y - r7.x);
    r7.w = ps;
    ps = 2.5 * r7.w;
    r11.xyz = r6.xxx * r11.xyz;
    r7.z = ps;
    r3.x = r12.z * r16.y + r5.y;
    ps = r5.w;
    r7.x = r5.x + 1.0;
    ps = r12.w + ps;
    r6.xyw = r7.zxy * r7.xwy;
    r3.y = ps;
    r5.xy = -r2.xy + r3.xy;
    ps = (-0.5) + r6.x;
    r7.x = float((r6.y > 0.9));
    r5.w = saturate(ps);
    r7.xyz = r15.xyz * r7.xxx - r11.xyz;
    r3.xyz = r14.xyz * r13.xyz + r7.xyz;
    ps = -r2.z;
    r7.xyz = r5.xyz * r5.wwz;
    ps = r12.y + ps;
    r2.xy = r2.xy + r7.xy;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r1.xyz = r7.zzz * r1.xyz;
    r3.w = ps;
    r7.xyz = r3.xyz * r5.www + r11.xyz;
    r6.x = r3.w * r5.w - 2.0;
    r2.z = r0.w * 2.0 + r6.x;
    r2.xyw = r2.xyz * r4.www;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r2.z = r2.w + 1.0;
    r6.z = ps;
    r2.xyz = (r4.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r4.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.z);
    r6.x = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r1.xzy * r6.zzz;
    r6.x = ps;
    r3.xyz = r2.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r10.zxy);
    r2.xyz = r3.xyz * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r4.zxy, r2.zxy));
    ps = log2(r6.x);
    r2.xyz = r7.xyz * r9.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.yzw = r8.xyz * r5.www;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.z = saturate(dot(r3.zyx, r4.zyx));
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r2.xy * r6.zz + r7.xy;
    r7.z = r2.z * r6.z + r7.z;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.www;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
