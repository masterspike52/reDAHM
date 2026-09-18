// ps_bcecf68037618fd0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10041200 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
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
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r18 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r18.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r11.x = ps;
    r6.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = r4.w - 4e+02;
    r9.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r9.z = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.yz = r8.xy * r5.yy + ScreenPositionScaleBias.wz;
    r11.zw = r6.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r11.y = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r16.xyz = r11.yzw * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r11.zw = r8.xy * r16.xx;
    r11.y = ps;
    r5.xw = r11.xy - 0.5;
    r17.xy = float2((r11.xy >= 0.5));
    ps = r9.y;
    r5.xw = r5.xw - r11.xy;
    ps = abs(r7.x) * ps;
    r10.zw = r5.xw * r17.xy;
    r9.x = ps;
    ps = r9.z;
    r3 = r11.zwxy + r10;
    ps = abs(r7.y) * ps;
    r5.xw = r3.zw + r3.zw;
    r9.y = ps;
    r12.xyz = tex2D(Texture2D_4, r3.xy).xyz;
    r9.zw = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r15 = tex2D(Texture2D_1, r5.xw);
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r14.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r5.yzw = tex2D(Texture2D_2, r0.wz).wxy;
    r7.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.w = dot(r2.zxy, r2.zxy);
    r0.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r7.xyz = r7.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r6.xyz = r0.xyz * r18.xyz;
    r9.x = r6.w * r5.y - 1.0;
    ps = 0.1 - -r1.z;
    r0.xyz = r14.xyz * r2.www;
    r5.x = ps;
    r14.xyz = r10.xyz * 2.0 - 1.0;
    r10.xyz = r3.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r6.w = saturate(-r0.w + 1.0);
    r1.w = ps;
    ps = rsqrt(abs(r0.w));
    r3.xyz = r1.www * r1.xyz;
    r0.w = ps;
    r1.w = r14.z * UniformVector_4.z - r10.z;
    ps = log2(r6.w);
    r1.xyz = r0.www * -SpotDirection.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r4.x = saturate(r4.w * 0.0001);
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5.y = dot(r1.zxy, r2.zxy);
    r6.w = ps;
    ps = r5.z + r5.z;
    r0.xyz = r0.xzy * r6.www;
    r1.y = ps;
    ps = r5.w + r5.w;
    r1.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r1.z = ps;
    r5.w = (r1.x == 0.0) ? r15.x : r15.y;
    r2 = r1.yzxx + float4(-1.0, -1.0, -3.0, -2.0);
    ps = 5.0 * r5.x;
    r2.xy = r2.xy + r16.yz;
    r5.z = saturate(ps);
    r5.x = (r2.w == 0.0) ? r15.z : r5.w;
    r5.x = (r2.z == 0.0) ? r15.w : r5.x;
    ps = -SpotAngles.x - -r5.y;
    r6.w = max(r5.x, 0.0);
    r5.w = ps;
    ps = SpotAngles.y * r5.w;
    r5.xz = -r5.xz + 1.0;
    r4.w = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r9.y = min(r6.w, 0.3);
    r4.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r9.zyw * float3(0.875, 3.3333333, 0.875);
    r4.z = ps;
    ps = 2.5 * r5.x;
    r9.yzw = -r4.zyx + 1.0;
    r6.w = ps;
    r5.xy = r1.yy * r2.xy - r10.xy;
    r2.yz = r14.xy * UniformVector_4.xy + r5.xy;
    r4.xyz = r1.yxz * r9.xzy + float3(1.0, 0.125, 0.125);
    r2.w = saturate(r6.w * r4.x - 0.5);
    r1.xyz = r6.xyz * r4.xxx - r12.xyz;
    ps = abs(r4.x) * abs(r4.x);
    r6.xw = r4.yw * r4.zw;
    r5.y = ps;
    r6.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    r5.x = r1.w * r2.w - 2.0;
    r1.xyz = r1.xyz * r2.www + r12.xyz;
    ps = r5.y * r5.y;
    r1.xyz = r1.xyz * r11.xyz;
    r2.x = ps;
    r5.z = r3.w * 2.0 + r5.x;
    r4.xyz = r2.xyz * r2.xww;
    r5.xy = r10.xy + r4.yz;
    r5.xyz = r5.zxy * r9.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r9.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r4.xyz = r4.xxx * r7.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r2.xyz = r4.xyz * r2.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
