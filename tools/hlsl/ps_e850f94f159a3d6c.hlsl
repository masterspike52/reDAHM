// ps_e850f94f159a3d6c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10040E00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r13.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r10.x = r1.x * UniformVector_2.x;
    r8.xy = r1.xy * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    r3.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r3.x = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r9.xyz = r3.xyz * float3(-0.025, 0.5, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r10.zw = r7.xy * r9.xx;
    r10.y = ps;
    r3.xy = r10.xy - 0.5;
    r0.zw = float2((r10.xy >= 0.5));
    ps = r1.z;
    r3.xy = r3.xy - r10.xy;
    ps = abs(r6.x) * ps;
    r8.zw = r3.xy * r0.zw;
    r3.x = ps;
    ps = r1.w;
    r8 = r10.zwxy + r8;
    ps = abs(r6.y) * ps;
    r1.zw = r8.zw + r8.zw;
    r3.y = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r14 = tex2D(Texture2D_1, r1.zw);
    r3.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r11.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r6.xy = r1.xy * UniformVector_6.xy;
    r4.xyz = r4.xyw * 2.0 - 1.0;
    r1.xyz = r11.xyz * 2.0 - 1.0;
    ps = r3.x + r3.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r11.y = ps;
    ps = r3.y + r3.y;
    r11.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    r0.z = (r11.x == 0.0) ? r14.x : r14.y;
    r11 = r11.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r11.z;
    r1.xyz = r1.xyz * UniformVector_4.xyz;
    r0.z = (r11.y == 0.0) ? r14.z : r0.z;
    r8.z = (r11.x == 0.0) ? r14.w : r0.z;
    ps = r9.y + ps;
    r0.w = max(r8.z, 0.0);
    r0.z = ps;
    ps = r11.w;
    r10.x = min(r0.w, 0.3);
    ps = r9.z + ps;
    r3.xyz = r10.yxz * float3(0.875, 3.3333333, 0.875);
    r0.w = ps;
    r0.zw = r3.yy * r0.zw + r1.xy;
    ps = 1.0 / r5.w;
    r12.xy = r0.zw - r4.xy;
    r0.z = ps;
    r0.zw = r12.zw * r0.zz + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_4, r8.xy).xyz;
    r11.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.zw).zxy;
    r8.y = saturate(r5.w * 0.0001);
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = r2.z;
    r14.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r6.xyz = r6.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 0.1 + ps;
    r13.xyz = r14.xyz * r13.xyz;
    r1.w = ps;
    r8.x = r7.w * r3.w - 1.0;
    ps = rsqrt(abs(r0.w));
    r8.w = saturate(r1.w * 5.0);
    r0.w = ps;
    ps = -r4.z;
    r1.xy = -r8.zw + 1.0;
    ps = r1.z + ps;
    r8.zw = r1.yy * ModShadowGroupColor.xy;
    r11.w = ps;
    ps = 2.5 * r1.x;
    r8.yzw = -r8.wzy + 1.0;
    r1.w = ps;
    r3.yzw = r3.yxz * r8.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r3.y) * abs(r3.y);
    r1.xyz = r13.xyz * r11.xyz;
    r3.x = ps;
    r11.xyz = r1.xyz * r3.yyy - r9.xyz;
    r2.w = saturate(r1.w * r3.y - 0.5);
    r1.xy = r12.xy * r2.ww + r4.xy;
    r1.z = r11.w * r2.w - 2.0;
    r9.xyz = r11.xyz * r2.www + r9.xyz;
    r3.xw = r3.zx * r3.wx;
    r3.xyz = r3.xxx * r10.xyz + ModShadowColor.xyz;
    r4.xyz = r9.xyz * r5.xyz;
    r1.z = r4.w * 2.0 + r1.z;
    r1.xyz = r1.zxy * r8.www;
    ps = 1.0 + r1.x;
    r5.xyz = r0.www * r2.xyz;
    r1.w = ps;
    r1.xyz = (r8.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r2.xyz = (r8.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r3.w * r3.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.yzw = r1.xxx * r6.xyz;
    r0.w = ps;
    r6.xyz = r2.xyz * r0.www;
    r0.w = dot(r6.zxy, r7.zxy);
    r2.xyz = r6.xyz * r0.www;
    r2.xyz = r2.xyz * 2.0 - r7.xyz;
    ps = LightColor.x * r0.y;
    r0.w = saturate(dot(r5.zxy, r2.zxy));
    r1.x = ps;
    ps = log2(r0.w);
    r2.xyz = r1.yzw * r2.www;
    r0.w = ps;
    ps = LightColor.y * r0.z;
    r1.z = r0.w * 15.0;
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r0.w = saturate(dot(r6.zyx, r5.zyx));
    r1.z = ps;
    ps = LightColor.z * r0.x;
    r2.xyz = r2.xyz * r1.zzz;
    r1.z = ps;
    r0.xy = r4.xy * r0.ww + r2.xy;
    r0.z = r4.z * r0.w + r2.z;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xzy * r3.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
