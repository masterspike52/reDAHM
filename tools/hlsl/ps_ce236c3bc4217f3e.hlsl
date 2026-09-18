// ps_ce236c3bc4217f3e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 384 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000600 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r9.xy = r0.xy * UniformVector_3.xy;
    r10.x = ps;
    r6 = tex2D(Texture2D_8, r9.xy);
    ps = (-0.5) + r6.w;
    r9.zw = r0.wz * 6.0;
    r5.x = ps;
    ps = 1.0 - r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r11.y = ps;
    r19.yzw = tex2D(Texture2D_3, r9.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r4.w - 4e+02;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r1.w));
    r5.y = r1.z + 0.1;
    r1.w = ps;
    ps = 0.00022222222 * r5.x;
    r11.xz = r0.wz * UniformVector_1.xy;
    r10.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r1.www * r3.xyz;
    r10.y = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.y = r10.w * (-0.025);
    r5.x = ps;
    r13.xy = r8.xy * r5.yy + r11.xz;
    r10.z = r13.y * r5.x;
    ps = 1.0 / UniformVector_1.x;
    r11.xw = -r10.zy + 1.0;
    r11.z = ps;
    r10.yzw = r11.yxz * UniformVector_2.yyx;
    ps = r10.w;
    r3.xyz = r10.zxy - 0.5;
    ps = r13.x * ps;
    r21.xyz = float3((r10.xzy >= 0.5));
    r19.x = ps;
    r21.w = float((r19.x >= 0.5));
    ps = r5.z;
    r12.xyz = r3.xzy - r10.zyx;
    ps = abs(r7.x) * ps;
    r20 = r19.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r3.x = ps;
    ps = r5.w;
    r12.w = r20.x - r19.x;
    r5.x = r12.w * r21.w + r19.x;
    r5.yzw = r12.xzy * r21.yxz + r10.zxy;
    ps = abs(r7.y) * ps;
    r10 = r5.zwxy + r5.zwxy;
    r3.y = ps;
    r5 = tex2D(Texture2D_1, r10.xy).zwyx;
    r18 = tex2D(Texture2D_1, r10.zw);
    r17.y = tex2D(Texture2D_4, r9.xy).x;
    r9.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r10.xyz = tex2D(Texture2D_2, r9.zw).xyw;
    r3.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r15.y = r0.y + UniformScalar_8.x;
    r3.z = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r7.x = UniformScalar_4.x * UniformScalar_3.x;
    r1.w = ps;
    ps = r4.x;
    r15.zw = r0.wz * UniformVector_5.xy;
    r9.zw = r10.xy * 2.0 - 1.0;
    r1.w = (-abs(r1.w) >= 0.0) ? 1.0 : (-1.0);
    r17.x = (-abs(r3.z) >= 0.0) ? (-1.0) : r1.w;
    ps = ScreenPositionScaleBias.x * ps;
    r9 = r9.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r12.z = ps;
    ps = r4.y;
    r17.zw = r11.ww * ModShadowGroupColor.xy;
    ps = ScreenPositionScaleBias.y * ps;
    r10.xyw = -r17.zwy + 1.0;
    r12.w = ps;
    ps = r14.x + r14.x;
    r16.xy = r9.xw * r10.xy;
    r16.z = ps;
    ps = r14.y + r14.y;
    r11.y = dot(r21.xzz, float3(1.0, 1.0, 1.0));
    r16.w = ps;
    r11.x = r21.y * 2.0 + r21.w;
    ps = r3.x + r3.x;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r14.x = ps;
    r1.w = (r11.x == 0.0) ? r18.x : r18.y;
    r3.z = (r11.y == 0.0) ? r5.w : r5.z;
    ps = r3.y + r3.y;
    r7.yzw = r20.zyw + r19.ywz;
    r14.y = ps;
    ps = r10.z;
    r7.yzw = r7.ywz + float3(-1.0, -1.0, 0.0);
    ps = r14.z * ps;
    r11 = r11.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.w = ps;
    r5.x = (r11.z == 0.0) ? r5.x : r3.z;
    r1.w = (r11.y == 0.0) ? r18.z : r1.w;
    r14.w = (r11.x == 0.0) ? r18.w : r1.w;
    r5.z = (r11.w == 0.0) ? r5.y : r5.x;
    ps = (-1.0) - -r5.w;
    r7 = r7 * r17.xxyy;
    r9.x = ps;
    ps = floor(r7.x);
    r5.x = max(r5.z, 0.0);
    r11.y = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.x = min(r5.x, 0.3);
    r9.w = ps;
    ps = 3.3333333 * r5.x;
    r9.yz = r16.zw + r9.yz;
    r11.x = ps;
    ps = r3.w + r3.w;
    r9 = r11.xxyx * r9.yzwx;
    r14.z = ps;
    ps = r9.z;
    r11 = r14 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r0.x + ps;
    r5.y = r9.y + r7.z;
    r15.x = ps;
    r5.x = r7.y * r17.y + r9.x;
    ps = 1.0 / r4.w;
    r12.xy = -r11.xy + r5.xy;
    r5.x = ps;
    r5.xy = r12.zw * r5.xx + ScreenPositionScaleBias.wz;
    r13.xyz = tex2D(Texture2D_6, r13.xy).xyz;
    r20.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r19.xyz = tex2D(Texture2D_7, r15.zw).xyz;
    r21 = tex2D(Texture2D_5, r15.xy);
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r18.xyz = UniformVector_4.xyz * 2e+01;
    r5.x = float((UniformScalar_11.x >= 1.0));
    r0.x = dot(r1.zxy, r1.zxy);
    r1.w = float((UniformScalar_11.x > 1.0));
    ps = r6.x;
    r0.yzw = r21.xyz * r21.www;
    r5.y = ps;
    r19.xyz = (-abs(r1.www) >= 0.0) ? r19.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r20.xyz * r2.www;
    r0.x = ps;
    ps = UniformScalar_12.x * r5.y;
    r3.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    r10.xyz = (-abs(r5.xxx) >= 0.0) ? 1.0 : r19.xyz;
    ps = UniformScalar_12.x * r6.y;
    r1.xyz = r18.xyz * r0.yzw;
    r0.y = ps;
    ps = UniformScalar_12.x * r6.z;
    r9.xyz = r1.xyz * r17.yyy;
    r0.z = ps;
    r0.xyz = r0.xyz * r10.xyz + UniformScalar_13.xxx;
    ps = r16.x * r16.y;
    r5.x = saturate(r4.w * 0.0001);
    r5.y = ps;
    r1.xyz = r5.yyy * r15.xyz + ModShadowColor.xyz;
    ps = 1.0 - r5.x;
    r7.xyz = r0.xyz * r10.www;
    r0.w = ps;
    ps = 1.0 - r5.z;
    r5.y = r11.w + r14.w;
    r0.x = ps;
    ps = 2.5 * r0.x;
    r5.x = saturate(r5.y - r5.w);
    r0.z = ps;
    ps = -r11.z;
    r4.xyz = r5.xxx * r13.xyz;
    ps = r7.w + ps;
    r0.y = r9.w + 1.0;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r5.yz = r0.yz * r0.xy;
    r9.w = ps;
    ps = (-0.5) + r5.z;
    r5.w = float((r5.y > 0.9));
    r1.w = saturate(ps);
    r5.xy = r12.xy * r1.ww + r11.xy;
    r9.xyz = r9.xyz * r5.www - r4.xyz;
    r9.xyz = r10.xyz * r6.xyz + r9.xyz;
    r4.xyz = r9.xyz * r1.www + r4.xyz;
    r5.z = r9.w * r1.w - 2.0;
    r5.z = r3.w * 2.0 + r5.z;
    r5.xyw = r5.xyz * r0.www;
    ps = -UniformVector_0.x;
    r5.z = r5.w + 1.0;
    r5.xyz = (r0.www > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r7.xyz * r1.www;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r5.yzw = r5.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r5.wyz, r8.zxy);
    r6.y = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    r6.z = ps;
    ps = log2(r5.x);
    r6.xyz = r4.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r2.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
