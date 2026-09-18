// ps_b31175573ba7d1f7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 474 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000768 10041600 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r13.yz = r4.xy * ScreenPositionScaleBias.xy;
    r9.x = ps;
    ps = UniformScalar_17.x;
    r6.z = float((UniformScalar_12.x >= 1.0));
    ps = 0.05 * ps;
    r5.y = r4.w - 4e+02;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r0.wz * 3.0;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r9.w = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    r5.y = r7.w * (-0.8) + r5.w;
    ps = 1.0 / r4.w;
    r12.xyz = r5.xxx * r3.xyz;
    r6.y = ps;
    ps = 1.0 - r0.z;
    r13.w = -r7.w + UniformScalar_13.x;
    r11.x = ps;
    ps = r0.z + r0.z;
    r6 = r13.zxyw * r6.yxyz;
    r9.y = ps;
    ps = 6.0 * r5.y;
    r10.xy = r12.xy * r6.yy;
    r10.w = ps;
    ps = r9.z;
    r15.w = r10.y + r0.z;
    ps = abs(r8.x) * ps;
    r11.y = -r15.w + 1.0;
    r14.x = ps;
    ps = UniformVector_1.x * r0.w;
    r18.w = saturate(r7.w * 15.0);
    r11.z = ps;
    ps = r9.w;
    r11.xy = r11.xy * UniformVector_1.yy;
    ps = abs(r8.y) * ps;
    r3.xyz = r11.zxy - 0.5;
    r14.y = ps;
    ps = r6.z;
    r15.xyz = float3((r11.xyz >= 0.5));
    r5.x = ps;
    ps = ScreenPositionScaleBias.w + r5.x;
    r3.xyz = r3.xyz - r11.zxy;
    r9.z = ps;
    r13.yzw = r3.zxy * r15.yzx + r11.yzx;
    ps = ScreenPositionScaleBias.z + r6.x;
    r3.xy = r13.zw + r13.zw;
    r9.w = ps;
    ps = 18.0 * r0.w;
    r20.xyz = -ModShadowColor.xyz + 1.0;
    r10.z = ps;
    r1.w = tex2D(Texture2D_7, r0.xy).w;
    r11.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r3 = tex2D(Texture2D_3, r3.xy).xzwy;
    r16.xy = tex2D(ModShadowAccumTexture, r14.xy).xy;
    r8.yzw = tex2D(Texture2D_4, r10.zw).xyw;
    r17.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r14 = tex2D(Texture2D_4, r5.zy);
    ps = 0.1 - -r1.z;
    r5.y = ps;
    ps = 5.0 * r5.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.x = saturate(ps);
    ps = r14.x + r14.x;
    r18.xyz = r17.xyz * r2.www;
    r8.x = ps;
    r16.zw = r8.yz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r9.w = r8.w * r14.w;
    r5.y = saturate(ps);
    ps = log2(r5.y);
    r6.y = r9.w - 1.0;
    r5.z = ps;
    ps = r14.y + r14.y;
    r5.y = r6.w + r7.w;
    r8.y = ps;
    ps = -r5.y;
    r21 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r7.z + ps;
    r8.z = dot(r15.zxx, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.y = (r8.z == 0.0) ? r3.x : r3.w;
    ps = r5.w;
    r8 = r8.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r3.x = ps;
    r5.y = (r8.w == 0.0) ? r3.y : r5.y;
    ps = UniformScalar_14.x;
    r6.xw = r8.xy + r21.zw;
    r3.y = ps;
    r10.w = (r8.z == 0.0) ? r3.z : r5.y;
    ps = max(r3.x, r3.y);
    r5.y = max(r10.w, 0.0);
    r5.w = ps;
    ps = 1.0 / UniformScalar_15.x;
    r5.yw = min(r5.wy, float2(1.0, 0.3));
    r6.z = ps;
    ps = r14.z;
    r6.z = saturate(r5.y * r6.z);
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r6.z = -r6.z + 1.0;
    r5.z = ps;
    ps = 3.3333333 * r5.w;
    r8.x = r6.z * r7.w;
    r10.z = ps;
    ps = pow(2.0, r5.z);
    r8.yz = -r10.wz + 1.0;
    r8.w = ps;
    ps = (-0.3) * r5.y;
    r3 = r18.xzyw * r8.wwwz;
    r5.y = ps;
    ps = 0.01 * r6.x;
    r6.z = r10.z + r3.w;
    r5.z = ps;
    ps = r15.y + r15.y;
    r10.zw = r5.yz * r6.zz;
    r22.z = ps;
    ps = r15.w + r15.w;
    r6.xyz = r6.yxz * r6.zzw;
    r22.y = ps;
    ps = r8.x;
    r10.xzw = r10.wxz + r0.xwy;
    r10.y = r6.z * 0.025 + r10.w;
    ps = r14.z * ps;
    r15.x = r10.z * UniformVector_1.x;
    r15.y = ps;
    ps = r8.y;
    r5.y = r15.x - 0.5;
    ps = r14.z * ps;
    r15.w = r5.y - r15.x;
    r15.z = ps;
    ps = 1.0 + r6.x;
    r7.yz = float2((r15.xy >= float2(0.5, 0.05)));
    r7.w = ps;
    ps = r7.x;
    r14.yzw = r11.xyz + r11.xyz;
    r5.z = ps;
    ps = 1.0 - r5.z;
    r11.xw = r15.wz * r7.yw;
    r6.w = ps;
    ps = 1.0 - r7.z;
    r13.x = r15.x + r11.x;
    r5.y = ps;
    r5.z = (UniformScalar_13.x > 0.0) ? r5.y : 1.0;
    r5.y = (UniformScalar_13.x >= 0.0) ? r5.z : r5.y;
    ps = r10.z + r10.z;
    r14.x = r5.y * r1.w;
    r22.x = ps;
    ps = r13.x + r13.x;
    r16 = r14 + float4(-0.5, -1.0, -1.0, -1.0);
    r5.y = ps;
    ps = r13.y + r13.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.xxxx)) clip(-1.0);
    r5.z = ps;
    r15 = tex2D(Texture2D_2, r9.xy);
    r17.xyz = tex2D(Texture2D_8, r22.xy).xyz;
    r19 = tex2D(Texture2D_3, r5.yz);
    r9.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r13.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r22.xy).xyz;
    r5.y = tex2D(Texture2D_6, r0.xy).x;
    r0.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r10.w = float((UniformScalar_9.x >= 1.0));
    r5.w = float((UniformScalar_9.x > 1.0));
    r5.z = dot(r1.zxy, r1.zxy);
    r14.xyz = r13.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r13.xyz = r0.xyz * r9.xyz;
    r5.z = ps;
    r9.xyz = r13.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = rsqrt(abs(r5.x));
    r11.xyz = r5.zzz * r1.xyz;
    r5.x = ps;
    r0.xyz = r5.xxx * -SpotDirection.xyz;
    r5.z = dot(r0.zxy, r2.zxy);
    r1.xy = r14.xy * UniformVector_3.xy + r6.yz;
    ps = r4.w;
    r6.x = r22.z + r7.y;
    r5.x = (r6.x == 0.0) ? r19.x : r19.y;
    ps = 0.0001 * ps;
    r6.zw = r6.ww * ModShadowGroupColor.xy;
    r6.y = saturate(ps);
    r0.xyw = -r6.zwy + 1.0;
    ps = r7.w;
    r6.yz = r21.xy * r0.xy;
    ps = r8.y * ps;
    r6 = r6.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r2.z = ps;
    r5.x = (r6.y == 0.0) ? r19.z : r5.x;
    ps = r11.w;
    r0.z = r6.z * r6.w;
    r0.xyz = r0.zzz * r20.xyz + ModShadowColor.xyz;
    r2.w = (r6.x == 0.0) ? r19.w : r5.x;
    ps = -r2.z + ps;
    r6.x = -r2.w + 1.0;
    r6.y = ps;
    r2.xy = r18.ww * r6.xy;
    ps = r10.x + r10.x;
    r6.yz = r2.xz + r2.wy;
    r6.x = ps;
    r1.w = saturate(r6.z * 2.5 - 0.5);
    ps = r10.y + r10.y;
    r5.x = r6.y + r2.x;
    r6.y = ps;
    ps = r10.z + r10.z;
    r6.w = r5.x + r2.w;
    r6.z = ps;
    r4 = r6 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = saturate(r4.w - r9.w);
    r2.xyz = r5.xxx * r17.xyz;
    ps = -r2.z;
    r6.xzw = r16.wyz - r4.zxy;
    ps = r15.z + ps;
    r16.xy = -r2.xy + r15.xy;
    r6.y = ps;
    r2.xy = r16.xy * r15.ww + r2.xy;
    r6 = r6.zwyx * r15.wwww;
    ps = abs(r7.w) * abs(r7.w);
    r2.z = r2.z + r6.z;
    r1.z = ps;
    ps = r6.w;
    r6.xyz = r4.xyz + r6.xyw;
    r5.x = ps;
    r4.w = r14.z * UniformVector_3.z - r6.z;
    ps = (-2.0) + r5.x;
    r1.xy = r1.xy - r6.xy;
    r2.w = ps;
    r4.xyz = r13.xyz * r8.yyy - r2.xyz;
    r7.xyw = r1.xyz * r1.wwz;
    r6.xy = r6.xy + r7.xy;
    r4 = r4 * r1.wwww + r2;
    r6.z = r10.z * 2.0 + r4.w;
    r6.xyz = r6.zxy * r0.www;
    ps = 1.0 + r6.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r0.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r0.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r10.xyz = r4.xyz * r2.xyz;
    r5.x = ps;
    r6.xzw = r6.xyz * r5.xxx;
    r5.x = dot(r6.wxz, r12.zxy);
    ps = UniformScalar_8.x * r5.y;
    r2.xyz = r6.xzw * r5.xxx;
    r6.y = ps;
    r2.xyz = r2.xyz * 2.0 - r12.xyz;
    ps = -SpotAngles.x - -r5.z;
    r5.y = saturate(dot(r11.zxy, r2.zxy));
    r5.x = ps;
    ps = log2(r5.y);
    r6.x = saturate(dot(r6.wzx, r11.zyx));
    r5.z = ps;
    ps = SpotAngles.y * r5.x;
    r5.y = r5.z * UniformScalar_7.x;
    r6.z = saturate(ps);
    ps = pow(2.0, r5.y);
    r5.z = r5.z * 15.0;
    r6.w = ps;
    r5.xy = r6.yz * r6.wz;
    r6.y = (r5.w > 0.0) ? 0.0 : r5.x;
    r6 = r10 * r6.xxxy;
    ps = r7.w * r7.w;
    r7.xyz = r9.xyz + r6.www;
    r5.w = ps;
    r7.xyz = r5.www * r7.xyz;
    r7.xyz = r7.xyz * r1.www;
    ps = pow(2.0, r5.z);
    r7.xyz = r7.xyz * r8.yyy;
    r5.z = ps;
    r6.xy = r7.xy * r5.zz + r6.xy;
    r6.z = r7.z * r5.z + r6.z;
    r6.xyz = r3.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.yyy;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
