// ps_5b442e842a3f30b5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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

    r9.x = UniformScalar_16.x * 0.05;
    r5.z = UniformScalar_3.x * UniformVector_4.x;
    ps = r4.w;
    r16.xy = r0.xy * UniformVector_2.xy;
    ps = (-4e+02) + ps;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 0.00022222222 * r5.x;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r5.z = r5.z * UniformScalar_4.x;
    r5.y = ps;
    ps = floor(r5.z);
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r11.w = ps;
    ps = 1.0 / r4.w;
    r11.xyz = r5.yyy * r3.xyz;
    r5.y = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.xyz = r9.zwx * r5.yyx;
    r5.w = ps;
    r3.xyw = r11.wxy * r5.wzz + r0.xwz;
    ps = 1.0 - r3.w;
    r10.x = r0.w * UniformVector_1.x;
    r9.x = ps;
    ps = 1.0 - r0.z;
    r5.w = float((UniformScalar_11.x >= 1.0));
    r9.y = ps;
    ps = UniformVector_1.x * r3.y;
    r10.yz = r9.yx * UniformVector_1.yy;
    r10.w = ps;
    r9 = r10.wzxy - 0.5;
    r18 = float4((r10.wzxy >= 0.5));
    ps = ScreenPositionScaleBias.w + r5.x;
    r12 = r9 - r10.wzxy;
    r9.x = ps;
    r10 = r12 * r18 + r10.wzxy;
    ps = ScreenPositionScaleBias.z + r5.y;
    r10 = r10 + r10;
    r9.y = ps;
    r13 = tex2D(Texture2D_9, r16.xy);
    r12.xyz = tex2D(Texture2D_5, r16.xy).xyz;
    r17 = tex2D(Texture2D_3, r10.zw);
    r19 = tex2D(Texture2D_3, r10.xy);
    r9.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r15.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r8 = tex2D(Texture2D_4, r8.xy);
    r5.x = dot(r2.zxy, r2.zxy);
    r21.zw = r8.xy * 2.0 - 1.0;
    r10.xy = r15.yz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r6.x = r1.z + 0.1;
    r5.y = saturate(ps);
    ps = log2(r5.y);
    r9.xyz = r9.xyz * r2.www;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r9.w = -r6.w + UniformScalar_12.x;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r10.xy = r10.xy * 0.5;
    r5.z = ps;
    r9 = r9.xzyw * r5.zzzw;
    ps = r6.w;
    r5.y = r9.w + r6.w;
    ps = 15.0 * ps;
    r5.y = -r5.y + r6.z;
    r14.y = saturate(ps);
    ps = r5.y;
    r14.z = dot(r18.zww, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    ps = UniformScalar_13.x;
    r14.x = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r10.w = ps;
    r5.z = (r14.x == 0.0) ? r19.x : r19.y;
    r5.y = (r14.z == 0.0) ? r17.x : r17.y;
    ps = max(r10.z, r10.w);
    r18 = r14.xzzx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.w = ps;
    r5.y = (r18.y == 0.0) ? r17.z : r5.y;
    r5.z = (r18.w == 0.0) ? r19.z : r5.z;
    r21.x = (r18.x == 0.0) ? r19.w : r5.z;
    r5.z = (r18.z == 0.0) ? r17.w : r5.y;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = max(r5.z, 0.0);
    r10.z = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.yw = min(r5.yw, float2(0.3, 1.0));
    r1.w = ps;
    ps = 3.3333333 * r5.y;
    r17.yzw = r12.xyz + r12.xyz;
    r21.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = saturate(r5.w * r1.w);
    r10.w = ps;
    ps = 1.0 - r5.z;
    r16.zw = r10.zw * abs(r7.xy);
    r7.x = ps;
    ps = 1.0 - r5.w;
    r12.xw = -r21.yx + 1.0;
    r7.w = ps;
    ps = r14.y;
    r15.x = r7.w * r6.w;
    ps = r12.x * ps;
    r8.xy = r15.wx * r8.wz;
    r10.z = ps;
    ps = (-1.0) - -r8.x;
    r10.xyz = r21.zyw + r10.xzy;
    r10.w = ps;
    ps = r0.w + r0.w;
    r10.xzw = r10.wxy * r10.yyz;
    r12.y = ps;
    ps = 2.5 * r7.x;
    r7.y = r10.x + 1.0;
    r7.z = ps;
    ps = r0.z + r0.z;
    r8.zw = r7.yz * r7.xy;
    r12.z = ps;
    ps = 5.0 * r6.x;
    r14.zw = float2((r8.yz >= float2(0.05, 0.9)));
    r14.x = saturate(ps);
    ps = r0.y;
    r15.xyz = -r14.zxy + 1.0;
    r5.y = (UniformScalar_12.x > 0.0) ? r15.x : 1.0;
    r5.y = (UniformScalar_12.x >= 0.0) ? r5.y : r15.x;
    ps = UniformScalar_8.x + ps;
    r17.x = r5.y * r13.w;
    r3.z = ps;
    ps = r3.y + r3.y;
    r6 = r17 + float4(-0.5, -1.0, -1.0, -1.0);
    r5.y = ps;
    ps = r3.w + r3.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r5.z = ps;
    r10.xy = tex2D(ModShadowAccumTexture, r16.zw).xy;
    r15.x = tex2D(Texture2D_6, r16.xy).x;
    r0.xyz = tex2D(Texture2D_8, r5.yz).xyz;
    r18 = tex2D(Texture2D_2, r12.yz);
    r5.yzw = tex2D(Texture2D_0, r5.yz).xzy;
    r19 = tex2D(Texture2D_7, r3.xz);
    r7.xyz = tex2D(Texture2D_1, r12.yz).xyz;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r16.xyz = UniformVector_5.xyz * 2e+01;
    r0.w = dot(r1.zxy, r1.zxy);
    r17.xyz = r13.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r12.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r20.yzw = r5.ywz + r5.ywz;
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r0.www * r1.xyz;
    r5.x = ps;
    r1.xyz = r5.xxx * -SpotDirection.xyz;
    ps = r19.x * r19.w;
    r5.y = dot(r1.zxy, r2.zxy);
    r2.x = ps;
    r5.x = dot(r14.yy, r12.ww) + r21.x;
    ps = r19.y * r19.w;
    r20.x = r5.x + r21.x;
    r2.y = ps;
    ps = r19.z * r19.w;
    r1 = r20 + float4(0.25, -1.0, -1.0, -1.0);
    r2.z = ps;
    ps = r1.x;
    r16.xyz = r16.xyz * r2.xyz;
    ps = -r8.x + ps;
    r2.xyz = r12.xyz - r1.yzw;
    r5.x = saturate(ps);
    r0.w = r2.z * r18.w - 2.0;
    r12.xyz = r2.xyz * r18.www + r1.yzw;
    r0.xyz = r5.xxx * r0.xyz;
    ps = r4.w;
    r1.xyz = -r0.xyz + r18.xyz;
    r0.xyz = r1.xyz * r18.www + r0.xyz;
    r2.w = saturate(r8.w * r15.z - 0.5);
    ps = 0.0001 * ps;
    r15.yz = r15.yy * ModShadowGroupColor.xy;
    r15.w = saturate(ps);
    r1 = -r15.wxyz + 1.0;
    r8.xyz = r17.xyz * r1.yyy;
    ps = -SpotAngles.x - -r5.y;
    r6.xyz = r6.wyz * UniformVector_4.zxy;
    r5.x = ps;
    r2.xy = r6.yz * r15.xx + r10.zw;
    ps = (-1.0) - -r6.x;
    r2.xy = r2.xy - r12.xy;
    r16.w = ps;
    ps = SpotAngles.y * r5.x;
    r6 = r16.xywz * r15.xxxx;
    r2.z = saturate(ps);
    r4.xyz = r6.xyw * r14.www + r13.xyz;
    ps = -r12.z;
    r5.xyw = r2.xyz * r2.wwz;
    ps = r6.z + ps;
    r6.xy = r12.xy + r5.xy;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r4.xyz = r4.xyz - r0.xyz;
    r4.w = ps;
    r4 = r4 * r2.wwww + r0;
    r6.z = r5.z * 2.0 + r4.w;
    r6.xyw = r6.xyz * r1.xxx;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r1.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r1.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.z = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.z));
    r6.xyz = r8.xyz * r2.www;
    r5.z = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r0.yzw * r5.zzz;
    ps = 1.0 + ps;
    r5.z = dot(r2.zxy, r11.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r2.xyz * r5.zzz;
    r8.xyz = r8.xyz * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r5.z = saturate(dot(r7.zxy, r8.zxy));
    r0.z = ps;
    ps = log2(r5.z);
    r0.xyz = r4.xyz * r0.xyz;
    r10.z = ps;
    r5.xyz = r10.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r6.w = saturate(dot(r2.zyx, r7.zyx));
    r5.z = ps;
    r1.xy = r5.xy * r1.zw + 0.125;
    ps = r1.x * r1.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.z = ps;
    r5.xyz = r5.zzz * r3.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r9.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
