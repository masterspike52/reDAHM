// ps_7acbf721707dd4aa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = ps;
    ps = 1.0 / r4.w;
    r5.yw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r6.xy = r5.yw * r5.xx + ScreenPositionScaleBias.wz;
    ps = r12.w;
    r6.zw = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = r1.z + 0.1;
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r5.xz = r5.xz * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r9.yz = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7 = tex2D(Texture2D_1, r0.xy);
    r10 = tex2D(Texture2D_2, r0.xy);
    r0.xyw = tex2D(Texture2D_3, r6.zw).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).zxy;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    ps = r4.w;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r15.xyz = UniformVector_4.xzy * 2e+01;
    r11.w = saturate(ps);
    ps = UniformVector_3.x;
    r6.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r16.x = ps;
    ps = UniformVector_3.z;
    r2.w = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r3.w = float((UniformScalar_8.x > 1.0));
    r16.y = ps;
    ps = UniformVector_3.y;
    r4.xyz = r12.xyz * UniformScalar_9.xxx;
    r14.xyz = (-abs(r3.www) >= 0.0) ? r0.xyw : 1.0;
    ps = 2e+01 * ps;
    r13.xyz = r10.xzy * r10.www;
    r16.z = ps;
    ps = rsqrt(abs(r2.w));
    r0.xyw = r7.xzy * r7.www;
    r2.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r2.www * r1.xyz;
    r1.x = ps;
    ps = UniformVector_2.x * r5.y;
    r10.xyz = r1.xxx * r3.xyz;
    r11.x = ps;
    ps = UniformVector_2.y * r5.z;
    r0.xyw = r16.xyz * r0.xyw;
    r11.y = ps;
    ps = UniformVector_2.z * r5.x;
    r13.xyz = r15.xyz * r13.xyz;
    r11.z = ps;
    r1.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r14.xyz;
    r3.xyz = r4.xyz * r1.xyz + UniformScalar_10.xxx;
    r5.xyz = (abs(r5.www) > 0.0) ? r0.xwy : r13.xzy;
    r4.xyz = (-abs(r5.www) >= 0.0) ? r13.yxz : r0.yxw;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r0.xy = -r11.zw + 1.0;
    r5.w = ps;
    r4.xyz = (-abs(r5.www) >= 0.0) ? r13.yxz : r4.xyz;
    r5.xyw = (abs(r5.www) > 0.0) ? r5.yzx : r13.zyx;
    r1.xyz = r1.xyz * r12.xyz + r5.wxy;
    ps = 5.0 * r0.z;
    r6.w = saturate(dot(r4.zxy, float3(0.59, 0.11, 0.3)));
    r0.z = saturate(ps);
    ps = r0.x;
    r5.z = dot(r5.ywx, float3(0.11, 0.3, 0.59));
    ps = r6.w * ps;
    r5.z = r5.z - r5.w;
    r4.z = ps;
    ps = r5.z;
    r4.xy = -r11.xy * r6.ww;
    ps = r5.w + ps;
    r5.xyz = r11.zxy + r4.zxy;
    r0.w = saturate(ps);
    ps = (-1.0) - -r5.x;
    r0.xz = -r0.zw + 1.0;
    r5.w = ps;
    r4.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r5.xyz = r5.wyz * r0.yyy;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r0.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r8.xyz;
    r5.x = ps;
    r8.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r8.zxy, r10.zxy);
    ps = LightColor.x * r6.y;
    r5.xyz = r8.xyz * r5.xxx;
    r0.x = ps;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    ps = LightColor.z * r6.x;
    r5.x = saturate(dot(r7.zxy, r5.zxy));
    r0.y = ps;
    ps = log2(r5.x);
    r3.xyz = r3.xyz * r0.zzz;
    r9.x = ps;
    ps = LightColor.y * r6.z;
    r5.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    r0.z = ps;
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r8.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r4.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r3.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r2.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
