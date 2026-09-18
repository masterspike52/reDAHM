// ps_2d6f607398b14bd7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10041100 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_6, r0.xy).wxyz;
    ps = (-0.5) + r12.x;
    r0.zw = r1.xy * 6.0;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    ps = r1.x;
    r1.zw = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r9.xy = r1.xy * UniformVector_1.xy;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r5.w - 4e+02;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    r10.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r10.x = saturate(r0.w * 0.00022222222);
    r0.z = ps;
    ps = -r1.y;
    r7.xyz = r0.zzz * r4.xyz;
    ps = 1.0 + ps;
    r10.xyz = r10.yzx * float3(0.5, 0.5, -0.025);
    r0.z = ps;
    ps = UniformVector_2.y * r0.z;
    r11.zw = r7.xy * r10.zz;
    r11.y = ps;
    r0.zw = r11.xy - 0.5;
    r13.xy = float2((r11.xy >= 0.5));
    ps = r8.x;
    r0.zw = r0.zw - r11.xy;
    ps = abs(r6.x) * ps;
    r9.zw = r0.zw * r13.xy;
    r4.x = ps;
    ps = r8.y;
    r11 = r11.zwxy + r9;
    ps = abs(r6.y) * ps;
    r0.zw = r11.zw + r11.zw;
    r4.y = ps;
    r14.yw = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r17 = tex2D(Texture2D_1, r0.zw);
    r4.xyw = tex2D(Texture2D_0, r11.xy).xyz;
    r9.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    r1.xyz = tex2D(Texture2D_3, r1.zw).wxy;
    r6.xzw = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyw = r6.xzw * 2.0 - 1.0;
    r13.zw = r1.yz * 2.0 - 1.0;
    ps = 0.0001 * r5.w;
    r0.z = r2.z + 0.1;
    r6.y = saturate(ps);
    ps = (-1.0) + r1.x;
    r6.x = saturate(r0.z * 5.0);
    r0.z = ps;
    ps = r9.x + r9.x;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = r9.y + r9.y;
    r1.xy = -r6.xy + 1.0;
    r15.z = ps;
    ps = UniformScalar_1.x * r1.y;
    r6.xyz = r4.xyw + r4.xyw;
    r15.w = ps;
    ps = r0.z;
    r15.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r0.z = (r15.x == 0.0) ? r17.x : r17.y;
    ps = r1.y * ps;
    r16 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.w = ps;
    ps = r16.z;
    r6 = r6 + float4(-1.0, -1.0, -1.0, 1.0);
    r0.z = (r16.y == 0.0) ? r17.z : r0.z;
    r14.z = (r16.x == 0.0) ? r17.w : r0.z;
    ps = r10.x + ps;
    r0.z = max(r14.z, 0.0);
    r13.x = ps;
    ps = r16.w;
    r14.x = min(r0.z, 0.3);
    ps = r10.y + ps;
    r15.xyz = r14.xyw * float3(3.3333333, 0.875, 0.875);
    r13.y = ps;
    r13 = r15.xxww * r13;
    r0.zw = r8.xy + r13.zw;
    r0.zw = r0.zw * UniformVector_4.xy + r13.xy;
    ps = 1.0 / r5.w;
    r10.xy = r0.zw - r6.xy;
    r0.z = ps;
    r0.zw = r10.zw * r0.zz + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.xyz = tex2D(Texture2D_5, r11.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    ps = -ModShadowColor.x;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r0.z = dot(r3.zxy, r3.zxy);
    r12.x = ps;
    ps = -ModShadowColor.y;
    r5.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r8.xyz = r13.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 1.0 + ps;
    r13.xyz = r5.xyz * r12.yzw;
    r12.y = ps;
    r3.w = r7.w * r9.w - 1.0;
    ps = rsqrt(abs(r0.z));
    r0.y = saturate(-r0.z + 1.0);
    r0.z = ps;
    ps = log2(r0.y);
    r5.xyz = r0.zzz * -SpotDirection.xyz;
    r0.y = ps;
    ps = -ModShadowColor.z;
    r0.z = dot(r5.zxy, r3.zxy);
    ps = 1.0 + ps;
    r14.xy = r1.xx * ModShadowGroupColor.xy;
    r12.z = ps;
    r13.w = r8.w * UniformVector_4.z - r6.z;
    ps = rsqrt(abs(r0.x));
    r3.xyz = -r14.yxz + 1.0;
    r0.x = ps;
    ps = 2.5 * r3.z;
    r5.xyz = r0.xxx * r2.xyz;
    r14.w = ps;
    r2.yzw = r15.xyz * r3.wyx + float3(1.0, 0.125, 0.125);
    ps = abs(r2.y) * abs(r2.y);
    r14.xyz = r13.xyz * r6.www;
    r2.x = ps;
    r0.w = saturate(r14.w * r2.y - 0.5);
    r13.xyz = r14.xyz * r2.yyy - r9.xyz;
    r1.z = r13.w * r0.w - 2.0;
    r3.xyz = r13.xyz * r0.www + r9.xyz;
    ps = -SpotAngles.x - -r0.z;
    r9.xz = r2.xz * r2.xw;
    r0.x = ps;
    r2.xyz = r9.zzz * r12.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r0.x;
    r3.xyz = r3.xyz * r11.xyz;
    r9.y = saturate(ps);
    r6.z = r4.w * 2.0 + r1.z;
    r6.xy = r10.xy * r0.ww + r6.xy;
    r6.xyw = r6.xyz * r1.yyy;
    ps = r9.x * r9.x;
    r6.z = r6.w + 1.0;
    r1.z = ps;
    r6.xyz = (r1.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r1.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.y * r9.y;
    r0.z = dot(r6.zxy, r6.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r1.xyz = r1.zzz * r8.xyz;
    r0.z = ps;
    r6.xyz = r6.xyz * r0.zzz;
    r0.z = dot(r6.zxy, r7.zxy);
    r8.xyz = r6.xyz * r0.zzz;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r0.z = saturate(dot(r5.zxy, r7.zxy));
    ps = log2(r0.z);
    r1.xyz = r1.xyz * r0.www;
    r0.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.w = r0.z * 15.0;
    r0.y = ps;
    ps = pow(2.0, r0.w);
    r0.z = saturate(dot(r6.zyx, r5.zyx));
    r0.w = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.www;
    r0.y = ps;
    r1.xy = r3.xy * r0.zz + r1.xy;
    r1.z = r3.z * r0.z + r1.z;
    r0.yzw = r1.xyz * r0.yyy;
    r0.yzw = r0.yzw * r4.xyz;
    r0.yzw = r0.yzw * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.ywz * r0.xxx;
    r0.xyz = r0.xzy * r2.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
