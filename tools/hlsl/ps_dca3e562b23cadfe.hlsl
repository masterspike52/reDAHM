// ps_dca3e562b23cadfe.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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

    r2 = r0.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r18.yzw = tex2D(Texture2D_3, r2.xy).xyw;
    ps = r0.w;
    r9.xy = r0.wz * 4.0;
    ps = UniformVector_1.x * ps;
    r2.xy = r0.xy * UniformScalar_0.xx;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.y = ps;
    ps = rsqrt(abs(r5.x));
    r18.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r15.xyw = r18.yzx * float3(4.0, 1.0, -0.125);
    r5.w = ps;
    r5.xy = r8.xy * r15.ww + r0.wz;
    ps = r11.x;
    r5.z = -r5.y + 1.0;
    ps = abs(r7.x) * ps;
    r10.yzw = r5.wxz * UniformVector_1.yxy;
    r9.z = ps;
    ps = r11.y;
    r3 = r10.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r20 = float4((r10.wzxy >= 0.5));
    r9.w = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r10.wzxy;
    r7.z = ps;
    r3 = r3.yxzw * r20.yxzw + r10.zwxy;
    ps = 2.5 * r5.y;
    r3 = r3 + r3;
    r7.w = ps;
    r13.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r19 = tex2D(Texture2D_2, r3.xy);
    r21 = tex2D(Texture2D_2, r3.zw);
    r3.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_6, r2.zw).xyz;
    r10.xyw = tex2D(Texture2D_1, r7.zw).xyz;
    r2.yzw = tex2D(Texture2D_0, r2.xy).xyw;
    r5.x = tex2D(Texture2D_3, r9.xy).z;
    r9 = tex2D(Texture2D_3, r0.wz).xywz;
    ps = r6.w;
    r5.y = saturate(r4.w * 0.0001);
    ps = 1e+01 * ps;
    r16.w = -r6.w + UniformScalar_8.x;
    r2.x = saturate(ps);
    ps = r1.z;
    r7.xy = r0.wz * UniformVector_3.xy;
    r17.x = r9.x * 4.0 - 4.0;
    ps = 0.1 + ps;
    r0.w = r5.x * r6.w;
    r5.x = ps;
    r11.xy = r2.yz * 2.0 - 1.0;
    ps = r10.w + r10.w;
    r10.z = dot(r1.zxy, r1.zxy);
    r3.x = ps;
    ps = r9.y + r9.y;
    r16.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r14.x = ps;
    ps = 5.0 * r5.x;
    r14.yz = r10.xy * 4.0;
    r5.x = saturate(ps);
    ps = r18.w;
    r12.w = float((UniformScalar_7.x >= 1.0));
    ps = r9.z * ps;
    r12 = r16 * r12;
    r6.x = ps;
    ps = (-1.0) - -r6.x;
    r5.z = r12.w + r6.w;
    r16.x = ps;
    ps = 1.0 - r5.x;
    r3.yzw = r3.ywz + r3.ywz;
    r0.z = ps;
    ps = 1.0 - r5.y;
    r10.xyw = r14.yxz - 2.0;
    r0.y = ps;
    ps = UniformScalar_1.x * r0.y;
    r6.yw = r0.zz * ModShadowGroupColor.xy;
    r0.x = ps;
    ps = -r5.z;
    r3 = r3.xywz - 1.0;
    ps = r6.z + ps;
    r11.z = dot(r20.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r11.w = dot(r20.zww, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.w = (r11.w == 0.0) ? r21.x : r21.y;
    r5.x = (r11.z == 0.0) ? r19.x : r19.y;
    ps = UniformScalar_9.x;
    r20 = r11.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r5.x = (r20.w == 0.0) ? r19.z : r5.x;
    r5.w = (r20.y == 0.0) ? r21.z : r5.w;
    r6.z = (r20.z == 0.0) ? r21.w : r5.w;
    r5.w = (r20.x == 0.0) ? r19.w : r5.x;
    ps = max(r5.y, r5.z);
    r5.x = max(r6.z, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xy = min(r5.xy, float2(0.3, 1.0));
    r5.z = ps;
    ps = r10.y;
    r5.y = saturate(r5.y * r5.z);
    ps = r18.z + ps;
    r11.z = -r5.y + 1.0;
    r17.y = ps;
    ps = r3.x;
    r11.xzw = r0.wxx * r11.zxy;
    r5.y = ps;
    ps = 3.3333333 * r5.x;
    r17.w = float((r11.x >= 0.05));
    r17.z = ps;
    ps = 0.5 * r5.y;
    r5.xz = -r17.zw + 1.0;
    r1.w = ps;
    ps = r3.w;
    r15.z = r2.x * r5.x;
    r5.y = (UniformScalar_8.x > 0.0) ? r5.z : 1.0;
    r8.w = (UniformScalar_8.x >= 0.0) ? r5.y : r5.z;
    ps = -r1.w + ps;
    r16.yzw = r17.xzy + r15.xzy;
    r15.x = ps;
    ps = 1.0 - r5.w;
    r5.xyz = r16.xyz * r16.zzw;
    r13.z = ps;
    ps = rsqrt(abs(r10.z));
    r15.y = r3.y + r5.y;
    r11.y = ps;
    r15.z = r5.z * 2.0 + r3.z;
    ps = 1.0 + r5.x;
    r10.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = abs(r5.y) * abs(r5.y);
    r3 = -r6.zywx + 1.0;
    r5.x = ps;
    ps = r5.y;
    r9.xyz = r11.yyy * r1.xyz;
    ps = r3.x * ps;
    r15.yz = -r10.xw + r15.yz;
    r5.z = ps;
    r13.w = r5.z * r9.w - r5.z;
    ps = 1.0 / r4.w;
    r10.x = r5.x * r5.x;
    r10.w = ps;
    ps = r10.x * r10.x;
    r5.xy = r2.xx * r13.zw;
    r11.x = ps;
    ps = r10.y * r10.w;
    r5.xy = r5.zx + r5.yw;
    r11.y = ps;
    r1.z = saturate(r5.x * 2.5 - 0.5);
    r5.zw = r15.yz * r1.zz - 2.0;
    r2.x = r15.x * r1.z + r1.w;
    ps = r2.w;
    r5.zw = r5.zw + r11.zw;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r6.xy = r5.zw + r14.yz;
    r5.z = ps;
    ps = (-1.0) + r2.x;
    r6.xy = r6.xy * r0.yy;
    r5.w = ps;
    r6.zw = r5.wz * r0.yy + 1.0;
    r6 = (r0.xyyy > 0.0) ? r6.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r0.yyyx >= 0.0) ? r6.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    ps = r10.z * r10.w;
    r5.z = dot(r6.zxy, r6.zxy);
    r11.z = ps;
    ps = rsqrt(abs(r5.z));
    r1.xy = r11.yz + ScreenPositionScaleBias.wz;
    r5.z = ps;
    r10.xyz = r6.xyz * r5.zzz;
    r5.z = dot(r10.zxy, r8.zxy);
    r0.xyz = r10.xyz * r5.zzz;
    r0.xyz = r0.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r9.zxy, r0.zxy));
    ps = log2(r5.x);
    r8.x = r5.y + r5.y;
    r13.z = ps;
    r5.xyw = r13.xyz * float3(0.875, 0.875, 15.0);
    r8.yz = r5.xy * r3.yz;
    r8 = r8.wxyz + float4(-0.5, -0.75, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r4.xyz = tex2D(Texture2D_5, r7.zw).xyz;
    r0.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r5.xyz = tex2D(LightAttenuationTexture, r1.xy).zxy;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = float((UniformScalar_4.x >= 1.0));
    r1.x = float((UniformScalar_4.x > 1.0));
    r0.xyz = (-abs(r1.xxx) >= 0.0) ? r0.xyz : 1.0;
    r0.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = LightColor.x * r5.y;
    r0.yzw = r12.xyz * r0.xyz;
    r0.x = ps;
    ps = LightColor.y * r5.z;
    r3.xyz = r0.yzw * r6.www;
    r0.y = ps;
    r1.xyw = r3.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = LightColor.z * r5.x;
    r1.xyw = r11.xxx * r1.xyw;
    r0.z = ps;
    ps = pow(2.0, r5.w);
    r1.xyw = r1.xyw * r1.zzz;
    r6.w = ps;
    ps = r1.x;
    r5.w = saturate(dot(r10.zyx, r9.zyx));
    r0.w = saturate(r3.w * 0.2 + r8.y);
    ps = r6.w * ps;
    r5.x = r8.z * r8.w;
    r1.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    ps = r1.y;
    r4.xyz = r0.www * r4.xyz;
    ps = r6.w * ps;
    r2.xyz = r4.xyz * r2.www;
    r1.y = ps;
    ps = r1.w;
    r3.xyz = r3.xyz - r2.xyz;
    r2.xyz = r3.xyz * r1.zzz + r2.xyz;
    ps = r6.w * ps;
    r6.xyz = r2.xyz * r6.xyz;
    r1.z = ps;
    r6.xy = r6.xy * r5.ww + r1.xy;
    r6.z = r6.z * r5.w + r1.z;
    r6.xyz = r0.xyz * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
