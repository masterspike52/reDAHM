// ps_b35ddd9da87df616.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 318 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004F8 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    r5.xy = r0.wz * 6.0;
    r5.z = r13.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r6.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r9.xy = r0.wz * UniformVector_1.xy;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = r4.w - 4e+02;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    r10.yz = r5.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r10.x = saturate(r1.w * 0.00022222222);
    r5.z = ps;
    ps = -r0.z;
    r8.xyz = r5.zzz * r3.xyz;
    ps = 1.0 + ps;
    r10.xyz = r10.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r11.zw = r8.xy * r10.zz;
    r11.y = ps;
    r3.xy = r11.xy - 0.5;
    r14.xw = float2((r11.xy >= 0.5));
    ps = r6.z;
    r3.xy = r3.xy - r11.xy;
    ps = abs(r7.x) * ps;
    r9.zw = r3.xy * r14.xw;
    r3.x = ps;
    ps = r6.w;
    r12 = r11.zwxy + r9;
    ps = abs(r7.y) * ps;
    r6.zw = r12.zw + r12.zw;
    r3.y = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r15 = tex2D(Texture2D_1, r6.zw);
    r3.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r5.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    ps = 0.1 - -r1.z;
    r6.w = ps;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    r0.zw = r5.yz * 2.0 - 1.0;
    ps = (-1.0) + r5.x;
    r0.x = saturate(r6.w * 5.0);
    r6.w = ps;
    ps = r7.x + r7.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r14.y = ps;
    ps = 0.0001 * r4.w;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = saturate(ps);
    ps = r7.y + r7.y;
    r5.yz = -r0.yx + 1.0;
    r14.z = ps;
    ps = UniformScalar_1.x * r5.y;
    r9.xyz = r3.xyw + r3.xyw;
    r11.w = ps;
    ps = r6.w;
    r14.x = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r6.w = (r14.x == 0.0) ? r15.x : r15.y;
    ps = r5.y * ps;
    r14 = r14.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r9.w = ps;
    ps = r14.z;
    r9 = r9 + float4(-1.0, -1.0, -1.0, 1.0);
    r6.w = (r14.y == 0.0) ? r15.z : r6.w;
    r6.w = (r14.x == 0.0) ? r15.w : r6.w;
    ps = r10.x + ps;
    r0.y = max(r6.w, 0.0);
    r0.x = ps;
    ps = r14.w;
    r11.x = min(r0.y, 0.3);
    ps = r10.y + ps;
    r11.xyz = r11.xyz * float3(3.3333333, 0.875, 0.875);
    r0.y = ps;
    r0 = r11.xxww * r0;
    r10.xy = r6.xy + r0.zw;
    r0.xy = r10.xy * UniformVector_4.xy + r0.xy;
    ps = 1.0 / r4.w;
    r10.xy = r0.xy - r9.xy;
    r0.x = ps;
    r0.xy = r10.zw * r0.xx + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.x = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r0.y = r5.w * r7.z - 1.0;
    ps = rsqrt(abs(r0.w));
    r5.w = saturate(-r0.w + 1.0);
    r0.w = ps;
    ps = log2(r5.w);
    r7.xyz = r0.www * -SpotDirection.xyz;
    r6.x = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.w = dot(r7.zxy, r2.zxy);
    r0.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r0.xzw = r0.xzw * r13.xyz;
    r6.y = ps;
    r13.w = r6.z * UniformVector_4.z - r9.z;
    ps = ModShadowGroupColor.y * r5.z;
    r14.xyz = r0.xzw * r9.www;
    r6.z = ps;
    r7.xyz = r14.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = rsqrt(abs(r5.x));
    r0.xzw = -r6.wzy + 1.0;
    r5.x = ps;
    ps = 2.5 * r0.x;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r14.w = ps;
    r11.yzw = r11.xyz * r0.ywz + float3(1.0, 0.125, 0.125);
    ps = abs(r11.y) * abs(r11.y);
    r2.xyz = r5.xxx * r1.xyz;
    r11.x = ps;
    r0.x = saturate(r14.w * r11.y - 0.5);
    r13.xyz = r14.xyz * r11.yyy - r12.xyz;
    r1.w = r13.w * r0.x - 2.0;
    r1.xyz = r13.xyz * r0.xxx + r12.xyz;
    ps = -SpotAngles.x - -r5.w;
    r0.yw = r11.xz * r11.xw;
    r5.x = ps;
    r6.yzw = r0.www * r6.yzw + ModShadowColor.xyz;
    ps = SpotAngles.y * r5.x;
    r1.xyz = r1.xyz * r4.xyz;
    r0.z = saturate(ps);
    r4.z = r3.w * 2.0 + r1.w;
    r4.xy = r10.xy * r0.xx + r9.xy;
    r4.xyw = r4.xyz * r5.yyy;
    ps = r0.y * r0.y;
    r4.z = r4.w + 1.0;
    r5.w = ps;
    r4.xyz = (r5.yyy > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r5.yyy >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.z * r0.z;
    r5.y = dot(r4.zxy, r4.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r0.yzw = r5.www * r7.xyz;
    r5.y = ps;
    r4.xyz = r4.xyz * r5.yyy;
    r5.y = dot(r4.zxy, r8.zxy);
    r5.yzw = r4.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r8.xyz;
    r5.y = saturate(dot(r2.zxy, r5.wyz));
    ps = log2(r5.y);
    r0.xyz = r0.yzw * r0.xxx;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r5.w = r5.y * 15.0;
    r5.y = ps;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r4.zyx, r2.zyx));
    r5.w = ps;
    ps = pow(2.0, r5.y);
    r0.xyz = r0.xyz * r5.www;
    r5.y = ps;
    r0.xy = r1.xy * r5.zz + r0.xy;
    r0.z = r1.z * r5.z + r0.z;
    r5.yzw = r0.xyz * r5.yyy;
    r5.yzw = r5.yzw * r3.xyz;
    r5.yzw = r5.yzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.ywz * r5.xxx;
    r5.xyz = r5.xzy * r6.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
