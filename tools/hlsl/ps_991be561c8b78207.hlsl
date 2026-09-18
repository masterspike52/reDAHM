// ps_991be561c8b78207.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    ps = 1e+01 * r6.w;
    r10 = r0.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r1.w = saturate(ps);
    r19.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    ps = r0.w;
    r9.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_1.x * ps;
    r8.xy = r0.wz * 4.0;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.y = ps;
    ps = 1.0 / r4.w;
    r8.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r8.zw = r8.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.x));
    r19.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r14.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r17.xyw = r19.yzx * float3(4.0, 1.0, -0.125);
    r5.w = ps;
    r5.xy = r14.xy * r17.ww + r0.wz;
    ps = r11.x;
    r5.z = -r5.y + 1.0;
    ps = abs(r7.x) * ps;
    r12.yzw = r5.wxz * UniformVector_1.yxy;
    r9.z = ps;
    ps = r11.y;
    r3 = r12.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r22 = float4((r12.wzxy >= 0.5));
    r9.w = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r12.wzxy;
    r11.x = ps;
    r3 = r3.yxzw * r22.yxzw + r12.zwxy;
    ps = 2.5 * r5.y;
    r3 = r3 + r3;
    r11.y = ps;
    r13.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r20 = tex2D(Texture2D_2, r3.xy);
    r21 = tex2D(Texture2D_2, r3.zw);
    r16.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r15.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r5.y = tex2D(Texture2D_3, r8.xy).z;
    r7.yzw = tex2D(Texture2D_1, r11.xy).zxy;
    r8 = tex2D(Texture2D_3, r0.wz).zxyw;
    r3.yzw = tex2D(Texture2D_0, r9.xy).xyw;
    ps = -r6.w;
    r12.x = saturate(r4.w * 0.0001);
    ps = UniformScalar_8.x + ps;
    r5.z = r1.z + 0.1;
    r4.w = ps;
    r9.xy = r3.yz * 2.0 - 1.0;
    r18.x = r8.y * 4.0 - 4.0;
    ps = r8.z + r8.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = 5.0 * r5.z;
    r5.w = r5.y * r6.w;
    r12.z = saturate(ps);
    ps = 1.0 - r5.x;
    r7.zw = r7.zw * 4.0;
    r5.x = saturate(ps);
    ps = r19.w;
    r5.z = float((UniformScalar_7.x >= 1.0));
    ps = r8.w * ps;
    r4.xyz = r15.xyz * r2.www;
    r12.y = ps;
    ps = log2(r5.x);
    r16.x = r12.y - 1.0;
    r5.x = ps;
    ps = r7.y + r7.y;
    r2.yzw = -r12.xyz + 1.0;
    r7.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r15 = r7.zwxy + float4(-2.0, -2.0, -2.0, -1.0);
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r12.yz = r2.ww * ModShadowGroupColor.xy;
    r5.y = ps;
    r4 = r4.xzyw * r5.yyyz;
    r5.x = r4.w + r6.w;
    ps = -r5.x;
    r8.yzw = r16.ywz + r16.ywz;
    ps = r6.z + ps;
    r9.z = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r9.w = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r2.x = (r9.w == 0.0) ? r21.x : r21.y;
    r5.y = (r9.z == 0.0) ? r20.x : r20.y;
    ps = UniformScalar_9.x;
    r6 = r9.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r5.y = (r6.w == 0.0) ? r20.z : r5.y;
    r2.x = (r6.y == 0.0) ? r21.z : r2.x;
    r12.x = (r6.z == 0.0) ? r21.w : r2.x;
    r6.x = (r6.x == 0.0) ? r20.w : r5.y;
    ps = max(r5.x, r5.z);
    r5.y = max(r12.x, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xy = min(r5.xy, float2(1.0, 0.3));
    r5.z = ps;
    r12.w = saturate(r5.x * r5.z);
    ps = r15.z;
    r12 = -r12.wxyz + 1.0;
    ps = r19.z + ps;
    r5.z = r5.w * r12.x;
    r18.y = ps;
    ps = 3.3333333 * r5.y;
    r18.w = float((r5.z >= 0.05));
    r18.z = ps;
    r5.xy = -r18.zw + 1.0;
    r17.z = r1.w * r5.x;
    r5.z = (UniformScalar_8.x > 0.0) ? r5.y : 1.0;
    r12.x = (UniformScalar_8.x >= 0.0) ? r5.z : r5.y;
    r16.yzw = r18.xzy + r17.xzy;
    r5.xyz = r16.xyz * r16.zzw;
    ps = 1.0 + r5.x;
    r5.w = ps;
    ps = 1.0 - r6.x;
    r6.w = r5.w * r12.y;
    r6.y = ps;
    r6.z = r6.w * r8.x - r6.w;
    r6.yz = r1.ww * r6.yz;
    ps = UniformScalar_1.x * r2.y;
    r6.xw = r6.yw + r6.xz;
    r2.x = ps;
    r6.w = saturate(r6.w * 2.5 - 0.5);
    ps = r15.w;
    r8.x = r6.x + r6.x;
    r5.x = ps;
    ps = 0.5 * r5.x;
    r8 = r8.ywzx + float4(-1.0, -1.0, -1.0, -0.75);
    r6.x = ps;
    ps = r8.z;
    r6.y = r8.x + r5.y;
    r6.z = r5.z * 2.0 + r8.y;
    ps = -r6.x + ps;
    r5.yz = -r15.xy + r6.yz;
    r5.x = ps;
    r3.x = r5.x * r6.w + r6.x;
    r5.xy = r5.yz * r6.ww - 2.0;
    r6.xy = r2.xx * r9.xy + r5.xy;
    ps = r3.w;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r6.xy = r6.xy + r7.zw;
    r5.x = ps;
    ps = (-1.0) + r3.x;
    r7.xy = r6.xy * r2.yy;
    r5.z = ps;
    r7.zw = r5.zx * r2.yy + 1.0;
    r7 = (r2.xyyy > 0.0) ? r7.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r7 = (r2.xyyy >= 0.0) ? r7 : float4(1.0, 0.0, 0.0, 1.0);
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r7.wyz, r7.wyz);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r8.xyz = r5.yyy * r1.xyz;
    r5.x = ps;
    r9.xyz = r7.yzw * r5.xxx;
    r5.x = dot(r9.zxy, r14.zxy);
    r5.xyz = r9.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r14.xyz;
    r5.z = saturate(dot(r8.zxy, r5.zxy));
    ps = log2(r5.z);
    r5.xy = r0.wz * UniformVector_3.xy;
    r13.z = ps;
    r6.xyz = r13.zxy * float3(15.0, 0.875, 0.875);
    r12.yz = r6.yz * r12.zw;
    r7.yzw = r12.xyz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    r0.yzw = tex2D(Texture2D_5, r11.xy).xyz;
    r1.xyz = tex2D(Texture2D_7, r5.xy).xyz;
    r10.xyz = tex2D(Texture2D_6, r10.zw).xyz;
    ps = UniformVector_2.x * UniformVector_2.w;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r11.x = ps;
    ps = UniformVector_2.y * UniformVector_2.w;
    r0.x = float((UniformScalar_4.x >= 1.0));
    r11.y = ps;
    ps = UniformVector_2.z * UniformVector_2.w;
    r1.w = float((UniformScalar_4.x > 1.0));
    r11.z = ps;
    ps = -UniformVector_0.x;
    r10.xyz = r11.xyz * r10.xyz;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r1.xyz : 1.0;
    r1.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r1.xyz;
    ps = 1.0 + ps;
    r1.xyz = r10.xyz * r1.xyz;
    r0.x = ps;
    r1.w = saturate(r2.z * 0.2 + r8.w);
    ps = -UniformVector_0.y;
    r0.yzw = r1.www * r0.yzw;
    ps = 1.0 + ps;
    r2.xyz = r0.yzw * r3.www;
    r0.y = ps;
    ps = -UniformVector_0.z;
    r3.xyz = r1.xyz * r7.xxx;
    r1.xyz = r3.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = 1.0 + ps;
    r3.xyz = r3.xyz - r2.xyz;
    r0.z = ps;
    r2.xyz = r3.xyz * r6.www + r2.xyz;
    ps = abs(r5.w) * abs(r5.w);
    r0.xyz = r2.xyz * r0.xyz;
    r0.w = ps;
    ps = r0.w * r0.w;
    r5.w = saturate(dot(r9.zyx, r8.zyx));
    r7.x = ps;
    r6.yz = r7.xz * r7.xw;
    r5.xyz = r6.zzz * r5.xyz + ModShadowColor.xyz;
    r1.xyz = r6.yyy * r1.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r1.xyz * r6.www;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r4.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
