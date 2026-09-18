// ps_101931a94f60c9a0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 504 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000007E0 10041A00 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r0.w;
    r7.z = dot(r3.zxy, r3.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r7.z));
    r7.xy = r0.xy * UniformScalar_0.xx;
    r7.z = ps;
    r7.zw = r7.zz * float2(-0.075, 1.0);
    r22 = r7.zwww * r3.xzxy;
    ps = r0.z;
    r7.z = r22.x + r0.w;
    r7.w = ps;
    r10.yzw = tex2D(Texture2D_7, r7.zw).xyz;
    r7.xyw = tex2D(Texture2D_4, r7.xy).xyw;
    ps = 1.0 - r0.z;
    r3.x = ps;
    r11.xyz = r6.xyz * 2.0 - 1.0;
    r9 = r5.wyxz * 2.0 - 1.0;
    ps = OpacityOverride.x;
    r6 = r0.wzwz * float4(0.5, 0.5, 6.0, 6.0);
    r5.x = saturate(ps);
    ps = r2.w;
    r3.yz = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r5.w = dot(r9.wzy, r9.wzy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r11.zxy, r11.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r21.xyz = r9.ywz * r5.www;
    r5.z = ps;
    ps = 0.00022222222 * r5.y;
    r16.xyz = r11.xzy * r5.zzz;
    r10.x = saturate(ps);
    ps = 1.0 - r5.x;
    r19 = r10 * float4(-0.025, 6.0, 6.0, 6.0);
    r9.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.xyz = r21.yzx * r16.zyx;
    r5.w = ps;
    r13.xy = r22.zw * r19.xx + r3.yz;
    r3.y = -r13.y * r5.w + 1.0;
    r5.xyz = r21.xyz * r16.yxz - r5.xyz;
    ps = r7.x + r7.x;
    r11.xyz = r5.xyz * r9.xxx;
    r9.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = dot(r11.zxy, r11.zxy);
    r3.z = ps;
    ps = r7.y + r7.y;
    r12.yzw = r3.xyz * UniformVector_2.yyx;
    r9.w = ps;
    ps = r12.w;
    r5.yzw = r12.zxy - 0.5;
    ps = r13.x * ps;
    r7.xyz = float3((r12.xzy >= 0.5));
    r9.x = ps;
    r3.xyz = r9.zxw + float3(-1.0, -0.5, -1.0);
    r5.yzw = r5.zwy - r12.xyz;
    r10.yz = float2((r9.xy >= float2(0.5, 0.004)));
    r5.yzw = r5.wyz * r7.yxz + r12.zxy;
    ps = rsqrt(abs(r5.x));
    r11.w = r3.y - r9.x;
    r10.x = ps;
    r20 = r11.xzyw * r10.xxxy;
    r5.x = r9.x + r20.w;
    r5 = r5.zwxy + r5.zwxy;
    r9.zw = tex2D(Texture2D_3, r6.xy).xy;
    r17 = tex2D(Texture2D_1, r5.zw);
    r18 = tex2D(Texture2D_1, r5.xy);
    r15 = tex2D(Texture2D_6, r0.xy).wxyz;
    r11.xyw = tex2D(Texture2D_5, r0.xy).xyz;
    r26.yzw = tex2D(Texture2D_0, r13.xy).xyz;
    r6.xyw = tex2D(Texture2D_2, r6.zw).xyw;
    r5.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r11.z = saturate(r2.w * 0.0001);
    r5.w = dot(r1.zxy, r1.zxy);
    r13.zw = r5.xy * 2.0 - 1.0;
    r14.zw = r6.xy * 2.0 - 1.0;
    r23.xyz = r26.yzw * 2.0 - 1.0;
    r6.xyz = r11.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r3.y = float((r15.x >= 0.5));
    r5.w = ps;
    ps = UniformVector_4.z * r6.x;
    r12.xyz = r5.www * r1.xyz;
    r12.w = ps;
    ps = r6.w;
    r5.xy = r12.zw + float2(0.1, -1.0);
    r24.x = r5.y * r3.y - r23.z;
    ps = r5.z * ps;
    r7.x = dot(r7.xzz, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.w = (r7.x == 0.0) ? r18.x : r18.y;
    r7.y = r7.y * 2.0 + r10.y;
    r5.z = (r7.y == 0.0) ? r17.x : r17.y;
    ps = 5.0 * r5.x;
    r1 = r7.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.x = saturate(ps);
    r5.z = (r1.z == 0.0) ? r17.z : r5.z;
    r5.y = (r1.y == 0.0) ? r18.z : r5.w;
    r5.y = (r1.x == 0.0) ? r18.w : r5.y;
    r9.x = (r1.w == 0.0) ? r17.w : r5.z;
    ps = 0.25 + r9.x;
    r5.zw = -r5.xy + 1.0;
    r9.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r11.w = max(r22.y, 0.0);
    r11.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r7.xyz = r9.zyw + r9.zxw;
    r11.y = ps;
    ps = (-1.0) + r7.x;
    r5.x = max(r5.y, 0.0);
    r14.x = ps;
    ps = (-1.0) + r7.z;
    r11 = -r11.wxyz + 1.0;
    r14.y = ps;
    ps = r11.w;
    r5.x = min(r5.x, 0.3);
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r25 = r14 * float4(0.012, 0.012, 0.5, 0.5);
    r6.w = ps;
    ps = log2(abs(r11.x));
    r9.yz = r13.zw + r25.zw;
    r5.y = ps;
    r6.yz = r6.ww * r3.xz + r6.yz;
    r3.xz = r6.yz * UniformVector_4.xy - r25.xy;
    ps = (-1.0) - -r6.x;
    r1.xyz = r5.xwy * float3(3.3333333, 2.5, 0.0125);
    r9.x = ps;
    r24.yzw = r1.xxx * r9.xyz;
    r14.yz = r24.xy + 1.0;
    r14.w = saturate(r1.y * r14.z - 0.5);
    ps = abs(r14.z) * abs(r14.z);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = UniformScalar_6.x * r3.y;
    r14.x = r5.x * r5.x;
    r26.x = ps;
    ps = 1.0 - r3.y;
    r7.xz = r14.xy * r14.xw;
    r5.x = ps;
    ps = (-2.0) + r7.z;
    r18.xyz = r5.xxx * UniformVector_5.xyz;
    r18.w = ps;
    r17 = r18.xzyw + r26.xxxw;
    ps = (-1.0) + r7.w;
    r5.y = r17.w + r26.w;
    r5.x = ps;
    r5.yw = r5.yx * r11.ww + 1.0;
    r5.x = (r6.w > 0.0) ? r5.w : 1.0;
    r3.w = (r6.w >= 0.0) ? r5.x : 1.0;
    r1.xyw = r3.xzy * r3.yyw;
    r5.xz = r25.xy + r1.xy;
    r5.xz = r5.xz + r24.zw;
    r5.xz = -r23.xy + r5.xz;
    r5.xz = r5.xz * r14.ww + r23.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xz = r5.xz * r11.ww;
    r6.y = ps;
    r5.xyz = (r11.www > 0.0) ? r5.xyz : float3(0.0, 1.0, 0.0);
    r5.yzw = (r11.www >= 0.0) ? r5.xyz : float3(0.0, 1.0, 0.0);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r5.zyw, r5.zyw);
    r6.z = ps;
    ps = rsqrt(abs(r5.x));
    r3.zw = r6.yz * abs(r8.xy);
    r5.x = ps;
    r6.yzw = r5.ywz * r5.xxx;
    r5.x = dot(r6.wyz, r22.yzw);
    ps = r0.w;
    r5.xyz = r6.yzw * r5.xxx;
    r8.xyz = r5.xyz * 2.0 - r22.zwy;
    ps = UniformVector_7.x * ps;
    r5.xyz = r21.zxy * r8.zzz;
    r3.x = ps;
    r5.xyz = r20.xzy * r8.yyy + r5.xyz;
    r5.xyw = r16.yzx * r8.xxx + r5.zyx;
    ps = r0.z;
    r16.xyz = r5.xxx * LocalToWorldMatrix[2].xzy;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xzy + r16.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = UniformVector_7.y * ps;
    r5 = xe_cube(r5.xyz);
    r3.y = ps;
    ps = 1.0 / abs(r5.z);
    r16.z = r5.w;
    r7.w = ps;
    r16.xy = r5.yx * r7.ww + 1.5;
    r0.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r16.xyz = texCUBE(TextureCube_0, xe_cube_dir(r16.xyz)).xyz;
    r13.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r3.xyz = tex2D(Texture2D_9, r3.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r7.w = float((UniformScalar_5.x >= 1.0));
    r20.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.w = dot(r4.zxy, r4.zxy);
    r20.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.xyz = -UniformVector_0.zxy + 1.0;
    r20.z = ps;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r0.z = float((UniformScalar_5.x > 1.0));
    r15.x = ps;
    r3.xyz = (-abs(r0.zzz) >= 0.0) ? r3.xyz : 1.0;
    ps = rsqrt(abs(r5.w));
    r15.yzw = r20.xyz * r15.yzw;
    r5.w = ps;
    r3.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r3.xyz;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r3.xyz = r15.yzw * r3.xyz;
    r15.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r6.x = saturate(r7.y - r6.x);
    r15.z = ps;
    ps = pow(2.0, r1.z);
    r13.yzw = r6.xxx * r13.xyz;
    r6.x = ps;
    ps = r5.w;
    r6.x = -r6.x + 1.0;
    r16.xyz = r19.ywz * r6.xxx + r16.xzy;
    ps = r4.x * ps;
    r16.xyz = r18.xzy * r16.xyz;
    r13.x = ps;
    r1.xyz = r16.xyz * r14.www + UniformVector_0.xzy;
    ps = r5.w;
    r16.xyz = r3.xyz * r1.www;
    r3.xyz = r16.xyz * UniformScalar_7.xxx + r17.xzy;
    r16.xyz = r16.xyz * r14.zzz - r13.yzw;
    r14.xyz = r16.xyz * r14.www + r13.yzw;
    ps = r4.y * ps;
    r7.xyz = r7.xxx * r3.xyz;
    r13.y = ps;
    ps = r5.w;
    r3.xyz = r7.xzy * r3.xzy;
    r1.xyz = r15.xyz * r14.xyz + r1.xzy;
    ps = r4.z * ps;
    r7.xyz = r14.xyz * r5.yzx;
    r13.z = ps;
    r0.z = dot(r13.zxy, r6.wyz);
    r0 = r0.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r5.y = saturate(dot(r12.zxy, r8.zxy));
    r5.xz = r0.xy * r11.yz + 0.125;
    ps = ConstantLighting.x * r6.w;
    r0.yz = r0.zw + 0.5;
    r0.x = ps;
    ps = ConstantLighting.y * r6.w;
    r0.zw = abs(r0.yz) * abs(r0.yz);
    r0.y = ps;
    ps = log2(r5.y);
    r5.x = r5.x * r5.z;
    r5.y = ps;
    r5.xzw = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.y;
    r4.xyz = r7.xzy * r0.zzz;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r8.xyz = r7.xzy * r0.www;
    r5.y = ps;
    r1.xyz = r8.xyz * UpperSkyColor.xzy + r1.xzy;
    r1.xyz = r4.xzy * LowerSkyColor.xyz + r1.xzy;
    ps = ConstantLighting.z * r6.w;
    r4.xyz = r5.yyy * ConstantLighting.xzy;
    r0.z = ps;
    r6.xyz = r4.xyz * r3.xyz + r1.xzy;
    r6.xyz = r0.xyz * r7.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xwz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r10.z + r2.w;
    r5.xyz = r6.xyz * r10.zzz + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
