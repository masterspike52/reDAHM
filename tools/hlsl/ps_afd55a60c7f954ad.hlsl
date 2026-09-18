// ps_afd55a60c7f954ad.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
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

    r8.xy = r0.wz * UniformVector_3.xy;
    r5 = r0.wzzw * float4(6.0, 6.0, 4.0, 4.0);
    r10.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r5.w = tex2D(Texture2D_3, r5.wz).z;
    r8.xyz = tex2D(Texture2D_3, r5.xy).yxw;
    r15 = tex2D(Texture2D_3, r0.wz).xywz;
    r5.z = -r0.z + 1.0;
    ps = -r6.w;
    r5.y = r1.z + 0.1;
    ps = UniformScalar_8.x + ps;
    r11.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r13.z = ps;
    ps = r4.x;
    r1.w = float((UniformScalar_7.x >= 1.0));
    ps = ScreenPositionScaleBias.x * ps;
    r3.w = float((UniformScalar_4.x >= 1.0));
    r13.x = ps;
    ps = r4.y;
    r8.w = dot(r3.zxy, r3.zxy);
    ps = ScreenPositionScaleBias.y * ps;
    r5.x = r4.w - 4e+02;
    r13.y = ps;
    ps = 0.00022222222 * r5.x;
    r9.w = float((UniformScalar_4.x > 1.0));
    r19.x = saturate(ps);
    ps = 5.0 * r5.y;
    r6.x = r8.z * r15.z;
    r6.y = saturate(ps);
    r9.xyz = (-abs(r9.www) >= 0.0) ? r9.xyz : 1.0;
    ps = rsqrt(abs(r8.w));
    r11.xyz = r11.xyz * r10.xyz;
    r5.x = ps;
    r9.xyz = (-abs(r3.www) >= 0.0) ? 1.0 : r9.xyz;
    r5.y = r13.z * r1.w + r6.w;
    ps = r5.w;
    r5.y = -r5.y + r6.z;
    ps = r6.w * ps;
    r5.y = max(r5.y, UniformScalar_9.x);
    r11.w = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.w = min(r5.y, 1.0);
    r5.y = ps;
    ps = r5.x;
    r5.y = saturate(r5.w * r5.y);
    ps = r3.x * ps;
    r9.w = -r5.y + 1.0;
    r10.x = ps;
    ps = r5.x;
    r11 = r11 * r9;
    ps = r3.y * ps;
    r6.z = float((r11.w >= 0.05));
    r10.y = ps;
    ps = r5.x;
    r19.yzw = -r6.yxz + 1.0;
    ps = r3.z * ps;
    r9.xz = r19.xz * float2(-0.125, 0.2);
    r10.z = ps;
    r5.xy = r10.xy * r9.xx + r0.wz;
    ps = r0.w;
    r5.w = -r5.y + 1.0;
    ps = UniformVector_1.x * ps;
    r3.yzw = r5.zxw * UniformVector_1.yxy;
    r3.x = ps;
    r12 = r3.wzxy - 0.5;
    r17 = float4((r3.wzxy >= 0.5));
    ps = 2.5 * r5.x;
    r12 = r12 - r3.wzxy;
    r16.x = ps;
    r3 = r12.yxzw * r17.yxzw + r3.zwxy;
    ps = 2.5 * r5.y;
    r3 = r3.zwxy + r3.zwxy;
    r16.y = ps;
    r21 = tex2D(Texture2D_2, r3.xy);
    r5.xyw = tex2D(Texture2D_1, r16.xy).xyz;
    r20.x = r15.x * 4.0 - 4.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.x = r15.y + r15.y;
    r9.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.zw = r5.xy * 4.0;
    r9.w = ps;
    ps = 1.0 / r4.w;
    r9.yw = r9.yw * abs(r7.xy);
    r5.x = ps;
    ps = r5.w + r5.w;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r12.y = ps;
    r7.yz = r13.xy * r5.xx + ScreenPositionScaleBias.wz;
    r5.x = (UniformScalar_8.x > 0.0) ? r19.w : 1.0;
    r14.w = (UniformScalar_8.x >= 0.0) ? r5.x : r19.w;
    r18.x = dot(r17.yxx, float3(1.0, 1.0, 1.0));
    r18.y = dot(r17.zww, float3(1.0, 1.0, 1.0));
    r5.x = (r18.y == 0.0) ? r21.x : r21.y;
    ps = r6.w;
    r17 = r18.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.x = (r17.y == 0.0) ? r21.z : r5.x;
    r20.w = (r17.z == 0.0) ? r21.w : r5.x;
    ps = 1e+01 * ps;
    r5.w = max(r20.w, 0.0);
    r5.x = saturate(ps);
    ps = 0.0001 * r4.w;
    r13 = r12.xzwy + float4(-2.0, -2.0, -2.0, -1.0);
    r6.w = saturate(ps);
    ps = r13.x;
    r5.w = min(r5.w, 0.3);
    ps = r8.x + ps;
    r20.z = r5.w * 3.3333333;
    r20.y = ps;
    ps = 4.0 * r8.y;
    r3.xy = -r20.wz + 1.0;
    r14.x = ps;
    ps = 1.0 * r8.x;
    r14.z = r5.x * r3.y;
    r14.y = ps;
    ps = (-1.0) - -r6.x;
    r8.yzw = r20.xzy + r14.xzy;
    r8.x = ps;
    r14.xyz = r8.xyz * r8.zzw;
    r7.xw = r14.wx + float2(-0.5, 1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r7.xyz = tex2D(LightAttenuationTexture, r7.yz).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r9.yw).xy;
    r15.xyz = tex2D(Texture2D_5, r16.xy).xyz;
    r16 = tex2D(Texture2D_2, r3.zw);
    r8.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r3.yzw = tex2D(Texture2D_0, r5.yz).xyw;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.z = dot(r2.zxy, r2.zxy);
    r4.xy = r3.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(-r5.z + 1.0);
    r5.z = ps;
    ps = log2(r5.y);
    r6.xyz = r5.zzz * -SpotDirection.xyz;
    r5.z = ps;
    r5.y = dot(r6.zxy, r2.zxy);
    ps = r8.x + r8.x;
    r6.xy = r19.yy * ModShadowGroupColor.xy;
    r2.y = ps;
    r6.z = (r18.x == 0.0) ? r16.x : r16.y;
    r6.z = (r17.w == 0.0) ? r16.z : r6.z;
    r0.x = (r17.x == 0.0) ? r16.w : r6.z;
    ps = 1.0 - r0.x;
    r0.w = r7.w * r3.x;
    r0.y = ps;
    r0.z = r0.w * r15.w - r0.w;
    ps = r8.z + r8.z;
    r0.yz = r5.xx * r0.yz;
    r2.z = ps;
    ps = r8.y + r8.y;
    r0.xy = r0.wy + r0.zx;
    r2.w = ps;
    r0.x = saturate(r0.x * 2.5 - 0.5);
    ps = r13.w;
    r2.x = r0.y + r0.y;
    r5.x = ps;
    ps = 0.5 * r5.x;
    r16 = r2.xywz + float4(-0.75, -1.0, -1.0, -1.0);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r13.x = r16.w - r5.x;
    r5.w = ps;
    ps = 1.0 - r6.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.y;
    r0.yzw = -UniformVector_0.yxz + 1.0;
    r6.y = ps;
    ps = 1.0 - r6.w;
    r2.xyz = r5.www * r1.xyz;
    r6.w = ps;
    r4.w = r14.z * 2.0 + r16.z;
    ps = r16.y;
    r5.w = saturate(r16.x + r9.z);
    ps = r14.y + ps;
    r1.xyz = r5.www * r15.xyz;
    r4.z = ps;
    ps = UniformScalar_1.x * r6.w;
    r13.yz = -r13.yz + r4.zw;
    r6.z = ps;
    r3.x = r13.x * r0.x + r5.x;
    r5.xw = r13.yz * r0.xx - 2.0;
    r4.xy = r6.zz * r4.xy + r5.xw;
    ps = r3.w;
    r1.xyz = r1.xyz * r3.www;
    r5.x = ps;
    ps = (-1.0) + r5.x;
    r4.xy = r4.xy + r12.zw;
    r5.x = ps;
    ps = (-1.0) + r3.x;
    r4.xy = r4.xy * r6.ww;
    r5.w = ps;
    r4.zw = r5.wx * r6.ww + 1.0;
    r3 = (r6.zwww > 0.0) ? r4.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r4 = (r6.zwww >= 0.0) ? r3 : float4(1.0, 0.0, 0.0, 1.0);
    ps = LightColorAndFalloffExponent.w * r5.z;
    r1.w = dot(r4.wyz, r4.wyz);
    r5.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r11.xyz = r11.xyz * r4.xxx;
    r5.x = ps;
    r3.xyz = r11.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r1.w));
    r11.xyz = r11.xyz - r1.xyz;
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r4.xzw = r4.yzw * r5.yyy;
    r4.y = saturate(ps);
    r1.xyz = r11.xyz * r0.xxx + r1.xyz;
    ps = abs(r7.w) * abs(r7.w);
    r5.y = dot(r4.wxz, r10.zxy);
    r5.x = ps;
    ps = r1.x;
    r11.xyz = r4.xzw * r5.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    ps = r0.z * ps;
    r5.y = saturate(dot(r2.zxy, r10.zxy));
    r1.x = ps;
    ps = log2(r5.y);
    r0.z = saturate(dot(r4.wzx, r2.zyx));
    r9.z = ps;
    ps = r1.y;
    r2.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    r5.yz = r2.xy * r6.xy + 0.125;
    ps = r0.y * ps;
    r4.xz = r5.xy * r5.xz;
    r1.y = ps;
    r5.xyz = r4.zzz * r8.xyz + ModShadowColor.xyz;
    ps = r1.z;
    r6.xy = r4.xy * r4.xy;
    ps = r0.w * ps;
    r3.xyz = r6.xxx * r3.xyz;
    r1.z = ps;
    ps = pow(2.0, r2.z);
    r0.xyw = r3.xyz * r0.xxx;
    r6.z = ps;
    ps = pow(2.0, r5.w);
    r6.xzw = r0.xyw * r6.zzz;
    r5.w = ps;
    r0.xy = r1.xy * r0.zz + r6.xz;
    r0.z = r1.z * r0.z + r6.w;
    r0.xyz = r0.xyz * r5.www;
    r0.xyz = r0.xyz * r7.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.yyy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
