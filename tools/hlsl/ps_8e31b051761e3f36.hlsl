// ps_8e31b051761e3f36.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041700 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    r5.zw = r5.zw * abs(r8.xy);
    r12.y = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r7.xyz = tex2D(Texture2D_4, r5.xy).wxy;
    ps = (-4e+02) - -r4.w;
    r5.x = ps;
    ps = r1.z;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.1 + ps;
    r6.xy = r0.wz * UniformVector_1.xy;
    r5.z = ps;
    ps = 0.00022222222 * r5.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r10.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r12.zw = r7.yz + r7.yz;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.xxx * r3.xyz;
    r5.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r19.xyz = r10.xyz * float3(-0.025, 0.875, 0.875);
    r5.x = ps;
    r9.xy = r8.xy * r19.xx + r6.xy;
    ps = 5.0 * r5.z;
    r6.xyz = r9.zwy * r5.wwx;
    r6.w = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r5.xw = -r6.zw + 1.0;
    r5.z = ps;
    ps = 1.0 - r0.z;
    r7.w = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    r5.xyz = r5.xyz * UniformVector_2.yyx;
    r12.x = r5.z * r9.x;
    r3.yz = r0.wz * UniformVector_7.xy;
    ps = (-0.5) + r5.x;
    r11 = r0.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r3.x = ps;
    ps = (-0.5) + r5.y;
    r22.xy = float2((r5.xy >= 0.5));
    r3.w = ps;
    r3.xw = r3.xw - r5.xy;
    r10.yw = r3.xw * r22.xy + r5.xy;
    r18 = r12 + float4(-0.5, -0.5, -1.0, -1.0);
    r3.xw = float2((r12.xy >= 0.5));
    ps = ScreenPositionScaleBias.w + r6.x;
    r10.xz = r18.xy - r12.xy;
    r5.x = ps;
    r10.xz = r10.xz * r3.xw + r12.xy;
    ps = ScreenPositionScaleBias.z + r6.y;
    r10 = r10 + r10;
    r5.y = ps;
    r12.xyz = tex2D(Texture2D_8, r9.xy).xyz;
    r13.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r20 = tex2D(Texture2D_1, r10.zw);
    r21 = tex2D(Texture2D_1, r10.xy);
    r22.zw = tex2D(Texture2D_3, r11.zw).xy;
    r10 = tex2D(Texture2D_6, r0.xy);
    r6.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r17.xyz = tex2D(Texture2D_9, r3.yz).xyz;
    r14.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r16.xyw = tex2D(Texture2D_2, r11.xy).xyw;
    r9.xyz = tex2D(Texture2D_0, r9.xy).xyz;
    r0.w = float((UniformScalar_5.x >= 1.0));
    r5.x = dot(r2.zxy, r2.zxy);
    r11.xyw = r9.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r0.xy = r16.xy + r16.xy;
    r5.y = saturate(ps);
    ps = r14.y + r14.y;
    r6.w = float((UniformScalar_5.x > 1.0));
    r0.z = ps;
    r17.xyz = (-abs(r6.www) >= 0.0) ? r17.xyz : 1.0;
    r6.xyw = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.z = float((r10.w >= 0.5));
    r5.x = ps;
    r17.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r17.xyz;
    ps = log2(r5.y);
    r23.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = r14.z + r14.z;
    r5.y = dot(r23.zxy, r2.zxy);
    r0.w = ps;
    ps = r4.w;
    r0 = r0 - 1.0;
    r14.yz = r0.xy * 0.5 + r0.zw;
    r3.yz = r22.zw * 2.0 - 1.0;
    r0.xw = r22.xy * 2.0 + r3.xw;
    r0.z = (r0.x == 0.0) ? r21.x : r21.y;
    r0.y = (r0.w == 0.0) ? r20.x : r20.y;
    ps = 0.0001 * ps;
    r4 = r0.wxxw + float4(-3.0, -2.0, -3.0, -2.0);
    r0.x = saturate(ps);
    r0.y = (r4.w == 0.0) ? r20.z : r0.y;
    r0.z = (r4.y == 0.0) ? r21.z : r0.z;
    r4.z = (r4.z == 0.0) ? r21.w : r0.z;
    r0.w = (r4.x == 0.0) ? r20.w : r0.y;
    ps = ModShadowGroupColor.x * r5.w;
    r0.z = max(r0.w, 0.0);
    r0.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r3.x = min(r0.z, 0.3);
    r0.z = ps;
    r0 = -r0.wyzx + 1.0;
    ps = r0.w;
    r4.xy = r19.yz * r0.yz;
    r5.z = ps;
    ps = UniformScalar_1.x * r5.z;
    r3.xyz = r3.yzx * float3(0.012, 0.012, 3.3333333);
    r3.w = ps;
    r5.zw = r3.ww * r18.zw + r6.xy;
    ps = r16.w;
    r16.xyz = r4.xyz + float3(0.125, 0.125, 0.25);
    r5.zw = r5.zw * UniformVector_4.xy - r3.xy;
    r3.xy = r5.zw * r6.zz + r3.xy;
    ps = r14.x * ps;
    r5.w = r16.z + r4.z;
    r5.z = ps;
    ps = rsqrt(abs(r7.w));
    r1.w = saturate(r5.w - r5.z);
    r5.w = ps;
    r4.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = (-1.0) + r7.x;
    r13.xyz = r13.xyz * r2.www;
    r14.x = ps;
    ps = UniformVector_4.z * r6.w;
    r7.yzw = r4.xyz * r10.xyz;
    r7.x = ps;
    ps = 1.0 - r6.z;
    r2.xyz = r5.www * r1.xyz;
    r5.w = ps;
    ps = (-1.0) - -r5.z;
    r10.yzw = r5.www * UniformVector_5.xyz;
    r14.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r4.xyz = r7.yzw * r17.xyz;
    r6.y = ps;
    ps = -SpotAngles.x - -r5.y;
    r7.yzw = r3.zzz * r14.yzw;
    r5.x = ps;
    ps = r0.x;
    r6.xw = r7.xw + float2(-1.0, 1.0);
    r5.z = ps;
    ps = 2.5 * r5.z;
    r7.xy = r3.xy + r7.yz;
    r5.w = ps;
    ps = abs(r6.w) * abs(r6.w);
    r5.yz = -r11.xy + r7.xy;
    r16.w = ps;
    r7.w = saturate(r5.w * r6.w - 0.5);
    r14.yz = r5.yz * r7.ww + r11.xy;
    ps = SpotAngles.y * r5.x;
    r3.yz = r16.wx * r16.wy;
    r3.x = saturate(ps);
    r7.xyz = r3.zzz * r15.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.y);
    r5.yzw = r14.yxz * r0.www;
    r5.x = ps;
    ps = 1.0 + r5.z;
    r0.xyz = r13.xzy * r5.xxx;
    r5.x = ps;
    r5.x = (r3.w > 0.0) ? r5.x : 1.0;
    r6.y = (r3.w >= 0.0) ? r5.x : 1.0;
    r1.xy = r6.zx * r6.yz;
    ps = -r11.w;
    r11.xyz = r1.www * r12.xyz;
    ps = r1.y + ps;
    r4.xyz = r4.xyz * r1.xxx;
    r5.x = ps;
    r12.yzw = r4.xyz * r6.www - r11.xyz;
    ps = 1.0 + r5.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r12.x = ps;
    r10.x = r12.x * r7.w - 2.0;
    r11.xyz = r12.yzw * r7.www + r11.xyz;
    ps = UniformScalar_6.x * r6.z;
    r1.xyz = r11.xyz * r1.xyz;
    r9.w = ps;
    r6 = r10 + r9.zwww;
    r6.yzw = r4.xyz * UniformScalar_7.xxx + r6.yzw;
    ps = r3.x * r3.x;
    r5.x = r6.x + r9.z;
    r6.x = ps;
    r5.x = r5.x * r0.w + 1.0;
    r5.xyz = (r0.www > 0.0) ? r5.ywx : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r3.y * r3.y;
    r5.x = dot(r5.wyz, r5.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r7.www * r6.yzw;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r5.x);
    r6.yzw = r3.xyz * r6.yzw;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r2.zyx));
    r5.x = ps;
    r5.xyz = r6.yzw * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xxx;
    r5.xyz = r5.xzy * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
