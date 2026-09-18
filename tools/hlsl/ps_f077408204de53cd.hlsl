// ps_f077408204de53cd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 372 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005D0 10041500 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s9);
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
    float4 color2 : COLOR2; // r8
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
    float4 r8 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = float((UniformScalar_5.x > 1.0));
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.z = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r9.z = tex2D(ShadowTexture, r0.xy).x;
    ps = UniformVector_2.x * r1.w;
    r6.xy = r6.xy * abs(r9.xy);
    r11.z = ps;
    r9.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r5.w;
    r3.xy = r1.xy * UniformScalar_0.xx;
    ps = 0.0001 * ps;
    r8.xy = r1.wz * 6.0;
    r10.y = saturate(ps);
    ps = r5.w;
    r7.xy = r1.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = r2.z + 0.1;
    r6.y = ps;
    ps = 1.0 / r5.w;
    r0.xy = r5.xy * ScreenPositionScaleBias.xy;
    r8.w = ps;
    r0.xy = r0.xy * r8.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.z));
    r9.x = saturate(r7.z * 0.00022222222);
    r6.z = ps;
    ps = 5.0 * r6.x;
    r4.xyz = r6.zzz * r4.xyz;
    r10.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r14.xyz = r9.ywx * float3(0.875, 0.875, -0.025);
    r9.w = ps;
    r9.xy = r4.xy * r14.zz + r7.xy;
    ps = UniformVector_2.x * r6.y;
    r10.zw = r9.yz * r9.wz;
    r6.x = ps;
    ps = 1.0 - r1.z;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    ps = r6.x;
    r7.xyz = -r10.zyx + 1.0;
    ps = r9.x * ps;
    r11.yw = r7.xw * UniformVector_2.yy;
    r11.x = ps;
    ps = r1.w;
    r5 = r11 - 0.5;
    ps = UniformVector_7.x * ps;
    r19 = float4((r11.xwyz >= 0.5));
    r6.x = ps;
    ps = r1.z;
    r5 = r5.xywz - r11.xywz;
    r5 = r5.xywz * r19.xzwy + r11;
    ps = UniformVector_7.y * ps;
    r11 = r5 + r5;
    r6.y = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r18 = tex2D(Texture2D_1, r11.zw);
    r20 = tex2D(Texture2D_1, r11.xy);
    r9.yzw = tex2D(Texture2D_0, r9.xy).xyz;
    r6.xyz = tex2D(Texture2D_8, r6.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r1.xy).zxy;
    r12.xyz = tex2D(Texture2D_2, r8.xy).xyw;
    r8.xyw = tex2D(Texture2D_2, r1.wz).wxy;
    r16.yzw = tex2D(Texture2D_3, r3.xy).xyw;
    r11 = tex2D(Texture2D_6, r1.xy).wxyz;
    r3.yz = r8.yw * 2.0 - 1.0;
    r8.yw = r12.xy * 2.0 - 1.0;
    r16.x = r12.z * r8.x;
    r17.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r8.x = float((UniformScalar_5.x >= 1.0));
    r6.xzw = (-abs(r6.www) >= 0.0) ? r6.xyz : 1.0;
    ps = rsqrt(abs(r8.z));
    r12.xyz = r9.yzw + r9.yzw;
    r6.y = ps;
    ps = r11.x;
    r2.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    r6.xzw = (-abs(r8.xxx) >= 0.0) ? 1.0 : r6.xwz;
    ps = UniformScalar_6.x * r6.y;
    r3.xw = r16.xw - 1.0;
    r9.x = ps;
    ps = r16.y + r16.y;
    r12.w = r3.w * r7.y;
    r14.z = ps;
    ps = UniformScalar_1.x * r7.y;
    r12 = r12 + float4(-1.0, -1.0, -1.0, 1.0);
    r8.z = ps;
    r6.y = (r8.z > 0.0) ? r12.w : 1.0;
    r17.w = (r8.z >= 0.0) ? r6.y : 1.0;
    ps = r16.z + r16.z;
    r19.y = dot(r19.wyy, float3(1.0, 1.0, 1.0));
    r14.w = ps;
    ps = r15.y + r15.y;
    r19.x = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r15.y = ps;
    r6.y = (r19.x == 0.0) ? r20.x : r20.y;
    r8.x = (r19.y == 0.0) ? r18.x : r18.y;
    ps = r15.z + r15.z;
    r21 = r17 * r11.yzwx;
    r15.z = ps;
    ps = r15.x + r15.x;
    r19 = r19.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r15.w = ps;
    r8.x = (r19.z == 0.0) ? r18.z : r8.x;
    r0.w = (r19.y == 0.0) ? r20.z : r6.y;
    ps = r11.x;
    r6.yzw = r21.zxy * r6.zxw;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r11.yz = r6.wy * r21.ww;
    r6.y = ps;
    r0.w = (r19.x == 0.0) ? r20.w : r0.w;
    r6.w = (r19.w == 0.0) ? r18.w : r8.x;
    ps = ModShadowGroupColor.y * r7.z;
    r1.w = r6.z * r17.w;
    r6.z = ps;
    ps = r1.w;
    r8.x = max(r6.w, 0.0);
    r15.x = r0.w * 2.0 - r16.x;
    ps = r11.x * ps;
    r6.yzw = -r6.wyz + 1.0;
    r11.x = ps;
    ps = 2.5 * r6.y;
    r15 = r15 + float4(1.25, -1.0, -1.0, -1.0);
    r11.w = ps;
    r13.w = r15.w * UniformVector_4.z - r12.z;
    ps = r15.x;
    r8.x = min(r8.x, 0.3);
    ps = -r16.x + ps;
    r8.xyw = r8.ywx * float3(0.5, 0.5, 3.3333333);
    r0.w = saturate(ps);
    ps = r3.y;
    r14.xy = r14.xy * r6.zw;
    ps = r8.x + ps;
    r5.xyz = r0.www * r5.xyz;
    r3.y = ps;
    ps = r3.z;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r6.zw = r8.zz * r14.zw + r15.yz;
    ps = r8.y + ps;
    r6.y = r14.x * r14.y;
    r3.z = ps;
    r8.xyz = r6.yyy * r13.xyz + ModShadowColor.xyz;
    r6.y = r8.w * r3.x + 1.0;
    r6.zw = r6.zw * UniformVector_4.xy - r12.xy;
    r3.yz = r8.ww * r3.yz + r6.zw;
    r3.w = saturate(r11.w * r6.y - 0.5);
    r13.xyz = r11.xyz * r6.yyy - r5.xyz;
    ps = 1.0 - r6.x;
    r6.y = abs(r6.y) * abs(r6.y);
    r6.w = ps;
    ps = r6.y * r6.y;
    r0.xyz = r10.www * r0.xyz;
    r3.x = ps;
    r10.w = r13.w * r3.w - 2.0;
    r6.xyz = r13.xyz * r3.www + r5.xyz;
    ps = UniformVector_5.x * r6.w;
    r5.xyw = r3.yzx * r3.wwx;
    r10.x = ps;
    ps = UniformVector_5.y * r6.w;
    r1.xyz = r6.xyz * r1.xyz;
    r10.y = ps;
    ps = UniformVector_5.z * r6.w;
    r6.xy = r12.xy + r5.xy;
    r10.z = ps;
    r10 = r10 + r9.xxxw;
    r5.xyz = r11.xyz * UniformScalar_7.xxx + r10.xyz;
    r6.z = r10.w + r9.w;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r5.www * r5.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r3.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.x = ps;
    r6.xyz = r7.xzy * r6.xxx;
    r6.y = r1.z * r6.w + r6.y;
    r6.xz = r1.xy * r6.ww + r6.xz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
