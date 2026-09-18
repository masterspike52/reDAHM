// ps_ba5d9345280a771b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041000 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r6.y = ps;
    r7.yz = r0.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r6.z = ps;
    ps = r1.z;
    r9.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = r10.w - 0.5;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r12.xyz = r6.xxx * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.zw = r12.xy * r5.ww;
    r3.y = ps;
    r5.zw = r3.xy - 0.5;
    r7.xw = float2((r3.xy >= 0.5));
    ps = r6.y;
    r5.zw = r5.zw - r3.xy;
    ps = abs(r8.x) * ps;
    r9.zw = r5.zw * r7.xw;
    r6.x = ps;
    ps = r6.z;
    r11 = r3.zwxy + r9;
    ps = abs(r8.y) * ps;
    r5.zw = r11.zw + r11.zw;
    r6.y = ps;
    r3.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6 = tex2D(Texture2D_1, r5.zw);
    r9.xyz = tex2D(Texture2D_2, r7.yz).xyw;
    r8.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r5.z = saturate(r4.w * 0.0001);
    r14.xy = r0.xy * UniformScalar_0.xx;
    ps = r0.w;
    r7.yz = r4.xy * ScreenPositionScaleBias.xy;
    r15.w = r9.z * r8.z - 1.0;
    r3.xw = r9.xy * 2.0 - 1.0;
    ps = UniformVector_7.x * ps;
    r8.yz = r8.xy + r8.xy;
    r9.x = ps;
    ps = 1.0 - r5.x;
    r8.x = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r7.x = (r8.x == 0.0) ? r6.x : r6.y;
    ps = 1.0 - r5.z;
    r8 = r8.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.y = ps;
    r15.xy = r3.xw * 0.5 + r8.zw;
    r5.x = (r8.y == 0.0) ? r6.z : r7.x;
    r6.z = (r8.x == 0.0) ? r6.w : r5.x;
    ps = ModShadowGroupColor.x * r5.w;
    r5.x = max(r6.z, 0.0);
    r6.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r3.x = min(r5.x, 0.3);
    r6.x = ps;
    ps = 1.0 - r6.x;
    r8.xzw = r3.zxy * float3(0.875, 3.3333333, 0.875);
    r15.z = ps;
    r8.xy = r8.zx * r15.wz + float2(1.0, 0.125);
    ps = 1.0 / r4.w;
    r7.x = abs(r8.x) * abs(r8.x);
    r7.w = ps;
    ps = r0.z;
    r7.xyw = r7.yzx * r7.wwx;
    ps = UniformVector_7.y * ps;
    r5.xz = r7.xy + ScreenPositionScaleBias.wz;
    r9.y = ps;
    r3.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r4.y = tex2D(Texture2D_5, r0.xy).x;
    r9.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r4.xzw = tex2D(Texture2D_0, r11.xy).xyz;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xyz = tex2D(LightAttenuationTexture, r5.xz).xyz;
    r7.xyz = tex2D(Texture2D_3, r14.xy).wxy;
    r16.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r1.zxy, r1.zxy);
    r13.xyz = r13.xyz * 2.0 - 1.0;
    r14.xyz = r4.xzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r10.xyz = r16.xyz * r10.xyz;
    r5.x = ps;
    ps = r7.y + r7.y;
    r1.xyz = r5.xxx * r1.xyz;
    r16.y = ps;
    r13.z = r13.z * UniformVector_4.z - r14.z;
    ps = r7.z + r7.z;
    r5.xz = -r6.yz + 1.0;
    r16.z = ps;
    ps = UniformScalar_1.x * r5.y;
    r16.x = r8.w * r5.x;
    r6.x = ps;
    ps = 2.5 * r5.z;
    r16.yzw = r16.xyz + float3(0.125, -1.0, -1.0);
    r16.x = ps;
    r5.xz = r6.xx * r16.zw + r13.xy;
    r6.xy = r5.xz * UniformVector_4.xy - r14.xy;
    r5.xz = r16.xy * r8.xy;
    r0.xyz = r5.zzz * r0.xyz + ModShadowColor.xyz;
    r13.xy = r8.zz * r15.xy + r6.xy;
    ps = (-1.0) + r7.x;
    r5.x = saturate(r5.x - 0.5);
    r13.w = ps;
    r6.xy = r13.xy * r5.xx + r14.xy;
    r4.xz = r13.wz * r5.yx + float2(1.0, -2.0);
    r6.z = r4.w * 2.0 + r4.z;
    r6.xyz = r6.zxy * r5.yyy;
    ps = 1.0 + r6.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r5.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r5.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r5.z = r7.w * r7.w;
    r5.y = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r6.zxy, r12.zxy);
    r13.xyz = r6.xyz * r5.yyy;
    r12.xyz = r13.xyz * 2.0 - r12.xyz;
    r5.y = saturate(dot(r1.zxy, r12.zxy));
    ps = log2(r5.y);
    r6.w = saturate(dot(r6.zyx, r1.zyx));
    r5.y = ps;
    ps = UniformScalar_9.x * r5.y;
    r6.xyz = r11.xyz * r2.www;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r7.w = r5.y * 15.0;
    r5.y = ps;
    ps = UniformScalar_10.x * r5.y;
    r0.w = ps;
    r10.w = r0.w * r4.x;
    r1 = r10 * r9.xyzx;
    r1 = r1 * r4.xxxy;
    r2.xyz = r1.xyz * r8.xxx - r3.xyz;
    r4.xyz = r1.xyz * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r1.xyz = r4.xyz + r1.www;
    r2.xyz = r2.xyz * r5.xxx + r3.xyz;
    r7.xyz = r2.xyz * r7.xyz;
    r1.xyz = r5.zzz * r1.xyz;
    ps = pow(2.0, r7.w);
    r5.yzw = r1.xyz * r5.xxx;
    r5.x = ps;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xy = r7.xy * r6.ww + r5.xy;
    r5.z = r7.z * r6.w + r5.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
