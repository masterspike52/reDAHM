// ps_24b0217d94426ada.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r10.xy = r0.xy * UniformVector_3.xy;
    r1.w = ps;
    r11 = tex2D(Texture2D_8, r10.xy);
    ps = r0.w;
    r5.yw = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r9.y = -r0.z + 1.0;
    r5.z = ps;
    ps = r4.w;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.0001 * ps;
    r9.xz = r0.wz * UniformVector_1.xy;
    r6.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r1.z + 0.1;
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r4.w - 4e+02;
    r10.w = ps;
    ps = r11.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r4.xy = saturate(r6.yz * float2(5.0, 0.00022222222));
    r6.x = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r6.xxx * r3.xyz;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.z = r4.y * (-0.025);
    r6.x = ps;
    r12.xy = r8.xy * r6.zz + r9.xz;
    ps = (-0.5) + r5.x;
    r6.xyz = r12.zwy * r6.yyx;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r9.xw = -r6.zw + 1.0;
    r9.z = ps;
    ps = r10.z;
    r3.yzw = r9.zxy * UniformVector_2.xyy;
    ps = abs(r7.x) * ps;
    r4.zw = r3.zw - 0.5;
    r3.x = ps;
    ps = r3.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    ps = r12.x * ps;
    r13.zw = float2((r3.zw >= 0.5));
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r15.zw = r4.zw - r3.zw;
    r4.z = ps;
    ps = (-0.5) + r5.z;
    r13.xy = float2((r5.xz >= 0.5));
    r4.w = ps;
    ps = r10.w;
    r15.xy = r4.zw - r5.xz;
    r14.xz = r15.xy * r13.xy + r5.xz;
    r14.yw = r15.zw * r13.zw + r3.zw;
    ps = abs(r7.y) * ps;
    r17 = r14 + r14;
    r3.y = ps;
    r16.y = tex2D(Texture2D_4, r10.xy).x;
    r14 = tex2D(Texture2D_1, r17.zw);
    r7.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r3.xyw = tex2D(Texture2D_3, r10.xy).xyz;
    r16.xzw = tex2D(Texture2D_2, r5.yw).xyw;
    r5.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r3.z = r0.y + UniformScalar_8.x;
    r5.w = ps;
    ps = UniformScalar_4.x;
    r4.zw = r0.wz * UniformVector_5.xy;
    ps = UniformScalar_3.x * ps;
    r15.zw = r5.xy + r5.xy;
    r10.x = ps;
    r7.zw = r16.xz * 2.0 - 1.0;
    r5.w = (-abs(r5.w) >= 0.0) ? 1.0 : (-1.0);
    ps = r16.w;
    r10.yzw = r3.wxy + float3(-2.0, 0.0, 0.0);
    r16.x = (-abs(r1.w) >= 0.0) ? (-1.0) : r5.w;
    ps = r5.z * ps;
    r5.xyw = r10.zyw + r3.xwy;
    r5.z = ps;
    ps = 1.0 - r4.x;
    r7 = r7.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r1.w = ps;
    r3.xy = -r1.ww * ModShadowGroupColor.xy + 1.0;
    ps = (-1.0) - -r5.z;
    r15.xy = r7.xw * r3.xy;
    r7.x = ps;
    ps = (-1.0) + r5.x;
    r20 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r10.y = ps;
    r3.xw = r13.wz * 2.0 + r13.yx;
    r1.w = (r3.x == 0.0) ? r14.x : r14.y;
    ps = (-1.0) + r5.w;
    r13 = r3.wwxx + float4(-3.0, -2.0, -2.0, -3.0);
    r10.z = ps;
    r1.w = (r13.z == 0.0) ? r14.z : r1.w;
    r16.z = (r13.w == 0.0) ? r14.w : r1.w;
    ps = 0.0 + r5.y;
    r1.w = max(r16.z, 0.0);
    r10.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r14 = r10.xwyz * r16.xyxy;
    r7.w = ps;
    ps = floor(r14.x);
    r5.x = min(r1.w, 0.3);
    r5.w = ps;
    ps = 3.3333333 * r5.x;
    r7.yz = r20.zw + r7.yz;
    r5.y = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r15 = r5.yyyw * r7;
    r5.x = ps;
    ps = ScreenPositionScaleBias.z + r6.y;
    r3.y = r15.w + r0.x;
    r5.y = ps;
    r10.xyz = tex2D(Texture2D_6, r12.xy).xyz;
    r6 = tex2D(Texture2D_1, r17.xy);
    r18.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r7.xyz = tex2D(Texture2D_7, r4.zw).xyz;
    r0.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r12 = tex2D(Texture2D_5, r3.yz);
    ps = -ModShadowColor.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r22.xyz = UniformVector_4.xyz * 2e+01;
    r19.x = ps;
    ps = -ModShadowColor.y;
    r5.y = float((UniformScalar_11.x >= 1.0));
    ps = 1.0 + ps;
    r5.w = dot(r1.zxy, r1.zxy);
    r19.y = ps;
    ps = -ModShadowColor.z;
    r0.z = float((UniformScalar_11.x > 1.0));
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r19.z = ps;
    ps = r12.x * r12.w;
    r17.xyz = r0.xyw + r0.xyw;
    r12.x = ps;
    ps = r12.y * r12.w;
    r21.xyz = r11.xyz * UniformScalar_12.xxx;
    r12.y = ps;
    r7.xyz = (-abs(r0.zzz) >= 0.0) ? r7.xyz : 1.0;
    ps = rsqrt(abs(r5.w));
    r18.xyz = r18.xyz * r2.www;
    r5.w = ps;
    ps = r12.z * r12.w;
    r3.xyz = r5.www * r1.xyz;
    r12.z = ps;
    r7.xyz = (-abs(r5.yyy) >= 0.0) ? 1.0 : r7.xyz;
    ps = 1.0 - r5.x;
    r1.xyz = r22.xyz * r12.xyz;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r12.xyz = r1.xyz * r16.yyy;
    r5.x = ps;
    r2.xyz = r21.xyz * r7.xyz + UniformScalar_13.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r20.x * r20.y;
    r5.x = ps;
    r0.xyz = r5.yyy * r19.xyz + ModShadowColor.xyz;
    r5.y = (r3.w == 0.0) ? r6.x : r6.y;
    r5.y = (r13.y == 0.0) ? r6.z : r5.y;
    r17.w = (r13.x == 0.0) ? r6.w : r5.y;
    ps = pow(2.0, r5.x);
    r6.xw = -r16.zy + 1.0;
    r5.x = ps;
    ps = 2.5 * r6.x;
    r13 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.z = ps;
    ps = r13.w;
    r1.xyz = r18.xzy * r5.xxx;
    ps = r17.w + ps;
    r5.x = -r13.z + r14.y;
    r5.y = ps;
    ps = 1.0 + r5.x;
    r5.y = saturate(r5.y - r5.z);
    r7.w = ps;
    ps = r15.z;
    r2.xyz = r2.xyz * r6.www;
    r5.x = r14.z * r16.y + r15.y;
    ps = r14.w + ps;
    r6.y = r15.x + 1.0;
    r5.z = ps;
    ps = r6.y * r6.x;
    r10.xyz = r5.yyy * r10.xyz;
    r5.y = ps;
    ps = r6.z * r6.y;
    r14.xy = -r13.xy + r5.xz;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r6.w = saturate(ps);
    r5.xy = r14.xy * r6.ww + r13.xy;
    r6.xyz = r12.xyz * r5.zzz - r10.xyz;
    r7.xyz = r7.xyz * r11.xyz + r6.xyz;
    r6.xyz = r7.xyz * r6.www + r10.xyz;
    r5.z = r7.w * r6.w - 2.0;
    r5.z = r0.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r9.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r9.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r4.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r1.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
