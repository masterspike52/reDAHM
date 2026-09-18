// ps_bcfda0f5fadc8e2a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041300 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = UniformScalar_1.x * UniformVector_4.x;
    r0.w = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r6.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r3.z = r1.x * UniformVector_2.x;
    ps = -r1.y;
    r1.z = r5.w - 4e+02;
    ps = 1.0 + ps;
    r3.xy = r1.xy * UniformVector_1.xy;
    r1.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r6.x = saturate(r1.z * 0.00022222222);
    r0.w = ps;
    ps = UniformVector_2.x * r0.z;
    r8.xyz = r0.www * r4.xyz;
    r0.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r15.xyz = r6.xyz * float3(-0.1, 0.875, 0.875);
    r0.z = ps;
    r6.xy = r8.xy * r15.xx + r3.xy;
    ps = r0.w;
    r6.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.z = -r6.y * r0.z + 1.0;
    ps = r6.x * ps;
    r3.yw = r1.zw * UniformVector_2.yy;
    r3.x = ps;
    r4 = r3 - 0.5;
    r9 = float4((r3.xywz >= 0.5));
    r4 = r4.xywz - r3.xywz;
    r3 = r4.xywz * r9.xywz + r3;
    r3 = r3 + r3;
    r4 = tex2D(Texture2D_3, r3.zw);
    r18.x = dot(r9.xyy, float3(1.0, 1.0, 1.0));
    r18.y = dot(r9.wzz, float3(1.0, 1.0, 1.0));
    r0.z = (r18.y == 0.0) ? r4.x : r4.y;
    r17 = r18.yxxy + float4(-2.0, -3.0, -2.0, -3.0);
    r0.z = (r17.x == 0.0) ? r4.z : r0.z;
    r0.z = (r17.w == 0.0) ? r4.w : r0.z;
    ps = r1.x + r1.x;
    r0.w = max(r0.z, 0.0);
    r4.y = ps;
    ps = r1.y + r1.y;
    r4.x = min(r0.w, 0.3);
    r4.z = ps;
    r7.xyz = r4.xyz * float3(3.3333333, 6.0, 6.0);
    r10.xyz = tex2D(Texture2D_4, r7.yz).xyw;
    r9.xyz = tex2D(Texture2D_4, r4.yz).xwy;
    ps = UniformVector_1.x + UniformVector_1.x;
    r11.zw = r1.xy * UniformVector_8.xy;
    r4.x = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r9.zw = r9.xz + r9.xz;
    r4.y = ps;
    ps = r10.x + r10.x;
    r1.zw = r1.xy - r0.xy;
    r9.x = ps;
    r1.zw = r1.zw * UniformScalar_4.xx + r0.xy;
    ps = r10.y + r10.y;
    r0.w = r10.z * r9.y;
    r9.y = ps;
    ps = (-1.0) - -r0.w;
    r11.xy = r4.xy * r1.xy;
    r4.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r1.xy = r1.wz * UniformVector_6.yx;
    r4.w = ps;
    ps = 1.0 / r5.w;
    r9 = r9 - 1.0;
    r1.z = ps;
    r4.yz = r9.xy * 0.5 + r9.zw;
    r1.zw = r6.zw * r1.zz + ScreenPositionScaleBias.wz;
    ps = UniformVector_7.y + r1.x;
    r10 = r7.xxxw * r4;
    r4.y = ps;
    r4.x = r10.w * UniformScalar_3.x + r1.y;
    r7.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r9 = tex2D(Texture2D_2, r11.xy);
    r16.xyz = tex2D(Texture2D_8, r6.xy).xyz;
    r1.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r3 = tex2D(Texture2D_3, r3.xy);
    r4 = tex2D(Texture2D_7, r4.xy);
    r14.xyz = tex2D(Texture2D_9, r11.zw).xyz;
    r12 = tex2D(Texture2D_6, r0.xy).wxyz;
    r6.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r11.xy).xyz;
    ps = r5.w;
    r1.w = float((UniformScalar_17.x >= 1.0));
    ps = 0.0001 * ps;
    r0.x = float((UniformScalar_17.x > 1.0));
    r17.x = saturate(ps);
    r11.xyz = r11.zxy * 2.0 - 1.0;
    r13.xyz = r6.wxy * 2.0 - 1.0;
    ps = r2.z;
    r5.xyz = r12.wyz * UniformScalar_18.xxx;
    r14.xyz = (-abs(r0.xxx) >= 0.0) ? r14.xyz : 1.0;
    ps = 0.1 + ps;
    r4.xyz = r4.xyz * r4.www;
    r0.y = ps;
    ps = r12.x;
    r4.xyz = r19.xyz * r4.xyz;
    r0.x = ps;
    r14.yzw = (-abs(r1.www) >= 0.0) ? 1.0 : r14.xyz;
    r5.xyz = r5.xyz * r14.wyz + UniformScalar_19.xxx;
    ps = 1.0 - r0.x;
    r4 = r4.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r0.x = ps;
    r14.x = dot(r4.yx, r0.xx) + 0.0;
    ps = 5.0 * r0.y;
    r4.xyz = r4.zwy * r0.xxx;
    r0.x = saturate(ps);
    r12.x = dot(r4.yx, float2(0.11, 0.59)) + 0.0;
    r0.y = (r18.x == 0.0) ? r3.x : r3.y;
    r0.y = (r17.z == 0.0) ? r3.z : r0.y;
    r18.w = (r17.y == 0.0) ? r3.w : r0.y;
    ps = 1.0 - r0.x;
    r18.xyz = r1.zxy + r1.zxy;
    r1.z = ps;
    ps = 1.0 - r0.z;
    r3 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r1.x = ps;
    ps = ModShadowGroupColor.x * r1.z;
    r0.x = r3.w + r18.w;
    r17.y = ps;
    ps = ModShadowGroupColor.y * r1.z;
    r0.x = saturate(r0.x - r0.w);
    r17.z = ps;
    ps = 2.5 * r1.x;
    r6.xyz = -r17.xyz + 1.0;
    r1.w = ps;
    ps = r3.x;
    r0.xzw = r0.xxx * r16.xyz;
    r0.y = ps;
    r3.xw = r15.yz * r6.yz + 0.125;
    ps = -r0.w;
    r15.xzw = r11.xyz - r13.xyz;
    ps = r9.z + ps;
    r11.xy = -r0.xz + r9.xy;
    r15.y = ps;
    r11.yz = r11.xy * r9.ww + r0.xz;
    ps = r10.x;
    r14.yzw = r14.yzw * r12.yzw;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r9 = r15.zwxy * r9.wwww;
    r1.y = ps;
    ps = UniformVector_4.z * r0.y;
    r0.xz = r1.yw * r1.xy;
    r1.x = ps;
    ps = UniformVector_4.y * r3.z;
    r0.y = float((r0.x > 0.9));
    r1.y = ps;
    ps = UniformVector_4.x * r3.y;
    r12.yzw = r4.zxy * r0.yyy;
    r1.z = ps;
    ps = 1.0 - r1.x;
    r12 = r14 + r12;
    r3.y = ps;
    ps = r9.z;
    r5.w = r12.y - r11.y;
    r0.x = ps;
    ps = (-2.0) + r0.x;
    r1.w = dot(r2.zxy, r2.zxy);
    r2.w = ps;
    ps = r0.w;
    r4.xyw = -UniformVector_0.xyz + 1.0;
    ps = r9.w + ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r11.x = ps;
    ps = r12.x;
    r9.xyz = r13.xyz + r9.zxy;
    ps = -r4.z + ps;
    r12.xy = r12.wz - r11.xz;
    r3.z = saturate(ps);
    ps = (-0.5) + r0.z;
    r13.yz = -r1.zy * r3.zz;
    r4.z = saturate(ps);
    ps = 1.0 - r3.z;
    r13.xw = r3.yx * r3.zw;
    r3.w = ps;
    r3.xyz = r13.www * r14.xyz + ModShadowColor.xyz;
    ps = r5.x;
    r0.xyz = r1.xzy + r13.xyz;
    ps = r3.w * ps;
    r1.xy = r0.yz + r10.yz;
    r10.z = ps;
    ps = r0.x;
    r12.zw = r1.xy - r9.yz;
    ps = -r9.x + ps;
    r0 = r12.xwyz * r4.zzzz;
    r10.w = ps;
    ps = r11.z;
    r5.xy = r5.yz * r3.ww;
    ps = r0.z + ps;
    r5.z = r11.x + r0.x;
    r10.y = ps;
    ps = r9.y;
    r5 = r5.wxyz * r4.zzzw;
    ps = r0.w + ps;
    r10.x = r11.y + r5.x;
    r0.x = ps;
    ps = r9.z;
    r4 = r10.wxyz * r4.zxyz;
    ps = r0.y + ps;
    r0.z = r2.w + r4.x;
    r0.y = ps;
    r0.z = r6.w * 2.0 + r0.z;
    r0.xyz = r0.zxy * r6.xxx;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r6.xxx > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.yzw = (r6.xxx >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r0.x = dot(r0.wyz, r0.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r1.xxx * r2.xyz;
    r0.x = ps;
    r6.xyz = r0.yzw * r0.xxx;
    r0.x = dot(r6.zxy, r8.zxy);
    r0.xyz = r6.xyz * r0.xxx;
    r0.xyz = r0.xyz * 2.0 - r8.xyz;
    r0.x = saturate(dot(r2.zxy, r0.zxy));
    ps = log2(r0.x);
    r1.xyz = r7.xyz * LightColor.xyz;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r2.x = saturate(dot(r6.zyx, r2.zyx));
    r2.y = ps;
    r0.xyz = r5.yzw * r2.yyx;
    r0.xyz = r4.yzw * r2.xxy + r0.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xyz * r3.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
