// ps_61261872947cdea4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
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
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = 0.0001 * r4.w;
    r5.z = r13.w - 0.5;
    r3.w = saturate(ps);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r0.wz * 6.0;
    r9.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r4.w;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r6.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.w * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r12.xyw = r6.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r9.zw = r8.xy * r12.ww;
    r9.y = ps;
    ps = r0.w;
    r5.xw = r9.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r3.xz = float2((r9.xy >= 0.5));
    r6.x = ps;
    ps = r0.z;
    r5.xw = r5.xw - r9.xy;
    ps = UniformVector_1.y * ps;
    r6.zw = r5.xw * r3.xz;
    r6.y = ps;
    r9 = r9.zwxy + r6;
    r5.xw = r9.zw + r9.zw;
    r10 = tex2D(Texture2D_1, r5.xw);
    r6.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r5.yzw = tex2D(Texture2D_3, r5.yz).xyw;
    r16.xy = r5.yz * 2.0 - 1.0;
    ps = r6.y + r6.y;
    r17.yz = r4.xy * ScreenPositionScaleBias.xy;
    r3.y = ps;
    ps = r6.z + r6.z;
    r3.x = dot(r3.xzz, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r6.w = (r3.x == 0.0) ? r10.x : r10.y;
    ps = 0.1 - -r1.z;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r18 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r14.y = saturate(ps);
    r5.x = (r18.y == 0.0) ? r10.z : r6.w;
    r14.x = (r18.x == 0.0) ? r10.w : r5.x;
    ps = 1.0 / r4.w;
    r5.xy = -r14.yx + 1.0;
    r16.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.yz = r5.xx * ModShadowGroupColor.xy;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yzw = -r3.wzy + 1.0;
    r3.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r4.xy = r3.xy * abs(r7.xy);
    r17.x = ps;
    r3.xy = r17.yz * r16.zz + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r11.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r4.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r10.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r19.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.xyz = r7.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r6.x = r8.w * r6.x - 1.0;
    ps = rsqrt(abs(r5.z));
    r14.w = r5.w - 1.0;
    r1.w = ps;
    ps = 1.0 - r5.x;
    r13.xyz = r0.xyz * r13.xyz;
    r0.w = saturate(ps);
    r5.xzw = r19.zxy * 2.0 - 1.0;
    r0.xyz = r10.xyw * 2.0 - 1.0;
    r12.w = r5.x * UniformVector_4.z - r0.z;
    ps = log2(r0.w);
    r2.xyz = r1.www * r1.xyz;
    r5.x = ps;
    r12.xy = r18.zw + r12.xy;
    r0.w = max(r14.x, 0.0);
    r4.x = min(r0.w, 0.3);
    ps = 2.5 * r5.y;
    r14.xyz = r4.xyz * float3(3.3333333, 0.875, 0.875);
    r13.w = ps;
    r1 = r14 * r6.xwzy + float4(1.0, 0.125, 0.125, 1.0);
    r4.yz = r17.xx * r16.xy + r5.zw;
    ps = abs(r1.x) * abs(r1.x);
    r5.y = r1.y * r1.z;
    r0.w = ps;
    r5.yzw = r5.yyy * r15.xyz + ModShadowColor.xyz;
    ps = r0.w * r0.w;
    r13.xyz = r13.xyz * r1.www;
    r4.x = ps;
    r4.yz = r4.yz * UniformVector_4.xy - r0.xy;
    r4.yz = r14.xx * r12.xy + r4.yz;
    r4.w = saturate(r13.w * r1.x - 0.5);
    r12.xyz = r13.xyz * r1.xxx - r11.xyz;
    r0.z = r12.w * r4.w - 2.0;
    r10.xyz = r12.xyz * r4.www + r11.xyz;
    r1.xyw = r4.yzx * r4.wwx;
    r0.xy = r0.xy + r1.xy;
    r0.z = r10.w * 2.0 + r0.z;
    r0.xyz = r0.zxy * r6.yyy;
    ps = 1.0 + r0.x;
    r1.xyz = r10.xyz * r9.xyz;
    r0.w = ps;
    r0.xyz = (r6.yyy > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r1.www * r7.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r8.zxy);
    r7.xyz = r6.yzw * r6.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r6.x = saturate(dot(r2.zxy, r7.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r4.www;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.x = r6.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r0.xyz * r6.xxx;
    r5.x = ps;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.xxx;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
