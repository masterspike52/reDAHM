// ps_2b56aec37395ba43.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041400 0000090A 00000000 00009129 003F01FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c25); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c24); // float3
float4 ModShadowAccumResolution : register(c28); // float2
float4 ModShadowColor : register(c26); // float3
float4 ModShadowGroupColor : register(c27); // float3
float4 OpacityOverride : register(c22); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_10 : register(c21); // float
float4 UniformScalar_2 : register(c13); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformScalar_6 : register(c17); // float
float4 UniformScalar_7 : register(c18); // float
float4 UniformScalar_8 : register(c19); // float
float4 UniformScalar_9 : register(c20); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UpperSkyColor : register(c23); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
samplerCUBE TextureCube_0 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_5, r0.xy).wxyz;
    ps = r0.w;
    r8.z = dot(r4.zxy, r4.zxy);
    ps = 6.0 * ps;
    r7.w = -r0.z + 1.0;
    r11.z = ps;
    ps = rsqrt(abs(r8.z));
    r8.y = r10.x - 0.5;
    r8.z = ps;
    ps = UniformVector_2.x * r0.w;
    r8.x = r3.w - 4e+02;
    r12.x = ps;
    ps = 0.00022222222 * r8.x;
    r15.xyz = r8.zzz * r4.xyz;
    r8.x = saturate(ps);
    ps = (-0.025) * r8.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.yyyy)) clip(-1.0);
    r8.x = ps;
    ps = UniformVector_2.y * r7.w;
    r12.zw = r15.xy * r8.xx;
    r12.y = ps;
    ps = r0.w;
    r8.yz = r12.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r11.xy = float2((r12.xy >= 0.5));
    r8.x = ps;
    ps = r0.z;
    r8.yz = r8.yz - r12.xy;
    ps = UniformVector_1.y * ps;
    r8.zw = r8.yz * r11.xy;
    r8.y = ps;
    ps = r0.z;
    r8 = r12.zwyx + r8.xywz;
    ps = 6.0 * ps;
    r4.xy = r8.wz + r8.wz;
    r11.w = ps;
    r20 = tex2D(Texture2D_1, r4.xy);
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r11.zw).xyw;
    r12.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.z = dot(r2.zxy, r2.zxy);
    r12.x = ps;
    r6 = r6.yxzw * 2.0 - 1.0;
    r13.w = r14.z * r12.w - 1.0;
    r12.zw = r12.yz * 2.0 - 1.0;
    r19.yz = r14.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r6.zyx, r6.zyx);
    r12.y = ps;
    r17.xyz = r4.xyw * 2.0 - 1.0;
    r13.xyz = r13.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.z));
    r18.xyz = r13.xyz * UniformVector_4.xyz;
    r10.x = ps;
    ps = rsqrt(abs(r7.x));
    r13.z = -r17.z + r18.z;
    r4.z = ps;
    r14.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r16.yzw = r14.xyz * r10.yzw;
    r7.x = dot(r7.wyz, r7.wyz);
    r10.xyz = r10.xxx * r2.xyz;
    ps = rsqrt(abs(r7.x));
    r14.xyz = r6.xzy * r4.zzz;
    r7.x = ps;
    ps = OpacityOverride.x;
    r4.xyz = r7.ywz * r7.xxx;
    r7.z = saturate(ps);
    ps = r3.w;
    r7.xyw = r14.yzx * r4.zyx;
    r7.xyw = r14.xyz * r4.yxz - r7.xyw;
    ps = 0.0001 * ps;
    r2.yzw = r7.xyw * r6.www;
    r7.y = saturate(ps);
    ps = r15.z;
    r10.w = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r11.x = ps;
    r6.w = (r10.w == 0.0) ? r20.x : r20.y;
    ps = 0.0;
    r6.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r11.y = ps;
    ps = 5.0 * r6.x;
    r7.w = dot(r2.wyz, r2.wyz);
    r7.x = saturate(ps);
    r6.w = (r6.z == 0.0) ? r20.z : r6.w;
    r6.w = (r6.y == 0.0) ? r20.w : r6.w;
    ps = max(r11.x, r11.y);
    r7.xyz = -r7.zyx + 1.0;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r6.y = max(r6.w, 0.0);
    r6.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r19.x = min(r6.y, 0.3);
    r6.y = ps;
    r11 = -r6.wxyz + 1.0;
    ps = r11.x;
    r6.yzw = r19.yxz * float3(0.5, 3.3333333, 0.5);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r13.xy = r12.zw + r6.yw;
    r16.x = ps;
    r6.xy = r6.zz * r13.xy + r18.xy;
    r2.x = r6.z * r13.w + 1.0;
    r8.w = saturate(r16.x * r2.x - 0.5);
    r13.xy = r6.xy - r17.xy;
    r6.xy = r13.xy * r8.ww + r17.xy;
    r6.z = r13.z * r8.w - 2.0;
    r6.z = r4.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r9.xy = r12.xy * abs(r9.xy);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r2.ywz * r7.yyy;
    r6.x = ps;
    r12.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r12.zxy, r15.zxy);
    r6.xyz = r12.xzy * r6.xxx;
    r2.yzw = r6.xyz * 2.0 - r15.xzy;
    r6.xyz = r14.zxy * r2.zzz;
    r6.xyz = r13.xzy * r2.www + r6.xyz;
    r6.xyw = r4.yzx * r2.yyy + r6.zyx;
    r4.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r4.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    r6 = xe_cube(r6.xzy);
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r7.y = ps;
    r4.xy = r6.yx * r7.yy + 1.5;
    r9.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r0.y = tex2D(Texture2D_4, r0.xy).x;
    r8.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r0.xzw = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r6.y = UniformScalar_7.x * (-XE_FLT_MAX);
    ps = UniformVector_5.x * UniformVector_5.w;
    r7.w = dot(r5.zxy, r5.zxy);
    r15.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r6.xzw = -UniformVector_0.yxz + 1.0;
    r15.y = ps;
    ps = rsqrt(abs(r7.w));
    r7.y = dot(r0.wxz, float3(0.11, 0.3, 0.59));
    r7.w = ps;
    ps = pow(2.0, r6.y);
    r13.xyz = r7.www * r5.xyz;
    r6.y = ps;
    r4.xyz = r16.yzw * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r14.xyz = r16.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.xyz = r7.yyy - r0.xzw;
    r15.z = ps;
    r0.xzw = r5.xyz * UniformScalar_4.xxx + r0.xzw;
    ps = log2(abs(r11.w));
    r15.xyz = r15.xyz * r0.xzw;
    r7.y = ps;
    ps = UniformScalar_1.x * r7.y;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r7.x = float((r7.x >= 0.004));
    r0.x = ps;
    r7.yzw = r16.yzw * r2.xxx - r8.xyz;
    r0.x = r0.x * UniformScalar_3.x + UniformScalar_2.x;
    r15.xyz = r15.xyz * r0.xxx;
    r7.yzw = r7.yzw * r8.www + r8.xyz;
    ps = AmbientColorAndSkyFactor.x * r6.z;
    r8.xyz = r7.yzw * r6.zxw;
    r0.x = ps;
    ps = UniformScalar_8.x * r6.y;
    r14.xyz = r15.xyz * r14.xyz;
    r14.w = ps;
    ps = AmbientColorAndSkyFactor.y * r6.x;
    r14 = r14 * r0.yyyy;
    r0.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r4.xyz = r4.xyz + r14.www;
    r0.z = ps;
    r6.xyz = r14.xyz * r8.www + UniformVector_0.xyz;
    r7.yzw = r0.xyz * r7.yzw + r6.xyz;
    r0.xyz = r12.zzz * r1.xyz;
    r9.x = dot(r13.zxy, r12.zxy);
    r9 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.yz = r9.zw * r11.yz + 0.125;
    r6.x = saturate(dot(r10.zxy, r2.zyw));
    ps = log2(r6.x);
    r2.yz = r9.xy + 0.5;
    r6.x = ps;
    r2.xyw = abs(r2.yzx) * abs(r2.yzx);
    ps = 15.0 * r6.x;
    r9.xyz = r8.xzy * r2.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r10.xyz = r8.xzy * r2.yyy;
    r6.x = ps;
    ps = r2.w * r2.w;
    r2.xyz = r6.xxx * r1.xzy;
    r6.w = ps;
    r7.yzw = r10.xyz * UpperSkyColor.xzy + r7.ywz;
    r7.yzw = r9.xzy * LowerSkyColor.xyz + r7.ywz;
    r6.xw = r6.yw * r6.zw;
    r6.xyz = r6.xxx * r5.xyz + ModShadowColor.xyz;
    r1.xyz = r6.www * r4.xyz;
    r1.xyz = r1.xzy * r8.www;
    r7.yzw = r2.xyz * r1.xyz + r7.ywz;
    r7.yzw = r0.xyz * r8.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xyz;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xyz - r6.xyz;
    r8.w = ps;
    oC0.w = r8.w * r7.x + r3.w;
    r6.xyz = r8.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
