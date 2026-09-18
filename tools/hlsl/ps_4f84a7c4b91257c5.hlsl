// ps_4f84a7c4b91257c5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10041400 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c17); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r1.w;
    r7.zw = r1.xy * UniformVector_3.xy;
    r10.x = ps;
    r12 = tex2D(Texture2D_8, r7.zw);
    ps = (-0.5) + r12.w;
    r20.xyz = UniformVector_4.xyz * 2e+01;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r13.yzw = tex2D(Texture2D_3, r7.zw).xyz;
    ps = 1.0 - r1.z;
    r6.yz = r1.wz * 6.0;
    r3.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xy = r1.wz * UniformVector_1.xy;
    r3.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r5.w - 4e+02;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.w = ps;
    ps = (-0.025) * r6.x;
    r18.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.xyz = r6.www * r4.xyz;
    r18.x = ps;
    r7.xy = r9.xy * r6.xx + r7.xy;
    r3.x = -r7.y * r18.x + 1.0;
    r10.yzw = r3.yxz * UniformVector_2.yyx;
    ps = r10.w;
    r3.xyz = r10.zxy - 0.5;
    ps = r7.x * ps;
    r19.xyz = float3((r10.xzy >= 0.5));
    r13.x = ps;
    r19.w = float((r13.x >= 0.5));
    ps = r0.z;
    r4.xyz = r3.xzy - r10.zyx;
    ps = abs(r8.x) * ps;
    r16 = r13.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r6.x = ps;
    ps = r0.w;
    r4.w = r16.x - r13.x;
    r3.x = r4.w * r19.w + r13.x;
    r3.yzw = r4.xzy * r19.yxz + r10.zxy;
    ps = abs(r8.y) * ps;
    r3 = r3.zwxy + r3.zwxy;
    r6.w = ps;
    r11 = tex2D(Texture2D_1, r3.xy);
    r14.y = tex2D(Texture2D_4, r7.zw).x;
    r15.xy = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r4.xyz = tex2D(Texture2D_2, r6.yz).xyw;
    r6.yzw = tex2D(Texture2D_2, r1.wz).xyw;
    r8.x = UniformScalar_4.x * UniformScalar_3.x;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r14.w = saturate(r5.w * 0.0001);
    r0.z = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r6.x = r2.z + 0.1;
    r7.z = ps;
    ps = 1.0 / r5.w;
    r8.yz = r5.xy * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r10.xy = r8.yz * r0.ww + ScreenPositionScaleBias.wz;
    r15.zw = r4.xy * 2.0 - 1.0;
    r7.z = (-abs(r7.z) >= 0.0) ? 1.0 : (-1.0);
    r14.x = (-abs(r0.z) >= 0.0) ? (-1.0) : r7.z;
    ps = 5.0 * r6.x;
    r5 = r15.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r14.z = saturate(ps);
    ps = r6.y + r6.y;
    r4.xyw = -r14.zyw + 1.0;
    r15.z = ps;
    r0.zw = -r4.xx * ModShadowGroupColor.xy + 1.0;
    ps = r6.z + r6.z;
    r15.xy = r5.xw * r0.zw;
    r15.w = ps;
    r15 = r15.zwxy + float4(-1.0, -1.0, 0.125, 0.125);
    r17.x = r19.y * 2.0 + r19.w;
    ps = r1.w;
    r17.y = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r6.x = (r17.y == 0.0) ? r11.x : r11.y;
    ps = UniformVector_5.x * ps;
    r8.yzw = r16.zyw + r13.ywz;
    r0.z = ps;
    ps = r4.z;
    r8.yzw = r8.ywz + float3(-1.0, -1.0, 0.0);
    ps = r6.w * ps;
    r16 = r17.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r6.x = (r16.z == 0.0) ? r11.z : r6.x;
    r6.x = (r16.w == 0.0) ? r11.w : r6.x;
    ps = (-1.0) - -r6.z;
    r8 = r8 * r14.xxyy;
    r5.x = ps;
    ps = floor(r8.x);
    r6.y = max(r6.x, 0.0);
    r10.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r6.y = min(r6.y, 0.3);
    r5.w = ps;
    ps = 3.3333333 * r6.y;
    r5.yz = r15.xy + r5.yz;
    r10.z = ps;
    ps = r1.z;
    r5 = r10.zzwz * r5.yxwz;
    ps = UniformVector_5.y * ps;
    r7.z = r5.z + r1.x;
    r0.w = ps;
    ps = UniformScalar_8.x + r1.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r7.w = ps;
    r1.yzw = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r5.z = tex2D(ShadowTexture, r0.xy).x;
    r10.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r11 = tex2D(Texture2D_1, r3.zw);
    r0.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r3 = tex2D(Texture2D_5, r7.zw);
    r7.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r6.y = float((UniformScalar_11.x >= 1.0));
    r7.z = float((UniformScalar_11.x > 1.0));
    r13.xyz = r3.xyz * r3.www;
    r0.xyz = (-abs(r7.zzz) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r6.w));
    r19.xyz = r12.xyz * UniformScalar_12.xxx;
    r6.w = ps;
    r3.xyz = r6.www * r2.xyz;
    r0.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r0.xyz;
    ps = r7.x + r7.x;
    r2.xyz = r20.xyz * r13.xyz;
    r15.x = ps;
    ps = r7.y + r7.y;
    r13.xyz = r2.xyz * r14.yyy;
    r15.y = ps;
    r2.xyz = r19.xyz * r0.xyz + UniformScalar_13.xxx;
    ps = r7.w + r7.w;
    r6.y = r15.z * r15.w;
    r15.z = ps;
    r7.xyz = r6.yyy * r18.yzw + ModShadowColor.xyz;
    r6.y = (r17.x == 0.0) ? r11.x : r11.y;
    r6.y = (r16.y == 0.0) ? r11.z : r6.y;
    r15.w = (r16.x == 0.0) ? r11.w : r6.y;
    r11 = r15 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = 1.0 - r6.x;
    r6.y = r11.w + r15.w;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r6.w = saturate(r6.y - r6.z);
    r6.z = ps;
    ps = r5.w;
    r2.xyz = r2.xyz * r4.yyy;
    r5.x = r8.y * r14.y + r5.x;
    ps = r8.z + ps;
    r6.y = r5.y + 1.0;
    r5.y = ps;
    ps = r6.y * r6.x;
    r10.xyz = r6.www * r10.xyz;
    r6.x = ps;
    ps = r6.z * r6.y;
    r5.xy = -r11.xy + r5.xy;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r6.x = float((r6.x > 0.9));
    r5.w = saturate(ps);
    ps = -r11.z;
    r2.xyz = r2.xyz * r5.www;
    r6.xyz = r13.xyz * r6.xxx - r10.xyz;
    r8.xyz = r0.xyz * r12.xyz + r6.xyz;
    ps = r8.w + ps;
    r0.xyz = r5.xyz * r5.wwz;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r6.yz = r11.xy + r0.xy;
    r8.w = ps;
    r4.xyz = r8.xyz * r5.www + r10.xyz;
    r6.x = r8.w * r5.w - 2.0;
    r6.w = r7.w * 2.0 + r6.x;
    r6.xyw = r6.yzw * r4.www;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r4.www > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.zzz * r1.yzw;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r6.yzw = r6.yzw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r9.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r6.yzw * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    r1.z = ps;
    ps = log2(r6.x);
    r1.xyz = r4.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
