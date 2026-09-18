// ps_c6a07fda2c532a50.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041300 0000080A 00000000 00007108 003F00FF 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c26); // float4
float4 ConstantLighting : register(c27); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c25); // float3
float4 ModShadowAccumResolution : register(c30); // float2
float4 ModShadowColor : register(c28); // float3
float4 ModShadowGroupColor : register(c29); // float3
float4 OpacityOverride : register(c23); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c13); // float
float4 UniformScalar_11 : register(c21); // float
float4 UniformScalar_12 : register(c22); // float
float4 UniformScalar_2 : register(c14); // float
float4 UniformScalar_3 : register(c15); // float
float4 UniformScalar_4 : register(c16); // float
float4 UniformScalar_5 : register(c17); // float
float4 UniformScalar_6 : register(c18); // float
float4 UniformScalar_7 : register(c19); // float
float4 UniformScalar_8 : register(c20); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UniformVector_7 : register(c12); // float4
float4 UpperSkyColor : register(c24); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
samplerCUBE TextureCube_0 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color1;
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

    r11 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r11.w;
    r0.zw = r1.xy * 6.0;
    r7.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r10.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r9.x = r1.x * UniformVector_2.x;
    ps = r3.w;
    r1.zw = r1.xy * UniformVector_7.xy;
    ps = (-4e+02) + ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    r9.zw = r10.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r9.y = saturate(r0.z * 0.00022222222);
    r7.w = ps;
    ps = -r1.y;
    r10.xyz = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r19.xyz = r9.zwy * float3(0.5, 0.5, -0.025);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r9.zw = r10.xy * r19.zz;
    r9.y = ps;
    ps = r1.x;
    r4.yz = r9.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r0.zw = float2((r9.xy >= 0.5));
    r4.x = ps;
    ps = r1.y;
    r4.yz = r4.yz - r9.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r4.yz * r0.zw;
    r4.y = ps;
    r12 = r9.zxyw + r4.xzwy;
    r4.xy = r12.yz + r12.yz;
    r9 = tex2D(Texture2D_1, r4.xy);
    r4.xyw = tex2D(Texture2D_6, r1.zw).yzx;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r14.xyw = tex2D(Texture2D_0, r12.xw).xyz;
    r13.yzw = tex2D(Texture2D_2, r1.xy).xyw;
    r1.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    r6 = r6.yxzw * 2.0 - 1.0;
    r19.z = r10.w * r13.w - 1.0;
    r13.zw = r13.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r6.zyx, r6.zyx);
    r13.y = ps;
    r18.xyz = r14.xyw * 2.0 - 1.0;
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r16.xyz = r15.xyz * UniformVector_4.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r7.x));
    r16.z = -r18.z + r16.z;
    r7.y = ps;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r7.x = dot(r1.zxy, r1.zxy);
    r14.xyz = r15.xyz * r11.xyz;
    r17.yzw = r14.xyz * r4.wxy;
    ps = OpacityOverride.x;
    r11.xyz = r7.zzz * r2.xyz;
    r7.z = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r15.xyz = r6.xzy * r7.yyy;
    r7.x = ps;
    ps = r3.w;
    r2.xyz = r1.xzy * r7.xxx;
    ps = 0.0001 * ps;
    r1.xyz = r15.yzx * r2.zyx;
    r7.x = saturate(ps);
    r1.xyz = r15.xyz * r2.yxz - r1.xyz;
    ps = r10.z;
    r11.w = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r7.w = (r11.w == 0.0) ? r9.x : r9.y;
    ps = 0.0;
    r6.xyz = r11.zww + float3(0.1, -3.0, -2.0);
    r0.w = ps;
    ps = 5.0 * r6.x;
    r19.xy = r13.zw + r19.xy;
    r7.y = saturate(ps);
    r7.w = (r6.z == 0.0) ? r9.z : r7.w;
    r9.w = (r6.y == 0.0) ? r9.w : r7.w;
    ps = max(r0.z, r0.w);
    r7.xyz = -r7.zxy + 1.0;
    r9.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r7.w = max(r9.w, 0.0);
    r9.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.y = min(r7.w, 0.3);
    r9.z = ps;
    ps = 3.3333333 * r6.y;
    r1.xyw = r1.xyz * r6.www;
    r6.x = ps;
    r1.z = r6.x * r19.z + 1.0;
    r6.yz = r6.xx * r19.xy + r16.xy;
    r9 = -r9.wyzx + 1.0;
    ps = r9.x;
    r7.w = dot(r1.wxy, r1.wxy);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r16.xy = r6.yz - r18.xy;
    r17.x = ps;
    r0.w = saturate(r17.x * r1.z - 0.5);
    r6.xy = r16.xy * r0.ww + r18.xy;
    r6.z = r16.z * r0.w - 2.0;
    r6.z = r14.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r8.xy = r13.xy * abs(r8.xy);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r1.xwy * r7.www;
    r6.x = ps;
    r1.xyw = r6.wzy * r6.xxx;
    r6.x = dot(r1.xwy, r10.zxy);
    r6.xyz = r1.wxy * r6.xxx;
    r10.xyz = r6.xyz * 2.0 - r10.xzy;
    r6.xyz = r15.zxy * r10.yyy;
    r6.xyz = r13.xzy * r10.zzz + r6.xyz;
    r6.xyw = r2.yzx * r10.xxx + r6.zyx;
    r2.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r2.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r2.z = r6.w;
    r7.w = ps;
    r2.xy = r6.yx * r7.ww + 1.5;
    r12.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r6.x = tex2D(Texture2D_4, r0.xy).x;
    r16.xyz = tex2D(Texture2D_7, r12.xw).xyz;
    r15.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r2.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    ps = UniformScalar_7.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r6.y = dot(r5.zxy, r5.zxy);
    r18.x = ps;
    r2.xyz = r2.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r6.y));
    r13.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r6.w = ps;
    ps = pow(2.0, r6.z);
    r6.y = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.xyz = r6.www * r5.xyz;
    r18.y = ps;
    r14.xyz = r14.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = UniformVector_5.z * UniformVector_5.w;
    r19.xyz = r6.yyy - r15.xyz;
    r18.z = ps;
    r15.xyz = r19.xyz * UniformScalar_4.xxx + r15.xyz;
    ps = log2(abs(r9.w));
    r15.xyz = r18.xyz * r15.xyz;
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r7.x = float((r7.x >= 0.004));
    r6.y = ps;
    r7.yzw = r17.yzw * r1.zzz - r16.xyz;
    ps = pow(2.0, r6.y);
    r9.x = abs(r1.z) * abs(r1.z);
    r6.y = ps;
    r6.y = r6.y * UniformScalar_3.x + UniformScalar_2.x;
    r4.xyz = r7.yzw * r0.www + r16.xyz;
    r7.yzw = r15.xyz * r6.yyy;
    ps = UniformScalar_8.x * r6.z;
    r14.xyz = r7.yzw * r14.xyz;
    r14.w = ps;
    ps = r4.x;
    r14 = r14 * r4.wwww;
    ps = r0.x * ps;
    r6 = r14 * r6.xxxx;
    r0.x = ps;
    r7.yzw = r6.xyz * r0.www + UniformVector_0.xyz;
    r7.yzw = r13.xyz * r4.xyz + r7.yzw;
    ps = r4.y;
    r12.x = dot(r5.zxy, r1.xwy);
    ps = r0.y * ps;
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r0.y = ps;
    r9.yz = r5.zw * r9.yz + 0.125;
    ps = r4.z;
    r4.xy = r5.xy + 0.5;
    ps = r0.z * ps;
    r1.z = saturate(dot(r11.zxy, r10.yxz));
    r0.z = ps;
    ps = log2(r1.z);
    r6.yz = abs(r4.xy) * abs(r4.xy);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r2.xyz = r2.xyz + r6.www;
    r6.w = ps;
    ps = r9.x * r9.x;
    r4.xyz = r0.xzy * r6.yyy;
    r1.z = ps;
    ps = r9.y * r9.z;
    r5.xyz = r0.xzy * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.w = r1.z * r1.z;
    r6.w = ps;
    r7.yzw = r5.xyz * UpperSkyColor.xzy + r7.ywz;
    r7.yzw = r4.xzy * LowerSkyColor.xyz + r7.ywz;
    ps = ConstantLighting.x * r6.w;
    r1.xyz = r1.xxx * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r6.w;
    r2.xyz = r1.www * r2.xyz;
    r4.y = ps;
    ps = ConstantLighting.y * r6.w;
    r2.xyz = r2.xzy * r0.www;
    r4.z = ps;
    r7.yzw = r4.xyz * r2.xyz + r7.ywz;
    r7.yzw = r1.xyz * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
