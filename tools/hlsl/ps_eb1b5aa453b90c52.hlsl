// ps_eb1b5aa453b90c52.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 333 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000534 10041300 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.zw = r0.xy * UniformScalar_2.xx;
    r11.xy = r0.wz * UniformScalar_5.xx;
    r5.w = -r0.z + 1.0;
    ps = r1.z;
    r6.xw = UniformVector_1.xy * 1.7;
    ps = 0.1 + ps;
    r9 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = float((r0.w >= 0.5));
    r11.z = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r8.xy = r8.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r10.xy = r6.xw * r0.wz;
    r5.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r9 = r9 * r0.wzwz;
    r11.w = ps;
    r5.x = r5.y * (-0.5) + r0.w;
    ps = r5.x + r5.x;
    r6.x = float((r5.w >= 0.5));
    r8.z = ps;
    ps = r11.z;
    r5.xz = -r5.wz + float2(0.5, 1.0);
    ps = abs(r7.x) * ps;
    r5.w = r5.x - r0.z;
    r5.x = ps;
    r5.w = dot(r5.ww, r6.xx) - r0.z;
    ps = r11.w;
    r5.w = r5.w + 2.0;
    ps = abs(r7.y) * ps;
    r8.w = r5.w - r0.z;
    r5.w = ps;
    r12.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r13.yzw = tex2D(Texture2D_5, r9.zw).xyz;
    r14.zw = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r15 = tex2D(Texture2D_2, r8.zw);
    r11.xyz = tex2D(Texture2D_6, r10.zw).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r10.zw).xyz;
    ps = 0.0001 * r4.w;
    r6.yz = r0.xy * UniformScalar_0.xx;
    r18.x = saturate(ps);
    r0 = tex2D(Texture2D_3, r10.xy).wxyz;
    r17 = tex2D(Texture2D_3, r9.xy);
    r19.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    r6.yzw = tex2D(Texture2D_0, r6.yz).xyw;
    r0.w = r0.w + r17.z;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.w));
    r5.x = r17.w * r0.x;
    r3.w = ps;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = dot(r3.zxy, r3.zxy);
    r4.yzw = r7.xyz + r7.xyz;
    ps = r19.z + r19.z;
    r5.w = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r3.www * r1.xyz;
    r1.x = ps;
    ps = r0.y + r0.y;
    r9.xyz = r1.xxx * r3.xyz;
    r0.y = ps;
    ps = r0.z + r0.z;
    r1.xyz = r5.www - r11.xyz;
    r0.z = ps;
    r11.yzw = r1.xyz * UniformScalar_4.xxx + r11.xyz;
    r0.xyz = r0.yzx + float3(-3.0, -3.0, -1.0);
    ps = ModShadowGroupColor.x * r5.z;
    r1.xyw = r6.yzx + r6.yzx;
    r18.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.z = r1.w + r5.y;
    r18.z = ps;
    r17.xyz = r17.xyz * float3(4.0, 4.0, 1.0) + r0.xyw;
    r5.y = (r1.z == 0.0) ? r15.x : r15.y;
    ps = (-1.0) + r6.w;
    r3.yzw = -r18.xyz + 1.0;
    r18.x = ps;
    ps = 1.0 - r5.x;
    r1 = r1.zyzx + float4(-3.0, -1.0, -2.0, -1.0);
    r17.w = ps;
    r5.y = (r1.z == 0.0) ? r15.z : r5.y;
    ps = (-1.0) - -r5.x;
    r7.w = r3.y * UniformScalar_1.x;
    r3.x = ps;
    ps = 0.5 * r0.z;
    r0.xy = r7.ww * r1.wy;
    r1.w = ps;
    r4.x = (r1.x == 0.0) ? r15.w : r5.y;
    ps = 1.0 - r4.x;
    r5.x = max(r4.x, 0.0);
    r19.w = ps;
    ps = (-2.0) + r0.x;
    r15 = r4.yzwx + float4(-1.0, -1.0, -1.0, -0.75);
    r13.x = ps;
    ps = r15.w;
    r14.y = min(r5.x, 0.3);
    ps = r4.x + ps;
    r6.xyz = r19.xyw * float3(4.0, 4.0, 2.5);
    r1.z = ps;
    ps = (-2.0) + r6.x;
    r5.xy = r15.yx + r0.yx;
    r14.x = ps;
    ps = (-2.0) + r6.y;
    r18.yzw = r14.yzw * float3(3.3333333, 0.875, 0.875);
    r14.y = ps;
    ps = UniformVector_3.x * r5.y;
    r17.xyz = r18.yyy * r17.xyz;
    r0.z = ps;
    ps = UniformVector_3.y * r5.x;
    r14.zw = r17.xy + r17.xy;
    r0.w = ps;
    r5 = r18 * r3.yxzw + float4(1.0, 1.0, 0.125, 0.125);
    r4.w = saturate(r6.z * r5.y - 0.5);
    r4.x = (r7.w > 0.0) ? r5.x : 1.0;
    ps = r5.z * r5.w;
    r1.xy = r17.zw * float2(0.1, 0.5);
    r4.y = ps;
    r5.xzw = r4.yyy * r16.xyz + ModShadowColor.xyz;
    r12.w = r15.z * UniformVector_3.z + r1.x;
    r4.x = (r7.w >= 0.0) ? r4.x : 1.0;
    ps = r1.z;
    r15.xyz = r11.yzw * UniformVector_4.xyz;
    ps = r1.y + ps;
    r14 = r14 + r0;
    r1.x = saturate(ps);
    ps = (-2.0) + r0.y;
    r1.xyz = r1.xxx * r13.yzw;
    r13.y = ps;
    ps = abs(r5.y) * abs(r5.y);
    r12.xyz = r4.xxx * r12.xyz;
    r4.x = ps;
    ps = r14.z - r14.x;
    r0.xyz = r12.xyz * UniformVector_4.xyz;
    r4.y = ps;
    ps = r14.w - r14.y;
    r12.xyz = r15.xyz * r12.xyz;
    r4.z = ps;
    ps = r4.x * r4.x;
    r1.xyz = r1.xyz * r6.www;
    r11.x = ps;
    ps = r4.y * r4.w;
    r0.xyz = r0.xyz * r11.yzw;
    r11.y = ps;
    ps = r4.z * r4.w;
    r12 = r12 - r1;
    r11.z = ps;
    r0.xyz = r0.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r13.xy = r13.xy + r11.yz;
    r6.xy = r13.xy + r6.xy;
    r1 = r12 * r4.wwww + r1;
    ps = (-1.0) - -r1.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = r11.x * r11.x;
    r6.xyw = r6.xyz * r3.yyy;
    r5.y = ps;
    ps = r5.y;
    r6.z = r6.w + 1.0;
    r6.xyz = (r3.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r3.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.x * ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r1.xyz * r10.xyz;
    r6.y = ps;
    ps = r5.y;
    r3.xyz = r3.xyz * r6.yyy;
    ps = r0.y * ps;
    r6.z = dot(r3.zxy, r9.zxy);
    r6.y = ps;
    ps = r5.y;
    r10.xyz = r3.xyz * r6.zzz;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = r0.z * ps;
    r5.y = saturate(dot(r7.zxy, r9.zxy));
    r6.z = ps;
    ps = log2(r5.y);
    r6.yzw = r6.xyz * r4.www;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r0.xyz = r8.xyz * r2.www;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.y = saturate(dot(r3.zyx, r7.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r1.xy * r5.yy + r6.xy;
    r6.z = r1.z * r5.y + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
