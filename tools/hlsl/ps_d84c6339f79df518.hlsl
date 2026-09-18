// ps_d84c6339f79df518.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040D00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = -r1.y + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.y = r1.x * UniformVector_2.x;
    r0.w = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r1.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r0.x;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = 0.5 + ps;
    r0.w = dot(r2.zxy, r2.zxy);
    r12.z = ps;
    r8.xyz = r1.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r12.x = r1.z * UniformVector_2.y;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r7.xyz = r0.www * r2.xyz;
    r6.x = ps;
    ps = r0.y;
    r1.xyw = r6.xxx * r4.xyz;
    ps = 0.5 + ps;
    r1.z = dot(r8.zxy, r8.zxy);
    r12.w = ps;
    r11.xy = float2((r12.xy >= 0.5));
    ps = rsqrt(abs(r1.z));
    r0.zw = r12.yx - 0.5;
    r1.z = ps;
    ps = r0.z;
    r8.xyz = r8.xyz * r1.zzz;
    ps = -r12.y + ps;
    r1.z = dot(r8.zxy, r1.wxy);
    r9.x = ps;
    ps = r0.w;
    r9.yzw = r8.xzy * r1.zzz;
    r9.yzw = r9.yzw * 2.0 - r1.xwy;
    ps = -r12.x + ps;
    r0.z = saturate(dot(r7.zxy, r9.zyw));
    r9.y = ps;
    ps = log2(r0.z);
    r10.xy = r9.xy * r11.yx;
    r6.y = ps;
    r6 = r6.zwxy * float4(0.875, 0.875, -0.05, 15.0);
    r10.zw = r6.zz * r4.xy;
    ps = r0.x;
    r0.zw = r10.zw + 0.5;
    ps = UniformVector_3.x * ps;
    r0.zw = r0.zw + r0.xy;
    r9.z = ps;
    ps = r0.y;
    r4 = r12.zwyx + r10.zwxy;
    ps = UniformVector_3.y * ps;
    r9.xy = r4.zw + r4.zw;
    r9.w = ps;
    r4.z = tex2D(Texture2D_3, r9.zw).x;
    r10 = tex2D(Texture2D_2, r9.xy);
    r9 = tex2D(Texture2D_1, r0.xy);
    r13.xyz = tex2D(Texture2D_1, r4.xy).xyz;
    r0.w = tex2D(Texture2D_1, r0.zw).w;
    ps = 1.0 / r5.w;
    r0.x = r2.z + 0.1;
    r0.z = ps;
    ps = 5.0 * r0.x;
    r0.y = dot(r3.zxy, r3.zxy);
    r4.x = saturate(ps);
    ps = ScreenPositionScaleBias.x * r0.z;
    r12.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r2.x = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r1.xyz = r13.xyz * 0.15;
    r2.y = ps;
    r2.xy = r2.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.yzw = r12.xyz * r9.xyz - r1.xyz;
    ps = 1.0 - r0.w;
    r0.x = max(r1.w, 0.0);
    r5.x = ps;
    r2.w = r5.x * r9.w + r0.w;
    ps = 1.0 - r0.y;
    r0.x = -r0.x + 1.0;
    r0.z = saturate(ps);
    ps = log2(r0.z);
    r4.w = dot(r11.yxx, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r9.xyz = r5.yzw * r9.www + r1.xyz;
    r5.xyz = r9.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r1.w = (r4.w == 0.0) ? r10.x : r10.y;
    ps = log2(abs(r0.x));
    r2.z = r0.z * LightColorAndFalloffExponent.w;
    r0.z = ps;
    ps = UniformScalar_4.x * r0.z;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r0.xzw = r4.zww + float3(1.0, -3.0, -2.0);
    r4.z = ps;
    r1.w = (r0.w == 0.0) ? r10.z : r1.w;
    r4.y = (r0.z == 0.0) ? r10.w : r1.w;
    ps = r0.x;
    r1.xyz = r9.xyz * r1.xyz;
    ps = -r4.z + ps;
    r0.zw = -r4.xz + 1.0;
    r1.w = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.x = saturate(dot(r8.zxy, r7.zxy));
    r4.z = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1 = r1 * r0.xxxw;
    r4.w = ps;
    ps = pow(2.0, r2.z);
    r1.w = r1.w * r2.w;
    r4.x = ps;
    ps = pow(2.0, r6.w);
    r4.yzw = -r4.yzw + 1.0;
    r0.x = ps;
    r1.xy = r5.xy * r0.xx + r1.xy;
    r1.z = r5.z * r0.x + r1.z;
    ps = rsqrt(abs(r0.y));
    r1 = r1 * r4.xxxy;
    r0.y = ps;
    ps = (-0.5) - -r1.w;
    r0.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.xzw = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r2.xyz = r0.yyy * -SpotDirection.xyz;
    r0.y = dot(r2.zxy, r3.zxy);
    ps = -SpotAngles.x - -r0.y;
    r1.xyz = r1.xyz * r0.xzw;
    r0.x = ps;
    ps = SpotAngles.y * r0.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = saturate(ps);
    r0.yz = r6.xy * r4.zw + 0.125;
    r0.xw = r0.yx * r0.zx;
    r0.xyz = r0.xxx * r2.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
