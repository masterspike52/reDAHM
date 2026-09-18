// ps_53344eceba74fe85.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040C00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r0.xy * UniformScalar_0.xx;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r9.xw = r6.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = r10.x;
    r6.xy = r0.wz * UniformVector_2.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.z = saturate(r4.w * 0.0001);
    r6.z = ps;
    ps = (-0.5) + r5.x;
    r6.zw = r6.zw * abs(r7.xy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r6.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_1, r5.yz).wxy;
    r0.xyz = tex2D(LightAttenuationTexture, r9.xw).xyz;
    ps = r1.z;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r6.w = float((UniformScalar_4.x >= 1.0));
    r3.w = ps;
    ps = -UniformVector_0.x;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r1.w = dot(r1.zxy, r1.zxy);
    r10.x = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r4.w = float((UniformScalar_4.x > 1.0));
    r7.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r7.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r0.xyz = r0.xyz * r2.www;
    r7.z = ps;
    r9.xw = r5.yw * 2.0 - 1.0;
    ps = (-1.0) + r5.x;
    r12.yzw = r8.wxy + float3(-2.0, 0.0, 0.0);
    r12.x = ps;
    ps = 1.0 - r5.z;
    r10.yzw = r7.xyz * r10.yzw;
    r5.x = saturate(ps);
    r6.xyz = (-abs(r4.www) >= 0.0) ? r6.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r5.y = saturate(r3.w * 5.0);
    r5.w = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r5.www * r1.xyz;
    r5.w = ps;
    r6.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r6.xyz;
    ps = 1.0 - r5.y;
    r11.xyz = r5.www * r3.xyz;
    r5.y = ps;
    ps = log2(r5.x);
    r12.yzw = r12.zwy + r8.xyw;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xy = r12.yz - 1.0;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r8.xy = r5.yy * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = r10.y;
    r5.xyz = r5.xxx * -SpotDirection.xyz;
    ps = r6.x * ps;
    r5.y = dot(r5.zxy, r2.zxy);
    r6.x = ps;
    ps = r10.z;
    r8.yzw = -r8.zxy + 1.0;
    r1.zw = r12.wx * r8.yy + 1.0;
    ps = r6.y * ps;
    r8.x = r8.y * UniformScalar_1.x;
    r6.y = ps;
    r5.xz = r8.xx * r9.xw + r1.xy;
    ps = r10.w;
    r1.xy = r5.xz * r8.yy;
    r1 = (r8.xyyy > 0.0) ? r1.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r2 = (r8.xyyy >= 0.0) ? r1 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r6.z * ps;
    r5.x = dot(r2.wyz, r2.wyz);
    r6.z = ps;
    ps = pow(2.0, r5.w);
    r1.xyz = r6.xyz * r2.xxx;
    r5.z = ps;
    r6.xyz = r1.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r0.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r2.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r11.zxy);
    r10.y = ps;
    ps = -UniformVector_0.z;
    r5.xzw = r3.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r7.zxy, r5.wxz));
    r10.z = ps;
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r10.xyz;
    r9.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r2.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r5.x = ps;
    r5.zw = r2.yz * r8.zw + 0.125;
    ps = pow(2.0, r2.x);
    r6.w = saturate(dot(r3.zyx, r7.zyx));
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = saturate(ps);
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r5.xw = r5.zy * r5.wy;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
