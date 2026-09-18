// ps_9007b75e10c2d744.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 282 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000468 10040F00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r6.w = ps;
    ps = r1.z;
    r2.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r7.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r7.x));
    r5.w = r11.w - 0.5;
    r7.x = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r7.xxx * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.zw = r9.xy * r5.ww;
    r3.y = ps;
    r7.xy = r3.xy - 0.5;
    r5.zw = float2((r3.xy >= 0.5));
    ps = r6.z;
    r7.xy = r7.xy - r3.xy;
    ps = abs(r8.x) * ps;
    r2.zw = r7.xy * r5.zw;
    r7.x = ps;
    ps = r6.w;
    r14 = r3.zwxy + r2;
    ps = abs(r8.y) * ps;
    r6.zw = r14.zw + r14.zw;
    r7.y = ps;
    r3.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r12 = tex2D(Texture2D_1, r6.zw);
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = 0.0001 * r4.w;
    r6.xy = r0.wz * 6.0;
    r2.x = saturate(ps);
    r2.yzw = tex2D(Texture2D_2, r6.xy).xyw;
    r6.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r7.xyw = tex2D(Texture2D_0, r14.xy).xyz;
    r7.xyz = r7.xyw * 2.0 - 1.0;
    r8.x = r2.w * r6.y - 1.0;
    ps = r6.x + r6.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    r6.xyz = r13.zxy * 2.0 - 1.0;
    ps = r6.w + r6.w;
    r8.y = dot(r5.zww, float3(1.0, 1.0, 1.0));
    r8.w = ps;
    r5.z = (r8.y == 0.0) ? r12.x : r12.y;
    r15 = r8.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r5.z = (r15.y == 0.0) ? r12.z : r5.z;
    r5.z = (r15.x == 0.0) ? r12.w : r5.z;
    ps = r2.y + r2.y;
    r5.w = max(r5.z, 0.0);
    r12.z = ps;
    ps = r2.z + r2.z;
    r5.xz = -r5.zx + 1.0;
    r12.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.x = min(r5.w, 0.3);
    r2.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r3.xyw = r3.yzx * float3(0.875, 0.875, 3.3333333);
    r2.z = ps;
    ps = UniformVector_4.x * r6.y;
    r2.xyw = -r2.yzx + 1.0;
    r13.x = ps;
    ps = UniformVector_4.y * r6.z;
    r12.xy = r3.xy * r2.xy;
    r13.y = ps;
    ps = UniformVector_4.z * r6.x;
    r12 = r12 + float4(0.125, 0.125, -1.0, -1.0);
    r13.z = ps;
    r8.yz = r12.zw * 0.5 + r15.zw;
    r5.yw = r3.ww * r8.yz + r13.xy;
    ps = 1.0 / r4.w;
    r10.xy = r5.yw - r7.xy;
    r5.y = ps;
    r5.yw = r10.zw * r5.yy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_6, r14.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.yw).zxy;
    r5.y = tex2D(Texture2D_4, r0.xy).x;
    ps = UniformVector_6.x * UniformVector_6.w;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r14.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r14.z = ps;
    ps = rsqrt(abs(r5.w));
    r11.xyz = r14.xyz * r11.xyz;
    r6.w = ps;
    r2.xyz = r11.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r8.w = -r7.z + r13.z;
    ps = 2.5 * r5.x;
    r5.w = r12.x * r12.y;
    r11.w = ps;
    r5.xzw = r5.www * r0.xyz + ModShadowColor.xyz;
    r1.w = r3.w * r8.x + 1.0;
    r0.x = saturate(r11.w * r1.w - 0.5);
    r8.xyz = r11.xyz * r1.www - r4.xyz;
    r4.xyz = r8.xyz * r0.xxx + r4.xyz;
    r7.xy = r10.xy * r0.xx + r7.xy;
    r7.z = r8.w * r0.x - 2.0;
    r7.z = r7.w * 2.0 + r7.z;
    r7.xyz = r7.zxy * r2.www;
    ps = 1.0 + r7.x;
    r0.yzw = r6.www * r1.xyz;
    r7.w = ps;
    r7.xyz = (r2.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r2.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.w));
    r1.xyz = r4.xyz * r3.xyz;
    r6.w = ps;
    r3.xyz = r7.xyz * r6.www;
    r6.w = dot(r3.zxy, r9.zxy);
    ps = UniformScalar_8.x * r5.y;
    r7.yzw = r3.xyz * r6.www;
    r7.x = ps;
    r7.yzw = r7.yzw * 2.0 - r9.xyz;
    ps = abs(r1.w) * abs(r1.w);
    r6.w = saturate(dot(r0.wyz, r7.wyz));
    r7.y = ps;
    ps = log2(r6.w);
    r5.y = saturate(dot(r3.zyx, r0.wzy));
    r6.w = ps;
    ps = r7.y * r7.y;
    r7.z = r6.w * UniformScalar_7.x;
    r7.y = ps;
    ps = pow(2.0, r7.z);
    r6.w = r6.w * 15.0;
    r7.z = ps;
    r0.yz = r7.xy * r7.zy;
    ps = LightColor.x * r6.y;
    r7.yzw = r2.xyz + r0.yyy;
    r7.x = ps;
    ps = LightColor.y * r6.z;
    r0.yzw = r0.zzz * r7.yzw;
    r7.y = ps;
    ps = pow(2.0, r6.w);
    r0.xyz = r0.yzw * r0.xxx;
    r6.w = ps;
    ps = LightColor.z * r6.x;
    r0.xyz = r0.xyz * r6.www;
    r7.z = ps;
    r6.xy = r1.xy * r5.yy + r0.xy;
    r6.z = r1.z * r5.y + r0.z;
    r6.xyz = r7.xyz * r6.xyz;
    r5.xyz = r6.xzy * r5.xwz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
