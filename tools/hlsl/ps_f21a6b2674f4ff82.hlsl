// ps_f21a6b2674f4ff82.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 504 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000007E0 10041900 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 LightMapScale : register(c22); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c13); // float
float4 UniformScalar_1 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformScalar_7 : register(c17); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UniformVector_7 : register(c12); // float4
float4 UpperSkyColor : register(c19); // float3
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
sampler2D LightMapTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r10.zw = r1.wz * 6.0;
    ps = r1.w;
    r0.zw = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r7.w = -r1.z + 1.0;
    r19.x = ps;
    ps = r3.w;
    r17.xy = r1.wz * UniformVector_7.xy;
    ps = 0.0001 * ps;
    r8.w = r3.w - 4e+02;
    r8.y = saturate(ps);
    r11 = r6.yxzw * 2.0 - 1.0;
    r12.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = saturate(OpacityOverride.x);
    r6.z = ps;
    ps = 1.0 - r6.x;
    r8.xz = r1.wz * UniformVector_1.xy;
    r18.y = ps;
    ps = r14.x + r14.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r18.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r12.zxy, r12.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.y = dot(r11.zyx, r11.zyx);
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r6.y = saturate(r8.w * 0.00022222222);
    r7.y = ps;
    ps = (-0.025) * r6.y;
    r6.zw = r6.zw * abs(r9.xy);
    r9.x = ps;
    ps = rsqrt(abs(r7.x));
    r16.xyz = r11.xzy * r7.yyy;
    r7.x = ps;
    ps = (-0.075) * r6.x;
    r11.xyz = r12.xzy * r7.xxx;
    r9.y = ps;
    ps = 1.0 * r6.x;
    r7.xyz = r16.yzx * r11.zyx;
    r9.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r13 = r9.zzzy * r4.xyzx;
    r6.y = ps;
    r7.xyz = r16.xyz * r11.yxz - r7.xyz;
    r9.zw = r13.xy * r9.xx + r8.xz;
    ps = r9.w;
    r12.xyz = r7.xyz * r11.www;
    ps = r6.y * ps;
    r6.x = dot(r12.zxy, r12.zxy);
    r8.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xy = -r8.xy + 1.0;
    r7.z = ps;
    ps = r14.y + r14.y;
    r19.yzw = r7.wxz * UniformVector_2.yyx;
    r18.w = ps;
    ps = r19.w;
    r8.xyz = r19.zxy - 0.5;
    ps = r9.z * ps;
    r24.xyz = float3((r19.xyz >= 0.5));
    r18.x = ps;
    r15.xyz = r18.zwx + float3(-1.0, -1.0, -0.5);
    r4.xyz = r8.yzx - r19.xyz;
    r8.yz = float2((r18.xy >= float2(0.5, 0.004)));
    r4.yzw = r4.zxy * r24.zxy + r19.zxy;
    ps = rsqrt(abs(r6.x));
    r12.w = r15.z - r18.x;
    r8.x = ps;
    r12 = r12.wxzy * r8.yxxx;
    r4.x = r18.x + r12.x;
    r18 = r4.zwxy + r4.zwxy;
    r4 = tex2D(Texture2D_6, r1.xy);
    r22 = tex2D(Texture2D_1, r18.zw);
    r23 = tex2D(Texture2D_1, r18.xy);
    r10.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r19.xyz = tex2D(Texture2D_8, r17.xy).xyz;
    r21.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r17.xyz = tex2D(Texture2D_2, r10.zw).xyw;
    r18.yzw = tex2D(Texture2D_0, r9.zw).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.zw).wxy;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r8.w = float((UniformScalar_5.x > 1.0));
    ps = UniformVector_6.x * UniformVector_6.w;
    r9.x = dot(r2.zxy, r2.zxy);
    r21.x = ps;
    r0.zw = r6.yz * 2.0 - 1.0;
    r20.xyz = r18.yzw * 2.0 - 1.0;
    r10.zw = r17.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r9.x));
    r25.yzw = r21.yzw + r21.yzw;
    r6.z = ps;
    r19.xyz = (-abs(r8.www) >= 0.0) ? r19.xyz : 1.0;
    r19.xyw = (-abs(r6.www) >= 0.0) ? 1.0 : r19.xyz;
    ps = r17.z;
    r14.xyz = r6.zzz * r2.xyz;
    ps = r14.w * ps;
    r10 = r10 * float4(0.875, 0.875, 0.5, 0.5);
    r14.w = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r15.zw = r14.wz + float2(-1.0, 0.1);
    r21.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.z = saturate(r15.w * 5.0);
    r21.z = ps;
    ps = (-1.0) + r6.x;
    r6.z = -r6.z + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r17.x = max(r13.z, 0.0);
    r17.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r25.x = r6.x * r7.y;
    r17.z = ps;
    ps = UniformScalar_1.x * r7.y;
    r2 = r25 + float4(1.0, -1.0, -1.0, -1.0);
    r6.y = ps;
    r19.z = r2.w * UniformVector_4.z - r20.z;
    r6.x = (r6.y > 0.0) ? r2.x : 1.0;
    r6.zw = r6.yy * r0.zw + r2.yz;
    r6.zw = r6.zw * UniformVector_4.xy - r20.xy;
    r21.w = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = r15.x;
    r0.z = dot(r24.xyy, float3(1.0, 1.0, 1.0));
    r6.y = (r0.z == 0.0) ? r23.x : r23.y;
    r0.w = r24.z * 2.0 + r8.y;
    r6.x = (r0.w == 0.0) ? r22.x : r22.y;
    ps = r10.z + ps;
    r24 = r21 * r4;
    r15.x = ps;
    ps = r15.y;
    r4.xyz = r24.xyz * r19.xyw;
    ps = r10.w + ps;
    r2 = r0.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r15.y = ps;
    r6.x = (r2.z == 0.0) ? r22.z : r6.x;
    r6.y = (r2.y == 0.0) ? r23.z : r6.y;
    ps = r4.x;
    r2.yz = r4.yz * r24.ww;
    r17.w = (r2.x == 0.0) ? r23.w : r6.y;
    r18.x = (r2.w == 0.0) ? r22.w : r6.x;
    ps = r21.w * ps;
    r6.y = max(r17.w, 0.0);
    r6.x = ps;
    ps = r6.x;
    r6.y = min(r6.y, 0.3);
    ps = r4.w * ps;
    r17 = -r17.wxyz + 1.0;
    r2.x = ps;
    ps = 3.3333333 * r6.y;
    r2.w = r17.x * 2.5;
    r6.x = ps;
    r19.xy = r6.xx * r15.xy + r6.zw;
    r12.x = r6.x * r15.z + 1.0;
    ps = -r14.w;
    r15 = r2.wxyz * r12.xxxx;
    ps = r18.x + ps;
    r8.w = saturate(r15.x - 0.5);
    r6.z = ps;
    r6.xy = r19.xy * r8.ww + r20.xy;
    r6.w = r19.z * r8.w - 2.0;
    r10.zw = r6.zw + r18.xw;
    r6.z = r10.w + r18.w;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r0.z = dot(r5.zxy, r5.zxy);
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r9.x = r13.w + r1.w;
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r13.zxy);
    r6.xyz = r4.xyz * r6.xxx;
    r13.xyz = r6.xyz * 2.0 - r13.xyz;
    r6.xyz = r16.zxy * r13.zzz;
    r6.xyz = r12.ywz * r13.yyy + r6.xyz;
    r6.xyw = r11.yzx * r13.xxx + r6.zyx;
    r7.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r7.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = r1.z;
    r6 = xe_cube(r6.xyz);
    r9.y = ps;
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r12.yzw = tex2D(Texture2D_7, r9.zw).xyz;
    r16.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r1.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r4.w;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r7.xyz = r7.xyz * LightMapScale.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r0.z));
    r11.yzw = r7.www * UniformVector_5.xyz;
    r6.x = ps;
    r0.xyz = r7.www * r1.xyz;
    r1.xyz = r4.www * UniformScalar_6.xxx + r11.ywz;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r10.xy = r10.xy * r17.zw;
    r11.x = ps;
    r0.xyz = r0.xzy * r17.yyy + r16.xzy;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r0.xyz = r11.ywz * r0.xyz;
    r11.y = ps;
    r2.xyz = r2.xyz * UniformScalar_7.xxx + r1.xzy;
    r1.xyz = r0.xyz * r8.www + UniformVector_0.xzy;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r10.yzw = r10.xyz + float3(0.125, 0.125, 1.25);
    r11.z = ps;
    ps = r6.x;
    r7.w = saturate(r10.w - r14.w);
    ps = r5.x * ps;
    r0.xyz = r7.www * r12.yzw;
    r12.y = ps;
    ps = r6.x;
    r15.xyz = r15.yzw - r0.xyz;
    r0.xyz = r15.xyz * r8.www + r0.xyz;
    r11.xyz = r11.xyz * r0.xyz + r1.xzy;
    ps = r5.y * ps;
    r0.xyz = r0.xyz * r6.yzw;
    r12.z = ps;
    ps = r6.x;
    r1.xyz = r7.xzy * r4.zzz;
    ps = r5.z * ps;
    r6.y = saturate(dot(r14.zxy, r13.zxy));
    r12.w = ps;
    ps = log2(r6.y);
    r6.x = dot(r12.wyz, r4.zxy);
    r6.y = ps;
    r6.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r12.yz = r6.xy + 0.5;
    r6.x = ps;
    r4.xyz = r7.xzy * r6.xxx;
    r6.xyw = abs(r12.yzx) * abs(r12.yzx);
    r7.xyz = r0.xzy * r6.xxx;
    ps = r6.w * r6.w;
    r6.xyz = r0.xzy * r6.yyy;
    r10.x = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r11.xzy;
    r7.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xw = r10.yx * r10.zx;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r2.xyz = r6.www * r2.xyz;
    r2.xyz = r2.xzy * r8.www;
    r7.xyz = r4.xyz * r2.xyz + r7.xzy;
    r7.xyz = r1.xzy * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r8.z + r3.w;
    r6.xyz = r7.xyz * r8.zzz + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
