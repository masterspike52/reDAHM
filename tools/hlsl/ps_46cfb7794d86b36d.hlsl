// ps_46cfb7794d86b36d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041600 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c24); // float4
float4 ConstantLighting : register(c25); // float3
float4 LowerSkyColor : register(c23); // float3
float4 ModShadowAccumResolution : register(c28); // float2
float4 ModShadowColor : register(c26); // float3
float4 ModShadowGroupColor : register(c27); // float3
float4 OpacityOverride : register(c21); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c17); // float
float4 UniformScalar_11 : register(c18); // float
float4 UniformScalar_12 : register(c19); // float
float4 UniformScalar_13 : register(c20); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformScalar_8 : register(c15); // float
float4 UniformScalar_9 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c22); // float3
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
sampler2D Texture2D_10 : register(s10);
sampler2D Texture2D_11 : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
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

    r5.xy = UniformVector_1.xy * 6.0;
    r6 = UniformVector_1.xyxy * float4(1.8, 1.8, 1.7, 1.7);
    r5.xy = r5.xy * r0.wz;
    r6 = r6.xywz * r0.wzzw;
    r17.yzw = tex2D(Texture2D_3, r5.xy).xyw;
    r10.xyz = tex2D(Texture2D_3, r6.wz).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = r17.w * r10.z;
    r8.z = ps;
    r13.xy = r0.wz * UniformScalar_0.xx;
    r13.zw = r0.xy * UniformScalar_3.xx;
    r5.xy = r0.wz * UniformScalar_7.xx;
    r5.zw = r0.wz * UniformScalar_9.xx;
    r14.xy = r0.xy * UniformScalar_2.xx;
    ps = -r0.z;
    r2.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r6.w = float((r0.w >= 0.5));
    r7.w = ps;
    r8.y = r6.w * (-0.5) + r0.w;
    ps = rsqrt(abs(r2.x));
    r8.x = float((r7.w >= 0.5));
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xyz = r2.xxx * r1.xzy;
    r8.w = ps;
    ps = 0.1 - -r2.y;
    r1.xy = r8.zw * abs(r7.xy);
    r1.z = ps;
    ps = OpacityOverride.x;
    r7.y = saturate(r1.z * 5.0);
    r7.x = saturate(ps);
    r9 = -r7.ywzx + float4(1.0, 0.5, 1.0, 1.0);
    r1.z = r9.y - r0.z;
    r1.z = dot(r1.zz, r8.xx) - r0.z;
    ps = r8.y + r8.y;
    r1.z = r1.z + 2.0;
    r15.x = ps;
    ps = r8.x + r8.x;
    r15.y = r1.z - r0.z;
    r15.z = ps;
    r16.yzw = tex2D(Texture2D_7, r6.xy).xyz;
    r8.xyz = tex2D(Texture2D_4, r14.xy).xzy;
    r12.xyz = tex2D(Texture2D_11, r5.zw).xyz;
    r11.xyz = tex2D(Texture2D_9, r5.xy).xyz;
    r20 = tex2D(Texture2D_2, r15.xy);
    r5.xzw = tex2D(Texture2D_10, r13.zw).xyz;
    r22.xyz = tex2D(Texture2D_8, r14.xy).xyz;
    r18.xyz = tex2D(Texture2D_5, r13.zw).zxy;
    r14.yzw = tex2D(Texture2D_0, r13.xy).xyw;
    r1.xz = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r5.y = tex2D(Texture2D_6, r0.wz).x;
    r19.xyz = tex2D(Texture2D_1, r6.xy).xyz;
    r1.y = dot(r3.zxy, r3.zxy);
    r1.w = dot(r4.zxy, r4.zxy);
    ps = r19.z + r19.z;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r18.w = ps;
    ps = UniformScalar_4.x * r5.y;
    r13.xy = r14.yz + r14.yz;
    r5.y = saturate(ps);
    ps = r18.x + r18.x;
    r0.x = dot(r22.zxy, float3(0.11, 0.3, 0.59));
    r18.x = ps;
    ps = r18.y + r18.y;
    r0.y = dot(r5.wxz, float3(0.11, 0.3, 0.59));
    r18.y = ps;
    ps = r18.z + r18.z;
    r21.xyz = r0.yyy - r5.xzw;
    r18.z = ps;
    ps = log2(r5.y);
    r0.xyz = r0.xxx - r22.xyz;
    r5.y = ps;
    r0.yzw = r0.xyz * UniformScalar_6.xxx + r22.xyz;
    r5.xzw = r21.yxz * UniformScalar_8.xxx + r5.zxw;
    ps = r10.x + r10.x;
    r18 = r18 - 1.0;
    r13.z = ps;
    ps = r10.y + r10.y;
    r10.x = r15.z + r6.w;
    r13.w = ps;
    ps = UniformVector_3.x * r5.z;
    r21 = r13 + float4(-1.0, -1.0, -3.0, -3.0);
    r0.x = ps;
    ps = UniformVector_3.y * r5.x;
    r13.xyz = r0.yzw * UniformVector_2.xyz;
    r0.y = ps;
    r10.w = (r10.x == 0.0) ? r20.x : r20.y;
    ps = UniformVector_3.z * r5.w;
    r11.xyz = r13.xyz * r11.xyz;
    r0.z = ps;
    ps = UniformScalar_5.x * r5.y;
    r13.xyz = r0.xyz * r12.xyz;
    r5.w = ps;
    r12.xyz = r13.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r0.xyz = r11.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = pow(2.0, r5.w);
    r5.xyz = r13.xyz - r11.xyz;
    r8.w = ps;
    r11.xyz = r5.xyz * r8.www + r11.xyz;
    ps = r2.w;
    r5.yz = r9.xx * ModShadowGroupColor.xy;
    ps = 0.0001 * ps;
    r12.xyz = r12.xyz - r0.xyz;
    r5.x = saturate(ps);
    r15.xyz = r12.xyz * r8.www + r0.xyz;
    r0.yzw = -r5.xyz + 1.0;
    ps = UniformScalar_1.x * r0.y;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = r18.w;
    r10.yz = r0.xx * r21.xy;
    r5.x = ps;
    ps = 0.5 * r5.x;
    r13 = r10.yzxx + float4(-2.0, -2.0, -3.0, -2.0);
    r6.w = ps;
    r5.x = (r13.w == 0.0) ? r20.z : r10.w;
    r5.x = (r13.z == 0.0) ? r20.w : r5.x;
    ps = 1.0 - r5.x;
    r10.w = max(r5.x, 0.0);
    r17.x = ps;
    ps = r10.w;
    r5.yzw = r8.yzx + r8.yzx;
    r20.x = ps;
    ps = 0.3;
    r22 = r5.xywz + float4(-0.75, -1.0, -1.0, -1.0);
    r20.y = ps;
    ps = r22.x;
    r18.xyz = r18.zyx - r22.wzy;
    ps = r5.x + ps;
    r17.xyz = r17.xyz * float3(2.5, 4.0, 4.0);
    r5.x = ps;
    r17.w = saturate(r9.z * 0.5 + r5.x);
    r18.xy = r18.yx * r8.ww + r22.zw;
    ps = min(r20.x, r20.y);
    r5.zw = r21.zw + r17.yz;
    r19.w = ps;
    r5.x = r18.z * r8.w - r6.w;
    ps = 0.875 * r1.x;
    r8.xzw = r19.wxy * float3(3.3333333, 4.0, 4.0);
    r13.z = ps;
    ps = (-1.0) - -r7.z;
    r18.zw = r8.zw - 2.0;
    r5.y = ps;
    r5.x = r8.y * 2.0 + r5.x;
    ps = rsqrt(abs(r1.w));
    r5.yzw = r8.xxx * r5.yzw;
    r1.w = ps;
    ps = 1.0 + r5.y;
    r4.xyz = r1.www * r4.xyz;
    r16.x = ps;
    ps = rsqrt(abs(r1.y));
    r10 = r18.xzwy + r10.yyzz;
    r1.y = ps;
    r5.yz = r5.zw * 4.0 + r10.xw;
    ps = abs(r16.x) * abs(r16.x);
    r7.xyz = r1.yyy * r3.xyz;
    r5.w = ps;
    ps = r5.w * r5.w;
    r3 = r17.xwww * r16;
    r10.x = ps;
    ps = r3.x;
    r10.yz = r5.yz - r10.yz;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r9.xyz = r3.yzw * r14.www;
    r10.w = saturate(ps);
    ps = 0.875 * r1.z;
    r5.yzw = r10.yzx * r10.wwx;
    r13.w = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5.yz = r13.xy + r5.yz;
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r1.yzw = r5.www * r15.xyz;
    r8.y = ps;
    ps = (-1.0) + r5.x;
    r5.yz = r5.yz + r8.zw;
    r1.x = ps;
    ps = r5.y;
    r3 = r1.xywz * r10.wwww;
    ps = r0.y * ps;
    r14.x = r6.w + r3.x;
    r1.x = ps;
    ps = r5.z;
    r13.xy = r14.xw - 1.0;
    r1.zw = r13.xy * r0.yy + 1.0;
    r5.xy = r13.zw * r0.zw + 0.125;
    ps = r0.y * ps;
    r5.x = r5.x * r5.y;
    r1.y = ps;
    r5.xyz = r5.xxx * r12.xyz + ModShadowColor.xyz;
    r1 = (r0.xyyy > 0.0) ? r1.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r1 = (r0.yyyx >= 0.0) ? r1.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    r0.xyz = r11.xyz * r1.www - r9.xyz;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r8.z = ps;
    ps = rsqrt(abs(r5.w));
    r6.w = float((r9.w >= 0.004));
    r5.w = ps;
    r0.xyz = r0.xyz * r10.www + r9.xyz;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    ps = r0.x;
    r1.xyz = r1.xyz * r5.www;
    ps = r6.y * ps;
    r5.w = dot(r1.zxy, r7.zxy);
    r0.x = ps;
    ps = r0.y;
    r9.xyz = r1.xyz * r5.www;
    r7.xyz = r9.xyz * 2.0 - r7.xyz;
    ps = r6.z * ps;
    r5.w = saturate(dot(r2.yxz, r7.zxy));
    r0.y = ps;
    ps = log2(r5.w);
    r4.x = dot(r4.zxy, r1.zxy);
    r4.y = ps;
    ps = r0.z;
    r1.xyw = r4.xxy * float3(-0.5, 0.5, 15.0);
    ps = r6.x * ps;
    r4.xy = r1.xy + 0.5;
    r0.z = ps;
    ps = pow(2.0, r1.w);
    r6.xy = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r1.xyz = r1.zzz * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r0.xzy * r6.xxx;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r6.xyz = r0.xzy * r6.yyy;
    r4.z = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r3.yzw + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
