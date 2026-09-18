// ps_712c963711a6a182.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 435 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006CC 10041600 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r22.xyz = UniformVector_5.xyz * 2e+01;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.xzw = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r12.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r3.xz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0.zw = UniformVector_1.xy + UniformVector_1.xy;
    r10.x = UniformScalar_1.x * UniformVector_4.x;
    ps = r1.w;
    r15.z = saturate(r5.w * 0.0001);
    ps = UniformVector_2.x * ps;
    r3.y = -r1.z + 1.0;
    r13.x = ps;
    ps = r2.z;
    r11.yz = r1.wz + r1.wz;
    ps = 0.1 + ps;
    r7.xy = r1.wz - r1.xy;
    r6.x = ps;
    ps = r5.w;
    r8.zw = r5.xy * ScreenPositionScaleBias.xy;
    ps = (-4e+02) + ps;
    r7.zw = r1.wz * UniformVector_1.xy;
    r6.y = ps;
    ps = 0.00022222222 * r6.y;
    r6.z = dot(r4.zxy, r4.zxy);
    r11.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r10.yz = r3.xz * 0.875;
    r6.w = ps;
    r6.yz = r7.xy * UniformScalar_4.xx + r1.xy;
    ps = 1.0 / r5.w;
    r9.xyz = r6.www * r4.xyz;
    r7.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r4.xyz = r11.xyz * float3(-0.1, 6.0, 6.0);
    r7.x = ps;
    r8.xy = r9.xy * r4.xx + r7.zw;
    ps = 5.0 * r6.x;
    r7.xyw = r8.zwy * r7.yyx;
    r7.z = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r3.xz = -r7.wz + 1.0;
    r3.w = ps;
    ps = ModShadowGroupColor.x * r3.z;
    r14.xy = r1.wz * UniformVector_8.xy;
    r15.x = ps;
    ps = ModShadowGroupColor.y * r3.z;
    r13.yzw = r3.yxw * UniformVector_2.yyx;
    r15.y = ps;
    ps = r13.w;
    r12.yzw = r12.zxy + r12.zxy;
    ps = r8.x * ps;
    r5.xyw = -r15.xyz + 1.0;
    r12.x = ps;
    ps = UniformVector_6.x * r6.y;
    r21.w = float((r12.x >= 0.5));
    r6.y = ps;
    r21.yz = r10.yz * r5.xy + 0.125;
    ps = UniformVector_6.y * r6.z;
    r10.yzw = r13.zxy - 0.5;
    r6.x = ps;
    ps = UniformVector_7.y + r6.x;
    r19.yzw = float3((r13.xzy >= 0.5));
    r6.z = ps;
    ps = 1.0 / UniformScalar_2.x;
    r3 = r12.xzyw + float4(-0.5, -1.0, -1.0, -1.0);
    r19.x = ps;
    ps = r3.x;
    r10.yzw = r10.ywz - r13.zyx;
    ps = -r12.x + ps;
    r10 = r10.xwyz * r19;
    r21.x = ps;
    r6.x = r10.x * UniformScalar_3.x + r6.y;
    ps = r21.x * r21.w;
    r6.yw = r0.zw * r1.wz;
    r0.z = ps;
    ps = r21.y * r21.z;
    r10.yzw = r13.zxy + r10.zyw;
    r2.w = ps;
    ps = ScreenPositionScaleBias.w + r7.x;
    r10.x = r12.x + r0.z;
    r0.z = ps;
    ps = ScreenPositionScaleBias.z + r7.y;
    r10 = r10.zwxy + r10.zwxy;
    r0.w = ps;
    r5.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r17.y = tex2D(ShadowTexture, r0.xy).x;
    r12 = tex2D(Texture2D_2, r6.yw).zxyw;
    r0.yzw = tex2D(Texture2D_8, r8.xy).xyz;
    r13 = tex2D(Texture2D_3, r10.zw);
    r20 = tex2D(Texture2D_3, r10.xy);
    r10.xyz = tex2D(Texture2D_0, r8.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r6.yw).xyz;
    r15 = tex2D(Texture2D_7, r6.xz);
    r14.xyz = tex2D(Texture2D_9, r14.xy).xyz;
    r7 = tex2D(Texture2D_6, r1.xy).zxyw;
    r4.xyw = tex2D(Texture2D_4, r4.yz).xyw;
    r1.xyz = tex2D(Texture2D_4, r11.yz).xwy;
    r6.zw = r1.xz * 2.0 - 1.0;
    r11.yz = r4.xy * 2.0 - 1.0;
    ps = r7.w;
    r0.x = float((UniformScalar_17.x >= 1.0));
    r6.x = ps;
    ps = r7.x;
    r1.w = float((UniformScalar_17.x > 1.0));
    r6.y = ps;
    r14.xyz = (-abs(r1.www) >= 0.0) ? r14.xyz : 1.0;
    ps = UniformScalar_18.x * r6.y;
    r15.xyz = r15.xyz * r15.www;
    r18.x = ps;
    r16.xyz = r8.zxy * 2.0 - 1.0;
    r8.xyz = r10.zxy * 2.0 - 1.0;
    ps = UniformScalar_18.x * r7.y;
    r16.xzw = r16.xyz - r8.xyz;
    r18.y = ps;
    ps = UniformScalar_18.x * r7.z;
    r15.xyz = r22.xyz * r15.xyz;
    r18.z = ps;
    r14.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r14.xyz;
    r4.xyz = r18.xyz * r14.zxy + UniformScalar_19.xxx;
    ps = 1.0 - r6.x;
    r15 = r15.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r6.x = ps;
    r18.x = dot(r15.yx, r6.xx) + 0.0;
    r15.xyz = r15.yzw * r6.xxx;
    r0.x = dot(r15.zy, float2(0.11, 0.59)) + 0.0;
    r11.x = r19.z * 2.0 + r21.w;
    ps = r4.w;
    r11.w = dot(r19.yww, float3(1.0, 1.0, 1.0));
    r1.x = (r11.w == 0.0) ? r20.x : r20.y;
    r6.y = (r11.x == 0.0) ? r13.x : r13.y;
    ps = r1.y * ps;
    r19 = r11.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = ps;
    r6.y = (r19.y == 0.0) ? r13.z : r6.y;
    r1.w = (r19.z == 0.0) ? r20.z : r1.x;
    r1.xyz = r2.www * r17.xzw + ModShadowColor.xyz;
    r17.w = (r19.w == 0.0) ? r20.w : r1.w;
    r6.y = (r19.x == 0.0) ? r13.w : r6.y;
    ps = (-1.0) + r6.x;
    r1.w = max(r17.w, 0.0);
    r13.x = ps;
    ps = 0.25 + r6.y;
    r11.x = min(r1.w, 0.3);
    r13.w = ps;
    r1.w = r13.w + r6.y;
    ps = r1.w;
    r11.xzw = r11.xyz * float3(3.3333333, 0.5, 0.5);
    ps = -r6.x + ps;
    r13.yz = r6.zw + r11.zw;
    r6.x = saturate(ps);
    r18.yzw = r6.xxx * r0.yzw;
    r16.y = -r18.w + r12.x;
    r0.y = r11.x * r13.x + 1.0;
    r16 = r16.zwxy * r12.wwww;
    ps = r3.z;
    r12.x = r18.w + r16.w;
    r6.x = ps;
    ps = UniformVector_4.z * r6.x;
    r6.yz = -r18.yz + r12.yz;
    r6.x = ps;
    ps = UniformVector_4.y * r3.w;
    r0.zw = r6.yz * r12.ww;
    r6.y = ps;
    ps = UniformVector_4.x * r3.y;
    r12.yzw = r18.yzx + r0.zwx;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r17.z = saturate(r12.w - r15.x);
    r17.x = ps;
    r0.xw = -r17.wz + 1.0;
    r11.z = r4.x * r0.w;
    ps = r17.x * r17.z;
    r10.xyw = r8.xyz + r16.zxy;
    r8.x = ps;
    ps = r17.y * r17.y;
    r8.yz = -r6.zy * r17.zz;
    r8.w = ps;
    r6.xyz = r6.xzy + r8.xyz;
    ps = r16.z;
    r11.w = r6.x - r10.x;
    r6.x = ps;
    ps = 2.5 * r0.x;
    r1.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r6.yw = r11.xx * r13.yz + r6.yz;
    ps = r0.y * r0.x;
    r3.xyw = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = r0.z * r0.y;
    r13.zw = r6.yw - r10.yw;
    r6.y = ps;
    ps = (-2.0) + r6.x;
    r6.z = float((r6.z > 0.9));
    r2.w = ps;
    ps = (-0.5) + r6.y;
    r6.xzw = r15.xyz * r6.zzz;
    r3.z = saturate(ps);
    r6.xyz = r14.xyz * r7.yzx + r6.xzw;
    ps = r6.x;
    r13.xy = r6.zy - r12.xz;
    ps = -r12.y + ps;
    r6 = r13.xwyz * r3.zzzz;
    r7.w = ps;
    ps = r12.z;
    r7.xy = r4.yz * r0.ww;
    ps = r6.z + ps;
    r7.z = r12.x + r6.x;
    r11.y = ps;
    ps = r10.y;
    r4 = r7.wxyz * r3.zzzw;
    ps = r6.w + ps;
    r11.x = r12.y + r4.x;
    r6.x = ps;
    ps = r10.w;
    r3 = r11.wxyz * r3.zxyz;
    ps = r6.y + ps;
    r6.z = r2.w + r3.x;
    r6.y = ps;
    r6.z = r10.z * 2.0 + r6.z;
    r6.xyz = r6.zxy * r5.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r5.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r5.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r7.xxx * r2.xyz;
    r6.x = ps;
    r2.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r2.zxy, r9.zxy);
    r6.xyz = r2.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r0.zxy, r6.zxy));
    ps = log2(r6.x);
    r7.xyz = r8.www * r5.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r0.x = saturate(dot(r2.zyx, r0.zyx));
    r0.y = ps;
    r6.xyz = r4.yzw * r0.yyx;
    r6.xyz = r3.yzw * r0.xxy + r6.xyz;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xyz;
    r6.xyz = r6.xyz * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
