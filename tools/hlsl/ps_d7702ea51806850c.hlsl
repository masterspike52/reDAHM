// ps_d7702ea51806850c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r0.xy);
    r0.zw = r1.xy * 6.0;
    r1.z = r11.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r8.x = r1.x * UniformVector_2.x;
    ps = r5.w;
    r9.yz = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r8.zw = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r8.y = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r18.xyz = r8.yzw * float3(-0.025, 0.5, 0.5);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r8.zw = r7.xy * r18.xx;
    r8.y = ps;
    ps = r1.x;
    r0.zw = r8.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r9.xw = float2((r8.xy >= 0.5));
    r4.x = ps;
    ps = r1.y;
    r0.zw = r0.zw - r8.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r0.zw * r9.xw;
    r4.y = ps;
    r8 = r8.zwxy + r4;
    r0.zw = r8.zw + r8.zw;
    r10 = tex2D(Texture2D_1, r0.zw);
    r1.xyz = tex2D(Texture2D_2, r1.xy).wxy;
    r4.xyw = tex2D(Texture2D_3, r9.yz).xyw;
    r15.xy = r4.xy * 2.0 - 1.0;
    ps = r1.y + r1.y;
    r16.yz = r5.xy * ScreenPositionScaleBias.xy;
    r9.y = ps;
    ps = r1.z + r1.z;
    r9.x = dot(r9.xww, float3(1.0, 1.0, 1.0));
    r9.w = ps;
    r0.w = (r9.x == 0.0) ? r10.x : r10.y;
    ps = 0.1 - -r2.z;
    r12.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r0.z = ps;
    ps = 5.0 * r0.z;
    r19 = r9.xxyw + float4(-3.0, -2.0, -1.0, -1.0);
    r17.y = saturate(ps);
    r0.z = (r19.y == 0.0) ? r10.z : r0.w;
    r17.x = (r19.x == 0.0) ? r10.w : r0.z;
    ps = 1.0 / r5.w;
    r0.zw = -r17.yx + 1.0;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xy = r0.zz * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 0.0001 * r5.w;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r9.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.yzw = -r9.zyx + 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r1.y;
    r5.xy = r5.xy * abs(r6.xy);
    r16.x = ps;
    r5.zw = r16.yz * r15.zz + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r10.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r6.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = dot(r3.zxy, r3.zxy);
    r0.y = dot(r2.zxy, r2.zxy);
    r8.xyz = r8.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r1.x = r7.w * r1.x - 1.0;
    ps = rsqrt(abs(r0.y));
    r13.w = r4.w - 1.0;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r12.xyz = r12.xyz * r11.xyz;
    r0.x = saturate(ps);
    r3.xyw = r6.xyz * 2.0 - 1.0;
    r11.xyz = r5.xyw * 2.0 - 1.0;
    r3.w = r3.w * UniformVector_4.z - r11.z;
    ps = log2(r0.x);
    r5.xyz = r0.yyy * r2.xyz;
    r0.x = ps;
    r6.yz = r19.zw + r18.yz;
    r0.y = max(r17.x, 0.0);
    r13.x = min(r0.y, 0.3);
    ps = 2.5 * r0.w;
    r13.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r12.w = ps;
    r2 = r13 * r1.xwzy + float4(1.0, 0.125, 0.125, 1.0);
    r3.xy = r16.xx * r15.xy + r3.xy;
    ps = abs(r2.x) * abs(r2.x);
    r0.y = r2.y * r2.z;
    r3.z = ps;
    r0.yzw = r0.yyy * r14.xyz + ModShadowColor.xyz;
    ps = r3.z * r3.z;
    r12.xyz = r12.xyz * r2.www;
    r6.x = ps;
    r3.xy = r3.xy * UniformVector_4.xy - r11.xy;
    r6.yz = r13.xx * r6.yz + r3.xy;
    r6.w = saturate(r12.w * r2.x - 0.5);
    r3.xyz = r12.xyz * r2.xxx - r10.xyz;
    r2.z = r3.w * r6.w - 2.0;
    r10.xyz = r3.xyz * r6.www + r10.xyz;
    r3.xyw = r6.yzx * r6.wwx;
    r2.xy = r11.xy + r3.xy;
    r2.z = r5.w * 2.0 + r2.z;
    r2.xyz = r2.zxy * r1.yyy;
    ps = 1.0 + r2.x;
    r3.xyz = r10.xyz * r9.xyz;
    r2.w = ps;
    r2.xyz = (r1.yyy > 0.0) ? r2.yzw : float3(0.0, 0.0, 1.0);
    r1.yzw = (r1.yyy >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r1.x = dot(r1.wyz, r1.wyz);
    ps = rsqrt(abs(r1.x));
    r2.xyz = r3.www * r8.xyz;
    r1.x = ps;
    r1.yzw = r1.yzw * r1.xxx;
    r1.x = dot(r1.wyz, r7.zxy);
    r8.xyz = r1.yzw * r1.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r1.x = saturate(dot(r5.zxy, r7.zxy));
    ps = log2(r1.x);
    r2.xyz = r2.xyz * r6.www;
    r1.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.x = r1.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r1.x);
    r1.w = saturate(dot(r1.wzy, r5.zyx));
    r1.x = ps;
    ps = pow(2.0, r0.x);
    r1.xyz = r2.xyz * r1.xxx;
    r0.x = ps;
    r1.xy = r3.xy * r1.ww + r1.xy;
    r1.z = r3.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.xxx;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.ywz;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
