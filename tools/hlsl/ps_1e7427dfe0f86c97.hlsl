// ps_1e7427dfe0f86c97.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10040F00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r7.z = ps;
    ps = r1.z;
    r2.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = r9.w - 0.5;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r11.xyz = r6.xxx * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.zw = r11.xy * r5.ww;
    r3.y = ps;
    r5.zw = r3.xy - 0.5;
    r6.xw = float2((r3.xy >= 0.5));
    ps = r7.y;
    r5.zw = r5.zw - r3.xy;
    ps = abs(r8.x) * ps;
    r2.zw = r5.zw * r6.xw;
    r7.x = ps;
    ps = r7.z;
    r10 = r3 + r2.zwxy;
    ps = abs(r8.y) * ps;
    r5.zw = r10.xy + r10.xy;
    r7.y = ps;
    r2.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7 = tex2D(Texture2D_1, r5.zw);
    ps = 0.0001 * r4.w;
    r6.yz = r0.wz * 6.0;
    r5.w = saturate(ps);
    r8.xyz = tex2D(Texture2D_2, r6.yz).xyw;
    r3.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r10.xy = r0.xy * UniformScalar_0.xx;
    ps = r0.w;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r14.w = r8.z * r3.z - 1.0;
    r2.xw = r8.xy * 2.0 - 1.0;
    ps = UniformVector_7.x * ps;
    r3.yz = r3.xy + r3.xy;
    r8.x = ps;
    ps = 1.0 - r5.x;
    r3.x = dot(r6.xww, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r6.x = (r3.x == 0.0) ? r7.x : r7.y;
    ps = 1.0 - r5.w;
    r3 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.y = ps;
    r14.xy = r2.xw * 0.5 + r3.zw;
    r5.x = (r3.y == 0.0) ? r7.z : r6.x;
    r7.z = (r3.x == 0.0) ? r7.w : r5.x;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = max(r7.z, 0.0);
    r7.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r2.x = min(r5.x, 0.3);
    r7.x = ps;
    ps = 1.0 - r7.x;
    r3.xzw = r2.zxy * float3(0.875, 3.3333333, 0.875);
    r14.z = ps;
    r3.xy = r3.zx * r14.wz + float2(1.0, 0.125);
    ps = 1.0 / r4.w;
    r6.x = abs(r3.x) * abs(r3.x);
    r6.w = ps;
    ps = r0.z;
    r6.xyw = r6.yzx * r6.wwx;
    ps = UniformVector_7.y * ps;
    r5.xw = r6.xy + ScreenPositionScaleBias.wz;
    r8.y = ps;
    r2.xyz = tex2D(Texture2D_8, r10.zw).xyz;
    r4.y = tex2D(Texture2D_5, r0.xy).x;
    r8.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r4.xzw = tex2D(Texture2D_0, r10.zw).xyz;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.xw).zxy;
    r0.xyz = tex2D(Texture2D_3, r10.xy).wxy;
    r10.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r12.xyw = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r1.zxy, r1.zxy);
    r15.xyz = r13.xyz * 2.0 - 1.0;
    r13.xyz = r4.xzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r9.xyz = r10.xyz * r9.xyz;
    r5.x = ps;
    ps = r0.y + r0.y;
    r10.xyz = r5.xxx * r1.xyz;
    r1.y = ps;
    r12.z = r15.z * UniformVector_4.z - r13.z;
    ps = r0.z + r0.z;
    r5.xw = -r7.zy + 1.0;
    r1.z = ps;
    ps = UniformScalar_1.x * r5.y;
    r1.x = r3.w * r5.w;
    r7.x = ps;
    ps = 2.5 * r5.x;
    r1.yzw = r1.xyz + float3(0.125, -1.0, -1.0);
    r1.x = ps;
    r5.xw = r7.xx * r1.zw + r15.xy;
    r7.xy = r5.xw * UniformVector_4.xy - r13.xy;
    r5.xw = r1.xy * r3.xy;
    r1.xyz = r5.www * r12.xyw + ModShadowColor.xyz;
    r12.xy = r3.zz * r14.xy + r7.xy;
    ps = (-1.0) + r0.x;
    r5.x = saturate(r5.x - 0.5);
    r12.w = ps;
    r7.xy = r12.xy * r5.xx + r13.xy;
    r4.xz = r12.wz * r5.yx + float2(1.0, -2.0);
    r7.z = r4.w * 2.0 + r4.z;
    r7.xyz = r7.zxy * r5.yyy;
    ps = 1.0 + r7.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r5.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r5.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.y));
    r0.w = r6.w * r6.w;
    r5.y = ps;
    r7.xyz = r7.xyz * r5.yyy;
    r5.y = dot(r7.zxy, r11.zxy);
    r12.xyz = r7.xyz * r5.yyy;
    r11.xyz = r12.xyz * 2.0 - r11.xyz;
    r5.y = saturate(dot(r10.zxy, r11.zxy));
    ps = log2(r5.y);
    r5.w = saturate(dot(r7.zyx, r10.zyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.w = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_10.x * r5.y;
    r7.x = ps;
    r9.w = r7.x * r4.x;
    r7 = r9 * r8.xyzx;
    r7 = r7 * r4.xxxy;
    r3.xyz = r7.xyz * r3.xxx - r2.xyz;
    r4.xyz = r7.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r7.yzw = r4.xyz + r7.www;
    r2.xyz = r3.xyz * r5.xxx + r2.xyz;
    ps = LightColor.x * r6.y;
    r0.xyz = r2.xyz * r0.xyz;
    r7.x = ps;
    ps = LightColor.y * r6.z;
    r2.xyz = r0.www * r7.yzw;
    r7.y = ps;
    ps = pow(2.0, r6.w);
    r2.xyz = r2.xyz * r5.xxx;
    r5.x = ps;
    ps = LightColor.z * r6.x;
    r5.xyz = r2.xyz * r5.xxx;
    r7.z = ps;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r7.xyz * r5.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
