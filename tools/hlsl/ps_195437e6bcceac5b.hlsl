// ps_195437e6bcceac5b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040F00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r1.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.zz * ScreenPositionScaleBias.xy;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = float((UniformScalar_0.x > UniformScalar_1.x));
    r6.z = ps;
    r5.xy = r6.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.yzw = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.y = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = 1.0 - r0.y;
    r6.x = dot(r1.zxy, r1.zxy);
    r3.w = saturate(ps);
    ps = 0.875 * r0.x;
    r14.xyz = r13.zxy + float3(-2.0, 0.0, 0.0);
    r10.x = ps;
    ps = rsqrt(abs(r6.x));
    r15.xyz = r12.xyz * r6.yzw;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.xyz = r6.xxx * r1.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r1.xxx * r3.xyz;
    r0.y = ps;
    ps = 0.875 * r0.z;
    r11.xyz = r0.yyy * -SpotDirection.xyz;
    r10.y = ps;
    r1.xyz = (-abs(r0.www) >= 0.0) ? r12.xyz : r15.xyz;
    ps = log2(r3.w);
    r0.xyw = r14.yzx + r13.xyz;
    r0.z = ps;
    r3.xyz = (-abs(r1.www) >= 0.0) ? r12.xyz : r1.xyz;
    ps = 5.0 * r4.x;
    r1.xyz = r0.xyw + float3(-1.0, -1.0, 0.0);
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.y = dot(r11.zxy, r2.zxy);
    r0.x = ps;
    r0.xw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r2.xy = r10.xy * r0.xw + 0.125;
    ps = -SpotAngles.x - -r0.y;
    r1.xyz = r1.zxy * UniformScalar_0.xxx;
    r0.x = ps;
    ps = 1.0 + r1.x;
    r3.xyz = r3.xyz - r8.xyz;
    r1.w = ps;
    r8.xyz = r3.xyz * UniformScalar_0.xxx + r8.xyz;
    r3.xyz = r8.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = SpotAngles.y * r0.x;
    r2.z = dot(r1.wyz, r1.wyz);
    r2.w = saturate(ps);
    r2.xy = r2.xw * r2.yw;
    r0.xyw = r2.xxx * r9.xyz + ModShadowColor.xyz;
    ps = rsqrt(abs(r2.z));
    r5.xyz = r8.xyz * r5.xyz;
    r2.z = ps;
    ps = UniformScalar_9.x;
    r1.xzw = r1.yzw * r2.zzz;
    r2.z = ps;
    ps = 0.0001;
    r1.y = dot(r1.wxz, r7.zxy);
    r2.w = ps;
    ps = max(r2.z, r2.w);
    r8.xyz = r1.xwz * r1.yyy;
    r5.w = ps;
    r7.xyz = r8.xyz * 2.0 - r7.xzy;
    ps = LightColorAndFalloffExponent.w * r0.z;
    r1.y = saturate(dot(r6.zxy, r7.yxz));
    r0.z = ps;
    ps = log2(r1.y);
    r1.x = saturate(dot(r1.wxz, r6.zxy));
    r1.y = ps;
    ps = pow(2.0, r0.z);
    r1 = r5 * r1.xxxy;
    r0.z = ps;
    ps = pow(2.0, r1.w);
    r2.z = ps;
    r1.xy = r3.xy * r2.zz + r1.xy;
    r1.z = r3.z * r2.z + r1.z;
    r1.xyz = r1.xyz * r0.zzz;
    r1.xyz = r1.xyz * r4.yzw;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r2.yyy;
    r0.xyz = r1.xzy * r0.xyw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
