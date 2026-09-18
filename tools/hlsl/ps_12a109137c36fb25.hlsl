// ps_12a109137c36fb25.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c22); // float2
float4 SpotDirection : register(c21); // float3
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_9, r0.xy);
    r6.xw = saturate(UniformVector_12.xy);
    r11.y = UniformScalar_4.x * UniformScalar_5.x;
    ps = r0.w;
    r5.z = -r0.z + 1.0;
    ps = UniformVector_2.x * ps;
    r6.z = r1.z + 0.1;
    r8.y = ps;
    ps = r4.w;
    r8.xz = r0.wz * UniformVector_1.xy;
    ps = (-2e+02) + ps;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    r6.y = ps;
    ps = UniformScalar_5.x * r5.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.yz = saturate(r6.yz * float2(0.00022222222, 5.0));
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r10.xyz = r5.xxx * r3.xyz;
    r5.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.y = r6.y * (-0.1);
    r5.x = ps;
    r17.zw = r10.xy * r5.yy + r8.xz;
    r5.x = -r17.w * r5.x + 1.0;
    ps = r16.w;
    r5.yzw = r5.wxz * UniformVector_2.xyy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r8.x = r5.y * r17.z;
    r3.x = ps;
    ps = (-0.5) + r5.z;
    r3.zw = float2((r5.zw >= 0.5));
    r1.w = ps;
    ps = (-0.5) + r5.w;
    r11.zw = r3.zw + r3.zw;
    r5.x = ps;
    ps = r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    ps = -r5.z + ps;
    r8.zw = r8.xy - 0.5;
    r18.x = ps;
    ps = floor(r11.x);
    r9.xy = float2((r8.xy >= 0.5));
    r3.x = ps;
    ps = floor(r11.y);
    r8.zw = r8.zw - r8.xy;
    r3.y = ps;
    r8.xz = r8.zw * r9.xy + r8.xy;
    r3.xy = r3.xy * UniformVector_11.xy - r11.xy;
    ps = r5.x;
    r9.zw = r3.xy * r6.xw;
    ps = -r5.w + ps;
    r12 = r11.wxyz + r9.yzwx;
    r18.y = ps;
    r6.xw = r0.xy * UniformVector_13.xy + r12.yz;
    ps = 1.0 / UniformVector_10.x;
    r6.xw = r6.xw * UniformVector_8.xy;
    r3.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r18.zw = frac(r6.xw);
    r3.y = ps;
    r3 = r18 * r3.zwxy;
    r8.yw = r5.zw + r3.xy;
    r8 = r8 + r8;
    r19 = tex2D(Texture2D_3, r8.zw);
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r9 = tex2D(Texture2D_6, r3.zw);
    r14.zw = r0.wz + r0.wz;
    ps = r4.w;
    r6.xw = UniformVector_1.xy + UniformVector_1.xy;
    ps = 0.0001 * ps;
    r17.xy = r0.wz * UniformVector_14.xy;
    r3.x = saturate(ps);
    ps = r4.x;
    r13.xyz = UniformVector_5.xyz * 2e+01;
    ps = ScreenPositionScaleBias.x * ps;
    r10.w = dot(r2.zxy, r2.zxy);
    r11.z = ps;
    ps = r4.y;
    r15.xyz = r9.xyz * r9.www;
    ps = ScreenPositionScaleBias.y * ps;
    r14.xy = r6.xw * r0.wz;
    r11.w = ps;
    r5.xyz = r5.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r10.w));
    r3.yzw = r5.xyz * UniformVector_4.xyz;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yzw = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = dot(r5.wyz, r2.zxy);
    r5.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r7.zw = r5.xz * abs(r7.xy);
    r5.z = ps;
    r5.y = (r12.x == 0.0) ? r19.x : r19.y;
    ps = r3.w;
    r9 = r12.xxww + float4(-2.0, -3.0, -3.0, -2.0);
    r5.x = ps;
    r5.y = (r9.x == 0.0) ? r19.z : r5.y;
    r6.x = (r9.y == 0.0) ? r19.w : r5.y;
    ps = 1.0 - r5.x;
    r5.yw = float2((UniformVector_10.xy >= r18.zw));
    r11.x = ps;
    ps = r5.y * r5.w;
    r0.zw = float2((UniformVector_10.yx > r18.wz));
    r5.x = ps;
    ps = SpotAngles.y * r5.z;
    r0.y = r5.x * r0.z;
    r0.x = saturate(ps);
    ps = 1.0 - r3.x;
    r7.xy = r0.xy * r0.xw;
    r11.y = ps;
    ps = 1.0 - r6.x;
    r5.xzw = r15.xyz * r7.yyy;
    r5.y = ps;
    ps = 1.0 - r6.z;
    r15.xyz = r13.xyz * r5.xzw;
    r5.w = ps;
    ps = ModShadowGroupColor.x * r5.w;
    r5.x = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r0.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r5.x = r5.x - r15.x;
    r0.x = ps;
    ps = 1.0 / r4.w;
    r0.z = saturate(r5.x + r15.x);
    r0.w = ps;
    r5.xz = r11.zw * r0.ww + ScreenPositionScaleBias.wz;
    r9.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r13 = tex2D(Texture2D_2, r14.xy);
    r20.xyz = tex2D(Texture2D_7, r17.zw).xyz;
    r8 = tex2D(Texture2D_3, r8.xy);
    r7.yzw = tex2D(Texture2D_0, r17.zw).xyz;
    r17.xyz = tex2D(Texture2D_8, r17.xy).xyz;
    r6.yzw = tex2D(Texture2D_4, r14.zw).wxy;
    r18.xyz = tex2D(Texture2D_1, r14.xy).xyz;
    r19.xyz = tex2D(LightAttenuationTexture, r5.xz).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r14.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = dot(r1.zxy, r1.zxy);
    r1.w = float((UniformScalar_12.x >= 1.0));
    r5.x = float((UniformScalar_12.x > 1.0));
    r19.xyz = r19.xyz * r2.www;
    r2.xyz = r18.xyz * 2.0 - 1.0;
    r22.yz = r6.zw * 2.0 - 1.0;
    r17.xyz = (-abs(r5.xxx) >= 0.0) ? r17.xyz : 1.0;
    ps = (-1.0) + r6.y;
    r5.x = saturate(-r10.w + 1.0);
    r22.x = ps;
    ps = log2(r5.x);
    r18.xyz = r16.xyz * UniformScalar_13.xxx;
    r5.x = ps;
    r17.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r17.xyz;
    r12.xyz = r18.xyz * r17.xyz + UniformScalar_14.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r21.xyz = r7.yzw + r7.yzw;
    r6.w = ps;
    r5.x = (r12.w == 0.0) ? r8.x : r8.y;
    r5.x = (r9.w == 0.0) ? r8.z : r5.x;
    r21.w = (r9.z == 0.0) ? r8.w : r5.x;
    ps = rsqrt(abs(r5.z));
    r5.x = max(r6.x, 0.0);
    r6.x = ps;
    ps = 2.5 * r5.y;
    r5.x = min(r5.x, 0.3);
    r5.z = ps;
    ps = 3.3333333 * r5.x;
    r18 = r21 + float4(-1.0, -1.0, -1.0, -0.75);
    r5.x = ps;
    ps = r18.w;
    r8.xyz = r6.xxx * r1.xyz;
    ps = r21.w + ps;
    r6.xyz = r5.xxx * r22.xyz;
    r5.x = saturate(ps);
    ps = 1.0 + r6.x;
    r1.xyw = r5.xxx * r20.xyz;
    r5.x = ps;
    ps = -r1.w;
    r20.xzw = r2.zxy - r18.zxy;
    ps = r13.z + ps;
    r2.xy = -r1.xy + r13.xy;
    r20.y = ps;
    r2.xy = r2.xy * r13.ww + r1.xy;
    ps = pow(2.0, r6.w);
    r5.xy = r5.zx * r5.xy;
    r5.w = ps;
    ps = (-0.5) + r5.x;
    r13 = r20.zwxy * r13.wwww;
    r5.z = saturate(ps);
    ps = r13.z;
    r1.xyz = r19.xzy * r5.www;
    r5.x = ps;
    ps = r1.w;
    r13.xyz = r18.xyz + r13.xyz;
    ps = r13.w + ps;
    r5.y = float((r5.y > 0.9));
    r2.z = ps;
    r15.xyz = r15.xyz * r5.yyy - r2.xyz;
    r15.xyz = r17.xyz * r16.xyz + r15.xyz;
    r5.yw = -r3.yz * r0.zz + r3.yz;
    r3.z = r11.x * r0.z + r3.w;
    r3.xy = r6.yz * 2.0 + r5.yw;
    r6.xyz = r15.xyz * r5.zzz + r2.xyz;
    ps = (-2.0) + r5.x;
    r2.xyz = r6.xyz * r14.xyz;
    r13.w = ps;
    ps = r0.y;
    r6.xyz = -r13.xyz + r3.xyz;
    r5.x = ps;
    r6.xyz = r6.xyz * r5.zzz + r13.xyw;
    r6.w = r7.w * 2.0 + r6.z;
    ps = 1.0 - r5.x;
    r6.xyw = r6.xyw * r11.yyy;
    r3.x = ps;
    ps = 1.0 - r0.x;
    r6.z = r6.w + 1.0;
    r3.y = ps;
    r5.xyw = (r11.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r11.xyz = (r11.yyy >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r0.z;
    r5.x = dot(r11.zxy, r11.zxy);
    r3.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r12.xyz * r3.zzz;
    r5.x = ps;
    r0.xyz = r11.xyz * r5.xxx;
    r5.x = dot(r0.zxy, r10.zxy);
    r5.xyw = r0.xyz * r5.xxx;
    r5.xyw = r5.xyw * 2.0 - r10.xyz;
    r5.x = saturate(dot(r8.zxy, r5.wxy));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.zzz;
    r9.z = ps;
    r5.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r0.zyx, r8.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r3.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xy = r2.xy * r5.ww + r6.xy;
    r6.z = r2.z * r5.w + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xxx;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
