// ps_36908b1287e5bc87.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 435 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006CC 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.z = UniformScalar_16.x * 0.05;
    r6.x = r5.w - 4e+02;
    ps = r2.z;
    r6.w = UniformScalar_3.x * UniformVector_4.x;
    ps = 0.1 + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r0.z));
    r6.w = r6.w * UniformScalar_4.x;
    r0.z = ps;
    ps = floor(r6.w);
    r12.xy = r1.xy * UniformVector_2.xy;
    r11.w = ps;
    ps = 0.00022222222 * r6.x;
    r9 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r6.w = saturate(ps);
    ps = 5.0 * r6.y;
    r11.xyz = r0.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = 1.0 / UniformScalar_1.x;
    r6.y = r6.z * r6.w;
    r6.z = ps;
    r4.xyw = r11.wxy * r6.zyy + r1.xwz;
    ps = 1.0 - r4.w;
    r10.x = r1.w * UniformVector_1.x;
    r0.z = ps;
    ps = 1.0 - r1.z;
    r6.y = float((UniformScalar_11.x >= 1.0));
    r0.w = ps;
    ps = UniformVector_1.x * r4.y;
    r10.yz = r0.wz * UniformVector_1.yy;
    r10.w = ps;
    r13 = r10.wzxy - 0.5;
    r18 = float4((r10.wzxy >= 0.5));
    r13 = r13 - r10.wzxy;
    r10 = r13 * r18 + r10.wzxy;
    r10 = r10 + r10;
    r14 = tex2D(Texture2D_9, r12.xy);
    r17 = tex2D(Texture2D_3, r10.zw);
    r19 = tex2D(Texture2D_3, r10.xy);
    r13.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    r15.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r9 = tex2D(Texture2D_4, r9.xy);
    r16.x = saturate(r7.w * 15.0);
    ps = r1.w + r1.w;
    r16.w = -r7.w + UniformScalar_12.x;
    r10.y = ps;
    ps = 1.0 / r5.w;
    r16.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r22.zw = r9.xy * 2.0 - 1.0;
    r0.zw = r15.yz * 2.0 - 1.0;
    r12.zw = r16.yz * r6.zz + ScreenPositionScaleBias.wz;
    ps = r1.z + r1.z;
    r9.xy = r0.zw * 0.5;
    r10.z = ps;
    r6.y = r16.w * r6.y + r7.w;
    ps = -r6.y;
    r13.yzw = r13.xyz + r13.xyz;
    ps = r7.z + ps;
    r0.w = dot(r18.zww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    ps = r6.y;
    r0.z = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r10.x = ps;
    r6.z = (r0.z == 0.0) ? r19.x : r19.y;
    r6.y = (r0.w == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_13.x;
    r18 = r0.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r10.w = ps;
    r6.y = (r18.y == 0.0) ? r17.z : r6.y;
    r6.z = (r18.w == 0.0) ? r19.z : r6.z;
    r22.x = (r18.x == 0.0) ? r19.w : r6.z;
    r6.z = (r18.z == 0.0) ? r17.w : r6.y;
    ps = max(r10.x, r10.w);
    r0.z = max(r6.z, 0.0);
    r0.w = ps;
    ps = 1.0 / UniformScalar_14.x;
    r6.yw = min(r0.zw, float2(0.3, 1.0));
    r0.z = ps;
    ps = 1.0 - r6.x;
    r0.z = saturate(r6.w * r0.z);
    r6.w = ps;
    ps = 3.3333333 * r6.y;
    r0.z = -r0.z + 1.0;
    r22.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.x = r0.z * r7.w;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xw = -r22.yx + 1.0;
    r7.y = ps;
    ps = r16.x;
    r8.xy = r7.xy * abs(r8.xy);
    ps = r10.x * ps;
    r7.xw = r15.wx * r9.wz;
    r9.z = ps;
    ps = (-1.0) - -r7.x;
    r9.xyz = r22.zyw + r9.xzy;
    r9.w = ps;
    ps = 1.0 - r6.z;
    r9.xzw = r9.wxy * r9.yyz;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r6.y = r9.x + 1.0;
    r6.z = ps;
    ps = r5.w;
    r7.yz = r6.yz * r6.xy;
    ps = 0.0001 * ps;
    r15.yz = float2((r7.wy >= float2(0.05, 0.9)));
    r15.x = saturate(ps);
    ps = r1.y;
    r0.zw = -r15.yx + 1.0;
    r6.x = (UniformScalar_12.x > 0.0) ? r0.z : 1.0;
    r6.x = (UniformScalar_12.x >= 0.0) ? r6.x : r0.z;
    ps = UniformScalar_8.x + ps;
    r13.x = r6.x * r14.w;
    r4.z = ps;
    ps = r4.y + r4.y;
    r18 = r13 + float4(-0.5, -1.0, -1.0, -1.0);
    r6.x = ps;
    ps = r4.w + r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r18.xxxx)) clip(-1.0);
    r6.y = ps;
    r9.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r13.xyz = tex2D(LightAttenuationTexture, r12.zw).xyz;
    r12.z = tex2D(ShadowTexture, r0.xy).x;
    r5.xyz = tex2D(Texture2D_8, r6.xy).xyz;
    r19 = tex2D(Texture2D_2, r10.yz);
    r16.w = tex2D(Texture2D_6, r12.xy).x;
    r8 = tex2D(Texture2D_7, r4.xz);
    r21.xyz = tex2D(Texture2D_1, r10.yz).xyz;
    r4.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r12.xyw = UniformVector_5.zyx * 2e+01;
    r6.z = dot(r2.zxy, r2.zxy);
    r6.x = dot(r3.zxy, r3.zxy);
    r17.yzw = r4.xyw * 2.0 - 1.0;
    r20.xyz = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = 1.0 - r6.x;
    r21.xyz = r21.xyz + r21.xyz;
    r6.y = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r0.xyz = r8.xyz * r8.www;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.zzz * r2.xyz;
    r6.z = ps;
    ps = log2(r6.y);
    r2.xyz = r6.zzz * -SpotDirection.xyz;
    r6.y = ps;
    r6.z = dot(r2.zxy, r3.zxy);
    r16.yz = r6.ww * ModShadowGroupColor.xy;
    r8 = -r16.wxyz + 1.0;
    r6.x = dot(r16.xx, r10.ww) + r22.x;
    ps = r12.w;
    r21.w = r6.x + r22.x;
    ps = r0.x * ps;
    r2 = r21 + float4(-1.0, -1.0, -1.0, 0.25);
    r17.x = ps;
    ps = r2.w;
    r3.xyz = r20.xyz * r8.xxx;
    ps = -r7.x + ps;
    r2.xyz = r2.xyz - r17.yzw;
    r6.x = saturate(ps);
    r5.w = r2.z * r19.w - 2.0;
    r2.xyz = r2.xyz * r19.www + r17.yzw;
    ps = r12.y;
    r5.xyz = r6.xxx * r5.xyz;
    ps = r0.y * ps;
    r20.xyz = -r5.xyz + r19.xyz;
    r17.y = ps;
    r5.xyz = r20.xyz * r19.www + r5.xyz;
    r12.w = saturate(r7.z * r8.y - 0.5);
    ps = r12.x;
    r3.xyz = r3.xyz * r12.www;
    ps = r0.z * ps;
    r7.xyz = r18.wyz * UniformVector_4.zxy;
    r17.z = ps;
    r6.xw = r7.yz * r16.ww + r9.zw;
    ps = (-1.0) - -r7.x;
    r12.xy = r6.xw - r2.xy;
    r17.w = ps;
    r7 = r17 * r16.wwww;
    r7.xyz = r7.xyz * r15.zzz + r14.xyz;
    r0.xyz = r12.xyz * r12.wwz;
    ps = -r2.z;
    r2.xy = r2.xy + r0.xy;
    ps = r7.w + ps;
    r0.xyz = r0.zzz * r13.xyz;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r7.xyz = r7.xyz - r5.xyz;
    r7.w = ps;
    r7 = r7 * r12.wwww + r5;
    r2.z = r4.w * 2.0 + r7.w;
    r2.xyw = r2.xyz * r0.www;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r2.z = r2.w + 1.0;
    r6.y = ps;
    r2.xyz = (r0.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r0.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.y);
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xzy * r6.yyy;
    r6.x = ps;
    r5.xyz = r2.xyz * r6.xxx;
    r6.x = dot(r5.zxy, r11.zxy);
    r6.xyw = r5.xyz * r6.xxx;
    r6.xyw = r6.xyw * 2.0 - r11.xyz;
    r6.x = saturate(dot(r4.zxy, r6.wxy));
    ps = log2(r6.x);
    r2.xyz = r7.xyz * r10.xyz;
    r9.z = ps;
    ps = -SpotAngles.x - -r6.z;
    r7.xyw = r9.zyx * float3(15.0, 0.875, 0.875);
    r6.x = ps;
    r6.yz = r7.wy * r8.zw + 0.125;
    ps = pow(2.0, r7.x);
    r7.w = saturate(dot(r5.zyx, r4.zyx));
    r6.w = ps;
    ps = SpotAngles.y * r6.x;
    r7.xyz = r3.xyz * r6.www;
    r6.w = saturate(ps);
    r7.xy = r2.xy * r7.ww + r7.xy;
    r7.z = r2.z * r7.w + r7.z;
    r6.xw = r6.yw * r6.zw;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r6.www;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
