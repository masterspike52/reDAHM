// ps_1f2a7dbc5a6f6b6f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 360 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005A0 10041400 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c26); // float4
float4 LowerSkyColor : register(c25); // float3
float4 ModShadowAccumResolution : register(c29); // float2
float4 ModShadowColor : register(c27); // float3
float4 ModShadowGroupColor : register(c28); // float3
float4 OpacityOverride : register(c23); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_15 : register(c14); // float
float4 UniformScalar_16 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_21 : register(c19); // float
float4 UniformScalar_22 : register(c20); // float
float4 UniformScalar_23 : register(c21); // float
float4 UniformScalar_24 : register(c22); // float
float4 UniformScalar_3 : register(c12); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UpperSkyColor : register(c24); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r0.xy).yzx;
    r19.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_1, r0.xy).yxz;
    r15.xyz = UniformVector_7.xyz - UniformVector_6.xyz;
    ps = UniformVector_2.x * UniformVector_2.x;
    r0.xyz = UniformVector_3.xyz - UniformVector_4.xyz;
    r11.x = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r7.yzw = UniformVector_4.xyz - UniformVector_5.xyz;
    r11.y = ps;
    ps = UniformScalar_22.x;
    r7.x = dot(r2.zxy, r2.zxy);
    ps = -UniformScalar_21.x + ps;
    r17.xyz = r19.xyz * UniformScalar_17.xxx;
    r12.w = ps;
    ps = r6.w + r6.w;
    r6.x = dot(r10.ywx, float3(1.0, 1.0, 1.0));
    r13.w = ps;
    ps = 4.0 * r6.z;
    r16.xyz = r9.xyz + r9.xyz;
    r20.z = ps;
    ps = 4.0 * r6.y;
    r6.z = dot(r19.yzx, float3(0.59, 0.11, 0.3));
    r20.w = ps;
    ps = rsqrt(abs(r7.x));
    r12.xyz = r12.xyz + r12.xyz;
    r6.w = ps;
    r14.xyz = r12.xyz * 0.7 + 0.3;
    ps = 5.0 * r6.z;
    r7.x = dot(r19.yxz, float3(0.59, 0.3, 0.11));
    r6.y = ps;
    ps = 1.0 * r6.z;
    r13.xyz = r6.www * r2.xyz;
    r6.w = ps;
    ps = UniformScalar_19.x;
    r20.xy = r6.wy * UniformScalar_15.xx;
    r18.xyz = r20.yyy * r7.yzw + UniformVector_5.xyz;
    ps = r7.x + ps;
    r6.yw = r13.zw + float2(0.1, -1.0);
    r6.z = ps;
    ps = frac(r6.z);
    r7.w = float((r20.x >= 0.2));
    r16.w = ps;
    ps = 5.0 * r6.y;
    r2 = r16 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.z = saturate(ps);
    ps = abs(r2.w) + abs(r2.w);
    r7.xyz = r20.xzw + float3(-0.2, -2.0, -2.0);
    r9.w = ps;
    ps = 1.25 * r7.x;
    r0.w = float((r20.x > 0.2));
    r10.z = ps;
    ps = r6.w;
    r11.zw = -r2.xy - 2.0;
    ps = -r2.z + ps;
    r16.zw = r7.yz - r2.xy;
    r17.w = ps;
    r0.xyz = r10.zzz * r0.xyz + UniformVector_4.xyz;
    r15.xyz = r15.xyz * r9.www + UniformVector_6.xyz;
    ps = 1.0 - r6.x;
    r16.xy = r11.zw + r20.zw;
    r7.y = ps;
    ps = 1.0 - r6.z;
    r15.xyz = r15.xyz * UniformScalar_20.xxx;
    r7.z = ps;
    r6.xyz = (r0.www > 0.0) ? r0.xyz : UniformVector_4.xyz;
    ps = UniformScalar_23.x * r7.y;
    r0.xyz = r7.yyy * r19.xyz;
    r9.w = ps;
    r12.xyz = r0.xyz * r12.xyz - r0.xyz;
    r6.yzw = (r7.www > 0.0) ? r6.xyz : r18.xyz;
    r2 = r16 * UniformScalar_0.xxxx + r2.xyxy;
    ps = UniformScalar_16.x * r6.y;
    r15.yzw = r15.xzy * r10.yyy;
    r15.x = ps;
    ps = UniformScalar_16.x * r6.z;
    r16.xyz = r15.yzw * r10.yyy;
    r15.y = ps;
    r10.xyz = r17.xyz * r10.xxx + r16.xzy;
    r0.xyz = r12.xyz * UniformScalar_0.xxx + r0.xyz;
    r6.x = r12.w * UniformScalar_0.x + UniformScalar_21.x;
    ps = UniformScalar_16.x * r6.w;
    r12.yzw = r0.xyz * r6.xxx;
    r15.z = ps;
    r10.xyz = r15.xzy * r10.www + r10.xzy;
    r17.xyz = r14.xzy * r10.xyz - r10.xyz;
    r6.x = r17.w * UniformScalar_0.x - 2.0;
    ps = r2.z;
    r12.x = r6.x + r9.z;
    ps = r7.y * ps;
    r9 = r12.xywz + r9.zwww;
    r7.x = ps;
    r7.w = r9.x * r7.y + 1.0;
    r12.xy = r11.xy * r7.yw;
    r6 = r7.xywy * UniformVector_2.xxzy;
    r12.z = r12.x * r2.z;
    ps = r6.z * r6.z;
    r15.xyz = r6.yww * r2.xyw;
    r2.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.y = r15.z * r15.z;
    r2.x = ps;
    r11.x = r12.z * r7.x + r11.y;
    r2.z = dot(r12.yz, r7.wx) + 0.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yw = r11.yx + r2.zy;
    r2.y = ps;
    ps = rsqrt(abs(r6.y));
    r11.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.y = dot(r4.zxy, r4.zxy);
    r11.w = ps;
    ps = r15.z;
    r11.xy = r2.xy * abs(r8.xy);
    ps = r11.w * ps;
    r16.xyz = r6.zxz * r11.zww;
    r16.w = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r16.zyw, r16.zyw);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r14.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    r2.xyz = r16.ywz * r6.xxx;
    r6.x = dot(r2.zxy, r14.zxy);
    r6.xyz = r2.xzy * r6.xxx;
    r8.xyz = r6.xzy * 2.0 - r14.xyz;
    r6 = xe_cube(r8.xyz);
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r0.w = ps;
    r4.xy = r6.yx * r0.ww + 1.5;
    r12.yz = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    ps = OpacityOverride.x;
    r12.x = max(UniformScalar_24.x, 0.0001);
    r6.w = saturate(ps);
    ps = -ModShadowColor.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r2.w = dot(r5.zxy, r5.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r2.w));
    r0.w = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r2.w = ps;
    ps = -ModShadowColor.y;
    r5.xyz = r2.www * r5.xyz;
    ps = 1.0 + ps;
    r18.xyz = r0.www - r4.xyz;
    r11.y = ps;
    r4.xyz = r18.xyz * 0.8 + r4.xyz;
    ps = -ModShadowColor.z;
    r0.xyz = r0.xyz * r6.xyz;
    r10.xyz = r17.xyz * UniformScalar_0.xxx + r10.xyz;
    ps = 1.0 + ps;
    r15.xy = r15.xy * r11.zz;
    r11.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r15.z = r16.x;
    r6.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.z = dot(r15.xyz, r14.xyz);
    r6.y = ps;
    ps = r2.z;
    r6.z = max(r6.z, 0.0);
    ps = r1.x * ps;
    r12.w = dot(r5.zxy, r2.zxy);
    r2.x = ps;
    ps = r2.z;
    r6 = -r6.xzyw + 1.0;
    ps = r1.y * ps;
    r6.w = float((r6.w >= 0.004));
    r2.y = ps;
    ps = log2(abs(r6.y));
    r5 = r12.yzww * float4(0.875, 0.875, -0.5, 0.5);
    r6.y = ps;
    r12.yz = r5.xy * r6.xz + 0.125;
    ps = UniformScalar_2.x * r6.y;
    r5.xy = r5.zw + 0.5;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r5.xw = abs(r5.xy) * abs(r5.xy);
    r6.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r6.z = saturate(dot(r13.zxy, r8.zxy));
    r6.x = ps;
    ps = log2(r6.z);
    r5.xyz = r0.xzy * r5.xxx;
    r12.w = ps;
    ps = r12.x * r12.w;
    r8.xyz = r0.xzy * r5.www;
    r0.w = ps;
    ps = r12.y * r12.z;
    r4.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    r6.xyz = r6.xxx * r11.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r7.xyz = r4.xzy * r7.yyy;
    r7.w = ps;
    ps = r2.z;
    r4.xyz = r7.www * r1.xzy;
    r7.xyz = r7.xyz * UniformScalar_4.xxx + r10.xyz;
    ps = r1.z * ps;
    r7.xyz = r7.xzy + UniformVector_0.xyz;
    r2.z = ps;
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r8.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r4.xyz * r9.yzw + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
