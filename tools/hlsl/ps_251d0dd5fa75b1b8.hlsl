// ps_251d0dd5fa75b1b8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 360 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005A0 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r18.w = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = -r0.z + 1.0;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r11.z = ps;
    r8.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r4.w;
    r5.zw = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r9.xy = r0.wz * 6.0;
    r6.z = ps;
    ps = r0.w;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = UniformVector_7.x * ps;
    r7.xy = r0.wz * UniformVector_1.xy;
    r9.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r1.z + 0.1;
    r5.y = ps;
    ps = 5.0 * r5.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.w = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r8.x = saturate(r6.z * 0.00022222222);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r3.xyz = r5.xxx * r3.xyz;
    r6.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r13.yzw = r8.yzx * float3(0.875, 0.875, -0.025);
    r6.x = ps;
    r10.xy = r3.xy * r13.ww + r7.xy;
    ps = UniformVector_2.x * r5.y;
    r7.xyz = r10.zwy * r6.zzx;
    r5.x = ps;
    ps = r5.x;
    r6.xw = -r7.zw + 1.0;
    ps = r10.x * ps;
    r11.yw = r6.xy * UniformVector_2.yy;
    r11.x = ps;
    ps = r0.z;
    r4 = r11 - 0.5;
    ps = UniformVector_7.y * ps;
    r8 = float4((r11.xywz >= 0.5));
    r9.w = ps;
    ps = ScreenPositionScaleBias.w + r7.x;
    r4 = r4.xywz - r11.xywz;
    r5.x = ps;
    r4 = r4.xywz * r8.xywz + r11;
    ps = ScreenPositionScaleBias.z + r7.y;
    r4 = r4 + r4;
    r5.y = ps;
    r11.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r19 = tex2D(Texture2D_1, r4.xy);
    r20 = tex2D(Texture2D_1, r4.zw);
    r4.yzw = tex2D(Texture2D_0, r10.xy).xyz;
    r16.xyz = tex2D(Texture2D_8, r9.zw).xyz;
    r21.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r18.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.xzw = tex2D(Texture2D_3, r5.zw).wxy;
    r17.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r9 = tex2D(Texture2D_6, r0.xy).wxyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r15.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r15.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r7.w = float((UniformScalar_5.x >= 1.0));
    r15.z = ps;
    ps = r9.x;
    r0.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = UniformScalar_6.x * r5.y;
    r14.zw = r17.xy + r17.xy;
    r4.x = ps;
    ps = r5.z + r5.z;
    r5.y = float((UniformScalar_5.x > 1.0));
    r14.x = ps;
    ps = r5.w + r5.w;
    r7.xyz = r7.xyz * r2.www;
    r14.y = ps;
    r6.yz = r18.xy * 2.0 - 1.0;
    r17.xyz = r21.zxy * 2.0 - 1.0;
    ps = (-1.0) + r5.x;
    r5.z = r18.z * r17.w;
    r13.x = ps;
    r16.xyz = (-abs(r5.yyy) >= 0.0) ? r16.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r0.yzw = r4.yzw + r4.yzw;
    r5.x = ps;
    ps = r9.x;
    r2.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    r16.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r16.xzy;
    ps = 1.0 - r5.x;
    r1.x = dot(r8.xyy, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    ps = UniformVector_5.x * r5.w;
    r1.y = dot(r8.wzz, float3(1.0, 1.0, 1.0));
    r8.x = ps;
    r5.y = (r1.y == 0.0) ? r20.x : r20.y;
    r5.x = (r1.x == 0.0) ? r19.x : r19.y;
    ps = ModShadowGroupColor.x * r6.w;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r18.x = ps;
    r5.x = (r1.y == 0.0) ? r19.z : r5.x;
    r5.y = (r1.z == 0.0) ? r20.z : r5.y;
    r18.z = (r1.w == 0.0) ? r20.w : r5.y;
    r5.x = (r1.x == 0.0) ? r19.w : r5.x;
    r0.x = r5.x * 2.0 - r5.z;
    ps = ModShadowGroupColor.y * r6.w;
    r5.x = max(r18.z, 0.0);
    r18.y = ps;
    ps = UniformVector_5.y * r5.w;
    r1 = -r18 + 1.0;
    r8.y = ps;
    r13.yzw = r13.xyz * r1.wxy + float3(1.0, 0.125, 0.125);
    ps = r1.w;
    r6.x = min(r5.x, 0.3);
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r0 = r0 + float4(1.25, -1.0, -1.0, -1.0);
    r7.w = ps;
    r12.w = r17.x * UniformVector_4.z - r0.w;
    ps = 3.3333333 * r6.x;
    r14 = r14 - 1.0;
    r17.x = ps;
    r5.xy = r7.ww * r14.xy + r17.yz;
    r6.w = (r7.w > 0.0) ? r13.y : 1.0;
    ps = 0.5 * r6.y;
    r2.w = saturate(r0.x - r5.z);
    r17.y = ps;
    ps = 0.5 * r6.z;
    r11.xyz = r2.www * r11.xyz;
    r17.z = ps;
    r15.w = (r7.w >= 0.0) ? r6.w : 1.0;
    r5.xy = r5.xy * UniformVector_4.xy - r0.yz;
    ps = (-1.0) - -r5.z;
    r6.yz = r14.zw + r17.yz;
    r6.x = ps;
    r5.yz = r17.xx * r6.yz + r5.xy;
    ps = r1.z;
    r14 = r15 * r9.yzwx;
    r5.x = ps;
    r6.w = r17.x * r6.x + 1.0;
    ps = 2.5 * r5.x;
    r6.xyz = r14.xzy * r16.xyz;
    r9.w = ps;
    ps = abs(r6.w) * abs(r6.w);
    r5.x = r6.x * r15.w;
    r13.x = ps;
    ps = r5.x;
    r9.yz = r6.zy * r14.ww;
    ps = r9.x * ps;
    r0.xw = r13.zx * r13.wx;
    r9.x = ps;
    r6.xyz = r0.xxx * r12.xyz + ModShadowColor.xyz;
    r12.xyz = r9.xyz * r6.www - r11.xyz;
    r6.w = saturate(r9.w * r6.w - 0.5);
    r5.xy = r5.yz * r6.ww + r0.yz;
    r8.w = r12.w * r6.w - 2.0;
    r11.xyz = r12.xyz * r6.www + r11.xyz;
    ps = UniformVector_5.z * r5.w;
    r0.xyz = r11.xyz * r10.xyz;
    r8.z = ps;
    r8 = r8 + r4.xxxw;
    r1.xyz = r9.xyz * UniformScalar_7.xxx + r8.xyz;
    r5.z = r8.w + r4.w;
    r5.xyz = r5.zxy * r1.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r1.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r1.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.w * r0.w;
    r5.x = dot(r5.wyz, r5.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r7.www * r1.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r3.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    r5.x = saturate(dot(r2.zxy, r3.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r2.zyx));
    r5.x = ps;
    r5.xyz = r1.xzy * r5.xxx;
    r5.y = r0.z * r5.w + r5.y;
    r5.xz = r0.xy * r5.ww + r5.xz;
    r5.xyz = r7.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
