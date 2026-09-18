// ps_7efc409dea98fde9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
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
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r8 = r0.wzwz * float4(4.0, 4.0, 6.0, 6.0);
    r10.x = ps;
    r20.yzw = tex2D(Texture2D_3, r8.zw).xyw;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 / r4.w;
    r9.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r9.xy = r9.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = UniformScalar_8.x - r6.w;
    r5.y = r4.w - 4e+02;
    r21.w = ps;
    ps = rsqrt(abs(r5.x));
    r20.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    r13.xyz = r5.xxx * r3.xyz;
    ps = -r0.z;
    r18.xyw = r20.yzx * float3(4.0, 1.0, -0.125);
    r5.xy = r13.xy * r18.ww + r0.wz;
    ps = 1.0 + ps;
    r5.z = -r5.y + 1.0;
    r5.w = ps;
    r10.yzw = r5.wxz * UniformVector_1.yxy;
    r3 = r10.wzxy - 0.5;
    r17 = float4((r10.wzxy >= 0.5));
    ps = 2.5 * r5.x;
    r3 = r3 - r10.wzxy;
    r11.x = ps;
    r3 = r3.yxzw * r17.yxzw + r10.zwxy;
    ps = 2.5 * r5.y;
    r14 = r3 + r3;
    r11.y = ps;
    r22 = tex2D(Texture2D_2, r14.zw);
    r10.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.z = tex2D(Texture2D_3, r8.xy).z;
    r3.xyz = tex2D(Texture2D_1, r11.xy).xzy;
    r9 = tex2D(Texture2D_3, r0.wz).xywz;
    ps = 0.0001 * r4.w;
    r5.y = saturate(ps);
    ps = r1.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r19.x = r9.x * 4.0 - 4.0;
    ps = 0.1 + ps;
    r1.w = r5.z * r6.w;
    r5.z = ps;
    ps = r9.y + r9.y;
    r4.yz = r0.xy * UniformScalar_0.xx;
    r8.x = ps;
    ps = r3.y + r3.y;
    r12.zw = r0.wz * UniformVector_3.xy;
    r8.y = ps;
    ps = 5.0 * r5.z;
    r4.w = float((UniformScalar_7.x >= 1.0));
    r5.z = saturate(ps);
    ps = 1.0 - r5.x;
    r15.yzw = r15.xzy + r15.xzy;
    r5.x = saturate(ps);
    ps = 4.0 * r3.x;
    r5.w = r20.w * r9.z;
    r8.z = ps;
    ps = log2(r5.x);
    r21.xyz = r10.xyz * r2.www;
    r5.x = ps;
    ps = 4.0 * r3.z;
    r2.yzw = -r5.ywz + 1.0;
    r8.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r16 = r8.zwxy + float4(-2.0, -2.0, -2.0, -1.0);
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r10.yz = r2.ww * ModShadowGroupColor.xy;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3 = r21.xzyw * r4.xxxw;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r3.w + r6.w;
    r4.w = ps;
    ps = -r5.x;
    r7.xy = r4.xw * abs(r7.xy);
    ps = r6.z + ps;
    r21.x = dot(r17.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r21.y = dot(r17.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.x = (r21.y == 0.0) ? r22.x : r22.y;
    ps = UniformScalar_9.x;
    r17 = r21.yxxy + float4(-2.0, -3.0, -2.0, -3.0);
    r6.y = ps;
    r5.x = (r17.x == 0.0) ? r22.z : r5.x;
    r10.x = (r17.w == 0.0) ? r22.w : r5.x;
    ps = max(r6.x, r6.y);
    r5.x = max(r10.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xy = min(r5.yx, float2(1.0, 0.3));
    r6.x = ps;
    r10.w = saturate(r5.x * r6.x);
    ps = r16.z;
    r10 = -r10.wxyz + 1.0;
    ps = r20.z + ps;
    r6.x = r1.w * r10.x;
    r19.y = ps;
    ps = 3.3333333 * r5.y;
    r19.w = float((r6.x >= 0.05));
    r19.z = ps;
    r4.xw = -r19.wz + 1.0;
    r5.x = (UniformScalar_8.x > 0.0) ? r4.x : 1.0;
    r15.x = (UniformScalar_8.x >= 0.0) ? r5.x : r4.x;
    r15 = r15.zxyw + float4(-1.0, -0.5, -1.0, -1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r15.yyyy)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r12.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r20 = tex2D(Texture2D_2, r14.xy);
    r14.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r6.xyz = tex2D(Texture2D_0, r4.yz).xyw;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = saturate(r6.w * 1e+01);
    ps = UniformVector_2.x * UniformVector_2.w;
    r0.y = dot(r1.zxy, r1.zxy);
    r22.x = ps;
    ps = UniformVector_2.y * UniformVector_2.w;
    r5.x = float((UniformScalar_4.x >= 1.0));
    r22.y = ps;
    ps = UniformVector_2.z * UniformVector_2.w;
    r6.w = float((UniformScalar_4.x > 1.0));
    r22.z = ps;
    r12.zw = r6.xy * 2.0 - 1.0;
    r7.xyz = (-abs(r6.www) >= 0.0) ? r7.xyz : 1.0;
    r7.xyz = (-abs(r5.xxx) >= 0.0) ? 1.0 : r7.xyz;
    ps = (-1.0) - -r5.w;
    r14.xyz = r22.xyz * r14.xyz;
    r17.x = ps;
    r5.x = (r21.x == 0.0) ? r20.x : r20.y;
    r5.x = (r17.z == 0.0) ? r20.z : r5.x;
    r5.y = (r17.y == 0.0) ? r20.w : r5.x;
    ps = UniformScalar_1.x * r2.y;
    r18.z = r0.x * r4.w;
    r2.x = ps;
    ps = r16.w;
    r17.yzw = r19.xzy + r18.xzy;
    r5.x = ps;
    ps = 0.5 * r5.x;
    r17.xyz = r17.xyz * r17.zzw;
    r6.w = ps;
    ps = 1.0 - r5.y;
    r5.z = r15.z + r17.y;
    r5.x = ps;
    r5.w = r17.z * 2.0 + r15.w;
    ps = rsqrt(abs(r0.y));
    r0.w = r17.x + 1.0;
    r0.y = ps;
    ps = r0.w;
    r1.xyz = r0.yyy * r1.xyz;
    ps = r10.y * ps;
    r15.yz = -r16.xy + r5.zw;
    r5.w = ps;
    r5.z = r5.w * r9.w - r5.w;
    ps = r15.x;
    r5.xz = r0.xx * r5.xz;
    ps = -r6.w + ps;
    r0.xz = r5.xw + r5.yz;
    r15.x = ps;
    r0.z = saturate(r0.z * 2.5 - 0.5);
    r6.w = r15.x * r0.z + r6.w;
    r5.xy = r15.yz * r0.zz - 2.0;
    r5.yz = r2.xx * r12.zw + r5.xy;
    ps = r6.z;
    r7.xyz = r14.xyz * r7.xyz;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r5.yw = r5.yz + r8.zw;
    r5.z = ps;
    ps = (-1.0) + r6.w;
    r5.xy = r5.yw * r2.yy;
    r5.w = ps;
    r5.zw = r5.wz * r2.yy + 1.0;
    r5 = (r2.xyyy > 0.0) ? r5.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r5 = (r2.xyyy >= 0.0) ? r5 : float4(1.0, 0.0, 0.0, 1.0);
    r0.y = dot(r5.wyz, r5.wyz);
    r8.xyz = r7.xyz * r5.xxx;
    r7.xyz = r8.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r0.y));
    r10.x = abs(r0.w) * abs(r0.w);
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r13.zxy);
    r14.xyz = r5.yzw * r5.xxx;
    r13.xyz = r14.xyz * 2.0 - r13.xyz;
    r5.x = saturate(dot(r1.zxy, r13.zxy));
    ps = log2(r5.x);
    r10.y = r0.x + r0.x;
    r12.z = ps;
    r0.xyw = r12.xyz * float3(0.875, 0.875, 15.0);
    r10.zw = r0.xy * r10.zw;
    r10.yzw = r10.yzw + float3(-0.75, 0.125, 0.125);
    r5.x = saturate(r2.z * 0.2 + r10.y);
    ps = r10.x * r10.x;
    r5.w = saturate(dot(r5.wzy, r1.zyx));
    r1.w = ps;
    ps = r10.z * r10.w;
    r1.xyz = r5.xxx * r11.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * r6.zzz;
    ps = r1.w * r1.w;
    r2.xyz = r8.xyz - r1.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r7.xyz;
    r6.yzw = r6.xyz * r0.zzz;
    r1.xyz = r2.xyz * r0.zzz + r1.xyz;
    ps = pow(2.0, r0.w);
    r0.xyz = r1.xyz * r4.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r3.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
