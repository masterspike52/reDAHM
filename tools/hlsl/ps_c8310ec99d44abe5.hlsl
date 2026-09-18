// ps_c8310ec99d44abe5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041200 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = r10.w - 0.5;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.yz = r5.yz * abs(r8.xy);
    r8.x = ps;
    r6.yz = tex2D(ModShadowAccumTexture, r5.yz).xy;
    ps = r4.w;
    r5.yw = r0.wz * 6.0;
    ps = (-4e+02) + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = 1.0 / r4.w;
    r7.xy = r4.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r7.xy = r7.xy * r6.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.z));
    r6.x = saturate(r6.x * 0.00022222222);
    r5.z = ps;
    ps = -r0.z;
    r9.xyz = r5.zzz * r3.xyz;
    ps = 1.0 + ps;
    r15.xyz = r6.xyz * float3(-0.025, 0.875, 0.875);
    r5.z = ps;
    ps = UniformVector_2.y * r5.z;
    r8.zw = r9.xy * r15.xx;
    r8.y = ps;
    ps = r0.w;
    r6.yz = r8.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r17.xy = float2((r8.xy >= 0.5));
    r6.x = ps;
    ps = r0.z;
    r6.yz = r6.yz - r8.xy;
    ps = UniformVector_1.y * ps;
    r6.zw = r6.yz * r17.xy;
    r6.y = ps;
    r6 = r8.zwxy + r6;
    r7.zw = r6.zw + r6.zw;
    r11.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r16 = tex2D(Texture2D_1, r7.zw);
    r18.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r5.yw).wxy;
    r8.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r5.w = tex2D(Texture2D_4, r0.xy).x;
    r5.z = dot(r1.zxy, r1.zxy);
    r8.x = r7.x * r8.x - 1.0;
    r6.xyw = r6.zxy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r3.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r7.w = saturate(ps);
    r0.xyz = r12.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r12.xyz = r3.xyz * r10.xyz;
    r5.y = ps;
    r3.xyz = r12.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r7.w);
    r13.xyz = r0.xyz * UniformVector_4.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r8.w = -r6.x + r13.z;
    r5.z = ps;
    ps = r4.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = saturate(ps);
    ps = r1.z;
    r0.xyz = r18.xyz * r2.www;
    ps = 0.1 + ps;
    r4.yzw = r5.zzz * r1.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r5.yyy * -SpotDirection.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.z = dot(r1.zxy, r2.zxy);
    r5.x = ps;
    ps = r8.y + r8.y;
    r0.xyz = r0.xzy * r5.xxx;
    r1.y = ps;
    ps = r8.z + r8.z;
    r1.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r1.z = ps;
    r5.y = (r1.x == 0.0) ? r16.x : r16.y;
    ps = 5.0 * r6.x;
    r2 = r1.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.x = saturate(ps);
    r5.y = (r2.y == 0.0) ? r16.z : r5.y;
    r5.y = (r2.x == 0.0) ? r16.w : r5.y;
    ps = r7.y + r7.y;
    r7.w = max(r5.y, 0.0);
    r1.z = ps;
    ps = r7.z + r7.z;
    r5.xy = -r5.yx + 1.0;
    r1.w = ps;
    ps = r7.w;
    r7.yz = r5.yy * ModShadowGroupColor.xy;
    r8.y = ps;
    ps = 0.3;
    r7.xyw = -r7.yzx + 1.0;
    r8.z = ps;
    ps = min(r8.y, r8.z);
    r1.xy = r15.yz * r7.xy;
    r5.y = ps;
    ps = 2.5 * r5.x;
    r1 = r1 + float4(0.125, 0.125, -1.0, -1.0);
    r12.w = ps;
    r8.yz = r1.zw * 0.5 + r2.zw;
    ps = 3.3333333 * r5.y;
    r7.z = r1.x * r1.y;
    r5.x = ps;
    r7.xyz = r7.zzz * r14.xyz + ModShadowColor.xyz;
    r1.xy = r5.xx * r8.yz + r13.xy;
    r5.x = r5.x * r8.x + 1.0;
    r1.w = saturate(r12.w * r5.x - 0.5);
    r8.xyz = r12.xyz * r5.xxx - r11.xyz;
    ps = abs(r5.x) * abs(r5.x);
    r5.x = ps;
    ps = r5.x * r5.x;
    r1.yz = r1.xy - r6.yw;
    r1.x = ps;
    r11.xyz = r8.xyz * r1.www + r11.xyz;
    r5.x = r8.w * r1.w - 2.0;
    r6.z = r6.z * 2.0 + r5.x;
    r2.xyw = r1.yzx * r1.wwx;
    r6.xy = r6.yw + r2.xy;
    r6.xyz = r6.zxy * r7.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r7.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r8.xyz = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r8.zxy, r8.zxy);
    ps = rsqrt(abs(r5.x));
    r6.xyw = r11.xyz * r10.xyz;
    r5.x = ps;
    r8.xyz = r8.xyz * r5.xxx;
    r5.x = dot(r8.zxy, r9.zxy);
    ps = UniformScalar_8.x * r5.w;
    r10.xyz = r8.xyz * r5.xxx;
    r4.x = ps;
    r5.xyw = r10.xyz * 2.0 - r9.xyz;
    ps = -SpotAngles.x - -r5.z;
    r5.y = saturate(dot(r4.wyz, r5.wxy));
    r5.x = ps;
    ps = log2(r5.y);
    r6.z = saturate(dot(r8.zyx, r4.wzy));
    r5.z = ps;
    ps = SpotAngles.y * r5.x;
    r5.y = r5.z * UniformScalar_7.x;
    r4.y = saturate(ps);
    ps = pow(2.0, r5.y);
    r5.z = r5.z * 15.0;
    r4.z = ps;
    r5.xy = r4.xy * r4.zy;
    r2.xyz = r3.xyz + r5.xxx;
    r2.xyz = r2.www * r2.xyz;
    ps = pow(2.0, r5.z);
    r1.xyz = r2.xyz * r1.www;
    r5.z = ps;
    r5.xzw = r1.xyz * r5.zzz;
    r6.xy = r6.xy * r6.zz + r5.xz;
    r6.z = r6.w * r6.z + r5.w;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.yyy;
    r5.xyz = r5.xzy * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
