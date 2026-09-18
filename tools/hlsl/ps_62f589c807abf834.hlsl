// ps_62f589c807abf834.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 297 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004A4 10040F00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r8.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r12.x = r1.x * UniformVector_2.x;
    r10.xy = r1.xy * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    r11.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r11.x = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r11.xyw = r11.yxz * float3(0.5, -0.025, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r12.zw = r7.xy * r11.yy;
    r12.y = ps;
    r0.zw = r12.xy - 0.5;
    r13.xz = float2((r12.xy >= 0.5));
    ps = r9.x;
    r0.zw = r0.zw - r12.xy;
    ps = abs(r6.x) * ps;
    r10.zw = r0.zw * r13.xz;
    r1.z = ps;
    ps = r9.y;
    r10 = r12.zwxy + r10;
    ps = abs(r6.y) * ps;
    r0.zw = r10.zw + r10.zw;
    r1.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r12 = tex2D(Texture2D_1, r0.zw);
    r9.xyz = tex2D(Texture2D_2, r1.xy).wxy;
    r4.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = r0.xzy * 2.0 - 1.0;
    r1.yzw = r4.xyw * 2.0 - 1.0;
    ps = r9.y + r9.y;
    r6.zw = r5.xy * ScreenPositionScaleBias.xy;
    r13.y = ps;
    ps = r9.z + r9.z;
    r13.x = dot(r13.xzz, float3(1.0, 1.0, 1.0));
    r13.z = ps;
    r0.w = (r13.x == 0.0) ? r12.x : r12.y;
    r13 = r13.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.xy = r13.zw + r11.xw;
    r0.w = (r13.y == 0.0) ? r12.z : r0.w;
    r9.y = (r13.x == 0.0) ? r12.w : r0.w;
    r0.w = max(r9.y, 0.0);
    r11.x = min(r0.w, 0.3);
    ps = 1.0 / r5.w;
    r12.xyz = r11.yxz * float3(0.875, 3.3333333, 0.875);
    r0.w = ps;
    r6.xy = r12.yy * r6.xy - r1.yz;
    r6.xy = r0.xz * UniformVector_4.xy + r6.xy;
    r11.xy = r6.zw * r0.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r13.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r5.x = saturate(r5.w * 0.0001);
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 - -r2.z;
    r0.x = dot(r3.zxy, r3.zxy);
    r1.x = ps;
    r9.x = r7.w * r9.x - 1.0;
    ps = 1.0 - r0.x;
    r5.yzw = UniformVector_5.xyz * UniformVector_5.www;
    r0.z = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r15.xyz = r5.yzw * r8.xyz;
    r0.x = ps;
    r8.xyz = r15.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r14.w = r0.y * UniformVector_4.z - r1.w;
    ps = log2(r0.z);
    r0.xyw = r0.xxx * -SpotDirection.xyz;
    r0.z = ps;
    ps = 5.0 * r1.x;
    r0.y = dot(r0.wxy, r3.zxy);
    r9.z = saturate(ps);
    r0.xw = -r9.yz + 1.0;
    ps = 2.5 * r0.x;
    r5.yz = r0.ww * ModShadowGroupColor.xy;
    r15.w = ps;
    ps = rsqrt(abs(r2.w));
    r9.yzw = -r5.zyx + 1.0;
    r0.x = ps;
    r12.xyz = r12.yxz * r9.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r12.x) * abs(r12.x);
    r5.xyz = r0.xxx * r2.xyz;
    r12.w = ps;
    r14.xyz = r15.xyz * r12.xxx - r13.xyz;
    r0.w = saturate(r15.w * r12.x - 0.5);
    r6.xy = r6.xy * r0.ww + r1.yz;
    r1.w = r14.w * r0.w - 2.0;
    r3.xyz = r14.xyz * r0.www + r13.xyz;
    ps = -SpotAngles.x - -r0.y;
    r2.yz = r12.wy * r12.wz;
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
