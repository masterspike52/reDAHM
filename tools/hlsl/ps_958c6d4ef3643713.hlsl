// ps_958c6d4ef3643713.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 279 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000045C 10040E00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r11.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r3.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r10.x = r1.x * UniformVector_2.x;
    r8.xy = r1.xy * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    r9.yz = r3.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r9.x = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r9.xyz = r9.xyz * float3(-0.025, 0.5, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r10.zw = r7.xy * r9.xx;
    r10.y = ps;
    r4.xy = r10.xy - 0.5;
    r0.zw = float2((r10.xy >= 0.5));
    ps = r1.z;
    r4.xy = r4.xy - r10.xy;
    ps = abs(r6.x) * ps;
    r8.zw = r4.xy * r0.zw;
    r4.x = ps;
    ps = r1.w;
    r8 = r10.zwxy + r8;
    ps = abs(r6.y) * ps;
    r1.zw = r8.zw + r8.zw;
    r4.y = ps;
    r6.zw = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r14 = tex2D(Texture2D_1, r1.zw);
    r4.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r1.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r12.xyz = r3.xyw * 2.0 - 1.0;
    r1.xyz = r1.xyz * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r10.y = ps;
    ps = r4.y + r4.y;
    r10.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    r0.z = (r10.x == 0.0) ? r14.x : r14.y;
    r10 = r10.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r10.z;
    r1.xyw = r1.xyz * UniformVector_4.xyz;
    r0.z = (r10.y == 0.0) ? r14.z : r0.z;
    r6.y = (r10.x == 0.0) ? r14.w : r0.z;
    ps = r9.y + ps;
    r0.w = max(r6.y, 0.0);
    r0.z = ps;
    ps = r10.w;
    r6.x = min(r0.w, 0.3);
    ps = r9.z + ps;
    r10.xyz = r6.zxw * float3(0.875, 3.3333333, 0.875);
    r0.w = ps;
    r0.zw = r10.yy * r0.zw + r1.xy;
    ps = 1.0 / r5.w;
    r13.xy = r0.zw - r12.xy;
    r0.z = ps;
    r0.zw = r13.zw * r0.zz + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_4, r8.xy).xyz;
    r14.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r6.xzw = tex2D(Texture2D_6, r0.xy).xyz;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = saturate(r5.w * 0.0001);
    ps = r2.z;
    r0.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r5.yzw = UniformVector_5.xyz * UniformVector_5.www;
    r0.x = ps;
    r4.xyz = r6.xzw * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r6.x = r3.z * r4.w - 1.0;
    ps = 5.0 * r0.x;
    r3.xyz = r14.xyz * LightColor.xyz;
    r6.z = saturate(ps);
    ps = -r12.z;
    r14.xyz = r5.yzw * r11.xyz;
    ps = r1.w + ps;
    r0.xy = -r6.yz + 1.0;
    r11.w = ps;
    ps = 2.5 * r0.x;
    r5.yz = r0.yy * ModShadowGroupColor.xy;
    r14.w = ps;
    ps = rsqrt(abs(r0.z));
    r6.yzw = -r5.zyx + 1.0;
    r0.x = ps;
    r10.yzw = r10.yxz * r6.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r10.y) * abs(r10.y);
    r5.xyz = r0.xxx * r2.xyz;
    r10.x = ps;
    r11.xyz = r14.xyz * r10.yyy - r9.xyz;
    r1.w = saturate(r14.w * r10.y - 0.5);
    r0.xy = r13.xy * r1.ww + r12.xy;
    r0.z = r11.w * r1.w - 2.0;
    r9.xyz = r11.xyz * r1.www + r9.xyz;
    r2.xw = r10.zx * r10.wx;
    r1.xyz = r2.xxx * r1.xyz + ModShadowColor.xyz;
    r0.z = r3.w * 2.0 + r0.z;
    r0.xyz = r0.zxy * r6.www;
    ps = 1.0 + r0.x;
    r2.xyz = r9.xyz * r8.xyz;
    r0.w = ps;
    r0.xyz = (r6.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r6.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.w * r2.w;
    r0.x = dot(r0.wyz, r0.wyz);
    r2.w = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyz = r2.www * r4.xyz;
    r0.x = ps;
    r0.yzw = r0.yzw * r0.xxx;
    r0.x = dot(r0.wyz, r7.zxy);
    r6.xyz = r0.yzw * r0.xxx;
    r6.xyz = r6.xyz * 2.0 - r7.xyz;
    r0.x = saturate(dot(r5.zxy, r6.zxy));
    ps = log2(r0.x);
    r4.xyz = r4.xyz * r1.www;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r0.wzy, r5.zyx));
    r0.x = ps;
    r0.xyz = r4.xyz * r0.xxx;
    r0.xy = r2.xy * r0.ww + r0.xy;
    r0.z = r2.z * r0.w + r0.z;
    r0.xyz = r3.xyz * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
