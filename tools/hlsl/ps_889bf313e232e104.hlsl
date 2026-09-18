// ps_889bf313e232e104.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r15.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r8.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r9.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r6.y = -r0.z + 1.0;
    ps = UniformVector_2.x * ps;
    r5.x = r4.w - 4e+02;
    r14.y = ps;
    ps = r1.z;
    r12.xy = r0.xy * UniformScalar_0.xx;
    ps = 0.1 + ps;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = 5.0 * r5.z;
    r6.xz = r0.wz * UniformVector_1.xy;
    r5.y = saturate(ps);
    ps = 0.00022222222 * r5.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r11.x = saturate(ps);
    r11.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r14.zw = r8.xy + r8.xy;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.xxx * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r13.xyz = r11.yzx * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    r10.xy = r8.xy * r13.zz + r6.xz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xzw = r10.zyw * r5.zxz;
    r11.x = ps;
    ps = ScreenPositionScaleBias.w + r5.x;
    r12.zw = r0.wz * UniformVector_6.xy;
    r3.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xz = -r5.zy + 1.0;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.yzw = r6.wxy * UniformVector_2.xyy;
    r11.y = ps;
    ps = r3.y;
    r6.xy = r11.xy * abs(r7.xy);
    ps = r10.x * ps;
    r7.xy = r3.zw - 0.5;
    r14.x = ps;
    ps = r7.x;
    r20.xy = float2((r3.zw >= 0.5));
    ps = -r3.z + ps;
    r16 = r14.zwxy + float4(-1.0, -1.0, -0.5, -0.5);
    r11.x = ps;
    ps = r7.y;
    r20.zw = float2((r14.xy >= 0.5));
    ps = -r3.w + ps;
    r11.zw = r16.zw - r14.xy;
    r11.y = ps;
    r7.xz = r11.zw * r20.zw + r14.xy;
    r7.yw = r11.xy * r20.xy + r3.zw;
    ps = ScreenPositionScaleBias.z + r5.w;
    r14 = r7 + r7;
    r3.y = ps;
    r11.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r3.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r18.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7 = tex2D(Texture2D_1, r14.zw);
    r17 = tex2D(Texture2D_1, r14.xy);
    r0.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r6.xyw = tex2D(Texture2D_3, r12.xy).wxy;
    ps = r4.w;
    r5.z = float((UniformScalar_5.x >= 1.0));
    ps = 0.0001 * ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r19.x = saturate(ps);
    ps = 1.0 - r5.x;
    r16.zw = r6.yw + r6.yw;
    r5.y = saturate(ps);
    ps = r9.w;
    r5.w = float((UniformScalar_5.x > 1.0));
    ps = r8.w * ps;
    r4.xyz = r10.zxy + float3(-1.0, 0.0, 0.0);
    r5.x = ps;
    r9.xyz = (-abs(r5.www) >= 0.0) ? r9.xyz : 1.0;
    r14.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r9.xyz;
    ps = log2(r5.y);
    r12.xyz = r4.yzx + r10.xyz;
    r5.z = ps;
    ps = (-1.0) - -r5.x;
    r9.xy = r12.xy - 1.0;
    r13.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r0.yzw = r0.xyz + r0.xyz;
    r19.y = ps;
    r4.xy = r20.xy * 2.0 + r20.zw;
    r5.w = (r4.x == 0.0) ? r17.x : r17.y;
    r5.y = (r4.y == 0.0) ? r7.x : r7.y;
    ps = ModShadowGroupColor.y * r6.z;
    r4 = r4.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r19.z = ps;
    r5.y = (r4.z == 0.0) ? r7.z : r5.y;
    r5.w = (r4.y == 0.0) ? r17.z : r5.w;
    r0.x = (r4.x == 0.0) ? r17.w : r5.w;
    r19.w = (r4.w == 0.0) ? r7.w : r5.y;
    ps = -r19.w;
    r17 = r0 + float4(0.25, -1.0, -1.0, -1.0);
    r9.w = r17.w * UniformVector_4.z - r12.z;
    ps = 1.0 + ps;
    r5.y = r17.x + r0.x;
    r7.x = ps;
    ps = -r19.x;
    r4.w = saturate(r5.y - r5.x);
    ps = 1.0 + ps;
    r1.w = dot(r1.zxy, r1.zxy);
    r7.y = ps;
    ps = -r19.y;
    r5.xyw = UniformVector_5.xyz * UniformVector_5.www;
    ps = 1.0 + ps;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    ps = -r19.z;
    r15.xyz = r5.xyw * r15.xyz;
    ps = 1.0 + ps;
    r13.xy = r16.xy + r13.xy;
    r7.w = ps;
    ps = r7.x;
    r5.y = max(r19.w, 0.0);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r18.z = min(r5.y, 0.3);
    r4.y = ps;
    ps = r7.y;
    r12.xyw = r18.xyz * float3(0.875, 0.875, 3.3333333);
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r16.xy = r12.xy * r7.zw;
    r3.w = ps;
    r4.z = r12.w * r13.z + 1.0;
    ps = abs(r4.z) * abs(r4.z);
    r16 = r16 + float4(0.125, 0.125, -1.0, -1.0);
    r6.z = ps;
    r5.xy = r3.ww * r16.zw + r17.yz;
    ps = r6.z * r6.z;
    r5.w = r16.x * r16.y;
    r4.x = ps;
    r0.xyz = r5.www * r0.xyz + ModShadowColor.xyz;
    r9.yz = r5.xy * UniformVector_4.xy - r9.xy;
    ps = (-1.0) + r6.x;
    r5.xy = r4.xy * r4.xz;
    r9.x = ps;
    ps = (-0.5) + r5.y;
    r6.xyz = r15.xyz * r14.xyz;
    r0.w = saturate(ps);
    r9.yz = r12.ww * r13.xy + r9.yz;
    r5.y = r9.w * r0.w + r12.z;
    r9.yz = r9.yz * r0.ww - 1.0;
    r9.yz = r10.xy * 2.0 + r9.yz;
    r9.w = r5.y * TwoSidedSign.x - TwoSidedSign.x;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r10 = r9 * r7.yyyy;
    r5.w = ps;
    ps = r10.w;
    r9.xyz = r4.www * r3.xyz;
    r5.y = ps;
    ps = TwoSidedSign.x + r5.y;
    r5.z = r10.x + 1.0;
    r6.w = ps;
    r3.xy = (r7.yy > 0.0) ? r10.yz : 0.0;
    r3.xy = (r7.yy >= 0.0) ? r3.xy : 0.0;
    r5.z = (r3.w > 0.0) ? r5.z : 1.0;
    r6.w = (r7.y > 0.0) ? r6.w : TwoSidedSign.x;
    r3.z = (r7.y >= 0.0) ? r6.w : TwoSidedSign.x;
    r5.z = (r3.w >= 0.0) ? r5.z : 1.0;
    ps = rsqrt(abs(r1.w));
    r6.xyz = r6.xyz * r5.zzz;
    r5.z = ps;
    r10.xyz = r6.xyz * r4.zzz - r9.xyz;
    r6.xyz = r6.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = pow(2.0, r5.w);
    r4.xyz = r5.xxx * r6.xyz;
    r6.x = ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.yzw = r11.xyz * r2.www;
    r5.yzw = r5.zzz * r1.xyz;
    r5.x = dot(r3.zxy, r3.zxy);
    r1.xyz = r10.xyz * r0.www + r9.xyz;
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
    r2.xyz = r4.xyz * r0.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.xyz = r6.ywz * r6.xxx;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r3.zxy, r5.wyz));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r6.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
