// ps_9196764d50f535cf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_18.x - r6.w;
    r10.x = ps;
    ps = UniformScalar_22.x;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = 0.05 * ps;
    r5.x = float((UniformScalar_17.x >= 1.0));
    r10.y = ps;
    ps = r0.w - r0.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = r0.z - r0.y;
    r5.y = r4.w - 4e+02;
    r9.y = ps;
    ps = rsqrt(abs(r5.z));
    r10.zw = r9.xy * UniformScalar_6.xx;
    r5.z = ps;
    ps = 0.00022222222 * r5.y;
    r9.xyz = r5.zzz * r3.xyz;
    r5.z = saturate(ps);
    r5.xy = r10.xy * r5.xz;
    ps = -r0.z;
    r10.xy = r9.xy * r5.yy;
    ps = 1.0 + ps;
    r3 = r10.wxzy + r0.ywxz;
    r5.w = ps;
    ps = r3.y;
    r5.z = -r3.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r11.yz = r5.wz * UniformVector_1.yy;
    r11.w = ps;
    ps = UniformVector_1.x * r0.w;
    r5.x = r5.x + r6.w;
    r11.x = ps;
    r12 = r11.wzxy - 0.5;
    r10 = float4((r11.xywz >= 0.5));
    r12 = r12 - r11.wzxy;
    r11 = r12 * r10.zwxy + r11.wzxy;
    r13 = r11 + r11;
    r15 = tex2D(Texture2D_4, r8.xy);
    r12 = tex2D(Texture2D_3, r13.zw);
    r8.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r5.x = -r5.x + r6.z;
    r10.z = dot(r10.zww, float3(1.0, 1.0, 1.0));
    ps = r5.x;
    r10.w = dot(r10.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r10.w == 0.0) ? r12.x : r12.y;
    ps = UniformScalar_19.x;
    r11 = r10.wzzw + float4(-2.0, -3.0, -2.0, -3.0);
    r5.z = ps;
    r5.x = (r11.x == 0.0) ? r12.z : r5.x;
    r11.x = (r11.w == 0.0) ? r12.w : r5.x;
    ps = max(r5.y, r5.z);
    r5.x = max(r11.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_20.x;
    r5.xy = min(r5.yx, float2(1.0, 0.3));
    r5.z = ps;
    r5.x = saturate(r5.x * r5.z);
    ps = 1.0 - r5.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = r0.w + r0.w;
    r8.x = r5.z * r6.w;
    r10.x = ps;
    ps = r0.z + r0.z;
    r5.xz = r8.xw * r15.zw;
    r10.y = ps;
    ps = r8.y + r8.y;
    r5.w = float((r5.x >= 0.05));
    r6.x = ps;
    ps = r8.z + r8.z;
    r5.w = -r5.w + 1.0;
    r6.y = ps;
    r6.z = (UniformScalar_18.x > 0.0) ? r5.w : 1.0;
    r6.z = (UniformScalar_18.x >= 0.0) ? r6.z : r5.w;
    ps = r3.y + r3.y;
    r6.xyz = r6.xyz + float3(-1.0, -1.0, -0.5);
    r8.z = ps;
    ps = r3.w + r3.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r8.w = ps;
    r12.xyz = tex2D(Texture2D_8, r8.zw).xyz;
    r14 = tex2D(Texture2D_3, r13.xy);
    r13.xyz = tex2D(Texture2D_1, r10.xy).xyz;
    r8.y = UniformScalar_1.x * UniformVector_3.x;
    ps = r6.w;
    r13.xyz = r13.xyz + r13.xyz;
    r16.zw = r15.xy * 2.0 - 1.0;
    r5.w = (r10.z == 0.0) ? r14.x : r14.y;
    r5.w = (r11.z == 0.0) ? r14.z : r5.w;
    r16.x = (r11.y == 0.0) ? r14.w : r5.w;
    ps = 15.0 * ps;
    r16.y = r5.y * 3.3333333;
    r19.w = saturate(ps);
    ps = r3.z;
    r5.xw = -r16.xy + 1.0;
    r5.y = ps;
    r6.w = dot(r19.ww, r5.xx) + r16.x;
    ps = UniformVector_5.x * r5.y;
    r13.w = r6.w + r16.x;
    r5.y = ps;
    ps = UniformVector_5.y * r3.x;
    r18 = r13 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r8.x = saturate(r18.w - r5.z);
    r12.w = ps;
    ps = UniformVector_6.y + r5.x;
    r15 = r8.xxxy * r12;
    r8.y = ps;
    r8.x = r15.w * UniformScalar_3.x + r5.y;
    r3.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r14 = tex2D(Texture2D_7, r8.xy);
    r12 = tex2D(Texture2D_6, r0.xy);
    ps = r1.z;
    r20.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.1 + ps;
    r13.xyz = UniformVector_4.xyz * 2e+01;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.w = -r12.w + 1.0;
    r0.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.yzw = r14.xyz * r14.www;
    r3.x = ps;
    r0.xyz = r3.yzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyz = r0.xyz * UniformVector_3.xyz;
    r3.y = ps;
    ps = r3.x;
    r11.yzw = r13.xyz * r11.yzw;
    ps = abs(r7.x) * ps;
    r14 = r11.yyzw * float4(0.3, 1.0, 1.0, 1.0);
    r3.z = ps;
    ps = r3.y;
    r20.xy = -r0.zw + 1.0;
    ps = abs(r7.y) * ps;
    r13.xyz = r14.yzw * r6.www;
    r3.w = ps;
    r5.y = dot(r13.zy, float2(0.11, 0.59)) + 0.0;
    r5.y = dot(r14.yx, r6.ww) + r5.y;
    ps = 1.0 / r4.w;
    r11.y = saturate(r5.y - r13.x);
    r11.w = ps;
    r3.xy = r20.zw * r11.ww + ScreenPositionScaleBias.wz;
    r8.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r17 = tex2D(Texture2D_2, r10.xy);
    r19.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r8.zw).xyz;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r14.xyz = r7.xyw * 2.0 - 1.0;
    r10.xyz = r12.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    ps = rsqrt(abs(r1.w));
    r2.xyz = r19.xyz * r2.www;
    r5.y = ps;
    ps = r4.w;
    r7.xyz = r5.yyy * r1.xyz;
    ps = 0.0001 * ps;
    r19.yz = r20.yy * ModShadowGroupColor.xy;
    r19.x = saturate(ps);
    r1 = -r19.wxyz + 1.0;
    r8.zw = -r0.xy * r11.yy + r0.xy;
    r11.z = r20.x * r11.y + r0.z;
    r0.xw = -r11.xy + 1.0;
    ps = 2.5 * r0.x;
    r11.w = r19.w * r5.w;
    r0.z = ps;
    ps = (-1.0) - -r5.z;
    r10.xyz = r10.xyz * r0.www;
    r15.w = ps;
    ps = -r15.z;
    r5.xzw = r18.zxy - r14.zxy;
    ps = r17.z + ps;
    r4.xy = -r15.xy + r17.xy;
    r5.y = ps;
    r4.xy = r4.xy * r17.ww + r15.xy;
    ps = 0.5 * r6.x;
    r5 = r5.yzwx * r17.wwww;
    r11.x = ps;
    ps = 0.5 * r6.y;
    r4.z = r15.z + r5.x;
    r11.y = ps;
    ps = r5.w;
    r15.xyz = r16.zyw + r11.xwy;
    r5.x = ps;
    r11.xy = r15.xy * r15.yz + r8.zw;
    r0.y = r15.w * r15.y + 1.0;
    ps = r0.y * r0.x;
    r6.xyz = r14.xyz + r5.yzw;
    r5.y = ps;
    ps = r0.z * r0.y;
    r11.xyz = -r6.xyz + r11.xyz;
    r5.z = ps;
    ps = (-2.0) + r5.x;
    r5.yz = r5.zy * r1.xx;
    r6.w = ps;
    ps = (-0.5) + r5.y;
    r5.x = float((r5.z >= 0.9));
    r5.z = saturate(ps);
    r5.xyw = r13.xyz * r5.xxx + r12.xyz;
    r6.xyz = r11.xyz * r5.zzz + r6.xyw;
    r6.w = r7.w * 2.0 + r6.z;
    r5.xyw = r5.xyw - r4.xyz;
    r0.xyz = r5.xyw * r5.zzz + r4.xyz;
    r6.xyw = r6.xyw * r1.yyy;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r5.xyw = (r1.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r1.yyy >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r4.zxy, r4.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r10.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r4.zxy, r9.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r4.xyz * r5.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r7.zxy, r9.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r5.yzw;
    r8.z = ps;
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r4.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r1.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xzy * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    r6.y = r0.z * r5.w + r6.y;
    r6.xz = r0.xy * r5.ww + r6.xz;
    r6.xyz = r2.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
