// ps_f045f9e0415041ed.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 540 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000870 10041600 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.y = float((UniformScalar_7.x >= 1.0));
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r0.w * UniformVector_1.x;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = -r0.z + 1.0;
    r5.w = ps;
    ps = UniformVector_1.y * r5.x;
    r12 = r0.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r5.x = ps;
    r6.xy = r7.ww * float2(0.16, -0.8) + r12.xy;
    ps = (-0.5) + r5.y;
    r5.zw = r5.zw * abs(r8.xy);
    r6.z = ps;
    ps = (-0.5) + r5.x;
    r10.zw = float2((r5.xy >= 0.5));
    r6.w = ps;
    ps = 6.0 * r6.x;
    r15.yz = r6.zw - r5.yx;
    r6.z = ps;
    ps = UniformScalar_8.x - r7.w;
    r7.xy = saturate(UniformVector_2.xy);
    r15.x = ps;
    r5.xy = r15.yz * r10.wz + r5.yx;
    ps = 6.0 * r6.y;
    r5.xy = r5.xy + r5.xy;
    r6.w = ps;
    r8 = tex2D(Texture2D_4, r5.xy).wxyz;
    r13.yzw = tex2D(Texture2D_3, r6.zw).xyw;
    r5.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r11 = tex2D(Texture2D_3, r6.xy);
    ps = 15.0 * r7.w;
    r10.x = saturate(r4.w * 0.0001);
    r18.z = saturate(ps);
    ps = UniformScalar_13.x;
    r6.y = r1.z + 0.1;
    ps = 0.05 * ps;
    r6.z = r4.w - 4e+02;
    r6.x = ps;
    ps = r11.z;
    r5.w = r11.z * r7.w;
    r5.z = ps;
    r9.xy = r11.yx * 2.0 - 1.0;
    ps = (-0.3) * r5.z;
    r14.xy = saturate(r6.yz * float2(5.0, 0.00022222222));
    r2.x = ps;
    ps = r13.y + r13.y;
    r5.z = r6.x * r14.y;
    r6.y = ps;
    ps = r13.z + r13.z;
    r6.x = dot(r10.wzz, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r2.w = (r6.x == 0.0) ? r8.y : r8.z;
    r2.y = r15.x * r10.y + r7.w;
    ps = 0.875 * r5.x;
    r6 = r6.zxxy + float4(-1.0, -3.0, -2.0, -1.0);
    r2.z = ps;
    ps = r6.w;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    r3.w = (r6.z == 0.0) ? r8.w : r2.w;
    ps = 0.5 * r5.x;
    r2.w = -r2.y + r7.z;
    r2.y = ps;
    ps = 0.5 * r6.x;
    r8.y = max(r2.w, UniformScalar_9.x);
    r2.w = ps;
    r8.x = (r6.y == 0.0) ? r8.x : r3.w;
    r9.zw = r11.xy * 2.0 + r2.yw;
    ps = 0.875 * r5.y;
    r9 = r9 + r2.wyyw;
    r2.w = ps;
    ps = r9.y;
    r8.z = max(r8.x, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_0.x;
    r6.xz = min(r8.zy, float2(0.3, 1.0));
    r5.y = ps;
    ps = 0.01 * r5.x;
    r5.y = saturate(r6.z * r5.y);
    r5.x = ps;
    ps = rsqrt(abs(r1.w));
    r5.y = -r5.y + 1.0;
    r6.y = ps;
    ps = r5.y;
    r8.yzw = r6.xyy * float3(3.3333333, -0.125, 1.0);
    ps = r7.w * ps;
    r6.zw = -r8.xy + 1.0;
    r13.x = ps;
    r10.w = r18.z * r6.w + r8.y;
    ps = r5.w;
    r16.xy = r13.xw * r11.zw;
    ps = r5.y * ps;
    r2.y = r16.y - 1.0;
    r16.z = ps;
    ps = r9.y;
    r6.x = r10.w * r9.x;
    ps = r10.w * ps;
    r13.w = r5.x * r10.w;
    r6.y = ps;
    ps = r13.w;
    r14.zw = float2((r16.xz >= 0.05));
    ps = r0.x + ps;
    r20.xzw = -r14.zwx + 1.0;
    r17.x = ps;
    ps = r6.z;
    r10.yz = r20.ww * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 2.5 * r5.x;
    r10.xyz = -r10.xyz + 1.0;
    r1.w = ps;
    ps = 0.025 * r6.x;
    r2 = r2.zwxy * r10.yzww;
    r5.x = ps;
    ps = r5.x;
    r8 = r8.wwwz * r3.xyzx;
    ps = r2.z + ps;
    r5.y = r2.z + r0.y;
    r13.z = ps;
    ps = r5.y;
    r13.xy = r8.xy * r5.zz;
    ps = r5.x + ps;
    r3 = r13.zwxy + r0.yxwz;
    r17.y = ps;
    r5.y = tex2D(Texture2D_5, r3.yx).w;
    r5.zw = tex2D(Texture2D_6, r12.zw).xy;
    r22 = tex2D(Texture2D_5, r17.xy);
    r12.x = -r7.z + 1.0;
    ps = r22.w;
    r7.xy = r7.yx * UniformScalar_4.xx;
    r5.x = ps;
    ps = 1.0 / UniformScalar_4.x;
    r7.yz = floor(-r7.xy);
    r7.x = ps;
    ps = (-0.5) + r5.x;
    r7.xy = -r7.yz * r7.xx;
    r5.x = ps;
    ps = r5.z + r5.z;
    r12.yz = r7.xy + UniformScalar_5.xx;
    r5.z = ps;
    ps = r5.w + r5.w;
    r12 = r12.xxyz - r7.xyxy;
    r5.w = ps;
    ps = 1.0 / r12.z;
    r5.yzw = r5.yzw + float3(-0.5, -1.0, -1.0);
    r7.x = ps;
    ps = 1.0 / r12.w;
    r18.xy = saturate(r5.xy * 3.3333333);
    r7.y = ps;
    r3.xy = saturate(r12.yx * r7.yx);
    r7.xy = r9.zw - 2.0;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r15.yzw = r2.xyw + float3(0.125, 0.125, 1.0);
    r9.w = ps;
    ps = abs(r15.w) * abs(r15.w);
    r5.y = r3.z * UniformVector_1.x;
    r15.x = ps;
    ps = r3.w;
    r12.zw = r7.xy + r11.xy;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r7.xz = r15.xy * r15.xz;
    r5.x = ps;
    ps = r7.x * r7.x;
    r5.x = r5.x * UniformVector_1.y;
    r18.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r2.xyz = -r18.xyz + 1.0;
    r11.w = ps;
    ps = (-0.5) + r5.y;
    r7.yw = float2((r5.xy >= 0.5));
    r9.x = ps;
    ps = (-0.5) + r5.x;
    r12.x = dot(r7.wyy, float3(1.0, 1.0, 1.0));
    r9.y = ps;
    r12.y = r3.y * r2.x + r18.x;
    ps = r3.z + r3.z;
    r9.yz = r9.xy - r5.yx;
    r9.x = ps;
    r7.xy = r9.zy * r7.yw + r5.xy;
    ps = r3.w + r3.w;
    r14.xzw = r12.yzw + r11.zxy;
    r9.y = ps;
    ps = 1.0 / r4.w;
    r20.y = float((r14.x >= 0.5));
    r12.w = ps;
    r3.zw = (-abs(r11.ww) >= 0.0) ? 1.0 : r20.xy;
    r12.yz = (-abs(r9.ww) >= 0.0) ? r20.zy : r3.zw;
    ps = r7.y + r7.y;
    r11.xyz = r12.xxy + float3(-3.0, -2.0, -0.5);
    r7.y = ps;
    ps = r7.x + r7.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r11.zzzz)) clip(-1.0);
    r7.w = ps;
    r13 = tex2D(Texture2D_4, r7.yw);
    r17.xyz = tex2D(Texture2D_7, r17.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r14.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = r7.x + r7.x;
    r19.yzw = r17.xyz + r17.xyz;
    r3.y = ps;
    r17.x = saturate(r1.w * r15.w - 0.5);
    r3.xz = r3.xx * r2.xy + r18.xy;
    r1.w = (r12.x == 0.0) ? r13.x : r13.y;
    ps = r7.y + r7.y;
    r3.xw = -r3.xz + 1.0;
    r3.z = ps;
    ps = r7.w + r7.w;
    r4 = r14.zwzw * r3.wwxx;
    r3.w = ps;
    r4.xy = (-abs(r11.ww) >= 0.0) ? 0.0 : r4.xy;
    r4.xz = (-abs(r9.ww) >= 0.0) ? r4.zw : r4.xy;
    r1.w = (r11.y == 0.0) ? r13.z : r1.w;
    r3.x = (r11.x == 0.0) ? r13.w : r1.w;
    ps = r0.z;
    r15 = r3 - 1.0;
    r4.y = ps;
    ps = 0.036 * r5.z;
    r19.x = r15.x * r2.z;
    r11.x = ps;
    ps = 0.036 * r5.w;
    r2 = r19 + float4(2.25, -1.0, -1.0, -1.0);
    r11.y = ps;
    r17.yz = r2.yz * UniformVector_4.xy - r11.xy;
    r17.w = r2.w * UniformVector_4.z - 1.0;
    ps = r0.w + r0.w;
    r3 = r18.xxxx * r17;
    r5.x = ps;
    ps = r0.z + r0.z;
    r5.zw = r11.xy + r3.yz;
    r5.y = ps;
    ps = r8.w;
    r5.zw = r5.zw + r6.yx;
    ps = r0.w + ps;
    r14.zw = r5.zw + r4.xz;
    r4.x = ps;
    r5.zw = r14.xy * r12.ww + ScreenPositionScaleBias.wz;
    r0.xyz = tex2D(Texture2D_8, r4.xy).xyz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r9.xyz = tex2D(Texture2D_9, r9.xy).xyz;
    r13 = tex2D(Texture2D_2, r5.xy);
    r5.yzw = tex2D(Texture2D_1, r5.xy).xyz;
    r1.w = dot(r1.zxy, r1.zxy);
    r11.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = r22.w;
    r21.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r0.w = r22.w * UniformScalar_10.x;
    r5.x = ps;
    ps = r5.y + r5.y;
    r11.xyz = r11.xyz * r22.xyz;
    r5.y = ps;
    ps = r5.z + r5.z;
    r11.xyz = r11.xyz * r22.www;
    r5.z = ps;
    r22.xyz = r5.xxx * UniformVector_5.xzy + r0.www;
    r2.yzw = r11.xyz * UniformScalar_11.xxx + r22.xzy;
    r7.xyz = r7.zzz * r21.xyz + ModShadowColor.xyz;
    r5.x = (abs(r11.w) > 0.0) ? r20.y : 1.0;
    r9.w = (abs(r9.w) > 0.0) ? r5.x : r20.y;
    ps = r5.w + r5.w;
    r0.w = r2.x + r19.x;
    r5.w = ps;
    ps = -r17.x;
    r5.x = r3.w * r12.z;
    ps = r3.x + ps;
    r5 = r5.yzwx + float4(-1.0, -1.0, -1.0, 1.0);
    r2.x = ps;
    ps = r0.w;
    r2 = r18.zwww * r2.xywz;
    ps = -r16.y + ps;
    r3.yzw = r2.ywz * r6.zzz;
    r3.x = saturate(ps);
    ps = r17.x;
    r16.xyz = r5.xyz - r15.yzw;
    r0.w = r16.z * r13.w - 2.0;
    r5.xyz = r16.xyz * r13.www + r15.yzw;
    r2.yz = r14.zw * r12.zz - r5.xy;
    ps = r2.x + ps;
    r12 = r3.xxxy * r9;
    r11.w = ps;
    ps = rsqrt(abs(r1.w));
    r2.x = r12.w * r11.w;
    r1.w = ps;
    r1.xyz = r1.www * r1.xyz;
    r11.xyz = r11.xyz - r0.xyz;
    r9 = r11 * r9.wwww;
    r5.xy = r2.yz * r11.ww + r5.xy;
    ps = r5.w;
    r2.yzw = r9.xyz + r0.xyz;
    ps = -r5.z + ps;
    r0.xyz = -r12.xyz + r13.xyz;
    r12.w = ps;
    r0.xyz = r0.xyz * r13.www + r12.xyz;
    r12.xyz = r6.zzz * r2.yzw - r0.xyz;
    r0 = r12 * r11.wwww + r0;
    r5.z = r7.w * 2.0 + r0.w;
    r5.xyz = r5.zxy * r10.xxx;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r10.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.yz = r9.ww * r3.zw;
    r5.x = ps;
    r3.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r3.zxy, r8.zxy);
    r5.xyz = r3.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r1.zxy, r5.zxy));
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r6.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r6.xyz = r4.xyz * LightColor.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zxy, r1.zxy));
    r5.x = ps;
    r5.xyz = r2.xzy * r5.xxx;
    r5.y = r0.z * r5.w + r5.y;
    r5.xz = r0.xy * r5.ww + r5.xz;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
