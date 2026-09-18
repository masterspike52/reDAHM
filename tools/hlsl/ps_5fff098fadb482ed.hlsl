// ps_5fff098fadb482ed.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 330 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000528 10040F00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
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
sampler2D ModShadowAccumTexture : register(s9);

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

    r9 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 - r0.z;
    r6.w = saturate(r4.w * 0.0001);
    r5.z = ps;
    ps = UniformVector_2.y * r5.z;
    r5.y = r9.w - 0.5;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    r13.xy = r0.wz * 6.0;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r6.x = ps;
    ps = (-0.5) + r5.z;
    r5.yw = float2((r5.xz >= 0.5));
    r6.y = ps;
    r6.xy = r6.xy - r5.xz;
    r5.xz = r6.xy * r5.yw + r5.xz;
    r5.xz = r5.xz + r5.xz;
    r7 = tex2D(Texture2D_1, r5.xz);
    r12.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = r0.w;
    r13.zw = r0.wz * UniformVector_7.xy;
    ps = UniformVector_1.x * ps;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r14.x = ps;
    ps = r0.z;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = UniformVector_1.y * ps;
    r6.y = r4.w - 4e+02;
    r14.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r1.z + 0.1;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r2.zxy, r2.zxy);
    r10.y = ps;
    ps = rsqrt(abs(r5.z));
    r11.yz = r12.xy + r12.xy;
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r6.yz = saturate(r6.yz * float2(0.00022222222, 5.0));
    r1.w = ps;
    ps = r1.w;
    r8.xy = r10.xy * abs(r8.xy);
    ps = r3.x * ps;
    r10.yzw = r5.xxx * -SpotDirection.xyz;
    r10.x = ps;
    ps = r1.w;
    r5.x = dot(r10.wyz, r2.zxy);
    ps = r3.y * ps;
    r5.x = r5.x - SpotAngles.x;
    r10.y = ps;
    ps = SpotAngles.y * r5.x;
    r11.x = dot(r5.yww, float3(1.0, 1.0, 1.0));
    r15.x = saturate(ps);
    r5.x = (r11.x == 0.0) ? r7.x : r7.y;
    ps = 1.0 / r4.w;
    r11 = r11.yzxx + float4(-1.0, -1.0, -3.0, -2.0);
    r15.w = ps;
    r6.x = (r11.w == 0.0) ? r7.z : r5.x;
    ps = r1.w;
    r5.xyw = r15.yzx * r15.wwx;
    r4.z = (r11.z == 0.0) ? r7.w : r6.x;
    ps = r3.z * ps;
    r6.x = max(r4.z, 0.0);
    r10.z = ps;
    ps = ScreenPositionScaleBias.w + r5.x;
    r6.x = min(r6.x, 0.3);
    r8.z = ps;
    ps = ScreenPositionScaleBias.z + r5.y;
    r7.xz = -r6.zw + 1.0;
    r8.w = ps;
    ps = r6.y;
    r4.xy = r7.xx * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = (-0.025) * r5.y;
    r7.xyw = -r4.xzy + 1.0;
    r5.x = ps;
    ps = 3.3333333 * r6.x;
    r10.w = r7.y * 2.5;
    r7.y = ps;
    r5.xy = r10.xy * r5.xx + r14.xy;
    r1.w = tex2D(Texture2D_4, r0.xy).x;
    r3.xyz = tex2D(Texture2D_7, r5.xy).xyz;
    r4.xyz = tex2D(Texture2D_6, r13.zw).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r14.xyw = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r6.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r0.xyw = tex2D(Texture2D_2, r13.xy).xwy;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r1.zxy, r1.zxy);
    r8.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r11.w = r0.y * r12.w - 1.0;
    ps = r0.x + r0.x;
    r8.xyz = r8.xyz * r9.xyz;
    r14.z = ps;
    r9.xyz = r6.xyw * 2.0 - 1.0;
    ps = 1.0 - r5.z;
    r14.xyw = r14.xyw * r2.www;
    r5.z = saturate(ps);
    r2.xyz = r12.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r12.xyz = r2.xyz * UniformVector_4.xyz;
    r6.z = ps;
    ps = log2(r5.z);
    r2.xyz = r6.zzz * r1.xyz;
    r5.z = ps;
    ps = 0.875 * r5.x;
    r5.z = r5.z * LightColorAndFalloffExponent.w;
    r1.x = ps;
    ps = pow(2.0, r5.z);
    r11.z = -r9.z + r12.z;
    r5.z = ps;
    ps = 0.875 * r5.y;
    r0.xyz = r14.xwy * r5.zzz;
    r1.y = ps;
    ps = r0.w + r0.w;
    r14.xy = r1.xy * r7.xw;
    r14.w = ps;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r11.xy = r14.zw * 0.5 + r11.xy;
    ps = r14.x * r14.y;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    r6.xyz = r5.yyy * r13.xyz + ModShadowColor.xyz;
    r5.yz = r7.yy * r11.xy + r12.xy;
    r7.y = r7.y * r11.w + 1.0;
    r7.x = saturate(r10.w * r7.y - 0.5);
    r11.xy = r5.yz - r9.xy;
    r9.xy = r11.xy * r7.xx + r9.xy;
    r5.y = r11.z * r7.x - 2.0;
    r9.z = r6.w * 2.0 + r5.y;
    r9.xyw = r9.xyz * r7.zzz;
    ps = abs(r7.y) * abs(r7.y);
    r9.z = r9.w + 1.0;
    r5.z = ps;
    r9.xyz = (r7.zzz > 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    r9.xyz = (r7.zzz >= 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.z * r5.z;
    r5.y = dot(r9.zxy, r9.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r0.w = r5.z * r5.z;
    r5.y = ps;
    r9.xyz = r9.xyz * r5.yyy;
    r5.y = dot(r9.zxy, r10.zxy);
    r11.xyz = r9.xyz * r5.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r5.y = saturate(dot(r2.zxy, r10.zxy));
    ps = log2(r5.y);
    r5.z = saturate(dot(r9.zyx, r2.zyx));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r7.z = ps;
    ps = pow(2.0, r7.z);
    r6.w = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r5.y;
    r8.w = ps;
    r4 = r8 * r4.xyzx;
    r2.xyz = r4.xyz * r7.yyy - r3.xyz;
    r7.yzw = r4.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r7.yzw = r4.www * r1.www + r7.yzw;
    r2.xyz = r2.xyz * r7.xxx + r3.xyz;
    r1.xyz = r2.xyz * r1.xyz;
    r7.yzw = r0.www * r7.yzw;
    ps = pow(2.0, r6.w);
    r7.xyz = r7.yzw * r7.xxx;
    r6.w = ps;
    r7.xyz = r7.xyz * r6.www;
    r7.xy = r1.xy * r5.zz + r7.xy;
    r7.z = r1.z * r5.z + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r7.xzy * r5.www;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
