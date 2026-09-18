// ps_6ec69675ee52307f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041200 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.z = -r1.y + 1.0;
    r10.z = ps;
    r9.xy = r1.xy * 6.0;
    r9.zw = r0.xy * UniformScalar_0.xx;
    r11.xy = r1.xy * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = r2.z + 0.1;
    r10.w = ps;
    ps = r5.w;
    r7.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r2.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r10.xy = r7.zw * r1.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r2.w));
    r1.w = r13.w - 0.5;
    r2.w = ps;
    ps = 0.00022222222 * r0.w;
    r8.xyz = r2.www * r4.xyz;
    r4.x = saturate(ps);
    ps = 5.0 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r4.y = saturate(ps);
    ps = (-0.025) * r4.x;
    r12.x = r1.x * UniformVector_2.x;
    r0.z = ps;
    ps = UniformVector_2.y * r1.z;
    r12.zw = r8.xy * r0.zz;
    r12.y = ps;
    r0.zw = r12.xy - 0.5;
    r14.xw = float2((r12.xy >= 0.5));
    ps = r10.z;
    r0.zw = r0.zw - r12.xy;
    ps = abs(r6.x) * ps;
    r7.zw = r0.zw * r14.xw;
    r1.z = ps;
    ps = r10.w;
    r7 = r12.zwxy + r7;
    ps = abs(r6.y) * ps;
    r0.zw = r7.zw + r7.zw;
    r1.w = ps;
    r6.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r12.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r15 = tex2D(Texture2D_1, r0.zw);
    r7.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r18.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r9.zw).wxy;
    r16.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r17.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r1.z = dot(r2.zxy, r2.zxy);
    r0.w = dot(r3.zxy, r3.zxy);
    r1.xyw = UniformVector_5.xyz * UniformVector_5.www;
    r2.w = r16.z * r17.z - 1.0;
    ps = r16.x + r16.x;
    r13.xyz = r1.xyw * r13.xyz;
    r16.x = ps;
    ps = r16.y + r16.y;
    r16.zw = r0.yz + r0.yz;
    r16.y = ps;
    r18.xyz = r18.xyz * 2.0 - 1.0;
    r1.xyw = r7.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.z));
    r0.y = saturate(-r0.w + 1.0);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r0.zzz * r2.xyz;
    r0.z = ps;
    r12.w = r18.z * UniformVector_4.z - r1.x;
    ps = log2(r0.y);
    r2.xyz = r0.zzz * -SpotDirection.xyz;
    r0.y = ps;
    ps = r5.w;
    r16 = r16 - 1.0;
    ps = 0.0001 * ps;
    r0.z = dot(r2.zxy, r3.zxy);
    r4.z = saturate(ps);
    r1.xz = -r4.zy + 1.0;
    ps = r17.x + r17.x;
    r0.w = r1.x * UniformScalar_1.x;
    r2.y = ps;
    r2.xz = r0.ww * r16.zw + r18.xy;
    r4.xy = r2.xz * UniformVector_4.xy - r1.yw;
    ps = r17.y + r17.y;
    r2.x = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r0.w = (r2.x == 0.0) ? r15.x : r15.y;
    r3 = r2.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r4.zw = r16.xy * 0.5 + r3.zw;
    r0.w = (r3.y == 0.0) ? r15.z : r0.w;
    r2.z = (r3.x == 0.0) ? r15.w : r0.w;
    ps = ModShadowGroupColor.x * r1.z;
    r0.w = max(r2.z, 0.0);
    r2.x = ps;
    ps = ModShadowGroupColor.y * r1.z;
    r14.x = min(r0.w, 0.3);
    r2.y = ps;
    ps = (-1.0) + r0.x;
    r2.xyz = -r2.zyx + 1.0;
    r0.x = ps;
    ps = r0.x;
    r3.xyz = r14.xyz * float3(3.3333333, 0.875, 0.875);
    r5.yz = r3.xx * r4.zw + r4.xy;
    ps = r1.x * ps;
    r3.yzw = r3.xzy * r2.wyz;
    r3.x = ps;
    ps = 2.5 * r2.x;
    r3 = r3.xywz + float4(1.0, 1.0, 0.125, 0.125);
    r4.w = ps;
    ps = abs(r3.y) * abs(r3.y);
    r2.xyz = r13.xyz * r12.xyz;
    r5.x = ps;
    ps = r3.z * r3.w;
    r4.xyz = r2.xyz * r3.xxx;
    r0.x = ps;
    r2.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    r9.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r5.w = saturate(r4.w * r3.y - 0.5);
    r12.xyz = r4.xyz * r3.yyy - r10.xyz;
    r0.w = r12.w * r5.w - 2.0;
    r3.xyz = r12.xyz * r5.www + r10.xyz;
    r10.yzw = r5.xyz * r5.xww;
    ps = -SpotAngles.x - -r0.z;
    r4.xy = r1.yw + r10.zw;
    r0.x = ps;
    ps = SpotAngles.y * r0.x;
    r3.xyz = r3.xyz * r11.xyz;
    r10.x = saturate(ps);
    r4.z = r7.w * 2.0 + r0.w;
    r4.xyw = r4.xyz * r1.xxx;
    ps = r10.x * r10.x;
    r4.z = r4.w + 1.0;
    r0.x = ps;
    r4.xyz = (r1.xxx > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r1.xxx >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r10.y * r10.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r1.xyz = r0.www * r9.xyz;
    r0.z = ps;
    r4.xyz = r4.xyz * r0.zzz;
    r0.z = dot(r4.zxy, r8.zxy);
    r9.xyz = r4.xyz * r0.zzz;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r0.z = saturate(dot(r7.zxy, r8.zxy));
    ps = log2(r0.z);
    r1.xyz = r1.xyz * r5.www;
    r0.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.w = r0.z * 15.0;
    r0.y = ps;
    ps = pow(2.0, r0.w);
    r0.z = saturate(dot(r4.zyx, r7.zyx));
    r0.w = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.www;
    r0.y = ps;
    r1.xy = r3.xy * r0.zz + r1.xy;
    r1.z = r3.z * r0.z + r1.z;
    r0.yzw = r1.xyz * r0.yyy;
    r0.yzw = r0.yzw * r6.xyz;
    r0.yzw = r0.yzw * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.ywz * r0.xxx;
    r0.xyz = r0.xzy * r2.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
