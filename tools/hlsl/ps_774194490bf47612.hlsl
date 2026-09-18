// ps_774194490bf47612.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 330 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000528 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r15 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r9.z = ps;
    r6.zw = r0.wz * 6.0;
    r9.xy = r0.xy * UniformScalar_0.xx;
    r11.zw = r0.wz * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r9.w = ps;
    ps = r4.w;
    r12.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r10.xy = r8.xy * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r5.w = r15.w - 0.5;
    r6.x = ps;
    ps = 0.00022222222 * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r6.x = saturate(ps);
    ps = 5.0 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.x;
    r3.x = r0.w * UniformVector_2.x;
    r5.y = ps;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r8.xy * r5.yy;
    r3.y = ps;
    r5.xy = r3.xy - 0.5;
    r16.xw = float2((r3.xy >= 0.5));
    ps = r9.z;
    r5.xy = r5.xy - r3.xy;
    ps = abs(r7.x) * ps;
    r12.zw = r5.xy * r16.xw;
    r11.x = ps;
    ps = r9.w;
    r5 = r3.zwxy + r12;
    ps = abs(r7.y) * ps;
    r9.zw = r5.zw + r5.zw;
    r11.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r11.zw).xyz;
    r16.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r17 = tex2D(Texture2D_1, r9.zw);
    r7.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_3, r9.xy).wxy;
    r18.xyz = tex2D(Texture2D_2, r6.zw).xyw;
    r19.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r9.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r1.zxy, r1.zxy);
    r5.w = dot(r2.zxy, r2.zxy);
    r0.xzw = UniformVector_5.xyz * UniformVector_5.www;
    r9.xyz = r9.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r0.y = r18.z * r19.z - 1.0;
    ps = r18.x + r18.x;
    r15.xyz = r0.xzw * r15.xyz;
    r18.x = ps;
    ps = r18.y + r18.y;
    r18.zw = r5.yz + r5.yz;
    r18.y = ps;
    r0.xzw = r12.xzy * 2.0 - 1.0;
    r12.xyz = r7.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r5.y = saturate(-r5.w + 1.0);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r7.xyz = r5.zzz * r1.xyz;
    r5.z = ps;
    r1.w = r0.z * UniformVector_4.z - r12.z;
    ps = log2(r5.y);
    r1.xyz = r5.zzz * -SpotDirection.xyz;
    r5.z = ps;
    ps = r4.w;
    r18 = r18 - 1.0;
    ps = 0.0001 * ps;
    r5.y = dot(r1.zxy, r2.zxy);
    r6.z = saturate(ps);
    r6.xz = -r6.zy + 1.0;
    ps = r19.x + r19.x;
    r5.w = r6.x * UniformScalar_1.x;
    r0.z = ps;
    r6.yw = r5.ww * r18.zw + r0.xw;
    r6.yw = r6.yw * UniformVector_4.xy - r12.xy;
    ps = r19.y + r19.y;
    r0.x = dot(r16.xww, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r5.w = (r0.x == 0.0) ? r17.x : r17.y;
    r2 = r0.zwxx + float4(-1.0, -1.0, -3.0, -2.0);
    r2.xy = r18.xy * 0.5 + r2.xy;
    r5.w = (r2.w == 0.0) ? r17.z : r5.w;
    r0.w = (r2.z == 0.0) ? r17.w : r5.w;
    ps = ModShadowGroupColor.x * r6.z;
    r5.w = max(r0.w, 0.0);
    r0.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r16.x = min(r5.w, 0.3);
    r0.z = ps;
    ps = (-1.0) + r5.x;
    r0.xzw = -r0.wzx + 1.0;
    r5.x = ps;
    ps = r5.x;
    r1.xyz = r16.xyz * float3(3.3333333, 0.875, 0.875);
    r4.yz = r1.xx * r2.xy + r6.yw;
    ps = r6.x * ps;
    r2.yzw = r1.xzy * r0.yzw;
    r2.x = ps;
    ps = 2.5 * r0.x;
    r2 = r2.xywz + float4(1.0, 1.0, 0.125, 0.125);
    r13.w = ps;
    ps = abs(r2.y) * abs(r2.y);
    r0.xyz = r15.xyz * r13.xyz;
    r4.x = ps;
    ps = r2.z * r2.w;
    r13.xyz = r0.xyz * r2.xxx;
    r5.x = ps;
    r0.xyz = r5.xxx * r14.xyz + ModShadowColor.xyz;
    r4.w = saturate(r13.w * r2.y - 0.5);
    r1.xyz = r13.xyz * r2.yyy - r10.xyz;
    r5.w = r1.w * r4.w - 2.0;
    r1.xyz = r1.xyz * r4.www + r10.xyz;
    r10.yzw = r4.xyz * r4.xww;
    ps = -SpotAngles.x - -r5.y;
    r2.xy = r12.xy + r10.zw;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r1.xyz = r1.xyz * r11.xyz;
    r10.x = saturate(ps);
    r2.z = r7.w * 2.0 + r5.w;
    r2.xyw = r2.xyz * r6.xxx;
    ps = r10.x * r10.x;
    r2.z = r2.w + 1.0;
    r5.x = ps;
    r2.xyz = (r6.xxx > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r6.xxx >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = r10.y * r10.y;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r5.www * r9.xyz;
    r5.y = ps;
    r2.xyz = r2.xyz * r5.yyy;
    r5.y = dot(r2.zxy, r8.zxy);
    r9.xyz = r2.xyz * r5.yyy;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.y = saturate(dot(r7.zxy, r8.zxy));
    ps = log2(r5.y);
    r6.xyz = r6.xyz * r4.www;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r5.w = r5.y * 15.0;
    r5.y = ps;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r2.zyx, r7.zyx));
    r5.w = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.www;
    r5.y = ps;
    r6.xy = r1.xy * r5.zz + r6.xy;
    r6.z = r1.z * r5.z + r6.z;
    r5.yzw = r6.xyz * r5.yyy;
    r5.yzw = r5.yzw * r3.xyz;
    r5.yzw = r5.yzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.ywz * r5.xxx;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
