// ps_ca2eb846a2151bb5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r14.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r10.xzw = tex2D(Texture2D_2, r0.zw).wxy;
    r15.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    ps = 1.0 - r1.y;
    r9.x = r1.x * UniformVector_2.x;
    r7.z = ps;
    ps = r5.w;
    r0.z = r10.x * r15.z;
    ps = 0.0001 * ps;
    r19.xy = r0.xy * UniformScalar_0.xx;
    r1.z = saturate(ps);
    ps = r5.w;
    r13.xy = r1.xy * UniformVector_6.xy;
    ps = (-4e+02) + ps;
    r11.zw = r5.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = r2.z;
    r7.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r0.w));
    r5.xy = saturate(r5.yx * float2(5.0, 0.00022222222));
    r0.w = ps;
    ps = 1.0 / r5.w;
    r8.xyz = r0.www * r4.xyz;
    r1.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r0.w = r5.y * (-0.025);
    r1.x = ps;
    r11.xy = r8.xy * r0.ww + r7.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xyw = r11.zyw * r1.yxy;
    r4.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xy = -r1.yz + 1.0;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.yzw = r7.zxw * UniformVector_2.yyx;
    r4.y = ps;
    ps = r9.w;
    r5.zw = r4.xy * abs(r6.xy);
    ps = r11.x * ps;
    r4.xyz = r9.zxy - 0.5;
    r0.w = ps;
    r16.x = float((r0.w >= 0.5));
    ps = (-1.0) + r0.z;
    r16.yzw = float3((r9.xzy >= 0.5));
    r15.z = ps;
    ps = (-0.5) + r0.w;
    r12.yzw = r4.xzy - r9.zyx;
    r15.w = ps;
    ps = ScreenPositionScaleBias.w + r1.x;
    r12.x = r15.w - r0.w;
    r6.x = ps;
    r4.x = r12.x * r16.x + r0.w;
    r4.yzw = r12.ywz * r16.zyw + r9.zxy;
    ps = ScreenPositionScaleBias.z + r1.w;
    r4 = r4.zwxy + r4.zwxy;
    r6.y = ps;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r12 = tex2D(Texture2D_1, r4.zw);
    r17 = tex2D(Texture2D_1, r4.xy);
    r13.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r11.xy).xyz;
    r18.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_3, r19.xy).wxy;
    r0.y = float((UniformScalar_5.x >= 1.0));
    r0.x = dot(r3.zxy, r3.zxy);
    r5.zw = r15.xy * 2.0 - 1.0;
    r10.zw = r10.zw * 2.0 - 1.0;
    ps = 1.0 - r0.x;
    r1.w = float((UniformScalar_5.x > 1.0));
    r0.x = saturate(ps);
    ps = r18.x + r18.x;
    r1.xyz = r11.zxy + float3(-1.0, 0.0, 0.0);
    r3.y = ps;
    r3.xzw = (-abs(r1.www) >= 0.0) ? r13.xyz : 1.0;
    r13.xyz = (-abs(r0.yyy) >= 0.0) ? 1.0 : r3.xzw;
    ps = log2(r0.x);
    r1.xyz = r1.yxz + r11.xzy;
    r0.x = ps;
    r3.x = r16.z * 2.0 + r16.x;
    ps = r18.y + r18.y;
    r3.w = dot(r16.yww, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r1.w = (r3.w == 0.0) ? r17.x : r17.y;
    r0.y = (r3.x == 0.0) ? r12.x : r12.y;
    ps = r18.z + r18.z;
    r16 = r3.xxww + float4(-2.0, -3.0, -2.0, -3.0);
    r3.w = ps;
    r0.y = (r16.x == 0.0) ? r12.z : r0.y;
    r1.w = (r16.z == 0.0) ? r17.z : r1.w;
    r16.x = (r16.w == 0.0) ? r17.w : r1.w;
    r3.x = (r16.y == 0.0) ? r12.w : r0.y;
    r12 = r3.xywz + float4(0.25, -1.0, -1.0, -1.0);
    r12.z = r12.z * UniformVector_4.z - r1.y;
    r0.y = r12.x + r3.x;
    r3.w = saturate(r0.y - r0.z);
    r1.w = dot(r2.zxy, r2.zxy);
    r0.yzw = UniformVector_5.xyz * UniformVector_5.www;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r14.xyz = r0.yzw * r14.xyz;
    ps = r4.y + r4.y;
    r10 = r10 * float4(0.875, 0.875, 0.5, 0.5);
    r16.z = ps;
    ps = 1.0 - r5.x;
    r15.xy = r5.zw + r10.zw;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.y = max(r16.x, 0.0);
    r16.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r5.w = min(r0.y, 0.3);
    r16.w = ps;
    ps = r4.z + r4.z;
    r5.xyz = -r16.xyw + 1.0;
    r16.w = ps;
    ps = (-1.0) + r1.x;
    r16.xy = r10.xy * r5.yz;
    r0.y = ps;
    ps = (-1.0) + r1.z;
    r10.xy = r5.xw * float2(2.5, 3.3333333);
    r0.z = ps;
    ps = UniformScalar_1.x * r7.y;
    r5 = r16.zwxy + float4(-1.0, -1.0, 0.125, 0.125);
    r2.w = ps;
    r10.w = r10.y * r15.z + 1.0;
    r5.xy = r2.ww * r5.xy + r12.yw;
    ps = abs(r10.w) * abs(r10.w);
    r0.w = r5.z * r5.w;
    r10.z = ps;
    r3.xyz = r0.www * r3.xyz + ModShadowColor.xyz;
    r0.yz = r5.xy * UniformVector_4.xy - r0.yz;
    r12.xy = r10.yy * r15.xy + r0.yz;
    ps = (-1.0) + r4.x;
    r0.yz = r10.xz * r10.wz;
    r5.x = ps;
    ps = (-0.5) + r0.y;
    r4.xyz = r14.xyz * r13.xyz;
    r0.w = saturate(ps);
    r0.y = r12.z * r0.w + r1.y;
    r1.xy = r12.xy * r0.ww - 1.0;
    r5.yz = r11.xy * 2.0 + r1.xy;
    r5.w = r0.y * TwoSidedSign.x - TwoSidedSign.x;
    r5 = r5 * r7.yyyy;
    ps = r5.w;
    r9.xyz = r3.www * r9.xyz;
    r0.y = ps;
    ps = TwoSidedSign.x + r0.y;
    r1.x = r5.x + 1.0;
    r1.y = ps;
    r5.xy = (r7.yy > 0.0) ? r5.yz : 0.0;
    r5.xy = (r7.yy >= 0.0) ? r5.xy : 0.0;
    r1.x = (r2.w > 0.0) ? r1.x : 1.0;
    r1.y = (r7.y > 0.0) ? r1.y : TwoSidedSign.x;
    r5.z = (r7.y >= 0.0) ? r1.y : TwoSidedSign.x;
    r1.x = (r2.w >= 0.0) ? r1.x : 1.0;
    ps = r0.z * r0.z;
    r1.xyz = r4.xyz * r1.xxx;
    r0.y = ps;
    r10.xyz = r1.xyz * r10.www - r9.xyz;
    r1.xyz = r1.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r0.yyy * r1.xyz;
    r0.y = ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = r0.yyy * r2.xyz;
    r0.y = dot(r5.zxy, r5.zxy);
    r2.xyz = r10.xyz * r0.www + r9.xyz;
    ps = rsqrt(abs(r0.y));
    r1.yzw = r2.xyz * r1.xyz;
    r0.y = ps;
    r2.xyz = r5.xyz * r0.yyy;
    r5.xyz = r2.xyz * TwoSidedSign.xxx;
    r0.y = dot(r5.zxy, r8.zxy);
    r2.xyz = r5.xzy * r0.yyy;
    r2.xyz = r2.xyz * 2.0 - r8.xzy;
    r0.y = saturate(dot(r4.zxy, r2.yxz));
    ps = log2(r0.y);
    r2.xyz = r7.xyz * r0.www;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(dot(r5.zxy, r4.zxy));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r2.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r3.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
