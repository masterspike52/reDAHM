// ps_d406dccc8e45ff01.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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

    r12.y = UniformScalar_2.x * UniformVector_5.y;
    ps = UniformScalar_13.x;
    r8.x = saturate(r6.w * 15.0);
    ps = 0.05 * ps;
    r11.y = UniformVector_5.y * UniformScalar_5.x;
    r2.x = ps;
    ps = r4.w;
    r8.z = r1.z + 0.1;
    ps = (-4e+02) + ps;
    r5.z = UniformScalar_1.x * UniformVector_3.x;
    r8.y = ps;
    ps = UniformVector_3.x;
    r2.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = UniformScalar_4.x * ps;
    r16 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.y = ps;
    ps = UniformVector_5.x * r5.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r5.x));
    r8.yz = saturate(r8.zy * float2(5.0, 0.00022222222));
    r5.x = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.xxx * r3.xyz;
    r8.w = ps;
    r2.xyz = r2.yzx * r8.wwz;
    ps = UniformVector_5.x * r5.z;
    r12.zw = r9.xy * r2.zz;
    r12.x = ps;
    ps = 1.0 - r0.z;
    r13 = r12.zxyw + r0.wxyz;
    r5.w = ps;
    ps = r13.x;
    r5.x = -r13.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r10.yz = r5.wx * UniformVector_1.yy;
    r10.w = ps;
    ps = UniformVector_1.x * r0.w;
    r18.xyz = -ModShadowColor.xyz + 1.0;
    r10.x = ps;
    ps = r11.x;
    r3 = r10.wzxy - 0.5;
    ps = r0.x + ps;
    r15 = float4((r10.wzxy >= 0.5));
    r5.x = ps;
    ps = r11.y;
    r3 = r3 - r10.wzxy;
    r3 = r3 * r15 + r10.wzxy;
    ps = r0.y + ps;
    r12 = r3.zwxy + r3.zwxy;
    r5.y = ps;
    r21 = tex2D(Texture2D_4, r16.xy);
    r14 = tex2D(Texture2D_3, r12.xy);
    r11 = tex2D(Texture2D_6, r13.yz);
    r17 = tex2D(Texture2D_7, r5.xy);
    r10 = tex2D(Texture2D_9, r0.xy);
    r16.yzw = tex2D(Texture2D_4, r16.zw).xyw;
    ps = r4.w;
    r3.yzw = UniformVector_4.xyz * 2e+01;
    ps = 0.0001 * ps;
    r5.w = float((UniformScalar_8.x >= 1.0));
    r3.x = saturate(ps);
    r4.xyz = r10.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = -r6.w;
    r5.xyz = r17.xyz * r17.www;
    r5.xyz = r11.xyz * r11.www + r5.xyz;
    ps = UniformScalar_9.x + ps;
    r11.xyz = r3.yzw * r5.xyz;
    r4.w = ps;
    ps = r8.y;
    r5.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.y = r5.y - r11.x;
    r5.z = ps;
    ps = 1.0 - r8.x;
    r19.w = saturate(r5.y + r11.x);
    r1.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = -r19.w + 1.0;
    r3.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4 = r4 * r5.yyyw;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r4.w + r6.w;
    r5.w = ps;
    ps = -r5.x;
    r12.xy = r5.yw * abs(r7.xy);
    ps = r6.z + ps;
    r19.x = dot(r15.xyy, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r19.y = dot(r15.zww, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r5.x = (r19.y == 0.0) ? r14.x : r14.y;
    ps = UniformScalar_10.x;
    r15 = r19.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r3.w = ps;
    r5.x = (r15.z == 0.0) ? r14.z : r5.x;
    r5.x = (r15.w == 0.0) ? r14.w : r5.x;
    ps = max(r3.z, r3.w);
    r5.w = max(r5.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_11.x;
    r7.xy = min(r5.yw, float2(1.0, 0.3));
    r5.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r3.w = saturate(r7.x * r5.y);
    r3.z = ps;
    ps = r0.w + r0.w;
    r3 = -r3.wyzx + 1.0;
    r5.z = ps;
    ps = r0.z + r0.z;
    r16.x = r3.x * r6.w;
    r5.w = ps;
    ps = r16.y + r16.y;
    r6.xy = r16.xw * r21.zw;
    r14.x = ps;
    ps = r16.z + r16.z;
    r5.y = float((r6.x >= 0.05));
    r14.y = ps;
    ps = ScreenPositionScaleBias.w + r2.x;
    r0.zw = -r5.yx + 1.0;
    r5.x = ps;
    r5.y = (UniformScalar_9.x > 0.0) ? r0.z : 1.0;
    r5.y = (UniformScalar_9.x >= 0.0) ? r5.y : r0.z;
    ps = ScreenPositionScaleBias.z + r2.y;
    r14.z = r5.y * r10.w;
    r5.y = ps;
    ps = r13.x + r13.x;
    r7.xzw = r14.zxy + float3(-0.5, -1.0, -1.0);
    r2.x = ps;
    ps = r13.w + r13.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r2.y = ps;
    r17 = tex2D(Texture2D_2, r5.zw);
    r16.xyz = tex2D(Texture2D_8, r2.xy).xyz;
    r14.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r13 = tex2D(Texture2D_3, r12.zw);
    r6.xz = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r2.xyw = tex2D(Texture2D_0, r2.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r5.zw).xyz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).zxy;
    r5.w = dot(r1.zxy, r1.zxy);
    r20.xyz = r12.xyz * 2.0 - 1.0;
    r12.xyz = r2.xyw * 2.0 - 1.0;
    r15.zw = r21.xy * 2.0 - 1.0;
    r6.w = (r19.x == 0.0) ? r13.x : r13.y;
    r6.w = (r15.y == 0.0) ? r13.z : r6.w;
    r15.x = (r15.x == 0.0) ? r13.w : r6.w;
    ps = 0.875 * r6.x;
    r15.y = r7.y * 3.3333333;
    r13.x = ps;
    ps = 0.875 * r6.z;
    r0.xy = -r15.xy + 1.0;
    r13.y = ps;
    ps = r8.x;
    r14.xyz = r14.xyz + r14.xyz;
    r19.yz = r13.xy * r3.yz + 0.125;
    r6.z = dot(r8.xx, r0.xx) + r15.x;
    ps = r0.y * ps;
    r14.w = r6.z + r15.x;
    r13.z = ps;
    ps = (-1.0) - -r6.y;
    r14 = r14 + float4(-1.0, -1.0, -1.0, 0.25);
    r13.w = ps;
    ps = r14.w;
    r8.xzw = r20.zxy - r12.zxy;
    ps = -r6.y + ps;
    r6.xzw = r14.zxy * UniformVector_3.zxy;
    r6.y = saturate(ps);
    r14.xy = -r6.zw * r19.ww + r6.zw;
    ps = 1.0 - r6.x;
    r16.xyz = r6.yyy * r16.xyz;
    r19.x = ps;
    ps = 2.5 * r0.w;
    r13.xy = -r16.xy + r17.xy;
    r0.y = ps;
    r7.xy = r13.xy * r17.ww + r16.xy;
    ps = -r16.z;
    r3.xy = r19.xy * r19.wz;
    r2.xyz = r3.yyy * r18.xyz + ModShadowColor.xyz;
    ps = r17.z + ps;
    r6.w = r6.x + r3.x;
    r8.y = ps;
    ps = rsqrt(abs(r5.w));
    r8 = r8.zwxy * r17.wwww;
    r5.w = ps;
    ps = r16.z;
    r3.xyz = r5.www * r1.xyz;
    ps = r8.w + ps;
    r13.xy = r7.zw * 0.5;
    r7.z = ps;
    ps = r8.z;
    r13.xyz = r15.zyw + r13.xzy;
    r5.w = ps;
    r6.yz = r13.xy * r13.yz + r14.xy;
    r0.x = r13.w * r13.y + 1.0;
    ps = r0.x * r0.w;
    r8.xyz = r12.xyz + r8.xyz;
    r6.x = ps;
    ps = r0.y * r0.x;
    r1.xyz = -r8.xyz + r6.yzw;
    r6.y = ps;
    ps = (-2.0) + r5.w;
    r6.xy = r6.yx * r1.ww;
    r8.w = ps;
    ps = (-0.5) + r6.x;
    r5.w = float((r6.y >= 0.9));
    r0.x = saturate(ps);
    r0.yzw = r11.xyz * r5.www + r10.xyz;
    r6.xyz = r1.xyz * r0.xxx + r8.xyw;
    r6.w = r2.w * 2.0 + r6.z;
    r0.yzw = r0.yzw - r7.xyz;
    r7.xyz = r0.yzw * r0.xxx + r7.xyz;
    r6.xyz = r6.wxy * r3.www;
    ps = 1.0 + r6.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r3.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.w));
    r0.xyz = r4.xyz * r0.xxx;
    r5.w = ps;
    r4.xyz = r6.xyz * r5.www;
    r5.w = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xyz * r5.www;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    ps = LightColor.x * r5.y;
    r5.w = saturate(dot(r3.zxy, r6.zxy));
    r6.x = ps;
    ps = log2(r5.w);
    r1.xyz = r7.xyz * r1.xyz;
    r5.w = ps;
    ps = LightColor.y * r5.z;
    r6.z = r5.w * 15.0;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r0.xyz = r0.xyz * r6.zzz;
    r6.z = ps;
    r5.y = r1.z * r5.w + r0.z;
    r5.xz = r1.xy * r5.ww + r0.xy;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * r2.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
