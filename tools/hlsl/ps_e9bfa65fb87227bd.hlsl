// ps_e9bfa65fb87227bd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 318 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004F8 10041500 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
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

    r20 = tex2D(Texture2D_6, r1.xy);
    r6.z = r20.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r1.w;
    r6.xy = r1.wz * 6.0;
    r10.x = ps;
    r7.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r5.w;
    r0.zw = r1.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    r6.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.w = ps;
    ps = -r1.z;
    r9.xyz = r6.www * r4.xyz;
    ps = 1.0 + ps;
    r14.xyw = r6.xyz * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r10.zw = r9.xy * r14.xx;
    r10.y = ps;
    ps = r1.w;
    r6.yz = r10.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r4.xw = float2((r10.xy >= 0.5));
    r6.x = ps;
    ps = r1.z;
    r6.yz = r6.yz - r10.xy;
    ps = UniformVector_1.y * ps;
    r6.zw = r6.yz * r4.xw;
    r6.y = ps;
    r10 = r10.zwxy + r6;
    r6.xy = r10.zw + r10.zw;
    r11 = tex2D(Texture2D_1, r6.xy);
    r6.yzw = tex2D(Texture2D_2, r1.wz).xwy;
    r7.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    ps = r5.w;
    r0.zw = r1.wz * UniformVector_6.xy;
    ps = 0.0001 * ps;
    r6.x = r2.z + 0.1;
    r4.z = saturate(ps);
    r15.xy = r7.yz * 2.0 - 1.0;
    ps = r6.y + r6.y;
    r16.yz = r5.xy * ScreenPositionScaleBias.xy;
    r4.y = ps;
    ps = r6.w + r6.w;
    r4.x = dot(r4.xww, float3(1.0, 1.0, 1.0));
    r4.w = ps;
    r2.w = (r4.x == 0.0) ? r11.x : r11.y;
    ps = 5.0 * r6.x;
    r17 = r4.xxyw + float4(-3.0, -2.0, -1.0, -1.0);
    r18.y = saturate(ps);
    r6.x = (r17.y == 0.0) ? r11.z : r2.w;
    r18.x = (r17.x == 0.0) ? r11.w : r6.x;
    ps = 1.0 / r5.w;
    r6.xw = -r18.yx + 1.0;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xy = r6.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.yzw = -r4.zyx + 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r4.y;
    r5.xy = r5.xy * abs(r8.xy);
    r16.x = ps;
    r5.zw = r16.yz * r15.zz + ScreenPositionScaleBias.wz;
    r11.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r14.x = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r19.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r5.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r1.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r21.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r6.y = dot(r2.zxy, r2.zxy);
    r21.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r21.z = ps;
    r4.x = r7.w * r6.z - 1.0;
    r12.xyw = r1.xyz * 2.0 - 1.0;
    r1.xyz = r5.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r20.xyz = r21.xyz * r20.xyz;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r5.xyz = r6.yyy * r2.xyz;
    r6.y = saturate(ps);
    r10.w = r12.w * UniformVector_4.z - r1.z;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r20.xyz * r19.xyz;
    r6.x = ps;
    ps = log2(r6.y);
    r19.xyz = r6.xxx * -SpotDirection.xyz;
    r6.y = ps;
    ps = (-1.0) + r7.x;
    r6.z = dot(r19.zxy, r3.zxy);
    r13.w = ps;
    ps = -SpotAngles.x - -r6.z;
    r7.x = max(r18.x, 0.0);
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r13.x = min(r7.x, 0.3);
    r14.z = saturate(ps);
    ps = 2.5 * r6.w;
    r13.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r12.w = ps;
    r7 = r13.yzwx * r4.wzyx + float4(0.125, 0.125, 1.0, 1.0);
    ps = abs(r7.w) * abs(r7.w);
    r3.zw = r17.zw + r14.yw;
    r14.y = ps;
    r3.xy = r16.xx * r15.xy + r12.xy;
    ps = r7.x * r7.y;
    r12.xyz = r2.xyz * r7.zzz;
    r6.x = ps;
    r6.xzw = r6.xxx * r10.xyz + ModShadowColor.xyz;
    r2.xyz = r12.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r3.xy = r3.xy * UniformVector_4.xy - r1.xy;
    r10.xyz = r12.xyz * r7.www - r8.xyz;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r7.xyz = r14.zxy * r14.zxy;
    r6.y = ps;
    r3.xy = r13.xx * r3.zw + r3.xy;
    r0.w = saturate(r12.w * r7.w - 0.5);
    r3.xy = r3.xy * r0.ww + r1.xy;
    ps = pow(2.0, r6.y);
    r1.xyz = r7.yyy * r11.xyz;
    r7.w = ps;
    r8.xyz = r10.xyz * r0.www + r8.xyz;
    r6.y = r10.w * r0.w - 2.0;
    r3.z = r5.w * 2.0 + r6.y;
    ps = r7.z * r7.z;
    r3.xyw = r3.xyz * r4.yyy;
    r6.y = ps;
    ps = r6.y;
    r3.z = r3.w + 1.0;
    r3.xyz = (r4.yyy > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r4.yyy >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.x * ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r1.w));
    r0.xyz = r8.xyz * r0.xyz;
    r1.w = ps;
    ps = r6.y;
    r3.xyz = r3.xyz * r1.www;
    ps = r2.y * ps;
    r1.w = dot(r3.zxy, r9.zxy);
    r2.y = ps;
    ps = r6.y;
    r4.xyz = r3.xyz * r1.www;
    r4.xyz = r4.xyz * 2.0 - r9.xyz;
    ps = r2.z * ps;
    r6.y = saturate(dot(r5.zxy, r4.zxy));
    r2.z = ps;
    ps = log2(r6.y);
    r2.xyz = r2.xyz * r0.www;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r1.xyz = r1.xzy * r7.www;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.y = saturate(dot(r3.zyx, r5.zyx));
    r7.w = ps;
    r7.yzw = r2.xyz * r7.www;
    r0.xy = r0.xy * r6.yy + r7.yz;
    r0.z = r0.z * r6.y + r7.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.xxx;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
