// ps_abb4c9843874630e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 450 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000708 10041400 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r9.x = r0.w * UniformVector_1.x;
    r15.z = ps;
    ps = r0.z + r0.z;
    r5.z = UniformScalar_17.x * 0.05;
    r15.w = ps;
    ps = r1.z;
    r5.y = r4.w - 4e+02;
    ps = 0.1 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.yz = r0.wz * 3.0;
    r5.w = ps;
    r6.x = r7.w * (-0.8) + r6.z;
    ps = 5.0 * r5.x;
    r18.w = float((UniformScalar_12.x >= 1.0));
    r3.w = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r14.xyz = r5.www * r3.xyz;
    r3.z = saturate(ps);
    ps = -r0.z;
    r5.x = r5.z * r3.z;
    r3.xy = r14.yx * r5.xx + r0.zw;
    ps = 1.0 + ps;
    r5.yz = -r3.xw + 1.0;
    r5.x = ps;
    ps = r0.w;
    r9.yz = r5.xy * UniformVector_1.yy;
    ps = 18.0 * ps;
    r5.xyw = r9.zxy - 0.5;
    r10.y = ps;
    ps = -r7.w;
    r18.xyz = float3((r9.zxy >= 0.5));
    ps = UniformScalar_13.x + ps;
    r16.xyz = r5.xyw - r9.zxy;
    r16.w = ps;
    r5.xyw = r16.yzx * r18.yzx + r9.xyz;
    ps = 6.0 * r6.x;
    r19.yzw = r5.wxy + r5.wxy;
    r10.z = ps;
    r10.x = tex2D(Texture2D_7, r0.xy).w;
    r9 = tex2D(Texture2D_3, r19.zw);
    r5.xyw = tex2D(Texture2D_1, r15.zw).xyz;
    r12.xyw = tex2D(Texture2D_4, r10.yz).xyw;
    r6 = tex2D(Texture2D_4, r6.yx);
    ps = 15.0 * r7.w;
    r12.z = saturate(r4.w * 0.0001);
    r1.w = saturate(ps);
    r13.zw = r6.xy * 2.0 - 1.0;
    ps = r12.x + r12.x;
    r10.yzw = r5.xyw + r5.xyw;
    r11.y = ps;
    ps = r12.y + r12.y;
    r11.x = dot(r18.yzz, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    r5.x = (r11.x == 0.0) ? r9.x : r9.y;
    r5.w = r16.w * r18.w + r7.w;
    ps = r6.z;
    r11 = r11.xxyz + float4(-2.0, -3.0, -1.0, -1.0);
    r5.y = ps;
    r5.x = (r11.x == 0.0) ? r9.z : r5.x;
    ps = (-0.3) * r5.y;
    r5.w = -r5.w + r7.z;
    r11.x = ps;
    ps = r12.w;
    r5.w = max(r5.w, UniformScalar_14.x);
    r13.x = (r11.y == 0.0) ? r9.w : r5.x;
    ps = r6.w * ps;
    r5.y = max(r13.x, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_15.x;
    r5.yw = min(r5.yw, float2(0.3, 1.0));
    r9.x = ps;
    ps = UniformVector_1.x * r3.y;
    r9.x = saturate(r5.w * r9.x);
    r20.w = ps;
    ps = 3.3333333 * r5.y;
    r9.x = -r9.x + 1.0;
    r13.y = ps;
    ps = r9.x;
    r9.w = float((r20.w >= 0.5));
    ps = r7.w * ps;
    r9.yz = -r13.xy + 1.0;
    r9.x = ps;
    ps = r1.w;
    r6.xy = r11.zw * 0.5;
    ps = r9.z * ps;
    r15.xy = r9.xy * r6.zz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.xyz = r13.zyw + r6.xzy;
    r12.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r12.w = float((r15.x >= 0.05));
    r12.y = ps;
    ps = (-1.0) - -r5.x;
    r12 = -r12.wxyz + 1.0;
    r6.w = ps;
    ps = 0.01 * r6.x;
    r17.xyz = r6.wxy * r6.yyz;
    r11.y = ps;
    r7.x = (UniformScalar_13.x > 0.0) ? r12.x : 1.0;
    r5.yw = r11.yx * r6.yy + r0.xy;
    r5.z = r17.z * 0.025 + r5.w;
    r6.x = (UniformScalar_13.x >= 0.0) ? r7.x : r12.x;
    r10.x = r6.x * r10.x;
    r16 = r10 + float4(-0.5, -1.0, -1.0, -1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.xxxx)) clip(-1.0);
    r6.xyz = tex2D(Texture2D_7, r5.yz).xyz;
    r10.xyz = tex2D(Texture2D_5, r5.yz).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r20.xyz = r10.xyz + r10.xyz;
    r5.z = ps;
    ps = r5.y;
    r13.xyz = r7.xyz * r6.xyz;
    ps = abs(r8.x) * ps;
    r11 = r20 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.x = ps;
    ps = r5.z;
    r13.w = r11.w - r20.w;
    ps = abs(r8.y) * ps;
    r10 = r13 * r9.yyyw;
    r6.y = ps;
    ps = r3.x + r3.x;
    r5.z = r20.w + r10.w;
    r5.y = ps;
    ps = r3.y + r3.y;
    r19.x = r5.z + r5.z;
    r5.z = ps;
    r0.z = tex2D(Texture2D_6, r0.xy).x;
    r8 = tex2D(Texture2D_2, r15.zw).xywz;
    r3.xyw = tex2D(Texture2D_8, r5.zy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7 = tex2D(Texture2D_3, r19.xy).wyzx;
    r5.yzw = tex2D(Texture2D_0, r5.zy).xyz;
    r17.w = r18.x * 2.0 + r9.w;
    r6.z = (r17.w == 0.0) ? r7.w : r7.y;
    r0.yw = r11.xy * UniformVector_3.xy + r17.yz;
    r11.xyw = r17.xww + float3(1.0, -3.0, -2.0);
    r6.z = (r11.w == 0.0) ? r7.z : r6.z;
    r7.w = r11.x * r9.y;
    r6.w = r15.y * r11.x - r7.w;
    r7.x = (r11.y == 0.0) ? r7.x : r6.z;
    ps = 1.0 - r7.x;
    r0.x = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    r7.yz = r1.ww * r6.zw;
    ps = r5.y + r5.y;
    r6.zw = r7.yw + r7.xz;
    r15.y = ps;
    ps = r5.z + r5.z;
    r1.w = r6.z + r7.y;
    r15.z = ps;
    ps = r5.w + r5.w;
    r15.x = r1.w + r7.x;
    r15.w = ps;
    ps = abs(r11.x) * abs(r11.x);
    r15 = r15 + float4(0.25, -1.0, -1.0, -1.0);
    r3.z = ps;
    ps = r6.x;
    r5.x = saturate(r15.x - r5.x);
    r5.y = ps;
    ps = 0.875 * r5.y;
    r3.xyw = r5.xxx * r3.xyw;
    r6.x = ps;
    ps = -r3.w;
    r7.xzw = r16.wyz - r15.wyz;
    ps = r8.w + ps;
    r16.xy = -r3.xy + r8.xy;
    r7.y = ps;
    r8.xy = r16.xy * r8.zz + r3.xy;
    ps = 0.875 * r6.y;
    r7 = r7.zwyx * r8.zzzz;
    r6.y = ps;
    ps = 2.5 * r6.w;
    r8.z = r3.w + r7.z;
    r6.z = ps;
    ps = r7.w;
    r7.xyz = r15.yzw + r7.xyw;
    r5.x = ps;
    r10.w = r11.z * UniformVector_3.z - r7.z;
    ps = (-2.0) + r5.x;
    r3.xy = r0.yw - r7.xy;
    r8.w = ps;
    ps = (-0.5) + r6.z;
    r10.xyz = -r8.xyz + r10.xyz;
    r3.w = saturate(ps);
    r5.xyz = r3.xyz * r3.wwz;
    r7.xy = r7.xy + r5.xy;
    r11 = r10 * r3.wwww + r8;
    r7.z = r5.w * 2.0 + r11.w;
    r7.xyz = r7.zxy * r12.www;
    ps = 1.0 + r7.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.w = ps;
    r7.xyz = (r12.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r12.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r0.x));
    r5.w = dot(r7.zxy, r7.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r8.xyz = r6.www * r1.xyz;
    r5.w = ps;
    r10.xyz = r7.xyz * r5.www;
    r5.w = dot(r10.zxy, r14.zxy);
    r7.xyz = r10.xyz * r5.www;
    r7.xyz = r7.xyz * 2.0 - r14.xyz;
    r5.w = saturate(dot(r8.zxy, r7.zxy));
    ps = log2(r5.w);
    r0.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / r4.w;
    r5.w = r5.y * UniformScalar_7.x;
    r7.x = ps;
    ps = pow(2.0, r5.w);
    r0.z = r0.z * UniformScalar_8.x;
    r7.y = ps;
    r7.xyw = r0.xyz * r7.xxy;
    r0.xy = r7.xy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 - r5.x;
    r1.x = float((UniformScalar_9.x >= 1.0));
    r6.w = saturate(ps);
    r2.xyz = r13.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = log2(r6.w);
    r5.w = float((UniformScalar_9.x > 1.0));
    r5.x = ps;
    r1.yz = r6.xy * r12.yz + 0.125;
    r0.xyz = r11.xyz * r0.xyz;
    r6.w = saturate(dot(r10.zyx, r8.zyx));
    r1.w = (r5.w > 0.0) ? 0.0 : r7.w;
    r1.xy = r1.xy * r1.wz;
    r6.xyz = r1.yyy * r4.xyz + ModShadowColor.xyz;
    ps = r5.z * r5.z;
    r1.xyz = r2.xyz + r1.xxx;
    r5.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xyz = r5.zzz * r1.xyz;
    r5.x = ps;
    ps = 15.0 * r5.y;
    r1.xyz = r1.xyz * r3.www;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r1.xyz = r1.xyz * r9.yyy;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.ww + r5.yz;
    r5.w = r0.z * r6.w + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
