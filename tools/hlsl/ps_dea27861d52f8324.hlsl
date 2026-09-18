// ps_dea27861d52f8324.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 450 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000708 10041400 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r5.w = UniformScalar_17.x * 0.05;
    r9.x = ps;
    ps = r4.w;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r6.z = r1.z + 0.1;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r19.z = -r7.w + UniformScalar_13.x;
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r19.xy = r4.xy * ScreenPositionScaleBias.xy;
    r10.w = ps;
    ps = 1.0 / r4.w;
    r5.yz = r0.wz * 3.0;
    r6.w = ps;
    r5.x = r7.w * (-0.8) + r5.z;
    r9.zw = r19.xy * r6.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r18.xw = saturate(r6.zy * float2(5.0, 0.00022222222));
    r6.x = ps;
    ps = r0.z + r0.z;
    r11.xyz = r6.xxx * r3.xyz;
    r9.y = ps;
    ps = r0.w;
    r5.w = r5.w * r18.w;
    ps = UniformVector_1.x * ps;
    r17.xy = r11.xy * r5.ww;
    r6.z = ps;
    ps = -r0.z;
    r14.w = r17.y + r0.z;
    ps = 1.0 + ps;
    r6.y = -r14.w + 1.0;
    r6.x = ps;
    ps = 6.0 * r5.x;
    r6.xy = r6.xy * UniformVector_1.yy;
    r10.y = ps;
    ps = r10.z;
    r3.yzw = r6.xyz - 0.5;
    ps = abs(r8.x) * ps;
    r14.xyz = float3((r6.xyz >= 0.5));
    r3.x = ps;
    ps = r10.w;
    r3.yzw = r3.yzw - r6.xyz;
    r13.yzw = r3.zyw * r14.yxz + r6.yxz;
    ps = abs(r8.y) * ps;
    r6.xy = r13.wz + r13.wz;
    r3.y = ps;
    ps = 15.0 * r7.w;
    r10.x = r0.w * 18.0;
    r10.w = saturate(ps);
    r1.w = tex2D(Texture2D_7, r0.xy).w;
    r15.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r6 = tex2D(Texture2D_3, r6.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r8.yzw = tex2D(Texture2D_4, r10.xy).xyw;
    r3.xzw = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r12 = tex2D(Texture2D_4, r5.yx).zxyw;
    ps = r4.w;
    r5.y = float((UniformScalar_12.x >= 1.0));
    ps = 0.0001 * ps;
    r8.x = r12.x * (-0.3);
    r18.y = saturate(ps);
    ps = r12.y + r12.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r3.y = ps;
    ps = r12.z + r12.z;
    r10.xyz = r3.xzw * r2.www;
    r3.z = ps;
    r16.zw = r8.yz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r4.w = r8.w * r12.w;
    r5.x = saturate(ps);
    r5.y = r19.z * r5.y + r7.w;
    ps = log2(r5.x);
    r2.w = r4.w - 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = -r5.y + r7.z;
    r5.z = ps;
    ps = r5.y;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r5.y = ps;
    ps = UniformScalar_14.x;
    r3.x = dot(r14.zxx, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.x = (r3.x == 0.0) ? r6.x : r6.y;
    ps = max(r5.y, r5.w);
    r3 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.y = ps;
    r5.x = (r3.y == 0.0) ? r6.z : r5.x;
    ps = r14.y + r14.y;
    r2.xz = r3.zw + r16.zw;
    r19.z = ps;
    r5.x = (r3.x == 0.0) ? r6.w : r5.x;
    ps = 0.01 * r2.x;
    r5.w = max(r5.x, 0.0);
    r8.y = ps;
    ps = 1.0 / UniformScalar_15.x;
    r5.yw = min(r5.yw, float2(1.0, 0.3));
    r6.x = ps;
    ps = 3.3333333 * r5.w;
    r5.y = saturate(r5.y * r6.x);
    r18.z = ps;
    ps = pow(2.0, r5.z);
    r6.yzw = -r18.zxy + 1.0;
    r6.x = ps;
    ps = 1.0 - r5.x;
    r3 = r10.xzyw * r6.xxxy;
    r4.y = ps;
    ps = 1.0 - r5.y;
    r2.y = r18.z + r3.w;
    r4.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r17.zw = r8.xy * r2.yy;
    r20.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r12.yzw = r2.wxy * r2.yyz;
    r20.y = ps;
    ps = r4.z;
    r8.xzw = r17.wxz + r0.xwy;
    r8.y = r12.w * 0.025 + r8.w;
    ps = r7.w * ps;
    r5.x = r8.z * UniformVector_1.x;
    r4.x = ps;
    ps = (-0.5) - -r5.x;
    r7.xyz = r15.xyz + r15.xyz;
    r5.w = ps;
    ps = r5.w;
    r5.yz = r4.xy * r12.xx;
    ps = -r5.x + ps;
    r20.zw = float2((r5.yx >= float2(0.05, 0.5)));
    r5.w = ps;
    r13.x = r5.w * r20.w + r5.x;
    ps = r14.w + r14.w;
    r15.xzw = -r20.zxy + 1.0;
    r19.y = ps;
    r5.y = (UniformScalar_13.x > 0.0) ? r15.x : 1.0;
    r5.y = (UniformScalar_13.x >= 0.0) ? r5.y : r15.x;
    ps = r8.z + r8.z;
    r7.w = r5.y * r1.w;
    r19.x = ps;
    ps = r13.x + r13.x;
    r18 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.y = ps;
    ps = r13.y + r13.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r18.wwww)) clip(-1.0);
    r5.w = ps;
    r17.xyz = tex2D(Texture2D_8, r19.xy).xyz;
    r14 = tex2D(Texture2D_2, r9.xy);
    r7 = tex2D(Texture2D_3, r5.yw).xwzy;
    r2.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r9.yzw = tex2D(Texture2D_5, r8.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r19.xy).xyz;
    r5.y = tex2D(Texture2D_6, r0.xy).x;
    r9.x = float((UniformScalar_9.x >= 1.0));
    r1.w = float((UniformScalar_9.x > 1.0));
    r5.w = dot(r1.zxy, r1.zxy);
    r0.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r9.yzw = r9.yzw * 2.0 - 1.0;
    r13.xyz = r0.xyz * r2.xyz;
    r2.xyz = r13.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r15.xy = r9.yz * UniformVector_3.xy + r12.zw;
    r12.x = r19.z + r20.w;
    r0.w = (r12.x == 0.0) ? r7.x : r7.w;
    r9.yz = r16.xy * r15.zw + 0.125;
    r0.xyz = r12.xxy + float3(-3.0, -2.0, 1.0);
    r7.x = (r0.y == 0.0) ? r7.z : r0.w;
    r7.w = r0.z * r4.y;
    r5.z = r5.z * r0.z - r7.w;
    r7.x = (r0.x == 0.0) ? r7.y : r7.x;
    ps = 1.0 - r7.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r7.yz = r10.ww * r5.xz;
    ps = r8.x + r8.x;
    r5.xz = r7.yw + r7.xz;
    r10.y = ps;
    r0.w = saturate(r5.z * 2.5 - 0.5);
    ps = r8.y + r8.y;
    r5.x = r5.x + r7.y;
    r10.z = ps;
    ps = r8.z + r8.z;
    r10.x = r5.x + r7.x;
    r10.w = ps;
    ps = rsqrt(abs(r5.w));
    r16 = r10 + float4(0.25, -1.0, -1.0, -1.0);
    r5.x = ps;
    ps = r16.x;
    r10.xyz = r5.xxx * r1.xyz;
    ps = -r4.w + ps;
    r5.xzw = r18.xyz - r16.yzw;
    r7.x = saturate(ps);
    r7.w = r5.w * r14.w - 2.0;
    r7.xyz = r7.xxx * r17.xyz;
    r5.xzw = r5.xzw * r14.www + r16.yzw;
    r13.w = r9.w * UniformVector_3.z - r5.w;
    r0.xy = r15.xy - r5.xz;
    ps = abs(r0.z) * abs(r0.z);
    r1.xyz = -r7.xyz + r14.xyz;
    r0.z = ps;
    r7.xyz = r1.xyz * r14.www + r7.xyz;
    r13.xyz = r13.xyz * r4.yyy - r7.xyz;
    r1.xyz = r0.xyz * r0.wwz;
    r5.xz = r5.xz + r1.xy;
    r13 = r13 * r0.wwww + r7;
    r5.w = r8.z * 2.0 + r13.w;
    r7.xyz = r5.wxz * r6.www;
    ps = 1.0 + r7.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    r5.xzw = (r6.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r6.www >= 0.0) ? r5.xzw : float3(0.0, 0.0, 1.0);
    r5.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.x));
    r6.xyz = r13.xyz * r12.xyz;
    r5.x = ps;
    r7.xyz = r7.xyz * r5.xxx;
    r5.x = dot(r7.zxy, r11.zxy);
    r5.xzw = r7.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r11.xyz;
    r5.z = saturate(dot(r10.zxy, r5.wxz));
    ps = log2(r5.z);
    r5.x = saturate(dot(r7.zyx, r10.zyx));
    r5.w = ps;
    ps = UniformScalar_8.x * r5.y;
    r5.z = r5.w * UniformScalar_7.x;
    r6.w = ps;
    ps = pow(2.0, r5.z);
    r5.w = r5.w * 15.0;
    r5.z = ps;
    r6 = r6 * r5.xxxz;
    r9.w = (r1.w > 0.0) ? 0.0 : r6.w;
    r7.xy = r9.xy * r9.wz;
    r5.xyz = r7.yyy * r8.xyz + ModShadowColor.xyz;
    ps = r1.z * r1.z;
    r7.xyz = r2.xyz + r7.xxx;
    r7.w = ps;
    r7.xyz = r7.www * r7.xyz;
    r7.xyz = r7.xyz * r0.www;
    ps = pow(2.0, r5.w);
    r7.xyz = r7.xyz * r4.yyy;
    r5.w = ps;
    r6.xy = r7.xy * r5.ww + r6.xy;
    r6.z = r7.z * r5.w + r6.z;
    r6.xyz = r3.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
