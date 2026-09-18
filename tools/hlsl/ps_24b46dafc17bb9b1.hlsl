// ps_24b46dafc17bb9b1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 369 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005C4 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
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

    r11 = tex2D(Texture2D_6, r0.xy).xywz;
    r5.z = r11.z - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r0.wz * 6.0;
    r12.x = ps;
    r9.xyz = tex2D(Texture2D_2, r5.xy).xyw;
    r13.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r4.w - 4e+02;
    r12.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r1.z + 0.1;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r9.z * r13.x;
    r6.y = ps;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.w));
    r10.zw = r6.xy * abs(r7.xy);
    r5.w = ps;
    ps = -r0.z;
    r6.yw = r0.xy * UniformScalar_0.xx;
    ps = 1.0 + ps;
    r10.xy = r0.wz * UniformVector_6.xy;
    r12.z = ps;
    ps = 0.00022222222 * r5.x;
    r2.zw = r4.xy * ScreenPositionScaleBias.xy;
    r6.x = saturate(ps);
    ps = 5.0 * r5.z;
    r2.xy = r0.wz * UniformVector_1.xy;
    r6.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r8.xyz = r5.www * r3.xyz;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.w = r6.x * (-0.025);
    r5.z = ps;
    r2.xy = r8.xy * r5.ww + r2.xy;
    r5.zw = r2.zw * r5.zz + ScreenPositionScaleBias.wz;
    r12.y = -r2.y * r5.x + 1.0;
    r12.yzw = r12.zyw * UniformVector_2.yyx;
    ps = r12.w;
    r3.xyz = r12.zxy - 0.5;
    ps = r2.x * ps;
    r19.xyz = float3((r12.xzy >= 0.5));
    r5.x = ps;
    ps = (-1.0) + r5.y;
    r19.w = float((r5.x >= 0.5));
    r9.z = ps;
    ps = (-0.5) + r5.x;
    r7.xyz = r3.xzy - r12.zyx;
    r9.w = ps;
    r7.w = r9.w - r5.x;
    r3.x = r7.w * r19.w + r5.x;
    r3.yzw = r7.xzy * r19.yxz + r12.zxy;
    r3 = r3.zwxy + r3.zwxy;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r12.xyz = tex2D(Texture2D_5, r2.xy).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r10.zw).xy;
    r17 = tex2D(Texture2D_1, r3.xy);
    r18 = tex2D(Texture2D_1, r3.zw);
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r3.yzw = tex2D(Texture2D_0, r2.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xzw = tex2D(Texture2D_3, r6.yw).xwy;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = r4.w;
    r16.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = 0.0001 * ps;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = saturate(ps);
    ps = (-1.0) + r5.z;
    r14.zw = r5.xw + r5.xw;
    r3.x = ps;
    ps = r9.x + r9.x;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r4.x = ps;
    ps = r9.y + r9.y;
    r4.zw = r13.zw + r13.zw;
    r4.y = ps;
    ps = r16.x;
    r0.x = float((UniformScalar_5.x > 1.0));
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = r11.x * ps;
    r5.xzw = r3.wyz + float3(-1.0, 0.0, 0.0);
    r11.x = ps;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : 1.0;
    r10.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = r16.y;
    r0.xyz = r5.xzw + r3.wyz;
    r11.z = r15.z * UniformVector_4.z - r0.x;
    ps = r11.y * ps;
    r4 = r4 - 1.0;
    r11.y = ps;
    r9.xy = r4.xy * 0.5 + r4.zw;
    ps = 1.0 - r6.z;
    r4.y = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r4.x = r19.y * 2.0 + r19.w;
    r5.z = (r4.x == 0.0) ? r18.x : r18.y;
    r5.x = (r4.y == 0.0) ? r17.x : r17.y;
    ps = 1.0 - r6.y;
    r4 = r4.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.y = ps;
    r5.x = (r4.z == 0.0) ? r17.z : r5.x;
    r5.z = (r4.y == 0.0) ? r18.z : r5.z;
    r13.w = (r4.x == 0.0) ? r18.w : r5.z;
    r5.x = (r4.w == 0.0) ? r17.w : r5.x;
    ps = ModShadowGroupColor.x * r6.z;
    r5.w = max(r5.x, 0.0);
    r5.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r13.z = min(r5.w, 0.3);
    r5.w = ps;
    ps = r16.z;
    r5.xzw = -r5.xzw + 1.0;
    ps = r11.w * ps;
    r4.xyz = r13.xzy * float3(0.875, 3.3333333, 0.875);
    r11.w = ps;
    ps = (-1.0) + r0.y;
    r14.xy = r4.xz * r5.zw;
    r4.x = ps;
    ps = (-1.0) + r0.z;
    r13.xyz = r4.yyy * r9.xyz;
    r4.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r9.zw = r13.zw + float2(1.0, 0.25);
    r6.x = ps;
    ps = 2.5 * r5.x;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r9.y = ps;
    r4.zw = r6.xx * r14.zw + r15.xy;
    ps = r14.x * r14.y;
    r5.z = r9.w + r13.w;
    r5.w = ps;
    r2.xyz = r5.www * r2.xyz + ModShadowColor.xyz;
    ps = abs(r9.z) * abs(r9.z);
    r5.z = saturate(r5.z - r5.y);
    r9.x = ps;
    r5.xw = r4.zw * UniformVector_4.xy + r13.xy;
    ps = r9.x * r9.x;
    r10.xyz = r11.xyw * r10.xyz;
    r5.y = ps;
    ps = r9.y * r9.z;
    r11.xy = r5.xw - r4.xy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r4.xyz = r5.zzz * r12.xyz;
    r6.w = saturate(ps);
    r5.x = r11.z * r6.w + r0.x;
    r5.zw = r11.xy * r6.ww - 1.0;
    r3.yz = r3.yz * 2.0 + r5.zw;
    r3.w = r5.x * TwoSidedSign.x - TwoSidedSign.x;
    r0.x = r3.w * r6.y + TwoSidedSign.x;
    r5.xzw = r3.xyz * r6.yyy + float3(1.0, 0.0, 0.0);
    r5.xzw = (r6.xyy > 0.0) ? r5.xzw : float3(1.0, 0.0, 0.0);
    r0.x = (r6.y > 0.0) ? r0.x : TwoSidedSign.x;
    r3.z = (r6.y >= 0.0) ? r0.x : TwoSidedSign.x;
    r3.xyw = (r6.yyx >= 0.0) ? r5.zwx : float3(0.0, 0.0, 1.0);
    ps = r5.y * r5.y;
    r6.xyz = r10.xyz * r3.www;
    r5.w = ps;
    r9.xyz = r6.xyz * r9.zzz - r4.xyz;
    r5.xyz = r6.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r5.www * r5.xyz;
    r5.x = ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.yzw = r5.xxx * r1.xyz;
    r5.x = dot(r3.zxy, r3.zxy);
    r1.xyz = r9.xyz * r6.www + r4.xyz;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r1.xyz * r0.xyz;
    r5.x = ps;
    r1.xyz = r3.xyz * r5.xxx;
    r3.xyz = r1.xyz * TwoSidedSign.xxx;
    r5.x = dot(r3.zxy, r8.zxy);
    r1.xyz = r3.xzy * r5.xxx;
    r1.xyz = r1.xyz * 2.0 - r8.xzy;
    r5.x = saturate(dot(r5.wyz, r1.yxz));
    ps = log2(r5.x);
    r1.xyz = r6.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.xyz = r7.xyz * LightColor.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zxy, r5.wyz));
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
