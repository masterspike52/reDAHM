// ps_f19bea9014e0ca70.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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

    r15 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r15.w;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r13.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r8.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r10.x = r1.x * UniformVector_2.x;
    ps = -r1.y;
    r16.xy = r0.xy * UniformScalar_0.xx;
    ps = 1.0 + ps;
    r3.w = saturate(r5.w * 0.0001);
    r5.z = ps;
    ps = r5.w;
    r11.xy = r1.xy * UniformVector_6.xy;
    ps = (-4e+02) + ps;
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = r2.z;
    r7.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r1.x = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    r19.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r1.y = r8.z * r13.z;
    r1.x = ps;
    ps = 0.00022222222 * r0.w;
    r1.z = dot(r3.zxy, r3.zxy);
    r19.x = saturate(ps);
    ps = rsqrt(abs(r1.z));
    r8.xyz = r1.xxx * r4.xyz;
    r1.x = ps;
    ps = 5.0 * r0.z;
    r4.xyz = r1.xxx * -SpotDirection.xyz;
    r19.y = saturate(ps);
    ps = 1.0 / r5.w;
    r0.z = dot(r4.zxy, r3.zxy);
    r1.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.xyw = r19.zxw * float3(0.5, -0.025, 0.5);
    r1.x = ps;
    r7.xy = r8.xy * r9.yy + r7.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = r7.wyz * r1.wxw;
    r1.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.xy = -r3.yw + 1.0;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.yzw = r5.zxw * UniformVector_2.yyx;
    r1.w = ps;
    ps = r10.w;
    r4.yz = r1.xw * abs(r6.xy);
    ps = r7.x * ps;
    r6.xyz = r10.zxy - 0.5;
    r1.x = ps;
    ps = -SpotAngles.x - -r0.z;
    r14.z = float((r1.x >= 0.5));
    r0.z = ps;
    ps = (-1.0) + r1.y;
    r18.xyz = float3((r10.xzy >= 0.5));
    r13.z = ps;
    ps = (-0.5) + r1.x;
    r6.xyz = r6.xzy - r10.zyx;
    r13.w = ps;
    r6.yzw = r6.xzy * r18.yxz + r10.zxy;
    ps = SpotAngles.y * r0.z;
    r14.x = r13.w - r1.x;
    r14.y = saturate(ps);
    r4.xw = r14.xy * r14.zy;
    ps = ScreenPositionScaleBias.w + r3.z;
    r6.x = r1.x + r4.x;
    r0.z = ps;
    ps = ScreenPositionScaleBias.z + r3.x;
    r17 = r6.zwxy + r6.zwxy;
    r0.w = ps;
    r6.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r10.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r4.yz).xy;
    r12 = tex2D(Texture2D_1, r17.xy);
    r17 = tex2D(Texture2D_1, r17.zw);
    r11.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r7.xy).zxy;
    r3.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_3, r16.xy).xwy;
    r0.yw = r13.xy * 2.0 - 1.0;
    ps = 1.0 - r1.z;
    r0.z = float((UniformScalar_5.x >= 1.0));
    r0.x = saturate(ps);
    ps = r3.x + r3.x;
    r2.w = float((UniformScalar_5.x > 1.0));
    r16.x = ps;
    ps = r3.y + r3.y;
    r1.xzw = r7.xyz + float3(-1.0, 0.0, 0.0);
    r16.y = ps;
    r11.xyz = (-abs(r2.www) >= 0.0) ? r11.xyz : 1.0;
    r11.xyz = (-abs(r0.zzz) >= 0.0) ? 1.0 : r11.xyz;
    ps = log2(r0.x);
    r3.xyz = r1.xzw + r7.xyz;
    r0.x = ps;
    ps = r3.w + r3.w;
    r0.z = -r19.y + 1.0;
    r16.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r13.y = dot(r18.xzz, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r13.x = r18.y * 2.0 + r14.z;
    r1.w = (r13.x == 0.0) ? r17.x : r17.y;
    r2.w = (r13.y == 0.0) ? r12.x : r12.y;
    ps = ModShadowGroupColor.y * r0.z;
    r14 = r13.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r1.z = ps;
    r0.z = (r14.z == 0.0) ? r12.z : r2.w;
    r1.w = (r14.y == 0.0) ? r17.z : r1.w;
    r16.w = (r14.x == 0.0) ? r17.w : r1.w;
    r1.w = (r14.w == 0.0) ? r12.w : r0.z;
    r14 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r12.z = r14.z * UniformVector_4.z - r3.x;
    r0.z = r14.w + r16.w;
    ps = (-1.0) + r4.y;
    r6.w = saturate(r0.z - r1.y);
    r7.x = ps;
    ps = r4.x + r4.x;
    r2.w = dot(r2.zxy, r2.zxy);
    r17.z = ps;
    ps = r4.z + r4.z;
    r18.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r17.w = ps;
    ps = (-1.0) + r3.y;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r12.x = ps;
    ps = (-1.0) + r3.z;
    r15.xyz = r18.xyz * r15.xyz;
    r12.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r13.xy = r0.yw + r9.xw;
    r3.w = ps;
    ps = 1.0 - r1.x;
    r0.z = max(r1.w, 0.0);
    r0.y = ps;
    ps = 1.0 - r1.z;
    r9.x = min(r0.z, 0.3);
    r0.w = ps;
    ps = 1.0 - r1.w;
    r4.xyz = r9.xyz * float3(3.3333333, 0.875, 0.875);
    r0.z = ps;
    ps = 2.5 * r0.z;
    r17.xy = r4.yz * r0.yw;
    r9.y = ps;
    r9.z = r4.x * r13.z + 1.0;
    ps = abs(r9.z) * abs(r9.z);
    r1 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r9.x = ps;
    r14.xy = r3.ww * r1.zw + r14.xy;
    ps = r1.x * r1.y;
    r0.yz = r9.yx * r9.zx;
    r0.w = ps;
    r1.xyz = r0.www * r16.xyz + ModShadowColor.xyz;
    ps = (-0.5) + r0.y;
    r11.xyz = r15.xyz * r11.xyz;
    r0.w = saturate(ps);
    r4.yz = r14.xy * UniformVector_4.xy - r12.xy;
    r12.xy = r4.xx * r13.xy + r4.yz;
    r0.y = r12.z * r0.w + r3.x;
    r3.xy = r12.xy * r0.ww - 1.0;
    r7.yz = r7.yz * 2.0 + r3.xy;
    r7.w = r0.y * TwoSidedSign.x - TwoSidedSign.x;
    r7 = r7 * r5.yyyy;
    ps = r7.w;
    r10.xyz = r6.www * r10.xyz;
    r0.y = ps;
    ps = TwoSidedSign.x + r0.y;
    r1.w = r7.x + 1.0;
    r3.x = ps;
    r3.yz = (r5.yy > 0.0) ? r7.yz : 0.0;
    r7.xy = (r5.yy >= 0.0) ? r3.yz : 0.0;
    r1.w = (r3.w > 0.0) ? r1.w : 1.0;
    r3.x = (r5.y > 0.0) ? r3.x : TwoSidedSign.x;
    r7.z = (r5.y >= 0.0) ? r3.x : TwoSidedSign.x;
    r1.w = (r3.w >= 0.0) ? r1.w : 1.0;
    ps = r0.z * r0.z;
    r3.xyz = r11.xyz * r1.www;
    r0.y = ps;
    r11.xyz = r3.xyz * r9.zzz - r10.xyz;
    r3.xyz = r3.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = rsqrt(abs(r2.w));
    r3.xyz = r0.yyy * r3.xyz;
    r0.y = ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.xyz = r0.yyy * r2.xyz;
    r0.y = dot(r7.zxy, r7.zxy);
    r2.xyz = r11.xyz * r0.www + r10.xyz;
    ps = rsqrt(abs(r0.y));
    r2.xyz = r2.xyz * r9.xyz;
    r0.y = ps;
    r7.xyz = r7.xyz * r0.yyy;
    r7.xyz = r7.xyz * TwoSidedSign.xxx;
    r0.y = dot(r7.zxy, r8.zxy);
    r9.xyz = r7.xzy * r0.yyy;
    r8.xyz = r9.xyz * 2.0 - r8.xzy;
    r0.y = saturate(dot(r5.zxy, r8.yxz));
    ps = log2(r0.y);
    r3.xyz = r3.xyz * r0.www;
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.w = saturate(dot(r7.zxy, r5.zxy));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r3.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r2.xy * r1.ww + r0.yz;
    r0.w = r2.z * r1.w + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r4.www;
    r0.xyz = r0.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
