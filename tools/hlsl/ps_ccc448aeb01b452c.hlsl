// ps_ccc448aeb01b452c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041100 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    r10.x = ps;
    r6.zw = r0.xy * UniformScalar_0.xx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r10.y = ps;
    ps = r4.w;
    r7.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r7.z = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r7.z));
    r5.w = r14.w - 0.5;
    r7.z = ps;
    ps = 0.00022222222 * r5.y;
    r9.xyz = r7.zzz * r3.xyz;
    r5.y = saturate(ps);
    ps = 5.0 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.z = saturate(ps);
    ps = (-0.025) * r5.y;
    r11.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.x;
    r11.zw = r9.xy * r5.ww;
    r11.y = ps;
    r5.xw = r11.xy - 0.5;
    r16.xw = float2((r11.xy >= 0.5));
    ps = r10.x;
    r5.xw = r5.xw - r11.xy;
    ps = abs(r8.x) * ps;
    r7.zw = r5.xw * r16.xw;
    r3.x = ps;
    ps = r10.y;
    r7 = r11.zwyx + r7.xywz;
    ps = abs(r8.y) * ps;
    r5.xw = r7.wz + r7.wz;
    r3.y = ps;
    r16.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r15 = tex2D(Texture2D_1, r5.xw);
    r8.xyz = tex2D(Texture2D_3, r6.zw).xyw;
    ps = 0.0001 * r4.w;
    r6.xy = r0.wz * 6.0;
    r5.x = saturate(ps);
    r11.xzw = tex2D(Texture2D_2, r6.xy).wxy;
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r12.xyz = r3.xyw * 2.0 - 1.0;
    r6.xyw = r6.xyz * 2.0 - 1.0;
    ps = r11.z + r11.z;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r17.x = ps;
    ps = r11.w + r11.w;
    r17.zw = r8.xy + r8.xy;
    r17.y = ps;
    r17 = r17 - 1.0;
    r11.zw = -r5.xz + 1.0;
    ps = r10.x + r10.x;
    r5.x = r11.z * UniformScalar_1.x;
    r5.y = ps;
    r5.xz = r5.xx * r17.zw + r6.xy;
    r13.xy = r5.xz * UniformVector_4.xy - r12.xy;
    ps = r10.y + r10.y;
    r5.x = dot(r16.xww, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r6.z = (r5.x == 0.0) ? r15.x : r15.y;
    r5 = r5.xxyz + float4(-2.0, -3.0, -1.0, -1.0);
    r15.xy = r17.xy * 0.5 + r5.zw;
    r5.x = (r5.x == 0.0) ? r15.z : r6.z;
    r6.x = (r5.y == 0.0) ? r15.w : r5.x;
    r5.x = max(r6.x, 0.0);
    r16.x = min(r5.x, 0.3);
    ps = 1.0 / r4.w;
    r5.yzw = r16.xyz * float3(3.3333333, 0.875, 0.875);
    r5.x = ps;
    r13.xy = r5.yy * r15.xy + r13.xy;
    r4.xy = r13.zw * r5.xx + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r7.w = tex2D(Texture2D_5, r0.xy).x;
    r10.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.z = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    r6.y = r11.x * r10.w - 1.0;
    ps = rsqrt(abs(r6.z));
    r11.x = r8.z - 1.0;
    r6.z = ps;
    ps = 1.0 - r5.x;
    r4.xyz = r0.xyz * r14.xyz;
    r5.x = saturate(ps);
    r4.w = r6.w * UniformVector_4.z - r12.z;
    ps = log2(r5.x);
    r2.xyz = r6.zzz * r1.xyz;
    r5.x = ps;
    r6.zw = r11.ww * ModShadowGroupColor.xy;
    r6.xzw = -r6.xwz + 1.0;
    r5.yzw = r5.yzw * r6.ywz + float3(1.0, 0.125, 0.125);
    ps = abs(r5.y) * abs(r5.y);
    r0.x = r5.z * r5.w;
    r11.y = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r7.xz = r11.xy * r11.zy;
    ps = 1.0 + r7.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = 2.5 * r6.x;
    r14.xyz = r4.xyz * r7.yyy;
    r14.w = ps;
    r1.xyz = r14.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r4.xyz = r14.xyz * r5.yyy - r10.xyz;
    r5.w = saturate(r14.w * r5.y - 0.5);
    r6.xy = r13.xy * r5.ww + r12.xy;
    r10.xyz = r4.xyz * r5.www + r10.xyz;
    r5.y = r4.w * r5.w - 2.0;
    r6.z = r3.w * 2.0 + r5.y;
    r6.xyz = r6.zxy * r11.zzz;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r11.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r4.xyz = (r11.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.y));
    r6.yzw = r10.xyz * r8.xyz;
    r5.y = ps;
    r4.xyz = r4.xyz * r5.yyy;
    r5.y = dot(r4.zxy, r9.zxy);
    r8.xyz = r4.xyz * r5.yyy;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    r5.y = saturate(dot(r2.zxy, r8.zxy));
    ps = log2(r5.y);
    r6.x = saturate(dot(r4.zyx, r2.zyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r5.z = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_10.x * r5.y;
    r5.y = ps;
    r7.y = r5.y * r7.y;
    r7.xw = r7.yz * r7.wz;
    r7.xyz = r1.xyz + r7.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r7.xyz = r7.www * r7.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r7.xyz = r7.xyz * r5.www;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r7.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
