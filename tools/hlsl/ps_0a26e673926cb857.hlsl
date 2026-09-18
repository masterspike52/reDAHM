// ps_0a26e673926cb857.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 510 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000007F8 10041A00 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
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

    ps = UniformVector_2.x * r0.w;
    r8.z = dot(r4.zxy, r4.zxy);
    r13.x = ps;
    ps = rsqrt(abs(r8.z));
    r8.xy = r0.xy * UniformScalar_0.xx;
    r8.z = ps;
    ps = 1.0 - r0.z;
    r8.zw = r8.zz * float2(-0.075, 1.0);
    r10.x = ps;
    r23 = r8.zwww * r4.xzxy;
    ps = r0.z;
    r8.z = r23.x + r0.w;
    r8.w = ps;
    r11.yzw = tex2D(Texture2D_7, r8.zw).xyz;
    r3.xyz = tex2D(Texture2D_4, r8.xy).wxy;
    r10.yzw = r7.xyz * 2.0 - 1.0;
    r8 = r6.wyxz * 2.0 - 1.0;
    ps = OpacityOverride.x;
    r7 = r0.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r6.x = saturate(ps);
    ps = r3.w;
    r4.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.w = dot(r8.wzy, r8.wzy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r10.wyz, r10.wyz);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r22.xyz = r8.ywz * r6.www;
    r6.z = ps;
    ps = 0.00022222222 * r6.y;
    r17.xyz = r10.ywz * r6.zzz;
    r11.x = saturate(ps);
    ps = 1.0 - r6.x;
    r19 = r11 * float4(-0.025, 6.0, 6.0, 6.0);
    r8.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.xyz = r22.yzx * r17.zyx;
    r6.w = ps;
    r14.zw = r23.zw * r19.xx + r4.xy;
    r10.y = -r14.w * r6.w + 1.0;
    r6.xyz = r22.xyz * r17.yxz - r6.xyz;
    ps = r3.y + r3.y;
    r4.xyz = r6.xyz * r8.xxx;
    r8.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r10.z = ps;
    ps = r3.z + r3.z;
    r13.yzw = r10.xyz * UniformVector_2.yyx;
    r8.w = ps;
    ps = r13.w;
    r6.yzw = r13.zxy - 0.5;
    ps = r14.z * ps;
    r11.xyw = float3((r13.xyz >= 0.5));
    r8.x = ps;
    r12.xyz = r8.xzw + float3(-0.5, -1.0, -1.0);
    r6.yzw = r6.zwy - r13.xyz;
    r10.yz = float2((r8.xy >= float2(0.5, 0.004)));
    r6.yzw = r6.wyz * r11.wxy + r13.zxy;
    ps = rsqrt(abs(r6.x));
    r4.w = r12.x - r8.x;
    r10.x = ps;
    r21 = r4.xzyw * r10.xxxy;
    r6.x = r8.x + r21.w;
    r6 = r6.zwxy + r6.zwxy;
    r7.zw = tex2D(Texture2D_3, r7.zw).xy;
    r8 = tex2D(Texture2D_1, r6.zw);
    r18 = tex2D(Texture2D_1, r6.xy);
    r20 = tex2D(Texture2D_6, r0.xy);
    r13.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r26.yzw = tex2D(Texture2D_0, r14.zw).xyz;
    r4.xyw = tex2D(Texture2D_2, r7.xy).xyw;
    r6.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r11.z = saturate(r3.w * 0.0001);
    r7.x = dot(r2.zxy, r2.zxy);
    r14.xy = r6.xy * 2.0 - 1.0;
    r16.zw = r4.xy * 2.0 - 1.0;
    r15.xyz = r26.ywz * 2.0 - 1.0;
    r4.xyz = r13.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r6.z = float((r20.w >= 0.5));
    r7.x = ps;
    ps = UniformVector_4.z * r4.x;
    r13.xyz = r7.xxx * r2.xyz;
    r13.w = ps;
    ps = r4.w;
    r6.xy = r13.wz + float2(-1.0, 0.1);
    r24.x = r6.x * r6.z - r15.y;
    ps = r6.w * ps;
    r2.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r6.w = (r2.x == 0.0) ? r18.x : r18.y;
    r2.y = r11.w * 2.0 + r10.y;
    r7.x = (r2.y == 0.0) ? r8.x : r8.y;
    ps = 5.0 * r6.y;
    r2 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.y = saturate(ps);
    r7.x = (r2.z == 0.0) ? r8.z : r7.x;
    r6.w = (r2.y == 0.0) ? r18.z : r6.w;
    r6.w = (r2.x == 0.0) ? r18.w : r6.w;
    r7.x = (r2.w == 0.0) ? r8.w : r7.x;
    ps = 0.25 + r7.x;
    r8.zw = -r6.yw + 1.0;
    r7.y = ps;
    ps = ModShadowGroupColor.x * r8.z;
    r11.w = max(r23.y, 0.0);
    r11.x = ps;
    ps = ModShadowGroupColor.y * r8.z;
    r7.xyz = r7.zyw + r7.zxw;
    r11.y = ps;
    ps = (-1.0) + r7.x;
    r6.y = max(r6.w, 0.0);
    r16.x = ps;
    ps = (-1.0) + r7.z;
    r11 = -r11.wxyz + 1.0;
    r16.y = ps;
    ps = r11.w;
    r8.x = min(r6.y, 0.3);
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r25 = r16 * float4(0.012, 0.012, 0.5, 0.5);
    r4.w = ps;
    ps = log2(abs(r11.x));
    r2.yz = r14.xy + r25.zw;
    r8.y = ps;
    r6.yw = r4.ww * r12.yz + r4.yz;
    r6.yw = r6.yw * UniformVector_4.xy - r25.xy;
    ps = (-1.0) - -r6.x;
    r12.xyw = r8.xwy * float3(3.3333333, 2.5, 0.0125);
    r2.x = ps;
    r24.yzw = r12.xxx * r2.xyz;
    r16.yz = r24.xy + 1.0;
    r16.w = saturate(r12.y * r16.z - 0.5);
    ps = abs(r16.z) * abs(r16.z);
    r7.w = saturate(r7.y - r6.x);
    r6.x = ps;
    ps = UniformScalar_6.x * r6.z;
    r16.x = r6.x * r6.x;
    r26.x = ps;
    ps = 1.0 - r6.z;
    r7.xy = r16.yx * r16.wx;
    r6.x = ps;
    ps = (-2.0) + r7.x;
    r18.xyz = r6.xxx * UniformVector_5.xyz;
    r18.w = ps;
    r2 = r18.xzyw + r26.xxxw;
    ps = (-1.0) + r3.x;
    r8.y = r2.w + r26.w;
    r8.x = ps;
    r15.yw = r8.yx * r11.ww + 1.0;
    r6.x = (r4.w > 0.0) ? r15.w : 1.0;
    r6.x = (r4.w >= 0.0) ? r6.x : 1.0;
    r4.xyw = r6.ywz * r6.zzx;
    r6.xy = r25.xy + r4.xy;
    r6.xy = r6.xy + r24.zw;
    r6.xy = -r15.xz + r6.xy;
    r6.xy = r6.xy * r16.ww + r15.xz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xz = r6.xy * r11.ww;
    r8.x = ps;
    r6.xyz = (r11.www > 0.0) ? r15.xyz : float3(0.0, 1.0, 0.0);
    r6.yzw = (r11.www >= 0.0) ? r6.xyz : float3(0.0, 1.0, 0.0);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r6.zyw, r6.zyw);
    r8.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.zw = r8.xy * abs(r9.xy);
    r6.x = ps;
    r15.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r15.yxz, r23.yzw);
    ps = r0.w;
    r6.xyz = r15.xzy * r6.xxx;
    r12.xyz = r6.xyz * 2.0 - r23.zwy;
    ps = UniformVector_7.x * ps;
    r6.xyz = r22.zxy * r12.zzz;
    r9.x = ps;
    r6.xyz = r21.xzy * r12.yyy + r6.xyz;
    r6.xyw = r17.yzx * r12.xxx + r6.zyx;
    ps = r0.z;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = UniformVector_7.y * ps;
    r6 = xe_cube(r6.xyz);
    r9.y = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r7.z = ps;
    r8.xy = r6.yx * r7.zz + 1.5;
    r14.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r8.xyz = tex2D(Texture2D_8, r14.zw).xyz;
    r6.yzw = tex2D(Texture2D_9, r9.xy).xyz;
    r6.x = dot(r5.zxy, r5.zxy);
    r7.z = float((UniformScalar_5.x > 1.0));
    r17.xyz = (-abs(r7.zzz) >= 0.0) ? r6.yzw : 1.0;
    ps = rsqrt(abs(r6.x));
    r8.w = -r3.w + OpacityOverride.x;
    r7.z = ps;
    r21.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r6.x = float((UniformScalar_5.x >= 1.0));
    r4.xyz = r6.yzw * AmbientColorAndSkyFactor.xyz;
    r20.xyz = r21.xyz * r20.xyz;
    r17.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r17.xyz;
    r17.xyz = r20.xyz * r17.xyz;
    ps = pow(2.0, r12.w);
    r8.xyz = r7.www * r8.xyz;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r5.xyz = r7.zzz * r5.xyz;
    r6.x = ps;
    r0.xyz = r19.ywz * r6.xxx + r0.xzy;
    r0.xyz = r18.xzy * r0.xyz;
    r0.xyz = r0.xyz * r16.www + UniformVector_0.xzy;
    r17.xyz = r17.xyz * r4.www;
    r2.xyz = r17.xyz * UniformScalar_7.xxx + r2.xzy;
    r17.xyz = r17.xyz * r16.zzz - r8.xyz;
    r8.xyz = r17.xyz * r16.www + r8.xyz;
    r7.xyz = r7.yyy * r2.xyz;
    r2.xyz = r7.xzy * r2.xzy;
    r4.xyz = r4.xyz * r8.xyz + r0.xzy;
    ps = r8.x;
    r0.xyz = r15.yyy * r1.xyz;
    ps = r6.y * ps;
    r14.z = dot(r5.zxy, r15.yxz);
    r8.x = ps;
    ps = r8.y;
    r7 = r14.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    ps = r6.z * ps;
    r6.y = saturate(dot(r13.zxy, r12.zxy));
    r8.y = ps;
    r6.xz = r7.xy * r11.yz + 0.125;
    ps = r8.z;
    r7.xy = r7.zw + 0.5;
    ps = r6.w * ps;
    r7.xw = abs(r7.yx) * abs(r7.yx);
    r8.z = ps;
    ps = log2(r6.y);
    r6.x = r6.x * r6.z;
    r6.y = ps;
    r6.xzw = r6.xxx * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r5.xyz = r8.xzy * r7.xxx;
    r6.y = ps;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r4.xzy;
    ps = pow(2.0, r6.y);
    r4.xyz = r8.xzy * r7.www;
    r6.y = ps;
    r1.xyz = r6.yyy * r1.xzy;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r2.xyz + r7.xzy;
    r7.xyz = r0.xyz * r8.xyz + r7.xzy;
    r6.xyz = r7.xzy * r6.xwz;
    r8.xyz = r6.xzy - r6.xzy;
    oC0.w = r8.w * r10.z + r3.w;
    r6.xyz = r8.xyz * r10.zzz + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
