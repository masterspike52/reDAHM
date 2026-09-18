// ps_867623c7cb38ca02.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041000 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
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
sampler2D ModShadowAccumTexture : register(s8);

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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = r14.w - 0.5;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    r5.yz = r5.yz * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.zw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r5.y = r4.w - 4e+02;
    ps = r1.z;
    r6.x = -r0.z + 1.0;
    ps = 0.1 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r10.y = r6.x * UniformVector_2.y;
    r5.w = ps;
    ps = 0.00022222222 * r5.y;
    r8.xy = r0.wz * UniformVector_1.xy;
    r6.y = saturate(ps);
    ps = 5.0 * r5.z;
    r9.xyz = r5.www * r3.xyz;
    r6.x = saturate(ps);
    ps = r0.w;
    r11.xzw = r6.yzw * float3(-0.025, 0.875, 0.875);
    ps = UniformVector_2.x * ps;
    r10.zw = r9.xy * r11.xx;
    r10.x = ps;
    r7.xy = r10.xy - 0.5;
    r5.yz = float2((r10.xy >= 0.5));
    ps = r0.w;
    r7.xy = r7.xy - r10.xy;
    ps = 6.0 * ps;
    r8.zw = r7.xy * r5.yz;
    r7.x = ps;
    ps = r0.z;
    r15 = r10.zwxy + r8;
    ps = 6.0 * ps;
    r7.zw = r15.zw + r15.zw;
    r7.y = ps;
    r16 = tex2D(Texture2D_1, r7.zw);
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r7.xy).yxw;
    r12.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r3.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r10.xyz = r3.xyw * 2.0 - 1.0;
    r12.x = r7.z * r12.x - 1.0;
    ps = r7.y + r7.y;
    r11.xy = r4.xy * ScreenPositionScaleBias.xy;
    r13.z = ps;
    r8.xyz = r8.xyz * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r7.yz = r12.yz + r12.yz;
    r13.w = ps;
    ps = 1.0 - r6.x;
    r7.x = dot(r5.yzz, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r5.y = (r7.x == 0.0) ? r16.x : r16.y;
    ps = ModShadowGroupColor.x * r5.z;
    r6 = r7.yzxx + float4(-1.0, -1.0, -2.0, -3.0);
    r7.y = ps;
    r5.y = (r6.z == 0.0) ? r16.z : r5.y;
    r7.x = (r6.w == 0.0) ? r16.w : r5.y;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = max(r7.x, 0.0);
    r7.z = ps;
    ps = r5.y;
    r8.xyw = r8.xyz * UniformVector_4.xyz;
    r5.y = ps;
    ps = 0.0001 * r4.w;
    r0.w = -r10.z + r8.w;
    r7.w = saturate(ps);
    ps = 0.3;
    r7 = -r7 + 1.0;
    r5.z = ps;
    ps = min(r5.y, r5.z);
    r13.xy = r11.zw * r7.yz;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r13 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r6.w = ps;
    r12.yz = r13.zw * 0.5 + r6.xy;
    r5.yz = r6.ww * r12.yz + r8.xy;
    ps = 1.0 / r4.w;
    r11.zw = r5.yz - r10.xy;
    r5.y = ps;
    r5.yz = r11.xy * r5.yy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r6.xyz = tex2D(Texture2D_6, r15.xy).xyz;
    r5.y = tex2D(Texture2D_4, r0.xy).x;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 - r5.x;
    r0.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r5.z = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r8.xyz = r0.xyz * r14.xyz;
    r5.x = ps;
    r4.xyz = r8.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r5.z);
    r0.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r0.zxy, r2.zxy);
    r1.w = ps;
    ps = -SpotAngles.x - -r5.z;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    ps = r7.x;
    r2.xyz = r1.www * r1.xyz;
    r5.z = ps;
    ps = 2.5 * r5.z;
    r1.x = r13.x * r13.y;
    r8.w = ps;
    r7.xyz = r1.xxx * r0.xyz + ModShadowColor.xyz;
    r6.w = r6.w * r12.x + 1.0;
    r5.z = saturate(r8.w * r6.w - 0.5);
    r0.xyz = r8.xyz * r6.www - r6.xyz;
    ps = SpotAngles.y * r5.w;
    r1.x = abs(r6.w) * abs(r6.w);
    r1.y = saturate(ps);
    r8.xyz = r0.xyz * r5.zzz + r6.xyz;
    r6.xy = r11.zw * r5.zz + r10.xy;
    r5.w = r0.w * r5.z - 2.0;
    r6.z = r3.w * 2.0 + r5.w;
    r6.xyz = r6.zxy * r7.www;
    ps = 1.0 + r6.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r7.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.w));
    r0.xyz = r8.xyz * r0.xyz;
    r5.w = ps;
    r8.xyz = r6.xyz * r5.www;
    r5.w = dot(r8.zxy, r9.zxy);
    ps = UniformScalar_8.x * r5.y;
    r6.yzw = r8.xyz * r5.www;
    r6.x = ps;
    r6.yzw = r6.yzw * 2.0 - r9.xyz;
    ps = r1.x * r1.x;
    r5.y = saturate(dot(r2.zxy, r6.wyz));
    r6.y = ps;
    ps = log2(r5.y);
    r7.w = saturate(dot(r8.zyx, r2.zyx));
    r5.y = ps;
    ps = r1.y * r1.y;
    r5.w = r5.y * UniformScalar_7.x;
    r6.w = ps;
    ps = pow(2.0, r5.w);
    r5.y = r5.y * 15.0;
    r6.z = ps;
    r1.xw = r6.xy * r6.zy;
    r1.xyz = r4.xyz + r1.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r1.www * r1.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r1.xyz = r1.xyz * r5.zzz;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r7.ww + r5.yz;
    r5.w = r0.z * r7.w + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r6.www;
    r5.xyz = r5.xyz * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
