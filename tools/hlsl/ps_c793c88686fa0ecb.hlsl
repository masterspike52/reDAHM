// ps_c793c88686fa0ecb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 336 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000540 10041200 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_6, r1.xy);
    ps = (-0.5) + r11.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r16.x = ps;
    r7.xyz = tex2D(Texture2D_2, r6.xy).wxy;
    ps = r1.w;
    r13.zw = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_7.x * ps;
    r15.xy = r1.wz * UniformVector_1.xy;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r5.w - 4e+02;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r8.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r14.zw = r8.xy * r6.yy + ScreenPositionScaleBias.wz;
    r6.yz = r7.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.w = ps;
    ps = -r1.z;
    r12.xyz = r6.www * r4.xyz;
    ps = 1.0 + ps;
    r8.xyz = r6.yzx * float3(0.5, 0.5, -0.025);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r16.zw = r12.xy * r8.zz;
    r16.y = ps;
    ps = r1.z;
    r6.xy = r16.xy - 0.5;
    ps = UniformVector_7.y * ps;
    r13.xy = float2((r16.xy >= 0.5));
    r10.y = ps;
    ps = r0.z;
    r6.xy = r6.xy - r16.xy;
    ps = abs(r9.x) * ps;
    r15.zw = r6.xy * r13.xy;
    r14.x = ps;
    ps = r0.w;
    r6 = r16.zwxy + r15;
    ps = abs(r9.y) * ps;
    r0.zw = r6.zw + r6.zw;
    r14.y = ps;
    r4.xyz = tex2D(Texture2D_8, r6.xy).xyz;
    r9.y = tex2D(Texture2D_5, r1.xy).x;
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r14.zw).xyz;
    r17.y = tex2D(ShadowTexture, r0.xy).x;
    r15.yz = tex2D(ModShadowAccumTexture, r14.xy).xy;
    r18 = tex2D(Texture2D_1, r0.zw);
    r0.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    r9.xzw = tex2D(Texture2D_4, r1.xy).xyz;
    r6.yzw = tex2D(Texture2D_2, r1.wz).wxy;
    r7.yzw = tex2D(Texture2D_3, r13.zw).wxy;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = dot(r2.zxy, r2.zxy);
    r8.w = dot(r3.zxy, r3.zxy);
    r13.w = r7.x * r6.y - 1.0;
    r17.xzw = r9.wxz * 2.0 - 1.0;
    r9.xzw = r0.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r7.x = saturate(-r8.w + 1.0);
    r0.z = ps;
    ps = rsqrt(abs(r8.w));
    r1.xyz = r0.zzz * r2.xyz;
    r8.w = ps;
    ps = 0.1 - -r2.z;
    r5.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = ps;
    r2.z = r17.x * UniformVector_4.z - r9.w;
    ps = log2(r7.x);
    r2.xyw = r8.www * -SpotDirection.xyz;
    r7.x = ps;
    ps = r6.z + r6.z;
    r6.y = dot(r2.wxy, r3.zxy);
    r2.y = ps;
    ps = r6.w + r6.w;
    r2.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r2.w = ps;
    r6.z = (r2.x == 0.0) ? r18.x : r18.y;
    ps = 0.0001 * r5.w;
    r3 = r2.xyxw + float4(-3.0, -1.0, -2.0, -1.0);
    r8.z = saturate(ps);
    ps = r7.z + r7.z;
    r13.xy = r3.yw + r8.xy;
    r3.y = ps;
    r6.z = (r3.z == 0.0) ? r18.z : r6.z;
    r8.x = (r3.x == 0.0) ? r18.w : r6.z;
    ps = 5.0 * r6.x;
    r6.w = max(r8.x, 0.0);
    r8.y = saturate(ps);
    ps = r7.w + r7.w;
    r6.xz = -r8.xy + 1.0;
    r3.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r15.x = min(r6.w, 0.3);
    r8.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyw = r15.yzx * float3(0.875, 0.875, 3.3333333);
    r8.x = ps;
    ps = 1.0 - r8.x;
    r8.yz = -r8.yz + 1.0;
    r13.z = ps;
    ps = UniformScalar_1.x * r8.z;
    r3.x = r2.x * r8.y;
    r6.z = ps;
    r8.xw = r2.yw * r13.zw + float2(0.125, 1.0);
    ps = abs(r8.w) * abs(r8.w);
    r15.yzw = r3.xyz + float3(0.125, -1.0, -1.0);
    r17.x = ps;
    r3.xw = r6.zz * r15.zw + r17.zw;
    ps = -SpotAngles.x - -r6.y;
    r3.yz = r17.xy * r17.xy;
    r6.z = ps;
    ps = 2.5 * r6.x;
    r0.xyz = r3.zzz * r16.xyz;
    r15.x = ps;
    r2.xy = r3.xw * UniformVector_4.xy - r9.xz;
    ps = SpotAngles.y * r6.z;
    r6.xy = r15.yx * r8.xw;
    r3.x = saturate(ps);
    r6.xzw = r6.xxx * r14.xyz + ModShadowColor.xyz;
    r2.xy = r2.ww * r13.xy + r2.xy;
    ps = (-1.0) + r7.y;
    r8.x = saturate(r6.y - 0.5);
    r2.w = ps;
    r7.yz = r2.xy * r8.xx + r9.xz;
    r9.xz = r2.wz * r8.zx + float2(1.0, -2.0);
    r7.w = r0.w * 2.0 + r9.z;
    r2.xyw = r7.yzw * r8.zzz;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r2.z = r2.w + 1.0;
    r7.w = ps;
    r7.xyz = (r8.zzz > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r7.xyz = (r8.zzz >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.w);
    r6.y = dot(r7.zxy, r7.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r0.xzy * r7.www;
    r6.y = ps;
    r7.xyz = r7.xyz * r6.yyy;
    r6.y = dot(r7.zxy, r12.zxy);
    r2.xyz = r7.xyz * r6.yyy;
    r2.xyz = r2.xyz * 2.0 - r12.xyz;
    r6.y = saturate(dot(r1.zxy, r2.zxy));
    ps = log2(r6.y);
    r7.w = saturate(dot(r7.zyx, r1.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = pow(2.0, r7.y);
    r7.x = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r2.xyz = r5.xyz * r11.xyz;
    r6.y = ps;
    r2.w = r6.y * r9.x;
    r2 = r2 * r10.xyzx;
    r2 = r2 * r9.xxxy;
    r5.xyz = r2.xyz * r8.www - r4.xyz;
    r9.xyz = r2.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = r3.x * r3.x;
    r2.xyz = r9.xyz + r2.www;
    r6.y = ps;
    r4.xyz = r5.xyz * r8.xxx + r4.xyz;
    ps = r3.y * r3.y;
    r1.xyz = r4.xyz * r1.xyz;
    r7.y = ps;
    r2.xyz = r7.yyy * r2.xyz;
    ps = pow(2.0, r7.x);
    r8.xyz = r2.xyz * r8.xxx;
    r7.x = ps;
    r7.xyz = r8.xyz * r7.xxx;
    r7.xy = r1.xy * r7.ww + r7.xy;
    r7.z = r1.z * r7.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r6.yyy;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
