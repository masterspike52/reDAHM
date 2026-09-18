// ps_38824b4f360de3e9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041800 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r1.w;
    r9 = r1.wzwz * float4(4.0, 4.0, 6.0, 6.0);
    r10.x = ps;
    r20.yzw = tex2D(Texture2D_3, r9.zw).xyw;
    r12.x = tex2D(ShadowTexture, r0.xy).x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = r1.xy * UniformScalar_0.xx;
    r10.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r10.z = ps;
    ps = 1.0 / r5.w;
    r6.y = r5.w - 4e+02;
    r12.w = ps;
    ps = 0.00022222222 * r6.y;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    r20.x = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r6.xyz = r12.yzx * r12.wwx;
    r6.w = ps;
    ps = r10.y;
    r15.xyz = r6.www * r4.xyz;
    ps = abs(r8.x) * ps;
    r18.xyw = r20.yzx * float3(4.0, 1.0, -0.125);
    r4.z = ps;
    r0.xy = r15.xy * r18.ww + r1.wz;
    ps = 1e+01 * r7.w;
    r0.w = -r1.z + 1.0;
    r2.w = saturate(ps);
    ps = r10.z;
    r0.z = -r0.y + 1.0;
    ps = abs(r8.y) * ps;
    r10.yzw = r0.wxz * UniformVector_1.yxy;
    r4.w = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r8 = r10.wzxy - 0.5;
    r4.x = ps;
    ps = ScreenPositionScaleBias.z + r6.y;
    r22 = float4((r10.wzxy >= 0.5));
    r4.y = ps;
    ps = 2.5 * r0.x;
    r8 = r8 - r10.wzxy;
    r13.x = ps;
    r8 = r8.yxzw * r22.yxzw + r10.zwxy;
    ps = 2.5 * r0.y;
    r8 = r8 + r8;
    r13.y = ps;
    r14.yz = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r21 = tex2D(Texture2D_2, r8.xy);
    r23 = tex2D(Texture2D_2, r8.zw);
    r8.xzw = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r11.xy).xyw;
    r6.x = tex2D(Texture2D_3, r9.xy).z;
    r9 = tex2D(Texture2D_3, r1.wz).zwxy;
    r0.yzw = tex2D(Texture2D_1, r13.xy).zxy;
    ps = UniformScalar_8.x - r7.w;
    r24.w = ps;
    ps = r5.w;
    r6.y = r2.z + 0.1;
    r19.x = r9.z * 4.0 - 4.0;
    ps = 0.0001 * ps;
    r4.w = r6.x * r7.w;
    r4.y = saturate(ps);
    r11.xy = r5.xy * 2.0 - 1.0;
    ps = r9.w + r9.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    ps = 5.0 * r6.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r4.x = saturate(ps);
    ps = 1.0 - r6.x;
    r8.y = float((UniformScalar_7.x >= 1.0));
    r6.y = saturate(ps);
    ps = 4.0 * r0.z;
    r10.yzw = r10.xzy + r10.xzy;
    r0.z = ps;
    ps = 4.0 * r0.w;
    r12.z = r20.w * r9.y;
    r0.w = ps;
    ps = log2(r6.y);
    r17.x = r12.z - 1.0;
    r6.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r4.yz = -r4.yx + 1.0;
    r4.x = ps;
    ps = (-2.0) + r0.x;
    r24.xyz = r6.zzz * r8.xzw;
    r16.x = ps;
    ps = pow(2.0, r4.x);
    r12.xy = r4.zz * ModShadowGroupColor.xy;
    r8.x = ps;
    ps = (-2.0) + r0.z;
    r8 = r24.xzyw * r8.xxxy;
    r16.y = ps;
    ps = (-2.0) + r0.w;
    r6.y = r8.w + r7.w;
    r16.z = ps;
    ps = -r6.y;
    r11.z = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    ps = r7.z + ps;
    r11.w = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r6.z = (r11.w == 0.0) ? r23.x : r23.y;
    r6.y = (r11.z == 0.0) ? r21.x : r21.y;
    ps = r7.x;
    r22 = r11.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r7.y = ps;
    r6.y = (r22.w == 0.0) ? r21.z : r6.y;
    r6.z = (r22.y == 0.0) ? r23.z : r6.z;
    r12.w = (r22.z == 0.0) ? r23.w : r6.z;
    r7.x = (r22.x == 0.0) ? r21.w : r6.y;
    ps = UniformScalar_9.x;
    r6.z = max(r12.w, 0.0);
    r7.z = ps;
    ps = max(r7.y, r7.z);
    r12 = -r12.wxyz + 1.0;
    r6.y = ps;
    ps = 1.0 / UniformScalar_10.x;
    r6.yz = min(r6.yz, float2(1.0, 0.3));
    r7.y = ps;
    ps = UniformScalar_1.x * r4.y;
    r7.y = saturate(r6.y * r7.y);
    r4.x = ps;
    ps = r16.x;
    r11.z = -r7.y + 1.0;
    ps = r20.z + ps;
    r11.xyz = r4.xxw * r11.xyz;
    r19.y = ps;
    ps = 3.3333333 * r6.z;
    r19.w = float((r11.z >= 0.05));
    r19.z = ps;
    r6.yz = -r19.zw + 1.0;
    r18.z = r2.w * r6.y;
    r7.y = (UniformScalar_8.x > 0.0) ? r6.z : 1.0;
    r14.x = (UniformScalar_8.x >= 0.0) ? r7.y : r6.z;
    r17.yzw = r19.xzy + r18.xzy;
    ps = r0.y + r0.y;
    r17.yzw = r17.xyz * r17.zzw;
    r17.x = ps;
    r9.zw = r17.xy + float2(-1.0, 1.0);
    ps = 1.0 - r7.x;
    r7.w = r9.w * r12.x;
    r6.y = ps;
    r6.z = r7.w * r9.x - r7.w;
    r7.yz = r2.ww * r6.yz;
    r9.xy = r7.yw + r7.xz;
    ps = r9.x + r9.x;
    r6.yz = r9.yz * float2(2.5, 0.5);
    r10.x = ps;
    ps = (-0.5) + r6.y;
    r10 = r10.ywzx + float4(-1.0, -1.0, -1.0, -0.75);
    r7.w = saturate(ps);
    ps = r10.z;
    r7.x = r10.x + r17.z;
    r7.y = r17.w * 2.0 + r10.y;
    ps = -r6.z + ps;
    r16.yz = -r16.yz + r7.xy;
    r16.x = ps;
    r7.xy = r16.yz * r7.ww - 2.0;
    r5.w = r16.x * r7.w + r6.z;
    ps = r5.z;
    r7.xy = r7.xy + r11.xy;
    r6.z = ps;
    ps = (-1.0) + r6.z;
    r7.xy = r7.xy + r0.zw;
    r6.y = ps;
    ps = (-1.0) + r5.w;
    r0.xy = r7.xy * r4.yy;
    r6.z = ps;
    r0.zw = r6.zy * r4.yy + 1.0;
    r0 = (r4.xyyy > 0.0) ? r0.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r0 = (r4.yyyx >= 0.0) ? r0.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r6.y = dot(r0.zxy, r0.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r10.xyz = r6.zzz * r2.xyz;
    r6.y = ps;
    r11.xyz = r0.xyz * r6.yyy;
    r6.y = dot(r11.zxy, r15.zxy);
    r6.yzw = r11.xyz * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r15.xyz;
    r6.w = saturate(dot(r10.zxy, r6.wyz));
    ps = log2(r6.w);
    r6.yz = r1.wz * UniformVector_3.xy;
    r14.w = ps;
    r7.xyz = r14.yzw * float3(0.875, 0.875, 15.0);
    r14.yz = r7.xy * r12.yz;
    r2.yzw = r14.xyz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.yyyy)) clip(-1.0);
    r12.xyz = tex2D(Texture2D_5, r13.xy).xyz;
    r13.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_7, r6.yz).xyz;
    ps = UniformVector_2.x * UniformVector_2.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_2.y * UniformVector_2.w;
    r6.w = float((UniformScalar_4.x >= 1.0));
    r14.y = ps;
    ps = UniformVector_2.z * UniformVector_2.w;
    r6.y = float((UniformScalar_4.x > 1.0));
    r14.z = ps;
    r1.xyz = (-abs(r6.yyy) >= 0.0) ? r1.xyz : 1.0;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r14.xyz * r13.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * -SpotDirection.xyz;
    r1.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = -UniformVector_0.x;
    r1.xyz = r13.xyz * r1.xyz;
    ps = 1.0 + ps;
    r6.y = dot(r6.zxy, r3.zxy);
    r6.x = ps;
    r6.z = saturate(r12.w * 0.2 + r10.w);
    ps = -UniformVector_0.y;
    r3.xyz = r6.zzz * r12.xyz;
    ps = 1.0 + ps;
    r0.xyz = r3.xyz * r5.zzz;
    r6.z = ps;
    ps = -UniformVector_0.z;
    r3.xyz = r1.xyz * r0.www;
    r1.xyz = r3.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = 1.0 + ps;
    r3.xyz = r3.xyz - r0.xyz;
    r6.w = ps;
    r0.xyz = r3.xyz * r7.www + r0.xyz;
    ps = -SpotAngles.x - -r6.y;
    r0.xyz = r0.xyz * r6.xzw;
    r6.x = ps;
    ps = abs(r9.w) * abs(r9.w);
    r6.w = saturate(dot(r11.zyx, r10.zyx));
    r2.x = ps;
    ps = SpotAngles.y * r6.x;
    r2.yz = r2.xz * r2.xw;
    r2.x = saturate(ps);
    r6.xyz = r2.zzz * r4.xyz + ModShadowColor.xyz;
    r7.xy = r2.xy * r2.xy;
    r1.xyz = r7.yyy * r1.xyz;
    ps = pow(2.0, r7.z);
    r1.xyz = r1.xyz * r7.www;
    r7.z = ps;
    r7.yzw = r1.xyz * r7.zzz;
    r0.xy = r0.xy * r6.ww + r7.yz;
    r0.z = r0.z * r6.w + r7.w;
    r0.xyz = r8.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.xxx;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
