// ps_08ac4c64fdfafb17.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 507 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000007EC 10041900 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c23); // float4
float4 ConstantLighting : register(c24); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c22); // float3
float4 ModShadowAccumResolution : register(c27); // float2
float4 ModShadowColor : register(c25); // float3
float4 ModShadowGroupColor : register(c26); // float3
float4 OpacityOverride : register(c20); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_10 : register(c19); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformScalar_5 : register(c14); // float
float4 UniformScalar_6 : register(c15); // float
float4 UniformScalar_7 : register(c16); // float
float4 UniformScalar_8 : register(c17); // float
float4 UniformScalar_9 : register(c18); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UpperSkyColor : register(c21); // float3
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = UniformVector_1.xyxy * float4(1.8, 1.8, 6.0, 6.0);
    r9 = r7 * r0.wzwz;
    r23.yzw = tex2D(Texture2D_3, r9.zw).xyw;
    r12.xy = r0.wz * UniformScalar_4.xx;
    r10.xy = r0.xy * UniformScalar_0.xx;
    r10.zw = r0.wz * 1.8e+02;
    ps = -r0.z;
    r7.yz = r0.xy * UniformScalar_2.xx;
    ps = 1.0 + ps;
    r23.x = float((r0.w >= 0.5));
    r6.w = ps;
    ps = 0.5 - r6.w;
    r11.y = float((r6.w >= 0.5));
    r7.x = ps;
    r11.x = r23.x * (-0.5) + r0.w;
    r7.x = r7.x - r0.z;
    r7.x = dot(r7.xx, r11.yy) - r0.z;
    ps = 2.0 + r7.x;
    r12.zw = UniformVector_1.xy * 1.7;
    r11.z = ps;
    ps = r11.y + r11.y;
    r7.xw = r12.zw * r0.wz;
    r17.w = ps;
    ps = r11.x + r11.x;
    r17.y = r11.z - r0.z;
    r17.x = ps;
    r19 = tex2D(Texture2D_2, r17.xy);
    r11.yzw = tex2D(Texture2D_4, r7.yz).xyz;
    r13.zw = tex2D(Texture2D_5, r10.zw).xy;
    r18.yzw = tex2D(Texture2D_0, r10.xy).xyw;
    r14.xyw = tex2D(Texture2D_3, r7.xw).xwy;
    r10.xyz = tex2D(Texture2D_1, r9.xy).zxy;
    r7.w = tex2D(Texture2D_6, r12.xy).x;
    ps = OpacityOverride.x;
    r15.w = saturate(r2.w * 0.0001);
    r15.x = saturate(ps);
    r12 = r5.ywxz * 2.0 - 1.0;
    r16.xyz = r6.xyz * 2.0 - 1.0;
    ps = 0.6 * r7.w;
    r13.xy = r0.wz * UniformScalar_8.xx;
    r21.w = ps;
    ps = r10.x + r10.x;
    r21.y = r23.w * r14.y;
    r0.w = ps;
    ps = r18.y + r18.y;
    r5.w = dot(r1.zxy, r1.zxy);
    r10.x = ps;
    ps = r18.z + r18.z;
    r10.zw = r10.yz * 4.0;
    r10.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r13.zw + r13.zw;
    r11.x = ps;
    ps = r14.x + r14.x;
    r5.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyz = r11.yzw + r11.yzw;
    r11.y = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r16.zxy, r16.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r12.wzx, r12.wzx);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r14.xyz = r5.www * r1.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r22.xyz = r12.xwz * r5.zzz;
    r5.x = ps;
    ps = r14.w + r14.w;
    r16.xyz = r16.xzy * r5.xxx;
    r6.y = ps;
    ps = r5.y;
    r1 = r0.zwxy - 1.0;
    ps = r3.x * ps;
    r0 = r6.xzwy + float4(-3.0, -1.0, -1.0, -3.0);
    r12.x = ps;
    r20.xy = r23.yz * 4.0 + r0.xw;
    ps = r1.y;
    r25 = r10 + float4(-1.0, -1.0, -2.0, -2.0);
    r5.x = ps;
    ps = 0.5 * r5.x;
    r6.xyz = r22.yzx * r16.zyx;
    r17.z = ps;
    r24.z = r1.x * UniformVector_3.z - r17.z;
    r5.xzw = r22.xyz * r16.yxz - r6.xyz;
    ps = r5.y;
    r14.w = r17.w + r23.x;
    r6.x = (r14.w == 0.0) ? r19.x : r19.y;
    ps = r3.y * ps;
    r23.xyz = r5.xzw * r12.yyy;
    r12.y = ps;
    ps = r5.y;
    r5.w = dot(r23.zxy, r23.zxy);
    ps = r3.z * ps;
    r5.xyz = r14.zww + float3(0.1, -3.0, -2.0);
    r12.z = ps;
    r6.x = (r5.z == 0.0) ? r19.z : r6.x;
    r21.z = (r5.y == 0.0) ? r19.w : r6.x;
    ps = r12.z;
    r5.y = max(r21.z, 0.0);
    r1.x = ps;
    ps = 5.0 * r5.x;
    r5.y = min(r5.y, 0.3);
    r21.x = saturate(ps);
    ps = 3.3333333 * r5.y;
    r6 = -r21.zxwy + 1.0;
    r5.y = ps;
    ps = r6.x;
    r20.zw = r21.yz + float2(-1.0, -0.75);
    r5.x = ps;
    ps = 2.5 * r5.x;
    r15.yz = r6.yy * ModShadowGroupColor.xy;
    r19.x = ps;
    ps = 0.5 * r6.w;
    r5.xyz = r5.yyy * r20.zxy;
    r19.w = ps;
    ps = 1.0 + r5.x;
    r15 = -r15.wxyz + 1.0;
    r19.z = ps;
    ps = abs(r19.z) * abs(r19.z);
    r1.y = r15.x * UniformScalar_1.x;
    r19.y = ps;
    ps = r19.x * r19.z;
    r6.xy = r1.yy * r25.xy;
    r0.x = ps;
    ps = r19.y * r19.y;
    r3.xy = r1.zw + r6.xy;
    r0.w = ps;
    ps = (-0.5) + r0.x;
    r17.xy = r25.zw + r6.xy;
    r1.w = saturate(ps);
    r3.xy = r3.xy * UniformVector_3.xy - r17.xy;
    r24.xy = r5.yz * 4.0 + r3.xy;
    ps = 0.0;
    r5.xyz = r24.xyz * r1.www;
    r1.z = ps;
    ps = max(r1.x, r1.z);
    r3.xyz = r17.xyz + r5.xyz;
    r3.w = ps;
    r17.xy = r0.yz * 0.018 - r3.xy;
    r17.zw = -r3.zw + 1.0;
    r18.x = r17.z * r7.w + r3.z;
    r5.xy = r17.xy * r7.ww + r5.xy;
    ps = rsqrt(abs(r5.w));
    r5.xy = r5.xy + r6.xy;
    r5.z = ps;
    ps = (-2.0) + r5.x;
    r3.yzw = r23.xzy * r5.zzz;
    r5.z = ps;
    ps = (-2.0) + r5.y;
    r23.zw = r18.xw - 1.0;
    r5.w = ps;
    r23.xy = r5.zw + r10.zw;
    r5.xyz = r23.zxy * r15.xxx;
    ps = 1.0 + r5.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r15.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r15.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r3.x = r23.w * r15.x;
    r5.x = ps;
    r6.xyw = r5.yzw * r5.xxx;
    r5.x = dot(r6.wxy, r12.zxy);
    r5.xyz = r6.xyw * r5.xxx;
    r12.xyz = r5.xyz * 2.0 - r12.xyz;
    r5.xyz = r22.zxy * r12.zzz;
    r5.xyz = r3.ywz * r12.yyy + r5.xyz;
    r5.xyw = r16.yzx * r12.xxx + r5.zyx;
    r3.yzw = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r3.yzw;
    r5.xyw = r5.www * LocalToWorldMatrix[0].xyz + r5.xyz;
    ps = r11.x;
    r5.z = r5.w * 0.3;
    ps = abs(r8.x) * ps;
    r5 = xe_cube(r5.xyz);
    r0.y = ps;
    ps = 1.0 / abs(r5.z);
    r11.z = r5.w;
    r7.x = ps;
    ps = r11.y;
    r3.yz = r5.yx * r7.xx;
    ps = abs(r8.y) * ps;
    r11.xyw = r3.yzx + float3(1.5, 1.5, 1.0);
    r0.z = ps;
    r3.xyz = tex2D(Texture2D_9, r13.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r0.yz).xy;
    r8.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r7.xyz = tex2D(Texture2D_8, r7.yz).xyz;
    r16.xyz = texCUBE(TextureCube_0, xe_cube_dir(r11.xyz)).xyz;
    ps = -ModShadowColor.x;
    r5.z = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r5.w = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r13.x = ps;
    ps = rsqrt(abs(r5.z));
    r0.y = dot(r7.zxy, float3(0.11, 0.3, 0.59));
    r5.z = ps;
    ps = -ModShadowColor.y;
    r9.xyz = r0.yyy - r7.xyz;
    ps = 1.0 + ps;
    r22.xyz = r5.www - r16.xyz;
    r13.y = ps;
    r16.xyz = saturate(r22.xyz * UniformScalar_5.xxx + r16.xyz);
    r7.xyz = r9.zxy * UniformScalar_7.xxx + r7.zxy;
    r9.xyz = -r16.xyz * 2.0 + 3.0;
    ps = -ModShadowColor.z;
    r16.xyz = r16.xyz * r16.xyz;
    ps = 1.0 + ps;
    r16.xyz = r16.xyz * UniformScalar_6.xxx;
    r13.z = ps;
    ps = r5.z;
    r9.xyz = r16.xyz * r9.xyz;
    ps = r4.x * ps;
    r9.xyz = r9.xyz * r7.www;
    r16.x = ps;
    ps = r5.z;
    r5.w = r20.w + r21.z;
    ps = r4.y * ps;
    r5.w = saturate(r5.w + r19.w);
    r16.y = ps;
    ps = r5.z;
    r8.xyz = r5.www * r8.xyz;
    ps = r4.z * ps;
    r8.xyz = r8.xyz * r18.www;
    r16.z = ps;
    ps = sqrt(abs(r17.w));
    r7.w = float((r15.y >= 0.004));
    r5.z = ps;
    ps = UniformVector_4.x * r7.y;
    r4.yzw = r9.xyz * r5.zzz;
    r4.x = ps;
    r9.xyz = r4.yzw * r1.www + UniformVector_0.xyz;
    ps = UniformVector_4.y * r7.z;
    r5.z = dot(r16.zxy, r6.wxy);
    r4.y = ps;
    ps = UniformVector_4.z * r7.x;
    r5 = r5.xzzy * float4(0.875, -0.5, 0.5, 0.875);
    r4.z = ps;
    r0.yz = r5.xw * r15.zw + 0.125;
    ps = ConstantLighting.x * r6.w;
    r5.x = saturate(dot(r14.zxy, r12.zxy));
    r1.x = ps;
    ps = log2(r5.x);
    r12.xy = r5.yz + 0.5;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r0.xz = r0.wy * r0.wz;
    r5.w = ps;
    r5.xyz = r0.zzz * r13.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r0.zw = abs(r12.xy) * abs(r12.xy);
    r5.w = ps;
    r0.y = (r1.y > 0.0) ? r11.w : 1.0;
    r0.y = (r1.y >= 0.0) ? r0.y : 1.0;
    ps = ConstantLighting.y * r6.w;
    r3.xyz = r0.yyy * r3.xyz;
    r1.y = ps;
    ps = ConstantLighting.z * r6.w;
    r11.xyz = r3.xyz * UniformVector_4.xyz;
    r1.z = ps;
    ps = ConstantLighting.x * r5.w;
    r3.yzw = r4.xyz * r3.xyz;
    r3.x = ps;
    r4.xyz = r3.yzw * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r11.xyz = r11.xyz * r7.yzx - r8.xyz;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r3.yzw - r8.xyz;
    r3.y = ps;
    r7.xyz = r7.xyz * r1.www + r8.xyz;
    r8.xyz = r11.xyz * r1.www + r8.xyz;
    ps = ConstantLighting.y * r5.w;
    r4.xyw = r0.xxx * r4.xzy;
    r3.z = ps;
    ps = r4.x;
    r8.xyz = r6.zzz * r8.xyz;
    ps = r1.w * ps;
    r6.xyz = r6.zzz * r7.xyz;
    r0.x = ps;
    ps = r4.y;
    r7.xyz = r6.xyz * r10.xyz;
    ps = r1.w * ps;
    r6.xyz = r8.xyz * r10.xyz;
    r0.y = ps;
    ps = r4.w;
    r4.xyz = r6.xzy * r0.zzz;
    ps = r1.w * ps;
    r8.xyz = r7.xzy * r0.www;
    r0.z = ps;
    r6.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz + r9.xyz;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r3.xyz * r0.xyz + r6.xzy;
    r6.xyz = r1.xyz * r7.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r7.w + r2.w;
    r5.xyz = r6.xyz * r7.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
