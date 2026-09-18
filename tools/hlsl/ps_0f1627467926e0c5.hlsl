// ps_0f1627467926e0c5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 357 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000594 10041500 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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

    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r10 = r6 * r1.wzwz;
    r9.xyz = tex2D(Texture2D_1, r10.zw).zxy;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r6.yz = r1.xy * UniformScalar_0.xx;
    r11.zw = r1.xy * UniformScalar_2.xx;
    ps = -r1.z;
    r12.xy = r1.wz * UniformScalar_5.xx;
    ps = 1.0 + ps;
    r0.yz = r5.xy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = r2.z;
    r7.xz = UniformVector_1.xy * 1.7;
    ps = 0.1 + ps;
    r2.w = float((r1.w >= 0.5));
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = r7.xz * r1.wz;
    r7.x = ps;
    ps = 1.0 / r5.w;
    r17.w = float((r7.y >= 0.5));
    r0.w = ps;
    r9.w = r2.w * (-0.5) + r1.w;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyz = r0.yzx * r0.wwx;
    r7.z = ps;
    ps = 5.0 * r6.x;
    r8.xy = r7.xz * abs(r8.xy);
    r7.x = saturate(ps);
    ps = ScreenPositionScaleBias.w + r0.x;
    r7.xz = -r7.yx + float2(0.5, 1.0);
    r6.x = ps;
    ps = ScreenPositionScaleBias.z + r0.y;
    r7.x = r7.x - r1.z;
    r6.w = ps;
    r7.x = dot(r7.xx, r17.ww) - r1.z;
    ps = r9.x + r9.x;
    r7.x = r7.x + 2.0;
    r7.w = ps;
    ps = r9.w + r9.w;
    r7.y = r7.x - r1.z;
    r7.x = ps;
    r12.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r15.xyz = tex2D(Texture2D_5, r10.zw).xyz;
    r18.zw = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r13 = tex2D(Texture2D_2, r7.xy);
    r1.yzw = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r17.xyz = tex2D(Texture2D_4, r11.zw).xyz;
    r14.xyz = tex2D(Texture2D_6, r11.zw).xyz;
    r8 = tex2D(Texture2D_3, r11.xy);
    r21 = tex2D(Texture2D_3, r10.xy);
    r0.xyw = tex2D(Texture2D_0, r6.yz).xwy;
    r1.x = saturate(r5.w * 0.0001);
    ps = (-1.0) + r0.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r18.x = ps;
    ps = 1.0 - r6.x;
    r20.z = r8.z + r21.z;
    r7.y = saturate(ps);
    ps = 4.0 * r9.y;
    r6.z = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = r21.w * r8.w;
    r5.x = ps;
    ps = 4.0 * r9.z;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r11.y = ps;
    ps = r8.x + r8.x;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = r8.y + r8.y;
    r5.w = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = r0.x + r0.x;
    r4.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r9.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.xxx * r2.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r2.xxx * r4.xyz;
    r6.x = ps;
    ps = r0.w + r0.w;
    r2.xyz = r6.xxx * -SpotDirection.xyz;
    r9.y = ps;
    ps = 1.0 - r6.y;
    r19.xyz = r4.www - r14.xyz;
    r9.w = ps;
    r4.xyz = r17.zxy * 2.0 - 1.0;
    ps = log2(r7.y);
    r1.yzw = r0.zzz * r1.yzw;
    r6.x = ps;
    r14.xyz = r19.xyz * UniformScalar_4.xxx + r14.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.y = dot(r2.zxy, r3.zxy);
    r0.z = ps;
    r9.z = r17.w * 2.0 + r2.w;
    r6.x = (r9.z == 0.0) ? r13.x : r13.y;
    ps = pow(2.0, r0.z);
    r17.xyz = r14.xyz * UniformVector_4.xyz;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r3.xyz = r1.ywz * r0.zzz;
    r1.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r2 = r9.xyzz + float4(-1.0, -1.0, -2.0, -3.0);
    r1.z = ps;
    r6.x = (r2.z == 0.0) ? r13.z : r6.x;
    ps = (-1.0) - -r6.y;
    r1.yzw = -r1.xyz + 1.0;
    r1.x = ps;
    r6.x = (r2.w == 0.0) ? r13.w : r6.x;
    ps = UniformScalar_1.x * r1.y;
    r7.z = max(r6.x, 0.0);
    r2.w = ps;
    ps = 1.0 - r6.x;
    r11.zw = r2.ww * r2.xy;
    r6.y = ps;
    ps = 2.5 * r6.y;
    r18.y = min(r7.z, 0.3);
    r7.z = ps;
    ps = (-0.75) + r6.x;
    r19.xy = r4.yz + r11.zw;
    r20.w = ps;
    ps = (-3.0) + r6.z;
    r13 = r11 - 2.0;
    r20.x = ps;
    ps = (-3.0) + r6.w;
    r2.xy = r13.xy + r11.zw;
    r20.y = ps;
    r9.xyz = r21.xyz * float3(4.0, 4.0, 1.0) + r20.xyz;
    ps = r20.w;
    r18.yzw = r18.yzw * float3(3.3333333, 0.875, 0.875);
    ps = r6.x + ps;
    r9.xyz = r18.yyy * r9.xyz;
    r0.z = ps;
    r6.xy = r19.xy * UniformVector_3.xy - r2.xy;
    r4.yz = r9.xy * 2.0 + r6.xy;
    r6 = r18 * r1.yxzw + float4(1.0, 1.0, 0.125, 0.125);
    r4.w = saturate(r7.z * r6.y - 0.5);
    r7.z = (r2.w > 0.0) ? r6.x : 1.0;
    ps = r6.z * r6.w;
    r9.xy = r9.zw * float2(0.1, 0.5);
    r2.x = ps;
    r2.xyz = r2.xxx * r16.xyz + ModShadowColor.xyz;
    r12.w = r4.x * UniformVector_3.z + r9.x;
    r7.z = (r2.w >= 0.0) ? r7.z : 1.0;
    r0.z = saturate(r0.z + r9.y);
    ps = -SpotAngles.x - -r7.y;
    r16.xyz = r0.zzz * r15.xyz;
    r6.x = ps;
    ps = abs(r6.y) * abs(r6.y);
    r12.xyz = r7.zzz * r12.xyz;
    r4.x = ps;
    ps = (-1.0) + r7.w;
    r9.yzw = r4.xyz * r4.xww;
    r6.y = ps;
    ps = 0.5 * r6.y;
    r15.xyz = r12.xyz * UniformVector_4.xyz;
    r7.w = ps;
    ps = SpotAngles.y * r6.x;
    r13.xy = r13.zw + r9.zw;
    r9.x = saturate(ps);
    ps = r9.x * r9.x;
    r12.xyz = r17.xyz * r12.xyz;
    r6.x = ps;
    ps = r13.x;
    r7.xyz = r16.xyz * r0.yyy;
    ps = r11.x + ps;
    r6.yzw = r15.xyz * r14.xyz;
    r0.x = ps;
    ps = r13.y;
    r12 = r12 - r7;
    r6.yzw = r6.ywz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r7 = r12.wxyz * r4.wwww + r7.wxyz;
    ps = r11.y + ps;
    r0.z = r7.x - 1.0;
    r0.y = ps;
    ps = r9.y * r9.y;
    r0.xyw = r0.xyz * r1.yyy;
    r7.x = ps;
    ps = r7.x;
    r0.z = r0.w + 1.0;
    r0.xyz = (r1.yyy > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r1.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = r6.y * ps;
    r0.y = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r7.yzw = r7.yzw * r10.xyz;
    r0.y = ps;
    ps = r7.x;
    r1.xyz = r1.xyz * r0.yyy;
    ps = r6.w * ps;
    r0.z = dot(r1.zxy, r8.zxy);
    r0.y = ps;
    ps = r7.x;
    r9.xyz = r1.xyz * r0.zzz;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = r6.z * ps;
    r6.y = saturate(dot(r5.zxy, r8.zxy));
    r0.z = ps;
    ps = log2(r6.y);
    r0.xyz = r0.xyz * r4.www;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r7.x = saturate(dot(r1.zyx, r5.zyx));
    r6.y = ps;
    r6.yzw = r0.xyz * r6.yyy;
    r6.yz = r7.yz * r7.xx + r6.yz;
    r6.w = r7.w * r7.x + r6.w;
    r6.yzw = r3.xzy * r6.yzw;
    r6.yzw = r6.yzw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.ywz * r6.xxx;
    r6.xyz = r6.xzy * r2.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
