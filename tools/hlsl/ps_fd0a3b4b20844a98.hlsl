// ps_fd0a3b4b20844a98.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041800 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c22); // float2
float4 SpotDirection : register(c21); // float3
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_9, r0.xy);
    ps = (-0.5) + r15.w;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r7.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r8.yw = saturate(UniformVector_12.xy);
    r9.y = UniformScalar_4.x * UniformScalar_5.x;
    ps = r1.x;
    r11.xy = UniformVector_1.xy + UniformVector_1.xy;
    ps = UniformVector_2.x * ps;
    r18.y = -r1.y + 1.0;
    r8.z = ps;
    ps = r2.z;
    r1.z = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r0.w = r5.w - 2e+02;
    r0.z = ps;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.z));
    r0.zw = saturate(r0.wz * float2(0.00022222222, 5.0));
    r2.w = ps;
    ps = UniformVector_4.x * r7.y;
    r1.zw = r1.xy * UniformVector_1.xy;
    r16.y = ps;
    ps = UniformVector_4.y * r7.z;
    r10.xyz = r2.www * r4.xyz;
    r16.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r2.w = r0.z * (-0.1);
    r0.z = ps;
    r1.zw = r10.xy * r2.ww + r1.zw;
    ps = UniformVector_4.z * r7.x;
    r16.x = r1.w * r0.z;
    r16.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r18.xw = -r16.xw + 1.0;
    r18.z = ps;
    ps = UniformScalar_3.x;
    r4.xzw = r18.zxy * UniformVector_2.xyy;
    ps = UniformVector_4.x * ps;
    r7.xy = r4.zw - 0.5;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.zw = float2((r4.zw >= 0.5));
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.xy = r7.xy - r4.zw;
    r9.w = ps;
    ps = UniformScalar_5.x * r0.z;
    r7.zw = r1.xy * UniformVector_14.xy;
    r9.x = ps;
    ps = r4.x;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r1.z * ps;
    r7.xy = r11.xy * r1.xy;
    r8.x = ps;
    ps = r13.z + r13.z;
    r11.xy = r9.zw * abs(r6.xy);
    r9.z = ps;
    ps = r13.w + r13.w;
    r11.zw = r8.xz - 0.5;
    r9.w = ps;
    ps = floor(r9.x);
    r6.xy = float2((r8.xz >= 0.5));
    r6.z = ps;
    ps = floor(r9.y);
    r11.zw = r11.zw - r8.xz;
    r6.w = ps;
    r8.xz = r11.zw * r6.xy + r8.xz;
    r6.zw = r6.zw * UniformVector_11.xy - r9.xy;
    r6.zw = r6.zw * r8.yw;
    r9 = r9 + r6.zwxy;
    r0.xy = r0.xy * UniformVector_13.xy + r9.xy;
    r0.xy = r0.xy * UniformVector_8.xy;
    ps = 1.0 / UniformVector_10.x;
    r14.zw = frac(r0.xy);
    r13.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r0.xy = float2((UniformVector_10.xy >= r14.zw));
    r13.y = ps;
    ps = r0.x * r0.y;
    r4.xy = float2((UniformVector_10.yx > r14.wz));
    r0.x = ps;
    ps = r0.x;
    r6 = r14 * r13.zwxy;
    ps = r4.x * ps;
    r8.yw = r4.zw + r6.xy;
    r12.x = ps;
    ps = 1.0 / r5.w;
    r8 = r8 + r8;
    r4.z = ps;
    ps = r1.x + r1.x;
    r4.xyw = r12.yzx * r4.zzy;
    r0.x = ps;
    ps = r1.y + r1.y;
    r11.zw = r4.xy + ScreenPositionScaleBias.wz;
    r0.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r11.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r14 = tex2D(Texture2D_2, r7.xy);
    r21.xyz = tex2D(Texture2D_7, r1.zw).xyz;
    r23 = tex2D(Texture2D_3, r8.zw);
    r24 = tex2D(Texture2D_3, r8.xy);
    r11.xyz = tex2D(Texture2D_8, r7.zw).xyz;
    r17.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r1.zw).xyz;
    r8 = tex2D(Texture2D_6, r6.zw);
    r1.xyw = tex2D(Texture2D_4, r0.xy).wxy;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r2.w = dot(r2.zxy, r2.zxy);
    r6.w = float((UniformScalar_12.x >= 1.0));
    ps = r5.w;
    r7.z = float((UniformScalar_12.x > 1.0));
    ps = 0.0001 * ps;
    r0.x = dot(r3.zxy, r3.zxy);
    r1.z = saturate(ps);
    ps = (-1.0) + r1.x;
    r12.xyz = r8.xyz * r8.www;
    r20.x = ps;
    r20.yz = r1.yw * 2.0 - 1.0;
    r8.xyz = r7.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r22.yzw = r17.xyz + r17.xyz;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r5.xyz = r15.xyz * UniformScalar_13.xxx;
    r0.x = saturate(ps);
    r1.xyw = (-abs(r7.zzz) >= 0.0) ? r11.xyz : 1.0;
    r17.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r1.xyw;
    ps = log2(r0.x);
    r1.xyw = r0.yyy * -SpotDirection.xyz;
    r0.x = ps;
    r11.xyz = r5.xyz * r17.xyz + UniformScalar_14.xxx;
    ps = 1.0 - r0.w;
    r0.y = dot(r1.wxy, r3.zxy);
    r0.z = ps;
    r1.x = (r9.z == 0.0) ? r24.x : r24.y;
    r0.w = (r9.w == 0.0) ? r23.x : r23.y;
    ps = ModShadowGroupColor.x * r0.z;
    r3 = r9.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r1.w = ps;
    r0.w = (r3.z == 0.0) ? r23.z : r0.w;
    r1.x = (r3.y == 0.0) ? r24.z : r1.x;
    r22.x = (r3.x == 0.0) ? r24.w : r1.x;
    r1.x = (r3.w == 0.0) ? r23.w : r0.w;
    ps = 1.0 - r1.x;
    r0.w = max(r1.x, 0.0);
    r3.x = ps;
    ps = 1.0 - r1.z;
    r0.w = min(r0.w, 0.3);
    r3.w = ps;
    ps = rsqrt(abs(r2.w));
    r5 = r22 + float4(-0.75, -1.0, -1.0, -1.0);
    r1.x = ps;
    ps = r5.x;
    r7.xyz = r1.xxx * r2.xyz;
    ps = r22.x + ps;
    r5.xzw = r5.wyz - r8.zxy;
    r1.x = saturate(ps);
    ps = 3.3333333 * r0.w;
    r1.xyz = r1.xxx * r21.xzy;
    r0.w = ps;
    ps = 2.5 * r3.x;
    r2.xyz = r0.www * r20.xyz;
    r3.z = ps;
    ps = 1.0 + r2.x;
    r9.zw = -r1.xz + r14.xy;
    r3.y = ps;
    r14.xy = r9.zw * r14.ww + r1.xz;
    ps = -r1.y;
    r12.xyz = r12.xyz * r4.www;
    ps = r14.z + ps;
    r12.xyz = r19.yzx * r12.yzx;
    r5.y = ps;
    ps = r3.y * r3.x;
    r5 = r5.zwyx * r14.wwww;
    r1.x = ps;
    ps = r3.z * r3.y;
    r8.xyz = r8.xyz + r5.xyw;
    r0.w = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1.x = float((r1.x > 0.9));
    r1.z = ps;
    ps = r1.y;
    r0.z = dot(r12.yzx, float3(0.11, 0.3, 0.59));
    ps = r5.z + ps;
    r0.z = r0.z - r12.z;
    r14.z = ps;
    r12.xyw = r12.zxy * r1.xxx - r14.xyz;
    ps = (-0.5) + r0.w;
    r1.x = saturate(r0.z + r12.z);
    r1.y = saturate(ps);
    r12.z = r18.w * r1.x + r16.w;
    r15.xyz = r17.xyz * r15.xyz + r12.xyw;
    r0.zw = -r16.yz * r1.xx + r16.yz;
    r12.xy = r2.yz * 2.0 + r0.zw;
    r2.xyz = r15.xyz * r1.yyy + r14.xyz;
    ps = r5.w;
    r5.xyz = r2.xyz * r13.xyz;
    r0.z = ps;
    ps = (-2.0) + r0.z;
    r2.xyz = -r8.xyz + r12.xyz;
    r8.w = ps;
    r2.xyz = r2.xyz * r1.yyy + r8.xyw;
    r2.w = r7.w * 2.0 + r2.z;
    ps = 1.0 - r1.x;
    r2.xyw = r2.xyw * r3.www;
    r8.x = ps;
    ps = 1.0 - r1.w;
    r2.z = r2.w + 1.0;
    r8.y = ps;
    r2.xyz = (r3.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r3.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r1.z;
    r0.z = dot(r2.zxy, r2.zxy);
    r8.z = ps;
    ps = rsqrt(abs(r0.z));
    r1.xzw = r11.xyz * r8.xxx;
    r0.z = ps;
    r3.xyz = r2.xyz * r0.zzz;
    r0.z = dot(r3.zxy, r10.zxy);
    r2.xyz = r3.xyz * r0.zzz;
    r2.xyz = r2.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.w = saturate(dot(r7.zxy, r2.zxy));
    r0.z = ps;
    ps = log2(r0.w);
    r1.xyz = r1.xzw * r1.yyy;
    r9.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r2.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    r0.x = ps;
    r2.xy = r2.xy * r8.yz + 0.125;
    ps = pow(2.0, r2.z);
    r0.y = saturate(dot(r3.zyx, r7.zyx));
    r0.w = ps;
    ps = SpotAngles.y * r0.x;
    r1.xyz = r1.zxy * r0.www;
    r2.z = saturate(ps);
    r1.yz = r5.xy * r0.yy + r1.yz;
    r1.w = r5.z * r0.y + r1.x;
    ps = pow(2.0, r0.z);
    r0.xw = r2.xz * r2.yz;
    r1.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.xyz = r1.yzw * r1.xxx;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
