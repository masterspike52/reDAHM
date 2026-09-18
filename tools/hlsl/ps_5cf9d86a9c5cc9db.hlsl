// ps_5cf9d86a9c5cc9db.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003B4 10041400 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
samplerCUBE TextureCube_0 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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

    r6.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r2.zxy, r2.zxy);
    r9.z = ps;
    r10.xyz = r6.wzy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r2.w = saturate(OpacityOverride.x);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -UniformVector_0.zxy + 1.0;
    r9.y = ps;
    ps = r9.y;
    r6.x = dot(r4.zxy, r4.zxy);
    ps = abs(r8.x) * ps;
    r13.xyz = r6.yyy * r2.xyz;
    r9.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.w = dot(r10.xzy, r10.xzy);
    r6.x = ps;
    ps = r9.z;
    r6.yzw = r6.xxx * r4.zxy;
    ps = abs(r8.y) * ps;
    r2.x = saturate(dot(r6.yzw, r10.xzy));
    r9.y = ps;
    ps = rsqrt(abs(r7.w));
    r6.x = r13.z + 0.1;
    r7.w = ps;
    ps = 5.0 * r6.x;
    r16.xyz = r10.xzy * r7.www;
    r2.z = saturate(ps);
    ps = 1.0 - r2.w;
    r6.x = dot(r16.xyz, r6.yzw);
    r7.w = ps;
    ps = 1.0 - r2.x;
    r4.xyz = r16.yzx * r6.xxx;
    r2.y = ps;
    r8.xzw = r4.xyz * 2.0 - r6.zwy;
    ps = 1.0 - r2.z;
    r6 = xe_cube(r8.xzw);
    r2.w = ps;
    ps = 1.0 / abs(r6.z);
    r10.z = r6.w;
    r2.x = ps;
    r10.xy = r6.yx * r2.xx + 1.5;
    r11.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r2.z = tex2D(Texture2D_9, r0.xy).x;
    r6.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r20.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r19.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r12 = tex2D(Texture2D_1, r0.xy);
    r15.yzw = tex2D(Texture2D_2, r2.yy).xyz;
    r18.xyw = texCUBE(TextureCube_0, xe_cube_dir(r10.xyz)).yzx;
    r10.xyz = tex2D(Texture2D_8, r0.xy).yzx;
    r0.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r5.zxy, r5.zxy);
    r14.xy = r0.yz * 0.875;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r2.xy = r18.xy * r10.xy;
    r10.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r17 = r12.wyzw * r15.zzww;
    r10.y = ps;
    r0.yzw = r20.xzy * float3(2e+01, 22.0, 2e+01) + r19.xzy;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r6.x = r10.z * 0.7;
    r10.z = ps;
    ps = r6.x;
    r18.xyz = r6.yzw * UniformScalar_3.xxx;
    r6.yw = r18.xz * UniformVector_1.xz + r0.yz;
    ps = r18.w * ps;
    r6.xz = r17.wx * 1.5e+02;
    r17.x = ps;
    r0.y = r18.y * UniformVector_1.y + r0.w;
    ps = r0.y;
    r12.yz = r17.yz * 2e+01;
    ps = r6.z + ps;
    r6.x = r6.w + r6.x;
    r6.z = ps;
    ps = rsqrt(abs(r0.x));
    r17.yzw = r2.xyz * float3(0.65, 0.5, 1e+01);
    r0.x = ps;
    ps = r17.w;
    r0.xyz = r0.xxx * r5.xyz;
    r5.x = ps;
    ps = 0.0001;
    r2.xyz = r16.xxx * r1.xyz;
    r5.y = ps;
    ps = max(r5.x, r5.y);
    r4.xyz = r17.xyz + r4.xyz;
    r5.z = ps;
    ps = r6.y;
    r15.x = dot(r0.zxy, r16.xyz);
    r6.y = ps;
    ps = UniformVector_0.x + r6.y;
    r0 = r15.xxyy * float4(-0.5, 0.5, 1.5e+02, 2e+01);
    r8.y = ps;
    r5.xy = -r2.ww * ModShadowGroupColor.xy + 1.0;
    r5.xy = r14.xy * r5.xy + 0.125;
    ps = UniformVector_0.y + r6.z;
    r4.w = saturate(dot(r13.zxy, r8.wxz));
    r8.z = ps;
    ps = UniformVector_0.z + r6.x;
    r0.xy = r0.xy + 0.5;
    r8.w = ps;
    ps = abs(r0.x) * abs(r0.x);
    r12.xw = r0.wz * r12.xw;
    r2.w = ps;
    ps = abs(r0.y) * abs(r0.y);
    r8.x = r8.y + r12.w;
    r0.w = ps;
    ps = log2(r4.w);
    r0.xyz = r12.xyz + r11.xyz;
    r5.w = ps;
    r8.xyz = r10.xzy * r0.xzy + r8.xwz;
    ps = r5.x * r5.y;
    r6.w = float((r7.w >= 0.004));
    r6.x = ps;
    ps = r5.z * r5.w;
    r0.xyz = r0.xyz * r7.yzx;
    r7.w = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r0.xzy * r2.www;
    ps = pow(2.0, r7.w);
    r7.xyz = r0.xzy * r0.www;
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r8.xyz;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r4.xzy + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
