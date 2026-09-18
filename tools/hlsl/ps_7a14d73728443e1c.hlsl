// ps_7a14d73728443e1c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    r12.xy = -UniformVector_0.xy + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r8.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r0.w;
    r21.y = -r0.z + 1.0;
    ps = UniformVector_2.x * ps;
    r10.x = saturate(r4.w * 0.0001);
    r6.z = ps;
    ps = r1.z;
    r9 = r0.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    ps = 0.1 + ps;
    r6.xw = r0.wz * UniformVector_1.xy;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r4.w - 4e+02;
    r5.y = ps;
    ps = UniformVector_2.x * r5.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r10.y = saturate(r6.y * 5.0);
    r5.y = ps;
    ps = 0.00022222222 * r5.x;
    r8.xyz = r5.yyy * r3.xyz;
    r7.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.yw = -r10.xy + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.w;
    r3.xyz = r7.yzx * float3(0.875, 0.875, -0.025);
    r6.y = ps;
    r11.xy = r8.xy * r3.zz + r6.xw;
    ps = ModShadowGroupColor.y * r5.w;
    r6.x = r11.y * r5.x;
    r6.w = ps;
    ps = r5.z;
    r21.xzw = -r6.xyw + 1.0;
    ps = r11.x * ps;
    r6.yw = r21.xy * UniformVector_2.yy;
    r6.x = ps;
    ps = r0.x;
    r10 = r6 - 0.5;
    ps = UniformScalar_0.x * ps;
    r19 = float4((r6.xywz >= 0.5));
    r5.x = ps;
    ps = r0.y;
    r10 = r10.xywz - r6.xywz;
    r6 = r10.xywz * r19.xywz + r6;
    ps = UniformScalar_0.x * ps;
    r6 = r6 + r6;
    r5.z = ps;
    r3.zw = tex2D(Texture2D_3, r9.zw).xy;
    r18 = tex2D(Texture2D_6, r0.xy);
    r14 = tex2D(Texture2D_1, r6.zw);
    r17 = tex2D(Texture2D_1, r6.xy);
    r13.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyz = tex2D(Texture2D_4, r5.xz).xwy;
    r7.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r10.yzw = tex2D(Texture2D_0, r11.xy).xyz;
    r9.xyz = r10.yzw * 2.0 - 1.0;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r12.zw = r0.wz * UniformVector_7.xy;
    r0.x = ps;
    ps = r6.z + r6.z;
    r0.zw = r13.xy + r13.xy;
    r0.y = ps;
    r20 = r0 - 1.0;
    ps = r15.x + r15.x;
    r0.x = r5.y * UniformScalar_1.x;
    r16.z = ps;
    r6.xw = r0.xx * r20.xy + r7.yz;
    ps = r15.y + r15.y;
    r16.xy = r3.xy * r21.zw;
    r16.w = ps;
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r13.xy = r16.zw * 0.5 + r20.zw;
    r0.z = dot(r19.wzz, float3(1.0, 1.0, 1.0));
    ps = r15.z;
    r0.y = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r6.z = (r0.y == 0.0) ? r17.x : r17.y;
    r5.z = (r0.z == 0.0) ? r14.x : r14.y;
    ps = r13.z * ps;
    r15 = r0.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r5.x = ps;
    r5.z = (r15.z == 0.0) ? r14.z : r5.z;
    r6.z = (r15.y == 0.0) ? r17.z : r6.z;
    r3.x = (r15.x == 0.0) ? r17.w : r6.z;
    r5.z = (r15.w == 0.0) ? r14.w : r5.z;
    ps = 1.0 - r5.z;
    r14.zw = r4.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = 0.25 + r3.x;
    r5.z = max(r5.z, 0.0);
    r3.y = ps;
    ps = r5.z;
    r6.z = float((r18.w >= 0.5));
    r11.z = ps;
    ps = 0.3;
    r0.yzw = r3.yzw + r3.xzw;
    r11.w = ps;
    ps = min(r11.z, r11.w);
    r15.zw = r0.zw - 1.0;
    r15.x = ps;
    ps = (-1.0) - -r5.x;
    r3 = r15.zwxy * float4(0.012, 0.012, 3.3333333, 2.5);
    r13.z = ps;
    r13.yzw = r3.zzz * r13.xyz;
    r6.xw = r6.xw * UniformVector_4.xy - r3.xy;
    r6.xw = r6.xw * r6.zz + r3.xy;
    r6.xw = r6.xw + r13.yz;
    ps = 1.0 / r4.w;
    r14.xy = -r9.xy + r6.xw;
    r5.z = ps;
    r6.xw = r14.zw * r5.zz + ScreenPositionScaleBias.wz;
    r4.xyw = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r11.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r17.xyz = tex2D(Texture2D_9, r12.zw).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r19.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.z = float((UniformScalar_5.x >= 1.0));
    r19.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.x = float((UniformScalar_5.x > 1.0));
    r19.z = ps;
    r18.xyz = r19.xyz * r18.xyz;
    r17.xyz = (-abs(r6.xxx) >= 0.0) ? r17.xyz : 1.0;
    r17.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r17.xyz;
    r3.xyz = r18.xyz * r17.xyz;
    ps = UniformVector_4.z * r7.x;
    r5.z = r16.x * r16.y;
    r13.x = ps;
    r7.xyz = r5.zzz * r15.xyz + ModShadowColor.xyz;
    ps = (-1.0) + r6.y;
    r6.xw = r13.xw + float2(-1.0, 1.0);
    r13.x = ps;
    r5.z = saturate(r3.w * r6.w - 0.5);
    r13.yz = r14.xy * r5.zz + r9.xy;
    r9.xyw = r13.yzx * r5.yyy;
    ps = r0.y;
    r6.y = r9.w + 1.0;
    r6.y = (r0.x > 0.0) ? r6.y : 1.0;
    r6.y = (r0.x >= 0.0) ? r6.y : 1.0;
    ps = -r5.x + ps;
    r0.xy = r6.zx * r6.yz;
    r5.x = saturate(ps);
    ps = -r9.z;
    r14.xyz = r5.xxx * r11.xyz;
    ps = r0.y + ps;
    r3.xyw = r3.xyz * r0.xxx;
    r5.x = ps;
    r0.yzw = r3.xyw * r6.www - r14.xyz;
    ps = 1.0 + r5.x;
    r3.z = -UniformVector_0.z + 1.0;
    r0.x = ps;
    r13 = r0 * r5.zzzz;
    ps = rsqrt(abs(r7.w));
    r4.z = r14.z + r13.w;
    r5.x = ps;
    ps = 1.0 - r6.z;
    r0.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = UniformScalar_6.x * r6.z;
    r11.xyz = r5.xxx * UniformVector_5.xyz;
    r10.x = ps;
    ps = r13.x;
    r1.xy = r14.xy + r13.yz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r1.xz = r1.xy * r12.xy;
    r11.w = ps;
    r11 = r11 + r10.xxxw;
    r3.xyw = r3.xyw * UniformScalar_7.xxx + r11.xyz;
    ps = abs(r6.w) * abs(r6.w);
    r5.x = r11.w + r10.w;
    r5.z = ps;
    r5.xz = r5.xz * r5.yz;
    ps = r5.z * r5.z;
    r6.xyz = r4.xyw * r2.www;
    r4.w = ps;
    ps = 1.0 + r5.x;
    r4.xy = r4.ww * r3.xy;
    r9.z = ps;
    r2.xyz = (r5.yyy > 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r5.yyy >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.w));
    r5 = r4.wxyz * r3.wxyz;
    r6.w = ps;
    r2.xyz = r2.xyz * r6.www;
    r6.w = dot(r2.zxy, r8.zxy);
    r4.xyz = r2.xyz * r6.www;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r6.w = saturate(dot(r0.zxy, r4.zxy));
    ps = log2(r6.w);
    r1.y = r5.x * r3.w;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r0.y = saturate(dot(r2.zyx, r0.zyx));
    r0.x = ps;
    r5.xyz = r5.yzw * r0.xxy;
    r5.xyz = r1.xyz * r0.yxy + r5.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
