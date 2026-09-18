// ps_44e3e21dcb2c940d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c22); // float2
float4 SpotDirection : register(c21); // float3
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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

    r16 = tex2D(Texture2D_9, r1.xy);
    r7.zw = saturate(UniformVector_12.xy);
    r13.y = UniformScalar_4.x * UniformScalar_5.x;
    ps = r1.w;
    r6.z = -r1.z + 1.0;
    ps = UniformVector_2.x * ps;
    r0.w = r2.z + 0.1;
    r9.y = ps;
    ps = r5.w;
    r7.xy = r1.wz * UniformVector_1.xy;
    ps = (-2e+02) + ps;
    r6.y = UniformScalar_3.x * UniformVector_4.x;
    r0.z = ps;
    ps = UniformScalar_5.x * r6.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r13.x = ps;
    ps = rsqrt(abs(r6.x));
    r14.yz = saturate(r0.wz * float2(5.0, 0.00022222222));
    r6.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r10.xyz = r6.xxx * r4.xyz;
    r6.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.y = r14.z * (-0.1);
    r6.x = ps;
    r9.zw = r10.xy * r6.yy + r7.xy;
    r6.x = -r9.w * r6.x + 1.0;
    ps = r16.w;
    r6.yzw = r6.wxz * UniformVector_2.xyy;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r9.x = r6.y * r9.z;
    r7.y = ps;
    ps = (-0.5) + r6.z;
    r11.zw = float2((r6.zw >= 0.5));
    r7.x = ps;
    ps = (-0.5) + r6.w;
    r13.zw = r11.zw + r11.zw;
    r6.x = ps;
    ps = r7.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    ps = -r6.z + ps;
    r4.yz = r9.xy - 0.5;
    r4.x = ps;
    ps = floor(r13.x);
    r7.xy = float2((r9.xy >= 0.5));
    r0.z = ps;
    ps = floor(r13.y);
    r4.yz = r4.yz - r9.xy;
    r0.w = ps;
    r12.xz = r4.yz * r7.xy + r9.xy;
    r0.zw = r0.zw * UniformVector_11.xy - r13.xy;
    ps = r6.x;
    r7.zw = r0.zw * r7.zw;
    ps = -r6.w + ps;
    r7 = r13.zxwy + r7.xzyw;
    r4.y = ps;
    r0.zw = r1.xy * UniformVector_13.xy + r7.yw;
    ps = 1.0 / UniformVector_10.x;
    r0.zw = r0.zw * UniformVector_8.xy;
    r11.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r4.zw = frac(r0.zw);
    r11.y = ps;
    r11 = r4 * r11.zwxy;
    r12.yw = r6.zw + r11.xy;
    r6 = r12 + r12;
    r18 = tex2D(Texture2D_3, r6.zw);
    r19 = tex2D(Texture2D_3, r6.xy);
    r20.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r15 = tex2D(Texture2D_6, r11.zw);
    ps = r1.w + r1.w;
    r3.w = saturate(r5.w * 0.0001);
    r17.x = ps;
    ps = r1.z + r1.z;
    r11.xy = r1.wz * UniformVector_14.xy;
    r17.y = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r13.xyz = UniformVector_5.xyz * 2e+01;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.xyz = r15.xyz * r15.www;
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r21.xyz = r20.xyz + r20.xyz;
    r6.y = ps;
    ps = r6.z;
    r7.yw = r0.zw * r1.wz;
    ps = abs(r8.x) * ps;
    r1.xyz = r6.yyy * -SpotDirection.xyz;
    r9.x = ps;
    ps = r6.w;
    r6.y = dot(r1.zxy, r3.zxy);
    r6.w = (r7.x == 0.0) ? r19.x : r19.y;
    r6.z = (r7.z == 0.0) ? r18.x : r18.y;
    ps = abs(r8.y) * ps;
    r1 = r7.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r9.y = ps;
    r6.z = (r1.z == 0.0) ? r18.z : r6.z;
    r6.w = (r1.y == 0.0) ? r19.z : r6.w;
    r21.w = (r1.x == 0.0) ? r19.w : r6.w;
    r14.x = (r1.w == 0.0) ? r18.w : r6.z;
    ps = -SpotAngles.x - -r6.y;
    r1.zw = float2((UniformVector_10.yx > r4.wz));
    r6.z = ps;
    ps = SpotAngles.y * r6.z;
    r6.yw = float2((UniformVector_10.xy >= r4.zw));
    r1.x = saturate(ps);
    ps = r6.y * r6.w;
    r7.xz = -r14.xy + 1.0;
    r6.y = ps;
    ps = r6.y;
    r4 = r21 + float4(-1.0, -1.0, -1.0, -0.75);
    ps = r1.z * ps;
    r3.xyz = r4.xyz * UniformVector_4.xyz;
    r1.y = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r0.zw = r1.yx * r1.wx;
    r1.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.yzw = r15.xyz * r0.zzz;
    r1.z = ps;
    ps = r3.z;
    r18.xyz = r13.xyz * r6.yzw;
    r6.z = ps;
    ps = 1.0 - r6.z;
    r6.y = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r12.x = ps;
    ps = 1.0 - r3.w;
    r6.y = r6.y - r18.x;
    r12.y = ps;
    ps = 1.0 / r5.w;
    r1.y = saturate(r6.y + r18.x);
    r1.w = ps;
    r6.yz = r12.zw * r1.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r8.z = tex2D(ShadowTexture, r0.xy).x;
    r9.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r15 = tex2D(Texture2D_2, r7.yw).xywz;
    r13.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r11.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r6.yzw = tex2D(Texture2D_4, r17.xy).wxy;
    r8.xyw = tex2D(Texture2D_0, r9.zw).xyz;
    r17.xyz = tex2D(Texture2D_1, r7.yw).xyz;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r7.y = float((UniformScalar_12.x >= 1.0));
    r20.xyz = r17.xyz * 2.0 - 1.0;
    r19.xyz = r8.xyw * 2.0 - 1.0;
    r22.yz = r6.zw * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r7.w = float((UniformScalar_12.x > 1.0));
    r6.x = saturate(ps);
    r11.xyz = (-abs(r7.www) >= 0.0) ? r11.xyz : 1.0;
    r17.xyz = (-abs(r7.yyy) >= 0.0) ? 1.0 : r11.xyz;
    ps = log2(r6.x);
    r11.xyz = r16.xyz * UniformScalar_13.xxx;
    r6.x = ps;
    r11.xyz = r11.xyz * r17.xyz + UniformScalar_14.xxx;
    ps = (-1.0) + r6.y;
    r7.y = max(r14.x, 0.0);
    r22.x = ps;
    ps = 2.5 * r7.x;
    r6.z = min(r7.y, 0.3);
    r7.w = ps;
    ps = 3.3333333 * r6.z;
    r14.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = r4.w;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = r21.w + ps;
    r0.xyz = r6.yyy * r22.xyz;
    r6.y = saturate(ps);
    ps = 1.0 + r0.x;
    r13.xyw = r6.yyy * r13.xyz;
    r7.y = ps;
    ps = -r13.w;
    r20.xzw = r20.zxy - r19.zxy;
    ps = r15.w + ps;
    r6.yz = -r13.xy + r15.xy;
    r20.y = ps;
    r15.xy = r6.yz * r15.zz + r13.xy;
    ps = rsqrt(abs(r6.w));
    r6.yz = r7.yw * r7.xy;
    r2.w = ps;
    ps = (-0.5) + r6.z;
    r7 = r20.zwxy * r15.zzzz;
    r6.w = saturate(ps);
    ps = r7.z;
    r2.xyz = r2.www * r2.xyz;
    r6.z = ps;
    ps = r13.w;
    r13.xyz = r19.xyz + r7.xyz;
    ps = r7.w + ps;
    r6.y = float((r6.y > 0.9));
    r15.z = ps;
    r7.xyz = r18.xyz * r6.yyy - r15.xyz;
    r7.xyz = r17.xyz * r16.xyz + r7.xyz;
    r9.zw = -r3.xy * r1.yy + r3.xy;
    r3.z = r12.x * r1.y + r3.z;
    r3.xy = r0.yz * 2.0 + r9.zw;
    r7.xyz = r7.xyz * r6.www + r15.xyz;
    ps = (-2.0) + r6.z;
    r7.xyw = r7.xyz * r14.xyz;
    r13.w = ps;
    ps = r1.y;
    r3.xyz = -r13.xyz + r3.xyz;
    r6.z = ps;
    r3.xyz = r3.xyz * r6.www + r13.xyw;
    r3.w = r8.w * 2.0 + r3.z;
    ps = 1.0 - r6.z;
    r3.xyw = r3.xyw * r12.yyy;
    r8.x = ps;
    ps = 1.0 - r1.x;
    r3.z = r3.w + 1.0;
    r8.y = ps;
    r3.xyz = (r12.yyy > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r12.yyy >= 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r1.z;
    r6.y = dot(r3.zxy, r3.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r11.xyz * r8.xxx;
    r6.y = ps;
    r3.xyz = r3.xyz * r6.yyy;
    r6.y = dot(r3.zxy, r10.zxy);
    r11.xyz = r3.xyz * r6.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.y = saturate(dot(r2.zxy, r10.zxy));
    ps = log2(r6.y);
    r1.xyz = r1.xyz * r6.www;
    r9.z = ps;
    r6.yzw = r9.xyz * float3(0.875, 0.875, 15.0);
    r8.xy = r6.yz * r8.yw + 0.125;
    ps = pow(2.0, r6.w);
    r7.z = saturate(dot(r3.zyx, r2.zyx));
    r6.y = ps;
    r6.yzw = r1.xyz * r6.yyy;
    r7.xy = r7.xy * r7.zz + r6.yz;
    r7.z = r7.w * r7.z + r6.w;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xy = r8.xz * r8.yz;
    r6.w = ps;
    r6.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r0.yyy * r4.xyz;
    r6.w = ps;
    r1.xyz = r1.xzy * r6.www;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r0.www;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
