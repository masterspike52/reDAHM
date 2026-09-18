// ps_0f2c0e05d3197683.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 366 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005B8 10041500 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c15); // float3
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

    r5.xw = r0.wz * UniformScalar_4.xx;
    ps = r0.w;
    r5.yz = UniformVector_1.xy * 1.7;
    ps = 1.8e+02 * ps;
    r7 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r6.x = ps;
    ps = r0.z;
    r5.yz = r5.yz * r0.wz;
    ps = 1.8e+02 * ps;
    r12 = r7 * r0.wzwz;
    r6.y = ps;
    r10.yz = tex2D(Texture2D_5, r6.xy).xy;
    r5.x = tex2D(Texture2D_6, r5.xw).x;
    r20.yzw = tex2D(Texture2D_3, r12.xy).xyw;
    r14.xzw = tex2D(Texture2D_3, r5.yz).wxy;
    r12.xy = r0.xy * UniformScalar_0.xx;
    r7.xy = r0.xy * UniformScalar_2.xx;
    ps = r4.w;
    r7.zw = r0.wz * UniformScalar_8.xx;
    ps = 0.0001 * ps;
    r2.w = -r0.z + 1.0;
    r6.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r1.z + 0.1;
    r2.y = ps;
    ps = 1.0 / r4.w;
    r6.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r4.xy = r6.xy * r5.yy + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.z;
    r5.y = float((r0.w >= 0.5));
    r6.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.x = r20.w * r14.x;
    r2.z = ps;
    ps = (-0.5) * r5.y;
    r19.w = float((r2.w >= 0.5));
    r6.w = ps;
    ps = 0.6 * r5.x;
    r5.zw = r2.yz * abs(r8.xy);
    r6.y = ps;
    ps = r6.w;
    r9.xyz = -r6.zxy + 1.0;
    ps = r0.w + ps;
    r2.yz = r9.yy * ModShadowGroupColor.xy;
    r10.x = ps;
    r18 = -r2.wxyz + float4(0.5, 1.0, 1.0, 1.0);
    ps = r10.x + r10.x;
    r6.x = r18.x - r0.z;
    r6.y = ps;
    r6.x = dot(r6.xx, r19.ww) - r0.z;
    ps = r10.y + r10.y;
    r6.z = r6.x + 2.0;
    r6.x = ps;
    ps = r10.z + r10.z;
    r6.w = r6.z - r0.z;
    r6.z = ps;
    r8.xyz = tex2D(Texture2D_9, r7.zw).xyz;
    r17.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r14.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r11 = tex2D(Texture2D_2, r6.yw);
    r10.xyz = tex2D(Texture2D_8, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r7.xy).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r19.xyz = tex2D(Texture2D_1, r12.zw).xyz;
    r12.xyz = tex2D(Texture2D_0, r12.xy).xyw;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.z));
    r13.zw = r19.xy * 4.0;
    r5.z = ps;
    r3.xyz = r5.zzz * r3.xyz;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = r12.x + r12.x;
    r7.yzw = r7.xyz + r7.xyz;
    r13.x = ps;
    ps = r12.y + r12.y;
    r5.w = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r13.y = ps;
    ps = rsqrt(abs(r5.z));
    r15.xyz = r5.www - r10.xyz;
    r5.z = ps;
    r10.xyz = r15.xyz * UniformScalar_7.xxx + r10.xyz;
    ps = r19.z + r19.z;
    r1.xyz = r5.zzz * r1.xyz;
    r21.x = ps;
    ps = r19.w + r19.w;
    r15 = r13 + float4(-1.0, -1.0, -2.0, -2.0);
    r21.w = ps;
    r19.x = r21.w + r5.y;
    r5.w = (r19.x == 0.0) ? r11.x : r11.y;
    ps = r14.z + r14.z;
    r9.w = r9.x * UniformScalar_1.x;
    r19.y = ps;
    ps = r14.w + r14.w;
    r11.xy = r9.ww * r15.xy;
    r19.z = ps;
    ps = (-1.0) + r6.x;
    r19 = r19.xxyz + float4(-3.0, -2.0, -3.0, -3.0);
    r14.z = ps;
    ps = (-1.0) + r6.z;
    r5.yz = r15.zw + r11.xy;
    r14.w = ps;
    r5.w = (r19.y == 0.0) ? r11.z : r5.w;
    r7.x = (r19.x == 0.0) ? r11.w : r5.w;
    ps = r7.x;
    r14 = r14 * float4(0.875, 0.875, 0.018, 0.018);
    r6.x = ps;
    ps = 0.0;
    r21.yz = r14.xy * r18.zw;
    r6.y = ps;
    ps = max(r6.x, r6.y);
    r15 = r7.yzxw + float4(-1.0, -1.0, -0.75, -1.0);
    r5.w = ps;
    ps = r15.z;
    r20.x = min(r5.w, 0.3);
    ps = r7.x + ps;
    r7.yzw = r21.xyz + float3(-1.0, 0.125, 0.125);
    r5.w = ps;
    r18.x = saturate(r18.y * 0.5 + r5.w);
    ps = 0.5 * r7.y;
    r18.yzw = r20.xyz * float3(3.3333333, 4.0, 4.0);
    r5.w = ps;
    r15.z = r15.w * UniformVector_3.z - r5.w;
    ps = (-1.0) - -r2.x;
    r6.xy = r19.zw + r18.zw;
    r6.z = ps;
    ps = 1.0 - r7.x;
    r6.xyz = r18.yyy * r6.zxy;
    r6.w = ps;
    ps = 1.0 + r6.x;
    r2.xy = r15.xy + r11.xy;
    r17.w = ps;
    ps = abs(r17.w) * abs(r17.w);
    r18.yzw = r6.yzw * float3(4.0, 4.0, 2.5);
    r7.x = ps;
    r6.xy = r2.xy * UniformVector_3.xy + r18.yz;
    ps = r7.x * r7.x;
    r15.xy = r6.xy - r5.yz;
    r0.w = ps;
    ps = r7.z * r7.w;
    r2 = r18.xxxw * r17;
    r6.x = ps;
    r6.xyz = r6.xxx * r16.xyz + ModShadowColor.xyz;
    ps = (-0.5) + r2.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = saturate(ps);
    r7.xyz = r15.xyz * r6.www;
    r5.yzw = r5.ywz + r7.xzy;
    ps = 1.0 - r5.z;
    r14.xy = -r5.yw + r14.zw;
    r14.z = ps;
    r12.w = r14.z * r5.x + r5.z;
    r5.xy = r14.xy * r5.xx + r7.xy;
    r5.xy = r5.xy + r11.xy;
    ps = (-2.0) + r5.x;
    r11.xyz = r10.xyz * UniformVector_4.xyz;
    r7.y = ps;
    ps = (-2.0) + r5.y;
    r7.xw = r12.zw - 1.0;
    r7.z = ps;
    r5.w = r7.w * r9.x + 1.0;
    r7.yz = r7.yz + r13.zw;
    r5.xyz = r7.xyz * r9.xxx;
    ps = 1.0 + r5.x;
    r2.xyz = r2.xyz * r12.zzz;
    r7.x = ps;
    r5.xyz = (r9.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.w = (r9.w > 0.0) ? r7.x : 1.0;
    r7 = (r9.xxxw >= 0.0) ? r5 : float4(0.0, 0.0, 1.0, 1.0);
    r5.w = dot(r7.zxy, r7.zxy);
    r8.xyz = r7.www * r8.xyz;
    r5.xyz = r8.xyz * UniformVector_4.xyz;
    r8.xyz = r11.xyz * r8.xyz - r2.xyz;
    r8.xyz = r8.xyz * r6.www + r2.xyz;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.xyz * r10.xyz;
    r5.w = ps;
    r2.xyz = r7.xyz * r5.www;
    r5.w = saturate(dot(r2.zyx, r1.zyx));
    r7.xyz = r5.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r5.x = dot(r2.zxy, r3.zxy);
    r8.xyz = r9.zzz * r8.xyz;
    r0.xyz = r8.xyz * r0.xyz;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r3.xyz;
    ps = r0.w * r0.w;
    r5.x = saturate(dot(r1.zxy, r5.zxy));
    r5.y = ps;
    ps = log2(r5.x);
    r1.xyz = r5.yyy * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r7.xyz = r4.xyz * LightColor.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r0.xy * r5.ww + r5.xy;
    r5.z = r0.z * r5.w + r5.z;
    r5.xyz = r7.xyz * r5.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
