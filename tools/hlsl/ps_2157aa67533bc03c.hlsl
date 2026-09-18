// ps_2157aa67533bc03c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
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
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
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

    ps = UniformVector_1.x * r0.w;
    r9 = r0.wzwz * float4(4.0, 4.0, 6.0, 6.0);
    r11.x = ps;
    r22.yzw = tex2D(Texture2D_3, r9.zw).xyw;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r8.zw = r8.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = (-4e+02) - -r4.w;
    r20.w = -r6.w + UniformScalar_8.x;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r22.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    r10.yzw = r5.xxx * r3.xyz;
    ps = -r0.z;
    r18.xyw = r22.yzx * float3(4.0, 1.0, -0.125);
    r5.xz = r10.yz * r18.ww + r0.wz;
    ps = 1.0 + ps;
    r5.y = -r5.z + 1.0;
    r5.w = ps;
    r11.yzw = r5.wxy * UniformVector_1.yxy;
    r3 = r11.wzxy - 0.5;
    r19 = float4((r11.wzxy >= 0.5));
    ps = 2.5 * r5.x;
    r3 = r3 - r11.wzxy;
    r8.x = ps;
    r3 = r3.yxzw * r19.yxzw + r11.zwxy;
    ps = 2.5 * r5.z;
    r16 = r3.zwxy + r3.zwxy;
    r8.y = ps;
    r17 = tex2D(Texture2D_2, r16.xy);
    r3.xzw = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r14.xyw = tex2D(Texture2D_1, r8.xy).xyz;
    r5.x = tex2D(Texture2D_3, r9.xy).z;
    r9 = tex2D(Texture2D_3, r0.wz).xywz;
    r12.y = saturate(r4.w * 0.0001);
    ps = r1.z;
    r5.y = dot(r2.zxy, r2.zxy);
    r21.x = r9.x * 4.0 - 4.0;
    ps = 0.1 + ps;
    r5.w = r5.x * r6.w;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r4.yz = r0.xy * UniformScalar_0.xx;
    r12.x = saturate(ps);
    ps = r9.y + r9.y;
    r16.xy = r0.wz * UniformVector_3.xy;
    r11.x = ps;
    ps = 1.0 - r5.y;
    r11.yz = r14.xy * 4.0;
    r5.x = saturate(ps);
    ps = r22.w;
    r3.y = float((UniformScalar_7.x >= 1.0));
    ps = r9.z * ps;
    r20.xyz = r3.xzw * r2.www;
    r12.z = ps;
    ps = log2(r5.x);
    r15.x = r12.z - 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r13.xzw = r11.xyz - 2.0;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r21.y = r13.x + r22.z;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3 = r20.xzyw * r3.xxxy;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r3.w + r6.w;
    r4.w = ps;
    ps = -r5.x;
    r7.xy = r4.xw * abs(r7.xy);
    ps = r6.z + ps;
    r20.x = dot(r19.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r20.y = dot(r19.zww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r6.x = (r20.y == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_9.x;
    r19 = r20.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.z = ps;
    r6.x = (r19.y == 0.0) ? r17.z : r6.x;
    r12.w = (r19.z == 0.0) ? r17.w : r6.x;
    ps = 1e+01 * r6.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r8.w = saturate(ps);
    ps = max(r5.x, r5.z);
    r6.yzw = -r12.yxw + 1.0;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.x = max(r12.w, 0.0);
    r12.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.xz = min(r5.zx, float2(1.0, 0.3));
    r6.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r12.w = saturate(r5.x * r6.x);
    r12.y = ps;
    r12 = -r12.wxyz + 1.0;
    r5.w = r5.w * r12.x;
    ps = 3.3333333 * r5.z;
    r21.w = float((r5.w >= 0.05));
    r21.z = ps;
    r5.xz = -r21.zw + 1.0;
    r18.z = r8.w * r5.x;
    r5.w = (UniformScalar_8.x > 0.0) ? r5.z : 1.0;
    r17.w = (UniformScalar_8.x >= 0.0) ? r5.w : r5.z;
    r15.yzw = r21.xzy + r18.xzy;
    r17.xyz = r15.xyz * r15.zzw;
    r4.xw = r17.wx + float2(-0.5, 1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.xxxx)) clip(-1.0);
    r8.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r15.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r18 = tex2D(Texture2D_2, r16.zw);
    r16.xyz = tex2D(Texture2D_7, r16.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xzw = tex2D(Texture2D_0, r4.yz).xyw;
    r6.x = float((UniformScalar_4.x >= 1.0));
    r5.z = float((UniformScalar_4.x > 1.0));
    r4.yz = r0.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r7.yzw = r7.xzy + r7.xzy;
    r5.x = ps;
    r5.yzw = (-abs(r5.zzz) >= 0.0) ? r16.xyz : 1.0;
    r14.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r5.yzw;
    ps = r14.w + r14.w;
    r5.xyz = r5.xxx * -SpotDirection.xyz;
    r7.x = ps;
    r7 = r7.xywz - 1.0;
    ps = 0.5 * r7.x;
    r5.z = dot(r5.zxy, r2.zxy);
    r5.y = ps;
    r16.x = r7.w - r5.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r16.yzw = UniformVector_2.xyz * UniformVector_2.www;
    r5.x = (r20.x == 0.0) ? r18.x : r18.y;
    r5.x = (r19.w == 0.0) ? r18.z : r5.x;
    r1.w = (r19.x == 0.0) ? r18.w : r5.x;
    ps = 1.0 - r1.w;
    r15.xyz = r16.yzw * r15.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r16.y = r7.y + r17.y;
    r5.w = ps;
    r16.z = r17.z * 2.0 + r7.z;
    ps = r4.w;
    r7.yzw = r5.www * r1.xyz;
    ps = r6.w * ps;
    r16.yz = -r13.zw + r16.yz;
    r1.z = ps;
    r5.w = r1.z * r9.w - r1.z;
    r1.xy = r8.ww * r5.xw;
    ps = UniformScalar_1.x * r6.y;
    r5.xw = r1.zx + r1.yw;
    r6.x = ps;
    r1.x = saturate(r5.x * 2.5 - 0.5);
    r0.y = r16.x * r1.x + r5.y;
    r1.yz = r16.yz * r1.xx - 2.0;
    r4.yz = r6.xx * r4.yz + r1.yz;
    ps = r0.w;
    r1.yzw = r15.xyz * r14.xyz;
    r5.y = ps;
    ps = (-1.0) + r5.y;
    r11.xy = r4.yz + r11.yz;
    r4.y = ps;
    ps = (-1.0) + r0.y;
    r11.xy = r11.xy * r6.yy;
    r4.z = ps;
    r11.zw = r4.zy * r6.yy + 1.0;
    r11 = (r6.xyyy > 0.0) ? r11.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r6.xyyy >= 0.0) ? r11 : float4(1.0, 0.0, 0.0, 1.0);
    r5.y = dot(r6.wyz, r6.wyz);
    r4.xyz = r1.yzw * r6.xxx;
    r1.yzw = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r5.y));
    r10.x = abs(r4.w) * abs(r4.w);
    r5.y = ps;
    r11.xyz = r6.yzw * r5.yyy;
    r5.y = dot(r11.zxy, r10.wyz);
    r6.xyz = r11.xyz * r5.yyy;
    r6.xyz = r6.xyz * 2.0 - r10.yzw;
    r5.x = saturate(dot(r7.wyz, r6.zxy));
    ps = log2(r5.x);
    r10.y = r5.w + r5.w;
    r13.z = ps;
    r6.xyw = r13.zyx * float3(15.0, 0.875, 0.875);
    ps = -SpotAngles.x - -r5.z;
    r10.zw = r6.wy * r12.yz;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r10.yzw = r10.yzw + float3(-0.75, 0.125, 0.125);
    r7.x = saturate(ps);
    r5.x = saturate(r12.w * 0.2 + r10.y);
    ps = r10.x * r10.x;
    r6.w = saturate(dot(r11.zyx, r7.wzy));
    r7.y = ps;
    ps = r10.z * r10.w;
    r8.xyz = r5.xxx * r8.xyz;
    r7.z = ps;
    r5.xyz = r7.zzz * r9.xyz + ModShadowColor.xyz;
    ps = r7.x * r7.x;
    r0.xyz = r8.xyz * r0.www;
    r5.w = ps;
    ps = r7.y * r7.y;
    r4.xyz = r4.xyz - r0.xyz;
    r6.z = ps;
    r1.yzw = r6.zzz * r1.yzw;
    r0.xyz = r4.xyz * r1.xxx + r0.xyz;
    r0.xyz = r0.xyz * r2.xyz;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.yzw * r1.xxx;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r3.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
