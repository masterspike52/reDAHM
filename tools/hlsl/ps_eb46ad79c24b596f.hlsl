// ps_eb46ad79c24b596f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r10 = r0.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r11.x = ps;
    r19.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) - -r4.w;
    r4.z = float((UniformScalar_4.x >= 1.0));
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r19.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    r13.xyz = r5.xxx * r3.xyz;
    ps = -r0.z;
    r12.xyw = r19.yzx * float3(4.0, 1.0, -0.125);
    r5.xz = r13.xy * r12.ww + r0.wz;
    ps = 1.0 + ps;
    r5.y = -r5.z + 1.0;
    r5.w = ps;
    r11.yzw = r5.wxy * UniformVector_1.yxy;
    ps = r0.w;
    r3 = r11.wzxy - 0.5;
    ps = 4.0 * ps;
    r9 = float4((r11.xywz >= 0.5));
    r8.x = ps;
    ps = r0.z;
    r3 = r3 - r11.wzxy;
    r3 = r3.yxzw * r9.wzxy + r11.zwxy;
    ps = 4.0 * ps;
    r3 = r3.zwxy + r3.zwxy;
    r8.y = ps;
    r11.xyz = tex2D(Texture2D_6, r10.zw).xyz;
    r15 = tex2D(Texture2D_2, r3.xy);
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r1.w = tex2D(Texture2D_3, r8.xy).z;
    r8.xy = r0.xy * UniformScalar_0.xx;
    ps = -r6.w;
    r14.xyz = UniformVector_2.xyz * UniformVector_2.www;
    ps = UniformScalar_8.x + ps;
    r0.x = float((UniformScalar_7.x >= 1.0));
    r0.y = ps;
    r0.x = r0.y * r0.x + r6.w;
    ps = -r0.x;
    r10.yzw = r10.xzy + r10.xzy;
    ps = r6.z + ps;
    r9.z = dot(r9.wzz, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r9.w = dot(r9.xyy, float3(1.0, 1.0, 1.0));
    r8.z = ps;
    r6.x = (r9.w == 0.0) ? r15.x : r15.y;
    ps = UniformScalar_9.x;
    r17 = r9.wzzw + float4(-2.0, -3.0, -2.0, -3.0);
    r8.w = ps;
    r6.x = (r17.x == 0.0) ? r15.z : r6.x;
    r6.x = (r17.w == 0.0) ? r15.w : r6.x;
    ps = max(r8.z, r8.w);
    r0.y = max(r6.x, 0.0);
    r0.x = ps;
    ps = 1.0 / UniformScalar_10.x;
    r3.xy = min(r0.yx, float2(0.3, 1.0));
    r0.x = ps;
    ps = r1.w;
    r0.x = saturate(r3.y * r0.x);
    ps = r6.w * ps;
    r11.w = -r0.x + 1.0;
    r14.w = ps;
    ps = r4.w;
    r16 = r14 * r11;
    ps = 0.0001 * ps;
    r0.x = float((r16.w >= 0.05));
    r0.y = saturate(ps);
    r0.xy = -r0.xy + 1.0;
    r1.w = (UniformScalar_8.x > 0.0) ? r0.x : 1.0;
    r10.x = (UniformScalar_8.x >= 0.0) ? r1.w : r0.x;
    ps = 2.5 * r5.x;
    r10 = r10.xywz + float4(-0.5, -1.0, -1.0, -1.0);
    r9.x = ps;
    ps = 2.5 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r10.xxxx)) clip(-1.0);
    r9.y = ps;
    r8.xyz = tex2D(Texture2D_0, r8.xy).xyw;
    r20 = tex2D(Texture2D_2, r3.zw);
    r5.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r11 = tex2D(Texture2D_3, r0.wz);
    ps = r6.w;
    r5.w = r1.z + 0.1;
    ps = 1e+01 * ps;
    r18.w = saturate(r5.w * 5.0);
    r1.w = saturate(ps);
    r18.x = r11.x * 4.0 - 4.0;
    ps = r11.y + r11.y;
    r14.zw = r5.xy * 4.0;
    r14.x = ps;
    ps = r5.z + r5.z;
    r6.y = r19.w * r11.w;
    r14.y = ps;
    ps = (-1.0) - -r6.y;
    r15 = r14.zwxy + float4(-2.0, -2.0, -2.0, -1.0);
    r17.x = ps;
    ps = r15.w;
    r3.yz = r0.wz * UniformVector_3.xy;
    r5.x = ps;
    ps = r15.z;
    r11.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.y = (r9.z == 0.0) ? r20.x : r20.y;
    r5.y = (r17.z == 0.0) ? r20.z : r5.y;
    r5.w = (r17.y == 0.0) ? r20.w : r5.y;
    ps = r19.z + ps;
    r18.z = r3.x * 3.3333333;
    r18.y = ps;
    ps = 0.5 * r5.x;
    r5.yz = -r18.zw + 1.0;
    r0.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r12.z = r1.w * r5.y;
    r6.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r17.yzw = r18.xzy + r12.xzy;
    r6.w = ps;
    ps = 1.0 - r5.w;
    r12 = -r6.yxzw + 1.0;
    r5.x = ps;
    ps = UniformScalar_1.x * r0.y;
    r6.xyz = r17.yxz * r17.zzw;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = r6.y + 1.0;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r9.w * r12.y;
    r3.w = ps;
    r5.y = r5.z * r11.z - r5.z;
    ps = r10.y;
    r7.xy = r3.xw * abs(r7.xy);
    r6.y = r6.z * 2.0 + r10.z;
    ps = r6.x + ps;
    r5.xy = r1.ww * r5.xy;
    r6.x = ps;
    ps = r10.w;
    r15.yz = -r15.xy + r6.xy;
    ps = -r0.w + ps;
    r3.xw = r5.zx + r5.yw;
    r15.x = ps;
    r1.w = saturate(r3.x * 2.5 - 0.5);
    r8.w = r15.x * r1.w + r0.w;
    ps = 1.0 / r4.w;
    r11.zw = r8.zw - 1.0;
    r0.w = ps;
    r5.xy = r11.xy * r0.ww + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r10.xyz = tex2D(Texture2D_7, r3.yz).xyz;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r4.xy = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r5.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = 1.0 - r5.x;
    r2.x = float((UniformScalar_4.x > 1.0));
    r5.x = saturate(ps);
    r2.xyz = (-abs(r2.xxx) >= 0.0) ? r10.xyz : 1.0;
    r2.xyz = (-abs(r4.zzz) >= 0.0) ? 1.0 : r2.xyz;
    ps = log2(r5.x);
    r10.xyz = r6.www * r1.xyz;
    r5.x = ps;
    r1.xyz = r16.xyz * r2.xyz;
    r2.xy = r15.yz * r1.ww - 2.0;
    r2.xy = r0.zz * r4.xy + r2.xy;
    r2.xy = r2.xy + r14.zw;
    r2.xy = r2.xy * r0.yy;
    r2.zw = r11.wz * r0.yy + 1.0;
    r2 = (r0.zyyy > 0.0) ? r2.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r0 = (r0.zyyy >= 0.0) ? r2 : float4(1.0, 0.0, 0.0, 1.0);
    r6.w = dot(r0.wyz, r0.wyz);
    ps = abs(r9.w) * abs(r9.w);
    r2.xyz = r1.xyz * r0.xxx;
    r1.x = ps;
    r4.xyz = r2.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r6.w));
    r7.x = r1.x * r1.x;
    r6.w = ps;
    r11.xyz = r0.yzw * r6.www;
    r6.w = dot(r11.zxy, r13.zxy);
    r0.xyz = r11.xyz * r6.www;
    r0.xyz = r0.xyz * 2.0 - r13.xyz;
    r6.w = saturate(dot(r10.zxy, r0.zxy));
    ps = log2(r6.w);
    r1.z = r3.w + r3.w;
    r7.w = ps;
    r0.xyz = r7.wyz * float3(15.0, 0.875, 0.875);
    r1.xy = r0.yz * r12.zw;
    r7.yzw = r1.xyz + float3(0.125, 0.125, -0.75);
    r1.x = saturate(r12.x * 0.2 + r7.w);
    ps = r7.x * r7.x;
    r6.w = saturate(dot(r11.zyx, r10.zyx));
    r0.w = ps;
    ps = r7.y * r7.z;
    r1.xyz = r1.xxx * r9.xyz;
    r2.w = ps;
    r5.yzw = r2.www * r5.yzw + ModShadowColor.xyz;
    r4.xyz = r0.www * r4.xyz;
    r1.xyz = r1.xyz * r8.zzz;
    r2.xyz = r2.xyz - r1.xyz;
    ps = pow(2.0, r0.x);
    r0.yzw = r4.xyz * r1.www;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r0.yzw * r0.xxx;
    r5.x = ps;
    r1.xyz = r2.xyz * r1.www + r1.xyz;
    ps = pow(2.0, r5.x);
    r1.xyz = r1.xyz * r3.xyz;
    r5.x = ps;
    r0.xy = r1.xy * r6.ww + r0.xy;
    r0.z = r1.z * r6.w + r0.z;
    r0.xyz = r0.xyz * r5.xxx;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
