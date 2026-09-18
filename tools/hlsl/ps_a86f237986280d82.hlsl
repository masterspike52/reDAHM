// ps_a86f237986280d82.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r8.xy = r0.xy * UniformVector_3.xy;
    r6.w = ps;
    r11 = tex2D(Texture2D_8, r8.xy);
    ps = (-0.5) + r11.w;
    r6.xy = r0.wz * 6.0;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r12.x = ps;
    r14.yzw = tex2D(Texture2D_3, r8.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r4.w - 4e+02;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r3.zxy, r3.zxy);
    r8.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = r1.z + 0.1;
    r6.z = ps;
    ps = 0.00022222222 * r5.x;
    r5.zw = r0.wz * UniformVector_1.xy;
    r9.z = saturate(ps);
    ps = 5.0 * r5.y;
    r10.xyz = r6.zzz * r3.xyz;
    r9.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.y = r9.z * (-0.025);
    r5.x = ps;
    r5.zw = r10.xy * r5.yy + r5.zw;
    ps = 1.0 - r0.z;
    r9.y = r5.w * r5.x;
    r15.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r15.xw = -r9.yx + 1.0;
    r15.z = ps;
    r12.yzw = r15.yxz * UniformVector_2.yyx;
    ps = r12.w;
    r3.xyz = r12.zxy - 0.5;
    ps = r5.z * ps;
    r17.xyz = float3((r12.xzy >= 0.5));
    r14.x = ps;
    r17.w = float((r14.x >= 0.5));
    ps = r8.z;
    r13.xyz = r3.xzy - r12.zyx;
    ps = abs(r7.x) * ps;
    r9 = r14.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r5.x = ps;
    ps = r8.w;
    r13.w = r9.x - r14.x;
    r3.x = r13.w * r17.w + r14.x;
    r3.yzw = r13.xzy * r17.yxz + r12.zxy;
    ps = abs(r7.y) * ps;
    r12 = r3.zwxy + r3.zwxy;
    r5.y = ps;
    r13 = tex2D(Texture2D_1, r12.xy);
    r16.y = tex2D(Texture2D_4, r8.xy).x;
    r7.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    r8.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r8.w = r0.y + UniformScalar_8.x;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r3.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r3.xy = r3.xy * r5.yy + ScreenPositionScaleBias.wz;
    r7.zw = r6.xy * 2.0 - 1.0;
    r5.x = (-abs(r5.x) >= 0.0) ? 1.0 : (-1.0);
    r16.x = (-abs(r6.w) >= 0.0) ? (-1.0) : r5.x;
    r7 = r7.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    ps = UniformScalar_4.x;
    r16.zw = r15.ww * ModShadowGroupColor.xy;
    ps = UniformScalar_3.x * ps;
    r6.xyw = -r16.zwy + 1.0;
    r9.x = ps;
    ps = r8.x + r8.x;
    r15.xy = r7.xw * r6.xy;
    r15.z = ps;
    r21.x = r17.y * 2.0 + r17.w;
    ps = r8.z + r8.z;
    r21.y = dot(r17.xzz, float3(1.0, 1.0, 1.0));
    r15.w = ps;
    ps = r0.w;
    r20 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r5.x = (r21.y == 0.0) ? r13.x : r13.y;
    ps = UniformVector_5.x * ps;
    r9.yzw = r9.zyw + r14.ywz;
    r8.x = ps;
    ps = r6.z;
    r9.yzw = r9.ywz + float3(-1.0, -1.0, 0.0);
    ps = r8.y * ps;
    r19 = r21.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r5.x = (r19.z == 0.0) ? r13.z : r5.x;
    r5.x = (r19.w == 0.0) ? r13.w : r5.x;
    ps = (-1.0) - -r6.z;
    r9 = r9.xwyz * r16.xyxy;
    r7.x = ps;
    ps = floor(r9.x);
    r5.y = max(r5.x, 0.0);
    r3.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.y = min(r5.y, 0.3);
    r7.w = ps;
    ps = 3.3333333 * r5.y;
    r7.yz = r20.zw + r7.yz;
    r3.z = ps;
    ps = r0.z;
    r15 = r3.zzzw * r7;
    ps = UniformVector_5.y * ps;
    r8.z = r15.w + r0.x;
    r8.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r7.xyw = tex2D(Texture2D_6, r5.zw).xyz;
    r14 = tex2D(Texture2D_5, r8.zw);
    r12 = tex2D(Texture2D_1, r12.zw);
    r13.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r5.zw).xyz;
    r5.z = saturate(r4.w * 0.0001);
    ps = -ModShadowColor.x;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r1.w = float((UniformScalar_11.x >= 1.0));
    r0.y = ps;
    ps = -ModShadowColor.y;
    r3.w = float((UniformScalar_11.x > 1.0));
    ps = 1.0 + ps;
    r5.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r18.xyz = r8.xyw + r8.xyw;
    r0.w = ps;
    ps = 1.0 - r5.w;
    r17.xyz = r11.xyz * UniformScalar_12.xxx;
    r5.y = saturate(ps);
    r4.xyz = (-abs(r3.www) >= 0.0) ? r13.xyz : 1.0;
    r13.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r4.xyz;
    ps = log2(r5.y);
    r4.xyz = r0.www * -SpotDirection.xyz;
    r6.y = ps;
    r17.xyz = r17.xyz * r13.xyz + UniformScalar_13.xxx;
    ps = -ModShadowColor.z;
    r5.y = dot(r4.zxy, r2.zxy);
    r5.w = (r21.x == 0.0) ? r12.x : r12.y;
    ps = 1.0 + ps;
    r1.w = r20.x * r20.y;
    r0.w = ps;
    r2.xyz = r1.www * r0.yzw + ModShadowColor.xyz;
    r5.w = (r19.y == 0.0) ? r12.z : r5.w;
    r18.w = (r19.x == 0.0) ? r12.w : r5.w;
    r12 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = rsqrt(abs(r0.x));
    r5.w = -r12.z + r9.y;
    r0.y = ps;
    ps = -SpotAngles.x - -r5.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r19.xyz = UniformVector_4.xyz * 2e+01;
    r7.z = saturate(ps);
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz * r14.www;
    r0.x = ps;
    ps = 1.0 - r5.z;
    r4.xyz = r0.yyy * r1.xyz;
    r0.w = ps;
    ps = r12.w;
    r5.xyz = r19.xyz * r14.xyz;
    ps = r18.w + ps;
    r14.xyz = r5.xyz * r16.yyy;
    r5.x = ps;
    ps = 2.5 * r0.x;
    r5.x = saturate(r5.x - r6.z);
    r0.z = ps;
    ps = r15.z;
    r1.xyz = r17.xyz * r6.www;
    r5.y = r9.z * r16.y + r15.y;
    ps = r9.w + ps;
    r0.y = r15.x + 1.0;
    r5.z = ps;
    ps = r0.y * r0.x;
    r9.xyz = r5.xxx * r7.xyw;
    r5.x = ps;
    ps = r0.z * r0.y;
    r7.xy = -r12.xy + r5.yz;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r5.x = float((r5.x > 0.9));
    r7.w = saturate(ps);
    r5.xyz = r14.xyz * r5.xxx - r9.xyz;
    r11.xyz = r13.xyz * r11.xyz + r5.xyz;
    r6.xzw = r7.xyz * r7.wwz;
    ps = 1.0 + r5.w;
    r5.xy = r12.xy + r6.xz;
    r11.w = ps;
    r9.xyz = r11.xyz * r7.www + r9.xyz;
    r5.z = r11.w * r7.w - 2.0;
    r5.z = r8.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r0.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r0.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r7.www;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r10.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r0.xyz = r9.xyz * r8.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r5.y = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.y = saturate(dot(r7.zyx, r4.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.yy + r5.yz;
    r5.w = r0.z * r6.y + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r2.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
