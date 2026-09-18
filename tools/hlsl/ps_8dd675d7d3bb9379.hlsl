// ps_8dd675d7d3bb9379.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 492 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000007B0 10041800 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 ConstantLighting : register(c22); // float3
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r13.xy = r0.wz * 6.0;
    ps = r0.w;
    r9.zw = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r6.w = -r0.z + 1.0;
    r18.x = ps;
    ps = r2.w;
    r13.zw = r0.wz * UniformVector_7.xy;
    ps = 0.0001 * ps;
    r7.w = r2.w - 4e+02;
    r7.y = saturate(ps);
    r14 = r5.yxzw * 2.0 - 1.0;
    r11.xyz = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = saturate(OpacityOverride.x);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r7.xz = r0.wz * UniformVector_1.xy;
    r10.y = ps;
    ps = r12.x + r12.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r11.zxy, r11.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r6.y = dot(r14.zyx, r14.zyx);
    r5.x = ps;
    ps = rsqrt(abs(r6.y));
    r5.y = saturate(r7.w * 0.00022222222);
    r6.y = ps;
    ps = (-0.025) * r5.y;
    r5.zw = r5.zw * abs(r8.xy);
    r15.x = ps;
    ps = rsqrt(abs(r6.x));
    r17.xyz = r14.xzy * r6.yyy;
    r6.x = ps;
    ps = (-0.075) * r5.x;
    r8.xyz = r11.xzy * r6.xxx;
    r15.y = ps;
    ps = 1.0 * r5.x;
    r6.xyz = r17.yzx * r8.zyx;
    r15.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r11 = r15.zzzy * r3.xyzx;
    r5.y = ps;
    r6.xyz = r17.xyz * r8.yxz - r6.xyz;
    r15.xy = r11.xy * r15.xx + r7.xz;
    ps = r15.y;
    r16.xyz = r6.xyz * r14.www;
    ps = r5.y * ps;
    r5.x = dot(r16.zxy, r16.zxy);
    r7.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xy = -r7.xy + 1.0;
    r6.z = ps;
    ps = r12.y + r12.y;
    r18.yzw = r6.wxz * UniformVector_2.yyx;
    r10.w = ps;
    ps = r18.w;
    r7.xyz = r18.zxy - 0.5;
    ps = r15.x * ps;
    r23.xyz = float3((r18.xyz >= 0.5));
    r10.x = ps;
    r14.xyz = r10.zwx + float3(-1.0, -1.0, -0.5);
    r3.xyz = r7.yzx - r18.xyz;
    r7.yz = float2((r10.xy >= float2(0.5, 0.004)));
    r3.yzw = r3.zxy * r23.zxy + r18.zxy;
    ps = rsqrt(abs(r5.x));
    r16.w = r14.z - r10.x;
    r7.x = ps;
    r16 = r16.xzyw * r7.xxxy;
    r3.x = r10.x + r16.w;
    r18 = r3.zwxy + r3.zwxy;
    r3 = tex2D(Texture2D_6, r0.xy);
    r10 = tex2D(Texture2D_1, r18.zw).wxyz;
    r22 = tex2D(Texture2D_1, r18.xy);
    r9.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r20.yzw = tex2D(Texture2D_8, r13.zw).xyz;
    r21.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r13.xy).xyw;
    r18.yzw = tex2D(Texture2D_0, r15.xy).xyz;
    r5.xyz = tex2D(Texture2D_3, r9.zw).wxy;
    r5.w = float((UniformScalar_5.x >= 1.0));
    r7.w = float((UniformScalar_5.x > 1.0));
    ps = UniformVector_6.x * UniformVector_6.w;
    r8.w = dot(r1.zxy, r1.zxy);
    r20.x = ps;
    r15.zw = r5.yz * 2.0 - 1.0;
    r19.xyz = r18.yzw * 2.0 - 1.0;
    r9.zw = r13.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r8.w));
    r24.yzw = r21.xyz + r21.xyz;
    r5.z = ps;
    r20.yzw = (-abs(r7.www) >= 0.0) ? r20.yzw : 1.0;
    r21.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r20.yzw;
    ps = r13.z;
    r12.xyz = r5.zzz * r1.xyz;
    ps = r12.w * ps;
    r9 = r9 * float4(0.875, 0.875, 0.5, 0.5);
    r12.w = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r14.zw = r12.wz + float2(-1.0, 0.1);
    r20.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.z = saturate(r14.w * 5.0);
    r20.z = ps;
    ps = (-1.0) + r5.x;
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r13.x = max(r11.z, 0.0);
    r13.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r24.x = r5.x * r6.y;
    r13.z = ps;
    ps = UniformScalar_1.x * r6.y;
    r1 = r24 + float4(1.0, -1.0, -1.0, -1.0);
    r5.y = ps;
    r1.w = r1.w * UniformVector_4.z - r19.z;
    r5.x = (r5.y > 0.0) ? r1.x : 1.0;
    r5.zw = r5.yy * r15.zw + r1.yz;
    r5.zw = r5.zw * UniformVector_4.xy - r19.xy;
    r20.w = (r5.y >= 0.0) ? r5.x : 1.0;
    ps = r14.x;
    r15.z = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r5.y = (r15.z == 0.0) ? r22.x : r22.y;
    r15.w = r23.z * 2.0 + r7.y;
    r5.x = (r15.w == 0.0) ? r10.y : r10.z;
    ps = r9.z + ps;
    r23 = r20 * r3;
    r14.x = ps;
    ps = r14.y;
    r1.xyz = r23.xyz * r21.xyz;
    ps = r9.w + ps;
    r21 = r15.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r14.y = ps;
    r5.x = (r21.z == 0.0) ? r10.w : r5.x;
    r5.y = (r21.y == 0.0) ? r22.z : r5.y;
    ps = r1.x;
    r10.yz = r1.yz * r23.ww;
    r13.w = (r21.x == 0.0) ? r22.w : r5.y;
    r18.x = (r21.w == 0.0) ? r10.x : r5.x;
    ps = r20.w * ps;
    r5.y = max(r13.w, 0.0);
    r5.x = ps;
    ps = r5.x;
    r5.y = min(r5.y, 0.3);
    ps = r3.w * ps;
    r13 = -r13.wyxz + 1.0;
    r10.x = ps;
    ps = 3.3333333 * r5.y;
    r10.w = r13.x * 2.5;
    r5.x = ps;
    r1.xz = r5.xx * r14.xy + r5.zw;
    r1.y = r5.x * r14.z + 1.0;
    ps = -r12.w;
    r14 = r10.wxyz * r1.yyyy;
    ps = r18.x + ps;
    r7.w = saturate(r14.x - 0.5);
    r5.z = ps;
    r5.xy = r1.xz * r7.ww + r19.xy;
    r5.w = r1.w * r7.w - 2.0;
    r9.zw = r5.zw + r18.xw;
    r5.z = r9.w + r18.w;
    r5.xyz = r5.zxy * r6.yyy;
    ps = 1.0 + r5.x;
    r8.w = -r3.w + 1.0;
    r5.w = ps;
    r5.xyz = (r6.yyy > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.yyy >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.x = r11.w + r0.w;
    r5.x = ps;
    r6.xyw = r5.yzw * r5.xxx;
    r5.x = dot(r6.wxy, r11.zxy);
    r5.xyz = r6.xyw * r5.xxx;
    r11.xyz = r5.xyz * 2.0 - r11.xyz;
    r5.xyz = r17.zxy * r11.zzz;
    r5.xyz = r16.xzy * r11.yyy + r5.xyz;
    r5.xyw = r8.yzx * r11.xxx + r5.zyx;
    r8.xyz = r5.xxx * LocalToWorldMatrix[2].xzy;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xzy + r8.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = r0.z;
    r5 = xe_cube(r5.xyz);
    r1.z = ps;
    ps = 1.0 / abs(r5.z);
    r8.z = r5.w;
    r6.z = ps;
    r8.xy = r5.yx * r6.zz + 1.5;
    r0.xyz = tex2D(Texture2D_7, r15.xy).xyz;
    r1.xzw = tex2D(Texture2D_5, r1.xz).xyz;
    r16.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r4.zxy, r4.zxy);
    r5.xyz = -UniformVector_0.zxy + 1.0;
    ps = rsqrt(abs(r5.w));
    r15.xyz = r8.www * UniformVector_5.xyz;
    r5.w = ps;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r16.xyz = r8.www * r16.xyz;
    r13.x = ps;
    r3.xyz = r3.www * UniformScalar_6.xxx + r15.xzy;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r9.xy = r9.xy * r13.yw;
    r13.y = ps;
    r1.xzw = r16.xzy * r13.zzz + r1.xwz;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r1.xzw = r15.xzy * r1.xzw;
    r13.z = ps;
    r3.xyz = r10.xyz * UniformScalar_7.xxx + r3.xzy;
    r10.xyz = r1.xzw * r7.www + UniformVector_0.xzy;
    ps = r5.w;
    r9.yzw = r9.xyz + float3(0.125, 0.125, 1.25);
    ps = r4.x * ps;
    r6.z = saturate(r9.w - r12.w);
    r1.x = ps;
    ps = r5.w;
    r0.xyz = r6.zzz * r0.xyz;
    ps = r4.y * ps;
    r14.xyz = r14.yzw - r0.xyz;
    r1.z = ps;
    r0.xyz = r14.xyz * r7.www + r0.xyz;
    r10.xyz = r13.xyz * r0.xyz + r10.xzy;
    ps = r5.w;
    r0.xyz = r0.xyz * r5.yzx;
    ps = r4.z * ps;
    r5.y = saturate(dot(r12.zxy, r11.zxy));
    r1.w = ps;
    ps = log2(r5.y);
    r5.x = dot(r1.wxz, r6.wxy);
    r5.y = ps;
    ps = ConstantLighting.x * r6.w;
    r5.xyz = r5.xxy * float3(-0.5, 0.5, 15.0);
    r1.x = ps;
    ps = pow(2.0, r5.z);
    r1.zw = r5.xy + 0.5;
    r5.w = ps;
    ps = ConstantLighting.y * r6.w;
    r11.xyz = abs(r1.yzw) * abs(r1.yzw);
    r1.y = ps;
    ps = ConstantLighting.z * r6.w;
    r4.xyz = r0.xzy * r11.yyy;
    r1.z = ps;
    ps = r11.x * r11.x;
    r5.xyz = r0.xzy * r11.zzz;
    r9.x = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r10.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.x * r5.w;
    r4.yz = r9.xy * r9.xz;
    r4.x = ps;
    r5.xyz = r4.zzz * r8.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r5.w;
    r3.xyz = r4.yyy * r3.xyz;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r3.xyz = r3.xzy * r7.www;
    r4.z = ps;
    r6.xyz = r4.xyz * r3.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r7.z + r2.w;
    r5.xyz = r6.xyz * r7.zzz + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
