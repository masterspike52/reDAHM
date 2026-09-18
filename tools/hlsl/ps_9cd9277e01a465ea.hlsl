// ps_9cd9277e01a465ea.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 384 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000600 10041300 0000080A 00000000 00006908 003F00FF 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = -UniformVector_0.xy + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r1.x;
    r19.y = -r1.y + 1.0;
    ps = UniformVector_2.x * ps;
    r1.z = saturate(r5.w * 0.0001);
    r7.z = ps;
    ps = r2.z;
    r3 = r1.xyxy * float4(6.0, 6.0, 0.5, 0.5);
    ps = 0.1 + ps;
    r7.xw = r1.xy * UniformVector_1.xy;
    r7.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = r5.w - 4e+02;
    r6.y = ps;
    ps = UniformVector_2.x * r6.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r1.w = saturate(r7.y * 5.0);
    r6.y = ps;
    ps = 0.00022222222 * r6.x;
    r8.xyz = r6.yyy * r4.xyz;
    r9.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.yw = -r1.zw + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r10.xzw = r9.xyz * float3(-0.025, 0.875, 0.875);
    r7.y = ps;
    r10.xy = r8.xy * r10.xx + r7.xw;
    ps = ModShadowGroupColor.y * r6.w;
    r7.x = r10.y * r6.x;
    r7.w = ps;
    ps = r6.z;
    r19.xzw = -r7.xyw + 1.0;
    ps = r10.x * ps;
    r7.yw = r19.xy * UniformVector_2.yy;
    r7.x = ps;
    ps = r0.x;
    r4 = r7 - 0.5;
    ps = UniformScalar_0.x * ps;
    r16 = float4((r7.xywz >= 0.5));
    r6.x = ps;
    ps = r0.y;
    r4 = r4.xywz - r7.xywz;
    r7 = r4.xywz * r16.xywz + r7;
    ps = UniformScalar_0.x * ps;
    r7 = r7 + r7;
    r6.z = ps;
    r1.zw = tex2D(Texture2D_3, r3.zw).xy;
    r17 = tex2D(Texture2D_6, r0.xy);
    r4 = tex2D(Texture2D_1, r7.zw);
    r14 = tex2D(Texture2D_1, r7.xy);
    r12.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r7.xyz = tex2D(Texture2D_4, r6.xz).xwy;
    r0.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r3.xy).xyw;
    r9.yzw = tex2D(Texture2D_0, r10.xy).xyz;
    r3.xyz = r9.yzw * 2.0 - 1.0;
    r0.xyz = r0.zxy * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r11.zw = r1.xy * UniformVector_7.xy;
    r15.x = ps;
    ps = r7.z + r7.z;
    r15.zw = r12.xy + r12.xy;
    r15.y = ps;
    r18 = r15 - 1.0;
    ps = r13.x + r13.x;
    r2.w = r6.y * UniformScalar_1.x;
    r15.z = ps;
    r7.xw = r2.ww * r18.xy + r0.yz;
    ps = r13.y + r13.y;
    r15.xy = r10.zw * r19.zw;
    r15.w = ps;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r12.xy = r15.zw * 0.5 + r18.zw;
    r1.y = dot(r16.wzz, float3(1.0, 1.0, 1.0));
    ps = r13.z;
    r1.x = dot(r16.xyy, float3(1.0, 1.0, 1.0));
    r7.z = (r1.x == 0.0) ? r14.x : r14.y;
    r6.z = (r1.y == 0.0) ? r4.x : r4.y;
    ps = r12.z * ps;
    r13 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = ps;
    r6.z = (r13.z == 0.0) ? r4.z : r6.z;
    r7.z = (r13.y == 0.0) ? r14.z : r7.z;
    r1.y = (r13.x == 0.0) ? r14.w : r7.z;
    r6.z = (r13.w == 0.0) ? r4.w : r6.z;
    ps = 1.0 - r6.z;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r4.y = ps;
    ps = 0.25 + r1.y;
    r6.z = max(r6.z, 0.0);
    r1.x = ps;
    ps = r6.z;
    r7.z = float((r17.w >= 0.5));
    r10.z = ps;
    ps = 0.3;
    r1.xyz = r1.xzw + r1.yzw;
    r10.w = ps;
    ps = min(r10.z, r10.w);
    r4.zw = r1.yz - 1.0;
    r4.x = ps;
    ps = (-1.0) - -r6.x;
    r4 = r4.zwxy * float4(0.012, 0.012, 3.3333333, 2.5);
    r12.z = ps;
    r12.xyz = r4.zzz * r12.xyz;
    r7.xw = r7.xw * UniformVector_4.xy - r4.xy;
    r7.xw = r7.xw * r7.zz + r4.xy;
    r7.xw = r7.xw + r12.xy;
    ps = 1.0 / r5.w;
    r13.xy = -r3.xy + r7.xw;
    r6.z = ps;
    r7.xw = r13.zw * r6.zz + ScreenPositionScaleBias.wz;
    r5.xyw = tex2D(LightAttenuationTexture, r7.xw).xyz;
    r10.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r16.xyz = tex2D(Texture2D_9, r11.zw).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r18.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.z = float((UniformScalar_5.x >= 1.0));
    r18.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r7.x = float((UniformScalar_5.x > 1.0));
    r18.z = ps;
    r17.xyz = r18.xyz * r17.xyz;
    r16.xyz = (-abs(r7.xxx) >= 0.0) ? r16.xyz : 1.0;
    r16.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r16.xyz;
    r4.xyz = r17.xyz * r16.xyz;
    ps = UniformVector_4.z * r0.x;
    r6.z = r15.x * r15.y;
    r12.w = ps;
    r0.xyz = r6.zzz * r14.xyz + ModShadowColor.xyz;
    ps = (-1.0) + r7.y;
    r7.xw = r12.wz + float2(-1.0, 1.0);
    r12.x = ps;
    r6.z = saturate(r4.w * r7.w - 0.5);
    r12.yz = r13.xy * r6.zz + r3.xy;
    r3.xyw = r12.yzx * r6.yyy;
    ps = r1.x;
    r7.y = r3.w + 1.0;
    r7.y = (r2.w > 0.0) ? r7.y : 1.0;
    r7.y = (r2.w >= 0.0) ? r7.y : 1.0;
    ps = -r6.x + ps;
    r1.xy = r7.zx * r7.yz;
    r6.x = saturate(ps);
    ps = -r3.z;
    r13.xyz = r6.xxx * r10.xyz;
    ps = r1.y + ps;
    r4.xyw = r4.xyz * r1.xxx;
    r6.x = ps;
    r1.yzw = r4.xyw * r7.www - r13.xyz;
    ps = 1.0 + r6.x;
    r4.z = -UniformVector_0.z + 1.0;
    r1.x = ps;
    r12 = r1 * r6.zzzz;
    ps = rsqrt(abs(r0.w));
    r5.z = r13.z + r12.w;
    r6.x = ps;
    ps = 1.0 - r7.z;
    r1.xyz = r6.xxx * r2.xyz;
    r6.x = ps;
    ps = UniformScalar_6.x * r7.z;
    r10.xyz = r6.xxx * UniformVector_5.xyz;
    r9.x = ps;
    ps = r12.x;
    r2.xy = r13.xy + r12.yz;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r2.xz = r2.xy * r11.xy;
    r10.w = ps;
    r10 = r10 + r9.xxxw;
    r4.xyw = r4.xyw * UniformScalar_7.xxx + r10.xyz;
    ps = abs(r7.w) * abs(r7.w);
    r6.x = r10.w + r9.w;
    r6.z = ps;
    r6.xz = r6.xz * r6.yz;
    ps = r6.z * r6.z;
    r7.xyz = r5.xyw * LightColor.xyz;
    r5.w = ps;
    ps = 1.0 + r6.x;
    r5.xy = r5.ww * r4.xy;
    r3.z = ps;
    r3.xyz = (r6.yyy > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r6.yyy >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r7.w = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r7.w));
    r6 = r5.wxyz * r4.wxyz;
    r7.w = ps;
    r3.xyz = r3.xyz * r7.www;
    r7.w = dot(r3.zxy, r8.zxy);
    r5.xyz = r3.xyz * r7.www;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r7.w = saturate(dot(r1.zxy, r5.zxy));
    ps = log2(r7.w);
    r2.y = r6.x * r4.w;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r1.y = saturate(dot(r3.zyx, r1.zyx));
    r1.x = ps;
    r6.xyz = r6.yzw * r1.xxy;
    r6.xyz = r2.xyz * r1.yxy + r6.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
