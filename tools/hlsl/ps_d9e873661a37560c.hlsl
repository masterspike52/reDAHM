// ps_d9e873661a37560c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 516 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000810 10041A00 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c24); // float3
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
sampler2D LightMapTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 color2 : COLOR2; // r8
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
    r12 = r8 * r1.wzwz;
    r20.yzw = tex2D(Texture2D_3, r12.zw).xyw;
    r10.zw = r1.wz * UniformScalar_4.xx;
    r11.zw = r1.xy * UniformScalar_0.xx;
    r0.zw = r1.wz * 1.8e+02;
    ps = -r1.z;
    r10.xy = r1.xy * UniformScalar_2.xx;
    ps = 1.0 + ps;
    r20.x = float((r1.w >= 0.5));
    r7.w = ps;
    ps = 0.5 - r7.w;
    r8.y = float((r7.w >= 0.5));
    r7.w = ps;
    r8.x = r20.x * (-0.5) + r1.w;
    r7.w = r7.w - r1.z;
    r7.w = dot(r7.ww, r8.yy) - r1.z;
    ps = 2.0 + r7.w;
    r8.zw = UniformVector_1.xy * 1.7;
    r7.w = ps;
    ps = r8.y + r8.y;
    r11.xy = r8.zw * r1.wz;
    r13.z = ps;
    ps = r8.x + r8.x;
    r13.y = r7.w - r1.z;
    r13.x = ps;
    r8 = tex2D(Texture2D_2, r13.xy);
    r16.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r0.zw = tex2D(Texture2D_5, r0.zw).xy;
    r19.yzw = tex2D(Texture2D_0, r11.zw).xyw;
    r14.xyw = tex2D(Texture2D_3, r11.xy).xwy;
    r15.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    r7.w = tex2D(Texture2D_6, r10.zw).x;
    ps = OpacityOverride.x;
    r26.w = saturate(r3.w * 0.0001);
    r26.x = saturate(ps);
    r11 = r6.wyxz * 2.0 - 1.0;
    r18.xyz = r7.xyz * 2.0 - 1.0;
    ps = 0.6 * r7.w;
    r1.xy = r1.wz * UniformScalar_8.xx;
    r22.w = ps;
    ps = r15.z + r15.z;
    r22.y = r20.w * r14.y;
    r17.w = ps;
    ps = r19.y + r19.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r23.x = ps;
    ps = r19.z + r19.z;
    r23.zw = r15.xy * 4.0;
    r23.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.zw = r0.zw + r0.zw;
    r7.y = ps;
    ps = r14.x + r14.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.xyz = r16.xyz + r16.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = dot(r18.zxy, r18.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r11.wzy, r11.wzy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r16.xyz = r6.www * r2.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r14.xyz = r11.ywz * r6.zzz;
    r6.x = ps;
    ps = r14.w + r14.w;
    r11.yzw = r18.xzy * r6.xxx;
    r15.y = ps;
    ps = r6.y;
    r17 = r17.xywz - 1.0;
    ps = r4.x * ps;
    r18 = r15 + float4(-3.0, -3.0, -1.0, -1.0);
    r15.x = ps;
    r21.xy = r20.yz * 4.0 + r18.xy;
    ps = r17.z;
    r25 = r23 + float4(-1.0, -1.0, -2.0, -2.0);
    r6.x = ps;
    ps = 0.5 * r6.x;
    r2.xyz = r14.yzx * r11.wzy;
    r17.z = ps;
    r24.z = r17.w * UniformVector_3.z - r17.z;
    r6.xzw = r14.xyz * r11.zyw - r2.xyz;
    ps = r6.y;
    r16.w = r13.z + r20.x;
    r7.x = (r16.w == 0.0) ? r8.x : r8.y;
    ps = r4.y * ps;
    r13.xyz = r6.xzw * r11.xxx;
    r15.y = ps;
    ps = r6.y;
    r6.w = dot(r13.zxy, r13.zxy);
    ps = r4.z * ps;
    r6.xyz = r16.zww + float3(0.1, -3.0, -2.0);
    r15.z = ps;
    r7.x = (r6.z == 0.0) ? r8.z : r7.x;
    r22.z = (r6.y == 0.0) ? r8.w : r7.x;
    ps = r15.z;
    r6.y = max(r22.z, 0.0);
    r10.z = ps;
    ps = 5.0 * r6.x;
    r6.y = min(r6.y, 0.3);
    r22.x = saturate(ps);
    ps = 3.3333333 * r6.y;
    r8 = -r22.ywzx + 1.0;
    r6.y = ps;
    ps = r8.z;
    r21.zw = r22.yz + float2(-1.0, -0.75);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r26.yz = r8.ww * ModShadowGroupColor.xy;
    r20.x = ps;
    ps = 0.5 * r8.x;
    r6.xyz = r6.yyy * r21.zxy;
    r20.w = ps;
    ps = 1.0 + r6.x;
    r2 = -r26.ywxz + 1.0;
    r20.z = ps;
    ps = abs(r20.z) * abs(r20.z);
    r4.y = r2.y * UniformScalar_1.x;
    r20.y = ps;
    ps = r20.x * r20.z;
    r4.xz = r4.yy * r25.xy;
    r0.z = ps;
    ps = r20.y * r20.y;
    r24.xy = r17.xy + r4.xz;
    r0.w = ps;
    ps = (-0.5) + r0.z;
    r17.xy = r25.zw + r4.xz;
    r1.z = saturate(ps);
    r24.xy = r24.xy * UniformVector_3.xy - r17.xy;
    r24.xy = r6.yz * 4.0 + r24.xy;
    ps = 0.0;
    r6.xyz = r24.xyz * r1.zzz;
    r10.w = ps;
    ps = max(r10.z, r10.w);
    r17.xyz = r17.xyz + r6.xyz;
    r17.w = ps;
    r18.xy = r18.zw * 0.018 - r17.xy;
    r18.zw = -r17.zw + 1.0;
    r19.x = r18.z * r7.w + r17.z;
    r6.xy = r18.xy * r7.ww + r6.xy;
    ps = rsqrt(abs(r6.w));
    r6.xy = r6.xy + r4.xz;
    r6.z = ps;
    ps = (-2.0) + r6.x;
    r13.xyz = r13.xzy * r6.zzz;
    r6.z = ps;
    ps = (-2.0) + r6.y;
    r17.zw = r19.xw - 1.0;
    r6.w = ps;
    r17.xy = r6.zw + r23.zw;
    r6.xyz = r17.zxy * r2.yyy;
    ps = 1.0 + r6.x;
    r10.w = dot(r5.zxy, r5.zxy);
    r6.w = ps;
    r6.xyz = (r2.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r2.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r11.x = r17.w * r2.y;
    r6.x = ps;
    r4.xzw = r6.ywz * r6.xxx;
    r6.x = dot(r4.zxw, r15.zxy);
    r6.xyz = r4.xwz * r6.xxx;
    r15.xyz = r6.xyz * 2.0 - r15.xyz;
    r6.xyz = r14.zxy * r15.zzz;
    r6.xyz = r13.xzy * r15.yyy + r6.xyz;
    r6.xyw = r11.zwy * r15.xxx + r6.zyx;
    r11.yzw = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r11.yzw;
    r6.xyw = r6.www * LocalToWorldMatrix[0].xyz + r6.xyz;
    ps = r7.y;
    r6.z = r6.w * 0.3;
    ps = abs(r9.x) * ps;
    r6 = xe_cube(r6.xyz);
    r7.x = ps;
    ps = 1.0 / abs(r6.z);
    r11.z = r6.w;
    r1.w = ps;
    ps = r7.z;
    r11.yw = r6.yx * r1.ww;
    ps = abs(r9.y) * ps;
    r11.xyw = r11.ywx + float3(1.5, 1.5, 1.0);
    r7.y = ps;
    r1.xyw = tex2D(Texture2D_9, r1.xy).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r12.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r7.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r11.xyz)).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    ps = rsqrt(abs(r10.w));
    r0.x = dot(r7.zxy, float3(0.11, 0.3, 0.59));
    r0.y = ps;
    r17.xyz = r0.yyy * r5.xyz;
    r5.xyz = r0.xxx - r7.xyz;
    r14.xyz = r6.www - r9.xyz;
    r9.xyz = saturate(r14.xyz * UniformScalar_5.xxx + r9.xyz);
    r7.xyz = r5.zxy * UniformScalar_7.xxx + r7.zxy;
    r5.xyz = -r9.xyz * 2.0 + 3.0;
    ps = -ModShadowColor.x;
    r9.xyz = r9.xyz * r9.xyz;
    ps = 1.0 + ps;
    r9.xyz = r9.xyz * UniformScalar_6.xxx;
    r14.x = ps;
    ps = -ModShadowColor.y;
    r5.xyz = r9.xyz * r5.xyz;
    ps = 1.0 + ps;
    r9.xyz = r5.xyz * r7.www;
    r14.y = ps;
    ps = -ModShadowColor.z;
    r6.w = r21.w + r22.z;
    ps = 1.0 + ps;
    r6.w = saturate(r6.w + r20.w);
    r14.z = ps;
    ps = LightMapScale.x * r6.y;
    r5.xyz = r6.www * r12.xyz;
    r12.x = ps;
    ps = LightMapScale.y * r6.z;
    r5.xyz = r5.xyz * r19.www;
    r12.y = ps;
    ps = sqrt(abs(r18.w));
    r6.w = float((r2.z >= 0.004));
    r7.w = ps;
    ps = LightMapScale.z * r6.x;
    r9.xyz = r9.xyz * r7.www;
    r12.z = ps;
    r9.xyz = r9.xyz * r1.zzz + UniformVector_0.xyz;
    ps = UniformVector_4.x * r7.y;
    r13.z = dot(r17.zxy, r4.zxw);
    r2.y = ps;
    ps = UniformVector_4.y * r7.z;
    r13 = r13.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r2.z = ps;
    r0.xy = r13.xy * r2.xw + 0.125;
    ps = UniformVector_4.z * r7.x;
    r6.x = saturate(dot(r16.zxy, r15.zxy));
    r2.w = ps;
    ps = log2(r6.x);
    r13.xy = r13.zw + 0.5;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r0.xw = r0.xw * r0.yw;
    r7.w = ps;
    r6.xyz = r0.xxx * r14.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.w);
    r4.xw = abs(r13.xy) * abs(r13.xy);
    r7.w = ps;
    ps = r12.x;
    r0.xyz = r12.xzy * r4.zzz;
    r2.x = (r4.y > 0.0) ? r11.w : 1.0;
    r2.x = (r4.y >= 0.0) ? r2.x : 1.0;
    ps = r7.w * ps;
    r1.xyw = r2.xxx * r1.xyw;
    r2.x = ps;
    ps = r12.z;
    r13.xyz = r1.xyw * UniformVector_4.xyz;
    ps = r7.w * ps;
    r1.xyw = r2.yzw * r1.xyw;
    r2.y = ps;
    r11.xyz = r1.xyw * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r7.xyz = r13.xyz * r7.yzx - r5.xyz;
    ps = r12.y;
    r1.xyw = r1.xyw - r5.xyz;
    r1.xyw = r1.xyw * r1.zzz + r5.xyz;
    r5.xyz = r7.xyz * r1.zzz + r5.xyz;
    ps = r7.w * ps;
    r7.xyz = r0.www * r11.xyz;
    r2.z = ps;
    ps = r7.x;
    r5.xyz = r8.yyy * r5.xyz;
    ps = r1.z * ps;
    r8.xyz = r8.yyy * r1.xyw;
    r1.x = ps;
    ps = r7.z;
    r8.xyz = r8.xyz * r10.xyz;
    ps = r1.z * ps;
    r5.xyz = r5.xyz * r10.xyz;
    r1.y = ps;
    ps = r7.y;
    r4.xyz = r5.xzy * r4.xxx;
    ps = r1.z * ps;
    r5.xyz = r8.xzy * r4.www;
    r1.z = ps;
    r7.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r9.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * r1.xyz + r7.xzy;
    r7.xyz = r0.xzy * r8.xyz + r7.xzy;
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
