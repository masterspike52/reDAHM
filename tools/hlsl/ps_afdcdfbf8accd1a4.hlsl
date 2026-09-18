// ps_afdcdfbf8accd1a4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1e+01 * r6.w;
    r13 = r0.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r1.w = saturate(ps);
    r19.yzw = tex2D(Texture2D_3, r13.xy).xyw;
    ps = r0.w;
    r11.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_1.x * ps;
    r11.zw = r0.wz * 4.0;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r4.w - 4e+02;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r8.z = ps;
    ps = 1.0 / r4.w;
    r8.xw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r4.xy = r8.xw * r5.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.x));
    r19.x = saturate(r5.y * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r16.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r20.xyw = r19.yzx * float3(4.0, 1.0, -0.125);
    r5.w = ps;
    r5.xy = r16.xy * r20.ww + r0.wz;
    ps = r8.y;
    r5.z = -r5.y + 1.0;
    ps = abs(r7.x) * ps;
    r10.yzw = r5.wxz * UniformVector_1.yxy;
    r8.x = ps;
    ps = r8.z;
    r3 = r10.wzxy - 0.5;
    ps = abs(r7.y) * ps;
    r9 = float4((r10.xwyz >= 0.5));
    r8.y = ps;
    ps = 2.5 * r5.x;
    r3 = r3 - r10.wzxy;
    r14.x = ps;
    r3 = r3.yxzw * r9.wyxz + r10.zwxy;
    ps = 2.5 * r5.y;
    r3 = r3 + r3;
    r14.y = ps;
    r15.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r17 = tex2D(Texture2D_2, r3.xy);
    r23 = tex2D(Texture2D_2, r3.zw);
    r10.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r7 = tex2D(Texture2D_3, r0.wz).xzwy;
    r3.z = tex2D(Texture2D_3, r11.zw).z;
    r18.xyz = tex2D(Texture2D_1, r14.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r11.xy).xyw;
    r3.y = saturate(r4.w * 0.0001);
    ps = -r6.w;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = UniformScalar_8.x + ps;
    r5.y = r1.z + 0.1;
    r8.w = ps;
    r14.zw = r4.xy * 2.0 - 1.0;
    r21.x = r7.x * 4.0 - 4.0;
    ps = r7.w + r7.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r11.x = ps;
    ps = 1.0 - r5.x;
    r11.yz = r18.xy * 4.0;
    r5.z = saturate(ps);
    ps = r19.w;
    r3.w = float((UniformScalar_7.x >= 1.0));
    ps = r7.z * ps;
    r8.xyz = r8.xyz * r2.www;
    r12.z = ps;
    ps = log2(r5.z);
    r10.x = r12.z - 1.0;
    r5.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r12.xyw = r11.xyz - 2.0;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r21.y = r12.x + r19.z;
    r3.x = ps;
    ps = r18.z + r18.z;
    r8 = r8.xzyw * r3.xxxw;
    r18.x = ps;
    ps = 5.0 * r5.y;
    r5.z = r8.w + r6.w;
    r3.x = saturate(ps);
    ps = -r5.z;
    r19.yzw = r10.ywz + r10.ywz;
    ps = r6.z + ps;
    r9.y = dot(r9.wyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = r5.y;
    r9.z = dot(r9.xzz, float3(1.0, 1.0, 1.0));
    r9.x = ps;
    r5.z = (r9.z == 0.0) ? r23.x : r23.y;
    r5.y = (r9.y == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_9.x;
    r22 = r9.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r9.y = ps;
    r5.y = (r22.w == 0.0) ? r17.z : r5.y;
    r5.z = (r22.y == 0.0) ? r23.z : r5.z;
    r3.w = (r22.z == 0.0) ? r23.w : r5.z;
    r7.x = (r22.x == 0.0) ? r17.w : r5.y;
    ps = max(r9.x, r9.y);
    r5.z = max(r3.w, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_10.x;
    r5.yz = min(r5.yz, float2(1.0, 0.3));
    r4.w = ps;
    ps = 3.3333333 * r5.z;
    r21.w = saturate(r5.y * r4.w);
    r21.z = ps;
    ps = r3.z;
    r9.yz = -r21.zw + 1.0;
    ps = r6.w * ps;
    r20.z = r1.w * r9.y;
    r17.w = ps;
    ps = 1.0 - r3.w;
    r10.yzw = r21.xzy + r20.xzy;
    r6.w = ps;
    ps = 1.0 - r3.x;
    r18.yzw = r10.xyz * r10.zzw;
    r6.z = ps;
    ps = 1.0 - r3.y;
    r10.zw = r18.xy + float2(-1.0, 1.0);
    r6.y = ps;
    ps = 1.0 - r7.x;
    r7.w = r10.w * r6.w;
    r5.y = ps;
    r5.z = r7.w * r7.y - r7.w;
    ps = UniformScalar_1.x * r6.y;
    r7.yz = r1.ww * r5.yz;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r10.xy = r7.yw + r7.xz;
    r12.x = ps;
    ps = r10.x + r10.x;
    r5.yz = r10.yz * float2(2.5, 0.5);
    r19.x = ps;
    ps = (-0.5) + r5.y;
    r3 = r19.ywzx + float4(-1.0, -1.0, -1.0, -0.75);
    r9.x = saturate(ps);
    ps = r3.z;
    r7.x = r3.x + r18.z;
    r7.y = r18.w * 2.0 + r3.y;
    ps = -r5.z + ps;
    r17.yz = -r12.yw + r7.xy;
    r17.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7 = r17.yzxw * r9.xxxz;
    r12.y = ps;
    ps = r5.z;
    r7.xy = r7.xy - 2.0;
    ps = r7.z + ps;
    r12.w = float((r7.w >= 0.05));
    r4.w = ps;
    r5.yz = r6.xx * r14.zw + r7.xy;
    ps = r4.z;
    r11.xy = r5.yz + r11.yz;
    r5.z = ps;
    ps = (-1.0) + r5.z;
    r7 = -r12.zwxy + 1.0;
    r5.y = ps;
    ps = (-1.0) + r4.w;
    r11.xy = r11.xy * r6.yy;
    r5.z = ps;
    r11.zw = r5.zy * r6.yy + 1.0;
    r5.y = (UniformScalar_8.x > 0.0) ? r7.y : 1.0;
    r15.x = (UniformScalar_8.x >= 0.0) ? r5.y : r7.y;
    r11 = (r6.xyyy > 0.0) ? r11.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r6 = (r6.yyyx >= 0.0) ? r11.yzwx : float4(0.0, 0.0, 1.0, 1.0);
    ps = rsqrt(abs(r5.w));
    r5.y = dot(r6.zxy, r6.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r11.xyz = r5.zzz * r1.xyz;
    r5.y = ps;
    r12.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r12.zxy, r16.zxy);
    r5.yzw = r12.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r16.xyz;
    r5.w = saturate(dot(r11.zxy, r5.wyz));
    ps = log2(r5.w);
    r5.yz = r0.wz * UniformVector_3.xy;
    r15.w = ps;
    r6.xyz = r15.yzw * float3(0.875, 0.875, 15.0);
    r15.yz = r6.xy * r7.zw;
    r7.yzw = r15.xyz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    r0.xyz = tex2D(Texture2D_5, r14.xy).xyz;
    r13.xyz = tex2D(Texture2D_6, r13.zw).xyz;
    r1.xyz = tex2D(Texture2D_7, r5.yz).xyz;
    ps = UniformVector_2.x * UniformVector_2.w;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_2.y * UniformVector_2.w;
    r5.w = float((UniformScalar_4.x >= 1.0));
    r14.y = ps;
    ps = UniformVector_2.z * UniformVector_2.w;
    r5.y = float((UniformScalar_4.x > 1.0));
    r14.z = ps;
    r1.xyz = (-abs(r5.yyy) >= 0.0) ? r1.xyz : 1.0;
    ps = rsqrt(abs(r5.x));
    r13.xyz = r14.xyz * r13.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * -SpotDirection.xyz;
    r1.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = -UniformVector_0.x;
    r1.xyz = r13.xyz * r1.xyz;
    ps = 1.0 + ps;
    r5.y = dot(r5.zxy, r2.zxy);
    r5.x = ps;
    r5.z = saturate(r7.x * 0.2 + r3.w);
    ps = -UniformVector_0.y;
    r0.xyz = r5.zzz * r0.xyz;
    ps = 1.0 + ps;
    r0.xyz = r0.xyz * r4.zzz;
    r5.z = ps;
    ps = -UniformVector_0.z;
    r2.xyz = r1.xyz * r6.www;
    r1.xyz = r2.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = 1.0 + ps;
    r2.xyz = r2.xyz - r0.xyz;
    r5.w = ps;
    r0.xyz = r2.xyz * r9.xxx + r0.xyz;
    ps = -SpotAngles.x - -r5.y;
    r0.xyz = r0.xyz * r5.xzw;
    r5.x = ps;
    ps = abs(r10.w) * abs(r10.w);
    r5.w = saturate(dot(r12.zyx, r11.zyx));
    r7.x = ps;
    ps = SpotAngles.y * r5.x;
    r2.yz = r7.xz * r7.xw;
    r2.x = saturate(ps);
    r5.xyz = r2.zzz * r3.xyz + ModShadowColor.xyz;
    r6.xy = r2.xy * r2.xy;
    r1.xyz = r6.yyy * r1.xyz;
    ps = pow(2.0, r6.z);
    r1.xyz = r1.xyz * r9.xxx;
    r6.z = ps;
    r6.yzw = r1.xyz * r6.zzz;
    r0.xy = r0.xy * r5.ww + r6.yz;
    r0.z = r0.z * r5.w + r6.w;
    r0.xyz = r8.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.xxx;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
