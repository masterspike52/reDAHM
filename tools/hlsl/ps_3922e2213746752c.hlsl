// ps_3922e2213746752c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040C00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r0.w * UniformVector_2.x;
    r6.y = ps;
    ps = 1.0 / r4.w;
    r5.x = -r0.z + 1.0;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r5.w = dot(r1.zxy, r1.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.xy = r6.xy * abs(r8.xy);
    r6.w = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r6.z = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    r5.zw = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.z));
    r9.xyz = r6.www * r1.zxy;
    r6.z = ps;
    ps = UniformVector_2.y * r5.x;
    r3.xyw = r6.zzz * r3.xyz;
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r9.yz * -r3.xy;
    r7.z = ps;
    ps = (-0.5) + r5.x;
    r11.xy = float2((r5.yx >= 0.5));
    r7.w = ps;
    r7.zw = r7.zw - r5.yx;
    r7.zw = r7.zw * r11.xy + r5.yx;
    r3.xyz = tex2D(Texture2D_3, r0.wz).xyz;
    r9.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    ps = 0.1 - -r1.z;
    r7.xyw = r7.zwx + r7.zwy;
    r5.x = ps;
    r10 = tex2D(Texture2D_2, r7.xy);
    r12.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8 = tex2D(Texture2D_1, r0.xy);
    r5.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = 5.0 * r5.x;
    r0.xy = r5.yz * 0.875;
    r5.x = saturate(ps);
    ps = r8.w;
    r4.yzw = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = 1.0 - r5.y;
    r5.z = r8.w * UniformScalar_0.x;
    r5.y = ps;
    r6.xyz = r5.yyy * UniformVector_1.xyz + r5.zzz;
    ps = 1.0 - r5.x;
    r7.xyz = r12.xyz * LightColor.xyz;
    r5.z = ps;
    r4.x = r3.w * 2.0 - r3.w;
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r5.w = (r5.y == 0.0) ? r10.x : r10.y;
    ps = ModShadowGroupColor.y * r5.z;
    r0.zw = r5.yy + float2(-3.0, -2.0);
    r5.y = ps;
    r5.z = (r0.w == 0.0) ? r10.z : r5.w;
    r5.w = (r0.z == 0.0) ? r10.w : r5.z;
    r5.z = saturate(r9.x * r4.x + r7.w);
    ps = log2(r5.z);
    r5.xyw = -r5.xyw + 1.0;
    r9.x = ps;
    r5.w = saturate(r5.w * 2.5 - 0.5);
    r5.xy = r0.xy * r5.xy + 0.125;
    ps = r5.x * r5.y;
    r0 = r9.yzwx * float4(0.5, 0.5, 0.5, 15.0);
    r5.x = ps;
    r5.xyz = r5.xxx * r4.yzw + ModShadowColor.xyz;
    r4.xyz = r0.xyz * r8.www;
    r6.xyz = r4.xyz * UniformScalar_1.xxx + r6.xyz;
    r4.xyz = r8.xyz * 2e+01 + r4.xyz;
    r0.xyz = r4.xyz - r3.xyz;
    ps = pow(2.0, r0.w);
    r4.xyz = r6.xyz * r5.www;
    r6.x = ps;
    ps = r6.w;
    r6.xyz = r4.xyz * r6.xxx;
    r0.xyz = r0.xyz * r5.www + r3.xyz;
    ps = r1.z * ps;
    r0.xyz = r0.xyz * r2.xyz;
    r5.w = saturate(ps);
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
