// ps_9ef92f161e843a7a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10040E00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 ConstantLighting : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_3 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c16); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
samplerCUBE TextureCube_0 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    r6.xyz = r6.zxy * 2.0 + float3(-2.0, 0.0, 0.0);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = r6.yzx + float3(-1.0, -1.0, 0.0);
    r9.z = ps;
    r6.xzw = r6.zxy * UniformScalar_0.xxx;
    ps = 1.0 + r6.x;
    r0.z = float((UniformScalar_0.x > UniformScalar_1.x));
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r0.w = dot(r6.yzw, r6.yzw);
    r7.x = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyw = r7.xxx * r3.xyz;
    r0.w = ps;
    ps = r9.y;
    r6.xyw = r6.zwy * r0.www;
    ps = abs(r5.x) * ps;
    r0.w = dot(r6.wxy, r7.wxy);
    r9.x = ps;
    ps = r9.z;
    r8.xyw = r6.yxw * r0.www;
    r8.xyz = r8.xyw * 2.0 - r7.yxw;
    ps = abs(r5.y) * ps;
    r3 = xe_cube(r8.yxz);
    r9.y = ps;
    ps = 1.0 / abs(r3.z);
    r5.z = r3.w;
    r0.w = ps;
    r5.xy = r3.yx * r0.ww + 1.5;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r5.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r3.w = tex2D(Texture2D_4, r0.xy).w;
    r12.xyw = tex2D(Texture2D_2, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r10 = tex2D(Texture2D_5, r0.xy);
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r12.z = max(UniformScalar_9.x, 0.0001);
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r13.xyz = UniformScalar_6.xxx * UniformVector_1.xyz;
    r0.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    ps = r10.w;
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r14.xyz = r12.xyw * r14.xyz;
    r0.x = ps;
    ps = UniformScalar_8.x * r0.y;
    r1.yzw = r0.xxx * r1.xyz;
    r1.x = ps;
    r0.xyz = (-abs(r0.zzz) >= 0.0) ? r12.xyw : r14.xyz;
    r10.xzw = r10.yxz * UniformScalar_7.xxx + r1.xxx;
    r10.zw = r13.xz * r3.ww + r10.zw;
    r3.w = r13.y * r3.w + r10.x;
    r12.xyw = (-abs(r0.www) >= 0.0) ? r12.xyw : r0.xyz;
    ps = OpacityOverride.x;
    r0.x = r1.w + 0.1;
    r0.y = saturate(ps);
    ps = 5.0 * r0.x;
    r0.z = dot(r4.zxy, r4.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r12.xyw = r12.xyw - r5.xyz;
    r0.z = ps;
    r12.xyw = r12.xyw * UniformScalar_0.xxx + r5.xyz;
    r5.xyz = r12.xyw * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = 1.0 - r0.x;
    r4.xyz = r0.zzz * r4.xyz;
    r0.z = ps;
    ps = 1.0 - r0.y;
    r3.xyz = r12.xyw * r3.xyz;
    r0.w = ps;
    r9.x = dot(r4.zxy, r6.wxy);
    r1.x = saturate(r8.w * 2.0 - r7.w);
    r4 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r1.w = saturate(dot(r1.wyz, r8.zyx));
    ps = ModShadowGroupColor.x * r0.z;
    r0.xy = r4.xy + 0.5;
    r1.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.xy = abs(r0.yx) * abs(r0.yx);
    r1.z = ps;
    ps = log2(r1.w);
    r1.xyz = -r1.xyz + 1.0;
    r12.w = ps;
    r12.xy = r4.zw * r1.yz + 0.125;
    ps = log2(abs(r1.x));
    r8.xyz = r3.xzy * r0.yyy;
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r9.xyz = r3.xzy * r0.xxx;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r4.xy = r12.xz * r12.yw;
    r0.x = ps;
    r1.yzw = r4.xxx * r11.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xxx * r7.yxz;
    ps = UniformScalar_5.x * r0.y;
    r1.x = float((r0.w >= 0.004));
    r0.w = ps;
    ps = ConstantLighting.x * r6.w;
    r0.xyz = r0.wxz * r5.xyz;
    r4.x = ps;
    ps = pow(2.0, r4.y);
    r0.yz = r0.yz * UniformScalar_5.xx;
    r0.w = ps;
    ps = r3.w;
    r7.xyz = r0.www * ConstantLighting.xzy;
    ps = r0.y + ps;
    r10.y = r10.w + r0.z;
    r10.x = ps;
    ps = ConstantLighting.y * r6.w;
    r0.yzw = r10.zxy + UniformVector_0.xyz;
    r4.y = ps;
    ps = ConstantLighting.z * r6.w;
    r0.x = r0.y + r0.x;
    r4.z = ps;
    r0.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r0.xzw;
    r0.xyz = r9.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r8.xyz * LowerSkyColor.xzy + r0.xzy;
    r0.xyz = r7.xyz * r5.xzy + r0.xyz;
    r0.xyz = r4.xyz * r3.xyz + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xzy * r1.ywz;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xzy - r0.xzy;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xzy;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
