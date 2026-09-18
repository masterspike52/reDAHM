// ps_871c41b9ee76662f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 444 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006F0 10041700 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c18); // float4
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c20); // float2
float4 SpotDirection : register(c19); // float3
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.z = r1.x * UniformVector_2.x;
    ps = -r1.y;
    r12.xy = r1.xy + r1.xy;
    ps = 1.0 + ps;
    r1.w = saturate(r5.w * 0.0001);
    r19.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = r1.xy * UniformVector_1.xy;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = r2.z + 0.1;
    r8.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r0.z = r5.w - 4e+02;
    r0.w = ps;
    ps = UniformVector_2.x * r0.w;
    r2.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r2.w));
    r1.z = saturate(r1.z * 5.0);
    r2.w = ps;
    ps = 0.00022222222 * r0.z;
    r9.xyz = r2.www * r4.xyz;
    r12.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r1.zw = -r1.zw + 1.0;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r1.z;
    r7.xyw = r12.xzy * float3(6.0, -0.1, 6.0);
    r4.x = ps;
    r8.xy = r9.xy * r7.yy + r8.xy;
    ps = ModShadowGroupColor.y * r1.z;
    r4.z = r8.y * r0.z;
    r4.y = ps;
    ps = r0.w;
    r19.xzw = -r4.zxy + 1.0;
    ps = r8.x * ps;
    r10.yw = r19.xy * UniformVector_2.yy;
    r10.x = ps;
    ps = r8.z;
    r4 = r10 - 0.5;
    ps = abs(r6.x) * ps;
    r11 = float4((r10.xywz >= 0.5));
    r0.z = ps;
    ps = r8.w;
    r4 = r4.xywz - r10.xywz;
    r4 = r4.xywz * r11.xywz + r10;
    ps = abs(r6.y) * ps;
    r4 = r4 + r4;
    r0.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r10 = tex2D(Texture2D_3, r4.zw);
    r6.xyz = tex2D(Texture2D_4, r12.xy).wxy;
    r12.xyz = tex2D(Texture2D_4, r7.xw).xyw;
    r20.w = UniformScalar_1.x * UniformVector_4.x;
    ps = UniformVector_1.x + UniformVector_1.x;
    r13.xy = r1.xy * UniformVector_8.xy;
    r7.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r0.zw = r1.xy - r0.xy;
    r7.w = ps;
    ps = 1.0 / r5.w;
    r8.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.z = ps;
    r5.zw = r8.zw * r1.zz + ScreenPositionScaleBias.wz;
    ps = r12.x + r12.x;
    r5.xy = r7.xw * r1.xy;
    r14.x = ps;
    ps = r12.y + r12.y;
    r14.zw = r6.yz + r6.yz;
    r14.y = ps;
    r0.zw = r0.zw * UniformScalar_4.xx + r0.xy;
    r14 = r14 - 1.0;
    r6.yz = r14.xy * 0.5 + r14.zw;
    ps = r12.z;
    r22.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    ps = r6.x * ps;
    r22.y = dot(r11.wzz, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r1.y = (r22.y == 0.0) ? r10.x : r10.y;
    ps = (-1.0) - -r1.x;
    r21 = r22.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = ps;
    r1.y = (r21.z == 0.0) ? r10.z : r1.y;
    r12.w = (r21.w == 0.0) ? r10.w : r1.y;
    ps = UniformVector_6.x * r0.z;
    r1.z = max(r12.w, 0.0);
    r1.y = ps;
    ps = UniformVector_6.y * r0.w;
    r7.x = min(r1.z, 0.3);
    r0.z = ps;
    ps = 1.0 / UniformScalar_2.x;
    r20.xyz = r7.xyz * float3(3.3333333, 0.875, 0.875);
    r6.w = ps;
    ps = UniformVector_7.y + r0.z;
    r10 = r20.xxxw * r6;
    r0.w = ps;
    r0.z = r10.w * UniformScalar_3.x + r1.y;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r14 = tex2D(Texture2D_2, r5.xy).zxyw;
    r12.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    r18 = tex2D(Texture2D_3, r4.xy);
    r4.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r8.yzw = tex2D(Texture2D_1, r5.xy).xyz;
    r11 = tex2D(Texture2D_7, r0.zw);
    r13.xyz = tex2D(Texture2D_9, r13.xy).xyz;
    r5 = tex2D(Texture2D_6, r0.xy).zxyw;
    r17.yzw = -ModShadowColor.xyz + 1.0;
    r23.xyz = UniformVector_5.xyz * 2e+01;
    r1.y = float((UniformScalar_17.x >= 1.0));
    r0.x = dot(r3.zxy, r3.zxy);
    ps = r5.x;
    r0.z = float((UniformScalar_17.x > 1.0));
    r0.y = ps;
    r16.xyz = (-abs(r0.zzz) >= 0.0) ? r13.xyz : 1.0;
    ps = UniformScalar_18.x * r0.y;
    r15.xyz = r11.xyz * r11.www;
    r8.x = ps;
    r0.yzw = r8.wyz * 2.0 - 1.0;
    r13.xyw = r6.wxy * 2.0 - 1.0;
    r4.xyz = r4.zxy * 2.0 - 1.0;
    ps = UniformScalar_18.x * r5.y;
    r11.xzw = r0.yzw - r13.xyw;
    r8.y = ps;
    ps = rsqrt(abs(r0.x));
    r15.xyz = r23.xyz * r15.xyz;
    r0.y = ps;
    ps = UniformScalar_18.x * r5.z;
    r0.yzw = r0.yyy * -SpotDirection.xyz;
    r8.z = ps;
    r16.xyz = (-abs(r1.yyy) >= 0.0) ? 1.0 : r16.xyz;
    r8.xyz = r8.xyz * r16.zxy + UniformScalar_19.xxx;
    ps = r5.w;
    r0.y = dot(r0.wyz, r3.zxy);
    r0.z = ps;
    ps = 1.0 - r0.z;
    r3 = r15.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r0.z = ps;
    r17.x = dot(r3.yx, r0.zz) + 0.0;
    r15.xyz = r3.yzw * r0.zzz;
    r3.x = dot(r15.zy, float2(0.11, 0.59)) + 0.0;
    r0.z = (r22.x == 0.0) ? r18.x : r18.y;
    r0.z = (r21.y == 0.0) ? r18.z : r0.z;
    r18.z = (r21.x == 0.0) ? r18.w : r0.z;
    r18.xy = r20.yz * r19.zw;
    r3.yzw = r18.xyz + float3(0.125, 0.125, 0.25);
    ps = r3.y * r3.z;
    r0.z = r3.w + r18.z;
    r0.w = ps;
    r6.xyz = r0.www * r17.yzw + ModShadowColor.xyz;
    r0.z = saturate(r0.z - r1.x);
    r17.yzw = r0.zzz * r12.xyz;
    r11.y = -r17.w + r14.x;
    ps = UniformVector_4.z * r4.x;
    r11 = r11.zwyx * r14.wwww;
    r1.x = ps;
    ps = UniformVector_4.y * r4.z;
    r14.x = r17.w + r11.z;
    r1.y = ps;
    ps = UniformVector_4.x * r4.y;
    r0.zw = -r17.yz + r14.yz;
    r1.z = ps;
    ps = 1.0 - r1.x;
    r3.yz = r0.zw * r14.ww;
    r12.x = ps;
    ps = -SpotAngles.x - -r0.y;
    r14.yzw = r17.yzx + r3.yzx;
    r0.z = ps;
    ps = SpotAngles.y * r0.z;
    r12.z = saturate(r14.w - r15.x);
    r12.y = saturate(ps);
    r3.xw = -r12.wz + 1.0;
    r13.z = r8.x * r3.w;
    ps = r12.x * r12.z;
    r11.xyz = r13.xyw + r11.wxy;
    r4.x = ps;
    ps = r12.y * r12.y;
    r4.yz = -r1.zy * r12.zz;
    r4.w = ps;
    ps = r10.x;
    r13.xyw = r1.zyx + r4.yzx;
    r0.z = ps;
    ps = 1.0 + r0.z;
    r13.w = r13.w - r11.x;
    r3.y = ps;
    ps = r11.w;
    r2.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 2.5 * r3.x;
    r12.xyw = -UniformVector_0.xyz + 1.0;
    r3.z = ps;
    ps = r3.y * r3.x;
    r1.xy = r13.xy + r10.yz;
    r0.y = ps;
    ps = r3.z * r3.y;
    r10.zw = r1.xy - r11.yz;
    r0.w = ps;
    ps = (-2.0) + r0.z;
    r0.y = float((r0.y > 0.9));
    r0.z = ps;
    ps = (-0.5) + r0.w;
    r15.xyz = r15.xyz * r0.yyy;
    r12.z = saturate(ps);
    r5.xyz = r16.xyz * r5.yzx + r15.xyz;
    ps = r5.x;
    r10.xy = r5.zy - r14.xz;
    ps = -r14.y + ps;
    r10 = r10 * r12.zzzz;
    r5.w = ps;
    ps = r14.z;
    r5.xy = r8.yz * r3.ww;
    ps = r10.y + ps;
    r5.z = r14.x + r10.x;
    r13.y = ps;
    ps = r11.y;
    r8 = r5.wxyz * r12.zzzw;
    ps = r10.z + ps;
    r13.x = r14.y + r8.x;
    r0.y = ps;
    ps = r11.z;
    r5 = r13.wxyz * r12.zxyz;
    ps = r10.w + ps;
    r0.w = r0.z + r5.x;
    r0.z = ps;
    r0.w = r6.w * 2.0 + r0.w;
    r3.xyz = r0.wyz * r1.www;
    ps = 1.0 + r3.x;
    r3.w = ps;
    r0.yzw = (r1.www > 0.0) ? r3.yzw : float3(0.0, 0.0, 1.0);
    r1.yzw = (r1.www >= 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r2.w));
    r1.x = dot(r1.wyz, r1.wyz);
    r0.y = ps;
    ps = rsqrt(abs(r1.x));
    r0.yzw = r0.yyy * r2.xyz;
    r1.x = ps;
    r1.xyw = r1.yzw * r1.xxx;
    r1.z = dot(r1.wxy, r9.zxy);
    ps = 1.0 - r0.x;
    r2.xyz = r1.xyw * r1.zzz;
    r1.z = saturate(ps);
    r2.xyz = r2.xyz * 2.0 - r9.xyz;
    ps = log2(r1.z);
    r0.x = saturate(dot(r0.wyz, r2.zxy));
    r1.z = ps;
    ps = log2(r0.x);
    r1.z = r1.z * LightColorAndFalloffExponent.w;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1.x = saturate(dot(r1.wyx, r0.wzy));
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r0.yzw = r8.yzw * r1.yyx;
    r0.x = ps;
    r0.yzw = r5.yzw * r1.xxy + r0.yzw;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r7.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xyz * r4.www;
    r0.xyz = r0.xyz * r6.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
