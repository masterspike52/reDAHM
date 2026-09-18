// ps_9e3146c42ed1627b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r14.w;
    r5.zw = r0.xy * UniformScalar_0.xx;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r15.y = ps;
    r8.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = -r0.z;
    r10.xy = r0.wz * 6.0;
    ps = 1.0 + ps;
    r5.y = r1.z + 0.1;
    r6.y = ps;
    ps = r4.w;
    r10.zw = r0.wz * UniformVector_6.xy;
    ps = (-4e+02) + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r9.xy = r4.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r9.xy = r9.xy * r6.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r15.zw = r8.xy + r8.xy;
    r6.x = ps;
    ps = 0.00022222222 * r5.x;
    r9.zw = r0.wz * UniformVector_1.xy;
    r6.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r6.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.x = r6.w * (-0.025);
    r6.z = ps;
    r5.xy = r8.xy * r5.xx + r9.zw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r5.y * r6.z;
    r3.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xz = -r6.zx + 1.0;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = r6.wxy * UniformVector_2.xyy;
    r3.y = ps;
    ps = r11.x;
    r12.xy = r3.xy * abs(r7.xy);
    ps = r5.x * ps;
    r7.xy = r11.yz - 0.5;
    r15.x = ps;
    ps = r7.x;
    r20.xy = float2((r11.yz >= 0.5));
    ps = -r11.y + ps;
    r3 = r15.xzwy + float4(-0.5, -1.0, -1.0, -0.5);
    r13.x = ps;
    ps = r7.y;
    r20.zw = float2((r15.xy >= 0.5));
    ps = -r11.z + ps;
    r13.zw = r3.xw - r15.xy;
    r13.y = ps;
    r7.xz = r13.zw * r20.zw + r15.xy;
    r7.yw = r13.xy * r20.xy + r11.yz;
    r7 = r7 + r7;
    r11.xyz = tex2D(LightAttenuationTexture, r9.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r19 = tex2D(Texture2D_1, r7.zw);
    r21 = tex2D(Texture2D_1, r7.xy);
    r7.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r12.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r17.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r10.yzw = tex2D(Texture2D_2, r10.xy).xyw;
    r5.xzw = tex2D(Texture2D_3, r5.zw).wxy;
    ps = r4.w;
    r0.z = dot(r1.zxy, r1.zxy);
    ps = 0.0001 * ps;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r3.x = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r0.x = float((UniformScalar_5.x >= 1.0));
    r15.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r1.w = float((UniformScalar_5.x > 1.0));
    r15.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.y = dot(r2.zxy, r2.zxy);
    r15.z = ps;
    ps = (-1.0) + r5.x;
    r18.zw = r5.zw + r5.zw;
    r10.x = ps;
    r4.xy = r10.yz * 2.0 - 1.0;
    r17.xyz = r17.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.y;
    r0.y = r10.w * r8.w;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r10.yzw = r12.zxy + float3(-1.0, 0.0, 0.0);
    r0.w = ps;
    r5.yzw = (-abs(r1.www) >= 0.0) ? r7.xyz : 1.0;
    r7.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r5.yzw;
    ps = log2(r5.x);
    r4.w = r0.y - 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.yzw = r10.zwy + r12.xyz;
    r0.x = ps;
    r10.w = r17.z * UniformVector_4.z - r5.w;
    ps = (-1.0) + r5.y;
    r22.xyz = r0.www * -SpotDirection.xyz;
    r10.y = ps;
    ps = (-1.0) + r5.z;
    r5.y = dot(r22.zxy, r2.zxy);
    r10.z = ps;
    r4.xz = r4.xy * 0.5 + r3.yz;
    r3.yz = r20.xy * 2.0 + r20.zw;
    r5.z = (r3.y == 0.0) ? r21.x : r21.y;
    r0.w = (r3.z == 0.0) ? r19.x : r19.y;
    ps = -SpotAngles.x - -r5.y;
    r20 = r3.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r5.x = ps;
    r5.y = (r20.z == 0.0) ? r19.z : r0.w;
    r5.z = (r20.y == 0.0) ? r21.z : r5.z;
    r13.w = (r20.x == 0.0) ? r21.w : r5.z;
    r3.w = (r20.w == 0.0) ? r19.w : r5.y;
    ps = ModShadowGroupColor.x * r6.z;
    r5.y = max(r3.w, 0.0);
    r3.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r13.x = min(r5.y, 0.3);
    r3.z = ps;
    ps = SpotAngles.y * r5.x;
    r3 = -r3.wyxz + 1.0;
    r5.z = saturate(ps);
    ps = r3.x;
    r6.xyz = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r18.xy = r6.yz * r3.yw;
    r4.y = ps;
    ps = r3.z;
    r13.xyz = r6.xxx * r4.xzw;
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r4.zw = r13.zw + float2(1.0, 0.25);
    r0.w = ps;
    ps = abs(r4.z) * abs(r4.z);
    r6 = r18.xywz + float4(0.125, 0.125, -1.0, -1.0);
    r4.x = ps;
    r5.xy = r0.ww * r6.wz + r17.xy;
    ps = r6.x * r6.y;
    r6.w = r4.w + r13.w;
    r6.x = ps;
    r6.xyz = r6.xxx * r16.xyz + ModShadowColor.xyz;
    ps = r6.w;
    r14.xyz = r15.xyz * r14.xyz;
    r13.xy = r5.xy * UniformVector_4.xy + r13.xy;
    ps = -r0.y + ps;
    r5.xy = r4.xy * r4.xz;
    r7.w = saturate(ps);
    ps = (-0.5) + r5.y;
    r7.xyz = r14.xyz * r7.xyz;
    r1.w = saturate(ps);
    ps = r5.z * r5.z;
    r10.yz = r13.xy - r10.yz;
    r6.w = ps;
    r5.w = r10.w * r1.w + r5.w;
    r10.yz = r10.yz * r1.ww - 1.0;
    r10.yz = r12.xy * 2.0 + r10.yz;
    r10.w = r5.w * TwoSidedSign.x - TwoSidedSign.x;
    ps = r5.x * r5.x;
    r10 = r10 * r3.zzzz;
    r0.y = ps;
    ps = r10.w;
    r9.xyz = r7.www * r9.xyz;
    r5.y = ps;
    ps = TwoSidedSign.x + r5.y;
    r5.x = r10.x + 1.0;
    r5.y = ps;
    r5.zw = (r3.zz > 0.0) ? r10.yz : 0.0;
    r3.xy = (r3.zz >= 0.0) ? r5.zw : 0.0;
    r5.x = (r0.w > 0.0) ? r5.x : 1.0;
    r5.y = (r3.z > 0.0) ? r5.y : TwoSidedSign.x;
    r3.z = (r3.z >= 0.0) ? r5.y : TwoSidedSign.x;
    r5.x = (r0.w >= 0.0) ? r5.x : 1.0;
    ps = rsqrt(abs(r0.z));
    r5.yzw = r7.xyz * r5.xxx;
    r5.x = ps;
    r10.xyz = r5.yzw * r4.zzz - r9.xyz;
    r5.yzw = r5.yzw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = pow(2.0, r0.x);
    r4.xyz = r0.yyy * r5.yzw;
    r0.x = ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.yzw = r11.xyz * r2.www;
    r5.yzw = r5.xxx * r1.xyz;
    r5.x = dot(r3.zxy, r3.zxy);
    r1.xyz = r10.xyz * r1.www + r9.xyz;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r7.xyz;
    r5.x = ps;
    r2.xyz = r3.xyz * r5.xxx;
    r3.xyz = r2.xyz * TwoSidedSign.xxx;
    r5.x = dot(r3.zxy, r8.zxy);
    r2.xyz = r3.xzy * r5.xxx;
    r2.xyz = r2.xyz * 2.0 - r8.xzy;
    r5.x = saturate(dot(r5.wyz, r2.yxz));
    ps = log2(r5.x);
    r2.xyz = r4.xyz * r1.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r0.xyz = r0.ywz * r0.xxx;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zxy, r5.wyz));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
