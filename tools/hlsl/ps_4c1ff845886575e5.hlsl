// ps_4c1ff845886575e5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
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
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
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

    ps = 0.1 - -r1.z;
    r5.z = UniformScalar_22.x * 0.05;
    r5.x = ps;
    ps = r4.w;
    r8.yz = r0.wz - r0.xy;
    ps = (-4e+02) + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r9.zw = r8.yz * UniformScalar_6.xx;
    r5.w = ps;
    ps = 5.0 * r5.x;
    r14 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r18.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r12.xyz = r5.www * r3.xyz;
    r18.z = saturate(ps);
    ps = UniformVector_1.x * r0.w;
    r5.x = r5.z * r18.z;
    r8.x = ps;
    ps = -r0.z;
    r9.xy = r12.xy * r5.xx;
    ps = 1.0 + ps;
    r3 = r9.wxzy + r0.ywxz;
    r5.z = ps;
    ps = r3.y;
    r5.x = -r3.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r8.yz = r5.zx * UniformVector_1.yy;
    r8.w = ps;
    ps = r0.w + r0.w;
    r5 = r8.wzxy - 0.5;
    r10.x = ps;
    ps = r0.z + r0.z;
    r11 = float4((r8.wxzy >= 0.5));
    r10.y = ps;
    ps = r3.y + r3.y;
    r5 = r5 - r8.wzxy;
    r13.x = ps;
    r5 = r5 * r11.xzyw + r8.wzxy;
    ps = r3.w + r3.w;
    r15 = r5 + r5;
    r13.y = ps;
    r9.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r16.yzw = tex2D(Texture2D_4, r14.zw).xyw;
    r8.xyz = tex2D(Texture2D_1, r10.xy).xyz;
    r5 = tex2D(Texture2D_3, r15.zw).zwyx;
    r15 = tex2D(Texture2D_3, r15.xy);
    r14 = tex2D(Texture2D_4, r14.xy);
    ps = UniformScalar_18.x - r6.w;
    r8.w = UniformScalar_1.x * UniformVector_3.x;
    r0.w = ps;
    ps = r6.w;
    r0.z = float((UniformScalar_17.x >= 1.0));
    r17.zw = r14.xy * 2.0 - 1.0;
    r0.z = r0.w * r0.z + r6.w;
    ps = 15.0 * ps;
    r6.x = -r0.z + r6.z;
    r18.y = saturate(ps);
    ps = r6.x;
    r11.y = dot(r11.yww, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    ps = UniformScalar_19.x;
    r11.x = dot(r11.xzz, float3(1.0, 1.0, 1.0));
    r10.w = ps;
    r6.x = (r11.x == 0.0) ? r15.x : r15.y;
    r0.z = (r11.y == 0.0) ? r5.w : r5.z;
    ps = max(r10.z, r10.w);
    r11 = r11.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.w = ps;
    r5.x = (r11.y == 0.0) ? r5.x : r0.z;
    r6.x = (r11.w == 0.0) ? r15.z : r6.x;
    r17.x = (r11.x == 0.0) ? r15.w : r6.x;
    r5.z = (r11.z == 0.0) ? r5.y : r5.x;
    ps = r3.z;
    r5.x = max(r5.z, 0.0);
    r5.y = ps;
    ps = UniformVector_5.x * r5.y;
    r5.xw = min(r5.xw, float2(0.3, 1.0));
    r6.x = ps;
    ps = 1.0 / UniformScalar_20.x;
    r17.y = r5.x * 3.3333333;
    r5.x = ps;
    ps = r5.w;
    r11.yzw = r8.xyz + r8.xyz;
    ps = r5.x * ps;
    r8.xz = -r17.xy + 1.0;
    r18.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyw = -r18.wyx + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r16.x = r5.x * r6.w;
    r0.w = ps;
    r5.x = dot(r18.yy, r8.xx) + r17.x;
    ps = r5.x;
    r7.xy = r0.zw * abs(r7.xy);
    ps = r17.x + ps;
    r0.zw = r16.wx * r14.wz;
    r11.x = ps;
    ps = UniformVector_5.y * r3.x;
    r15 = r11.yzwx + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r8.y = saturate(r15.w - r0.z);
    r9.w = ps;
    ps = UniformVector_6.y + r5.x;
    r9 = r8.wyyy * r9.wxyz;
    r6.z = ps;
    r6.y = r9.x * UniformScalar_3.x + r6.x;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r14 = tex2D(Texture2D_2, r10.xy);
    r11 = tex2D(Texture2D_7, r6.yz);
    r3.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r10 = tex2D(Texture2D_6, r0.xy);
    r6.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    ps = r4.w;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r7.zw = r4.xy * ScreenPositionScaleBias.xy;
    r3.x = saturate(ps);
    r13.xyz = r6.xyw * 2.0 - 1.0;
    ps = r10.w;
    r19.xyz = UniformVector_4.xyz * 2e+01;
    r5.x = ps;
    r6.xyz = r3.wyz * 2.0 - 1.0;
    r0.xy = r16.yz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r16.xy = r0.xy * 0.5;
    r5.x = ps;
    ps = UniformVector_3.x * r6.y;
    r11.xyz = r11.xyz * r11.www;
    r3.y = ps;
    ps = UniformVector_3.y * r6.z;
    r11.xyz = r19.xyz * r11.xyz;
    r3.z = ps;
    ps = UniformVector_3.z * r6.x;
    r11 = r11.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r3.w = ps;
    r15.w = dot(r11.yx, r5.xx) + 0.0;
    ps = r3.w;
    r11.xyz = r11.zwy * r5.xxx;
    r5.x = ps;
    r9.x = dot(r11.yx, float2(0.11, 0.59)) + 0.0;
    ps = 1.0 - r5.x;
    r16.z = r18.y * r8.z;
    r7.x = ps;
    ps = (-1.0) - -r0.z;
    r5.x = float((r0.w >= 0.05));
    r16.w = ps;
    ps = 1.0 - r5.z;
    r16.xyz = r17.zyw + r16.xzy;
    r0.x = ps;
    ps = 1.0 - r5.x;
    r6.xyz = r16.wxy * r16.yyz;
    r0.w = ps;
    ps = 1.0 + r6.x;
    r16.xzw = r15.zxy - r13.zxy;
    r0.y = ps;
    r5.z = (UniformScalar_18.x > 0.0) ? r0.w : 1.0;
    r8.z = (UniformScalar_18.x >= 0.0) ? r5.z : r0.w;
    ps = 2.5 * r0.x;
    r15.xy = -r9.yz + r14.xy;
    r0.z = ps;
    r15.xy = r15.xy * r14.ww + r9.yz;
    ps = -r9.w;
    r0.xy = r0.yz * r0.xy;
    ps = r14.z + ps;
    r5.xy = r0.yx * r5.yy;
    r16.y = ps;
    ps = 1.0 - r3.x;
    r14 = r16.zwxy * r14.wwww;
    r7.y = ps;
    ps = r9.w;
    r13.xyz = r13.xyz + r14.xyz;
    ps = r14.w + ps;
    r5.z = float((r5.y >= 0.9));
    r15.z = ps;
    r0.xyz = r11.zxy * r5.zzz + r10.xyz;
    ps = (-0.5) + r5.x;
    r0.xzw = r0.xyz - r15.xyz;
    r0.y = saturate(ps);
    ps = ModShadowGroupColor.x * r5.w;
    r9.yzw = r0.xzw * r0.yyy;
    r11.x = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r9 = r15.wxyz + r9;
    r11.y = ps;
    ps = 1.0 / r4.w;
    r11.z = saturate(r9.x - r11.z);
    r11.w = ps;
    r5.xw = -r3.yz * r11.zz + r3.yz;
    r5.yz = r7.zw * r11.ww + ScreenPositionScaleBias.wz;
    r0.w = r7.x * r11.z + r3.w;
    ps = r14.z;
    r0.xz = r5.xw + r6.yz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r0.xzw = -r13.xyz + r0.xzw;
    r13.w = ps;
    r6.xyz = r0.xzw * r0.yyy + r13.xyw;
    r6.w = r6.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r7.yyy;
    ps = 1.0 + r6.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r1.w));
    r5.w = dot(r6.zxy, r6.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r6.www * r1.xyz;
    r5.w = ps;
    ps = 1.0 - r5.x;
    r7.xyz = r6.xyz * r5.www;
    r5.x = saturate(ps);
    r5.w = dot(r7.zxy, r12.zxy);
    r6.xyz = r7.xyz * r5.www;
    r6.xyz = r6.xyz * 2.0 - r12.xyz;
    r5.w = saturate(dot(r4.zxy, r6.zxy));
    ps = log2(r5.w);
    r1.xyw = -r11.xyz + 1.0;
    r8.w = ps;
    r6.xyw = r8.wyx * float3(15.0, 0.875, 0.875);
    r8.xy = r6.wy * r1.xy;
    r0.xzw = r8.zxy + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r8.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r3.xyz = r10.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    ps = log2(r5.x);
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r2.xyz = r8.xyz * r2.www;
    r6.w = ps;
    ps = r2.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = r6.w * ps;
    r1.xyz = r9.yzw * r8.xyz;
    r0.x = ps;
    ps = r2.z;
    r3.xyz = r3.xyz * r1.www;
    ps = r6.w * ps;
    r3.xyz = r3.xyz * r0.yyy;
    r0.y = ps;
    ps = pow(2.0, r6.x);
    r5.x = saturate(dot(r7.zyx, r4.zyx));
    r6.x = ps;
    ps = r2.y;
    r6.xyz = r3.xyz * r6.xxx;
    r6.xy = r1.xy * r5.xx + r6.xy;
    r6.z = r1.z * r5.x + r6.z;
    ps = r6.w * ps;
    r5.x = r0.z * r0.w;
    r0.z = ps;
    r5.xyz = r5.xxx * r5.yzw + ModShadowColor.xyz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
