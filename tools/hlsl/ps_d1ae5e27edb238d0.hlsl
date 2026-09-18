// ps_d1ae5e27edb238d0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r14.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r10.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r4.w - 4e+02;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r9.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r9.x = saturate(r5.z * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r9.xyz = r9.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r10.zw = r8.xy * r9.xx;
    r10.y = ps;
    r5.xz = r10.xy - 0.5;
    r12.xy = float2((r10.xy >= 0.5));
    ps = r5.y;
    r5.xz = r5.xz - r10.xy;
    ps = abs(r7.x) * ps;
    r6.zw = r5.xz * r12.xy;
    r5.z = ps;
    ps = r5.w;
    r6 = r10 + r6.zwxy;
    ps = abs(r7.y) * ps;
    r5.xy = r6.xy + r6.xy;
    r5.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r10 = tex2D(Texture2D_1, r5.xy);
    r5.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    r11.xyz = r3.xyw * 2.0 - 1.0;
    r13.xyz = r0.xyz * 2.0 - 1.0;
    ps = r5.x + r5.x;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r0.y = ps;
    ps = r5.y + r5.y;
    r0.x = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r1.w = (r0.x == 0.0) ? r10.x : r10.y;
    r0 = r0.xzxy + float4(-3.0, -1.0, -2.0, -1.0);
    ps = r0.w;
    r5.xyw = r13.xyz * UniformVector_4.xyz;
    r1.w = (r0.z == 0.0) ? r10.z : r1.w;
    r15.z = (r0.x == 0.0) ? r10.w : r1.w;
    ps = r9.y + ps;
    r1.w = max(r15.z, 0.0);
    r0.x = ps;
    ps = r0.y;
    r7.x = min(r1.w, 0.3);
    ps = r9.z + ps;
    r10.xyz = r7.yxz * float3(0.875, 3.3333333, 0.875);
    r0.y = ps;
    r0.xy = r10.yy * r0.xy + r5.xy;
    ps = 1.0 / r4.w;
    r12.xy = r0.xy - r11.xy;
    r0.x = ps;
    r6.xy = r12.zw * r0.xx + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_4, r6.zw).xyz;
    r13.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = saturate(r4.w * 0.0001);
    ps = r1.z;
    r0.yzw = UniformVector_5.xyz * UniformVector_5.www;
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    r5.y = r8.w * r5.z - 1.0;
    ps = 1.0 - r5.x;
    r14.xyz = r0.yzw * r14.xyz;
    r5.z = saturate(ps);
    r4.xyz = r14.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = log2(r5.z);
    r0.z = saturate(r6.w * 5.0);
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.z = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = -r11.z;
    r13.xyz = r13.xyz * r2.www;
    ps = r5.w + ps;
    r0.xw = -r0.zx + 1.0;
    r10.w = ps;
    ps = rsqrt(abs(r5.z));
    r15.xy = r0.xx * ModShadowGroupColor.xy;
    r6.w = ps;
    ps = pow(2.0, r0.y);
    r5.xzw = -r15.zyx + 1.0;
    r0.y = ps;
    ps = 2.5 * r5.x;
    r3.xyz = r6.www * r1.xyz;
    r14.w = ps;
    r2.yzw = r10.yxz * r5.ywz + float3(1.0, 0.125, 0.125);
    r10.xyz = r14.xyz * r2.yyy - r9.xyz;
    r6.w = saturate(r14.w * r2.y - 0.5);
    ps = abs(r2.y) * abs(r2.y);
    r0.xyz = r13.xzy * r0.yyy;
    r5.w = ps;
    r5.xy = r12.xy * r6.ww + r11.xy;
    r5.z = r10.w * r6.w - 2.0;
    r1.xyz = r10.xyz * r6.www + r9.xyz;
    ps = r5.w * r5.w;
    r1.xyz = r1.xyz * r7.xyz;
    r2.x = ps;
    r5.z = r3.w * 2.0 + r5.z;
    r2.xy = r2.xz * r2.xw;
    r6.xyz = r2.yyy * r6.xyz + ModShadowColor.xyz;
    r5.xyz = r5.zxy * r0.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r0.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xxx * r4.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r6.www;
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
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
