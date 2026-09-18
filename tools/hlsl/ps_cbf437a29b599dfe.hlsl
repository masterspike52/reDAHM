// ps_cbf437a29b599dfe.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 354 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000588 10041500 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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

    r5 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r9 = r5 * r0.wzwz;
    r8.xyz = tex2D(Texture2D_1, r9.zw).zxy;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = r0.w;
    r14.xy = r0.xy * UniformScalar_2.xx;
    ps = UniformScalar_5.x * ps;
    r6.y = -r0.z + 1.0;
    r10.x = ps;
    ps = r1.z;
    r1.w = float((r0.w >= 0.5));
    ps = 0.1 + ps;
    r6.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.yz = UniformVector_1.xy * 1.7;
    r6.x = ps;
    ps = 1.0 / r4.w;
    r11.xy = r10.yz * r0.wz;
    r5.w = ps;
    r11.zw = r6.zw * r5.ww + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.w = float((r6.y >= 0.5));
    r6.z = ps;
    r8.w = r1.w * (-0.5) + r0.w;
    ps = 5.0 * r5.x;
    r7.xy = r6.xz * abs(r7.xy);
    r6.x = saturate(ps);
    ps = r0.z;
    r6.xz = -r6.yx + float2(0.5, 1.0);
    ps = UniformScalar_5.x * ps;
    r5.x = r6.x - r0.z;
    r10.y = ps;
    r5.x = dot(r5.xx, r17.ww) - r0.z;
    ps = r8.x + r8.x;
    r5.x = r5.x + 2.0;
    r6.y = ps;
    ps = r8.w + r8.w;
    r6.w = r5.x - r0.z;
    r6.x = ps;
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r12.xyz = tex2D(Texture2D_5, r9.zw).xyz;
    r18.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r13 = tex2D(Texture2D_2, r6.xw);
    r17.xyz = tex2D(Texture2D_4, r14.xy).xyz;
    r14.xyz = tex2D(Texture2D_6, r14.xy).xyz;
    r20.xyz = tex2D(LightAttenuationTexture, r11.zw).xyz;
    r7 = tex2D(Texture2D_3, r11.xy);
    r16 = tex2D(Texture2D_3, r9.xy);
    r0.xyz = tex2D(Texture2D_0, r5.yz).xwy;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = r4.w;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r3.w = dot(r3.zxy, r3.zxy);
    r19.x = saturate(ps);
    ps = (-1.0) + r0.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r18.x = ps;
    ps = 1.0 - r5.x;
    r19.z = r7.z + r16.z;
    r5.y = saturate(ps);
    ps = 4.0 * r8.y;
    r4.x = dot(r1.zxy, r1.zxy);
    r11.x = ps;
    ps = 4.0 * r8.z;
    r5.zw = r7.xy + r7.xy;
    r11.y = ps;
    ps = r0.x + r0.x;
    r21.xyz = r20.xyz * r2.www;
    r20.x = ps;
    ps = r0.z + r0.z;
    r0.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r20.y = ps;
    ps = rsqrt(abs(r4.x));
    r6.x = r16.w * r7.w;
    r4.x = ps;
    ps = rsqrt(abs(r3.w));
    r4.xyz = r4.xxx * r1.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r5.x));
    r8.xyz = r1.xxx * r3.xyz;
    r5.x = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r5.xxx * -SpotDirection.xyz;
    r16.w = ps;
    ps = log2(r5.y);
    r3.xyz = r0.www - r14.xyz;
    r5.x = ps;
    r7.xyz = r17.zxy * 2.0 - 1.0;
    r14.xyz = r3.xyz * UniformScalar_4.xxx + r14.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = dot(r1.zxy, r2.zxy);
    r0.w = ps;
    r20.z = r17.w * 2.0 + r1.w;
    r5.x = (r20.z == 0.0) ? r13.x : r13.y;
    ps = pow(2.0, r0.w);
    r17.xyz = r14.xyz * UniformVector_4.xyz;
    r0.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r3.xyz = r21.xzy * r0.www;
    r19.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2 = r20.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r19.w = ps;
    r5.x = (r2.w == 0.0) ? r13.z : r5.x;
    ps = (-1.0) - -r6.x;
    r1.yzw = -r19.xyw + 1.0;
    r1.x = ps;
    r5.x = (r2.z == 0.0) ? r13.w : r5.x;
    ps = UniformScalar_1.x * r1.y;
    r6.z = max(r5.x, 0.0);
    r0.w = ps;
    ps = 1.0 - r5.x;
    r11.zw = r0.ww * r2.xy;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r18.y = min(r6.z, 0.3);
    r6.z = ps;
    ps = (-0.75) + r5.x;
    r2.zw = r7.yz + r11.zw;
    r19.w = ps;
    ps = (-3.0) + r5.z;
    r13 = r11 - 2.0;
    r19.x = ps;
    ps = (-3.0) + r5.w;
    r2.xy = r13.xy + r11.zw;
    r19.y = ps;
    r16.xyz = r16.xyz * float3(4.0, 4.0, 1.0) + r19.xyz;
    ps = r19.w;
    r18.yzw = r18.yzw * float3(3.3333333, 0.875, 0.875);
    ps = r5.x + ps;
    r16.xyz = r18.yyy * r16.xyz;
    r5.w = ps;
    r5.xz = r2.zw * UniformVector_3.xy - r2.xy;
    r7.yz = r16.xy * 2.0 + r5.xz;
    r2 = r18.xzwy * r1.yzwx + float4(1.0, 0.125, 0.125, 1.0);
    r7.w = saturate(r6.z * r2.w - 0.5);
    r6.z = (r0.w > 0.0) ? r2.x : 1.0;
    ps = r2.y * r2.z;
    r5.xz = r16.wz * float2(0.5, 0.1);
    r3.w = ps;
    r2.xyz = r3.www * r15.xyz + ModShadowColor.xyz;
    r12.w = r7.x * UniformVector_3.z + r5.z;
    r5.z = (r0.w >= 0.0) ? r6.z : 1.0;
    r5.x = saturate(r5.w + r5.x);
    ps = -SpotAngles.x - -r5.y;
    r16.xyz = r5.xxx * r12.xyz;
    r5.x = ps;
    ps = abs(r2.w) * abs(r2.w);
    r12.xyz = r5.zzz * r10.xyz;
    r7.x = ps;
    ps = (-1.0) + r6.y;
    r10.yzw = r7.xyz * r7.xww;
    r5.y = ps;
    ps = 0.5 * r5.y;
    r15.xyz = r12.xyz * UniformVector_4.xyz;
    r6.w = ps;
    ps = SpotAngles.y * r5.x;
    r13.xy = r13.zw + r10.zw;
    r10.x = saturate(ps);
    ps = r10.x * r10.x;
    r12.xyz = r17.xyz * r12.xyz;
    r5.x = ps;
    ps = r13.x;
    r6.xyz = r16.xyz * r0.yyy;
    ps = r11.x + ps;
    r5.yzw = r15.xyz * r14.xyz;
    r0.x = ps;
    ps = r13.y;
    r12 = r12 - r6;
    r5.yzw = r5.ywz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r6 = r12.wxyz * r7.wwww + r6.wxyz;
    ps = r11.y + ps;
    r0.z = r6.x - 1.0;
    r0.y = ps;
    ps = r10.y * r10.y;
    r0.xyw = r0.xyz * r1.yyy;
    r6.x = ps;
    ps = r6.x;
    r0.z = r0.w + 1.0;
    r0.xyz = (r1.yyy > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r1.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.y * ps;
    r0.y = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r6.yzw = r6.yzw * r9.xyz;
    r0.y = ps;
    ps = r6.x;
    r1.xyz = r1.xyz * r0.yyy;
    ps = r5.w * ps;
    r0.z = dot(r1.zxy, r8.zxy);
    r0.y = ps;
    ps = r6.x;
    r9.xyz = r1.xyz * r0.zzz;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = r5.z * ps;
    r5.y = saturate(dot(r4.zxy, r8.zxy));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r0.xyz * r7.www;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r1.zyx, r4.zyx));
    r5.y = ps;
    r5.yzw = r0.xyz * r5.yyy;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.yzw = r3.xzy * r5.yzw;
    r5.yzw = r5.yzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.ywz * r5.xxx;
    r5.xyz = r5.xzy * r2.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
