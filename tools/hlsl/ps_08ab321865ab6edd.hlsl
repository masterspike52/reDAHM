// ps_08ab321865ab6edd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 324 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000510 10041000 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r1.xy);
    r6.xy = r1.wz * 6.0;
    r6.z = r13.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r8.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r1.w;
    r6.yz = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r3.xy = r1.wz * UniformVector_1.xy;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = r5.w - 4e+02;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    r11.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r11.y = saturate(r6.w * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r10.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r12.xyz = r11.zwy * float3(0.5, 0.5, -0.025);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r11.zw = r10.xy * r12.zz;
    r11.y = ps;
    r6.xw = r11.xy - 0.5;
    r0.zw = float2((r11.xy >= 0.5));
    ps = r7.y;
    r6.xw = r6.xw - r11.xy;
    ps = abs(r9.x) * ps;
    r3.zw = r6.xw * r0.zw;
    r7.x = ps;
    ps = r7.z;
    r14 = r11.zwxy + r3;
    ps = abs(r9.y) * ps;
    r6.xw = r14.zw + r14.zw;
    r7.y = ps;
    r4.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r16 = tex2D(Texture2D_1, r6.xw);
    r3.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r6.xyw = tex2D(Texture2D_3, r6.yz).xyw;
    r7.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r14.xy).xyz;
    ps = r5.w;
    r6.z = r2.z + 0.1;
    r11.xyz = r8.xyw * 2.0 - 1.0;
    r7.yzw = r7.xzy * 2.0 - 1.0;
    r9.zw = r6.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.x = saturate(r6.z * 5.0);
    r6.y = saturate(ps);
    ps = r3.x + r3.x;
    r6.xy = -r6.xy + 1.0;
    r15.y = ps;
    ps = r3.y + r3.y;
    r15.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r15.z = ps;
    r6.z = (r15.x == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_1.x * r6.y;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r4.w = ps;
    ps = r15.z;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.z = (r15.y == 0.0) ? r16.z : r6.z;
    r7.x = (r15.x == 0.0) ? r16.w : r6.z;
    ps = r12.x + ps;
    r6.z = max(r7.x, 0.0);
    r9.x = ps;
    ps = r15.w;
    r4.x = min(r6.z, 0.3);
    ps = r12.y + ps;
    r4.xyz = r4.xyz * float3(3.3333333, 0.875, 0.875);
    r9.y = ps;
    r9 = r4.xxww * r9;
    r0.zw = r7.yw + r9.zw;
    r0.zw = r0.zw * UniformVector_4.xy + r9.xy;
    ps = 1.0 / r5.w;
    r12.xy = r0.zw - r11.xy;
    r6.z = ps;
    r0.zw = r12.zw * r6.zz + ScreenPositionScaleBias.wz;
    r1.z = tex2D(Texture2D_5, r1.xy).x;
    r3.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r1.y = tex2D(ShadowTexture, r0.xy).x;
    r9.xyz = tex2D(Texture2D_7, r14.xy).xyz;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r2.zxy, r2.zxy);
    r0.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r7.y = r8.z * r3.w - 1.0;
    ps = (-1.0) + r6.w;
    r13.xyz = r0.xyz * r13.xyz;
    r6.w = ps;
    r5.w = r7.z * UniformVector_4.z - r11.z;
    ps = r6.w;
    r7.zw = r6.xx * ModShadowGroupColor.xy;
    ps = r6.y * ps;
    r7.xzw = -r7.xwz + 1.0;
    r0.x = ps;
    ps = 2.5 * r7.x;
    r0.yzw = r4.xzy * r7.yzw;
    r7.w = ps;
    ps = rsqrt(abs(r6.z));
    r0 = r0.ywzx + float4(1.0, 0.125, 0.125, 1.0);
    r6.z = ps;
    ps = abs(r0.x) * abs(r0.x);
    r4.xyz = r6.zzz * r2.xyz;
    r1.x = ps;
    ps = r0.y * r0.z;
    r7.xyz = r13.xyz * r0.www;
    r6.z = ps;
    r8.xyz = r6.zzz * r5.xyz + ModShadowColor.xyz;
    r2.xyz = r7.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r5.xyz = r7.xyz * r0.xxx - r9.xyz;
    r6.z = saturate(r7.w * r0.x - 0.5);
    r1.yw = r1.xy * r1.xy;
    r7.xy = r12.xy * r6.zz + r11.xy;
    r9.xyz = r5.xyz * r6.zzz + r9.xyz;
    r6.w = r5.w * r6.z - 2.0;
    r7.z = r8.w * 2.0 + r6.w;
    r7.xyz = r7.zxy * r6.yyy;
    ps = 1.0 + r7.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r9.xyz * r5.xyz;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r6.x = dot(r7.zxy, r10.zxy);
    r6.xyw = r7.xyz * r6.xxx;
    r6.xyw = r6.xyw * 2.0 - r10.xyz;
    r6.x = saturate(dot(r4.zxy, r6.wxy));
    ps = log2(r6.x);
    r6.w = saturate(dot(r7.zyx, r4.zyx));
    r6.y = ps;
    ps = UniformScalar_9.x * r6.y;
    r7.xyz = r1.www * r3.xyz;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.x = r6.y * 15.0;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r6.y = ps;
    r1.x = r6.y * r0.w;
    r1.xw = r1.xy * r1.zy;
    r1.xyz = r2.xyz + r1.xxx;
    r1.xyz = r1.www * r1.xyz;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r8.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
