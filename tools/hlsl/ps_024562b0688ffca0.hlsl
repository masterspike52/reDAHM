// ps_024562b0688ffca0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041200 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r10 = r0.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r11.z = ps;
    r9.xyw = tex2D(Texture2D_2, r10.xy).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = -r0.z + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.y = r4.w - 4e+02;
    r5.z = ps;
    r7.yw = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r13.zw = r6.xz * abs(r8.xy);
    r5.w = ps;
    ps = r1.z;
    r13.xy = r0.xy * UniformScalar_0.xx;
    ps = 0.1 + ps;
    r10.xy = r0.wz * UniformVector_7.xy;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r7.z = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r6.xz = r0.wz * UniformVector_1.xy;
    r7.x = saturate(ps);
    ps = 1.0 / r4.w;
    r9.xyz = r5.www * r3.xyz;
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r3.xyz = r7.ywx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    r12.xy = r9.xy * r3.zz + r6.xz;
    ps = UniformVector_2.x * r5.z;
    r7.xyw = r12.zwy * r5.yyx;
    r5.x = ps;
    ps = r5.x;
    r6.xz = -r7.wz + 1.0;
    ps = r12.x * ps;
    r11.yw = r6.xy * UniformVector_2.yy;
    r11.x = ps;
    r18 = float4((r11.xywz >= 0.5));
    ps = 0.0001 * r4.w;
    r5 = r11 - 0.5;
    r15.w = saturate(ps);
    ps = ScreenPositionScaleBias.w + r7.x;
    r5 = r5.xywz - r11.xywz;
    r6.x = ps;
    r5 = r5.xywz * r18.xywz + r11;
    ps = ScreenPositionScaleBias.z + r7.y;
    r5 = r5 + r5;
    r6.y = ps;
    r8.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r11.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    r3.zw = tex2D(Texture2D_3, r10.zw).xy;
    r16 = tex2D(Texture2D_1, r5.xy);
    r17 = tex2D(Texture2D_1, r5.zw);
    r10.xyz = tex2D(Texture2D_9, r10.xy).xyz;
    r15.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r7 = tex2D(Texture2D_6, r0.xy).xwyz;
    r0.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    r12.xyz = tex2D(Texture2D_0, r12.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r13.zw).xy;
    r5.yzw = tex2D(Texture2D_4, r13.xy).xyw;
    ps = UniformVector_6.x * UniformVector_6.w;
    r6.w = dot(r1.zxy, r1.zxy);
    r13.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r0.w = float((UniformScalar_5.x >= 1.0));
    r13.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r13.z = ps;
    r4.xyz = r12.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r14.zw = r5.yz + r5.yz;
    r5.y = saturate(ps);
    ps = r0.x + r0.x;
    r5.z = float((UniformScalar_5.x > 1.0));
    r14.x = ps;
    ps = r0.z + r0.z;
    r13.xyz = r13.xyz * r7.xzw;
    r14.y = ps;
    r7.xzw = r15.zxy * 2.0 - 1.0;
    r10.xyz = (-abs(r5.zzz) >= 0.0) ? r10.xyz : 1.0;
    ps = rsqrt(abs(r5.x));
    r7.y = float((r7.y >= 0.5));
    r5.x = ps;
    r10.yzw = (-abs(r0.www) >= 0.0) ? 1.0 : r10.xyz;
    ps = log2(r5.y);
    r15.xyz = r5.xxx * -SpotDirection.xyz;
    r5.y = ps;
    r14 = r14 - 1.0;
    ps = (-1.0) + r5.w;
    r5.z = dot(r15.zxy, r2.zxy);
    r10.x = ps;
    ps = r9.w;
    r0.xz = r14.xy + r3.xy;
    ps = r0.y * ps;
    r2.x = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = UniformVector_4.z * r7.x;
    r2.y = dot(r18.wzz, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    r0.w = (r2.y == 0.0) ? r17.x : r17.y;
    r5.w = (r2.x == 0.0) ? r16.x : r16.y;
    ps = ModShadowGroupColor.x * r6.z;
    r2 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r15.x = ps;
    r5.w = (r2.y == 0.0) ? r16.z : r5.w;
    r0.w = (r2.z == 0.0) ? r17.z : r0.w;
    r15.z = (r2.w == 0.0) ? r17.w : r0.w;
    r3.x = (r2.x == 0.0) ? r16.w : r5.w;
    ps = ModShadowGroupColor.y * r6.z;
    r5.w = max(r15.z, 0.0);
    r15.y = ps;
    ps = 0.25 + r3.x;
    r2 = -r15.wxyz + 1.0;
    r3.y = ps;
    ps = r2.x;
    r15.x = min(r5.w, 0.3);
    r5.w = ps;
    ps = UniformScalar_1.x * r5.w;
    r3.xyw = r3.zwy + r3.zwx;
    r1.w = ps;
    r14.xy = r1.ww * r14.zw + r7.zw;
    ps = (-1.0) - -r5.x;
    r15.yz = r3.xy - 1.0;
    r0.w = ps;
    ps = r2.w;
    r7.xzw = r15.xyz * float3(3.3333333, 0.012, 0.012);
    r6.z = ps;
    ps = 2.5 * r6.z;
    r0.xzw = r7.xxx * r0.wxz;
    r6.z = ps;
    r14.xy = r14.xy * UniformVector_4.xy - r7.zw;
    r7.xz = r14.xy * r7.yy + r7.zw;
    ps = r0.y;
    r3.xyz = r13.xyz * r10.yzw;
    r5.w = ps;
    ps = (-1.0) + r5.w;
    r7.zw = r7.xz + r0.zw;
    r7.x = ps;
    ps = 1.0 + r0.x;
    r10.yz = -r4.xy + r7.zw;
    r7.w = ps;
    r5.w = saturate(r6.z * r7.w - 0.5);
    r10.yz = r10.yz * r5.ww + r4.xy;
    r10.xyw = r10.yzx * r2.xxx;
    ps = r3.w;
    r6.z = r10.w + 1.0;
    r6.z = (r1.w > 0.0) ? r6.z : 1.0;
    r7.z = (r1.w >= 0.0) ? r6.z : 1.0;
    ps = -r5.x + ps;
    r0.xy = r7.yx * r7.zy;
    r5.x = saturate(ps);
    ps = -r4.z;
    r14.xyz = r5.xxx * r11.xyz;
    ps = r0.y + ps;
    r3.xyw = r3.xyz * r0.xxx;
    r5.x = ps;
    r0.yzw = r3.xyw * r7.www - r14.xyz;
    ps = 1.0 + r5.x;
    r3.z = -UniformVector_0.z + 1.0;
    r0.x = ps;
    ps = 0.875 * r6.x;
    r13 = r0 * r5.wwww;
    r11.y = ps;
    ps = rsqrt(abs(r6.w));
    r4.z = r14.z + r13.w;
    r5.x = ps;
    ps = 0.875 * r6.y;
    r11.xw = -UniformVector_0.xy + 1.0;
    r11.z = ps;
    ps = UniformScalar_6.x * r7.y;
    r4.xyw = -ModShadowColor.xyz + 1.0;
    r12.w = ps;
    ps = 1.0 - r7.y;
    r0.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = -SpotAngles.x - -r5.z;
    r6.yzw = r5.xxx * UniformVector_5.xyz;
    r5.z = ps;
    ps = r13.x;
    r1.xy = r14.xy + r13.yz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r1.xy = r1.xy * r11.xw;
    r6.x = ps;
    ps = SpotAngles.y * r5.z;
    r13 = r6 + r12.zwww;
    r6.x = saturate(ps);
    r3.xyw = r3.xyw * UniformScalar_7.xxx + r13.yzw;
    ps = abs(r7.w) * abs(r7.w);
    r11.x = r13.x + r12.z;
    r6.y = ps;
    r6.zw = r11.yz * r2.yz + 0.125;
    r10.z = r11.x * r2.x + 1.0;
    r7.xyz = (r2.xxx > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = r6.zxy * r6.wxy;
    r5.xzw = r6.xxx * r4.xyw + ModShadowColor.xyz;
    r7.xyz = (r2.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = r6.z * r6.z;
    r6.w = dot(r7.zxy, r7.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r6.w));
    r4.xy = r4.ww * r3.xy;
    r6.w = ps;
    r2.xyz = r7.xyz * r6.www;
    r7 = r4.wxyz * r3.wxyz;
    r6.w = dot(r2.zxy, r9.zxy);
    r4.xyz = r2.xyz * r6.www;
    r4.xyz = r4.xyz * 2.0 - r9.xyz;
    r6.w = saturate(dot(r0.zxy, r4.zxy));
    ps = log2(r6.w);
    r1.z = r7.x * r3.w;
    r6.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r6.w = r6.w * 15.0;
    r5.y = ps;
    ps = pow(2.0, r6.w);
    r0.y = saturate(dot(r2.zyx, r0.zyx));
    r0.x = ps;
    ps = pow(2.0, r5.y);
    r7.xyz = r7.yzw * r0.xxy;
    r5.y = ps;
    r7.xyz = r1.xyz * r0.yyx + r7.xyz;
    r7.xyz = r7.xyz * r5.yyy;
    r7.xyz = r7.xyz * r8.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.yyy;
    r5.xyz = r6.xzy * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
