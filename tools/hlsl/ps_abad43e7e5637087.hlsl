// ps_abad43e7e5637087.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 372 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005D0 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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

    r3 = tex2D(Texture2D_6, r0.xy).xywz;
    r0.zw = r1.xy * 6.0;
    r1.z = r3.z - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r11.xzw = tex2D(Texture2D_2, r1.xy).wxy;
    r8.x = r1.x * UniformVector_2.x;
    ps = 1.0 / UniformVector_1.x;
    r0.w = r5.w - 4e+02;
    r8.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = r2.z + 0.1;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = r7.z * r11.x;
    r8.z = ps;
    r1.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r1.w));
    r9.zw = r8.yz * abs(r6.xy);
    r1.w = ps;
    ps = -r1.y;
    r12.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 + ps;
    r9.xy = r1.xy * UniformVector_6.xy;
    r8.z = ps;
    ps = 0.00022222222 * r0.w;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.w = saturate(ps);
    ps = 5.0 * r0.z;
    r6.xy = r1.xy * UniformVector_1.xy;
    r0.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r4.xyz = r1.www * r4.xyz;
    r1.x = ps;
    ps = 1.0 / r5.w;
    r1.w = r0.w * (-0.025);
    r1.y = ps;
    r10.xy = r4.xy * r1.ww + r6.xy;
    r1.yw = r10.zw * r1.yy + ScreenPositionScaleBias.wz;
    r8.y = -r10.y * r1.x + 1.0;
    r8.yzw = r8.zyw * UniformVector_2.yyx;
    ps = r8.w;
    r6.xyz = r8.zxy - 0.5;
    ps = r10.x * ps;
    r17.xyz = float3((r8.xzy >= 0.5));
    r1.x = ps;
    ps = (-1.0) + r1.z;
    r17.w = float((r1.x >= 0.5));
    r7.z = ps;
    ps = (-0.5) + r1.x;
    r13.xyz = r6.xzy - r8.zyx;
    r7.w = ps;
    r13.w = r7.w - r1.x;
    r6.x = r13.w * r17.w + r1.x;
    r6.yzw = r13.xzy * r17.yxz + r8.zxy;
    r13 = r6.zwxy + r6.zwxy;
    r6.xyz = tex2D(LightAttenuationTexture, r1.yw).xyz;
    r8.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r16 = tex2D(Texture2D_1, r13.xy);
    r18 = tex2D(Texture2D_1, r13.zw);
    r9.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r15.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r1.xyw = tex2D(Texture2D_3, r12.xy).xwy;
    r2.w = dot(r2.zxy, r2.zxy);
    ps = r5.w;
    r12.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = 0.0001 * ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = saturate(ps);
    ps = (-1.0) + r1.y;
    r13.zw = r1.xw + r1.xw;
    r5.x = ps;
    ps = r7.x + r7.x;
    r0.x = float((UniformScalar_5.x >= 1.0));
    r19.x = ps;
    ps = r7.y + r7.y;
    r19.zw = r11.zw + r11.zw;
    r19.y = ps;
    ps = r12.x;
    r4.w = float((UniformScalar_5.x > 1.0));
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = r3.x * ps;
    r1.xyw = r10.zxy + float3(-1.0, 0.0, 0.0);
    r12.x = ps;
    r5.yzw = (-abs(r4.www) >= 0.0) ? r9.xyz : 1.0;
    r9.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r5.yzw;
    ps = r12.y;
    r1.xyw = r1.xyw + r10.zxy;
    r5.w = r15.z * UniformVector_4.z - r1.x;
    ps = r3.y * ps;
    r19 = r19 - 1.0;
    r12.y = ps;
    r7.xy = r19.xy * 0.5 + r19.zw;
    ps = 1.0 - r0.z;
    r5.z = dot(r17.xzz, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r5.y = r17.y * 2.0 + r17.w;
    r4.w = (r5.y == 0.0) ? r18.x : r18.y;
    r0.x = (r5.z == 0.0) ? r16.x : r16.y;
    ps = 1.0 - r0.y;
    r17 = r5.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r0.y = ps;
    r0.x = (r17.z == 0.0) ? r16.z : r0.x;
    r0.w = (r17.y == 0.0) ? r18.z : r4.w;
    r11.w = (r17.x == 0.0) ? r18.w : r0.w;
    r16.x = (r17.w == 0.0) ? r16.w : r0.x;
    ps = ModShadowGroupColor.x * r0.z;
    r0.x = max(r16.x, 0.0);
    r16.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r11.z = min(r0.x, 0.3);
    r16.z = ps;
    ps = r12.z;
    r3.xyz = -r16.xyz + 1.0;
    ps = r3.w * ps;
    r11.xyz = r11.xyz * float3(0.875, 0.875, 3.3333333);
    r12.z = ps;
    ps = (-1.0) + r1.y;
    r13.xy = r11.xy * r3.yz;
    r5.y = ps;
    ps = (-1.0) + r1.w;
    r11.xyz = r11.zzz * r7.xyz;
    r5.z = ps;
    ps = UniformScalar_1.x * r0.y;
    r7.zw = r11.zw + float2(1.0, 0.25);
    r0.x = ps;
    ps = 2.5 * r3.x;
    r13 = r13.zwxy + float4(-1.0, -1.0, 0.125, 0.125);
    r7.y = ps;
    r13.xy = r0.xx * r13.xy + r15.xy;
    ps = r13.z * r13.w;
    r0.w = r7.w + r11.w;
    r1.y = ps;
    r3.xyz = r1.yyy * r14.xyz + ModShadowColor.xyz;
    ps = abs(r7.z) * abs(r7.z);
    r1.z = saturate(r0.w - r1.z);
    r7.x = ps;
    r11.xy = r13.xy * UniformVector_4.xy + r11.xy;
    ps = r7.x * r7.x;
    r9.xyz = r12.xyz * r9.xyz;
    r1.y = ps;
    ps = r7.y * r7.z;
    r5.yz = r11.xy - r5.yz;
    r0.w = ps;
    ps = (-0.5) + r0.w;
    r8.xyz = r1.zzz * r8.xyz;
    r1.z = saturate(ps);
    r0.w = r5.w * r1.z + r1.x;
    r1.xw = r5.yz * r1.zz - 1.0;
    r5.yz = r10.xy * 2.0 + r1.xw;
    r5.w = r0.w * TwoSidedSign.x - TwoSidedSign.x;
    r0.w = r5.w * r0.y + TwoSidedSign.x;
    r5.xyz = r5.xyz * r0.yyy + float3(1.0, 0.0, 0.0);
    r5.xyw = (r0.xyy > 0.0) ? r5.xyz : float3(1.0, 0.0, 0.0);
    r0.w = (r0.y > 0.0) ? r0.w : TwoSidedSign.x;
    r5.z = (r0.y >= 0.0) ? r0.w : TwoSidedSign.x;
    r5.xyw = (r0.yyx >= 0.0) ? r5.ywx : float3(0.0, 0.0, 1.0);
    ps = r1.y * r1.y;
    r0.xyz = r9.xyz * r5.www;
    r0.w = ps;
    r9.xyz = r0.xyz * r7.zzz - r8.xyz;
    r0.xyz = r0.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r2.w));
    r1.xyw = r0.www * r0.xyz;
    r0.x = ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.yzw = r0.xxx * r2.xyz;
    r0.x = dot(r5.zxy, r5.zxy);
    r2.xyz = r9.xyz * r1.zzz + r8.xyz;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r2.xyz * r7.xyz;
    r0.x = ps;
    r5.xyz = r5.xyz * r0.xxx;
    r5.xyz = r5.xyz * TwoSidedSign.xxx;
    r0.x = dot(r5.zxy, r4.zxy);
    r7.xyz = r5.xzy * r0.xxx;
    r4.xyz = r7.xyz * 2.0 - r4.xzy;
    r0.x = saturate(dot(r0.wyz, r4.yxz));
    ps = log2(r0.x);
    r4.xyz = r1.xyw * r1.zzz;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r1.xyz = r6.xyz * LightColor.xyz;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r5.zxy, r0.wyz));
    r0.x = ps;
    r0.xyz = r4.xyz * r0.xxx;
    r0.xy = r2.xy * r0.ww + r0.xy;
    r0.z = r2.z * r0.w + r0.z;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xzy * r3.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
