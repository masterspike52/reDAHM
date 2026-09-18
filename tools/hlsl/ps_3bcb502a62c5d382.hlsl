// ps_3bcb502a62c5d382.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 366 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005B8 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c15); // float3
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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r17.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r21.xyz = tex2D(Texture2D_2, r5.xy).xyw;
    r20.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    ps = r0.w;
    r5.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r10.x = ps;
    ps = -r0.z;
    r8.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r1.z + 0.1;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.y = r4.w - 4e+02;
    r10.w = ps;
    ps = rsqrt(abs(r5.w));
    r6.xy = saturate(r6.yx * float2(0.00022222222, 5.0));
    r5.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r3.xyz = r5.www * r3.xyz;
    r5.w = ps;
    ps = 1.0 / r4.w;
    r6.w = r6.x * (-0.025);
    r6.z = ps;
    r11.xy = r3.xy * r6.ww + r8.xy;
    r8.zw = r11.zw * r6.zz + ScreenPositionScaleBias.wz;
    r10.y = -r11.y * r5.w + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.yzw = r10.zyw * UniformVector_2.yyx;
    r5.w = ps;
    ps = r10.w;
    r8.xy = r5.zw * abs(r7.xy);
    ps = r11.x * ps;
    r7.xyz = r10.zxy - 0.5;
    r9.w = ps;
    ps = r9.x + r9.x;
    r20.w = float((r9.w >= 0.5));
    r9.x = ps;
    ps = r9.y + r9.y;
    r14.xyw = float3((r10.zyx >= 0.5));
    r9.y = ps;
    ps = r9.z + r9.z;
    r7.xyz = r7.xzy - r10.zyx;
    r9.z = ps;
    r15 = r9 + float4(-1.0, -1.0, -1.0, -0.5);
    r7.yzw = r7.xzy * r14.xwy + r10.zxy;
    ps = r0.w;
    r21.w = r15.w - r9.w;
    ps = UniformVector_6.x * ps;
    r6.zw = r21.wz * r20.wz;
    r5.z = ps;
    ps = r0.z;
    r7.x = r9.w + r6.z;
    ps = UniformVector_6.y * ps;
    r0 = r7.zwxy + r7.zwxy;
    r5.w = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r9.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r16 = tex2D(Texture2D_1, r0.xy);
    r19 = tex2D(Texture2D_1, r0.zw);
    r10.xyz = tex2D(Texture2D_7, r5.zw).xyz;
    r11.xyz = tex2D(Texture2D_0, r11.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r5.xy).xwy;
    ps = 0.0001 * r4.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r8.z = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r18.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.w = float((UniformScalar_5.x >= 1.0));
    r18.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.w = float((UniformScalar_5.x > 1.0));
    r18.z = ps;
    ps = (-1.0) + r0.y;
    r12.xy = r20.xy + r20.xy;
    r4.x = ps;
    ps = r21.x + r21.x;
    r5.xyz = r11.zxy + float3(-1.0, 0.0, 0.0);
    r12.z = ps;
    r4.yzw = (-abs(r0.www) >= 0.0) ? r10.xyz : 1.0;
    r10.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r4.yzw;
    ps = r21.y + r21.y;
    r5.yzw = r5.zyx + r11.yxz;
    r12.w = ps;
    ps = r0.x + r0.x;
    r12 = r12 - 1.0;
    r14.z = ps;
    r12.xy = r12.zw * 0.5 + r12.xy;
    ps = r0.z + r0.z;
    r4.z = dot(r14.wyy, float3(1.0, 1.0, 1.0));
    r14.w = ps;
    r4.y = r14.x * 2.0 + r20.w;
    r4.w = r15.z * UniformVector_4.z - r5.w;
    r3.w = (r4.y == 0.0) ? r19.x : r19.y;
    r5.x = (r4.z == 0.0) ? r16.x : r16.y;
    ps = (-1.0) + r5.z;
    r0 = r4.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r4.y = ps;
    r5.x = (r0.z == 0.0) ? r16.z : r5.x;
    r5.z = (r0.y == 0.0) ? r19.z : r3.w;
    r12.w = (r0.x == 0.0) ? r19.w : r5.z;
    ps = (-1.0) - -r6.w;
    r17.xyz = r18.xyz * r17.xyz;
    r12.z = ps;
    r6.z = (r0.w == 0.0) ? r16.w : r5.x;
    ps = 1.0 - r6.y;
    r5.x = max(r6.z, 0.0);
    r5.z = ps;
    ps = 1.0 - r6.z;
    r8.w = min(r5.x, 0.3);
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r16.xyz = r8.xyw * float3(0.875, 0.875, 3.3333333);
    r8.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r12.xyz = r16.zzz * r12.xyz;
    r8.y = ps;
    ps = 2.5 * r5.x;
    r0.yzw = -r8.zxy + 1.0;
    r8.y = ps;
    ps = UniformScalar_1.x * r0.y;
    r8.zw = r12.zw + float2(1.0, 0.25);
    r0.x = ps;
    ps = abs(r8.z) * abs(r8.z);
    r10.xyz = r17.xyz * r10.xyz;
    r3.w = ps;
    ps = r8.w;
    r14.xy = r16.xy * r0.zw;
    ps = r12.w + ps;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r6.x = ps;
    r5.xz = r0.xx * r14.zw + r15.xy;
    ps = r14.x * r14.y;
    r6.w = saturate(r6.x - r6.w);
    r6.x = ps;
    r6.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    ps = r3.w * r3.w;
    r9.xyz = r6.www * r9.xyz;
    r8.x = ps;
    r12.xy = r5.xz * UniformVector_4.xy + r12.xy;
    ps = (-1.0) + r5.y;
    r5.xz = r8.yx * r8.zx;
    r4.z = ps;
    ps = (-0.5) + r5.x;
    r4.yz = r12.xy - r4.yz;
    r6.w = saturate(ps);
    r5.y = r4.w * r6.w + r5.w;
    r4.yz = r4.yz * r6.ww - 1.0;
    r4.yz = r11.xy * 2.0 + r4.yz;
    r4.w = r5.y * TwoSidedSign.x - TwoSidedSign.x;
    r5.y = r4.w * r0.y + TwoSidedSign.x;
    r4.xyz = r4.xyz * r0.yyy + float3(1.0, 0.0, 0.0);
    r4.xyw = (r0.xyy > 0.0) ? r4.xyz : float3(1.0, 0.0, 0.0);
    r5.y = (r0.y > 0.0) ? r5.y : TwoSidedSign.x;
    r4.z = (r0.y >= 0.0) ? r5.y : TwoSidedSign.x;
    r4.xyw = (r0.yyx >= 0.0) ? r4.ywx : float3(0.0, 0.0, 1.0);
    r0.xyz = r10.xyz * r4.www;
    r10.xyz = r0.xyz * r8.zzz - r9.xyz;
    r0.xyz = r0.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r1.w));
    r0.xyz = r5.zzz * r0.xyz;
    r5.x = ps;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r5.yzw = r5.xxx * r1.xyz;
    r5.x = dot(r4.zxy, r4.zxy);
    r1.xyz = r10.xyz * r6.www + r9.xyz;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r8.xyz;
    r5.x = ps;
    r4.xyz = r4.xyz * r5.xxx;
    r4.xyz = r4.xyz * TwoSidedSign.xxx;
    r5.x = dot(r4.zxy, r3.zxy);
    r8.xyz = r4.xzy * r5.xxx;
    r3.xyz = r8.xyz * 2.0 - r3.xzy;
    r5.x = saturate(dot(r5.wyz, r3.yxz));
    ps = log2(r5.x);
    r3.xyz = r0.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r0.xyz = r7.xyz * r2.www;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r4.zxy, r5.wyz));
    r5.x = ps;
    r5.xyz = r3.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
