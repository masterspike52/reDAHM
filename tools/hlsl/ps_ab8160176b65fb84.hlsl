// ps_ab8160176b65fb84.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041300 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c15); // float3
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

    r12 = tex2D(Texture2D_6, r1.xy).xywz;
    ps = (-0.5) + r12.z;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r19.y = tex2D(ShadowTexture, r0.xy).x;
    r13.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    ps = r1.w;
    r0.yz = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r7.y = -r1.z + 1.0;
    r11.x = ps;
    ps = r5.w;
    r3.xy = r1.wz * 6.0;
    ps = 0.0001 * ps;
    r6.y = r2.z + 0.1;
    r6.w = saturate(ps);
    ps = r5.x;
    r3.zw = r1.wz * UniformVector_6.xy;
    ps = ScreenPositionScaleBias.x * ps;
    r7.xz = r1.wz * UniformVector_1.xy;
    r10.z = ps;
    ps = r5.y;
    r6.x = dot(r4.zxy, r4.zxy);
    ps = ScreenPositionScaleBias.y * ps;
    r6.z = r5.w - 4e+02;
    r10.w = ps;
    ps = rsqrt(abs(r6.x));
    r17.xz = saturate(r6.yz * float2(5.0, 0.00022222222));
    r6.x = ps;
    ps = 1.0 / r5.w;
    r9.xyz = r6.xxx * r4.xyz;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.z = r17.z * (-0.025);
    r6.x = ps;
    r10.xy = r9.xy * r6.zz + r7.xz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = r10.zwy * r6.yyx;
    r0.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xz = -r6.zw + 1.0;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.yzw = r7.yxw * UniformVector_2.yyx;
    r0.w = ps;
    ps = r11.w;
    r7.xy = r0.xw * abs(r8.xy);
    ps = r10.x * ps;
    r5.xyz = r11.zxy - 0.5;
    r4.w = ps;
    ps = r13.x + r13.x;
    r19.z = float((r4.w >= 0.5));
    r4.x = ps;
    ps = r13.y + r13.y;
    r15.xyz = float3((r11.xzy >= 0.5));
    r4.y = ps;
    ps = r13.z + r13.z;
    r5.xyz = r5.xzy - r11.zyx;
    r4.z = ps;
    r16 = r4 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.yzw = r5.xzy * r15.yxz + r11.zxy;
    r19.x = r16.w - r4.w;
    r0.xw = r19.xy * r19.zy;
    ps = ScreenPositionScaleBias.w + r6.x;
    r5.x = r4.w + r0.x;
    r4.x = ps;
    ps = ScreenPositionScaleBias.z + r6.y;
    r11 = r5.zwxy + r5.zwxy;
    r4.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r14 = tex2D(Texture2D_1, r11.zw);
    r18 = tex2D(Texture2D_1, r11.xy);
    r13.xyz = tex2D(Texture2D_7, r3.zw).xyz;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r3.xyz = tex2D(Texture2D_2, r3.xy).xyw;
    r1.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r0.xyz = tex2D(Texture2D_3, r0.yz).wxy;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r7.x = float((UniformScalar_5.x > 1.0));
    r11.xy = r1.xy + r1.xy;
    ps = r3.x + r3.x;
    r6.xyz = r10.zxy + float3(-1.0, 0.0, 0.0);
    r11.z = ps;
    r13.xyz = (-abs(r7.xxx) >= 0.0) ? r13.xyz : 1.0;
    r13.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r13.xyz;
    ps = r3.y + r3.y;
    r6.xyz = r6.yxz + r10.xzy;
    r11.w = ps;
    r11 = r11 - 1.0;
    r11.xy = r11.zw * 0.5 + r11.xy;
    r3.x = r15.y * 2.0 + r19.z;
    ps = r3.z;
    r3.y = dot(r15.xzz, float3(1.0, 1.0, 1.0));
    r3.w = r16.z * UniformVector_4.z - r6.y;
    r7.x = (r3.y == 0.0) ? r18.x : r18.y;
    r6.w = (r3.x == 0.0) ? r14.x : r14.y;
    ps = r1.z * ps;
    r15 = r3.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r1.z = ps;
    r6.w = (r15.y == 0.0) ? r14.z : r6.w;
    r7.x = (r15.z == 0.0) ? r18.z : r7.x;
    r17.y = (r15.w == 0.0) ? r18.w : r7.x;
    r1.w = (r15.x == 0.0) ? r14.w : r6.w;
    r11.zw = r1.zw + float2(-1.0, 0.25);
    r7.xy = -r17.yx + 1.0;
    r1.xy = -r7.yy * ModShadowGroupColor.xy + 1.0;
    r6.w = r11.w + r1.w;
    r4.w = saturate(r6.w - r1.z);
    r6.w = dot(r2.zxy, r2.zxy);
    ps = (-1.0) + r0.x;
    r14.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r3.x = ps;
    ps = r0.y + r0.y;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r12.z = ps;
    ps = r0.z + r0.z;
    r14.xyz = r14.xyz * r12.xyw;
    r12.w = ps;
    ps = (-1.0) + r6.x;
    r0.y = max(r17.y, 0.0);
    r3.y = ps;
    ps = (-1.0) + r6.z;
    r8.x = min(r0.y, 0.3);
    r3.z = ps;
    ps = UniformScalar_1.x * r7.z;
    r8.xyw = r8.yzx * float3(0.875, 0.875, 3.3333333);
    r2.w = ps;
    ps = 2.5 * r7.x;
    r12.xy = r8.xy * r1.xy;
    r1.y = ps;
    r1.z = r8.w * r11.z + 1.0;
    ps = abs(r1.z) * abs(r1.z);
    r12 = r12.zwxy + float4(-1.0, -1.0, 0.125, 0.125);
    r1.x = ps;
    r12.xy = r2.ww * r12.xy + r16.xy;
    ps = r12.z * r12.w;
    r6.xz = r1.xy * r1.xz;
    r0.y = ps;
    r0.xyz = r0.yyy * r15.xyz + ModShadowColor.xyz;
    ps = (-0.5) + r6.z;
    r8.xyz = r14.xyz * r13.xyz;
    r1.w = saturate(ps);
    r3.yz = r12.xy * UniformVector_4.xy - r3.yz;
    r3.yz = r8.ww * r11.xy + r3.yz;
    r6.y = r3.w * r1.w + r6.y;
    r3.yz = r3.yz * r1.ww - 1.0;
    r3.yz = r10.xy * 2.0 + r3.yz;
    r3.w = r6.y * TwoSidedSign.x - TwoSidedSign.x;
    r3 = r3.yzxw * r7.zzzz;
    ps = r3.w;
    r5.xyz = r4.www * r5.xyz;
    r6.y = ps;
    ps = TwoSidedSign.x + r6.y;
    r3.w = r3.z + 1.0;
    r3.z = ps;
    r3.xy = (r7.zz > 0.0) ? r3.xy : 0.0;
    r3.xy = (r7.zz >= 0.0) ? r3.xy : 0.0;
    r6.y = (r2.w > 0.0) ? r3.w : 1.0;
    r3.z = (r7.z > 0.0) ? r3.z : TwoSidedSign.x;
    r3.z = (r7.z >= 0.0) ? r3.z : TwoSidedSign.x;
    r6.y = (r2.w >= 0.0) ? r6.y : 1.0;
    ps = r6.x * r6.x;
    r7.yzw = r8.xyz * r6.yyy;
    r7.x = ps;
    r8.xyz = r7.yzw * r1.zzz - r5.xyz;
    r6.xyz = r7.yzw * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r6.xyz;
    r6.x = ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.yzw = r6.xxx * r2.xyz;
    r6.x = dot(r3.zxy, r3.zxy);
    r2.xyz = r8.xyz * r1.www + r5.xyz;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r2.xyz * r1.xyz;
    r6.x = ps;
    r2.xyz = r3.xyz * r6.xxx;
    r3.xyz = r2.xyz * TwoSidedSign.xxx;
    r6.x = dot(r3.zxy, r9.zxy);
    r2.xyz = r3.xzy * r6.xxx;
    r2.xyz = r2.xyz * 2.0 - r9.xzy;
    r6.x = saturate(dot(r6.wyz, r2.yxz));
    ps = log2(r6.x);
    r2.xyz = r7.xyz * r1.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.xyz = r0.www * r4.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r3.zxy, r6.wyz));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
