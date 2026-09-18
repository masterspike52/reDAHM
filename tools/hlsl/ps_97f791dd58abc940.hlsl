// ps_97f791dd58abc940.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 447 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006FC 10041600 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 ConstantLighting : register(c21); // float3
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c18); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy * UniformVector_3.xy;
    r9 = tex2D(Texture2D_8, r0.zw);
    ps = (-0.5) + r9.w;
    r1.zw = r1.xy * 6.0;
    r7.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r7.xyw = tex2D(Texture2D_2, r1.zw).xyw;
    ps = r3.w;
    r1.zw = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r7.z = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    r8.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r8.x = saturate(r8.x * 0.00022222222);
    r7.z = ps;
    r15.xyz = r7.zzz * r4.xyz;
    r12.xyz = r8.xyz * float3(-0.025, 0.5, 0.5);
    r1.zw = r15.xy * r12.xx + r1.zw;
    r21.x = tex2D(Texture2D_4, r0.zw).x;
    r8.xyw = tex2D(Texture2D_0, r1.zw).xyz;
    r4.yzw = tex2D(Texture2D_3, r0.zw).xyz;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r13.x = r1.x * UniformVector_2.x;
    r4.x = ps;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r0.z = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r22.x = -r1.y + 1.0;
    r0.z = ps;
    r4.yzw = r4.zyw * 2.0 + float3(0.0, 0.0, -2.0);
    r0.w = (-abs(r0.w) >= 0.0) ? 1.0 : (-1.0);
    r21.w = (-abs(r4.x) >= 0.0) ? (-1.0) : r0.w;
    r7.xyz = r0.zzz * r2.xyz;
    ps = 1.0 / UniformVector_1.y;
    r0.w = r7.z + 0.1;
    r0.z = ps;
    ps = 5.0 * r0.w;
    r10.xyz = r8.wxy + r8.wxy;
    r2.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.y = r1.w * r0.z;
    r0.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r22.yw = -r2.yx + 1.0;
    r22.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r22.xyz * UniformVector_2.yyx;
    r0.w = ps;
    ps = r13.w;
    r0.zw = r0.zw * abs(r6.xy);
    ps = r1.z * ps;
    r2.xyz = r13.zxy - 0.5;
    r10.w = ps;
    ps = OpacityOverride.x;
    r21.y = float((r10.w >= 0.5));
    r21.z = saturate(ps);
    ps = (-1.0) + r4.z;
    r11.yzw = float3((r13.xyz >= 0.5));
    r6.y = ps;
    ps = (-1.0) + r4.y;
    r2.xyz = r2.yzx - r13.xyz;
    r6.z = ps;
    ps = r6.y;
    r14 = r10 + float4(-1.0, -1.0, -1.0, -0.5);
    r2.yzw = r2.zxy * r11.wyz + r13.zxy;
    ps = r21.w * ps;
    r6.w = r14.w - r10.w;
    r6.x = ps;
    r8.xyz = r6.xzw * r21.xxy;
    r2.x = r10.w + r8.z;
    r6 = r2.zwxy + r2.zwxy;
    r10.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r13 = tex2D(Texture2D_1, r6.xy);
    r2.xyz = tex2D(Texture2D_2, r1.xy).wxy;
    ps = r0.y;
    r4.x = UniformScalar_4.x * UniformScalar_3.x;
    r0.zw = r2.yz * 2.0 - 1.0;
    ps = UniformScalar_8.x + ps;
    r0.y = r21.w * UniformScalar_3.x;
    r10.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r1.xy = r1.xy * UniformVector_5.xy;
    r11.x = ps;
    r16.z = r11.w * 2.0 + r21.y;
    ps = r0.z;
    r16.y = dot(r11.yzz, float3(1.0, 1.0, 1.0));
    r0.z = (r16.y == 0.0) ? r13.x : r13.y;
    ps = r12.y + ps;
    r11.yz = r4.xw * r21.wx;
    r4.x = ps;
    ps = r0.w;
    r20 = r16.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r0.z = (r20.y == 0.0) ? r13.z : r0.z;
    r0.w = (r20.x == 0.0) ? r13.w : r0.z;
    ps = r12.z + ps;
    r0.z = max(r0.w, 0.0);
    r4.y = ps;
    ps = floor(r11.x);
    r10.x = min(r0.z, 0.3);
    r17.z = ps;
    ps = floor(r11.y);
    r18.xyz = r10.xzw * float3(3.3333333, 0.875, 0.875);
    r17.w = ps;
    r4.xy = r18.xx * r4.xy + r8.xy;
    ps = 1.0 / UniformScalar_1.x;
    r17.xy = r4.xy - r14.yz;
    r0.z = ps;
    r10.xz = r17.zw * r0.zz + r0.xx;
    r8.xyz = tex2D(Texture2D_6, r1.zw).xyz;
    r19 = tex2D(Texture2D_1, r6.zw);
    r6.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r4 = tex2D(Texture2D_5, r10.xy);
    r1.x = tex2D(Texture2D_5, r10.zy).w;
    r0.x = dot(r5.zxy, r5.zxy);
    r10.xyz = UniformVector_4.xyz * 2e+01;
    r0.y = float((UniformScalar_11.x >= 1.0));
    r0.z = float((UniformScalar_11.x > 1.0));
    r1.xyz = r4.xyz * r1.xxx;
    r6.xyz = (-abs(r0.zzz) >= 0.0) ? r6.xyz : 1.0;
    r12.xyz = (-abs(r0.yyy) >= 0.0) ? 1.0 : r6.xyz;
    r1.xyz = r10.xyz * r1.xyz;
    ps = rsqrt(abs(r0.x));
    r13.xyz = r1.xzy * r21.xxx;
    r1.x = ps;
    r2.yzw = -ModShadowColor.xyz + 1.0;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r0.xyz = r4.xyz * r4.www;
    ps = r3.w;
    r1.yzw = r9.xyz * UniformScalar_12.xxx;
    ps = 0.0001 * ps;
    r4.xyz = r1.xxx * r5.xyz;
    r1.x = saturate(ps);
    ps = r7.w;
    r0.xyz = r10.xyz * r0.xyz;
    ps = r2.x * ps;
    r10.xyz = r0.xzy * r21.xxx;
    r0.y = ps;
    r5.xyz = r1.yzw * r12.xyz + UniformScalar_13.xxx;
    ps = (-1.0) - -r0.y;
    r1.yw = r22.ww * ModShadowGroupColor.yx;
    r16.x = ps;
    r1.z = (r16.z == 0.0) ? r19.x : r19.y;
    ps = 1.0 - r1.x;
    r0.xz = -r21.xz + 1.0;
    r16.w = ps;
    ps = 1.0 - r1.y;
    r5.xyz = r5.xyz * r0.xxx;
    r16.y = ps;
    r1.x = (r20.z == 0.0) ? r19.z : r1.z;
    r15.w = (r20.w == 0.0) ? r19.w : r1.x;
    ps = 1.0 - r1.w;
    r1.x = -r0.w + 1.0;
    r16.z = ps;
    ps = 2.5 * r1.x;
    r2.x = float((r0.z >= 0.004));
    r0.x = ps;
    r1.yzw = r18.xyz * r16.xzy + float3(1.0, 0.125, 0.125);
    r4.w = saturate(r0.x * r1.y - 0.5);
    ps = -r14.x;
    r0.xz = r1.yz * r1.xw;
    r2.yzw = r0.zzz * r2.yzw + ModShadowColor.xyz;
    r1.yz = r17.xy * r4.ww + r14.yz;
    ps = r11.z + ps;
    r5.w = float((r0.x > 0.9));
    r0.x = ps;
    ps = 1.0 + r0.x;
    r11.xyz = r10.xzy * r5.www;
    r11.w = ps;
    r14.xyz = r12.xzy * r9.xzy + r11.xzy;
    r10.xyz = r11.xyz * r4.www + UniformVector_0.xyz;
    r0.x = r11.w * r4.w - 2.0;
    r1.x = r8.w * 2.0 + r0.x;
    r1.xyz = r1.xyz * r16.www;
    ps = 1.0 + r1.x;
    r11.xyz = r6.yzw * AmbientColorAndSkyFactor.xyz;
    r1.w = ps;
    r0.xzw = (r16.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r16.www >= 0.0) ? r0.xzw : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r5.xyz = r5.xzy * r4.www;
    r0.x = ps;
    r0.xzw = r1.xyz * r0.xxx;
    r1.x = dot(r0.wxz, r15.zxy);
    r1.xyz = r0.xzw * r1.xxx;
    r1.xyz = r1.xyz * 2.0 - r15.xyz;
    r1.y = saturate(dot(r7.zxy, r1.zxy));
    ps = log2(r1.y);
    r1.x = dot(r4.zxy, r0.wxz);
    r1.y = ps;
    r15.xyz = r1.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r15.z);
    r4.xyz = r0.www * ConstantLighting.xyz;
    r0.w = ps;
    r7.xyw = r15.xwy + float3(0.5, 0.25, 0.5);
    r0.x = r7.y + r15.w;
    r0.x = saturate(r0.x - r0.y);
    r8.xyz = r0.xxx * r8.xyz;
    ps = abs(r7.x) * abs(r7.x);
    r0.xyz = r14.xzy - r8.xyz;
    r1.w = ps;
    r1.xyz = r13.xzy * r5.www - r8.xyz;
    r9.xyz = r12.xzy * r9.xzy + r1.xzy;
    r1.xyz = r0.xyz * r4.www + r8.xyz;
    r0.xyz = r11.xzy * r1.xzy + r10.xzy;
    r7.xyz = r9.xzy * r4.www + r8.xyz;
    ps = abs(r7.w) * abs(r7.w);
    r1.xyz = r1.xzy * r6.ywz;
    r4.w = ps;
    ps = ConstantLighting.x * r0.w;
    r8.xyz = r1.xzy * r4.www;
    r6.x = ps;
    ps = ConstantLighting.z * r0.w;
    r7.xyz = r7.xzy * r6.ywz;
    r6.y = ps;
    ps = ConstantLighting.y * r0.w;
    r7.xyz = r7.xzy * r1.www;
    r6.z = ps;
    r0.xyz = r8.xyz * UpperSkyColor.xyz + r0.xzy;
    r0.xyz = r7.xzy * LowerSkyColor.xzy + r0.xzy;
    r0.xyz = r6.xzy * r5.xzy + r0.xzy;
    r0.xyz = r4.xzy * r1.xyz + r0.xzy;
    ps = -r3.w;
    r0.xyz = r0.xzy * r2.yzw;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xzy - r0.xzy;
    r1.w = ps;
    oC0.w = r1.w * r2.x + r3.w;
    r0.xyz = r1.xyz * r2.xxx + r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
