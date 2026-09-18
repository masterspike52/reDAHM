// ps_c9718c91ae2e951b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041700 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r21.w = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = -r0.z + 1.0;
    r5.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r11.z = ps;
    r11.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r4.w;
    r5.zw = r0.xy * UniformScalar_0.xx;
    ps = (-4e+02) + ps;
    r10.xy = r0.wz * 6.0;
    r6.z = ps;
    ps = r0.w;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = UniformVector_7.x * ps;
    r7.xy = r0.wz * UniformVector_1.xy;
    r10.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r1.z + 0.1;
    r5.y = ps;
    ps = 5.0 * r5.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.z = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r11.x = saturate(r6.z * 0.00022222222);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r8.xyz = r5.xxx * r3.xyz;
    r6.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r20.yzw = r11.ywx * float3(0.875, 0.875, -0.025);
    r6.x = ps;
    r9.xy = r8.xy * r20.ww + r7.xy;
    ps = UniformVector_2.x * r5.y;
    r7.xyw = r9.zwy * r6.zzx;
    r5.x = ps;
    ps = r5.x;
    r6.xz = -r7.wz + 1.0;
    ps = r9.x * ps;
    r11.yw = r6.xy * UniformVector_2.yy;
    r11.x = ps;
    ps = r0.z;
    r3 = r11 - 0.5;
    ps = UniformVector_7.y * ps;
    r17 = float4((r11.xywz >= 0.5));
    r10.w = ps;
    ps = ScreenPositionScaleBias.w + r7.x;
    r3 = r3.xywz - r11.xywz;
    r5.x = ps;
    r3 = r3.xywz * r17.xywz + r11;
    ps = ScreenPositionScaleBias.z + r7.y;
    r4 = r3 + r3;
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r13.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r22 = tex2D(Texture2D_1, r4.xy);
    r23 = tex2D(Texture2D_1, r4.zw);
    r4.xyz = tex2D(Texture2D_8, r10.zw).xyz;
    r18.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r9.xy).xyz;
    r15.xyw = tex2D(Texture2D_2, r10.xy).xyw;
    r5.yzw = tex2D(Texture2D_3, r5.zw).wxy;
    r11.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r10 = tex2D(Texture2D_6, r0.xy).wxyz;
    ps = -UniformVector_0.x;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = 1.0 + ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r12.x = ps;
    ps = -UniformVector_0.y;
    r6.w = float((UniformScalar_5.x >= 1.0));
    ps = 1.0 + ps;
    r7.x = dot(r1.zxy, r1.zxy);
    r12.y = ps;
    ps = -UniformVector_0.z;
    r7.w = float((UniformScalar_5.x > 1.0));
    ps = 1.0 + ps;
    r9.w = r10.x * UniformScalar_6.x;
    r12.z = ps;
    ps = r11.x + r11.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r19.x = ps;
    ps = r11.y + r11.y;
    r19.zw = r5.zw + r5.zw;
    r19.y = ps;
    r7.yz = r15.xy * 2.0 - 1.0;
    r15.xyz = r9.xyz * 2.0 - 1.0;
    ps = (-1.0) + r5.y;
    r18.xyz = r18.xyz + r18.xyz;
    r20.x = ps;
    ps = 1.0 - r5.x;
    r5.z = r15.w * r11.z;
    r5.y = saturate(ps);
    r0.xyz = (-abs(r7.www) >= 0.0) ? r4.xyz : 1.0;
    ps = rsqrt(abs(r7.x));
    r5.w = -r10.x + 1.0;
    r7.x = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r7.xxx * r1.xyz;
    r5.x = ps;
    r4.xzw = (-abs(r6.www) >= 0.0) ? 1.0 : r0.xzy;
    ps = log2(r5.y);
    r0.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    ps = UniformVector_5.x * r5.w;
    r5.y = dot(r0.zxy, r2.zxy);
    r11.y = ps;
    ps = UniformVector_5.y * r5.w;
    r0.x = dot(r17.xyy, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    ps = (-1.0) - -r5.z;
    r0.y = dot(r17.wzz, float3(1.0, 1.0, 1.0));
    r17.x = ps;
    r7.x = (r0.y == 0.0) ? r23.x : r23.y;
    r6.w = (r0.x == 0.0) ? r22.x : r22.y;
    ps = ModShadowGroupColor.x * r6.z;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r21.y = ps;
    r6.w = (r0.y == 0.0) ? r22.z : r6.w;
    r7.x = (r0.z == 0.0) ? r23.z : r7.x;
    r21.x = (r0.w == 0.0) ? r23.w : r7.x;
    r6.w = (r0.x == 0.0) ? r22.w : r6.w;
    r18.w = r6.w * 2.0 - r5.z;
    ps = ModShadowGroupColor.y * r6.z;
    r6.w = max(r21.x, 0.0);
    r21.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r0 = -r21 + 1.0;
    r6.x = ps;
    r2.yzw = r20.xyz * r0.wyz + float3(1.0, 0.125, 0.125);
    ps = r0.w;
    r7.x = min(r6.w, 0.3);
    r5.y = ps;
    ps = UniformScalar_1.x * r5.y;
    r18 = r18.zxyw + float4(-1.0, -1.0, -1.0, 1.25);
    r6.w = ps;
    r14.w = r18.x * UniformVector_4.z - r15.z;
    ps = 3.3333333 * r7.x;
    r19 = r19 - 1.0;
    r18.x = ps;
    r6.yz = r6.ww * r19.zw + r18.yz;
    r5.y = (r6.w > 0.0) ? r2.y : 1.0;
    ps = 0.5 * r7.y;
    r5.z = saturate(r18.w - r5.z);
    r18.y = ps;
    ps = 0.5 * r7.z;
    r13.xyz = r5.zzz * r13.xyz;
    r18.z = ps;
    r16.w = (r6.w >= 0.0) ? r5.y : 1.0;
    r5.yz = r6.yz * UniformVector_4.xy - r15.xy;
    ps = SpotAngles.y * r6.x;
    r17.yz = r19.xy + r18.yz;
    r4.y = saturate(ps);
    r7.xy = r18.xx * r17.yz + r5.yz;
    ps = r0.x;
    r6 = r16 * r10.yzwx;
    r5.y = ps;
    r5.z = r18.x * r17.x + 1.0;
    ps = 2.5 * r5.y;
    r0.xyz = r6.xzy * r4.xzw;
    r10.w = ps;
    ps = abs(r5.z) * abs(r5.z);
    r5.y = r0.x * r16.w;
    r2.x = ps;
    ps = r5.y;
    r10.yz = r0.zy * r6.ww;
    ps = r10.x * ps;
    r4.xz = r2.xz * r2.xw;
    r10.x = ps;
    r6.xyz = r4.zzz * r14.xyz + ModShadowColor.xyz;
    r14.xyz = r10.xyz * r5.zzz - r13.xyz;
    r6.w = saturate(r10.w * r5.z - 0.5);
    r2.xy = r7.xy * r6.ww + r15.xy;
    r11.x = r14.w * r6.w - 2.0;
    r7.xyz = r14.xyz * r6.www + r13.xyz;
    ps = UniformVector_5.z * r5.w;
    r0.xyz = r7.xyz * r12.xyz;
    r11.w = ps;
    r7 = r11.yzwx + r9.wwwz;
    r7.xyz = r10.xyz * UniformScalar_7.xxx + r7.xyz;
    r2.z = r7.w + r9.z;
    r2.xyw = r2.xyz * r0.www;
    ps = r4.x * r4.x;
    r2.z = r2.w + 1.0;
    r5.w = ps;
    r2.xyz = (r0.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r0.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = r4.y * r4.y;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r7.xyz = r5.www * r7.xyz;
    r5.z = ps;
    r2.xyz = r2.xyz * r5.zzz;
    r5.z = dot(r2.zxy, r8.zxy);
    r4.xyz = r2.xyz * r5.zzz;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.z = saturate(dot(r1.zxy, r4.zxy));
    ps = log2(r5.z);
    r7.xyz = r7.xyz * r6.www;
    r5.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = r5.z * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r2.zyx, r1.zyx));
    r5.w = ps;
    ps = pow(2.0, r5.x);
    r7.xyz = r7.xyz * r5.www;
    r5.x = ps;
    r7.xy = r0.xy * r5.zz + r7.xy;
    r7.z = r0.z * r5.z + r7.z;
    r5.xzw = r7.xyz * r5.xxx;
    r5.xzw = r5.xzw * r3.xyz;
    r5.xzw = r5.xzw * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xwz * r5.yyy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
