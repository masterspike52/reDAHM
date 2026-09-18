// ps_ca5b0b196c89da03.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10041000 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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

    r8 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.z = ps;
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r1.zw = r1.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r8.w;
    r1.xy = r1.xy * UniformVector_5.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.x = r2.z + 0.1;
    r3.y = ps;
    ps = (-0.5) + r0.z;
    r3.yz = r3.yz * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r9.yz = tex2D(ModShadowAccumTexture, r3.yz).xy;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10 = tex2D(Texture2D_1, r0.xy);
    r13 = tex2D(Texture2D_2, r0.xy);
    r11.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r1.xyz = tex2D(LightAttenuationTexture, r1.zw).zxy;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    ps = r5.w;
    r3.yzw = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r14.xyz = UniformVector_4.xzy * 2e+01;
    r11.w = saturate(ps);
    ps = UniformVector_3.x;
    r1.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r16.x = ps;
    ps = UniformVector_3.z;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r0.y = float((UniformScalar_8.x > 1.0));
    r16.y = ps;
    ps = UniformVector_3.y;
    r5.xyz = r8.xyz * UniformScalar_9.xxx;
    r12.xyz = (-abs(r0.yyy) >= 0.0) ? r11.xyz : 1.0;
    ps = 2e+01 * ps;
    r13.xyz = r13.xzy * r13.www;
    r16.z = ps;
    ps = rsqrt(abs(r0.x));
    r15.xyz = r10.xzy * r10.www;
    r4.w = ps;
    r0.xyz = r7.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r2.w));
    r7.xyz = r4.www * r2.xyz;
    r2.x = ps;
    ps = UniformVector_2.x * r0.y;
    r10.xyz = r2.xxx * r4.xyz;
    r11.x = ps;
    ps = UniformVector_2.y * r0.z;
    r2.xyz = r16.xyz * r15.xyz;
    r11.y = ps;
    ps = UniformVector_2.z * r0.x;
    r13.xyz = r14.xyz * r13.xyz;
    r11.z = ps;
    r12.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r12.xyz;
    r4.xyz = r5.xyz * r12.xyz + UniformScalar_10.xxx;
    r0.xyz = (abs(r0.www) > 0.0) ? r2.xzy : r13.xzy;
    r5.xyz = (-abs(r0.www) >= 0.0) ? r13.yxz : r2.yxz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r2.xy = -r11.zw + 1.0;
    r0.w = ps;
    r5.xyz = (-abs(r0.www) >= 0.0) ? r13.yxz : r5.xyz;
    r0.xyw = (abs(r0.www) > 0.0) ? r0.yzx : r13.zyx;
    r8.xyz = r12.xyz * r8.xyz + r0.wxy;
    ps = 5.0 * r3.x;
    r1.w = saturate(dot(r5.zxy, float3(0.59, 0.11, 0.3)));
    r2.z = saturate(ps);
    ps = r2.x;
    r0.z = dot(r0.ywx, float3(0.11, 0.3, 0.59));
    ps = r1.w * ps;
    r0.z = r0.z - r0.w;
    r5.z = ps;
    ps = r0.z;
    r5.xy = -r11.xy * r1.ww;
    ps = r0.w + ps;
    r0.xyz = r11.zxy + r5.zxy;
    r2.w = saturate(ps);
    ps = (-1.0) - -r0.x;
    r2.xz = -r2.zw + 1.0;
    r0.w = ps;
    r5.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    r0.xyz = r0.wyz * r2.yyy;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r2.yyy > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r2.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r0.wyz, r0.wyz);
    ps = rsqrt(abs(r0.x));
    r3.xyz = r8.xyz * r3.yzw;
    r0.x = ps;
    r8.xyz = r0.yzw * r0.xxx;
    r0.x = dot(r8.zxy, r10.zxy);
    ps = LightColor.x * r1.y;
    r0.xyz = r8.xyz * r0.xxx;
    r2.x = ps;
    r0.xyz = r0.xyz * 2.0 - r10.xyz;
    ps = LightColor.z * r1.x;
    r0.x = saturate(dot(r7.zxy, r0.zxy));
    r2.y = ps;
    ps = log2(r0.x);
    r4.xyz = r4.xyz * r2.zzz;
    r9.x = ps;
    ps = LightColor.y * r1.z;
    r0.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    r2.z = ps;
    ps = pow(2.0, r0.z);
    r0.w = saturate(dot(r8.zyx, r7.zyx));
    r0.z = ps;
    r0.xy = r0.xy * r5.xy + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r4.xyz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.xy = r3.xy * r0.ww + r1.xy;
    r1.z = r3.z * r0.w + r1.z;
    r1.xyz = r2.xzy * r1.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
