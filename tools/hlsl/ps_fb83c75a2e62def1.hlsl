// ps_fb83c75a2e62def1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_6, r1.xy);
    r6.xy = r1.xy * UniformScalar_0.xx;
    ps = (-0.5) + r16.w;
    r6.zw = r1.wz * 6.0;
    r7.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r17.x = tex2D(ShadowTexture, r0.xy).x;
    r11.xyw = tex2D(Texture2D_2, r6.zw).xyw;
    r6.xyz = tex2D(Texture2D_3, r6.xy).xwy;
    r9.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    ps = r1.w;
    r7.y = -r1.z + 1.0;
    ps = UniformVector_2.x * ps;
    r12.y = saturate(r5.w * 0.0001);
    r18.y = ps;
    ps = r5.w;
    r15.xz = r1.wz * UniformVector_6.xy;
    ps = (-4e+02) + ps;
    r7.xz = r1.wz * UniformVector_1.xy;
    r0.y = ps;
    ps = r2.z;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r18.zw = r9.xy + r9.xy;
    r0.x = ps;
    r22.xy = r6.xz * 2.0 - 1.0;
    r0.zw = r11.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r0.xy = saturate(r0.xy * float2(5.0, 0.00022222222));
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r13.xyz = r0.zwy * float3(0.5, 0.5, -0.025);
    r17.w = ps;
    r17.yz = r9.xy * r13.zz + r7.xz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xz = r17.zx * r17.wx;
    r6.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xw = -r12.xy + 1.0;
    r7.z = ps;
    ps = UniformScalar_1.x * r7.w;
    r10.yz = r5.xy * ScreenPositionScaleBias.xy;
    r10.x = ps;
    ps = 1.0 / r5.w;
    r4.xyw = r7.zxy * UniformVector_2.xyy;
    r22.z = ps;
    r7.xy = r10.yz * r22.zz + ScreenPositionScaleBias.wz;
    ps = r4.x;
    r6.xw = r6.xw * abs(r8.xy);
    ps = r17.y * ps;
    r5.xz = r4.wy - 0.5;
    r18.x = ps;
    ps = r5.z;
    r20.zw = float2((r4.yw >= 0.5));
    ps = -r4.y + ps;
    r14 = r18.zwxy + float4(-1.0, -1.0, -0.5, -0.5);
    r5.z = ps;
    ps = r5.x;
    r20.xy = float2((r18.xy >= 0.5));
    ps = -r4.w + ps;
    r5.xy = r14.zw - r18.xy;
    r5.w = ps;
    r4.xz = r5.xy * r20.xy + r18.xy;
    r4.yw = r5.zw * r20.zw + r4.yw;
    r4 = r4 + r4;
    r11.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r17.yz).xyz;
    r15.yw = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r18 = tex2D(Texture2D_1, r4.zw);
    r19 = tex2D(Texture2D_1, r4.xy);
    r5.xyz = tex2D(Texture2D_7, r15.xz).xyz;
    r4.yzw = tex2D(Texture2D_0, r17.yz).xyz;
    r17.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r1.z = dot(r2.zxy, r2.zxy);
    r7.z = float((UniformScalar_5.x >= 1.0));
    r1.x = float((UniformScalar_5.x > 1.0));
    ps = (-1.0) + r6.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r4.x = ps;
    r21.xyz = r17.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r1.y = r11.w * r9.w;
    r7.y = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r6.yzw = r4.wyz + float3(-1.0, 0.0, 0.0);
    r7.x = ps;
    r5.xyz = (-abs(r1.xxx) >= 0.0) ? r5.xyz : 1.0;
    r5.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r5.xyz;
    ps = log2(r7.y);
    r14.z = r1.y - 1.0;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.yzw = r6.zwy + r4.yzw;
    r1.x = ps;
    r13.z = r21.z * UniformVector_4.z - r6.w;
    ps = 1.0 - r0.x;
    r17.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r6.x = ps;
    ps = (-1.0) + r6.y;
    r0.xyz = r7.xxx * -SpotDirection.xyz;
    r7.x = ps;
    ps = (-1.0) + r6.z;
    r6.y = dot(r0.zxy, r3.zxy);
    r7.y = ps;
    ps = -SpotAngles.x - -r6.y;
    r0.xy = r6.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    r6.yz = r10.xx * r22.xy + r21.xy;
    r7.xy = r6.yz * UniformVector_4.xy - r7.xy;
    r0.zw = r20.zw * 2.0 + r20.xy;
    r6.y = (r0.z == 0.0) ? r19.x : r19.y;
    r6.z = (r0.w == 0.0) ? r18.x : r18.y;
    ps = SpotAngles.y * r6.x;
    r3 = r0.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.z = saturate(ps);
    r6.x = (r3.z == 0.0) ? r18.z : r6.z;
    r6.y = (r3.y == 0.0) ? r19.z : r6.y;
    r15.z = (r3.x == 0.0) ? r19.w : r6.y;
    r0.z = (r3.w == 0.0) ? r18.w : r6.x;
    ps = r14.x;
    r6.x = max(r0.z, 0.0);
    ps = r13.x + ps;
    r15.x = min(r6.x, 0.3);
    r14.x = ps;
    ps = r14.y;
    r6.xyz = -r0.xyz + 1.0;
    ps = r13.y + ps;
    r0.xyz = r15.xyw * float3(3.3333333, 0.875, 0.875);
    r14.y = ps;
    r13.xy = r0.xx * r14.xy + r7.xy;
    ps = 2.5 * r6.z;
    r15.xy = r0.yz * r6.xy;
    r3.y = ps;
    r3.z = r0.x * r14.z + 1.0;
    ps = abs(r3.z) * abs(r3.z);
    r14.xyw = r15.xyz + float3(0.125, 0.125, 0.25);
    r3.x = ps;
    ps = r14.x * r14.y;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    ps = r14.w;
    r14.xyz = r17.xyz * r16.xyz;
    ps = r15.z + ps;
    r7.xy = r3.yx * r3.zx;
    r6.x = ps;
    r0.xyz = r0.www * r0.xyz + ModShadowColor.xyz;
    ps = (-0.5) + r7.x;
    r6.x = saturate(r6.x - r1.y);
    r0.w = saturate(ps);
    ps = r7.y * r7.y;
    r5.xyz = r14.xyz * r5.xyz;
    r1.y = ps;
    r6.y = r13.z * r0.w + r6.w;
    r6.zw = r13.xy * r0.ww - 1.0;
    r4.yz = r4.yz * 2.0 + r6.zw;
    r4.w = r6.y * TwoSidedSign.x - TwoSidedSign.x;
    ps = r7.z * r7.z;
    r4 = r4 * r7.wwww;
    r6.z = ps;
    ps = r4.w;
    r8.xyz = r6.xxx * r8.xyz;
    r6.y = ps;
    ps = TwoSidedSign.x + r6.y;
    r6.x = r4.x + 1.0;
    r6.y = ps;
    r4.xy = (r7.ww > 0.0) ? r4.yz : 0.0;
    r4.xy = (r7.ww >= 0.0) ? r4.xy : 0.0;
    r6.x = (r10.x > 0.0) ? r6.x : 1.0;
    r6.y = (r7.w > 0.0) ? r6.y : TwoSidedSign.x;
    r4.z = (r7.w >= 0.0) ? r6.y : TwoSidedSign.x;
    r6.x = (r10.x >= 0.0) ? r6.x : 1.0;
    ps = rsqrt(abs(r1.z));
    r7.xyz = r5.xyz * r6.xxx;
    r6.x = ps;
    r10.xyz = r7.xyz * r3.zzz - r8.xyz;
    r7.xyz = r7.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = pow(2.0, r1.x);
    r5.xyz = r1.yyy * r7.xyz;
    r6.y = ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r3.xyz = r6.xxx * r2.xyz;
    r7.xyz = r12.zzz * r11.xyz;
    r6.x = dot(r4.zxy, r4.zxy);
    r2.xyz = r10.xyz * r0.www + r8.xyz;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r2.xyz * r1.xyz;
    r6.x = ps;
    r2.xyz = r4.xyz * r6.xxx;
    r4.xyz = r2.xyz * TwoSidedSign.xxx;
    r6.x = dot(r4.zxy, r9.zxy);
    r2.xyz = r4.xzy * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r9.xzy;
    r6.x = saturate(dot(r3.zxy, r2.yxz));
    ps = log2(r6.x);
    r2.xyz = r5.xyz * r0.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.xyz = r7.xzy * r6.yyy;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.w = saturate(dot(r4.zxy, r3.zxy));
    r6.x = ps;
    r6.xyw = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r7.ww + r6.xy;
    r6.w = r1.z * r7.w + r6.w;
    r6.xyw = r7.xzy * r6.xyw;
    r6.xyw = r6.xyw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xwy * r6.zzz;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
