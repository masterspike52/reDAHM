// ps_d903830b1d272258.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041400 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c17); // float3
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

    r5.w = UniformScalar_17.x * 0.05;
    ps = r4.w;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r6.yz = r0.wz * 3.0;
    r5.y = ps;
    r6.x = r7.w * (-0.8) + r6.z;
    ps = rsqrt(abs(r5.z));
    r5.x = r1.z + 0.1;
    r6.w = ps;
    ps = 0.00022222222 * r5.y;
    r5.z = float((UniformScalar_12.x >= 1.0));
    r12.w = saturate(ps);
    ps = 5.0 * r5.x;
    r13.xyz = r6.www * r3.xyz;
    r12.y = saturate(ps);
    ps = UniformScalar_13.x - r7.w;
    r5.x = r5.w * r12.w;
    r13.w = ps;
    r7.xy = r13.yx * r5.xx + r0.zw;
    r5.x = r13.w * r5.z + r7.w;
    r5.x = -r5.x + r7.z;
    r5.x = max(r5.x, UniformScalar_14.x);
    ps = 1.0 / UniformScalar_15.x;
    r5.y = min(r5.x, 1.0);
    r5.x = ps;
    ps = -r0.z;
    r7.z = saturate(r5.y * r5.x);
    ps = 1.0 + ps;
    r9.zw = -r7.xz + 1.0;
    r9.x = ps;
    r5.yz = r9.xz * UniformVector_1.yy;
    ps = UniformVector_1.x * r7.y;
    r5.x = r0.w * UniformVector_1.x;
    r16.w = ps;
    r3.xyz = r5.zxy - 0.5;
    r11.xyz = float3((r5.xzy >= 0.5));
    ps = r0.w + r0.w;
    r3.xyw = r3.xyz - r5.zxy;
    r3.z = ps;
    r5.xyz = r3.ywx * r11.xzy + r5.xyz;
    ps = r0.z + r0.z;
    r14.yzw = r5.zxy + r5.zxy;
    r3.w = ps;
    r1.w = tex2D(Texture2D_7, r0.xy).w;
    r18 = tex2D(Texture2D_3, r14.zw);
    r16.xyz = tex2D(Texture2D_1, r3.zw).xyz;
    r5 = tex2D(Texture2D_4, r6.yx).wxyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.y = saturate(r4.w * 0.0001);
    r15.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xy = r5.yz + r5.yz;
    r15.z = ps;
    ps = r16.x + r16.x;
    r10.z = dot(r11.xzz, float3(1.0, 1.0, 1.0));
    r17.y = ps;
    r6.w = (r10.z == 0.0) ? r18.x : r18.y;
    ps = r16.y + r16.y;
    r10 = r10.zzxy + float4(-3.0, -2.0, -1.0, -1.0);
    r17.z = ps;
    r6.w = (r10.y == 0.0) ? r18.z : r6.w;
    r12.x = (r10.x == 0.0) ? r18.w : r6.w;
    ps = r16.z + r16.z;
    r6.w = max(r12.x, 0.0);
    r17.w = ps;
    ps = 6.0 * r6.x;
    r6.w = min(r6.w, 0.3);
    r3.y = ps;
    ps = r9.w;
    r12.z = r6.w * 3.3333333;
    ps = r7.w * ps;
    r6.yzw = -r12.xyz + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r10.xy = r6.xy * r5.ww;
    r9.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r9.x = float((r10.x >= 0.05));
    r9.w = ps;
    ps = r15.y;
    r9 = -r9.zwxy + 1.0;
    r11.w = (UniformScalar_13.x > 0.0) ? r9.z : 1.0;
    r11.w = (UniformScalar_13.x >= 0.0) ? r11.w : r9.z;
    ps = abs(r8.x) * ps;
    r17.x = r11.w * r1.w;
    r15.x = ps;
    ps = r15.z;
    r19 = r17 + float4(-0.5, -1.0, -1.0, -1.0);
    ps = abs(r8.y) * ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r19.xxxx)) clip(-1.0);
    r15.y = ps;
    ps = 18.0 * r0.w;
    r5.y = r5.w * (-0.3);
    r3.x = ps;
    r8.zw = tex2D(ModShadowAccumTexture, r15.xy).xy;
    r11.xzw = tex2D(Texture2D_4, r3.xy).xyw;
    r8.xy = r11.xz * 2.0 - 1.0;
    ps = r11.w;
    r8 = r8 * float4(0.5, 0.5, 0.875, 0.875);
    ps = r5.x * ps;
    r15.xz = r10.zw + r8.xy;
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r5.z = r15.x * 0.01;
    r15.w = ps;
    ps = 15.0 * r7.w;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r1.w = saturate(ps);
    r15.y = r1.w * r6.w + r12.z;
    r12.xz = r5.zy * r15.yy + r0.xy;
    r16.xyz = r15.wxy * r15.yyz;
    r12.y = r16.z * 0.025 + r12.z;
    r5.yzw = tex2D(Texture2D_5, r12.xy).xyz;
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = 1.0 / r4.w;
    r11.x = float((r16.w >= 0.5));
    r7.w = ps;
    r3.xy = r10.zw * r7.ww + ScreenPositionScaleBias.wz;
    ps = UniformVector_3.x * r5.y;
    r4.xw = r16.wx + float2(-0.5, 1.0);
    r15.y = ps;
    ps = UniformVector_3.y * r5.z;
    r7.w = r4.x - r16.w;
    r15.z = ps;
    ps = UniformVector_3.z * r5.w;
    r15.x = r7.w * r11.x;
    r15.w = ps;
    ps = r7.x + r7.x;
    r16.xyz = r16.wyz + r15.xyz;
    r5.y = ps;
    ps = r7.y + r7.y;
    r14.x = r16.x + r16.x;
    r5.z = ps;
    r18 = tex2D(Texture2D_2, r3.zw);
    r20.xyz = tex2D(Texture2D_8, r5.zy).xyz;
    r7 = tex2D(Texture2D_3, r14.xy).zwxy;
    r12.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r3.xyw = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r14.xyz = tex2D(Texture2D_0, r5.zy).xyz;
    r5.y = tex2D(Texture2D_6, r0.xy).x;
    ps = UniformVector_5.x * UniformVector_5.w;
    r3.z = float((UniformScalar_9.x >= 1.0));
    r0.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.z = float((UniformScalar_9.x > 1.0));
    r0.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r12.xyz = r0.xyz * r12.xyz;
    r0.y = ps;
    r4.xyz = r12.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r0.x = r11.y * 2.0 + r11.x;
    r5.w = (r0.x == 0.0) ? r7.z : r7.w;
    ps = r4.w;
    r11.xyz = r0.yyy * r1.xyz;
    ps = r6.y * ps;
    r0.yz = r8.zw * r9.xy;
    r7.w = ps;
    r7.z = r10.y * r4.w - r7.w;
    r10 = r0.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r5.w = (r10.y == 0.0) ? r7.x : r5.w;
    r7.x = (r10.x == 0.0) ? r7.y : r5.w;
    ps = 1.0 - r7.x;
    r8.yzw = -ModShadowColor.xyz + 1.0;
    r7.y = ps;
    r7.yz = r1.ww * r7.yz;
    ps = r14.x + r14.x;
    r0.yz = r7.yw + r7.xz;
    r0.x = ps;
    r1.w = saturate(r0.z * 2.5 - 0.5);
    ps = r14.y + r14.y;
    r5.w = r0.y + r7.y;
    r0.y = ps;
    ps = r14.z + r14.z;
    r0.w = r5.w + r7.x;
    r0.z = ps;
    r17 = r0 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = saturate(r17.w - r5.x);
    r0.xyz = r5.xxx * r20.xyz;
    ps = -r0.z;
    r7.xzw = r19.wyz - r17.zxy;
    ps = r18.z + ps;
    r5.xw = -r0.xy + r18.xy;
    r7.y = ps;
    r0.xy = r5.xw * r18.ww + r0.xy;
    r7 = r7.zwyx * r18.wwww;
    ps = abs(r4.w) * abs(r4.w);
    r0.z = r0.z + r7.z;
    r1.z = ps;
    ps = r7.w;
    r7.xyz = r17.xyz + r7.xyw;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r1.xy = r16.yz - r7.xy;
    r0.w = ps;
    r12.xyz = r12.xyz * r6.yyy - r0.xyz;
    ps = -r7.z;
    r9.xyz = r1.xyz * r1.wwz;
    ps = r15.w + ps;
    r7.xy = r7.xy + r9.xy;
    r12.w = ps;
    r12 = r12 * r1.wwww + r0;
    r7.z = r14.z * 2.0 + r12.w;
    r7.xyz = r7.zxy * r9.www;
    ps = 1.0 + r7.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r9.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r9.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = UniformScalar_8.x * r5.y;
    r5.x = dot(r7.zxy, r7.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r12.xyz * r0.xyz;
    r5.x = ps;
    ps = r3.x;
    r12.xyz = r7.xyz * r5.xxx;
    ps = r2.w * ps;
    r5.x = dot(r12.zxy, r13.zxy);
    r7.x = ps;
    ps = r3.y;
    r5.xyw = r12.xyz * r5.xxx;
    r5.xyw = r5.xyw * 2.0 - r13.xyz;
    ps = r2.w * ps;
    r5.x = saturate(dot(r11.zxy, r5.wxy));
    r7.y = ps;
    ps = log2(r5.x);
    r7.z = saturate(dot(r12.zyx, r11.zyx));
    r5.w = ps;
    ps = r10.z * r10.w;
    r5.y = r5.w * UniformScalar_7.x;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r5.w = r5.w * 15.0;
    r7.w = ps;
    ps = r9.z * r9.z;
    r0 = r0 * r7.zzzw;
    r7.z = ps;
    r8.x = (r5.z > 0.0) ? 0.0 : r0.w;
    r5.xyz = r5.xxx * r8.yzw + ModShadowColor.xyz;
    r4.xyz = r3.zzz * r8.xxx + r4.xyz;
    ps = r3.w;
    r3.xyz = r7.zzz * r4.xyz;
    ps = r2.w * ps;
    r1.xyz = r3.xyz * r1.www;
    r7.z = ps;
    ps = pow(2.0, r5.w);
    r6.xyz = r1.xzy * r6.yyy;
    r5.w = ps;
    r6.y = r6.y * r5.w + r0.z;
    r6.xz = r6.xz * r5.ww + r0.xy;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
