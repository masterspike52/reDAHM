// ps_45b07c262e51d186.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 384 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000600 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.x;
    r5.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_0.x * ps;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r5.z = ps;
    ps = r0.y;
    r5.xy = r5.xy * r0.wz;
    ps = UniformScalar_0.x * ps;
    r6 = r6 * r0.wzwz;
    r5.w = ps;
    r11.xyz = tex2D(Texture2D_0, r5.zw).xyw;
    r19.yzw = tex2D(Texture2D_3, r6.xy).xyw;
    r12.xyz = tex2D(Texture2D_3, r5.xy).xyw;
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r9.zw = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = 0.0001 * r4.w;
    r10.z = float((r0.w >= 0.5));
    r14.w = saturate(ps);
    r10.x = r10.z * (-0.5) + r0.w;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.z = r19.w * r12.z;
    r7.x = ps;
    ps = -r0.z;
    r5.yz = r0.wz * UniformScalar_4.xx;
    ps = 1.0 + ps;
    r13.yz = r0.wz * 1.8e+02;
    r14.y = ps;
    ps = r1.z;
    r15.xy = r0.xy * UniformScalar_2.xx;
    ps = 0.1 + ps;
    r9.xy = r0.wz * UniformScalar_8.xx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = float((r14.y >= 0.5));
    r7.y = ps;
    ps = 5.0 * r5.x;
    r8.xy = r7.xy * abs(r8.xy);
    r14.x = saturate(ps);
    ps = r5.w + r5.w;
    r4 = -r14.xwzy + float4(1.0, 1.0, 1.0, 0.5);
    r10.y = ps;
    r5.x = r4.w - r0.z;
    r11.w = dot(r5.xx, r5.ww) - r0.z;
    ps = r10.x + r10.x;
    r13.xw = r11.zw + float2(-1.0, 2.0);
    r7.x = ps;
    ps = r10.y + r10.z;
    r7.y = r13.w - r0.z;
    r7.w = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r10.xyz = tex2D(Texture2D_9, r9.xy).xyz;
    r16.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r9 = tex2D(Texture2D_2, r7.xy).wyzx;
    r21.xyz = tex2D(Texture2D_8, r15.xy).xyz;
    r17.xyz = tex2D(Texture2D_4, r15.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8.zw = tex2D(Texture2D_5, r13.yz).xy;
    r6.xyz = tex2D(Texture2D_1, r6.zw).xzy;
    r5.x = tex2D(Texture2D_6, r5.yz).x;
    r5.y = dot(r3.zxy, r3.zxy);
    r5.w = dot(r1.zxy, r1.zxy);
    r5.z = dot(r2.zxy, r2.zxy);
    r12.yz = r12.xy * 2.0 - 3.0;
    r8.zw = r8.zw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.z = saturate(-r5.z + 1.0);
    r5.w = ps;
    ps = log2(r5.z);
    r12.w = r14.z - 1.0;
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r15 = r8 * float4(0.875, 0.875, 0.018, 0.018);
    r6.w = ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r18.xyz = r17.xyz + r17.xyz;
    ps = r11.x + r11.x;
    r5.y = dot(r21.zxy, float3(0.11, 0.3, 0.59));
    r17.x = ps;
    ps = r11.y + r11.y;
    r3.xyz = r6.www * r3.xyz;
    r17.y = ps;
    ps = 4.0 * r6.x;
    r2.xyz = r5.www * r1.xyz;
    r17.z = ps;
    ps = 4.0 * r6.z;
    r1.xyz = r5.yyy - r21.xyz;
    r17.w = ps;
    ps = r6.y + r6.y;
    r20 = r17 + float4(-1.0, -1.0, -2.0, -2.0);
    r18.w = ps;
    r6.xyz = r1.zxy * UniformScalar_7.xxx + r21.zxy;
    ps = r4.y;
    r18 = r18 - 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r7.z = r18.w * 0.5;
    r1.y = ps;
    r18.z = r18.z * UniformVector_3.z - r7.z;
    r1.xz = r1.yy * r20.xy;
    r5.y = (r7.w == 0.0) ? r9.w : r9.y;
    r7.xw = r7.ww + float2(-2.0, -3.0);
    r5.w = (r7.x == 0.0) ? r9.z : r5.y;
    ps = 0.6 * r5.x;
    r13.yz = r18.xy + r1.xz;
    r9.w = ps;
    ps = r4.x;
    r7.xy = r20.zw + r1.xz;
    r5.y = ps;
    r13.yz = r13.yz * UniformVector_3.xy - r7.xy;
    r9.z = (r7.w == 0.0) ? r9.x : r5.w;
    ps = ModShadowGroupColor.x * r5.y;
    r5.w = max(r9.z, 0.0);
    r9.x = ps;
    r5.y = r9.z * 2.0 - 0.75;
    r12.x = saturate(r4.z * 0.5 + r5.y);
    ps = ModShadowGroupColor.y * r4.x;
    r19.x = min(r5.w, 0.3);
    r9.y = ps;
    r9 = -r9.wxyz + 1.0;
    r18.xyw = r19.xyz * float3(3.3333333, 4.0, 4.0);
    r12.yz = r12.yz + r18.yw;
    ps = r9.w;
    r12.yzw = r18.xxx * r12.yzw;
    r5.y = ps;
    r18.xy = r12.yz * 4.0 + r13.yz;
    ps = 2.5 * r5.y;
    r16.w = r12.w + 1.0;
    r12.y = ps;
    r12 = r12.xxxy * r16;
    ps = (-0.5) + r12.w;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = saturate(ps);
    r18.xyz = r18.xyz * r0.www;
    r7.xyz = r7.zxy + r18.zxy;
    ps = 1.0 - r7.x;
    r19.xy = -r7.yz + r15.zw;
    r19.z = ps;
    r7.w = r19.z * r5.x + r7.x;
    r5.xy = r19.xy * r5.xx + r18.xy;
    r5.xy = r5.xy + r1.xz;
    ps = (-2.0) + r5.x;
    r7.yz = r15.xy * r9.yz;
    r7.x = ps;
    ps = (-2.0) + r5.y;
    r15.yzw = r7.yzw + float3(0.125, 0.125, -1.0);
    r7.y = ps;
    r7.w = r15.w * r4.y + 1.0;
    ps = abs(r16.w) * abs(r16.w);
    r13.yz = r7.xy + r17.zw;
    r15.x = ps;
    r1.xw = r15.yx * r15.zx;
    r5.xyw = r1.xxx * r14.xyz + ModShadowColor.xyz;
    r7.xyz = r13.xyz * r4.yyy;
    ps = 1.0 + r7.x;
    r11.xyz = r12.xyz * r11.zzz;
    r6.w = ps;
    r7.yzw = (r4.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r6.w = (r1.y > 0.0) ? r6.w : 1.0;
    r7.x = (r1.y >= 0.0) ? r6.w : 1.0;
    r4.xyz = (r4.yyy >= 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    ps = UniformVector_4.x * r6.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r12.x = ps;
    ps = UniformVector_4.y * r6.z;
    r7.xyz = r7.xxx * r10.xyz;
    r12.y = ps;
    ps = UniformVector_4.z * r6.x;
    r10.xyz = r7.xyz * UniformVector_4.xyz;
    r12.z = ps;
    r7.xyz = r12.xyz * r7.xyz - r11.xyz;
    r7.xyz = r7.xyz * r0.www + r11.xyz;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r10.xyz * r6.yzx;
    r6.w = ps;
    r4.xyz = r4.xyz * r6.www;
    r6.w = saturate(dot(r4.zyx, r2.zyx));
    r1.xyz = r6.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r6.x = dot(r4.zxy, r3.zxy);
    r7.xyz = r9.xxx * r7.xyz;
    r7.xyz = r7.xyz * r8.xyz;
    r6.xyz = r4.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r3.xyz;
    ps = r1.w * r1.w;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    r6.y = ps;
    ps = log2(r6.x);
    r1.xyz = r6.yyy * r1.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r6.x = r6.x * 15.0;
    r5.z = ps;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.xyz * r0.www;
    r6.x = ps;
    ps = pow(2.0, r5.z);
    r6.xyz = r1.xyz * r6.xxx;
    r5.z = ps;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.zzz;
    r6.xyz = r6.xyz * r0.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xwy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
