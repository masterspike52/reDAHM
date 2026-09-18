// ps_f62c2b7f9929a259.bin
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
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
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

    ps = (-4e+02) - -r5.w;
    r6.z = UniformScalar_22.x * 0.05;
    r6.x = ps;
    ps = r2.z;
    r0.zw = r1.wz - r1.xy;
    ps = 0.1 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r10.zw = r0.zw * UniformScalar_6.xx;
    r6.w = ps;
    ps = 0.00022222222 * r6.x;
    r11 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r19.w = saturate(ps);
    ps = 5.0 * r6.y;
    r9.xyz = r6.www * r4.xyz;
    r19.x = saturate(ps);
    ps = UniformVector_1.x * r1.w;
    r6.x = r6.z * r19.w;
    r3.x = ps;
    ps = -r1.z;
    r10.xy = r9.xy * r6.xx;
    ps = 1.0 + ps;
    r4 = r10.wxzy + r1.ywxz;
    r6.z = ps;
    ps = r4.y;
    r6.x = -r4.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r3.yz = r6.zx * UniformVector_1.yy;
    r3.w = ps;
    r6 = r3.wzxy - 0.5;
    r10 = float4((r3.wzxy >= 0.5));
    r6 = r6 - r3.wzxy;
    r6 = r6 * r10 + r3.wzxy;
    r13 = r6 + r6;
    r16 = tex2D(Texture2D_4, r11.xy).zwxy;
    r3 = tex2D(Texture2D_3, r13.zw);
    r12.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    ps = -r7.w;
    r15.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = UniformScalar_18.x + ps;
    r6.x = float((UniformScalar_17.x >= 1.0));
    r15.x = ps;
    r6.x = r15.x * r6.x + r7.w;
    r0.z = dot(r10.xyy, float3(1.0, 1.0, 1.0));
    ps = 0.0001 * r5.w;
    r6.x = -r6.x + r7.z;
    r5.x = saturate(ps);
    ps = r6.x;
    r0.w = dot(r10.zww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r6.x = (r0.w == 0.0) ? r3.x : r3.y;
    ps = UniformScalar_19.x;
    r11 = r0.zwzw + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r6.x = (r11.y == 0.0) ? r3.z : r6.x;
    r11.w = (r11.w == 0.0) ? r3.w : r6.x;
    ps = max(r6.y, r6.z);
    r6.x = max(r11.w, 0.0);
    r6.y = ps;
    ps = 1.0 / UniformScalar_20.x;
    r6.xy = min(r6.yx, float2(1.0, 0.3));
    r6.z = ps;
    ps = r1.w + r1.w;
    r6.x = saturate(r6.x * r6.z);
    r10.z = ps;
    ps = r1.z + r1.z;
    r6.x = -r6.x + 1.0;
    r10.w = ps;
    ps = r7.w;
    r12.x = r6.x * r7.w;
    ps = 15.0 * ps;
    r6.xw = r12.xw * r16.xy;
    r19.y = saturate(ps);
    ps = r12.y + r12.y;
    r19.z = float((r6.x >= 0.05));
    r7.x = ps;
    ps = r12.z + r12.z;
    r3.xyz = -r19.zyx + 1.0;
    r7.y = ps;
    r6.z = (UniformScalar_18.x > 0.0) ? r3.x : 1.0;
    r7.z = (UniformScalar_18.x >= 0.0) ? r6.z : r3.x;
    ps = r4.y + r4.y;
    r7.xyz = r7.xyz + float3(-1.0, -1.0, -0.5);
    r10.x = ps;
    ps = r4.w + r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r10.y = ps;
    r12.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r14 = tex2D(Texture2D_3, r13.xy);
    r13.xyz = tex2D(Texture2D_1, r10.zw).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.y = UniformScalar_1.x * UniformVector_3.x;
    r16.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.xyz = r13.xyz + r13.xyz;
    r16.y = ps;
    r17.zw = r16.zw * 2.0 - 1.0;
    ps = 1.0 / r5.w;
    r8.xy = r16.xy * abs(r8.xy);
    r6.z = ps;
    r8.zw = r15.yz * r6.zz + ScreenPositionScaleBias.wz;
    r6.z = (r0.z == 0.0) ? r14.x : r14.y;
    r6.z = (r11.z == 0.0) ? r14.z : r6.z;
    r17.x = (r11.x == 0.0) ? r14.w : r6.z;
    ps = 3.3333333 * r6.y;
    r7.w = dot(r2.zxy, r2.zxy);
    r17.y = ps;
    ps = r4.z;
    r0.zw = -r17.xy + 1.0;
    r6.y = ps;
    r6.x = dot(r19.yy, r0.zz) + r17.x;
    ps = UniformVector_5.x * r6.y;
    r13.w = r6.x + r17.x;
    r6.y = ps;
    ps = UniformVector_5.y * r4.x;
    r16 = r13.xywz + float4(-1.0, -1.0, 0.25, -1.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r11.x = saturate(r16.z - r6.w);
    r12.w = ps;
    ps = UniformVector_6.y + r6.x;
    r15 = r11.xxxy * r12;
    r6.z = ps;
    r6.x = r15.w * UniformScalar_3.x + r6.y;
    r4.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r8.z = tex2D(ShadowTexture, r0.xy).x;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r18 = tex2D(Texture2D_2, r10.zw);
    r11.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r20 = tex2D(Texture2D_7, r6.xz);
    r0.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r13 = tex2D(Texture2D_6, r1.xy).wxyz;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r13.yzw * UniformScalar_15.xxx + UniformScalar_16.xxx;
    r14.xyz = r0.xyz * 2.0 - 1.0;
    ps = r13.x;
    r5.yzw = UniformVector_4.xyz * 2e+01;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r1.yzw = r20.xyz * r20.www;
    r1.x = ps;
    r6.xyz = r11.zxy * 2.0 - 1.0;
    ps = UniformVector_3.x * r6.y;
    r1.yzw = r5.yzw * r1.yzw;
    r11.x = ps;
    ps = UniformVector_3.y * r6.z;
    r20 = r1.yyzw * float4(0.3, 1.0, 1.0, 1.0);
    r11.y = ps;
    r15.w = dot(r20.yx, r1.xx) + 0.0;
    ps = UniformVector_3.z * r6.x;
    r5.yzw = r20.zyw * r1.xxx;
    r11.z = ps;
    r13.x = dot(r5.wy, float2(0.11, 0.59)) + 0.0;
    r6.xz = -r11.wz + 1.0;
    ps = rsqrt(abs(r7.w));
    r16.z = r19.y * r0.w;
    r6.y = ps;
    ps = -r15.z;
    r2.xyz = r6.yyy * r2.xyz;
    ps = r18.z + ps;
    r1.xz = -r15.xy + r18.xy;
    r1.y = ps;
    r15.xy = r1.xz * r18.ww + r15.xy;
    ps = 0.5 * r7.x;
    r1.xzw = r16.wxy - r14.zxy;
    r16.x = ps;
    ps = 0.5 * r7.y;
    r1 = r1.zwyx * r18.wwww;
    r16.y = ps;
    ps = (-1.0) - -r6.w;
    r7.xyz = r17.zyw + r16.xzy;
    r7.w = ps;
    r0.xyw = r7.wxy * r7.yyz;
    ps = 2.5 * r6.x;
    r6.y = r0.x + 1.0;
    r6.w = ps;
    r6.xy = r6.yw * r6.xy;
    ps = r15.z;
    r6.xy = r6.yx * r3.yy;
    ps = r1.z + ps;
    r7.x = float((r6.y >= 0.9));
    r15.z = ps;
    r7.xyz = r5.zyw * r7.xxx + r13.yzw;
    ps = (-0.5) + r6.x;
    r7.xyz = r7.xyz - r15.xyz;
    r7.w = saturate(ps);
    r13.yzw = r7.xyz * r7.www;
    ps = ModShadowGroupColor.x * r3.z;
    r13 = r15.wxyz + r13;
    r5.y = ps;
    ps = r13.x;
    r1.xyz = r14.xyz + r1.xyw;
    ps = -r5.z + ps;
    r7.xyz = r13.ywz * r12.xzy;
    r5.w = saturate(ps);
    r6.w = r6.z * r5.w + r11.z;
    r6.xy = -r11.xy * r5.ww + r11.xy;
    ps = ModShadowGroupColor.y * r3.z;
    r6.yz = r6.xy + r0.yw;
    r5.z = ps;
    ps = r1.w;
    r5 = -r5.wxyz + 1.0;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r6.yzw = -r1.xyz + r6.yzw;
    r1.w = ps;
    r6.xyz = r6.yzw * r7.www + r1.xyw;
    r6.w = r0.z * 2.0 + r6.z;
    r6.xyz = r6.wxy * r5.yyy;
    ps = 1.0 + r6.x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r5.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r5.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r6.x));
    r6.yzw = r10.xyz * r5.xxx;
    r6.x = ps;
    r3.xyz = r1.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r9.zxy);
    r1.xyz = r3.xyz * r6.xxx;
    r1.xyz = r1.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r2.zxy, r1.zxy));
    ps = log2(r6.x);
    r1.xyz = r6.yzw * r7.www;
    r8.w = ps;
    r6.xyw = r8.wyx * float3(15.0, 0.875, 0.875);
    r8.xy = r6.wy * r5.zw + 0.125;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r3.zyx, r2.zyx));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r7.y = r7.y * r6.w + r6.z;
    r7.xz = r7.xz * r6.ww + r6.xy;
    r6.xw = r8.xz * r8.yz;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r4.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
