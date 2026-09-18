// ps_c4b60c219d1b3cb2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 351 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000057C 10041500 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    r11 = r5 * r0.wzwz;
    r9.xyz = tex2D(Texture2D_1, r11.zw).xyz;
    r5.yz = r0.xy * UniformScalar_0.xx;
    ps = r0.w;
    r8.zw = r0.xy * UniformScalar_2.xx;
    ps = UniformScalar_5.x * ps;
    r6.y = -r0.z + 1.0;
    r10.x = ps;
    ps = r1.z;
    r6.z = float((r0.w >= 0.5));
    ps = 0.1 + ps;
    r10.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = UniformVector_1.xy * 1.7;
    r6.x = ps;
    ps = 1.0 / r4.w;
    r8.xy = r8.xy * r0.wz;
    r5.w = ps;
    r10.zw = r10.yz * r5.ww + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r21.w = float((r6.y >= 0.5));
    r6.w = ps;
    r9.w = r6.z * (-0.5) + r0.w;
    ps = 5.0 * r5.x;
    r13.xy = r6.xw * abs(r7.xy);
    r6.x = saturate(ps);
    ps = r0.z;
    r6.xy = -r6.xy + float2(1.0, 0.5);
    ps = UniformScalar_5.x * ps;
    r5.x = r6.y - r0.z;
    r10.y = ps;
    r5.x = dot(r5.xx, r21.ww) - r0.z;
    ps = r9.z + r9.z;
    r5.x = r5.x + 2.0;
    r0.y = ps;
    ps = r9.w + r9.w;
    r0.z = r5.x - r0.z;
    r0.x = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r10.zw).xyz;
    r12.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_5, r11.zw).xyz;
    r17.yz = tex2D(ModShadowAccumTexture, r13.xy).xy;
    r14 = tex2D(Texture2D_2, r0.xz);
    r21.xyz = tex2D(Texture2D_4, r8.zw).xyz;
    r16.xzw = tex2D(Texture2D_6, r8.zw).xyz;
    r8 = tex2D(Texture2D_3, r8.xy);
    r20 = tex2D(Texture2D_3, r11.xy);
    r0.xzw = tex2D(Texture2D_0, r5.yz).xwy;
    r16.y = saturate(r4.w * 0.0001);
    ps = (-1.0) + r0.z;
    r5.z = dot(r1.zxy, r1.zxy);
    r18.x = ps;
    ps = r8.z;
    r5.y = dot(r2.zxy, r2.zxy);
    ps = r20.z + ps;
    r11.xy = r9.xy * 4.0;
    r19.z = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = r20.w * r8.w;
    r3.w = ps;
    ps = r8.x + r8.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    ps = r8.y + r8.y;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    ps = r0.x + r0.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r18.y = ps;
    ps = r0.w + r0.w;
    r1.w = dot(r16.wxz, float3(0.11, 0.3, 0.59));
    r18.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r3.www * r1.xyz;
    r6.w = ps;
    ps = 1.0 - r5.y;
    r8.xyz = r6.www * r3.xyz;
    r6.w = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r1.xyz = r1.www - r16.xzw;
    r5.y = ps;
    ps = log2(r6.w);
    r3.xyz = r5.yyy * -SpotDirection.xyz;
    r0.x = ps;
    r13.xyz = r21.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r5.y = dot(r3.zxy, r2.zxy);
    r17.w = ps;
    r18.w = r21.w * 2.0 + r6.z;
    r6.yzw = r1.xyz * UniformScalar_4.xxx + r16.xzw;
    ps = (-1.0) - -r5.x;
    r16.zw = r6.xx * ModShadowGroupColor.xy;
    r1.x = ps;
    r5.x = (r18.w == 0.0) ? r14.x : r14.y;
    ps = UniformVector_4.x * r6.y;
    r2 = r18.wyzw + float4(-3.0, -1.0, -1.0, -2.0);
    r16.x = ps;
    r5.x = (r2.w == 0.0) ? r14.z : r5.x;
    ps = UniformVector_4.y * r6.z;
    r1.yzw = -r16.yzw + 1.0;
    r16.y = ps;
    r5.x = (r2.x == 0.0) ? r14.w : r5.x;
    ps = UniformScalar_1.x * r1.y;
    r2.x = max(r5.x, 0.0);
    r3.x = ps;
    ps = 1.0 - r5.x;
    r11.zw = r3.xx * r2.yz;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r17.x = min(r2.x, 0.3);
    r6.x = ps;
    ps = (-0.75) + r5.x;
    r2.zw = r13.xy + r11.zw;
    r19.w = ps;
    ps = (-3.0) + r5.z;
    r14 = r11 - 2.0;
    r19.x = ps;
    ps = (-3.0) + r5.w;
    r2.xy = r14.xy + r11.zw;
    r19.y = ps;
    r3.yzw = r20.xyz * float3(4.0, 4.0, 1.0) + r19.xyz;
    ps = r19.w;
    r18.yzw = r17.xyz * float3(3.3333333, 0.875, 0.875);
    ps = r5.x + ps;
    r17.xyz = r18.yyy * r3.yzw;
    r5.w = ps;
    r5.xz = r2.zw * UniformVector_3.xy - r2.xy;
    r3.yz = r17.xy * 2.0 + r5.xz;
    r2 = r18.xzwy * r1.yzwx + float4(1.0, 0.125, 0.125, 1.0);
    r3.w = saturate(r6.x * r2.w - 0.5);
    r6.x = (r3.x > 0.0) ? r2.x : 1.0;
    ps = r2.y * r2.z;
    r5.xz = r17.wz * float2(0.5, 0.1);
    r4.w = ps;
    r2.xyz = r4.www * r15.xyz + ModShadowColor.xyz;
    r13.w = r13.z * UniformVector_3.z + r5.z;
    r5.z = (r3.x >= 0.0) ? r6.x : 1.0;
    ps = UniformVector_4.z * r6.w;
    r5.x = saturate(r5.w + r5.x);
    r16.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r10.xyz = r5.xxx * r10.xyz;
    r5.x = ps;
    ps = abs(r2.w) * abs(r2.w);
    r13.xyz = r5.zzz * r12.xyz;
    r3.x = ps;
    ps = (-1.0) + r0.y;
    r12.yzw = r3.xyz * r3.xww;
    r5.y = ps;
    ps = 0.5 * r5.y;
    r15.xyz = r13.xyz * UniformVector_4.xyz;
    r10.w = ps;
    ps = SpotAngles.y * r5.x;
    r14.xy = r14.zw + r12.zw;
    r12.x = saturate(ps);
    ps = r12.x * r12.x;
    r13.xyz = r16.xyz * r13.xyz;
    r5.x = ps;
    ps = r14.x;
    r10.xyz = r10.xyz * r0.zzz;
    ps = r11.x + ps;
    r5.yzw = r15.xyz * r6.yzw;
    r6.x = ps;
    ps = r14.y;
    r13 = r13 - r10;
    r5.yzw = r5.ywz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r10 = r13 * r3.wwww + r10;
    ps = r11.y + ps;
    r6.z = r10.w - 1.0;
    r6.y = ps;
    ps = r12.y * r12.y;
    r11.xyw = r6.xyz * r1.yyy;
    r6.z = ps;
    ps = r6.z;
    r11.z = r11.w + 1.0;
    r6.xyw = (r1.yyy > 0.0) ? r11.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r1.yyy >= 0.0) ? r6.xyw : float3(0.0, 0.0, 1.0);
    ps = r5.y * ps;
    r6.y = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r0.yzw = r10.xyz * r9.xyz;
    r6.y = ps;
    ps = r6.z;
    r1.xyz = r1.xyz * r6.yyy;
    ps = r5.w * ps;
    r6.w = dot(r1.zxy, r8.zxy);
    r6.y = ps;
    ps = r6.z;
    r9.xyz = r1.xyz * r6.www;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = r5.z * ps;
    r5.y = saturate(dot(r4.zxy, r8.zxy));
    r6.z = ps;
    ps = log2(r5.y);
    r6.xyz = r6.xyz * r3.www;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r5.w = r5.y * 15.0;
    r5.y = ps;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r1.zyx, r4.zyx));
    r5.w = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.www;
    r5.y = ps;
    r6.xy = r0.yz * r5.zz + r6.xy;
    r6.z = r0.w * r5.z + r6.z;
    r5.yzw = r6.xyz * r5.yyy;
    r5.yzw = r5.yzw * r7.xyz;
    r5.yzw = r5.yzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.ywz * r5.xxx;
    r5.xyz = r5.xzy * r2.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
