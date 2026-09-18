// ps_bd97d4eeeff57cb1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 447 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006FC 10041200 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.w = UniformScalar_17.x * 0.05;
    r5.x = r4.w - 4e+02;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r1.z + 0.1;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r10.y = ps;
    ps = rsqrt(abs(r5.w));
    r6.yz = r0.wz * 3.0;
    r1.w = ps;
    r6.x = r7.w * (-0.8) + r6.z;
    ps = 0.00022222222 * r5.x;
    r5.w = float((UniformScalar_12.x >= 1.0));
    r16.w = saturate(ps);
    ps = 5.0 * r5.y;
    r11.xyz = r1.www * r3.xyz;
    r16.x = saturate(ps);
    r5.x = r6.w * r16.w;
    ps = UniformScalar_13.x - r7.w;
    r3.z = saturate(r7.w * 15.0);
    r11.w = ps;
    r13.xy = r11.yx * r5.xx + r0.zw;
    r5.x = r11.w * r5.w + r7.w;
    ps = r0.w;
    r5.x = -r5.x + r7.z;
    ps = UniformVector_1.x * ps;
    r5.x = max(r5.x, UniformScalar_14.x);
    r2.x = ps;
    ps = 1.0 / UniformScalar_15.x;
    r5.y = min(r5.x, 1.0);
    r5.x = ps;
    ps = -r0.z;
    r13.z = saturate(r5.y * r5.x);
    ps = 1.0 + ps;
    r18.yz = -r13.xz + 1.0;
    r18.x = ps;
    ps = 6.0 * r6.x;
    r2.yz = r18.xy * UniformVector_1.yy;
    r5.w = ps;
    ps = r10.x;
    r9.xyz = r2.zxy - 0.5;
    ps = abs(r8.x) * ps;
    r3.xyw = float3((r2.zxy >= 0.5));
    r5.x = ps;
    ps = r10.y;
    r9.xyz = r9.xyz - r2.zxy;
    r2.xyz = r9.yzx * r3.ywx + r2.xyz;
    ps = abs(r8.y) * ps;
    r9.yzw = r2.zxy + r2.zxy;
    r5.y = ps;
    ps = 18.0 * r0.w;
    r16.z = saturate(r4.w * 0.0001);
    r5.z = ps;
    r2.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r10 = tex2D(Texture2D_3, r9.zw);
    r12.xyz = tex2D(Texture2D_4, r5.zw).xyw;
    r8 = tex2D(Texture2D_4, r6.yx).xzyw;
    r5.zw = r12.xy * 2.0 - 1.0;
    ps = r8.y;
    r6.yz = r8.xz + r8.xz;
    r5.x = ps;
    ps = (-0.3) * r5.x;
    r6.x = dot(r3.yww, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r6.x == 0.0) ? r10.x : r10.y;
    ps = r12.z;
    r6 = r6.xxyz + float4(-2.0, -3.0, -1.0, -1.0);
    r5.x = (r6.x == 0.0) ? r10.z : r5.x;
    r6.xz = r5.zw * 0.5 + r6.zw;
    r16.y = (r6.y == 0.0) ? r10.w : r5.x;
    ps = r8.w * ps;
    r5.z = max(r16.y, 0.0);
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r2.x = min(r5.z, 0.3);
    r6.w = ps;
    ps = r13.x + r13.x;
    r14.xyw = r2.yzx * float3(0.875, 0.875, 3.3333333);
    r2.z = ps;
    ps = 0.01 * r6.x;
    r5.w = -r14.w + 1.0;
    r5.z = ps;
    r6.y = r3.z * r5.w + r14.w;
    r10.xz = r5.zy * r6.yy + r0.xy;
    ps = r13.y + r13.y;
    r15.xyz = r6.wxy * r6.yyz;
    r2.w = ps;
    r10.y = r15.z * 0.025 + r10.z;
    r17.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r5.yzw = tex2D(Texture2D_0, r2.wz).xyz;
    ps = r5.y + r5.y;
    r12.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r6.x = ps;
    ps = r5.z + r5.z;
    r6.w = r13.y * UniformVector_1.x;
    r6.y = ps;
    ps = r5.w + r5.w;
    r17.w = float((r6.w >= 0.5));
    r6.z = ps;
    r13 = r6 + float4(-1.0, -1.0, -1.0, -0.5);
    r12.w = r13.w - r6.w;
    r12 = r12 * r17;
    r6.x = r6.w + r12.w;
    ps = r6.x + r6.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r9.x = ps;
    r8.x = tex2D(Texture2D_7, r0.xy).w;
    r9 = tex2D(Texture2D_3, r9.xy).wyxz;
    r6.x = r18.z * r7.w;
    r15.w = r3.x * 2.0 + r17.w;
    r7.w = (r15.w == 0.0) ? r9.z : r9.y;
    r6.yzw = -r16.yxz + 1.0;
    ps = ModShadowGroupColor.x * r6.z;
    r16.zw = r4.xy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r16.xy = r6.xy * r8.yy;
    r7.z = ps;
    ps = 1.0 / r4.w;
    r7.x = float((r16.x >= 0.05));
    r2.x = ps;
    r2.xy = r16.zw * r2.xx + ScreenPositionScaleBias.wz;
    r8.yzw = -r7.yzx + 1.0;
    r7.x = (UniformScalar_13.x > 0.0) ? r8.w : 1.0;
    r14.z = (UniformScalar_13.x >= 0.0) ? r7.x : r8.w;
    r7.xyz = r15.wwx + float3(-3.0, -2.0, 1.0);
    r7.w = (r7.y == 0.0) ? r9.w : r7.w;
    ps = r14.z;
    r9.z = r7.z * r6.y;
    r3.y = r16.y * r7.z - r9.z;
    r9.w = (r7.x == 0.0) ? r9.x : r7.w;
    ps = r8.x * ps;
    r3.x = -r9.w + 1.0;
    r4.w = ps;
    ps = r14.x;
    r9.xy = r3.zz * r3.xy;
    ps = r8.y * ps;
    r3.xy = r9.zx + r9.yw;
    r4.x = ps;
    ps = r14.y;
    r7.w = r3.y + r9.x;
    ps = r8.z * ps;
    r4.z = r7.w + r9.w;
    r4.y = ps;
    ps = r0.w + r0.w;
    r9 = r4.wxyz + float4(-0.5, 0.125, 0.125, 0.25);
    r3.z = ps;
    ps = r0.z + r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r9.xxxx)) clip(-1.0);
    r3.w = ps;
    r4 = tex2D(Texture2D_2, r3.zw);
    r8.xyz = tex2D(Texture2D_8, r2.wz).xyz;
    r2.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r10.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r3.zw).xyz;
    r5.y = tex2D(Texture2D_6, r0.xy).x;
    r3.yzw = -ModShadowColor.xyz + 1.0;
    r2.w = float((UniformScalar_9.x >= 1.0));
    r5.z = float((UniformScalar_9.x > 1.0));
    r14.xyz = r14.xyz * 2.0 - 1.0;
    r7.xyw = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r0.xyz = r2.xyz * LightColor.xyz;
    r0.w = ps;
    r10.xyz = r0.www * r1.xyz;
    r2.xyz = r12.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r1.xy = r7.xy * UniformVector_3.xy + r15.yz;
    r1.w = saturate(r3.x * 2.5 - 0.5);
    r5.x = saturate(r9.w - r5.x);
    r8.xyz = r5.xxx * r8.xyz;
    ps = -r8.z;
    r14.xzw = r14.zxy - r13.zxy;
    ps = r4.z + ps;
    r15.xy = -r8.xy + r4.xy;
    r14.y = ps;
    r8.xy = r15.xy * r4.ww + r8.xy;
    r4 = r14.zwxy * r4.wwww;
    ps = abs(r7.z) * abs(r7.z);
    r8.z = r8.z + r4.w;
    r1.z = ps;
    ps = r4.z;
    r7.xyz = r13.xyz + r4.xyz;
    r5.x = ps;
    r12.w = r7.w * UniformVector_3.z - r7.z;
    ps = (-2.0) + r5.x;
    r1.xy = r1.xy - r7.xy;
    r8.w = ps;
    r12.xyz = r12.xyz * r6.yyy - r8.xyz;
    r4.xyz = r1.xyz * r1.wwz;
    r7.xy = r7.xy + r4.xy;
    r12 = r12 * r1.wwww + r8;
    r7.z = r5.w * 2.0 + r12.w;
    r7.xyz = r7.zxy * r6.www;
    ps = 1.0 + r7.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r6.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r6.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.x));
    r8.xyz = r12.xyz * r8.xyz;
    r5.x = ps;
    r7.xyz = r7.xyz * r5.xxx;
    r5.x = dot(r7.zxy, r11.zxy);
    r12.xyz = r7.xyz * r5.xxx;
    r11.xyz = r12.xyz * 2.0 - r11.xyz;
    ps = UniformScalar_8.x * r5.y;
    r5.x = saturate(dot(r10.zxy, r11.zxy));
    r8.w = ps;
    ps = log2(r5.x);
    r7.x = saturate(dot(r7.zyx, r10.zyx));
    r5.w = ps;
    ps = r9.y * r9.z;
    r5.y = r5.w * UniformScalar_7.x;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r5.w = r5.w * 15.0;
    r7.y = ps;
    ps = r4.z * r4.z;
    r7 = r8 * r7.xxxy;
    r0.w = ps;
    r3.x = (r5.z > 0.0) ? 0.0 : r7.w;
    r5.xyz = r5.xxx * r3.yzw + ModShadowColor.xyz;
    r2.xyz = r2.www * r3.xxx + r2.xyz;
    r2.xyz = r0.www * r2.xyz;
    r1.xyz = r2.xyz * r1.www;
    ps = pow(2.0, r5.w);
    r6.xyz = r1.xzy * r6.yyy;
    r5.w = ps;
    r6.y = r6.y * r5.w + r7.z;
    r6.xz = r6.xz * r5.ww + r7.xy;
    r6.xyz = r0.xzy * r6.xyz;
    r5.xyz = r6.xyz * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
