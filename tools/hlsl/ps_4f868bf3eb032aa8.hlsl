// ps_4f868bf3eb032aa8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041400 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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

    r12 = tex2D(Texture2D_9, r1.xy);
    r6.x = r12.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r13.z = tex2D(ShadowTexture, r0.xy).x;
    ps = UniformVector_2.x * r1.w;
    r9.y = UniformScalar_4.x * UniformScalar_5.x;
    r3.w = ps;
    ps = UniformVector_12.x;
    r0.y = -r1.z + 1.0;
    r7.x = saturate(ps);
    ps = r5.w;
    r6.y = UniformScalar_3.x * UniformVector_4.x;
    ps = (-2e+02) + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.x = saturate(r6.x * 0.00022222222);
    r7.y = ps;
    ps = (-0.1) * r6.x;
    r6.zw = r1.wz * UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r10.xyz = r7.yyy * r4.xyz;
    r13.w = ps;
    r13.xy = r10.xy * r6.xx + r6.zw;
    ps = UniformVector_12.y;
    r6.xw = r13.yz * r13.wz;
    r7.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r0.x = -r6.x + 1.0;
    r0.z = ps;
    ps = UniformScalar_5.x * r6.y;
    r0.xyw = r0.zxy * UniformVector_2.xyy;
    r9.x = ps;
    ps = r0.x;
    r6.yz = r0.yw - 0.5;
    ps = r13.x * ps;
    r7.zw = float2((r0.yw >= 0.5));
    r3.z = ps;
    ps = r7.z + r7.z;
    r18.xy = r6.yz - r0.yw;
    r9.z = ps;
    ps = r7.w + r7.w;
    r4.xy = r3.zw - 0.5;
    r9.w = ps;
    ps = floor(r9.x);
    r3.xy = float2((r3.zw >= 0.5));
    r6.y = ps;
    ps = floor(r9.y);
    r4.xy = r4.xy - r3.zw;
    r6.z = ps;
    r0.xz = r4.xy * r3.xy + r3.zw;
    r6.yz = r6.yz * UniformVector_11.xy - r9.xy;
    r3.zw = r6.yz * r7.xy;
    r3 = r9.wxyz + r3.yzwx;
    r6.yz = r1.xy * UniformVector_13.xy + r3.yz;
    ps = 1.0 / UniformVector_10.x;
    r6.yz = r6.yz * UniformVector_8.xy;
    r7.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r18.zw = frac(r6.yz);
    r7.y = ps;
    r7 = r18 * r7.zwxy;
    r0.yw = r0.yw + r7.xy;
    r11 = r0 + r0;
    r17 = tex2D(Texture2D_3, r11.zw);
    r0.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r4 = tex2D(Texture2D_6, r7.zw);
    r6.yz = UniformVector_1.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xy = r6.yz * r1.wz;
    r16.x = ps;
    r9.zw = r1.wz * UniformVector_14.xy;
    ps = r2.z;
    r7.yw = r5.xy * ScreenPositionScaleBias.xy;
    ps = 0.1 + ps;
    r15.xyz = UniformVector_5.xyz * 2e+01;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r4.xyz = r4.xyz * r4.www;
    r0.x = saturate(ps);
    r0.yzw = r0.yzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.yzw = r0.yzw * UniformVector_4.xyz;
    r16.y = ps;
    r6.y = (r3.x == 0.0) ? r17.x : r17.y;
    r14 = r3.wwxx + float4(-3.0, -2.0, -2.0, -3.0);
    r6.y = (r14.z == 0.0) ? r17.z : r6.y;
    r17.x = (r14.w == 0.0) ? r17.w : r6.y;
    ps = r1.w + r1.w;
    r7.xz = float2((UniformVector_10.yx > r18.wz));
    r6.y = ps;
    ps = r1.z + r1.z;
    r3.xy = float2((UniformVector_10.xy >= r18.zw));
    r6.z = ps;
    ps = r16.x;
    r1.x = r3.x * r3.y;
    ps = abs(r8.x) * ps;
    r1.x = r1.x * r7.x;
    r1.z = ps;
    ps = r16.y;
    r7.x = r1.x * r7.z;
    ps = abs(r8.y) * ps;
    r4.xyz = r4.xyz * r7.xxx;
    r1.w = ps;
    ps = r0.w;
    r15.xyz = r15.xyz * r4.xyz;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r7.z = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r7.x = ps;
    ps = 1.0 - r0.x;
    r1.x = r7.z - r15.x;
    r7.z = ps;
    ps = 1.0 / r5.w;
    r17.y = saturate(r1.x + r15.x);
    r17.z = ps;
    r1.xy = r7.yw * r17.zz + ScreenPositionScaleBias.wz;
    r8.xy = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r20.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r4 = tex2D(Texture2D_2, r9.xy);
    r3.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r11 = tex2D(Texture2D_3, r11.xy);
    r1.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r13.xyz = tex2D(Texture2D_8, r9.zw).xyz;
    r6.xyz = tex2D(Texture2D_4, r6.yz).wxy;
    r9.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r1.z = dot(r2.zxy, r2.zxy);
    ps = r5.w;
    r2.w = float((UniformScalar_12.x >= 1.0));
    ps = 0.0001 * ps;
    r5.w = float((UniformScalar_12.x > 1.0));
    r19.x = saturate(ps);
    r5.xyz = r9.xyz * 2.0 - 1.0;
    r18.yz = r6.yz * 2.0 - 1.0;
    ps = (-1.0) + r6.x;
    r9.xyz = r12.xyz * UniformScalar_13.xxx;
    r18.x = ps;
    r13.xyz = (-abs(r5.www) >= 0.0) ? r13.xyz : 1.0;
    r13.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r13.xyz;
    r16.xyz = r9.xyz * r13.xyz + UniformScalar_14.xxx;
    ps = ModShadowGroupColor.x * r7.z;
    r9.xyz = r1.xyw + r1.xyw;
    r19.y = ps;
    r6.y = (r3.w == 0.0) ? r11.x : r11.y;
    r6.y = (r14.y == 0.0) ? r11.z : r6.y;
    r9.w = (r14.x == 0.0) ? r11.w : r6.y;
    ps = ModShadowGroupColor.y * r7.z;
    r6.y = max(r17.x, 0.0);
    r19.z = ps;
    ps = r6.y;
    r14 = r9 + float4(-1.0, -1.0, -1.0, -0.75);
    r6.y = ps;
    ps = 0.3;
    r2.w = saturate(r14.w + r9.w);
    r6.z = ps;
    ps = min(r6.y, r6.z);
    r3.xyz = r2.www * r3.xyz;
    r6.x = ps;
    ps = -r3.z;
    r5.xzw = r5.zxy - r14.zxy;
    ps = r4.z + ps;
    r6.yz = -r3.xy + r4.xy;
    r5.y = ps;
    r11.xy = r6.yz * r4.ww + r3.xy;
    ps = 3.3333333 * r6.x;
    r5 = r5.zwyx * r4.wwww;
    r6.z = ps;
    ps = rsqrt(abs(r1.z));
    r11.z = r3.z + r5.z;
    r6.y = ps;
    ps = r6.z;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    ps = r18.x * ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = r6.z;
    r4.xyz = r6.yyy * r2.xyz;
    ps = r18.y * ps;
    r1.xyz = r6.www * r20.xyz;
    r6.y = ps;
    ps = r6.z;
    r2.xyz = -r19.xyz + 1.0;
    ps = r18.z * ps;
    r14.xyz = r14.xyz + r5.xyw;
    r6.z = ps;
    r8.zw = -r0.yz * r17.yy + r0.yz;
    r0.z = r7.x * r17.y + r0.w;
    r0.xy = r6.yz * 2.0 + r8.zw;
    ps = 1.0 + r6.x;
    r7.xw = -r17.xy + 1.0;
    r7.y = ps;
    ps = r5.w;
    r5.xyz = r16.xyz * r7.www;
    r6.x = ps;
    ps = 2.5 * r7.x;
    r0.xyz = -r14.xyz + r0.xyz;
    r7.z = ps;
    ps = (-2.0) + r6.x;
    r6.yz = r7.zy * r7.yx;
    r14.w = ps;
    ps = (-0.5) + r6.y;
    r6.x = float((r6.z > 0.9));
    r7.x = saturate(ps);
    r7.yzw = r15.xyz * r6.xxx - r11.xyz;
    r6.xyz = r0.xyz * r7.xxx + r14.xyw;
    r6.w = r1.w * 2.0 + r6.z;
    r7.yzw = r13.xyz * r12.xyz + r7.yzw;
    r0.xyz = r7.yzw * r7.xxx + r11.xyz;
    r6.xyz = r6.wxy * r2.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r2.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r2.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r5.xyz * r7.xxx;
    r6.x = ps;
    r5.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r10.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r4.zxy, r6.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r9.xyz;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r4.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r2.yz + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xzy * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r7.y = r0.z * r6.w + r7.y;
    r7.xz = r0.xy * r6.ww + r7.xz;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
