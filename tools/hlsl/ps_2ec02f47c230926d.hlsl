// ps_2ec02f47c230926d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10041000 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r0.xy);
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r1.z + 0.1;
    r6.y = ps;
    ps = rsqrt(abs(r5.z));
    r7.zw = r6.xy * abs(r8.xy);
    r5.w = ps;
    ps = -r0.z;
    r7.xy = r0.wz * 6.0;
    ps = 1.0 + ps;
    r9.xy = r0.wz * UniformVector_1.xy;
    r5.z = ps;
    ps = UniformVector_2.y * r5.z;
    r12.yz = r4.xy * ScreenPositionScaleBias.xy;
    r10.y = ps;
    ps = r13.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.z));
    r8.xyz = r5.www * r3.xyz;
    r5.w = ps;
    ps = (-0.5) + r6.x;
    r3.xyz = r5.www * -SpotDirection.xyz;
    r5.w = ps;
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = 5.0 * r5.x;
    r6.x = dot(r3.zxy, r2.zxy);
    r5.w = saturate(ps);
    ps = (-0.025) * r5.y;
    r5.x = r6.x - SpotAngles.x;
    r6.x = ps;
    ps = SpotAngles.y * r5.x;
    r10.zw = r8.xy * r6.xx;
    r12.x = saturate(ps);
    ps = UniformVector_2.x * r0.w;
    r6.yz = r0.xy * UniformScalar_0.xx;
    r10.x = ps;
    ps = 1.0 / r4.w;
    r6.xw = r10.xy - 0.5;
    r12.w = ps;
    ps = r12.x * r12.x;
    r11.xy = float2((r10.xy >= 0.5));
    r1.w = ps;
    ps = r12.y * r12.w;
    r2.xy = r6.xw - r10.xy;
    r6.x = ps;
    ps = r12.z * r12.w;
    r9.zw = r2.xy * r11.xy;
    r5.x = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r3 = r10.zwxy + r9;
    r2.x = ps;
    ps = ScreenPositionScaleBias.z + r5.x;
    r6.xw = r3.zw + r3.zw;
    r2.y = ps;
    r2.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r3.z = tex2D(Texture2D_5, r0.xy).x;
    r10.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r12.zw = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16 = tex2D(Texture2D_1, r6.xw);
    r9.xyz = tex2D(Texture2D_0, r3.xy).xyz;
    r3.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_2, r7.xy).xyw;
    r7.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    r6.xyz = tex2D(Texture2D_3, r6.yz).wxy;
    ps = 0.0001 * r4.w;
    r7.y = saturate(ps);
    ps = UniformVector_6.x * UniformVector_6.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.x = dot(r1.zxy, r1.zxy);
    r14.y = ps;
    r7.x = r15.z * r7.x - 1.0;
    ps = UniformVector_6.z * UniformVector_6.w;
    r4.xy = r15.xy + r15.xy;
    r14.z = ps;
    ps = rsqrt(abs(r5.x));
    r4.zw = r6.yz + r6.yz;
    r6.w = ps;
    ps = 1.0 - r5.z;
    r13.xyz = r14.xyz * r13.xyz;
    r5.x = saturate(ps);
    r14.xyz = r3.xyw * 2.0 - 1.0;
    r9.xyw = r9.xyz * 2.0 - 1.0;
    r11.w = r14.z * UniformVector_4.z - r9.w;
    ps = log2(r5.x);
    r3.xyw = r6.www * r1.xyz;
    r5.x = ps;
    ps = r7.z + r7.z;
    r15 = r4 - 1.0;
    r1.y = ps;
    ps = r7.w + r7.w;
    r1.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r1.z = ps;
    r5.z = (r1.x == 0.0) ? r16.x : r16.y;
    r4 = r1.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r11.xy = r15.xy * 0.5 + r4.zw;
    r5.z = (r4.y == 0.0) ? r16.z : r5.z;
    r5.z = (r4.x == 0.0) ? r16.w : r5.z;
    ps = 1.0 - r5.z;
    r6.w = max(r5.z, 0.0);
    r5.z = ps;
    ps = 1.0 - r5.w;
    r12.y = min(r6.w, 0.3);
    r5.y = ps;
    ps = (-1.0) + r6.x;
    r7.zw = r5.yy * ModShadowGroupColor.xy;
    r12.x = ps;
    ps = 2.5 * r5.z;
    r7.yzw = -r7.ywz + 1.0;
    r6.w = ps;
    ps = UniformScalar_1.x * r7.y;
    r12.yzw = r12.yzw * float3(3.3333333, 0.875, 0.875);
    r5.y = ps;
    r4 = r12 * r7.yxwz + float4(1.0, 1.0, 0.125, 0.125);
    r5.yz = r5.yy * r15.zw + r14.xy;
    r5.yz = r5.yz * UniformVector_4.xy - r9.xy;
    ps = r4.z * r4.w;
    r6.xyz = r13.xyz * r4.xxx;
    r5.w = ps;
    r0.xyz = r5.www * r0.xyz + ModShadowColor.xyz;
    r1.xyz = r6.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r5.yw = r12.yy * r11.xy + r5.yz;
    r11.xyz = r6.xyz * r4.yyy - r10.xyz;
    r5.z = saturate(r6.w * r4.y - 0.5);
    r6.xy = r5.yw * r5.zz + r9.xy;
    r10.xyz = r11.xyz * r5.zzz + r10.xyz;
    r5.y = r11.w * r5.z - 2.0;
    r6.z = r9.z * 2.0 + r5.y;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.y));
    r6.yzw = r10.xyz * r9.xyz;
    r5.y = ps;
    r7.xyz = r7.xyz * r5.yyy;
    r5.y = dot(r7.zxy, r8.zxy);
    r9.xyz = r7.xyz * r5.yyy;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.y = saturate(dot(r3.wxy, r8.zxy));
    ps = log2(r5.y);
    r6.x = saturate(dot(r7.zyx, r3.wyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r5.w = ps;
    ps = pow(2.0, r5.w);
    r5.y = r5.y * 15.0;
    r5.w = ps;
    ps = abs(r4.y) * abs(r4.y);
    r7.x = r5.w * UniformScalar_10.x;
    r5.w = ps;
    ps = r5.w * r5.w;
    r3.x = r7.x * r4.x;
    r3.y = ps;
    r7.xw = r3.xy * r3.zy;
    r7.xyz = r1.xyz + r7.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r7.xyz = r7.www * r7.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r7.xyz = r7.xyz * r5.zzz;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r7.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r2.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xyz * r1.www;
    r5.xyz = r5.xyz * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
