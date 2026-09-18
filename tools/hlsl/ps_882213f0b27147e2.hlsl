// ps_882213f0b27147e2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 375 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005DC 10041500 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c17); // float
float4 UniformScalar_11 : register(c18); // float
float4 UniformScalar_12 : register(c19); // float
float4 UniformScalar_13 : register(c20); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformScalar_8 : register(c15); // float
float4 UniformScalar_9 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
sampler2D Texture2D_10 : register(s11);
sampler2D Texture2D_11 : register(s12);
sampler2D ModShadowAccumTexture : register(s13);

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

    ps = r0.x;
    r5.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_3.x * ps;
    r6 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r10.x = ps;
    ps = r0.y;
    r5.xy = r5.xy * r0.wz;
    ps = UniformScalar_3.x * ps;
    r9 = r6 * r0.wzwz;
    r10.y = ps;
    r2.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    r14.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r9.xy).xyw;
    r15.xyz = tex2D(Texture2D_3, r5.xy).wxy;
    r11.xy = r0.wz * UniformScalar_0.xx;
    r11.zw = r0.xy * UniformScalar_2.xx;
    ps = 1.0 - r0.z;
    r10.zw = r0.wz * UniformScalar_7.xx;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r1.z + 0.1;
    r6.y = ps;
    ps = 1.0 / r4.w;
    r6.xz = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r16.xy = r6.xz * r5.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r5.x;
    r9.xy = r0.wz * UniformScalar_9.xx;
    r5.z = saturate(ps);
    ps = 0.5 - r5.y;
    r6.x = float((r0.w >= 0.5));
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r8.z * r15.x;
    r6.z = ps;
    ps = r5.w;
    r14.w = float((r5.y >= 0.5));
    ps = -r0.z + ps;
    r7.yz = r6.yz * abs(r7.xy);
    r5.y = ps;
    r12.w = r14.w * 2.0 + r6.x;
    r5.y = dot(r5.yy, r14.ww) - r0.z;
    ps = (-1.0) + r5.x;
    r6.yw = -r5.xz + 1.0;
    r16.z = ps;
    ps = 2.0 + r5.y;
    r7.xw = r6.xy * float2(-0.5, 0.5);
    r16.w = ps;
    ps = r16.w;
    r2.w = r7.x + r0.w;
    ps = -r0.z + ps;
    r12.xz = r2.wz + r2.wz;
    r12.y = ps;
    r17.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r6.xz = tex2D(ModShadowAccumTexture, r7.yz).xy;
    r9.yzw = tex2D(Texture2D_11, r9.xy).xyz;
    r18.xyz = tex2D(Texture2D_9, r10.zw).xyz;
    r13 = tex2D(Texture2D_2, r12.xy);
    r19.xyz = tex2D(Texture2D_10, r10.xy).xyz;
    r5.y = tex2D(Texture2D_6, r0.wz).x;
    r10.xyz = tex2D(Texture2D_8, r11.zw).xyz;
    r20.xyz = tex2D(LightAttenuationTexture, r16.xy).xyz;
    r5.xzw = tex2D(Texture2D_4, r11.zw).xyz;
    r0.xyz = tex2D(Texture2D_0, r11.xy).wxy;
    ps = r4.w;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r9.x = saturate(ps);
    ps = r0.y + r0.y;
    r4.x = dot(r1.zxy, r1.zxy);
    r15.x = ps;
    ps = r0.z + r0.z;
    r15.zw = r15.yz + r15.yz;
    r15.y = ps;
    ps = r5.x + r5.x;
    r7.xyz = r20.xyz * LightColor.xyz;
    r4.y = ps;
    ps = r5.z + r5.z;
    r0.w = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r4.z = ps;
    ps = rsqrt(abs(r4.x));
    r3.w = dot(r19.zxy, float3(0.11, 0.3, 0.59));
    r4.x = ps;
    ps = UniformScalar_4.x * r5.y;
    r1.xyz = r4.xxx * r1.xyz;
    r5.y = saturate(ps);
    ps = log2(r5.y);
    r20.xyz = r3.www - r19.xyz;
    r5.y = ps;
    r14.xyw = r14.xyz * 2.0 - 1.0;
    ps = UniformScalar_5.x * r5.y;
    r21.xyz = r0.www - r10.xyz;
    r0.w = ps;
    r10.yzw = r21.xyz * UniformScalar_6.xxx + r10.xyz;
    r5.xyz = r20.zxy * UniformScalar_8.xxx + r19.zxy;
    ps = rsqrt(abs(r1.w));
    r15 = r15 + float4(-1.0, -1.0, -3.0, -3.0);
    r3.w = ps;
    r16.xy = r8.xy * 4.0 + r15.zw;
    r1.w = (r12.w == 0.0) ? r13.x : r13.y;
    ps = UniformVector_3.x * r5.y;
    r8.xyz = r3.www * r3.xyz;
    r10.x = ps;
    ps = UniformVector_3.y * r5.z;
    r3.xyz = r10.yzw * UniformVector_2.xyz;
    r10.y = ps;
    ps = UniformVector_3.z * r5.x;
    r3.xyz = r3.xyz * r18.xyz;
    r10.z = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r19.xyz = r10.xyz * r9.yzw;
    r9.y = ps;
    r18.xyz = r19.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r10.xyz = r3.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = pow(2.0, r0.w);
    r19.xyz = r19.xyz - r3.xyz;
    r0.w = ps;
    r3.xyz = r19.xyz * r0.www + r3.xyz;
    ps = ModShadowGroupColor.y * r6.w;
    r18.xyz = r18.xyz - r10.xyz;
    r9.z = ps;
    r10.xyz = r18.xyz * r0.www + r10.xyz;
    ps = r5.w + r5.w;
    r9.xyz = -r9.xyz + 1.0;
    r4.w = ps;
    ps = 4.0 * r2.x;
    r9.w = r9.x * UniformScalar_1.x;
    r5.x = ps;
    r13.xy = r9.ww * r15.xy - 2.0;
    ps = 4.0 * r2.y;
    r12.xzw = r12.zww + float3(-1.0, -3.0, -2.0);
    r5.y = ps;
    r6.y = (r12.w == 0.0) ? r13.z : r1.w;
    r4.x = (r12.z == 0.0) ? r13.w : r6.y;
    ps = (-2.0) + r5.x;
    r6.y = max(r4.x, 0.0);
    r14.z = ps;
    ps = 1.0 - r4.x;
    r18 = r4 + float4(-0.75, -1.0, -1.0, -1.0);
    r12.y = ps;
    ps = r18.x;
    r6.y = min(r6.y, 0.3);
    ps = r4.x + ps;
    r2.xyz = r14.xyw - r18.yzw;
    r6.w = ps;
    r14.xy = r2.xy * r0.ww + r18.yz;
    ps = 3.3333333 * r6.y;
    r13.zw = r12.xy * float2(0.5, 2.5);
    r12.y = ps;
    r5.z = r2.z * r0.w - r13.z;
    ps = 0.875 * r6.x;
    r6.w = saturate(r6.w + r7.w);
    r12.z = ps;
    ps = 0.875 * r6.z;
    r2.xyz = r6.www * r17.xyz;
    r12.w = ps;
    r4.x = r5.w * 2.0 + r5.z;
    ps = (-2.0) + r5.y;
    r4.yzw = r12.yyy * r16.xyz;
    r14.w = ps;
    r6 = r9.wwww * r15.xyyx + r14.zwyx;
    r5.zw = r4.yz * 4.0 + r6.wz;
    ps = (-1.0) + r0.x;
    r14.zw = r4.xw + float2(-1.0, 1.0);
    r4.x = ps;
    r6.w = saturate(r13.w * r14.w - 0.5);
    ps = abs(r14.w) * abs(r14.w);
    r14.xy = r5.zw - r6.xy;
    r0.w = ps;
    r6.xyz = r14.zxy * r6.www + r13.zxy;
    ps = (-1.0) - -r6.x;
    r4.yz = r6.yz + r5.xy;
    r12.x = ps;
    r6.yz = r12.zw * r9.yz + 0.125;
    r5.w = r12.x * r9.x + 1.0;
    ps = r0.w * r0.w;
    r5.xyz = r4.xyz * r9.xxx;
    r6.x = ps;
    ps = 1.0 + r5.x;
    r0.yzw = r2.xyz * r0.xxx;
    r0.x = ps;
    r2.xyz = (r9.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r2.w = (r9.w > 0.0) ? r0.x : 1.0;
    r5.xy = r6.yx * r6.zx;
    r5.xzw = r5.xxx * r11.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r6.xyz = r5.yyy * r10.xyz;
    r2 = (r9.xxxw >= 0.0) ? r2 : float4(0.0, 0.0, 1.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    r3.xyz = r3.xyz * r2.www - r0.yzw;
    r3.xyz = r3.xyz * r6.www + r0.yzw;
    ps = rsqrt(abs(r5.y));
    r6.yzw = r6.xyz * r6.www;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r2.xyz * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r2.zxy, r8.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r4.xyz = r2.xyz * r5.yyy;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r1.zxy, r4.zxy));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r3.xyz * r0.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.y = saturate(dot(r2.zyx, r1.zyx));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.yy + r6.xy;
    r6.z = r0.z * r5.y + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r5.xyz = r6.xzy * r5.xwz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
