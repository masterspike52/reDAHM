// ps_af5dd753d886acb1.bin
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

    r2.yz = r0.xy * UniformScalar_0.xx;
    r10.zw = r0.xy * UniformScalar_2.xx;
    r6.zw = r0.wz * UniformScalar_5.xx;
    r5.w = -r0.z + 1.0;
    ps = r1.z;
    r6.xy = UniformVector_1.xy * 1.7;
    ps = 0.1 + ps;
    r11 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = float((r0.w >= 0.5));
    r8.x = ps;
    ps = 1.0 / r4.w;
    r2.xw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r10.xy = r2.xw * r5.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r9.xy = r6.xy * r0.wz;
    r5.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r11 = r11 * r0.wzwz;
    r8.y = ps;
    r5.x = r5.y * (-0.5) + r0.w;
    ps = r5.x + r5.x;
    r2.x = float((r5.w >= 0.5));
    r6.x = ps;
    ps = r8.x;
    r5.xz = -r5.wz + float2(0.5, 1.0);
    ps = abs(r7.x) * ps;
    r5.w = r5.x - r0.z;
    r5.x = ps;
    r5.w = dot(r5.ww, r2.xx) - r0.z;
    ps = r8.y;
    r5.w = r5.w + 2.0;
    ps = abs(r7.y) * ps;
    r6.y = r5.w - r0.z;
    r5.w = ps;
    r8.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r13.xyz = tex2D(Texture2D_5, r11.zw).xyz;
    r9.zw = tex2D(ModShadowAccumTexture, r5.xw).xy;
    r19 = tex2D(Texture2D_2, r6.xy);
    r6.yzw = tex2D(Texture2D_6, r10.zw).xyz;
    r7.xzw = tex2D(Texture2D_4, r10.zw).xyz;
    r10.yzw = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r0 = tex2D(Texture2D_3, r9.xy).wxyz;
    r17 = tex2D(Texture2D_3, r11.xy);
    r18.xyz = tex2D(Texture2D_1, r11.zw).xyz;
    r2.yzw = tex2D(Texture2D_0, r2.yz).wxy;
    r7.y = saturate(r4.w * 0.0001);
    r12.xyz = -UniformVector_0.xyz + 1.0;
    ps = (-1.0) + r2.y;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = ps;
    ps = r18.z + r18.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r10.x = ps;
    ps = r0.w;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = r17.z + ps;
    r0.yz = r0.yz + r0.yz;
    r14.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = r17.w * r0.x;
    r5.w = ps;
    ps = 1.0 - r5.x;
    r4.xyz = r10.yzw * LightColor.xyz;
    r17.w = ps;
    ps = (-1.0) - -r5.x;
    r10.yzw = r7.xzw + r7.xzw;
    r3.w = ps;
    ps = r5.w;
    r5.x = dot(r6.wyz, float3(0.11, 0.3, 0.59));
    ps = r1.x * ps;
    r11.xyz = r5.xxx - r6.yzw;
    r7.x = ps;
    r11.yzw = r11.xyz * UniformScalar_4.xxx + r6.yzw;
    ps = rsqrt(abs(r6.x));
    r15 = r10.xwzy - 1.0;
    r5.x = ps;
    ps = r15.x;
    r10.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.xyw = r2.zwx + r2.zwx;
    r7.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.z = r6.w + r5.y;
    r7.w = ps;
    r5.y = (r6.z == 0.0) ? r19.x : r19.y;
    ps = 0.5 * r5.x;
    r3.xyz = -r7.zyw + 1.0;
    r13.w = ps;
    ps = UniformScalar_1.x * r3.y;
    r6 = r6.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r4.w = ps;
    r5.x = (r6.w == 0.0) ? r19.z : r5.y;
    r0.x = (r6.z == 0.0) ? r19.w : r5.x;
    ps = 1.0 - r0.x;
    r6.xy = r4.ww * r6.xy;
    r18.w = ps;
    ps = (-2.0) + r6.x;
    r5.z = max(r0.x, 0.0);
    r7.y = ps;
    ps = (-2.0) + r6.y;
    r5.xy = r15.zw + r6.yx;
    r7.z = ps;
    ps = UniformVector_3.x * r5.y;
    r9.y = min(r5.z, 0.3);
    r6.z = ps;
    ps = UniformVector_3.y * r5.x;
    r14.xyw = r0.yzx + float3(-3.0, -3.0, -0.75);
    r6.w = ps;
    ps = r14.w;
    r5.xyz = r18.xyw * float3(4.0, 4.0, 2.5);
    r14.xyz = r17.xyz * float3(4.0, 4.0, 1.0) + r14.xyz;
    ps = r0.x + ps;
    r9.yzw = r9.yzw * float3(3.3333333, 0.875, 0.875);
    r1.w = ps;
    ps = (-2.0) + r5.x;
    r17.xyz = r9.yyy * r14.xyz;
    r14.x = ps;
    ps = (-2.0) + r5.y;
    r14.zw = r17.xy + r17.xy;
    r14.y = ps;
    r9 = r9.yzwx * r3.wxzy + float4(1.0, 0.125, 0.125, 1.0);
    r8.w = saturate(r5.z * r9.x - 0.5);
    r0.w = (r4.w > 0.0) ? r9.w : 1.0;
    ps = r9.y * r9.z;
    r15.xw = r17.zw * float2(0.1, 0.5);
    r0.x = ps;
    r0.xyz = r0.xxx * r16.xyz + ModShadowColor.xyz;
    r9.w = r15.y * UniformVector_3.z + r15.x;
    r0.w = (r4.w >= 0.0) ? r0.w : 1.0;
    ps = r1.w;
    r15.xyz = r11.yzw * UniformVector_4.xyz;
    ps = r15.w + ps;
    r14 = r14 + r6;
    r6.x = saturate(ps);
    ps = abs(r9.x) * abs(r9.x);
    r13.xyz = r6.xxx * r13.xyz;
    r6.x = ps;
    ps = r6.x * r6.x;
    r9.xyz = r0.www * r8.xyz;
    r8.x = ps;
    ps = r14.z - r14.x;
    r6.xyz = r9.xyz * UniformVector_4.xyz;
    r8.y = ps;
    ps = r14.w - r14.y;
    r9.xyz = r15.xyz * r9.xyz;
    r8.z = ps;
    ps = r8.x * r8.x;
    r13.xyz = r13.xyz * r2.yyy;
    r11.x = ps;
    ps = r8.y * r8.w;
    r2.xyz = r6.xyz * r11.yzw;
    r11.y = ps;
    ps = r8.z * r8.w;
    r6 = r9 - r13;
    r11.z = ps;
    r9.xyz = r2.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r5.w;
    r2.xy = r7.yz + r11.yz;
    ps = r1.y * ps;
    r5.xy = r2.xy + r5.xy;
    r7.y = ps;
    r6 = r6 * r8.wwww + r13;
    ps = r5.w;
    r5.z = r6.w - 1.0;
    ps = r1.z * ps;
    r5.xyw = r5.xyz * r3.yyy;
    r7.z = ps;
    ps = r11.x;
    r5.z = r5.w + 1.0;
    r5.xyz = (r3.yyy > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r3.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.x * ps;
    r5.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r6.xyz * r12.xyz;
    r5.x = ps;
    ps = r11.x;
    r2.xyz = r1.xyz * r5.xxx;
    ps = r9.y * ps;
    r5.x = dot(r2.zxy, r10.zxy);
    r5.z = ps;
    ps = r11.x;
    r1.xyz = r2.xyz * r5.xxx;
    r1.xyz = r1.xyz * 2.0 - r10.xyz;
    ps = r9.z * ps;
    r5.x = saturate(dot(r7.zxy, r1.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r1.xyz = r5.yzw * r8.www;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r2.zyx, r7.zyx));
    r5.x = ps;
    r5.xyz = r1.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r4.xyz * r5.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
