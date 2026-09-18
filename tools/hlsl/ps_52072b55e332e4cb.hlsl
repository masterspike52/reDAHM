// ps_52072b55e332e4cb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_8.x;
    r5.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r8.x = saturate(r6.w * 15.0);
    r5.z = ps;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r8.z = r4.w - 4e+02;
    r8.y = ps;
    ps = rsqrt(abs(r5.w));
    r8.yz = saturate(r8.yz * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.www * r3.xyz;
    r8.w = ps;
    ps = UniformScalar_4.x - r6.w;
    r14 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r9.w = ps;
    ps = -r0.z;
    r5.xyw = r5.zxy * r8.zww;
    r12.xy = r9.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r12.z = -r12.y + 1.0;
    r12.w = ps;
    r10.yzw = r12.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r4.x = saturate(r4.w * 0.0001);
    r10.x = ps;
    r3 = r10.wzxy - 0.5;
    r16 = float4((r10.wzxy >= 0.5));
    r3 = r3 - r10.wzxy;
    r3 = r3.yxzw * r16.yxzw + r10.zwxy;
    r11 = r3.zwxy + r3.zwxy;
    r10 = tex2D(Texture2D_8, r0.xy);
    r13 = tex2D(Texture2D_4, r14.xy).zxyw;
    r17 = tex2D(Texture2D_3, r11.xy);
    r15.yzw = tex2D(Texture2D_4, r14.zw).xyw;
    r3.yz = r0.wz + r0.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = float((UniformScalar_3.x >= 1.0));
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.xy = r15.yz + r15.yz;
    r0.w = ps;
    r5.x = r9.w * r5.x + r6.w;
    ps = -r5.x;
    r11.xy = r0.zw * abs(r7.xy);
    ps = r6.z + ps;
    r19.z = dot(r16.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r19.w = dot(r16.zww, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r5.x = (r19.w == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_5.x;
    r16 = r19.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r3.w = ps;
    r5.x = (r16.z == 0.0) ? r17.z : r5.x;
    r0.z = (r16.w == 0.0) ? r17.w : r5.x;
    ps = max(r3.x, r3.w);
    r5.z = max(r0.z, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_6.x;
    r3.xw = min(r5.xz, float2(1.0, 0.3));
    r5.x = ps;
    ps = r8.y;
    r0.w = saturate(r3.x * r5.x);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r0.zw = -r0.wz + 1.0;
    r5.z = ps;
    ps = 1.0 - r8.x;
    r15.x = r0.z * r6.w;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.xy = r15.wx * r13.wx;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r4.w = float((r6.y >= 0.05));
    r4.z = ps;
    ps = ScreenPositionScaleBias.w + r5.y;
    r7 = -r4.wyzx + 1.0;
    r4.z = ps;
    r5.z = (UniformScalar_4.x > 0.0) ? r7.x : 1.0;
    r5.z = (UniformScalar_4.x >= 0.0) ? r5.z : r7.x;
    ps = ScreenPositionScaleBias.z + r5.w;
    r14.z = r5.z * r10.w;
    r4.w = ps;
    ps = r12.x + r12.x;
    r14.xzw = r14.zxy + float3(-0.5, -1.0, -1.0);
    r4.x = ps;
    ps = r12.y + r12.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.xxxx)) clip(-1.0);
    r4.y = ps;
    r12 = tex2D(Texture2D_2, r3.yz);
    r20.xyz = tex2D(Texture2D_7, r4.xy).xyz;
    r21 = tex2D(Texture2D_3, r11.zw);
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r22 = tex2D(Texture2D_6, r0.xy);
    r23.xyz = tex2D(LightAttenuationTexture, r4.zw).xyz;
    r4.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r18.xyz = tex2D(Texture2D_1, r3.yz).xyz;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r11.xyz = UniformVector_4.xyz * 2e+01;
    r15.xyw = r10.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r18.xyz = r18.xyz * 2.0 - 1.0;
    r19.xy = r0.xy * 0.875;
    ps = r4.x + r4.x;
    r3.xyz = r23.xyz * r2.www;
    r13.x = ps;
    r16.zw = r13.yz * 2.0 - 1.0;
    ps = r4.y + r4.y;
    r2.xyz = r22.xyz * r22.www;
    r13.y = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = r4.w + r4.w;
    r11.xyz = r11.xyz * r2.xyz;
    r13.z = ps;
    ps = UniformVector_3.x * r5.y;
    r5.w = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.y = ps;
    ps = UniformVector_3.y * r5.z;
    r0.x = r5.w - r11.x;
    r5.w = ps;
    ps = UniformVector_3.z * r5.x;
    r2.x = saturate(r0.x + r11.x);
    r5.z = ps;
    r14.xy = -r5.yw * r2.xx + r5.yw;
    r5.x = (r19.z == 0.0) ? r21.x : r21.y;
    r5.x = (r16.y == 0.0) ? r21.z : r5.x;
    r16.x = (r16.x == 0.0) ? r21.w : r5.x;
    ps = 1.0 - r5.z;
    r16.y = r3.w * 3.3333333;
    r2.y = ps;
    ps = 1.0 - r2.x;
    r2.zw = -r16.xy + 1.0;
    r5.x = ps;
    r0.x = dot(r8.xx, r2.zz) + r16.x;
    ps = 2.5 * r0.w;
    r13.w = r0.x + r16.x;
    r0.y = ps;
    ps = r8.x;
    r13 = r13 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r2.w * ps;
    r0.x = saturate(r13.w - r6.x);
    r15.z = ps;
    ps = rsqrt(abs(r6.w));
    r8.xyz = r0.xxx * r20.xyz;
    r6.w = ps;
    ps = -r8.z;
    r4.xyz = r6.www * r1.xyz;
    r2.zw = r19.xy * r7.yz + 0.125;
    ps = r12.z + ps;
    r1.xz = -r8.xy + r12.xy;
    r1.y = ps;
    r8.xy = r1.xz * r12.ww + r8.xy;
    ps = r2.y * r2.x;
    r1.xzw = r18.zxy - r13.zxy;
    r6.w = ps;
    ps = r2.z * r2.w;
    r12 = r1.zwxy * r12.wwww;
    r0.x = ps;
    r1.xyz = r0.xxx * r17.xyz + ModShadowColor.xyz;
    ps = (-1.0) - -r6.x;
    r8.z = r8.z + r12.w;
    r2.w = ps;
    ps = r12.z;
    r7.xyz = r15.xyw * r5.xxx;
    r5.x = ps;
    ps = r5.z;
    r15.xy = r14.zw * 0.5;
    ps = r6.w + ps;
    r2.xyz = r16.zyw + r15.xzy;
    r6.w = ps;
    r6.xy = r2.xy * r2.yz + r14.xy;
    r0.x = r2.w * r2.y + 1.0;
    ps = r0.x * r0.w;
    r2.xyz = r13.xyz + r12.xyz;
    r5.y = ps;
    ps = r0.y * r0.x;
    r6.xyw = -r2.xyz + r6.xyw;
    r5.z = ps;
    ps = (-2.0) + r5.x;
    r5.yz = r5.yz * r6.zz;
    r2.w = ps;
    ps = (-0.5) + r5.z;
    r5.x = float((r5.y >= 0.9));
    r5.z = saturate(ps);
    r5.xyw = r11.xyz * r5.xxx + r10.xyz;
    r0.xyz = r6.xyw * r5.zzz + r2.xyw;
    r0.w = r4.w * 2.0 + r0.z;
    r5.xyw = r5.xyw - r8.xyz;
    r6.xyz = r5.xyw * r5.zzz + r8.xyz;
    r0.xyw = r0.xyw * r7.www;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r5.xyw = (r7.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r7.www >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r7.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r2.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r9.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r2.xyz * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r4.zxy, r7.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.yzw;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r2.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r0.xzy * r5.xxx;
    r5.y = r6.z * r5.w + r5.y;
    r5.xz = r6.xy * r5.ww + r5.xz;
    r5.xyz = r3.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
