// ps_f4f0f15db4101314.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 342 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000558 10041200 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r1.z + 0.1;
    r6.y = ps;
    ps = rsqrt(abs(r5.z));
    r11.yw = r6.xy * abs(r8.xy);
    r5.w = ps;
    ps = r0.w;
    r6.yz = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r7.yz = r0.wz * 6.0;
    r12.x = ps;
    ps = -r0.z;
    r9.xy = r0.wz * UniformVector_7.xy;
    ps = 1.0 + ps;
    r8.xy = r0.wz * UniformVector_1.xy;
    r5.z = ps;
    ps = UniformVector_2.y * r5.z;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r12.y = ps;
    ps = r13.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.z));
    r10.xyz = r5.www * r3.xyz;
    r5.w = ps;
    ps = (-0.5) + r6.x;
    r3.xyz = r5.www * -SpotDirection.xyz;
    r5.w = ps;
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = 5.0 * r5.x;
    r6.x = dot(r3.zxy, r2.zxy);
    r5.w = saturate(ps);
    ps = (-0.025) * r5.y;
    r5.x = r6.x - SpotAngles.x;
    r6.x = ps;
    ps = SpotAngles.y * r5.x;
    r12.zw = r10.xy * r6.xx;
    r15.x = saturate(ps);
    ps = 1.0 / r4.w;
    r6.xw = r12.xy - 0.5;
    r15.w = ps;
    ps = r15.x * r15.x;
    r14.xw = float2((r12.xy >= 0.5));
    r7.x = ps;
    ps = r15.y * r15.w;
    r3.xy = r6.xw - r12.xy;
    r6.x = ps;
    ps = r15.z * r15.w;
    r8.zw = r3.xy * r14.xw;
    r5.x = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r8 = r12.zxwy + r8.xzyw;
    r6.x = ps;
    ps = ScreenPositionScaleBias.z + r5.x;
    r11.xz = r8.yw + r8.yw;
    r6.w = ps;
    r3.xyz = tex2D(Texture2D_8, r8.xz).xyz;
    r8.y = tex2D(Texture2D_5, r0.xy).x;
    r9.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r11.yw = tex2D(ModShadowAccumTexture, r11.yw).xy;
    r16 = tex2D(Texture2D_1, r11.xz);
    r17.xyz = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r8.xzw = tex2D(Texture2D_0, r8.xz).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r18.xyz = tex2D(Texture2D_2, r7.yz).xyw;
    r0.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyz = tex2D(Texture2D_3, r6.yz).xwy;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = r4.w;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = 0.0001 * ps;
    r14.yz = r6.xz + r6.xz;
    r5.x = saturate(ps);
    r13.w = r18.z * r0.w - 1.0;
    r6.zw = r18.xy * 2.0 - 1.0;
    ps = 1.0 - r5.z;
    r4.xyz = r15.xyz * r13.xyz;
    r5.z = saturate(ps);
    r15.xyz = r12.xyz * 2.0 - 1.0;
    r12.xyz = r8.xzw * 2.0 - 1.0;
    r11.z = r15.z * UniformVector_4.z - r12.z;
    ps = log2(r5.z);
    r13.yz = r0.yz + r0.yz;
    r5.z = ps;
    ps = rsqrt(abs(r0.x));
    r6.x = r5.z * LightColorAndFalloffExponent.w;
    r5.z = ps;
    ps = pow(2.0, r6.x);
    r0.xyz = r17.xyz * r2.www;
    r6.x = ps;
    ps = 1.0 - r5.w;
    r1.xyz = r5.zzz * r1.xyz;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r0.xyz = r0.xzy * r6.xxx;
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r13.x = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r5.x = (r13.x == 0.0) ? r16.x : r16.y;
    ps = ModShadowGroupColor.x * r5.z;
    r2 = r13.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.x = ps;
    r13.xy = r6.zw * 0.5 + r2.zw;
    r5.x = (r2.y == 0.0) ? r16.z : r5.x;
    r6.w = (r2.x == 0.0) ? r16.w : r5.x;
    ps = ModShadowGroupColor.y * r5.z;
    r5.x = max(r6.w, 0.0);
    r6.z = ps;
    ps = 1.0 - r6.x;
    r11.x = min(r5.x, 0.3);
    r5.w = ps;
    ps = 1.0 - r6.w;
    r11.xyw = r11.xyw * float3(3.3333333, 0.875, 0.875);
    r5.x = ps;
    ps = 1.0 - r6.z;
    r14.x = r11.y * r5.w;
    r13.z = ps;
    r2.xy = r11.xw * r13.wz + float2(1.0, 0.125);
    ps = 2.5 * r5.x;
    r14.yzw = r14.xyz + float3(0.125, -1.0, -1.0);
    r14.x = ps;
    r5.xw = r0.ww * r14.zw + r15.xy;
    r2.zw = r5.xw * UniformVector_4.xy - r12.xy;
    r5.xw = r14.xy * r2.xy;
    r7.yzw = r5.www * r7.yzw + ModShadowColor.xyz;
    r11.xy = r11.xx * r13.xy + r2.zw;
    ps = (-1.0) + r6.y;
    r5.x = saturate(r5.x - 0.5);
    r11.w = ps;
    r6.xy = r11.xy * r5.xx + r12.xy;
    r8.xz = r11.wz * r5.yx + float2(1.0, -2.0);
    r6.z = r8.w * 2.0 + r8.z;
    r6.xyw = r6.xyz * r5.yyy;
    ps = abs(r2.x) * abs(r2.x);
    r6.z = r6.w + 1.0;
    r5.w = ps;
    r6.xyz = (r5.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r5.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.w * r5.w;
    r5.y = dot(r6.zxy, r6.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.y));
    r0.w = r5.w * r5.w;
    r5.y = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r6.zxy, r10.zxy);
    r11.xyz = r6.xyz * r5.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r5.y = saturate(dot(r1.zxy, r10.zxy));
    ps = log2(r5.y);
    r5.w = saturate(dot(r6.zyx, r1.zyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r1.x = ps;
    ps = pow(2.0, r1.x);
    r6.w = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_10.x * r5.y;
    r1.x = ps;
    r4.w = r1.x * r8.x;
    r1 = r4 * r9.xyzx;
    r1 = r1 * r8.xxxy;
    r2.xyz = r1.xyz * r2.xxx - r3.xyz;
    r4.xyz = r1.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r1.xyz = r4.xyz + r1.www;
    r2.xyz = r2.xyz * r5.xxx + r3.xyz;
    r6.xyz = r2.xyz * r6.xyz;
    r1.xyz = r0.www * r1.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r1.xyz * r5.xxx;
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r7.xxx;
    r5.xyz = r5.xzy * r7.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
