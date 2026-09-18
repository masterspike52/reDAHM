// ps_0bd6bb6116365d96.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003E4 10040F00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
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
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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

    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.xyz = tex2D(Texture2D_1, r5.xy).wxy;
    r6.yz = r0.wz * 0.5;
    r9.xy = r0.wz * UniformVector_5.xy;
    r12.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    r13.xy = r5.yz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.w = saturate(r5.w * 5.0);
    r7.x = saturate(ps);
    ps = 1.0 / r4.w;
    r5.w = -r5.w + 1.0;
    r13.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.yz = r5.ww * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = -r7.yxz + 1.0;
    r6.w = ps;
    ps = UniformScalar_1.x * r7.y;
    r6.xw = r6.xw * abs(r8.xy);
    r12.x = ps;
    r4.xy = r12.yz * r13.zz + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r8 = tex2D(Texture2D_3, r0.xy);
    r9.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r0.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.yz = tex2D(Texture2D_0, r6.yz).xy;
    r14.xy = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.x = float((UniformScalar_5.x >= 1.0));
    ps = UniformVector_4.x * UniformVector_4.w;
    r6.w = float((UniformScalar_5.x > 1.0));
    r11.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r0.w = dot(r1.zxy, r1.zxy);
    r11.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r1.w = dot(r2.zxy, r2.zxy);
    r11.z = ps;
    ps = (-1.0) + r5.x;
    r14.yw = r14.yx * 0.875;
    r14.x = ps;
    ps = rsqrt(abs(r1.w));
    r6.yz = r6.yz + r6.yz;
    r7.w = ps;
    ps = rsqrt(abs(r0.w));
    r5.z = saturate(-r1.w + 1.0);
    r5.y = ps;
    r0.xyz = r0.zxy * 2.0 - 1.0;
    r9.xyz = (-abs(r6.www) >= 0.0) ? r9.xyz : 1.0;
    r9.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r9.xyz;
    ps = UniformVector_2.z * r0.x;
    r6.w = float((r8.w >= 0.5));
    r6.x = ps;
    ps = UniformScalar_6.x * r6.w;
    r11.xyz = r11.xyz * r8.xyz;
    r5.x = ps;
    ps = 1.0 - r6.w;
    r8.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = log2(r5.z);
    r15.xyz = r7.www * -SpotDirection.xyz;
    r5.z = ps;
    r1.xyz = r5.yyy * UniformVector_3.yxz + r5.xxx;
    ps = rsqrt(abs(r5.w));
    r5.y = dot(r15.zxy, r2.zxy);
    r5.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r3.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.yxz - 1.0;
    r11.w = saturate(ps);
    ps = 0.012 * r6.x;
    r2.yzw = r11.xyz * r9.xyz;
    r9.x = ps;
    ps = 0.012 * r6.z;
    r14.z = r6.y * r6.w;
    r9.y = ps;
    r1.w = r14.z * r7.y + 1.0;
    r11.xyz = r14.xyw * r7.yzx + float3(1.0, 0.125, 0.125);
    r5.x = (r12.x > 0.0) ? r11.x : 1.0;
    r5.yw = r12.xx * r13.xy + r0.yz;
    r6.xy = r5.yw * UniformVector_2.xy - r9.xy;
    r6.z = (r12.x >= 0.0) ? r5.x : 1.0;
    ps = -UniformVector_0.x;
    r0.xy = r11.zw * r11.yw;
    r5.xyw = r0.xxx * r10.xyz + ModShadowColor.xyz;
    ps = 1.0 + ps;
    r6.xzw = r6.wxy * r6.zww;
    r2.x = ps;
    ps = -UniformVector_0.y;
    r6.zw = r9.xy + r6.zw;
    ps = 1.0 + ps;
    r0.xzw = r2.yzw * r6.xxx;
    r2.y = ps;
    r1.z = r0.w * UniformScalar_7.x + r1.z;
    r6.xy = r0.xz * UniformScalar_7.xx + r1.yx;
    ps = -UniformVector_0.z;
    r1.xy = r6.zw * r7.yy;
    r1.xyw = (r7.yyy > 0.0) ? r1.xyw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.yyy >= 0.0) ? r1.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.z = dot(r7.zxy, r7.zxy);
    r2.z = ps;
    ps = rsqrt(abs(r6.z));
    r1.xy = r0.xz * r2.xy;
    r6.z = ps;
    r7.xyz = r7.xyz * r6.zzz;
    r6.z = dot(r7.zxy, r3.zxy);
    r9.xyz = r7.xyz * r6.zzz;
    r3.xyz = r9.xyz * 2.0 - r3.xyz;
    r6.w = saturate(dot(r8.zxy, r3.zxy));
    ps = log2(r6.w);
    r6.z = r0.w * r2.z;
    r6.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r6.w = r6.w * 15.0;
    r5.z = ps;
    ps = pow(2.0, r6.w);
    r7.y = saturate(dot(r7.zxy, r8.zxy));
    r7.x = ps;
    ps = pow(2.0, r5.z);
    r6.xyz = r6.xyz * r7.xxy;
    r5.z = ps;
    r6.xyz = r1.xyz * r7.yyx + r6.xyz;
    r6.xyz = r6.xyz * r5.zzz;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r0.yyy;
    r5.xyz = r6.xyz * r5.xyw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
