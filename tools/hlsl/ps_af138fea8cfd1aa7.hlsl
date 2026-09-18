// ps_af138fea8cfd1aa7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 462 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000738 10041500 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c22); // float2
float4 SpotDirection : register(c21); // float3
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
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9.x = tex2D(ShadowTexture, r0.xy).x;
    r9.y = UniformScalar_22.x * 0.05;
    r0 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = r1.w - r1.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r9.z = ps;
    ps = r1.z - r1.y;
    r6.x = r5.w - 4e+02;
    r9.w = ps;
    ps = 1.0 / r5.w;
    r10.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r6.zw = r10.xy * r6.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.y));
    r12.zw = r9.zw * UniformScalar_6.xx;
    r6.y = ps;
    ps = 0.00022222222 * r6.x;
    r10.xyz = r6.yyy * r4.xyz;
    r9.z = saturate(ps);
    ps = UniformVector_1.x * r1.w;
    r9.xz = r9.yx * r9.zx;
    r11.y = ps;
    ps = -r1.z;
    r12.xy = r10.xy * r9.xx;
    ps = 1.0 + ps;
    r12 = r12.xzwy + r1.wxyz;
    r4.y = ps;
    ps = r12.x;
    r4.x = -r12.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r11.zw = r4.xy * UniformVector_1.yy;
    r11.x = ps;
    r4 = r11.xzwy - 0.5;
    r14 = float4((r11.zwxy >= 0.5));
    r4 = r4 - r11.xzwy;
    r4 = r4 * r14.zxyw + r11.xzwy;
    r4 = r4.xywz + r4.xywz;
    r13 = tex2D(Texture2D_3, r4.zw);
    r15 = tex2D(Texture2D_3, r4.xy);
    r4.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r11.yzw = tex2D(Texture2D_4, r0.zw).xyw;
    r0 = tex2D(Texture2D_4, r0.xy).xzwy;
    r6.w = float((UniformScalar_17.x >= 1.0));
    r6.z = dot(r3.zxy, r3.zxy);
    r19.zw = r0.xw * 2.0 - 1.0;
    ps = 1.0 - r6.z;
    r18.x = saturate(r7.w * 15.0);
    r6.x = saturate(ps);
    ps = log2(r6.x);
    r9.xy = r11.yz + r11.yz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r4.w = -r7.w + UniformScalar_18.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r4.xyz = r9.zzz * r4.xyz;
    r6.y = ps;
    r4 = r4.xzyw * r6.yyyw;
    r6.x = r4.w + r7.w;
    r6.x = -r6.x + r7.z;
    r9.w = dot(r14.wyy, float3(1.0, 1.0, 1.0));
    ps = r6.x;
    r9.z = dot(r14.zxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r2.w = (r9.z == 0.0) ? r15.x : r15.y;
    r6.y = (r9.w == 0.0) ? r13.x : r13.y;
    ps = UniformScalar_19.x;
    r14 = r9.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r6.w = ps;
    r6.y = (r14.y == 0.0) ? r13.z : r6.y;
    r2.w = (r14.w == 0.0) ? r15.z : r2.w;
    r19.x = (r14.x == 0.0) ? r15.w : r2.w;
    r0.x = (r14.z == 0.0) ? r13.w : r6.y;
    ps = max(r6.x, r6.w);
    r6.y = max(r0.x, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_20.x;
    r6.xy = min(r6.xy, float2(1.0, 0.3));
    r6.w = ps;
    r6.x = saturate(r6.x * r6.w);
    ps = 1.0 - r6.x;
    r18.w = saturate(r5.w * 0.0001);
    r6.w = ps;
    ps = 3.3333333 * r6.y;
    r11.x = r6.w * r7.w;
    r19.y = ps;
    r7.xz = -r19.xy + 1.0;
    r6.y = dot(r18.xx, r7.xx) + r19.x;
    r6.xw = r11.xw * r0.yz;
    ps = r6.y;
    r6.x = float((r6.x >= 0.05));
    ps = r19.x + ps;
    r6.x = -r6.x + 1.0;
    r9.z = ps;
    r6.y = (UniformScalar_18.x > 0.0) ? r6.x : 1.0;
    r9.w = (UniformScalar_18.x >= 0.0) ? r6.y : r6.x;
    ps = r12.x + r12.x;
    r9 = r9.wzxy + float4(-0.5, 0.25, -1.0, -1.0);
    r7.y = ps;
    ps = r12.w + r12.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r9.xxxx)) clip(-1.0);
    r7.w = ps;
    r11.xyz = tex2D(Texture2D_8, r7.yw).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.yz = r1.wz + r1.wz;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = UniformScalar_1.x * UniformVector_3.x;
    r6.y = ps;
    r5.zw = r6.xy * abs(r8.xy);
    r6.xy = r12.zy * UniformVector_5.yx;
    ps = 1.0 / UniformScalar_2.x;
    r5.x = saturate(r9.y - r6.w);
    r11.w = ps;
    ps = UniformVector_6.y + r6.x;
    r16 = r5.xxxy * r11;
    r5.y = ps;
    r5.x = r16.w * UniformScalar_3.x + r6.y;
    r9.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r17 = tex2D(Texture2D_2, r0.yz);
    r5 = tex2D(Texture2D_7, r5.xy);
    r7.xyw = tex2D(Texture2D_0, r7.yw).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.yz).xyz;
    r13.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r15 = tex2D(Texture2D_6, r1.xy).wxyz;
    ps = r2.z;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r11.xyz = r15.yzw * UniformScalar_15.xxx + UniformScalar_16.xxx;
    ps = 5.0 * r6.x;
    r21.xyz = UniformVector_4.xyz * 2e+01;
    r0.y = saturate(ps);
    ps = r15.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    r13.xyz = r13.xyz * 2.0 - 1.0;
    r8.xyz = r8.xyz * 2.0 - 1.0;
    r14.xyz = r7.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r20.xyz = r5.xyz * r5.www;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r5.xyz = r6.yyy * r2.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r6.z));
    r2.xyw = r21.xyz * r20.xyz;
    r6.y = ps;
    ps = r8.x;
    r20.xyz = r6.yyy * -SpotDirection.xyz;
    ps = -r14.x + ps;
    r13.xyz = r13.xyz * UniformVector_3.xyz;
    r2.z = ps;
    ps = r8.y;
    r6.y = dot(r20.zxy, r3.zxy);
    ps = -r14.y + ps;
    r3 = r2.xxyw * float4(0.3, 1.0, 1.0, 1.0);
    r2.w = ps;
    r16.w = dot(r3.yx, r0.zz) + 0.0;
    ps = r8.z;
    r3.xyw = r3.zwy * r0.zzz;
    r15.x = dot(r3.yx, float2(0.11, 0.59)) + 0.0;
    ps = -r14.z + ps;
    r0.xw = -r0.xy + 1.0;
    r2.x = ps;
    ps = 2.5 * r0.x;
    r18.yz = r0.ww * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = r18.x;
    r8 = -r18.wxyz + 1.0;
    ps = r7.z * ps;
    r18.xy = r9.zw * 0.5;
    r18.z = ps;
    ps = (-1.0) - -r6.w;
    r18.xyz = r19.zyw + r18.xzy;
    r18.w = ps;
    ps = -r16.z;
    r6.xz = -r16.xy + r17.xy;
    r16.xy = r6.xz * r17.ww + r16.xy;
    ps = r17.z + ps;
    r7.xyz = r18.wxy * r18.yyz;
    r2.y = ps;
    ps = 1.0 + r7.x;
    r2 = r2.zxyw * r17.wwww;
    r0.y = ps;
    r6.xz = r0.yz * r0.xy;
    ps = r16.z;
    r6.xz = r6.xz * r8.yy;
    ps = r2.z + ps;
    r6.w = float((r6.x >= 0.9));
    r16.z = ps;
    r0.xyz = r3.wxy * r6.www + r15.yzw;
    ps = (-0.5) + r6.z;
    r0.xyz = r0.xyz - r16.xyz;
    r6.z = saturate(ps);
    r15.yzw = r0.xyz * r6.zzz;
    r0 = r16.wxyz + r15;
    ps = r0.x;
    r3.xyz = r14.xyz + r2.xwy;
    ps = -r3.w + ps;
    r0.xyz = r0.yzw * r12.xyz;
    r13.w = saturate(ps);
    r6.xw = -r13.xy * r13.ww + r13.xy;
    r2.xw = -r13.zw + 1.0;
    ps = r2.y;
    r12.xy = r6.xw + r7.yz;
    r6.x = ps;
    r12.z = r2.x * r13.w + r13.z;
    ps = (-2.0) + r6.x;
    r12.xyz = -r3.xyz + r12.xyz;
    r3.w = ps;
    r7.xyz = r12.xyz * r6.zzz + r3.xyw;
    r7.w = r7.w * 2.0 + r7.z;
    r7.xyz = r7.wxy * r8.xxx;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r8.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r2.xyz = (r8.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r11.xyz * r2.www;
    r6.x = ps;
    r3.xyz = r2.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r10.zxy);
    r2.xyz = r3.xyz * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r5.zxy, r2.zxy));
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r6.zzz;
    r9.z = ps;
    ps = -SpotAngles.x - -r6.y;
    r2.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    r6.x = ps;
    r6.zw = r2.xy * r8.zw + 0.125;
    ps = pow(2.0, r2.z);
    r7.w = saturate(dot(r3.zyx, r5.zyx));
    r6.y = ps;
    ps = SpotAngles.y * r6.x;
    r7.xyz = r7.xyz * r6.yyy;
    r6.y = saturate(ps);
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r6.xw = r6.zy * r6.wy;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    r7.xyz = r4.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r6.www;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
