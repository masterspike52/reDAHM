// ps_df92470738140ebc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 336 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000540 10041300 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.x = tex2D(ShadowTexture, r0.xy).x;
    r7.xy = r1.xy * UniformScalar_0.xx;
    r3.xy = r1.xy * UniformScalar_2.xx;
    r9.xy = r1.wz * UniformScalar_5.xx;
    r6.z = -r1.z + 1.0;
    ps = r2.z;
    r10.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = 0.1 + ps;
    r7.zw = UniformVector_1.xy * 1.7;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r0.y = ps;
    ps = 5.0 * r6.x;
    r2.w = float((r1.w >= 0.5));
    r6.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r7.zw * r1.wz;
    r0.z = ps;
    ps = 1.0 / r5.w;
    r11 = r11 * r1.wzwz;
    r10.w = ps;
    r6.x = r2.w * (-0.5) + r1.w;
    ps = r6.x + r6.x;
    r1.x = float((r6.z >= 0.5));
    r0.x = ps;
    ps = r10.x * r10.x;
    r0.zw = r0.yz * abs(r8.xy);
    r6.w = ps;
    ps = r10.y * r10.w;
    r6.xz = -r6.zy + float2(0.5, 1.0);
    r6.y = ps;
    ps = r10.z * r10.w;
    r0.y = r6.x - r1.z;
    r6.x = ps;
    r0.y = dot(r0.yy, r1.xx) - r1.z;
    ps = ScreenPositionScaleBias.w + r6.y;
    r0.y = r0.y + 2.0;
    r3.z = ps;
    ps = ScreenPositionScaleBias.z + r6.x;
    r0.y = r0.y - r1.z;
    r3.w = ps;
    r9.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r13.xyz = tex2D(Texture2D_5, r11.zw).xyz;
    r14.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0 = tex2D(Texture2D_2, r0.xy);
    r15.xyz = tex2D(LightAttenuationTexture, r3.zw).xyz;
    r10.xzw = tex2D(Texture2D_6, r3.xy).xyz;
    r3.yzw = tex2D(Texture2D_4, r3.xy).xyz;
    r8 = tex2D(Texture2D_3, r7.zw);
    r17 = tex2D(Texture2D_3, r11.xy);
    r19.xyz = tex2D(Texture2D_1, r11.zw).xyz;
    r1.yzw = tex2D(Texture2D_0, r7.xy).xyw;
    ps = r5.w;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r10.y = saturate(ps);
    ps = (-1.0) + r1.w;
    r3.x = dot(r4.zxy, r4.zxy);
    r18.x = ps;
    ps = r19.z + r19.z;
    r7.w = r8.z + r17.z;
    r7.x = ps;
    ps = r8.x + r8.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r7.y = ps;
    ps = r8.y + r8.y;
    r3.yzw = r3.yzw + r3.yzw;
    r7.z = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r17.w * r8.w;
    r4.w = ps;
    ps = 1.0 - r6.x;
    r6.y = dot(r10.wxz, float3(0.11, 0.3, 0.59));
    r17.w = ps;
    ps = rsqrt(abs(r3.x));
    r8.xyz = r4.www * r2.xyz;
    r4.w = ps;
    ps = (-1.0) - -r6.x;
    r11.xyz = r6.yyy - r10.xzw;
    r2.x = ps;
    ps = r4.w;
    r5.xyz = r6.www * r15.xyz;
    r11.yzw = r11.xyz * UniformScalar_4.xxx + r10.xzw;
    ps = r4.x * ps;
    r7.xyz = r7.xyz + float3(-1.0, -3.0, -3.0);
    r10.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r15.xyw = r1.yzx + r1.yzx;
    r10.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15.z = r15.w + r2.w;
    r10.w = ps;
    r17.xyz = r17.xyz * float3(4.0, 4.0, 1.0) + r7.yzw;
    r3.x = (r15.z == 0.0) ? r0.x : r0.y;
    ps = 0.5 * r7.x;
    r2.yzw = -r10.yzw + 1.0;
    r13.w = ps;
    ps = UniformScalar_1.x * r2.y;
    r6 = r15.xyzz + float4(-1.0, -1.0, -3.0, -2.0);
    r5.w = ps;
    r7.x = (r6.w == 0.0) ? r0.z : r3.x;
    r3.x = (r6.z == 0.0) ? r0.w : r7.x;
    ps = 1.0 - r3.x;
    r0.xy = r5.ww * r6.xy;
    r19.w = ps;
    ps = (-2.0) + r0.x;
    r6.x = max(r3.x, 0.0);
    r10.y = ps;
    ps = (-2.0) + r0.y;
    r15 = r3.yzwx + float4(-1.0, -1.0, -1.0, -0.75);
    r10.z = ps;
    ps = r15.w;
    r14.y = min(r6.x, 0.3);
    ps = r3.x + ps;
    r7.xyz = r19.xyw * float3(4.0, 4.0, 2.5);
    r3.z = ps;
    ps = (-2.0) + r7.x;
    r6.xy = r15.yx + r0.yx;
    r14.x = ps;
    ps = (-2.0) + r7.y;
    r18.yzw = r14.yzw * float3(3.3333333, 0.875, 0.875);
    r14.y = ps;
    ps = UniformVector_3.x * r6.y;
    r17.xyz = r18.yyy * r17.xyz;
    r0.z = ps;
    ps = UniformVector_3.y * r6.x;
    r14.zw = r17.xy + r17.xy;
    r0.w = ps;
    r6 = r18 * r2.yxzw + float4(1.0, 1.0, 0.125, 0.125);
    r3.w = saturate(r7.z * r6.y - 0.5);
    r7.w = (r5.w > 0.0) ? r6.x : 1.0;
    ps = r6.z * r6.w;
    r3.xy = r17.zw * float2(0.1, 0.5);
    r8.w = ps;
    r6.xzw = r8.www * r16.xyz + ModShadowColor.xyz;
    r9.w = r15.z * UniformVector_3.z + r3.x;
    r7.w = (r5.w >= 0.0) ? r7.w : 1.0;
    ps = r3.z;
    r15.xyz = r11.yzw * UniformVector_4.xyz;
    ps = r3.y + ps;
    r14 = r14 + r0;
    r0.x = saturate(ps);
    ps = abs(r6.y) * abs(r6.y);
    r13.xyz = r0.xxx * r13.xyz;
    r6.y = ps;
    ps = r6.y * r6.y;
    r9.xyz = r7.www * r9.xyz;
    r3.x = ps;
    ps = r14.z - r14.x;
    r0.xyz = r9.xyz * UniformVector_4.xyz;
    r3.y = ps;
    ps = r14.w - r14.y;
    r9.xyz = r15.xyz * r9.xyz;
    r3.z = ps;
    ps = r3.x * r3.x;
    r13.xyz = r13.xyz * r1.www;
    r11.x = ps;
    ps = r3.y * r3.w;
    r1.xyz = r0.xyz * r11.yzw;
    r11.y = ps;
    ps = r3.z * r3.w;
    r0 = r9 - r13;
    r11.z = ps;
    r9.xyz = r1.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r4.w;
    r1.xy = r10.yz + r11.yz;
    ps = r4.y * ps;
    r7.xy = r1.xy + r7.xy;
    r10.y = ps;
    r0 = r0 * r3.wwww + r13;
    ps = r4.w;
    r7.z = r0.w - 1.0;
    ps = r4.z * ps;
    r7.xyw = r7.xyz * r2.yyy;
    r10.z = ps;
    ps = r11.x;
    r7.z = r7.w + 1.0;
    r7.xyz = (r2.yyy > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.yzw = (r2.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.x * ps;
    r6.y = dot(r7.wyz, r7.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r0.xyz * r12.xyz;
    r6.y = ps;
    ps = r11.x;
    r1.xyz = r7.yzw * r6.yyy;
    ps = r9.y * ps;
    r6.y = dot(r1.zxy, r10.zxy);
    r7.y = ps;
    ps = r11.x;
    r2.xyz = r1.xyz * r6.yyy;
    r2.xyz = r2.xyz * 2.0 - r10.xyz;
    ps = r9.z * ps;
    r6.y = saturate(dot(r8.zxy, r2.zxy));
    r7.z = ps;
    ps = log2(r6.y);
    r7.yzw = r7.xyz * r3.www;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.y = saturate(dot(r1.zyx, r8.zyx));
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r0.xy * r6.yy + r7.xy;
    r7.z = r0.z * r6.y + r7.z;
    r7.xyz = r5.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
