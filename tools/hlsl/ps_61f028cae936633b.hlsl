// ps_61f028cae936633b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c22); // float2
float4 SpotDirection : register(c21); // float3
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_9, r0.xy);
    ps = (-0.5) + r15.w;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r11.yw = saturate(UniformVector_12.xy);
    r9.y = UniformScalar_4.x * UniformScalar_5.x;
    ps = r0.w;
    r9.zw = UniformVector_1.xy + UniformVector_1.xy;
    ps = UniformVector_2.x * ps;
    r18.y = -r0.z + 1.0;
    r11.z = ps;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.y = r4.w - 2e+02;
    r6.x = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r6.xy = saturate(r6.xy * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = UniformVector_4.x * r5.y;
    r6.zw = r0.wz * UniformVector_1.xy;
    r16.y = ps;
    ps = UniformVector_4.y * r5.z;
    r10.xyz = r5.www * r3.xyz;
    r16.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r1.w = r6.y * (-0.1);
    r5.w = ps;
    r6.zw = r10.xy * r1.ww + r6.zw;
    ps = UniformVector_4.z * r5.x;
    r16.x = r6.w * r5.w;
    r16.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r18.xw = -r16.xw + 1.0;
    r18.z = ps;
    ps = UniformScalar_3.x;
    r3.xzw = r18.zxy * UniformVector_2.xyy;
    ps = UniformVector_4.x * ps;
    r5.xz = r3.zw - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.zw = float2((r3.zw >= 0.5));
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.xy = r5.xz - r3.zw;
    r8.w = ps;
    ps = UniformScalar_5.x * r5.y;
    r8.xy = r0.wz * UniformVector_14.xy;
    r9.x = ps;
    ps = r3.x;
    r12.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = r6.z * ps;
    r5.zw = r9.zw * r0.wz;
    r11.x = ps;
    ps = r13.z + r13.z;
    r8.zw = r8.zw * abs(r7.xy);
    r9.z = ps;
    ps = r13.w + r13.w;
    r7.zw = r11.xz - 0.5;
    r9.w = ps;
    ps = floor(r9.x);
    r7.xy = float2((r11.xz >= 0.5));
    r5.x = ps;
    ps = floor(r9.y);
    r7.zw = r7.zw - r11.xz;
    r5.y = ps;
    r11.xz = r7.zw * r7.xy + r11.xz;
    r5.xy = r5.xy * UniformVector_11.xy - r9.xy;
    r7.zw = r5.xy * r11.yw;
    r9 = r9 + r7.zwxy;
    r5.xy = r0.xy * UniformVector_13.xy + r9.xy;
    r5.xy = r5.xy * UniformVector_8.xy;
    ps = 1.0 / UniformVector_10.x;
    r14.zw = frac(r5.xy);
    r13.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r5.xy = float2((UniformVector_10.xy >= r14.zw));
    r13.y = ps;
    ps = r5.x * r5.y;
    r3.xy = float2((UniformVector_10.yx > r14.wz));
    r5.x = ps;
    ps = r5.x;
    r7 = r14 * r13.zwxy;
    ps = r3.x * ps;
    r11.yw = r3.zw + r7.xy;
    r12.x = ps;
    ps = 1.0 / r4.w;
    r11 = r11 + r11;
    r3.z = ps;
    ps = r0.w + r0.w;
    r3.xyw = r12.yzx * r3.zzy;
    r5.x = ps;
    ps = r0.z + r0.z;
    r12.xy = r3.xy + ScreenPositionScaleBias.wz;
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r12.xy).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r14 = tex2D(Texture2D_2, r5.zw);
    r21.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r23 = tex2D(Texture2D_3, r11.zw);
    r24 = tex2D(Texture2D_3, r11.xy);
    r11.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    r17.xyz = tex2D(Texture2D_1, r5.zw).xyz;
    r0.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    r8 = tex2D(Texture2D_6, r7.zw);
    r5.yzw = tex2D(Texture2D_4, r5.xy).wxy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = dot(r1.zxy, r1.zxy);
    r6.w = float((UniformScalar_12.x >= 1.0));
    ps = r4.w;
    r1.w = float((UniformScalar_12.x > 1.0));
    ps = 0.0001 * ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.z = saturate(ps);
    ps = (-1.0) + r5.y;
    r12.xyz = r8.xyz * r8.www;
    r20.x = ps;
    r20.yz = r5.zw * 2.0 - 1.0;
    r8.xyz = r0.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r22.yzw = r17.xyz + r17.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r4.xyz = r15.xyz * UniformScalar_13.xxx;
    r5.x = saturate(ps);
    r11.xyz = (-abs(r1.www) >= 0.0) ? r11.xyz : 1.0;
    r17.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r11.xyz;
    ps = log2(r5.x);
    r5.yzw = r5.yyy * -SpotDirection.xyz;
    r5.x = ps;
    r11.xyz = r4.xyz * r17.xyz + UniformScalar_14.xxx;
    ps = 1.0 - r6.x;
    r5.y = dot(r5.wyz, r2.zxy);
    r5.z = ps;
    r6.x = (r9.z == 0.0) ? r24.x : r24.y;
    r5.w = (r9.w == 0.0) ? r23.x : r23.y;
    ps = ModShadowGroupColor.x * r5.z;
    r2 = r9.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r6.w = ps;
    r5.w = (r2.z == 0.0) ? r23.z : r5.w;
    r6.x = (r2.y == 0.0) ? r24.z : r6.x;
    r22.x = (r2.x == 0.0) ? r24.w : r6.x;
    r6.x = (r2.w == 0.0) ? r23.w : r5.w;
    ps = 1.0 - r6.x;
    r5.w = max(r6.x, 0.0);
    r2.x = ps;
    ps = 1.0 - r6.z;
    r5.w = min(r5.w, 0.3);
    r2.w = ps;
    ps = rsqrt(abs(r0.z));
    r23 = r22 + float4(-0.75, -1.0, -1.0, -1.0);
    r6.x = ps;
    ps = r23.x;
    r4.xyz = r6.xxx * r1.xyz;
    ps = r22.x + ps;
    r1.xzw = r23.wyz - r8.zxy;
    r6.x = saturate(ps);
    ps = 3.3333333 * r5.w;
    r6.xyz = r6.xxx * r21.xzy;
    r5.w = ps;
    ps = 2.5 * r2.x;
    r0.xyz = r5.www * r20.xyz;
    r2.z = ps;
    ps = 1.0 + r0.x;
    r9.zw = -r6.xz + r14.xy;
    r2.y = ps;
    r14.xy = r9.zw * r14.ww + r6.xz;
    ps = -r6.y;
    r12.xyz = r12.xyz * r3.www;
    ps = r14.z + ps;
    r12.xyz = r19.yzx * r12.yzx;
    r1.y = ps;
    ps = r2.y * r2.x;
    r1 = r1.zwyx * r14.wwww;
    r6.x = ps;
    ps = r2.z * r2.y;
    r8.xyz = r8.xyz + r1.xyw;
    r5.w = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.x = float((r6.x > 0.9));
    r6.z = ps;
    ps = r6.y;
    r5.z = dot(r12.yzx, float3(0.11, 0.3, 0.59));
    ps = r1.z + ps;
    r5.z = r5.z - r12.z;
    r14.z = ps;
    r12.xyw = r12.zxy * r6.xxx - r14.xyz;
    ps = (-0.5) + r5.w;
    r6.x = saturate(r5.z + r12.z);
    r6.y = saturate(ps);
    r12.z = r18.w * r6.x + r16.w;
    r15.xyz = r17.xyz * r15.xyz + r12.xyw;
    r5.zw = -r16.yz * r6.xx + r16.yz;
    r12.xy = r0.yz * 2.0 + r5.zw;
    r14.xyz = r15.xyz * r6.yyy + r14.xyz;
    ps = r1.w;
    r1.xyz = r14.xyz * r13.xyz;
    r5.z = ps;
    ps = (-2.0) + r5.z;
    r12.xyz = -r8.xyz + r12.xyz;
    r8.w = ps;
    r0.xyz = r12.xyz * r6.yyy + r8.xyw;
    r0.w = r0.w * 2.0 + r0.z;
    ps = 1.0 - r6.x;
    r0.xyw = r0.xyw * r2.www;
    r8.x = ps;
    ps = 1.0 - r6.w;
    r0.z = r0.w + 1.0;
    r8.y = ps;
    r0.xyz = (r2.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r2.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r6.z;
    r5.z = dot(r0.zxy, r0.zxy);
    r8.z = ps;
    ps = rsqrt(abs(r5.z));
    r6.xzw = r11.xyz * r8.xxx;
    r5.z = ps;
    r2.xyz = r0.xyz * r5.zzz;
    r5.z = dot(r2.zxy, r10.zxy);
    r0.xyz = r2.xyz * r5.zzz;
    r0.xyz = r0.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = saturate(dot(r4.zxy, r0.zxy));
    r5.z = ps;
    ps = log2(r5.w);
    r6.xyz = r6.xzw * r6.yyy;
    r9.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    r5.x = ps;
    r0.xy = r0.xy * r8.yz + 0.125;
    ps = pow(2.0, r0.z);
    r5.y = saturate(dot(r2.zyx, r4.zyx));
    r5.w = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.zxy * r5.www;
    r0.z = saturate(ps);
    r6.yz = r1.xy * r5.yy + r6.yz;
    r6.w = r1.z * r5.y + r6.x;
    ps = pow(2.0, r5.z);
    r5.xw = r0.xz * r0.yz;
    r6.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
