// ps_fd418866dd6eb706.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r12 = r0.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r9.x = ps;
    r16.yzw = tex2D(Texture2D_3, r12.xy).xyw;
    ps = r4.w;
    r8.zw = r0.wz * 4.0;
    ps = (-4e+02) + ps;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r16.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r14.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r11.xyw = r16.yzx * float3(4.0, 1.0, -0.125);
    r5.w = ps;
    r5.xy = r14.xy * r11.ww + r0.wz;
    ps = r0.w;
    r5.z = -r5.y + 1.0;
    ps = UniformVector_3.x * ps;
    r9.yzw = r5.wxz * UniformVector_1.yxy;
    r3.x = ps;
    ps = r0.z;
    r10 = r9.wzxy - 0.5;
    ps = UniformVector_3.y * ps;
    r18 = float4((r9.wzxy >= 0.5));
    r3.y = ps;
    ps = 2.5 * r5.x;
    r10 = r10 - r9.wzxy;
    r8.x = ps;
    r9 = r10.yxzw * r18.yxzw + r9.zwxy;
    ps = 2.5 * r5.y;
    r9 = r9.zwxy + r9.zwxy;
    r8.y = ps;
    r10 = tex2D(Texture2D_2, r9.xy);
    r15.xyz = tex2D(Texture2D_6, r12.zw).xyz;
    r12.xyz = tex2D(Texture2D_7, r3.xy).xyz;
    r5.yzw = tex2D(Texture2D_1, r8.xy).zxy;
    r11.z = tex2D(Texture2D_3, r8.zw).z;
    r3 = tex2D(Texture2D_3, r0.wz).xywz;
    ps = 1.0 / r4.w;
    r13.xy = r4.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    r8.zw = r13.xy * r8.zz + ScreenPositionScaleBias.wz;
    r17.x = r3.x * 4.0 - 4.0;
    r11.z = r11.z * r6.w;
    r6.x = r16.w * r3.z;
    r17.yzw = UniformVector_2.xyz * UniformVector_2.www;
    ps = r3.y + r3.y;
    r12.w = float((UniformScalar_4.x >= 1.0));
    r13.x = ps;
    ps = 4.0 * r5.z;
    r13.z = float((UniformScalar_4.x > 1.0));
    r13.y = ps;
    r12.xyz = (-abs(r13.zzz) >= 0.0) ? r12.xyz : 1.0;
    ps = 4.0 * r5.w;
    r19.xyz = r17.yzw * r15.xyz;
    r13.z = ps;
    r15.xyz = (-abs(r12.www) >= 0.0) ? 1.0 : r12.xyz;
    ps = UniformScalar_8.x - r6.w;
    r15.w = float((UniformScalar_7.x >= 1.0));
    r19.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15 = r19 * r15;
    r17.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r15.w + r6.w;
    r17.z = ps;
    ps = -r5.z;
    r7.xy = r17.yz * abs(r7.xy);
    ps = r6.z + ps;
    r19.x = dot(r18.yxx, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    ps = r5.z;
    r19.y = dot(r18.zww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r5.z = (r19.y == 0.0) ? r10.x : r10.y;
    ps = 1e+01 * r6.w;
    r12.xyz = r13.xyz - 2.0;
    r1.w = saturate(ps);
    ps = UniformScalar_9.x;
    r18 = r19.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r6.w = ps;
    r5.z = (r18.y == 0.0) ? r10.z : r5.z;
    r6.z = (r18.z == 0.0) ? r10.w : r5.z;
    ps = max(r6.y, r6.w);
    r5.z = max(r6.z, 0.0);
    r5.w = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.zw = min(r5.zw, float2(0.3, 1.0));
    r6.y = ps;
    ps = 0.1 - -r1.z;
    r9.xy = r0.xy * UniformScalar_0.xx;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.w = saturate(r5.w * r6.y);
    r6.y = saturate(ps);
    ps = r12.x;
    r10 = -r6.wzyx + 1.0;
    ps = r16.z + ps;
    r5.x = r11.z * r10.x;
    r17.y = ps;
    ps = 3.3333333 * r5.z;
    r17.w = float((r5.x >= 0.05));
    r17.z = ps;
    r3.xy = -r17.zw + 1.0;
    r11.z = r1.w * r3.x;
    r5.x = (UniformScalar_8.x > 0.0) ? r3.y : 1.0;
    r16.w = (UniformScalar_8.x >= 0.0) ? r5.x : r3.y;
    ps = (-1.0) - -r6.x;
    r11.yzw = r17.xzy + r11.xzy;
    r11.x = ps;
    r16.xyz = r11.xyz * r11.zzw;
    r6.xw = r16.wx + float2(-0.5, 1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r3.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r8.xyz = tex2D(Texture2D_5, r8.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r17 = tex2D(Texture2D_2, r9.zw);
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xzw = tex2D(Texture2D_0, r9.xy).xyw;
    r5.x = dot(r2.zxy, r2.zxy);
    r11.zw = r0.xz * 2.0 - 1.0;
    ps = r5.y + r5.y;
    r7.xyz = r7.xzy + r7.xzy;
    r7.w = ps;
    ps = rsqrt(abs(r5.x));
    r5.z = saturate(-r5.x + 1.0);
    r5.x = ps;
    ps = log2(r5.z);
    r5.xyw = r5.xxx * -SpotDirection.xyz;
    r5.z = ps;
    r9 = r7.xzyw - 1.0;
    r5.y = dot(r5.wxy, r2.zxy);
    ps = -SpotAngles.x - -r5.y;
    r0.y = r9.w * 0.5;
    r5.x = ps;
    ps = r9.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = (r19.x == 0.0) ? r17.x : r17.y;
    r5.y = (r18.w == 0.0) ? r17.z : r5.y;
    r6.x = (r18.x == 0.0) ? r17.w : r5.y;
    ps = -r0.y + ps;
    r2.xy = r10.zz * ModShadowGroupColor.xy;
    r12.x = ps;
    ps = SpotAngles.y * r5.x;
    r2.z = saturate(r4.w * 0.0001);
    r4.y = saturate(ps);
    ps = 1.0 - r6.x;
    r2.yzw = -r2.zxy + 1.0;
    r5.x = ps;
    ps = UniformScalar_1.x * r2.y;
    r6.y = r9.x + r16.y;
    r2.x = ps;
    r6.z = r16.z * 2.0 + r9.y;
    ps = abs(r6.w) * abs(r6.w);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    ps = r6.w;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = r10.y * ps;
    r12.yz = -r12.yz + r6.yz;
    r6.w = ps;
    r5.y = r6.w * r3.w - r6.w;
    ps = r4.x * r4.x;
    r6.yz = r1.ww * r5.xy;
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r5.xy = r6.yw + r6.xz;
    r5.w = ps;
    r6.y = saturate(r5.y * 2.5 - 0.5);
    r0.y = r12.x * r6.y + r0.y;
    r6.xz = r12.yz * r6.yy - 2.0;
    r6.xz = r2.xx * r11.zw + r6.xz;
    ps = r0.w;
    r12.xyz = r5.www * r1.xyz;
    r5.y = ps;
    ps = (-1.0) + r5.y;
    r6.zw = r6.xz + r13.yz;
    r6.x = ps;
    ps = (-1.0) + r0.y;
    r13.xy = r6.zw * r2.yy;
    r6.z = ps;
    r13.zw = r6.zx * r2.yy + 1.0;
    r13 = (r2.xyyy > 0.0) ? r13.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r13 = (r2.xyyy >= 0.0) ? r13 : float4(1.0, 0.0, 0.0, 1.0);
    ps = r4.y * r4.y;
    r6.x = dot(r13.wyz, r13.wyz);
    r5.w = ps;
    ps = r1.w * r1.w;
    r4.xyz = r15.xyz * r13.xxx;
    r6.z = ps;
    r1.xyz = r4.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r6.zzz * r1.xyz;
    r6.x = ps;
    r13.xyz = r13.yzw * r6.xxx;
    r6.x = dot(r13.zxy, r14.zxy);
    r6.xzw = r13.xyz * r6.xxx;
    r6.xzw = r6.xzw * 2.0 - r14.xyz;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r6.z = saturate(dot(r12.zxy, r6.wxz));
    r6.x = ps;
    ps = log2(r6.z);
    r6.w = saturate(dot(r13.zyx, r12.zyx));
    r11.z = ps;
    ps = r5.x + r5.x;
    r10.xyz = r11.xyz * float3(0.875, 0.875, 15.0);
    r5.z = ps;
    ps = pow(2.0, r10.z);
    r1.xyz = r1.xyz * r6.yyy;
    r6.z = ps;
    ps = r1.x;
    r5.xy = r10.xy * r2.zw;
    ps = r6.z * ps;
    r5.xyz = r5.xyz + float3(0.125, 0.125, -0.75);
    r1.x = ps;
    r1.w = saturate(r10.w * 0.2 + r5.z);
    ps = r1.y;
    r5.x = r5.x * r5.y;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = r6.z * ps;
    r2.xyz = r1.www * r8.xyz;
    r1.y = ps;
    ps = r1.z;
    r0.xyz = r2.xyz * r0.www;
    ps = r6.z * ps;
    r2.xyz = r4.xyz - r0.xyz;
    r1.z = ps;
    r0.xyz = r2.xyz * r6.yyy + r0.xyz;
    ps = pow(2.0, r6.x);
    r0.xyz = r0.xyz * r7.xyz;
    r6.x = ps;
    r6.yz = r0.xy * r6.ww + r1.xy;
    r6.w = r0.z * r6.w + r1.z;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
