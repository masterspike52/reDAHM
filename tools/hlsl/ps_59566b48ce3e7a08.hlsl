// ps_59566b48ce3e7a08.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041200 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r13.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r9.x = ps;
    r10.xyw = tex2D(Texture2D_2, r5.xy).xwy;
    r14.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r3.w = -r0.z + 1.0;
    ps = r4.w;
    r5.z = r10.y * r14.z;
    ps = 0.0001 * ps;
    r15.zw = r0.xy * UniformScalar_0.xx;
    r6.w = saturate(ps);
    ps = r4.w;
    r12.xy = r0.wz * UniformVector_6.xy;
    ps = (-4e+02) + ps;
    r18.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = r1.z;
    r9.yz = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.xy = saturate(r5.xy * float2(0.00022222222, 5.0));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.www * r3.xyz;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.x = r5.x * (-0.025);
    r6.x = ps;
    r18.xy = r8.xy * r5.xx + r9.yz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = r18.zwy * r6.yyx;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r3.xy = -r6.zw + 1.0;
    r3.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.yzw = r3.wxz * UniformVector_2.yyx;
    r5.w = ps;
    ps = r9.w;
    r11.xy = r5.xw * abs(r7.xy);
    ps = r18.x * ps;
    r4.xyz = r9.zxy - 0.5;
    r5.x = ps;
    r16.x = float((r5.x >= 0.5));
    ps = (-1.0) + r5.z;
    r16.yzw = float3((r9.xzy >= 0.5));
    r14.z = ps;
    ps = (-0.5) + r5.x;
    r17.yzw = r4.xzy - r9.zyx;
    r14.w = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r17.x = r14.w - r5.x;
    r4.x = ps;
    r7.x = r17.x * r16.x + r5.x;
    r7.yzw = r17.ywz * r16.zyw + r9.zxy;
    ps = ScreenPositionScaleBias.z + r6.y;
    r7 = r7.zwxy + r7.zwxy;
    r4.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r18.xy).xyz;
    r15.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r11 = tex2D(Texture2D_1, r7.zw);
    r17 = tex2D(Texture2D_1, r7.xy);
    r12.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r18.xy).zxy;
    r18.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r15.zw).wxy;
    r5.w = float((UniformScalar_5.x >= 1.0));
    r5.x = dot(r2.zxy, r2.zxy);
    r10.yz = r14.xy * 2.0 - 1.0;
    r15.zw = r10.xw * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r6.w = float((UniformScalar_5.x > 1.0));
    r5.x = saturate(ps);
    ps = r18.x + r18.x;
    r6.xyz = r7.xyz + float3(-1.0, 0.0, 0.0);
    r2.y = ps;
    r2.xzw = (-abs(r6.www) >= 0.0) ? r12.xyz : 1.0;
    r12.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r2.xzw;
    ps = log2(r5.x);
    r6.xyz = r6.yxz + r7.yxz;
    r5.x = ps;
    r2.x = r16.z * 2.0 + r16.x;
    ps = r18.y + r18.y;
    r2.w = dot(r16.yww, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r6.w = (r2.w == 0.0) ? r17.x : r17.y;
    r5.w = (r2.x == 0.0) ? r11.x : r11.y;
    ps = r18.z + r18.z;
    r16 = r2.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r2.w = ps;
    r5.w = (r16.y == 0.0) ? r11.z : r5.w;
    r6.w = (r16.z == 0.0) ? r17.z : r6.w;
    r10.x = (r16.w == 0.0) ? r17.w : r6.w;
    r2.x = (r16.x == 0.0) ? r11.w : r5.w;
    r11 = r2.xywz + float4(0.25, -1.0, -1.0, -1.0);
    r11.z = r11.z * UniformVector_4.z - r6.y;
    r5.w = r11.x + r2.x;
    r1.w = saturate(r5.w - r5.z);
    r6.w = dot(r1.zxy, r1.zxy);
    r16.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r13.xyz = r16.xyz * r13.xyz;
    ps = r0.y + r0.y;
    r16 = r15 * float4(0.875, 0.875, 0.5, 0.5);
    r15.z = ps;
    ps = 1.0 - r5.y;
    r14.xy = r10.yz + r16.zw;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = max(r10.x, 0.0);
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r10.w = min(r5.y, 0.3);
    r10.z = ps;
    ps = r0.z + r0.z;
    r10.xyz = -r10.xyz + 1.0;
    r15.w = ps;
    ps = (-1.0) + r6.x;
    r15.xy = r16.xy * r10.yz;
    r5.y = ps;
    ps = (-1.0) + r6.z;
    r10.xy = r10.xw * float2(2.5, 3.3333333);
    r5.z = ps;
    ps = UniformScalar_1.x * r3.y;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r0.w = ps;
    r10.w = r10.y * r14.z + 1.0;
    r11.xy = r0.ww * r15.zw + r11.yw;
    ps = abs(r10.w) * abs(r10.w);
    r5.w = r15.x * r15.y;
    r10.z = ps;
    r2.xyz = r5.www * r2.xyz + ModShadowColor.xyz;
    r5.yz = r11.xy * UniformVector_4.xy - r5.yz;
    r11.xy = r10.yy * r14.xy + r5.yz;
    ps = (-1.0) + r0.x;
    r5.yz = r10.xz * r10.wz;
    r7.x = ps;
    ps = (-0.5) + r5.y;
    r0.xyz = r13.xyz * r12.xyz;
    r5.w = saturate(ps);
    r5.y = r11.z * r5.w + r6.y;
    r6.xy = r11.xy * r5.ww - 1.0;
    r7.yz = r7.yz * 2.0 + r6.xy;
    r7.w = r5.y * TwoSidedSign.x - TwoSidedSign.x;
    r7 = r7 * r3.yyyy;
    ps = r7.w;
    r9.xyz = r1.www * r9.xyz;
    r5.y = ps;
    ps = TwoSidedSign.x + r5.y;
    r6.x = r7.x + 1.0;
    r6.y = ps;
    r7.xy = (r3.yy > 0.0) ? r7.yz : 0.0;
    r7.xy = (r3.yy >= 0.0) ? r7.xy : 0.0;
    r6.x = (r0.w > 0.0) ? r6.x : 1.0;
    r6.y = (r3.y > 0.0) ? r6.y : TwoSidedSign.x;
    r7.z = (r3.y >= 0.0) ? r6.y : TwoSidedSign.x;
    r6.x = (r0.w >= 0.0) ? r6.x : 1.0;
    ps = r5.z * r5.z;
    r6.xyz = r0.xyz * r6.xxx;
    r5.y = ps;
    r3.xyz = r6.xyz * r10.www - r9.xyz;
    r6.xyz = r6.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r5.yyy * r6.xyz;
    r5.y = ps;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r1.xyz = r5.yyy * r1.xyz;
    r5.y = dot(r7.zxy, r7.zxy);
    r3.xyz = r3.xyz * r5.www + r9.xyz;
    ps = rsqrt(abs(r5.y));
    r6.yzw = r3.xyz * r6.xyz;
    r5.y = ps;
    r3.xyz = r7.xyz * r5.yyy;
    r3.xyz = r3.xyz * TwoSidedSign.xxx;
    r5.y = dot(r3.zxy, r8.zxy);
    r7.xyz = r3.xzy * r5.yyy;
    r7.xyz = r7.xyz * 2.0 - r8.xzy;
    r5.y = saturate(dot(r1.zxy, r7.yxz));
    ps = log2(r5.y);
    r0.xyz = r0.xyz * r5.www;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r3.zxy, r1.zxy));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r4.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
