// ps_8bb9580a63fdfd33.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 516 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000810 10041A00 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c23); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c22); // float3
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = UniformVector_1.xyxy * float4(1.8, 1.8, 6.0, 6.0);
    r10 = r8.zwxy * r0.wzwz;
    r26.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    r12.xw = r0.wz * UniformScalar_4.xx;
    r11.xy = r0.xy * UniformScalar_0.xx;
    r11.zw = r0.wz * 1.8e+02;
    ps = -r0.z;
    r10.xy = r0.xy * UniformScalar_2.xx;
    ps = 1.0 + ps;
    r26.x = float((r0.w >= 0.5));
    r7.w = ps;
    ps = 0.5 - r7.w;
    r8.z = float((r7.w >= 0.5));
    r7.w = ps;
    r8.y = r26.x * (-0.5) + r0.w;
    r7.w = r7.w - r0.z;
    r8.x = dot(r7.ww, r8.zz) - r0.z;
    ps = 2.0 + r8.x;
    r12.yz = UniformVector_1.xy * 1.7;
    r7.w = ps;
    ps = r8.z + r8.z;
    r14.xy = r12.yz * r0.wz;
    r19.z = ps;
    ps = r8.y + r8.y;
    r19.y = r7.w - r0.z;
    r19.x = ps;
    r8 = tex2D(Texture2D_2, r19.xy);
    r13.yzw = tex2D(Texture2D_4, r10.xy).xyz;
    r12.yz = tex2D(Texture2D_5, r11.zw).xy;
    r11.yzw = tex2D(Texture2D_0, r11.xy).xyw;
    r15.xyw = tex2D(Texture2D_3, r14.xy).xwy;
    r17.xyw = tex2D(Texture2D_1, r10.zw).xyz;
    r7.w = tex2D(Texture2D_6, r12.xw).x;
    ps = OpacityOverride.x;
    r12.w = saturate(r3.w * 0.0001);
    r12.x = saturate(ps);
    r16 = r6.yxzw * 2.0 - 1.0;
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = 0.6 * r7.w;
    r14.zw = r0.wz * UniformScalar_8.xx;
    r23.w = ps;
    ps = r17.w + r17.w;
    r23.y = r26.w * r15.y;
    r17.w = ps;
    ps = r11.y + r11.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r24.x = ps;
    ps = r11.z + r11.z;
    r24.zw = r17.xy * 4.0;
    r24.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r12.yz + r12.yz;
    r13.x = ps;
    ps = r15.x + r15.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.xyz = r13.yzw + r13.yzw;
    r13.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r7.zxy, r7.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r16.zyx, r16.zyx);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r15.xyz = r6.www * r2.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r20.xyz = r16.xzy * r6.zzz;
    r6.x = ps;
    ps = r15.w + r15.w;
    r16.xyz = r7.xzy * r6.xxx;
    r0.y = ps;
    ps = r6.y;
    r18 = r17.xywz - 1.0;
    ps = r4.x * ps;
    r17 = r0 + float4(-3.0, -3.0, -1.0, -1.0);
    r21.x = ps;
    r22.xy = r26.yz * 4.0 + r17.xy;
    ps = r18.z;
    r2 = r24 + float4(-1.0, -1.0, -2.0, -2.0);
    r6.x = ps;
    ps = 0.5 * r6.x;
    r7.xyz = r20.yzx * r16.zyx;
    r18.z = ps;
    r25.z = r18.w * UniformVector_3.z - r18.z;
    r6.xzw = r20.xyz * r16.yxz - r7.xyz;
    ps = r6.y;
    r15.w = r19.z + r26.x;
    r7.x = (r15.w == 0.0) ? r8.x : r8.y;
    ps = r4.y * ps;
    r0.xyz = r6.xzw * r16.www;
    r21.y = ps;
    ps = r6.y;
    r6.w = dot(r0.zxy, r0.zxy);
    ps = r4.z * ps;
    r6.xyz = r15.zww + float3(0.1, -3.0, -2.0);
    r21.z = ps;
    r7.x = (r6.z == 0.0) ? r8.z : r7.x;
    r23.z = (r6.y == 0.0) ? r8.w : r7.x;
    ps = r21.z;
    r6.y = max(r23.z, 0.0);
    r4.x = ps;
    ps = 5.0 * r6.x;
    r6.y = min(r6.y, 0.3);
    r23.x = saturate(ps);
    ps = 3.3333333 * r6.y;
    r8 = -r23.ywzx + 1.0;
    r6.y = ps;
    ps = r8.z;
    r22.zw = r23.yz + float2(-1.0, -0.75);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r12.yz = r8.ww * ModShadowGroupColor.xy;
    r19.x = ps;
    ps = 0.5 * r8.x;
    r6.xyz = r6.yyy * r22.zxy;
    r19.w = ps;
    ps = 1.0 + r6.x;
    r12 = -r12.wxyz + 1.0;
    r19.z = ps;
    ps = abs(r19.z) * abs(r19.z);
    r4.z = r12.x * UniformScalar_1.x;
    r19.y = ps;
    ps = r19.x * r19.z;
    r2.xy = r4.zz * r2.xy;
    r7.x = ps;
    ps = r19.y * r19.y;
    r4.yw = r18.xy + r2.xy;
    r7.y = ps;
    ps = (-0.5) + r7.x;
    r18.xy = r2.zw + r2.xy;
    r2.w = saturate(ps);
    r4.yw = r4.yw * UniformVector_3.xy - r18.xy;
    r25.xy = r6.yz * 4.0 + r4.yw;
    ps = 0.0;
    r6.xyz = r25.xyz * r2.www;
    r4.y = ps;
    ps = max(r4.x, r4.y);
    r18.xyz = r18.xyz + r6.xyz;
    r18.w = ps;
    r17.xy = r17.zw * 0.018 - r18.xy;
    r17.zw = -r18.zw + 1.0;
    r11.x = r17.z * r7.w + r18.z;
    r6.xy = r17.xy * r7.ww + r6.xy;
    ps = rsqrt(abs(r6.w));
    r6.xy = r6.xy + r2.xy;
    r6.z = ps;
    ps = (-2.0) + r6.x;
    r18.xyz = r0.xzy * r6.zzz;
    r6.z = ps;
    ps = (-2.0) + r6.y;
    r0.zw = r11.xw - 1.0;
    r6.w = ps;
    r0.xy = r6.zw + r24.zw;
    r6.xyz = r0.zxy * r12.xxx;
    ps = 1.0 + r6.x;
    r7.z = r22.w + r23.z;
    r6.w = ps;
    r6.xyz = (r12.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r12.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.x = r0.w * r12.x;
    r6.x = ps;
    r0.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r0.wyz, r21.zxy);
    r6.xyz = r0.yzw * r6.xxx;
    r4.xyw = r6.xyz * 2.0 - r21.xyz;
    r6.xyz = r20.zxy * r4.www;
    r6.xyz = r18.xzy * r4.yyy + r6.xyz;
    r6.xyw = r16.yzx * r4.xxx + r6.zyx;
    r16.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r16.xyz;
    r6.xyw = r6.www * LocalToWorldMatrix[0].xyz + r6.xyz;
    ps = r13.x;
    r6.z = r6.w * 0.3;
    ps = abs(r9.x) * ps;
    r6 = xe_cube(r6.xyz);
    r14.x = ps;
    ps = 1.0 / abs(r6.z);
    r13.z = r6.w;
    r0.x = ps;
    ps = r13.y;
    r2.yz = r6.yx * r0.xx;
    ps = abs(r9.y) * ps;
    r13.xyw = r2.yzx + float3(1.5, 1.5, 1.0);
    r14.y = ps;
    r2.xyz = tex2D(Texture2D_9, r14.zw).xyz;
    r16.xy = tex2D(ModShadowAccumTexture, r14.xy).xy;
    r18.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r6.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r20.xyz = texCUBE(TextureCube_0, xe_cube_dir(r13.xyz)).xyz;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = dot(r5.zxy, r5.zxy);
    r6.w = dot(r20.zxy, float3(0.11, 0.3, 0.59));
    ps = rsqrt(abs(r9.x));
    r0.x = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    r9.x = ps;
    r5.xyz = r9.xxx * r5.xyz;
    r9.xyz = r0.xxx - r6.xyz;
    r21.xyz = r6.www - r20.xyz;
    r20.xyz = saturate(r21.xyz * UniformScalar_5.xxx + r20.xyz);
    r6.xyz = r9.zxy * UniformScalar_7.xxx + r6.zxy;
    r9.xyz = -r20.xyz * 2.0 + 3.0;
    r20.xyz = r20.xyz * r20.xyz;
    r20.xyz = r20.xyz * UniformScalar_6.xxx;
    r9.xyz = r20.xyz * r9.xyz;
    r9.xyz = r9.xyz * r7.www;
    r6.w = saturate(r7.z + r19.w);
    r18.xyz = r6.www * r18.xyz;
    r11.xyz = r18.xyz * r11.www;
    ps = sqrt(abs(r17.w));
    r0.x = float((r12.y >= 0.004));
    r6.w = ps;
    r9.xyz = r9.xyz * r6.www;
    r9.xyz = r9.xyz * r2.www + UniformVector_0.xyz;
    ps = UniformVector_4.x * r6.y;
    r16.z = dot(r5.zxy, r0.wyz);
    r12.x = ps;
    ps = UniformVector_4.y * r6.z;
    r5 = r16.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r12.y = ps;
    r7.zw = r5.xy * r12.zw + 0.125;
    ps = UniformVector_4.z * r6.x;
    r6.w = saturate(dot(r15.zxy, r4.wxy));
    r12.z = ps;
    ps = log2(r6.w);
    r4.xy = r5.zw + 0.5;
    r6.w = ps;
    ps = 15.0 * r6.w;
    r7.xw = r7.zy * r7.wy;
    r6.w = ps;
    r7.xyz = r7.xxx * r14.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r4.xw = abs(r4.xy) * abs(r4.xy);
    r6.w = ps;
    ps = r6.w;
    r0.yzw = r0.www * r1.xyz;
    r4.y = (r4.z > 0.0) ? r13.w : 1.0;
    r4.y = (r4.z >= 0.0) ? r4.y : 1.0;
    ps = r1.x * ps;
    r5.xyz = r4.yyy * r2.xyz;
    r2.x = ps;
    ps = r6.w;
    r13.xyz = r5.xyz * UniformVector_4.xyz;
    ps = r1.z * ps;
    r5.xyz = r12.xyz * r5.xyz;
    r2.y = ps;
    r12.xyz = r5.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r6.xyz = r13.xyz * r6.yzx - r11.xyz;
    ps = r6.w;
    r5.xyz = r5.xyz - r11.xyz;
    r5.xyz = r5.xyz * r2.www + r11.xyz;
    r11.xyz = r6.xyz * r2.www + r11.xyz;
    ps = r1.y * ps;
    r6.xyz = r7.www * r12.xyz;
    r2.z = ps;
    ps = r6.x;
    r1.yzw = r8.yyy * r11.xyz;
    ps = r2.w * ps;
    r8.xyz = r8.yyy * r5.xyz;
    r1.x = ps;
    ps = r6.z;
    r8.xyz = r8.xyz * r10.xyz;
    ps = r2.w * ps;
    r5.xyz = r1.yzw * r10.xyz;
    r1.y = ps;
    ps = r6.y;
    r4.xyz = r5.xzy * r4.xxx;
    ps = r2.w * ps;
    r5.xyz = r8.xzy * r4.www;
    r1.z = ps;
    r6.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r9.xyz;
    r6.xyz = r5.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r2.xyz * r1.xyz + r6.xzy;
    r6.xyz = r0.yzw * r8.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r0.x + r3.w;
    r6.xyz = r7.xyz * r0.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
