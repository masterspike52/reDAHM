// ps_9e508853d17cad42.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 360 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005A0 10041200 0000080A 00000000 00006908 003F00FF 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
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
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = -r1.y + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.z = r1.x * UniformVector_2.x;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r3.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r5.w;
    r6.xz = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r7.xy = r1.xy * 6.0;
    r7.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r1.zw = r1.xy * UniformVector_1.xy;
    r6.y = ps;
    ps = UniformVector_2.x * r6.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r6.w));
    r3.x = saturate(r7.w * 0.00022222222);
    r6.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r4.xyz = r6.yyy * r4.xyz;
    r6.y = ps;
    ps = 1.0 / r5.w;
    r18.xyw = r3.yzx * float3(0.875, 0.875, -0.025);
    r6.w = ps;
    r3.xy = r4.xy * r18.ww + r1.zw;
    ps = r7.z;
    r3.zw = r5.xy * ScreenPositionScaleBias.xy;
    r7.zw = r3.zw * r6.ww + ScreenPositionScaleBias.wz;
    r0.z = -r3.y * r6.y + 1.0;
    ps = r3.x * ps;
    r9.yw = r0.zw * UniformVector_2.yy;
    r9.x = ps;
    ps = r1.x;
    r8 = r9 - 0.5;
    ps = UniformVector_7.x * ps;
    r12 = float4((r9.xywz >= 0.5));
    r6.y = ps;
    ps = r1.y;
    r8 = r8.xywz - r9.xywz;
    r8 = r8.xywz * r12.xywz + r9;
    ps = UniformVector_7.y * ps;
    r8 = r8 + r8;
    r6.w = ps;
    r11.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r9.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r10 = tex2D(Texture2D_1, r8.xy);
    r14 = tex2D(Texture2D_1, r8.zw);
    r16.xyz = tex2D(Texture2D_8, r6.yw).xyz;
    r8.yzw = tex2D(Texture2D_0, r3.xy).xyz;
    r17.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r3.xyz = tex2D(Texture2D_2, r7.xy).xyw;
    r13 = tex2D(Texture2D_6, r0.xy);
    r7.xyz = tex2D(Texture2D_3, r6.xz).xwy;
    ps = r2.z;
    r6.y = float((UniformScalar_5.x >= 1.0));
    ps = 0.1 + ps;
    r7.w = float((UniformScalar_5.x > 1.0));
    r6.x = ps;
    r15.yz = r3.xy * 2.0 - 1.0;
    r3.xyw = r17.xyz * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r6.w = r3.z * r1.z;
    r6.z = saturate(ps);
    r0.xyz = (-abs(r7.www) >= 0.0) ? r16.xyz : 1.0;
    r16.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r0.xzy;
    ps = r8.y + r8.y;
    r0.z = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r0.x = ps;
    ps = r8.z + r8.z;
    r0.w = dot(r12.wzz, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    r6.x = (r0.w == 0.0) ? r14.x : r14.y;
    r6.y = (r0.z == 0.0) ? r10.x : r10.y;
    ps = r8.w + r8.w;
    r12 = r0.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r0.z = ps;
    r6.y = (r12.y == 0.0) ? r10.z : r6.y;
    r6.x = (r12.z == 0.0) ? r14.z : r6.x;
    r6.x = (r12.w == 0.0) ? r14.w : r6.x;
    r6.y = (r12.x == 0.0) ? r10.w : r6.y;
    r0.w = r6.y * 2.0 - r6.w;
    ps = r5.w;
    r12 = r0 + float4(-1.0, -1.0, -1.0, 1.25);
    r11.w = r3.w * UniformVector_4.z - r12.z;
    ps = 0.0001 * ps;
    r3.w = saturate(r12.w - r6.w);
    r1.z = saturate(ps);
    ps = r7.x + r7.x;
    r14.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r17.x = ps;
    ps = r7.z + r7.z;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r17.y = ps;
    ps = r1.x + r1.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r17.z = ps;
    ps = r13.w;
    r6.y = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = 1.0 - r7.x;
    r0.xyz = r9.xyz * LightColor.xyz;
    r7.w = ps;
    ps = r1.y + r1.y;
    r9.xyz = r7.www * UniformVector_5.xyz;
    r17.w = ps;
    ps = 1.0 - r6.z;
    r17 = r17 - 1.0;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r7.w = max(r6.x, 0.0);
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r15.x = min(r7.w, 0.3);
    r1.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15.xyz = r15.xyz * float3(3.3333333, 0.5, 0.5);
    r1.y = ps;
    ps = (-1.0) + r7.y;
    r1.xyw = -r1.xyz + 1.0;
    r18.z = ps;
    ps = (-1.0) - -r6.w;
    r7.yz = r17.zw + r15.yz;
    r7.x = ps;
    r15.yzw = r18.xyz * r1.xyw + float3(0.125, 0.125, 1.0);
    ps = rsqrt(abs(r6.y));
    r1.z = r1.w * UniformScalar_1.x;
    r6.y = ps;
    r6.zw = r1.zz * r17.xy + r3.xy;
    r7.w = r15.x * r7.x + 1.0;
    r0.w = (r1.z > 0.0) ? r15.w : 1.0;
    r14.w = (r1.z >= 0.0) ? r0.w : 1.0;
    ps = abs(r7.w) * abs(r7.w);
    r3.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    r6.zw = r6.zw * UniformVector_4.xy - r12.xy;
    r6.zw = r15.xx * r7.yz + r6.zw;
    ps = r13.w;
    r15.x = r6.y * r6.y;
    r6.y = ps;
    ps = r15.x * r15.x;
    r2 = r14 * r13;
    r0.w = ps;
    ps = r15.y * r15.z;
    r1.xyz = r2.xzy * r16.xyz;
    r7.x = ps;
    r7.xyz = r7.xxx * r5.xyz + ModShadowColor.xyz;
    ps = r1.x;
    r2.xyz = r3.www * r11.xyz;
    ps = r14.w * ps;
    r5.yz = r1.zy * r2.ww;
    r1.z = ps;
    ps = 2.5 * r6.x;
    r5.x = r1.z * r13.w;
    r5.w = ps;
    r11.xyz = r5.xyz * r7.www - r2.xyz;
    r7.w = saturate(r5.w * r7.w - 0.5);
    r6.xz = r6.zw * r7.ww + r12.xy;
    r9.w = r11.w * r7.w - 2.0;
    r2.xyz = r11.xyz * r7.www + r2.xyz;
    ps = UniformScalar_6.x * r6.y;
    r1.xyz = r2.xyz * r10.xyz;
    r8.x = ps;
    r2 = r9 + r8.xxxw;
    r2.xyz = r5.xyz * UniformScalar_7.xxx + r2.xyz;
    r6.w = r2.w + r8.w;
    r6.xyz = r6.wxz * r1.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r1.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.xyz = r0.www * r2.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r7.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xzy * r6.xxx;
    r6.y = r1.z * r6.w + r6.y;
    r6.xz = r1.xy * r6.ww + r6.xz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
