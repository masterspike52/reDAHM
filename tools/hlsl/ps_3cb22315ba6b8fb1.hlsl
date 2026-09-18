// ps_3cb22315ba6b8fb1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 474 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000768 10041500 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c19); // float2
float4 SpotDirection : register(c18); // float3
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.w = UniformScalar_17.x * 0.05;
    ps = r4.w;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r6.yz = r0.wz * 3.0;
    r5.y = ps;
    r6.x = r7.w * (-0.8) + r6.z;
    ps = rsqrt(abs(r5.z));
    r5.x = r1.z + 0.1;
    r6.w = ps;
    ps = 0.00022222222 * r5.y;
    r5.z = float((UniformScalar_12.x >= 1.0));
    r15.z = saturate(ps);
    ps = 5.0 * r5.x;
    r11.xyz = r6.www * r3.xyz;
    r15.y = saturate(ps);
    ps = UniformScalar_13.x - r7.w;
    r5.y = r5.w * r15.z;
    r11.w = ps;
    r5.x = r11.w * r5.z + r7.w;
    r12.yz = r11.yx * r5.yy + r0.zw;
    r5.x = -r5.x + r7.z;
    r5.x = max(r5.x, UniformScalar_14.x);
    ps = 1.0 / UniformScalar_15.x;
    r5.y = min(r5.x, 1.0);
    r5.x = ps;
    ps = -r0.z;
    r12.x = saturate(r5.y * r5.x);
    ps = 1.0 + ps;
    r10.zw = -r12.yx + 1.0;
    r10.y = ps;
    ps = UniformVector_1.x * r0.w;
    r9.yz = r10.yz * UniformVector_1.yy;
    r9.x = ps;
    r5.xyz = r9.zxy - 0.5;
    r19.xyz = float3((r9.zxy >= 0.5));
    ps = r12.y + r12.y;
    r5.xyz = r5.xyz - r9.zxy;
    r20.z = ps;
    r5.xyz = r5.yzx * r19.yzx + r9.xyz;
    ps = r12.z + r12.z;
    r21.yzw = r5.zxy + r5.zxy;
    r20.w = ps;
    r6.w = tex2D(Texture2D_7, r0.xy).w;
    r3 = tex2D(Texture2D_3, r21.zw);
    r13.xyz = tex2D(Texture2D_0, r20.wz).xyz;
    r16 = tex2D(Texture2D_4, r6.yx).zwxy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.x = saturate(r4.w * 0.0001);
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r16.zw + r16.zw;
    r9.w = ps;
    r5.z = dot(r19.yzz, float3(1.0, 1.0, 1.0));
    r1.w = (r5.z == 0.0) ? r3.x : r3.y;
    r5 = r5.zzxy + float4(-3.0, -2.0, -1.0, -1.0);
    r1.w = (r5.y == 0.0) ? r3.z : r1.w;
    r3.x = (r5.x == 0.0) ? r3.w : r1.w;
    ps = r0.w;
    r1.w = max(r3.x, 0.0);
    ps = 18.0 * ps;
    r1.w = min(r1.w, 0.3);
    r9.x = ps;
    ps = r13.x + r13.x;
    r15.x = r1.w * 3.3333333;
    r14.y = ps;
    ps = r13.y + r13.y;
    r16.zw = -r15.xy + 1.0;
    r14.z = ps;
    ps = r10.w;
    r3.yz = r16.ww * ModShadowGroupColor.xy;
    ps = r7.w * ps;
    r3.yzw = -r3.xyz + 1.0;
    r3.x = ps;
    ps = r13.z + r13.z;
    r17.xy = r3.xy * r16.xx;
    r14.w = ps;
    ps = 6.0 * r6.x;
    r10.y = float((r17.x >= 0.05));
    r9.y = ps;
    ps = r9.z;
    r10.xw = -r10.yx + 1.0;
    r6.x = (UniformScalar_13.x > 0.0) ? r10.x : 1.0;
    r6.x = (UniformScalar_13.x >= 0.0) ? r6.x : r10.x;
    ps = abs(r8.x) * ps;
    r14.x = r6.x * r6.w;
    r6.x = ps;
    ps = r9.w;
    r14 = r14 + float4(-0.5, -1.0, -1.0, -1.0);
    ps = abs(r8.y) * ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.xxxx)) clip(-1.0);
    r6.y = ps;
    r9.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.xyz = tex2D(Texture2D_4, r9.xy).xwy;
    r10.y = dot(r2.zxy, r2.zxy);
    r9.xy = r6.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r10.y));
    r8.x = r16.x * (-0.3);
    r6.w = ps;
    ps = r7.w;
    r8.yzw = r6.www * -SpotDirection.xyz;
    ps = 15.0 * ps;
    r9 = r9.xzwy * float4(0.5, 0.875, 0.875, 0.5);
    r16.x = saturate(ps);
    ps = r6.y;
    r6.x = dot(r8.wyz, r2.zxy);
    ps = r16.y * ps;
    r5.x = r6.x - SpotAngles.x;
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r6.xz = r5.zw + r9.xw;
    r16.y = saturate(ps);
    ps = (-1.0) - -r5.y;
    r5.xw = r16.xy * r16.zy;
    r6.w = ps;
    ps = 0.01 * r6.x;
    r6.y = r15.x + r5.x;
    r8.y = ps;
    r7.xz = r8.yx * r6.yy + r0.xy;
    r6.yzw = r6.wxy * r6.yyz;
    r7.y = r6.w * 0.025 + r7.z;
    r18.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    ps = r7.x + r7.x;
    r2.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r7.x = ps;
    ps = r7.y + r7.y;
    r7.w = r12.z * UniformVector_1.x;
    r7.y = ps;
    ps = r7.z + r7.z;
    r18.w = float((r7.w >= 0.5));
    r7.z = ps;
    r8 = r7.xywz + float4(-1.0, -1.0, -0.5, -1.0);
    ps = r0.w + r0.w;
    r2.w = r8.z - r7.w;
    r20.x = ps;
    ps = r0.z + r0.z;
    r12 = r2 * r18;
    r20.y = ps;
    ps = 1.0 / r4.w;
    r6.x = r7.w + r12.w;
    r5.z = ps;
    ps = r6.x + r6.x;
    r17.zw = r4.xy * ScreenPositionScaleBias.xy;
    r21.x = ps;
    r7.xy = r17.zw * r5.zz + ScreenPositionScaleBias.wz;
    r2.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r15 = tex2D(Texture2D_2, r20.xy);
    r4.xyz = tex2D(Texture2D_8, r20.wz).xyz;
    r7 = tex2D(Texture2D_3, r21.xy).wyzx;
    r13.xyw = tex2D(Texture2D_1, r20.xy).xyz;
    r5.z = tex2D(Texture2D_6, r0.xy).x;
    r1.w = float((UniformScalar_9.x >= 1.0));
    r2.w = float((UniformScalar_9.x > 1.0));
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r6.x = saturate(-r10.y + 1.0);
    r0.x = ps;
    ps = log2(r6.x);
    r10.xyz = r0.xxx * r1.xyz;
    r6.x = ps;
    r1.xyz = r12.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r9.x = r19.x * 2.0 + r18.w;
    r0.z = (r9.x == 0.0) ? r7.w : r7.y;
    r9.yz = r9.yz * r3.zw;
    r0.xy = r8.xy * UniformVector_3.xy + r6.zw;
    ps = 1.0 + r6.y;
    r9 = r9.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r6.y = ps;
    r6.z = (r9.y == 0.0) ? r7.z : r0.z;
    r7.w = r6.y * r3.y;
    r6.w = r17.y * r6.y - r7.w;
    r7.x = (r9.x == 0.0) ? r7.x : r6.z;
    ps = 1.0 - r7.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    r7.yz = r16.xx * r6.zw;
    ps = r13.x + r13.x;
    r6.zw = r7.yw + r7.xz;
    r16.y = ps;
    r0.w = saturate(r6.w * 2.5 - 0.5);
    ps = r13.y + r13.y;
    r6.z = r6.z + r7.y;
    r16.z = ps;
    ps = r13.w + r13.w;
    r16.x = r6.z + r7.x;
    r16.w = ps;
    r7 = r16 + float4(0.25, -1.0, -1.0, -1.0);
    r5.y = saturate(r7.x - r5.y);
    r4.xyz = r5.yyy * r4.xyz;
    ps = -r4.z;
    r7.xzw = r7.wyz - r14.wyz;
    ps = r15.z + ps;
    r6.zw = -r4.xy + r15.xy;
    r7.y = ps;
    r4.xy = r6.zw * r15.ww + r4.xy;
    r7 = r7.zwyx * r15.wwww;
    ps = abs(r6.y) * abs(r6.y);
    r4.z = r4.z + r7.z;
    r0.z = ps;
    ps = r7.w;
    r7.xyz = r14.yzw + r7.xyw;
    r5.x = ps;
    r12.w = r8.w * UniformVector_3.z - r7.z;
    ps = (-2.0) + r5.x;
    r0.xy = r0.xy - r7.xy;
    r4.w = ps;
    r12.xyz = r12.xyz * r3.yyy - r4.xyz;
    r6.yzw = r0.xzy * r0.wzw;
    r7.xy = r7.xy + r6.yw;
    r12 = r12 * r0.wwww + r4;
    r7.z = r13.z * 2.0 + r12.w;
    r7.xyz = r7.zxy * r10.www;
    ps = 1.0 + r7.x;
    r4.yzw = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r10.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r10.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r5.y));
    r8.xyz = r12.xyz * r8.xyz;
    r5.y = ps;
    r7.xyz = r7.xyz * r5.yyy;
    r5.y = dot(r7.zxy, r11.zxy);
    r12.xyz = r7.xyz * r5.yyy;
    r11.xyz = r12.xyz * 2.0 - r11.xyz;
    ps = UniformScalar_8.x * r5.z;
    r5.y = saturate(dot(r10.zxy, r11.zxy));
    r8.w = ps;
    ps = log2(r5.y);
    r7.x = saturate(dot(r7.zyx, r10.zyx));
    r7.y = ps;
    ps = r9.z * r9.w;
    r5.z = r7.y * UniformScalar_7.x;
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r6.y = r7.y * 15.0;
    r7.y = ps;
    ps = r6.z * r6.z;
    r7 = r8 * r7.xxxy;
    r6.z = ps;
    r4.x = (r2.w > 0.0) ? 0.0 : r7.w;
    r5.xyz = r5.yyy * r4.yzw + ModShadowColor.xyz;
    r1.xyz = r1.www * r4.xxx + r1.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r1.xyz = r6.zzz * r1.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r0.xyz = r1.xyz * r0.www;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r0.xyz = r0.xyz * r3.yyy;
    r6.w = ps;
    r6.yz = r0.xy * r6.ww + r7.xy;
    r6.w = r0.z * r6.w + r7.z;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r2.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
