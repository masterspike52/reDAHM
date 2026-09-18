// ps_b347b15b48d0b6cd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 306 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004C8 10041000 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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

    r12 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r12.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r9.x = r1.x * UniformVector_2.x;
    r8.xy = r1.xy * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    r9.zw = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r9.y = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r13.xyw = r9.zyw * float3(0.5, -0.025, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r9.zw = r7.xy * r13.yy;
    r9.y = ps;
    r4.xy = r9.xy - 0.5;
    r0.zw = float2((r9.xy >= 0.5));
    ps = r1.z;
    r4.xy = r4.xy - r9.xy;
    ps = abs(r6.x) * ps;
    r8.zw = r4.xy * r0.zw;
    r4.x = ps;
    ps = r1.w;
    r10 = r9.zwxy + r8;
    ps = abs(r6.y) * ps;
    r1.zw = r10.zw + r10.zw;
    r4.y = ps;
    r13.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r11 = tex2D(Texture2D_1, r1.zw);
    r9.xyz = tex2D(Texture2D_2, r1.xy).wxy;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyw = r6.xyz * 2.0 - 1.0;
    r6.xyz = r4.xyw * 2.0 - 1.0;
    ps = r9.y + r9.y;
    r15.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.y = ps;
    ps = r9.z + r9.z;
    r0.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r1.z = (r0.x == 0.0) ? r11.x : r11.y;
    ps = r1.x;
    r0 = r0.yxxz + float4(-1.0, -2.0, -3.0, -1.0);
    ps = UniformVector_6.x * ps;
    r11.xy = r0.xw + r13.xw;
    r0.x = ps;
    r0.y = (r0.y == 0.0) ? r11.z : r1.z;
    r9.y = (r0.z == 0.0) ? r11.w : r0.y;
    ps = r1.y;
    r0.y = max(r9.y, 0.0);
    ps = UniformVector_6.y * ps;
    r13.x = min(r0.y, 0.3);
    r0.y = ps;
    ps = 1.0 / r5.w;
    r1.yzw = r13.yxz * float3(0.875, 3.3333333, 0.875);
    r0.z = ps;
    r11.xy = r1.zz * r11.xy - r6.xy;
    r15.xy = r8.xy * UniformVector_4.xy + r11.xy;
    r0.zw = r15.zw * r0.zz + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r13.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r0.yzw = tex2D(Texture2D_6, r0.xy).xyz;
    r5.x = saturate(r5.w * 0.0001);
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r2.w = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r1.x = r2.z + 0.1;
    r5.w = ps;
    r9.x = r7.w * r9.x - 1.0;
    ps = rsqrt(abs(r0.x));
    r8.xyz = r5.yzw * r12.xyz;
    r5.y = ps;
    r14.w = r8.w * UniformVector_4.z - r6.z;
    ps = 1.0 - r0.x;
    r5.yzw = r5.yyy * -SpotDirection.xyz;
    r0.x = saturate(ps);
    ps = log2(r0.x);
    r16.xyz = r8.xyz * r0.yzw;
    r0.z = ps;
    r8.xyz = r16.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 5.0 * r1.x;
    r0.y = dot(r5.wyz, r3.zxy);
    r9.z = saturate(ps);
    r0.xw = -r9.yz + 1.0;
    ps = 2.5 * r0.x;
    r5.yz = r0.ww * ModShadowGroupColor.xy;
    r16.w = ps;
    ps = rsqrt(abs(r2.w));
    r9.yzw = -r5.zyx + 1.0;
    r0.x = ps;
    r12.yzw = r1.zyw * r9.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r12.y) * abs(r12.y);
    r5.xyz = r0.xxx * r2.xyz;
    r12.x = ps;
    r14.xyz = r16.xyz * r12.yyy - r13.xyz;
    r0.w = saturate(r16.w * r12.y - 0.5);
    r6.xy = r15.xy * r0.ww + r6.xy;
    r1.w = r14.w * r0.w - 2.0;
    r3.xyz = r14.xyz * r0.www + r13.xyz;
    ps = -SpotAngles.x - -r0.y;
    r2.yz = r12.xz * r12.xw;
    r0.x = ps;
    r1.xyz = r2.zzz * r11.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r0.x;
    r3.xyz = r3.xyz * r10.xyz;
    r2.x = saturate(ps);
    r6.z = r4.w * 2.0 + r1.w;
    r6.xyw = r6.xyz * r9.www;
    ps = r2.x * r2.x;
    r6.z = r6.w + 1.0;
    r0.x = ps;
    r6.xyz = (r9.www > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r9.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.y * r2.y;
    r0.y = dot(r6.zxy, r6.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r0.y));
    r2.xyz = r1.www * r8.xyz;
    r0.y = ps;
    r6.xyz = r6.xyz * r0.yyy;
    r0.y = dot(r6.zxy, r7.zxy);
    r8.xyz = r6.xyz * r0.yyy;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r0.y = saturate(dot(r5.zxy, r7.zxy));
    ps = log2(r0.y);
    r2.xyz = r2.xyz * r0.www;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.z;
    r0.w = r0.y * 15.0;
    r0.y = ps;
    ps = pow(2.0, r0.w);
    r0.z = saturate(dot(r6.zyx, r5.zyx));
    r0.w = ps;
    ps = pow(2.0, r0.y);
    r2.xyz = r2.xyz * r0.www;
    r0.y = ps;
    r2.xy = r3.xy * r0.zz + r2.xy;
    r2.z = r3.z * r0.z + r2.z;
    r0.yzw = r2.xyz * r0.yyy;
    r0.yzw = r0.yzw * r4.xyz;
    r0.yzw = r0.yzw * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.ywz * r0.xxx;
    r0.xyz = r0.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
