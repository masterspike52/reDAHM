// ps_8bc72de04a098d0a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r9 = r0.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r12.x = ps;
    r19.yzw = tex2D(Texture2D_3, r9.xy).xyw;
    r5.w = -r0.z + 1.0;
    ps = r0.x;
    r11.xy = r0.wz * 4.0;
    ps = UniformScalar_0.x * ps;
    r10.xy = r0.wz * UniformVector_3.xy;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r13.y = ps;
    ps = rsqrt(abs(r5.x));
    r19.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = r0.y;
    r8.xyz = r5.xxx * r3.xyz;
    ps = UniformScalar_0.x * ps;
    r17.xyw = r19.yzx * float3(4.0, 1.0, -0.125);
    r11.w = ps;
    r5.xy = r8.xy * r17.ww + r0.wz;
    ps = r13.x;
    r5.z = -r5.y + 1.0;
    ps = abs(r7.x) * ps;
    r12.yzw = r5.wxz * UniformVector_1.yxy;
    r10.z = ps;
    ps = r13.y;
    r3 = r12.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r22 = float4((r12.wzxy >= 0.5));
    r10.w = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r12.wzxy;
    r7.x = ps;
    r3 = r3.yxzw * r22.yxzw + r12.zwxy;
    ps = 2.5 * r5.y;
    r3 = r3 + r3;
    r7.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r10.zw).xy;
    r20 = tex2D(Texture2D_2, r3.xy);
    r21 = tex2D(Texture2D_2, r3.zw);
    r9.xyz = tex2D(Texture2D_6, r9.zw).xyz;
    r15.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r3.yzw = tex2D(Texture2D_0, r11.zw).xyw;
    r1.w = tex2D(Texture2D_3, r11.xy).z;
    r13 = tex2D(Texture2D_3, r0.wz).zwxy;
    r5.yzw = tex2D(Texture2D_1, r7.xy).zxy;
    ps = -r6.w;
    r5.x = r1.z + 0.1;
    ps = UniformScalar_8.x + ps;
    r11.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r15.w = ps;
    ps = r4.x;
    r11.w = float((UniformScalar_7.x >= 1.0));
    ps = ScreenPositionScaleBias.x * ps;
    r0.x = float((UniformScalar_4.x >= 1.0));
    r14.y = ps;
    r18.x = r13.z * 4.0 - 4.0;
    ps = 5.0 * r5.x;
    r0.z = dot(r1.zxy, r1.zxy);
    r14.x = saturate(ps);
    ps = r13.w + r13.w;
    r0.y = r1.w * r6.w;
    r16.x = ps;
    ps = 4.0 * r5.z;
    r5.x = float((UniformScalar_4.x > 1.0));
    r10.x = ps;
    ps = 4.0 * r5.w;
    r16.yzw = r10.ywz + r10.ywz;
    r10.y = ps;
    r5.xzw = (-abs(r5.xxx) >= 0.0) ? r15.xyz : 1.0;
    ps = rsqrt(abs(r0.z));
    r15.xyz = r11.xyz * r9.xyz;
    r0.z = ps;
    ps = r3.y + r3.y;
    r9.xyz = r0.zzz * r1.xyz;
    r10.z = ps;
    r11.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r5.xzw;
    ps = r3.z + r3.z;
    r16 = r16.xywz + float4(-2.0, -1.0, -1.0, -1.0);
    r10.w = ps;
    ps = r19.w;
    r11 = r15 * r11;
    ps = r13.y * ps;
    r5.x = r11.w + r6.w;
    r0.x = ps;
    ps = -r5.x;
    r15 = r10 + float4(-2.0, -2.0, -1.0, -1.0);
    ps = r6.z + ps;
    r0.z = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r0.w = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.z = (r0.w == 0.0) ? r21.x : r21.y;
    r5.x = (r0.z == 0.0) ? r20.x : r20.y;
    ps = UniformScalar_9.x;
    r1 = r0.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r6.y = ps;
    r5.x = (r1.w == 0.0) ? r20.z : r5.x;
    r5.z = (r1.y == 0.0) ? r21.z : r5.z;
    r0.w = (r1.z == 0.0) ? r21.w : r5.z;
    r5.w = (r1.x == 0.0) ? r20.w : r5.x;
    ps = max(r6.x, r6.y);
    r5.z = max(r0.w, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xz = min(r5.xz, float2(1.0, 0.3));
    r6.x = ps;
    ps = 1e+01 * r6.w;
    r14.z = saturate(r4.w * 0.0001);
    r3.x = saturate(ps);
    ps = r16.x;
    r14.w = saturate(r5.x * r6.x);
    ps = r19.z + ps;
    r6.yzw = -r14.zxw + 1.0;
    r18.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = r0.y * r6.w;
    r0.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r18.w = float((r6.x >= 0.05));
    r0.z = ps;
    ps = 3.3333333 * r5.z;
    r1 = -r0.wyzx + 1.0;
    r18.z = ps;
    ps = r4.y;
    r7.zw = -r18.zw + 1.0;
    ps = ScreenPositionScaleBias.y * ps;
    r17.z = r3.x * r7.z;
    r14.z = ps;
    r5.x = (UniformScalar_8.x > 0.0) ? r7.w : 1.0;
    r8.w = (UniformScalar_8.x >= 0.0) ? r5.x : r7.w;
    ps = (-1.0) - -r0.x;
    r17.yzw = r18.xzy + r17.xzy;
    r17.x = ps;
    ps = r5.y + r5.y;
    r17.xyz = r17.xyz * r17.zzw;
    r17.w = ps;
    r0.y = r17.z * 2.0 + r16.z;
    ps = 1.0 - r5.w;
    r13.zw = r17.xw + float2(1.0, -1.0);
    r5.x = ps;
    ps = UniformScalar_1.x * r6.y;
    r5.z = r13.z * r1.x;
    r6.x = ps;
    r5.y = r5.z * r13.x - r5.z;
    ps = r16.y;
    r5.xy = r3.xx * r5.xy;
    ps = r17.y + ps;
    r13.xy = r5.xz + r5.wy;
    r0.x = ps;
    ps = abs(r13.z) * abs(r13.z);
    r5.xy = r13.wy * float2(0.5, 2.5);
    r14.x = ps;
    ps = (-0.5) + r5.y;
    r0.yz = -r15.xy + r0.xy;
    r0.w = saturate(ps);
    ps = 1.0 / r4.w;
    r0.x = r16.w - r5.x;
    r14.w = ps;
    r3.x = r0.x * r0.w + r5.x;
    r5.xy = r0.yz * r0.ww - 2.0;
    r5.yz = r6.xx * r15.zw + r5.xy;
    ps = r3.w;
    r4.xyw = r14.yzx * r14.wwx;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r5.yw = r5.yz + r10.xy;
    r5.z = ps;
    ps = (-1.0) + r3.x;
    r5.xy = r5.yw * r6.yy;
    r5.w = ps;
    r5.zw = r5.wz * r6.yy + 1.0;
    r5 = (r6.xyyy > 0.0) ? r5.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r6.yyyx >= 0.0) ? r5.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r0.xy = r4.xy + ScreenPositionScaleBias.wz;
    r5.x = ps;
    r10.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r10.zxy, r8.zxy);
    r5.xyz = r10.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r9.zxy, r5.zxy));
    ps = log2(r5.x);
    r8.x = r13.x + r13.x;
    r12.z = ps;
    r5.xyw = r12.xyz * float3(0.875, 0.875, 15.0);
    r8.yz = r5.xy * r1.yz;
    r8 = r8.wxyz + float4(-0.5, -0.75, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r7.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = r0.xyz * r2.www;
    ps = r4.w * r4.w;
    r4.xyz = r11.xyz * r6.www;
    r6.w = ps;
    r2.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r2.xyz = r6.www * r2.xyz;
    ps = pow(2.0, r5.w);
    r1.xyz = r2.xyz * r0.www;
    r6.w = ps;
    ps = r1.x;
    r5.w = saturate(dot(r10.zyx, r9.zyx));
    r1.w = saturate(r1.w * 0.2 + r8.y);
    ps = r6.w * ps;
    r2.x = r8.z * r8.w;
    r1.x = ps;
    r5.xyz = r2.xxx * r5.xyz + ModShadowColor.xyz;
    ps = r1.y;
    r2.xyz = r1.www * r7.xyz;
    ps = r6.w * ps;
    r2.xyz = r2.xyz * r3.www;
    r1.y = ps;
    ps = r1.z;
    r3.xyz = r4.xyz - r2.xyz;
    r2.xyz = r3.xyz * r0.www + r2.xyz;
    ps = r6.w * ps;
    r6.xyz = r2.xyz * r6.xyz;
    r1.z = ps;
    r6.xy = r6.xy * r5.ww + r1.xy;
    r6.z = r6.z * r5.w + r1.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
