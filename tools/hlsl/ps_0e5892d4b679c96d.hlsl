// ps_0e5892d4b679c96d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = r1.wzwz * float4(6.0, 6.0, 4.0, 4.0);
    r19.yzw = tex2D(Texture2D_3, r12.xy).xyw;
    ps = r1.w;
    r0.zw = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_1.x * ps;
    r3.xy = r1.wz * UniformVector_3.xy;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r5.w - 4e+02;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r10.y = ps;
    ps = rsqrt(abs(r6.x));
    r19.x = saturate(r6.y * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r11.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r17.xyw = r19.yzx * float3(4.0, 1.0, -0.125);
    r6.w = ps;
    r6.xy = r11.xy * r17.ww + r1.wz;
    ps = r10.x;
    r6.z = -r6.y + 1.0;
    ps = abs(r8.x) * ps;
    r9.yzw = r6.wxz * UniformVector_1.yxy;
    r3.z = ps;
    ps = r10.y;
    r4 = r9.wzxy - 0.5;
    ps = abs(r8.y) * ps;
    r22 = float4((r9.wzxy >= 0.5));
    r3.w = ps;
    ps = 2.5 * r6.x;
    r4 = r4 - r9.wzxy;
    r10.z = ps;
    r4 = r4.yxzw * r22.yxzw + r9.zwxy;
    ps = 2.5 * r6.y;
    r4 = r4 + r4;
    r10.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r20 = tex2D(Texture2D_2, r4.xy);
    r21 = tex2D(Texture2D_2, r4.zw);
    r4.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r16.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r9.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r3.yzw = tex2D(Texture2D_0, r0.zw).xyw;
    r0.w = tex2D(Texture2D_3, r12.zw).z;
    r13 = tex2D(Texture2D_3, r1.wz).zwxy;
    r6.yzw = tex2D(Texture2D_1, r10.zw).zxy;
    r0.z = saturate(r7.w * 1e+01);
    r14.z = saturate(r5.w * 0.0001);
    ps = -r7.w;
    r6.x = r2.z + 0.1;
    ps = UniformScalar_8.x + ps;
    r8.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r4.w = ps;
    ps = r5.x;
    r1.w = float((UniformScalar_7.x >= 1.0));
    ps = ScreenPositionScaleBias.x * ps;
    r1.x = float((UniformScalar_4.x >= 1.0));
    r14.y = ps;
    r18.x = r13.z * 4.0 - 4.0;
    ps = 5.0 * r6.x;
    r1.y = dot(r2.zxy, r2.zxy);
    r14.x = saturate(ps);
    ps = r13.w + r13.w;
    r0.w = r0.w * r7.w;
    r15.x = ps;
    ps = 4.0 * r6.z;
    r6.x = float((UniformScalar_4.x > 1.0));
    r9.x = ps;
    ps = 4.0 * r6.w;
    r15.yzw = r9.ywz + r9.ywz;
    r9.y = ps;
    r6.xzw = (-abs(r6.xxx) >= 0.0) ? r16.xyz : 1.0;
    ps = rsqrt(abs(r1.y));
    r4.xyz = r8.xyz * r4.xyz;
    r1.y = ps;
    ps = r3.y + r3.y;
    r8.xyz = r1.yyy * r2.xyz;
    r9.z = ps;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? 1.0 : r6.xzw;
    ps = r3.z + r3.z;
    r16 = r15.xywz + float4(-2.0, -1.0, -1.0, -1.0);
    r9.w = ps;
    ps = r19.w;
    r4 = r4 * r1;
    ps = r13.y * ps;
    r6.x = r4.w + r7.w;
    r1.x = ps;
    ps = -r6.x;
    r15 = r9 + float4(-2.0, -2.0, -1.0, -1.0);
    ps = r7.z + ps;
    r1.y = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r1.z = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r6.z = (r1.z == 0.0) ? r21.x : r21.y;
    r6.x = (r1.y == 0.0) ? r20.x : r20.y;
    ps = UniformScalar_9.x;
    r2 = r1.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r7.y = ps;
    r6.x = (r2.w == 0.0) ? r20.z : r6.x;
    r6.z = (r2.y == 0.0) ? r21.z : r6.z;
    r1.w = (r2.z == 0.0) ? r21.w : r6.z;
    r6.w = (r2.x == 0.0) ? r20.w : r6.x;
    ps = max(r7.x, r7.y);
    r6.z = max(r1.w, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r6.xz = min(r6.xz, float2(1.0, 0.3));
    r7.x = ps;
    ps = r16.x;
    r14.w = saturate(r6.x * r7.x);
    ps = r19.z + ps;
    r7.yzw = -r14.zxw + 1.0;
    r18.y = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r7.x = r0.w * r7.w;
    r1.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r18.w = float((r7.x >= 0.05));
    r1.z = ps;
    ps = 3.3333333 * r6.z;
    r2 = -r1.wyzx + 1.0;
    r18.z = ps;
    ps = r5.y;
    r10.xy = -r18.zw + 1.0;
    ps = ScreenPositionScaleBias.y * ps;
    r17.z = r0.z * r10.x;
    r14.z = ps;
    r6.x = (UniformScalar_8.x > 0.0) ? r10.y : 1.0;
    r11.w = (UniformScalar_8.x >= 0.0) ? r6.x : r10.y;
    ps = (-1.0) - -r1.x;
    r17.yzw = r18.xzy + r17.xzy;
    r17.x = ps;
    ps = r6.y + r6.y;
    r1.xyz = r17.xyz * r17.zzw;
    r1.w = ps;
    r0.w = r1.z * 2.0 + r16.z;
    ps = 1.0 - r6.w;
    r13.zw = r1.xw + float2(1.0, -1.0);
    r6.x = ps;
    ps = UniformScalar_1.x * r7.y;
    r6.z = r13.z * r2.x;
    r7.x = ps;
    r6.y = r6.z * r13.x - r6.z;
    ps = r16.y;
    r6.xy = r0.zz * r6.xy;
    ps = r1.y + ps;
    r13.xy = r6.xz + r6.wy;
    r0.z = ps;
    ps = abs(r13.z) * abs(r13.z);
    r6.xy = r13.wy * float2(0.5, 2.5);
    r14.x = ps;
    ps = (-0.5) + r6.y;
    r1.yz = -r15.xy + r0.zw;
    r0.w = saturate(ps);
    ps = 1.0 / r5.w;
    r1.x = r16.w - r6.x;
    r14.w = ps;
    r3.x = r1.x * r0.w + r6.x;
    r6.xy = r1.yz * r0.ww - 2.0;
    r6.yz = r7.xx * r15.zw + r6.xy;
    ps = r3.w;
    r1.xyz = r14.xyz * r14.xww;
    r6.x = ps;
    ps = (-1.0) + r6.x;
    r6.yw = r6.yz + r9.xy;
    r6.z = ps;
    ps = (-1.0) + r3.x;
    r6.xy = r6.yw * r7.yy;
    r6.w = ps;
    r6.zw = r6.wz * r7.yy + 1.0;
    r6 = (r7.xyyy > 0.0) ? r6.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r7 = (r7.yyyx >= 0.0) ? r6.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    r6.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.x));
    r10.xy = r1.yz + ScreenPositionScaleBias.wz;
    r6.x = ps;
    r9.xyz = r7.xyz * r6.xxx;
    r6.x = dot(r9.zxy, r11.zxy);
    r6.xyz = r9.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.x = saturate(dot(r8.zxy, r6.zxy));
    ps = log2(r6.x);
    r11.x = r13.x + r13.x;
    r12.z = ps;
    r6.xyw = r12.xyz * float3(0.875, 0.875, 15.0);
    r11.yz = r6.xy * r2.yz;
    r5 = r11.wxyz + float4(-0.5, -0.75, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r2.xyz = tex2D(Texture2D_5, r10.zw).xyz;
    r10.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r1.w = tex2D(ShadowTexture, r0.xy).x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r1.xw = r1.wx * r1.wx;
    r0.xyz = r1.xxx * r10.xyz;
    r4.xyz = r4.xyz * r7.www;
    r1.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r1.xyz = r1.www * r1.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r1.xyz * r0.www;
    r7.w = ps;
    ps = r1.x;
    r6.w = saturate(dot(r9.zyx, r8.zyx));
    r1.w = saturate(r2.w * 0.2 + r5.y);
    ps = r7.w * ps;
    r2.w = r5.z * r5.w;
    r1.x = ps;
    r6.xyz = r2.www * r6.xyz + ModShadowColor.xyz;
    ps = r1.y;
    r2.xyz = r1.www * r2.xyz;
    ps = r7.w * ps;
    r2.xyz = r2.xyz * r3.www;
    r1.y = ps;
    ps = r1.z;
    r3.xyz = r4.xyz - r2.xyz;
    r2.xyz = r3.xyz * r0.www + r2.xyz;
    ps = r7.w * ps;
    r7.xyz = r2.xyz * r7.xyz;
    r1.z = ps;
    r7.xy = r7.xy * r6.ww + r1.xy;
    r7.z = r7.z * r6.w + r1.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
