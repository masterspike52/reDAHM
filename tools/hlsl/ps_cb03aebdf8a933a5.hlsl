// ps_cb03aebdf8a933a5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 471 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000075C 10041300 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
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
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.w = UniformScalar_17.x * 0.05;
    ps = r2.z;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r7.yz = r1.wz * 3.0;
    r6.y = ps;
    r7.x = r8.w * (-0.8) + r7.z;
    ps = rsqrt(abs(r6.z));
    r6.x = r5.w - 4e+02;
    r7.w = ps;
    ps = 5.0 * r6.y;
    r6.z = float((UniformScalar_12.x >= 1.0));
    r17.z = saturate(ps);
    ps = 0.00022222222 * r6.x;
    r10.xyz = r7.www * r4.xyz;
    r17.w = saturate(ps);
    r6.y = r6.w * r17.w;
    ps = UniformScalar_13.x - r8.w;
    r2.w = saturate(r8.w * 15.0);
    r10.w = ps;
    r6.x = r10.w * r6.z + r8.w;
    r11.xy = r10.yx * r6.yy + r1.zw;
    r6.x = -r6.x + r8.z;
    r6.x = max(r6.x, UniformScalar_14.x);
    ps = 1.0 / UniformScalar_15.x;
    r6.y = min(r6.x, 1.0);
    r6.x = ps;
    ps = -r1.z;
    r11.z = saturate(r6.y * r6.x);
    ps = 1.0 + ps;
    r3.yz = -r11.xz + 1.0;
    r3.x = ps;
    r13.yz = r3.xy * UniformVector_1.yy;
    ps = UniformVector_1.x * r1.w;
    r19.zw = r5.xy * ScreenPositionScaleBias.xy;
    r13.x = ps;
    r6.xyz = r13.zxy - 0.5;
    r12.xyw = float3((r13.xyz >= 0.5));
    ps = r11.x + r11.x;
    r6.xyz = r6.xyz - r13.zxy;
    r16.x = ps;
    r6.xyz = r6.yzx * r12.xyw + r13.xyz;
    ps = r11.y + r11.y;
    r18.yzw = r6.zxy + r6.zxy;
    r16.y = ps;
    r6.z = tex2D(Texture2D_7, r1.xy).w;
    r14 = tex2D(Texture2D_3, r18.zw);
    r6.xyw = tex2D(Texture2D_0, r16.yx).xyz;
    r13 = tex2D(Texture2D_4, r7.yx);
    ps = 1.0 / ModShadowAccumResolution.x;
    r17.x = saturate(r5.w * 0.0001);
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.xy = r13.xy + r13.xy;
    r4.w = ps;
    ps = r1.w;
    r15.z = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r7.w = (r15.z == 0.0) ? r14.x : r14.y;
    ps = 18.0 * ps;
    r15 = r15.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r4.x = ps;
    r7.w = (r15.w == 0.0) ? r14.z : r7.w;
    r0.z = (r15.z == 0.0) ? r14.w : r7.w;
    ps = r6.x + r6.x;
    r7.w = max(r0.z, 0.0);
    r14.x = ps;
    ps = r6.y + r6.y;
    r7.w = min(r7.w, 0.3);
    r14.y = ps;
    ps = r3.z;
    r0.w = r7.w * 3.3333333;
    ps = r8.w * ps;
    r3.yz = -r0.zw + 1.0;
    r3.x = ps;
    ps = r6.w + r6.w;
    r19.xy = r3.xy * r13.zz;
    r14.z = ps;
    ps = 6.0 * r7.x;
    r17.y = float((r19.x >= 0.05));
    r4.y = ps;
    ps = r4.z;
    r12.xyz = -r17.zxy + 1.0;
    r7.x = (UniformScalar_13.x > 0.0) ? r12.z : 1.0;
    r7.x = (UniformScalar_13.x >= 0.0) ? r7.x : r12.z;
    ps = abs(r9.x) * ps;
    r14.w = r7.x * r6.z;
    r7.x = ps;
    ps = r4.w;
    r14 = r14 + float4(-1.0, -1.0, -1.0, -0.5);
    ps = abs(r9.y) * ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.wwww)) clip(-1.0);
    r7.y = ps;
    r7.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r6.xyz = tex2D(Texture2D_4, r4.xy).xyw;
    ps = (-0.3) * r13.z;
    r8.x = ps;
    r7.xy = r6.xy * 2.0 - 1.0;
    ps = r6.z;
    r4 = r7.zwxy * float4(0.875, 0.875, 0.5, 0.5);
    ps = r13.w * ps;
    r7.xz = r15.xy + r4.zw;
    r6.x = ps;
    ps = (-1.0) - -r6.x;
    r8.y = r7.x * 0.01;
    r7.w = ps;
    r7.y = r2.w * r3.z + r0.w;
    r15.xz = r8.yx * r7.yy + r1.xy;
    r17.xyz = r7.wxy * r7.yyz;
    r15.y = r17.z * 0.025 + r15.z;
    r9.xyz = tex2D(Texture2D_7, r15.xy).xyz;
    ps = UniformVector_5.x * UniformVector_5.w;
    r17.w = r11.y * UniformVector_1.x;
    r11.x = ps;
    ps = 1.0 / r5.w;
    r9.w = float((r17.w >= 0.5));
    r6.z = ps;
    r7.xy = r19.zw * r6.zz + ScreenPositionScaleBias.wz;
    ps = UniformVector_5.y * UniformVector_5.w;
    r8.xw = r17.wx + float2(-0.5, 1.0);
    r11.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r11.w = r8.x - r17.w;
    r11.z = ps;
    r11 = r11 * r9;
    ps = r1.w + r1.w;
    r6.z = r17.w + r11.w;
    r8.y = ps;
    ps = r1.z + r1.z;
    r18.x = r6.z + r6.z;
    r8.z = ps;
    r13.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r0 = tex2D(Texture2D_2, r8.yz);
    r16.xyz = tex2D(Texture2D_8, r16.yx).xyz;
    r7 = tex2D(Texture2D_3, r18.xy).zwxy;
    r5.xyz = tex2D(Texture2D_5, r15.xy).xyz;
    r15.xyz = tex2D(Texture2D_1, r8.yz).xyz;
    r6.y = tex2D(Texture2D_6, r1.xy).x;
    r6.z = float((UniformScalar_9.x > 1.0));
    r8.y = dot(r2.zxy, r2.zxy);
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r8.y));
    r18.xyz = r5.xyz + r5.xyz;
    r8.y = ps;
    r5.xyz = r8.yyy * r2.xyz;
    r2.x = r12.w * 2.0 + r9.w;
    r8.y = (r2.x == 0.0) ? r7.z : r7.w;
    r1.xy = -r12.xx * ModShadowGroupColor.xy + 1.0;
    r7.w = r8.w * r3.y;
    r7.z = r19.y * r8.w - r7.w;
    r2.yz = r4.xy * r1.xy;
    r1.xyz = r11.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r9 = r2.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r7.x = (r9.y == 0.0) ? r7.x : r8.y;
    ps = r9.z * r9.w;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r8.y = ps;
    r8.xyz = r8.yyy * r2.xyz + ModShadowColor.xyz;
    r7.x = (r9.x == 0.0) ? r7.y : r7.x;
    ps = 1.0 - r7.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    r7.yz = r2.ww * r7.yz;
    r2.xy = r7.yw + r7.xz;
    r4.w = saturate(r2.y * 2.5 - 0.5);
    r1.w = r2.x + r7.y;
    r18.w = r1.w + r7.x;
    r7 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.xy = r7.xy * UniformVector_3.xy + r17.yz;
    r1.w = saturate(r7.w - r6.x);
    r2.xyz = r1.www * r16.xyz;
    ps = -r2.z;
    r15.xzw = r15.zxy - r14.zxy;
    ps = r0.z + ps;
    r4.xy = -r2.xy + r0.xy;
    r15.y = ps;
    r2.xy = r4.xy * r0.ww + r2.xy;
    r0 = r15.zwyx * r0.wwww;
    r2.z = r2.z + r0.z;
    ps = r0.w;
    r0.xyz = r14.xyz + r0.xyw;
    r6.x = ps;
    r11.w = r7.z * UniformVector_3.z - r0.z;
    ps = (-2.0) + r6.x;
    r4.xy = r7.xy - r0.xy;
    r2.w = ps;
    r11.xyz = r11.xyz * r3.yyy - r2.xyz;
    r7.xyz = r4.xyz * r4.wwz;
    r7.xy = r0.xy + r7.xy;
    r0.xyz = r7.zzz * r13.xyz;
    r11 = r11 * r4.wwww + r2;
    r7.z = r6.w * 2.0 + r11.w;
    r7.xyz = r7.zxy * r12.yyy;
    ps = 1.0 + r7.x;
    r2.x = float((UniformScalar_9.x >= 1.0));
    r7.w = ps;
    r7.xyz = (r12.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r2.yzw = (r12.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r2.wyz, r2.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r11.xyz * r9.xyz;
    r6.x = ps;
    r9.xyz = r2.yzw * r6.xxx;
    r6.x = dot(r9.zxy, r10.zxy);
    r2.yzw = r9.xyz * r6.xxx;
    r2.yzw = r2.yzw * 2.0 - r10.xyz;
    ps = UniformScalar_8.x * r6.y;
    r6.x = saturate(dot(r5.zxy, r2.wyz));
    r2.z = ps;
    ps = log2(r6.x);
    r6.w = saturate(dot(r9.zyx, r5.zyx));
    r6.x = ps;
    ps = abs(r8.w) * abs(r8.w);
    r6.y = r6.x * UniformScalar_7.x;
    r2.y = ps;
    ps = pow(2.0, r6.y);
    r6.x = r6.x * 15.0;
    r2.w = ps;
    r2.yz = r2.yz * r2.yw;
    r2.w = (r6.z > 0.0) ? 0.0 : r2.z;
    r6.yz = r2.xy * r2.wy;
    r1.xyz = r1.xyz + r6.yyy;
    r1.xyz = r6.zzz * r1.xyz;
    r1.xyz = r1.xyz * r4.www;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.xyz * r3.yyy;
    r6.x = ps;
    r6.xyz = r1.xzy * r6.xxx;
    r6.y = r7.z * r6.w + r6.y;
    r6.xz = r7.xy * r6.ww + r6.xz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
