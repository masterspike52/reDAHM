// ps_de2441e9677be0fc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041600 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c26); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c25); // float3
float4 ModShadowAccumResolution : register(c29); // float2
float4 ModShadowColor : register(c27); // float3
float4 ModShadowGroupColor : register(c28); // float3
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
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
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

    r12 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r12.w;
    r8.xy = r0.wz * 6.0;
    r7.w = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.wwww)) clip(-1.0);
    r13.x = ps;
    r8.xyz = tex2D(Texture2D_2, r8.xy).xyw;
    ps = r3.w;
    r14.xy = r0.wz * UniformVector_7.xy;
    ps = (-4e+02) + ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r8.w = ps;
    r10.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r10.x = saturate(r8.w * 0.00022222222);
    r7.w = ps;
    ps = -r0.z;
    r11.xyz = r7.www * r4.xyz;
    ps = 1.0 + ps;
    r10.xzw = r10.xyz * float3(-0.025, 0.5, 0.5);
    r7.w = ps;
    ps = UniformVector_2.y * r7.w;
    r13.zw = r11.xy * r10.xx;
    r13.y = ps;
    ps = r0.w;
    r4.yz = r13.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r20.xy = float2((r13.xy >= 0.5));
    r4.x = ps;
    ps = r0.z;
    r4.yz = r4.yz - r13.xy;
    ps = UniformVector_1.y * ps;
    r4.zw = r4.yz * r20.xy;
    r4.y = ps;
    r13 = r13.zxyw + r4.xzwy;
    r4.xy = r13.yz + r13.yz;
    r21 = tex2D(Texture2D_1, r4.xy);
    r8.xyw = tex2D(Texture2D_6, r14.xy).yzx;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r13.xw).xyz;
    r14.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r22.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    r6 = r6.yxzw * 2.0 - 1.0;
    r20.z = r8.z * r14.w - 1.0;
    r14.zw = r14.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r6.zyx, r6.zyx);
    r14.y = ps;
    r19.xyz = r4.xyw * 2.0 - 1.0;
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r17.xyz = r15.xyz * UniformVector_4.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r7.x));
    r17.z = -r19.z + r17.z;
    r7.y = ps;
    r15.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r7.x = dot(r22.zxy, r22.zxy);
    r15.xyz = r15.xyz * r12.xyz;
    r18.yzw = r15.xyz * r8.wxy;
    ps = OpacityOverride.x;
    r12.xyz = r7.zzz * r2.xyz;
    r7.z = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r16.xyz = r6.xzy * r7.yyy;
    r7.x = ps;
    ps = r3.w;
    r4.xyz = r22.xzy * r7.xxx;
    ps = 0.0001 * ps;
    r2.xyz = r16.yzx * r4.zyx;
    r7.x = saturate(ps);
    r2.xyz = r16.xyz * r4.yxz - r2.xyz;
    ps = r11.z;
    r12.w = dot(r20.xyy, float3(1.0, 1.0, 1.0));
    r10.x = ps;
    r7.w = (r12.w == 0.0) ? r21.x : r21.y;
    ps = 0.0;
    r6.xyz = r12.zww + float3(0.1, -3.0, -2.0);
    r10.y = ps;
    ps = 5.0 * r6.x;
    r20.xy = r14.zw + r10.zw;
    r7.y = saturate(ps);
    r7.w = (r6.z == 0.0) ? r21.z : r7.w;
    r10.w = (r6.y == 0.0) ? r21.w : r7.w;
    ps = max(r10.x, r10.y);
    r7.xyz = -r7.zxy + 1.0;
    r10.x = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r7.w = max(r10.w, 0.0);
    r10.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.y = min(r7.w, 0.3);
    r10.z = ps;
    ps = 3.3333333 * r6.y;
    r2.xyz = r2.xyz * r6.www;
    r6.x = ps;
    r2.w = r6.x * r20.z + 1.0;
    r6.yz = r6.xx * r20.xy + r17.xy;
    r10 = -r10.wyzx + 1.0;
    ps = r10.x;
    r8.z = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r17.xy = r6.yz - r19.xy;
    r18.x = ps;
    r7.w = saturate(r18.x * r2.w - 0.5);
    r6.xy = r17.xy * r7.ww + r19.xy;
    r6.z = r17.z * r7.w - 2.0;
    r6.z = r4.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r9.xy = r14.xy * abs(r9.xy);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r8.z));
    r6.x = dot(r6.wyz, r6.wyz);
    r8.z = ps;
    ps = rsqrt(abs(r6.x));
    r14.xyz = r2.xzy * r8.zzz;
    r6.x = ps;
    r2.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r2.zxy, r11.zxy);
    r6.xyz = r2.xzy * r6.xxx;
    r11.xyz = r6.xyz * 2.0 - r11.xzy;
    r6.xyz = r16.zxy * r11.yyy;
    r6.xyz = r14.xzy * r11.zzz + r6.xyz;
    r6.xyw = r4.yzx * r11.xxx + r6.zyx;
    r4.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r4.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r8.z = ps;
    r4.xy = r6.yx * r8.zz + 1.5;
    r13.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r6.x = tex2D(Texture2D_4, r0.xy).x;
    r17.xyz = tex2D(Texture2D_7, r13.xw).xyz;
    r19.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    ps = UniformScalar_7.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = (-XE_FLT_MAX) * ps;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = UniformVector_5.x * UniformVector_5.w;
    r6.z = dot(r5.zxy, r5.zxy);
    r16.x = ps;
    r4.xyz = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r6.z));
    r14.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r6.w = ps;
    ps = pow(2.0, r6.y);
    r6.z = dot(r19.zxy, float3(0.11, 0.3, 0.59));
    r6.y = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.xyz = r6.www * r5.xyz;
    r16.y = ps;
    r15.xyz = r15.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.xyz = r6.zzz - r19.xyz;
    r16.z = ps;
    r0.xyz = r0.xyz * UniformScalar_4.xxx + r19.xyz;
    ps = log2(abs(r10.w));
    r16.xyz = r16.xyz * r0.xyz;
    r6.z = ps;
    ps = UniformScalar_1.x * r6.z;
    r6.w = float((r7.x >= 0.004));
    r6.z = ps;
    r7.xyz = r18.yzw * r2.www - r17.xyz;
    ps = pow(2.0, r6.z);
    r10.x = abs(r2.w) * abs(r2.w);
    r6.z = ps;
    r6.z = r6.z * UniformScalar_3.x + UniformScalar_2.x;
    r0.xyz = r7.xyz * r7.www + r17.xyz;
    r7.xyz = r16.xyz * r6.zzz;
    ps = UniformScalar_8.x * r6.y;
    r15.xyz = r7.xyz * r15.xyz;
    r15.w = ps;
    r15 = r15 * r8.wwww;
    ps = r0.x;
    r15 = r15 * r6.xxxx;
    ps = r8.x * ps;
    r4.xyz = r4.xyz + r15.www;
    r8.x = ps;
    r6.xyz = r15.xyz * r7.www + UniformVector_0.xyz;
    r7.xyz = r14.xyz * r0.xyz + r6.xyz;
    ps = r0.y;
    r13.x = dot(r5.zxy, r2.zxy);
    ps = r8.y * ps;
    r5 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.y = ps;
    r10.yz = r5.zw * r10.yz + 0.125;
    ps = r0.z;
    r6.yz = r5.xy + 0.5;
    ps = r8.z * ps;
    r6.x = saturate(dot(r12.zxy, r11.yxz));
    r8.z = ps;
    ps = log2(r6.x);
    r6.yz = abs(r6.yz) * abs(r6.yz);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r0.xyz = r2.zzz * r1.xyz;
    r0.w = ps;
    ps = r10.x * r10.x;
    r5.xyz = r8.xzy * r6.yyy;
    r8.w = ps;
    ps = r10.y * r10.z;
    r2.xyz = r8.xzy * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r2.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = pow(2.0, r0.w);
    r8.w = r8.w * r8.w;
    r0.w = ps;
    r2.xyz = r0.www * r1.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r1.xyz = r8.www * r4.xyz;
    r1.xyz = r1.xzy * r7.www;
    r7.xyz = r2.xyz * r1.xyz + r7.xzy;
    r7.xyz = r0.xyz * r8.xyz + r7.xzy;
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
