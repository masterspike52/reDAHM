// ps_b7516daba45c5ebd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 342 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000558 10041100 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r7.y = ps;
    r6.zw = r0.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r4.w - 4e+02;
    r7.z = ps;
    ps = r1.z;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r7.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r7.x));
    r5.w = r14.w - 0.5;
    r7.x = ps;
    ps = 5.0 * r5.y;
    r9.xyz = r7.xxx * r3.xyz;
    r5.y = saturate(ps);
    ps = 0.00022222222 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.z = saturate(ps);
    ps = (-0.025) * r5.z;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r9.xy * r5.ww;
    r3.y = ps;
    r5.xw = r3.xy - 0.5;
    r11.xw = float2((r3.xy >= 0.5));
    ps = r7.y;
    r5.xw = r5.xw - r3.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r5.xw * r11.xw;
    r7.x = ps;
    ps = r7.z;
    r12 = r3.zwxy + r10;
    ps = abs(r8.y) * ps;
    r5.xw = r12.zw + r12.zw;
    r7.y = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r15 = tex2D(Texture2D_1, r5.xw);
    r3.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r6.zw).xyw;
    ps = 0.0001 * r4.w;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r5.x = saturate(ps);
    r13.xyz = tex2D(Texture2D_3, r6.xy).xyw;
    r7.xyw = tex2D(Texture2D_0, r12.xy).xzy;
    r6.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    r8.xyz = r7.xwy * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r5.w = r13.z - 1.0;
    r16.y = ps;
    ps = r10.x + r10.x;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r17.x = ps;
    ps = r10.y + r10.y;
    r17.zw = r13.xy + r13.xy;
    r17.y = ps;
    ps = r3.x + r3.x;
    r17 = r17 - 1.0;
    r3.x = ps;
    ps = r3.y + r3.y;
    r5.yz = -r5.xy + 1.0;
    r3.y = ps;
    ps = r3.z + r3.z;
    r3.w = r5.w * r5.y;
    r3.z = ps;
    ps = r6.z + r6.z;
    r3 = r3.zwxy + float4(-1.0, 1.0, -1.0, -1.0);
    r16.z = ps;
    ps = UniformScalar_1.x * r5.y;
    r16.x = dot(r11.xww, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.x = (r16.x == 0.0) ? r15.x : r15.y;
    r11.xw = r5.ww * r17.zw + r3.zw;
    r13.xy = r11.xw * UniformVector_4.xy - r8.xy;
    r16 = r16.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r15.xy = r17.xy * 0.5 + r16.zw;
    r5.x = (r16.y == 0.0) ? r15.z : r5.x;
    r6.x = (r16.x == 0.0) ? r15.w : r5.x;
    r5.x = max(r6.x, 0.0);
    r11.x = min(r5.x, 0.3);
    ps = 1.0 / r4.w;
    r11.xyz = r11.xyz * float3(3.3333333, 0.875, 0.875);
    r5.x = ps;
    r13.xy = r11.xx * r15.xy + r13.xy;
    r5.xw = r13.zw * r5.xx + ScreenPositionScaleBias.wz;
    r3.z = tex2D(Texture2D_5, r0.xy).x;
    r10.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r5.xw).xyz;
    r4.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r1.zxy, r1.zxy);
    ps = -UniformVector_0.x;
    r5.w = dot(r2.zxy, r2.zxy);
    r6.y = r10.w * r6.y - 1.0;
    ps = 1.0 + ps;
    r0.xyz = r0.xyz * r2.www;
    r7.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(-r5.w + 1.0);
    r5.w = ps;
    ps = log2(r5.x);
    r15.xyz = r5.www * -SpotDirection.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.w = dot(r15.zxy, r2.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r6.z));
    r5.x = r6.w - SpotAngles.x;
    r6.z = ps;
    ps = SpotAngles.y * r5.x;
    r2.xyz = r4.xyz * r14.xyz;
    r2.w = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r4.xyz = r6.zzz * r1.xyz;
    r6.z = ps;
    r11.w = r3.x * UniformVector_4.z - r8.z;
    ps = ModShadowGroupColor.y * r5.z;
    r14.xyz = r2.xyz * r3.yyy;
    r6.w = ps;
    r1.xyz = r14.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = pow(2.0, r5.w);
    r6.xzw = -r6.xwz + 1.0;
    r5.x = ps;
    ps = 2.5 * r6.x;
    r0.xyz = r0.xzy * r5.xxx;
    r14.w = ps;
    r2.xyz = r11.xyz * r6.ywz + float3(1.0, 0.125, 0.125);
    r11.xyz = r14.xyz * r2.xxx - r10.xyz;
    r7.w = saturate(r14.w * r2.x - 0.5);
    r8.xy = r13.xy * r7.ww + r8.xy;
    ps = -UniformVector_0.y;
    r5.xw = r2.yw * r2.zw;
    r6.xyz = r5.xxx * r12.xyz + ModShadowColor.xyz;
    r10.xyz = r11.xyz * r7.www + r10.xyz;
    r6.w = r11.w * r7.w - 2.0;
    r8.z = r7.y * 2.0 + r6.w;
    ps = 1.0 + ps;
    r8.xyw = r8.xyz * r5.yyy;
    r7.y = ps;
    ps = -UniformVector_0.z;
    r8.z = r8.w + 1.0;
    r8.xyz = (r5.yyy > 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    r8.xyz = (r5.yyy >= 0.0) ? r8.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r8.zxy, r8.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r5.y));
    r7.xyz = r10.xyz * r7.xyz;
    r5.y = ps;
    r8.xyz = r8.xyz * r5.yyy;
    r5.y = dot(r8.zxy, r9.zxy);
    r10.xyz = r8.xyz * r5.yyy;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    r5.y = saturate(dot(r4.zxy, r9.zxy));
    ps = log2(r5.y);
    r6.w = saturate(dot(r8.zyx, r4.zyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r5.y = r5.y * 15.0;
    r5.z = ps;
    ps = abs(r2.x) * abs(r2.x);
    r0.w = r5.z * UniformScalar_10.x;
    r5.z = ps;
    ps = r5.z * r5.z;
    r3.x = r0.w * r3.y;
    r3.y = ps;
    r5.xz = r3.xy * r3.zy;
    r1.xyz = r1.xyz + r5.xxx;
    r1.xyz = r5.zzz * r1.xyz;
    ps = pow(2.0, r5.y);
    r1.xyz = r1.xyz * r7.www;
    r5.y = ps;
    r5.xyz = r1.xyz * r5.yyy;
    r7.xy = r7.xy * r6.ww + r5.xy;
    r7.z = r7.z * r6.w + r5.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r7.xzy * r5.www;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
