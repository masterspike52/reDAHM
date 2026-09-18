// ps_23fa799c3bc890d4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 426 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006A8 10041400 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r5 = In.color0;
    float4 r6 = In.color1;
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

    r10 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r10.w;
    r7.xy = r0.wz * 6.0;
    r6.w = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r11.x = ps;
    r7.xyw = tex2D(Texture2D_2, r7.xy).xyw;
    ps = r2.w;
    r13.xy = r0.wz * UniformVector_7.xy;
    ps = (-4e+02) + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r7.z = ps;
    r11.zw = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r11.y = saturate(r7.z * 0.00022222222);
    r6.w = ps;
    ps = -r0.z;
    r9.xyz = r6.www * r3.xyz;
    ps = 1.0 + ps;
    r12.xzw = r11.yzw * float3(-0.025, 0.5, 0.5);
    r6.w = ps;
    ps = UniformVector_2.y * r6.w;
    r11.zw = r9.xy * r12.xx;
    r11.y = ps;
    ps = r0.w;
    r3.yz = r11.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r19.xy = float2((r11.xy >= 0.5));
    r3.x = ps;
    ps = r0.z;
    r3.yz = r3.yz - r11.xy;
    ps = UniformVector_1.y * ps;
    r3.zw = r3.yz * r19.xy;
    r3.y = ps;
    r11 = r11.zxyw + r3.xzwy;
    r3.xy = r11.yz + r11.yz;
    r20 = tex2D(Texture2D_1, r3.xy);
    r3.xyw = tex2D(Texture2D_6, r13.xy).yzx;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r14.xyw = tex2D(Texture2D_0, r11.xw).xyz;
    r13.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r7.xyz = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r1.zxy, r1.zxy);
    r13.x = ps;
    r5 = r5.yxzw * 2.0 - 1.0;
    r19.z = r7.w * r13.w - 1.0;
    r13.zw = r13.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r5.zyx, r5.zyx);
    r13.y = ps;
    r18.xyz = r14.xyw * 2.0 - 1.0;
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r16.xyz = r15.xyz * UniformVector_4.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r16.z = -r18.z + r16.z;
    r6.y = ps;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = dot(r7.zxy, r7.zxy);
    r14.xyz = r15.xyz * r10.xyz;
    r17.yzw = r14.xyz * r3.wxy;
    ps = OpacityOverride.x;
    r10.xyz = r6.zzz * r1.xyz;
    r6.z = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r15.xyz = r5.xzy * r6.yyy;
    r6.x = ps;
    ps = r2.w;
    r7.xyz = r7.xzy * r6.xxx;
    ps = 0.0001 * ps;
    r1.xyz = r15.yzx * r7.zyx;
    r6.x = saturate(ps);
    r1.xyz = r15.xyz * r7.yxz - r1.xyz;
    ps = r9.z;
    r10.w = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r12.x = ps;
    r6.w = (r10.w == 0.0) ? r20.x : r20.y;
    ps = 0.0;
    r5.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r12.y = ps;
    ps = 5.0 * r5.x;
    r19.xy = r13.zw + r12.zw;
    r6.y = saturate(ps);
    r6.w = (r5.z == 0.0) ? r20.z : r6.w;
    r12.w = (r5.y == 0.0) ? r20.w : r6.w;
    ps = max(r12.x, r12.y);
    r6.xyz = -r6.zxy + 1.0;
    r12.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.w = max(r12.w, 0.0);
    r12.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.y = min(r6.w, 0.3);
    r12.z = ps;
    ps = 3.3333333 * r5.y;
    r1.xyw = r1.xyz * r5.www;
    r5.x = ps;
    r1.z = r5.x * r19.z + 1.0;
    r5.yz = r5.xx * r19.xy + r16.xy;
    r12 = -r12.wxyz + 1.0;
    ps = r12.x;
    r6.w = dot(r1.wxy, r1.wxy);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r16.xy = r5.yz - r18.xy;
    r17.x = ps;
    r7.w = saturate(r17.x * r1.z - 0.5);
    r5.xy = r16.xy * r7.ww + r18.xy;
    r5.z = r16.z * r7.w - 2.0;
    r5.z = r14.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r6.yyy;
    ps = 1.0 + r5.x;
    r8.xy = r13.xy * abs(r8.xy);
    r5.w = ps;
    r5.xyz = (r6.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r13.xyz = r1.xwy * r6.www;
    r5.x = ps;
    r1.xyw = r5.yzw * r5.xxx;
    r5.x = dot(r1.wxy, r9.zxy);
    r5.xyz = r1.xwy * r5.xxx;
    r9.xyz = r5.xyz * 2.0 - r9.xzy;
    r5.xyz = r15.zxy * r9.yyy;
    r5.xyz = r13.xzy * r9.zzz + r5.xyz;
    r5.xyw = r7.yzx * r9.xxx + r5.zyx;
    r7.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r7.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r6.w = ps;
    r7.xy = r5.yx * r6.ww + 1.5;
    r11.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    r16.xyz = tex2D(Texture2D_7, r11.xw).xyz;
    r15.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    ps = UniformScalar_7.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.y = dot(r4.zxy, r4.zxy);
    r18.x = ps;
    r0.xyz = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r5.y));
    r13.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r5.w = ps;
    ps = pow(2.0, r5.z);
    r5.y = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r4.yzw = r5.www * r4.xyz;
    r18.y = ps;
    r14.xyz = r14.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = UniformVector_5.z * UniformVector_5.w;
    r19.xyz = r5.yyy - r15.xyz;
    r18.z = ps;
    r15.xyz = r19.xyz * UniformScalar_4.xxx + r15.xyz;
    ps = log2(abs(r12.y));
    r15.xyz = r18.xyz * r15.xyz;
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r6.x = float((r6.x >= 0.004));
    r5.y = ps;
    r6.yzw = r17.yzw * r1.zzz - r16.xyz;
    ps = pow(2.0, r5.y);
    r4.x = abs(r1.z) * abs(r1.z);
    r5.y = ps;
    r5.y = r5.y * UniformScalar_3.x + UniformScalar_2.x;
    r3.xyz = r6.yzw * r7.www + r16.xyz;
    r6.yzw = r15.xyz * r5.yyy;
    ps = UniformScalar_8.x * r5.z;
    r14.xyz = r6.yzw * r14.xyz;
    r14.w = ps;
    ps = r3.x;
    r14 = r14 * r3.wwww;
    ps = r7.x * ps;
    r5 = r14 * r5.xxxx;
    r7.x = ps;
    r6.yzw = r5.xyz * r7.www + UniformVector_0.xyz;
    r6.yzw = r13.xyz * r3.xyz + r6.yzw;
    ps = r3.y;
    r11.x = dot(r4.wyz, r1.wxy);
    ps = r7.y * ps;
    r11 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.y = ps;
    r4.yz = r11.zw * r12.zw + 0.125;
    ps = r3.z;
    r3.xy = r11.xy + 0.5;
    ps = r7.z * ps;
    r0.w = saturate(dot(r10.zxy, r9.yxz));
    r7.z = ps;
    ps = log2(r0.w);
    r5.yz = abs(r3.xy) * abs(r3.xy);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r1.xyz = r0.xyz + r5.www;
    r5.w = ps;
    ps = r4.x * r4.x;
    r0.xyz = r7.xzy * r5.yyy;
    r0.w = ps;
    ps = r4.y * r4.z;
    r3.xyz = r7.xzy * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r0.w = r0.w * r0.w;
    r5.w = ps;
    r6.yzw = r3.xyz * UpperSkyColor.xzy + r6.ywz;
    r6.yzw = r0.xzy * LowerSkyColor.xyz + r6.ywz;
    ps = ConstantLighting.x * r5.w;
    r0.xyz = r1.www * ConstantLighting.xyz;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r1.xyz = r0.www * r1.xyz;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r1.xyz = r1.xzy * r7.www;
    r3.z = ps;
    r6.yzw = r3.xyz * r1.xyz + r6.ywz;
    r6.yzw = r0.xyz * r7.xyz + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.yzw * r5.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xyz - r5.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.x + r2.w;
    r5.xyz = r7.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
