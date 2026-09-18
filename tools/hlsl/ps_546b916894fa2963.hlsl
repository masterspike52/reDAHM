// ps_546b916894fa2963.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 384 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000600 10041300 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
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

    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r3.zw = r0.xy * UniformVector_3.xy;
    r1.w = ps;
    r9 = tex2D(Texture2D_8, r3.zw);
    ps = (-0.5) + r9.w;
    r3.xy = r1.xy * 6.0;
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r17.yzw = tex2D(Texture2D_3, r3.zw).xyz;
    r10.x = r1.x * UniformVector_2.x;
    r14.y = -r1.y + 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = dot(r4.zxy, r4.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r1.z));
    r0.z = r2.z + 0.1;
    r1.z = ps;
    ps = 0.00022222222 * r0.w;
    r7.zw = r1.xy * UniformVector_1.xy;
    r10.w = saturate(ps);
    ps = 5.0 * r0.z;
    r8.xyz = r1.zzz * r4.xyz;
    r10.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r0.w = r10.w * (-0.025);
    r0.z = ps;
    r4.zw = r8.xy * r0.ww + r7.zw;
    r10.y = r4.w * r0.z;
    ps = 1.0 / UniformVector_1.x;
    r14.xw = -r10.yz + 1.0;
    r14.z = ps;
    r10.yzw = r14.yxz * UniformVector_2.yyx;
    ps = r10.w;
    r11.xyz = r10.zxy - 0.5;
    ps = r4.z * ps;
    r19.xyz = float3((r10.xzy >= 0.5));
    r17.x = ps;
    r19.w = float((r17.x >= 0.5));
    ps = r7.x;
    r11.xyz = r11.xzy - r10.zyx;
    ps = abs(r6.x) * ps;
    r18 = r17.xwyz + float4(-0.5, -2.0, 0.0, 0.0);
    r0.z = ps;
    ps = r7.y;
    r11.w = r18.x - r17.x;
    r7.x = r11.w * r19.w + r17.x;
    r7.yzw = r11.xzy * r19.yxz + r10.zxy;
    ps = abs(r6.y) * ps;
    r7 = r7.zwxy + r7.zwxy;
    r0.w = ps;
    r16.y = tex2D(Texture2D_4, r3.zw).x;
    r11 = tex2D(Texture2D_1, r7.xy);
    r15 = tex2D(Texture2D_1, r7.zw);
    r10.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7.yzw = tex2D(Texture2D_2, r3.xy).xyw;
    r6.xyw = tex2D(Texture2D_0, r4.zw).xyz;
    r3.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r4.y = r0.y + UniformScalar_8.x;
    r0.z = ps;
    ps = UniformScalar_4.x;
    r0.y = saturate(r5.w * 0.0001);
    ps = UniformScalar_3.x * ps;
    r1.yz = r1.xy * UniformVector_5.xy;
    r7.x = ps;
    ps = r3.x + r3.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r13.z = ps;
    r10.zw = r7.yz * 2.0 - 1.0;
    r0.z = (-abs(r0.z) >= 0.0) ? 1.0 : (-1.0);
    r16.x = (-abs(r1.w) >= 0.0) ? (-1.0) : r0.z;
    ps = r3.y + r3.y;
    r10 = r10.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r13.w = ps;
    ps = r6.x + r6.x;
    r0.zw = r14.ww * ModShadowGroupColor.xy;
    r14.x = ps;
    ps = r6.y + r6.y;
    r3.xyw = -r0.zwy + 1.0;
    r14.y = ps;
    ps = r7.w;
    r13.xy = r10.xw * r3.xy;
    ps = r3.z * ps;
    r7.w = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r7.z = r19.y * 2.0 + r19.w;
    r2.w = (r7.z == 0.0) ? r15.x : r15.y;
    r1.w = (r7.w == 0.0) ? r11.x : r11.y;
    ps = (-1.0) - -r1.x;
    r0.yzw = r18.zwy + r17.yzw;
    r10.x = ps;
    ps = (-1.0) + r0.y;
    r17 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r7.y = ps;
    ps = (-1.0) + r0.z;
    r13 = r7.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.z = ps;
    r1.w = (r13.z == 0.0) ? r11.z : r1.w;
    r2.w = (r13.y == 0.0) ? r15.z : r2.w;
    r14.w = (r13.x == 0.0) ? r15.w : r2.w;
    r16.z = (r13.w == 0.0) ? r11.w : r1.w;
    ps = 0.0 + r0.w;
    r1.w = max(r16.z, 0.0);
    r7.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r7 = r7 * r16.xxyy;
    r10.w = ps;
    ps = floor(r7.x);
    r0.y = min(r1.w, 0.3);
    r0.w = ps;
    ps = 3.3333333 * r0.y;
    r10.yz = r17.zw + r10.yz;
    r0.z = ps;
    ps = r6.w + r6.w;
    r10 = r0.zzwz * r10.yzwx;
    r14.z = ps;
    ps = r10.z;
    r11 = r14 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r0.x + ps;
    r0.w = r10.y + r7.z;
    r4.x = ps;
    r0.z = r7.y * r16.y + r10.x;
    ps = 1.0 / r5.w;
    r12.xy = -r11.xy + r0.zw;
    r0.x = ps;
    r0.xy = r12.zw * r0.xx + ScreenPositionScaleBias.wz;
    r13.xyz = tex2D(Texture2D_6, r4.zw).xyz;
    r5 = tex2D(Texture2D_5, r4.xy);
    r15.xyz = tex2D(Texture2D_7, r1.yz).xyz;
    r0.yzw = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r1.yzw = -ModShadowColor.xyz + 1.0;
    r18.xyz = UniformVector_4.xyz * 2e+01;
    r0.x = float((UniformScalar_11.x >= 1.0));
    r2.w = dot(r2.zxy, r2.zxy);
    r3.z = float((UniformScalar_11.x > 1.0));
    r4.xyz = r9.xyz * UniformScalar_12.xxx;
    r15.xyz = (-abs(r3.zzz) >= 0.0) ? r15.xyz : 1.0;
    ps = rsqrt(abs(r2.w));
    r5.xyz = r5.xyz * r5.www;
    r4.w = ps;
    r5.xyz = r18.xyz * r5.xyz;
    r10.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r15.xyz;
    r15.xyz = r4.xyz * r10.xyz + UniformScalar_13.xxx;
    ps = r17.x * r17.y;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    r3.xyz = r0.xxx * r1.yzw + ModShadowColor.xyz;
    r1.yz = -r16.yz + 1.0;
    ps = r11.w;
    r5.xyz = r5.xyz * r16.yyy;
    ps = r14.w + ps;
    r6.xyz = r15.xyz * r1.yyy;
    r0.x = ps;
    ps = 2.5 * r1.z;
    r0.x = saturate(r0.x - r1.x);
    r1.w = ps;
    ps = -r11.z;
    r7.xyz = r0.xxx * r13.xyz;
    ps = r7.w + ps;
    r1.x = r10.w + 1.0;
    r0.x = ps;
    ps = 1.0 + r0.x;
    r1.xy = r1.xw * r1.zx;
    r5.w = ps;
    ps = (-0.5) + r1.y;
    r0.x = float((r1.x > 0.9));
    r2.w = saturate(ps);
    r1.xy = r12.xy * r2.ww + r11.xy;
    r5.xyz = r5.xyz * r0.xxx - r7.xyz;
    r5.xyz = r10.xyz * r9.xyz + r5.xyz;
    r7.xyz = r5.xyz * r2.www + r7.xyz;
    r0.x = r5.w * r2.w - 2.0;
    r1.z = r6.w * 2.0 + r0.x;
    r1.xyz = r1.zxy * r3.www;
    ps = 1.0 + r1.x;
    r5.xyz = r4.www * r2.xyz;
    r1.w = ps;
    r1.xyz = (r3.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r3.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r2.xyz = r6.xyz * r2.www;
    r0.x = ps;
    r6.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r6.zxy, r8.zxy);
    r1.xyz = r6.xyz * r0.xxx;
    r1.xyz = r1.xyz * 2.0 - r8.xyz;
    ps = LightColor.x * r0.y;
    r0.x = saturate(dot(r5.zxy, r1.zxy));
    r1.x = ps;
    ps = log2(r0.x);
    r4.xyz = r7.xyz * r4.xyz;
    r0.x = ps;
    ps = LightColor.y * r0.z;
    r0.x = r0.x * 15.0;
    r1.y = ps;
    ps = pow(2.0, r0.x);
    r1.w = saturate(dot(r6.zyx, r5.zyx));
    r0.x = ps;
    ps = LightColor.z * r0.w;
    r2.xyz = r2.xyz * r0.xxx;
    r1.z = ps;
    r0.xy = r4.xy * r1.ww + r2.xy;
    r0.z = r4.z * r1.w + r2.z;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xzy * r3.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
