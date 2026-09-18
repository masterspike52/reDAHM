// ps_aa6286545381962e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 489 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000007A4 10041800 0000080A 00000000 00007108 003F00FF 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
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
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r0.zw = r1.xy * 6.0;
    ps = r1.x;
    r1.zw = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r7.w = -r1.y + 1.0;
    r14.x = ps;
    ps = r3.w;
    r9.zw = r1.xy * UniformVector_7.xy;
    ps = 0.0001 * ps;
    r9.x = r3.w - 4e+02;
    r9.y = saturate(ps);
    r12 = r6.yxzw * 2.0 - 1.0;
    r13.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = saturate(OpacityOverride.x);
    r6.z = ps;
    ps = 1.0 - r6.x;
    r11.xw = r1.xy * UniformVector_1.xy;
    r11.y = ps;
    ps = r10.x + r10.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r13.zxy, r13.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.y = dot(r12.zyx, r12.zyx);
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r6.y = saturate(r9.x * 0.00022222222);
    r7.y = ps;
    ps = (-0.025) * r6.y;
    r6.zw = r6.zw * abs(r8.xy);
    r8.x = ps;
    ps = rsqrt(abs(r7.x));
    r17.xyz = r12.xzy * r7.yyy;
    r7.x = ps;
    ps = (-0.075) * r6.x;
    r15.xyz = r13.xzy * r7.xxx;
    r8.y = ps;
    ps = 1.0 * r6.x;
    r7.xyz = r17.yzx * r15.zyx;
    r8.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r18 = r8.zzzy * r4.xyzx;
    r6.y = ps;
    r7.xyz = r17.xyz * r15.yxz - r7.xyz;
    r13.xy = r18.xy * r8.xx + r11.xw;
    ps = r13.y;
    r12.xyz = r7.xyz * r12.www;
    ps = r6.y * ps;
    r6.x = dot(r12.zxy, r12.zxy);
    r9.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xy = -r9.xy + 1.0;
    r7.z = ps;
    ps = r10.y + r10.y;
    r14.yzw = r7.wxz * UniformVector_2.yyx;
    r11.w = ps;
    ps = r14.w;
    r4.xyz = r14.zxy - 0.5;
    ps = r13.x * ps;
    r24.xyz = float3((r14.xyz >= 0.5));
    r11.x = ps;
    r10.xyw = r11.xzw + float3(-0.5, -1.0, -1.0);
    r8.xyz = r4.yzx - r14.xyz;
    r4.yz = float2((r11.xy >= float2(0.5, 0.004)));
    r8.yzw = r8.zxy * r24.zxy + r14.zxy;
    ps = rsqrt(abs(r6.x));
    r12.w = r10.x - r11.x;
    r4.x = ps;
    r16 = r12.xzyw * r4.xxxy;
    r8.x = r11.x + r16.w;
    r11 = r8.zwxy + r8.zwxy;
    r8 = tex2D(Texture2D_6, r0.xy);
    r14 = tex2D(Texture2D_1, r11.zw);
    r22 = tex2D(Texture2D_1, r11.xy);
    r9.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r11.xyz = tex2D(Texture2D_8, r9.zw).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_2, r0.zw).wxy;
    r19.yzw = tex2D(Texture2D_0, r13.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r1.zw).wxy;
    r7.z = float((UniformScalar_5.x >= 1.0));
    ps = UniformVector_6.x * UniformVector_6.w;
    r7.w = float((UniformScalar_5.x > 1.0));
    r23.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r23.y = ps;
    r1.zw = r6.yz * 2.0 - 1.0;
    r20.xyz = r19.yzw * 2.0 - 1.0;
    r9.zw = r0.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r0.yzw = r12.xyz + r12.xyz;
    r6.w = ps;
    r11.xyz = (-abs(r7.www) >= 0.0) ? r11.xyz : 1.0;
    r21.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r11.xyz;
    ps = r0.x;
    r12.xyz = r6.www * r2.xyz;
    ps = r10.z * ps;
    r9 = r9 * float4(0.875, 0.875, 0.5, 0.5);
    r12.w = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r2.xw = r12.zw + float2(0.1, -1.0);
    r23.z = ps;
    ps = 5.0 * r2.x;
    r7.w = max(r18.z, 0.0);
    r7.z = saturate(ps);
    ps = (-1.0) + r6.x;
    r7.zw = -r7.wz + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r7.w;
    r0.x = r6.x * r7.y;
    r11.y = ps;
    ps = UniformScalar_1.x * r7.y;
    r0 = r0 + float4(1.0, -1.0, -1.0, -1.0);
    r6.y = ps;
    r11.w = r0.w * UniformVector_4.z - r20.z;
    r6.x = (r6.y > 0.0) ? r0.x : 1.0;
    r6.zw = r6.yy * r1.zw + r0.yz;
    r6.zw = r6.zw * UniformVector_4.xy - r20.xy;
    r23.w = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = ModShadowGroupColor.y * r7.w;
    r1.z = dot(r24.xyy, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    r6.y = (r1.z == 0.0) ? r22.x : r22.y;
    r1.w = r24.z * 2.0 + r4.y;
    r6.x = (r1.w == 0.0) ? r14.x : r14.y;
    ps = r10.y;
    r0 = r23 * r8;
    ps = r9.z + ps;
    r10.xyz = r0.xyz * r21.xyz;
    r2.y = ps;
    ps = r10.w;
    r21 = r1.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = (r21.z == 0.0) ? r14.z : r6.x;
    r1.z = (r21.y == 0.0) ? r22.z : r6.y;
    ps = r9.w + ps;
    r6.y = r10.x * r23.w;
    r2.z = ps;
    r11.x = (r21.x == 0.0) ? r22.w : r1.z;
    r19.x = (r21.w == 0.0) ? r14.w : r6.x;
    ps = r6.y;
    r6.x = max(r11.x, 0.0);
    ps = r8.w * ps;
    r0.xyz = -r11.yxz + 1.0;
    r10.x = ps;
    ps = 2.5 * r0.y;
    r6.y = min(r6.x, 0.3);
    r10.w = ps;
    ps = 3.3333333 * r6.y;
    r10.yz = r10.yz * r0.ww;
    r6.x = ps;
    r11.xy = r6.xx * r2.yz + r6.zw;
    r11.z = r6.x * r2.w + 1.0;
    ps = -r12.w;
    r14 = r10.wxyz * r11.zzzz;
    ps = r19.x + ps;
    r0.w = saturate(r14.x - 0.5);
    r6.z = ps;
    r6.xy = r11.xy * r0.ww + r20.xy;
    r6.w = r11.w * r0.w - 2.0;
    r9.zw = r6.zw + r19.xw;
    r6.z = r9.w + r19.w;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r1.w = -r8.w + 1.0;
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.z = r18.w + r1.x;
    r6.x = ps;
    r7.xyw = r6.yzw * r6.xxx;
    r6.x = dot(r7.wxy, r18.zxy);
    r6.xyz = r7.xyw * r6.xxx;
    r11.xyw = r6.xyz * 2.0 - r18.xyz;
    r6.xyz = r17.zxy * r11.www;
    r6.xyz = r16.xzy * r11.yyy + r6.xyz;
    r6.xyw = r15.yzx * r11.xxx + r6.zyx;
    r2.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r2.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    r6 = xe_cube(r6.xyz);
    ps = 1.0 / abs(r6.z);
    r2.z = r6.w;
    r2.x = ps;
    r2.xy = r6.yx * r2.xx + 1.5;
    r15.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r1.xyz = tex2D(Texture2D_5, r1.zy).xyz;
    r2.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r5.zxy, r5.zxy);
    r6.xyz = -UniformVector_0.zxy + 1.0;
    ps = rsqrt(abs(r6.w));
    r13.yzw = r1.www * UniformVector_5.xyz;
    r6.w = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r16.xyz = r1.www * r2.xyz;
    r13.x = ps;
    r2.xyz = r8.www * UniformScalar_6.xxx + r13.ywz;
    r1.xyz = r16.xzy * r7.zzz + r1.xzy;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r1.xyz = r13.ywz * r1.xyz;
    r13.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r9.xy = r9.xy * r0.xz;
    r13.z = ps;
    r2.xyz = r10.xyz * UniformScalar_7.xxx + r2.xzy;
    r10.xyz = r1.xyz * r0.www + UniformVector_0.xzy;
    ps = r6.w;
    r9.yzw = r9.xyz + float3(0.125, 0.125, 1.25);
    ps = r5.x * ps;
    r7.z = saturate(r9.w - r12.w);
    r1.x = ps;
    ps = r6.w;
    r0.xyz = r7.zzz * r15.xyz;
    ps = r5.y * ps;
    r14.xyz = r14.yzw - r0.xyz;
    r1.y = ps;
    r0.xyz = r14.xyz * r0.www + r0.xyz;
    r10.xyz = r13.xyz * r0.xyz + r10.xzy;
    ps = r6.w;
    r0.xyz = r0.xyz * r6.yzx;
    ps = r5.z * ps;
    r6.y = saturate(dot(r12.zxy, r11.wxy));
    r1.z = ps;
    ps = log2(r6.y);
    r6.x = dot(r1.zxy, r7.wxy);
    r6.y = ps;
    ps = ConstantLighting.x * r7.w;
    r6.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    r1.x = ps;
    ps = pow(2.0, r6.z);
    r11.xy = r6.xy + 0.5;
    r6.w = ps;
    ps = ConstantLighting.y * r7.w;
    r11.xyz = abs(r11.xyz) * abs(r11.xyz);
    r1.y = ps;
    ps = ConstantLighting.z * r7.w;
    r5.xyz = r0.xzy * r11.xxx;
    r1.z = ps;
    ps = r11.z * r11.z;
    r6.xyz = r0.xzy * r11.yyy;
    r9.x = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r10.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    ps = ConstantLighting.x * r6.w;
    r5.yz = r9.xy * r9.xz;
    r5.x = ps;
    r6.xyz = r5.zzz * r8.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r6.w;
    r2.xyz = r5.yyy * r2.xyz;
    r5.y = ps;
    ps = ConstantLighting.y * r6.w;
    r2.xyz = r2.xzy * r0.www;
    r5.z = ps;
    r7.xyz = r5.xyz * r2.xyz + r7.xzy;
    r7.xyz = r1.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r4.z + r3.w;
    r6.xyz = r7.xyz * r4.zzz + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
