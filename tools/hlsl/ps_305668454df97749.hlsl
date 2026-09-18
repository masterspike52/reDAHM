// ps_305668454df97749.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 501 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000007D4 10041900 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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
samplerCUBE TextureCube_0 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r11.zw = r0.wz * 6.0;
    ps = r0.w;
    r10.zw = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r7.w = -r0.z + 1.0;
    r16.x = ps;
    ps = r3.w;
    r13.xy = r0.wz * UniformVector_7.xy;
    ps = 0.0001 * ps;
    r8.w = r3.w - 4e+02;
    r8.y = saturate(ps);
    r15 = r6.yxzw * 2.0 - 1.0;
    r17.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = saturate(OpacityOverride.x);
    r6.z = ps;
    ps = 1.0 - r6.x;
    r8.xz = r0.wz * UniformVector_1.xy;
    r14.y = ps;
    ps = r12.x + r12.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r14.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r17.zxy, r17.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.y = dot(r15.zyx, r15.zyx);
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r6.y = saturate(r8.w * 0.00022222222);
    r7.y = ps;
    ps = (-0.025) * r6.y;
    r6.zw = r6.zw * abs(r9.xy);
    r16.y = ps;
    ps = rsqrt(abs(r7.x));
    r18.xyz = r15.xzy * r7.yyy;
    r7.x = ps;
    ps = (-0.075) * r6.x;
    r9.xyz = r17.xzy * r7.xxx;
    r16.z = ps;
    ps = 1.0 * r6.x;
    r7.xyz = r18.yzx * r9.zyx;
    r16.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r19 = r16.wwwz * r4.xyzx;
    r6.y = ps;
    r7.xyz = r18.xyz * r9.yxz - r7.xyz;
    r10.xy = r19.xy * r16.yy + r8.xz;
    ps = r10.y;
    r15.xyz = r7.xyz * r15.www;
    ps = r6.y * ps;
    r6.x = dot(r15.zxy, r15.zxy);
    r8.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r7.xy = -r8.xy + 1.0;
    r7.z = ps;
    ps = r12.y + r12.y;
    r16.yzw = r7.wxz * UniformVector_2.yyx;
    r14.w = ps;
    ps = r16.w;
    r8.xyz = r16.zxy - 0.5;
    ps = r10.x * ps;
    r24.xyz = float3((r16.xyz >= 0.5));
    r14.x = ps;
    r12.xyz = r14.zwx + float3(-1.0, -1.0, -0.5);
    r4.xyz = r8.yzx - r16.xyz;
    r8.yz = float2((r14.xy >= float2(0.5, 0.004)));
    r4.yzw = r4.zxy * r24.zxy + r16.zxy;
    ps = rsqrt(abs(r6.x));
    r15.w = r12.z - r14.x;
    r8.x = ps;
    r17 = r15.xzyw * r8.xxxy;
    r4.x = r14.x + r17.w;
    r14 = r4.zwxy + r4.zwxy;
    r4 = tex2D(Texture2D_6, r0.xy).xwyz;
    r15 = tex2D(Texture2D_1, r14.zw).wxyz;
    r23 = tex2D(Texture2D_1, r14.xy);
    r11.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r16.xyz = tex2D(Texture2D_8, r13.xy).xyz;
    r21.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r14.xyw = tex2D(Texture2D_2, r11.zw).xyw;
    r20.yzw = tex2D(Texture2D_0, r10.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r10.zw).wxy;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r8.w = float((UniformScalar_5.x > 1.0));
    ps = UniformVector_6.x * UniformVector_6.w;
    r9.w = dot(r2.zxy, r2.zxy);
    r21.x = ps;
    r10.zw = r6.yz * 2.0 - 1.0;
    r13.xyz = r20.wyz * 2.0 - 1.0;
    r11.zw = r14.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r9.w));
    r25.yzw = r21.yzw + r21.yzw;
    r6.z = ps;
    r16.xyz = (-abs(r8.www) >= 0.0) ? r16.xyz : 1.0;
    r22.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r16.xyz;
    ps = r14.w;
    r14.xyz = r6.zzz * r2.xyz;
    ps = r12.w * ps;
    r11 = r11 * float4(0.875, 0.875, 0.5, 0.5);
    r14.w = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r12.zw = r14.wz + float2(-1.0, 0.1);
    r21.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.z = saturate(r12.w * 5.0);
    r21.z = ps;
    ps = (-1.0) + r6.x;
    r6.z = -r6.z + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r16.x = max(r19.z, 0.0);
    r16.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r25.x = r6.x * r7.y;
    r16.z = ps;
    ps = UniformScalar_1.x * r7.y;
    r2 = r25.xywz + float4(1.0, -1.0, -1.0, -1.0);
    r6.y = ps;
    r2.z = r2.z * UniformVector_4.z - r13.x;
    r6.x = (r6.y > 0.0) ? r2.x : 1.0;
    r6.zw = r6.yy * r10.zw + r2.yw;
    r6.zw = r6.zw * UniformVector_4.xy - r13.yz;
    r21.w = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = r12.x;
    r10.z = dot(r24.xyy, float3(1.0, 1.0, 1.0));
    r6.y = (r10.z == 0.0) ? r23.x : r23.y;
    r10.w = r24.z * 2.0 + r8.y;
    r6.x = (r10.w == 0.0) ? r15.y : r15.z;
    ps = r11.z + ps;
    r24 = r21 * r4.xzwy;
    r12.x = ps;
    ps = r12.y;
    r2.xyw = r24.xyz * r22.xyz;
    ps = r11.w + ps;
    r22 = r10.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r12.y = ps;
    r6.x = (r22.z == 0.0) ? r15.w : r6.x;
    r6.y = (r22.y == 0.0) ? r23.z : r6.y;
    ps = r2.x;
    r15.yz = r2.yw * r24.ww;
    r16.w = (r22.x == 0.0) ? r23.w : r6.y;
    r20.x = (r22.w == 0.0) ? r15.x : r6.x;
    ps = r21.w * ps;
    r6.y = max(r16.w, 0.0);
    r6.x = ps;
    ps = r6.x;
    r6.y = min(r6.y, 0.3);
    ps = r4.y * ps;
    r16 = -r16.wxyz + 1.0;
    r15.x = ps;
    ps = 3.3333333 * r6.y;
    r15.w = r16.x * 2.5;
    r6.x = ps;
    r2.xy = r6.xx * r12.xy + r6.zw;
    r13.x = r6.x * r12.z + 1.0;
    ps = -r14.w;
    r12 = r15.wxyz * r13.xxxx;
    ps = r20.x + ps;
    r8.w = saturate(r12.x - 0.5);
    r6.z = ps;
    r6.xy = r2.xy * r8.ww + r13.yz;
    r6.w = r2.z * r8.w - 2.0;
    r11.zw = r6.zw + r20.xw;
    r6.z = r11.w + r20.w;
    r6.xyz = r6.zxy * r7.yyy;
    ps = 1.0 + r6.x;
    r2.w = -r4.y + 1.0;
    r6.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.x = r19.w + r0.w;
    r6.x = ps;
    r7.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r7.zxy, r19.zxy);
    r6.xyz = r7.xyz * r6.xxx;
    r13.yzw = r6.xyz * 2.0 - r19.xyz;
    r6.xyz = r18.zxy * r13.www;
    r6.xyz = r17.xzy * r13.zzz + r6.xyz;
    r6.xyw = r9.yzx * r13.yyy + r6.zyx;
    r9.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r9.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = r0.z;
    r6 = xe_cube(r6.xyz);
    r2.y = ps;
    ps = 1.0 / abs(r6.z);
    r9.z = r6.w;
    r7.w = ps;
    r9.xy = r6.yx * r7.ww + 1.5;
    r0.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r2.xyz = tex2D(Texture2D_5, r2.xy).xyz;
    r9.xyz = texCUBE(TextureCube_0, xe_cube_dir(r9.xyz)).xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r5.zxy, r5.zxy);
    r6.xyz = -UniformVector_0.zxy + 1.0;
    ps = rsqrt(abs(r6.w));
    r4.xzw = r2.www * UniformVector_5.xyz;
    r6.w = ps;
    r17.xyz = r2.www * r9.xyz;
    r9.xyz = r4.yyy * UniformScalar_6.xxx + r4.xwz;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r11.xy = r11.xy * r16.zw;
    r4.y = ps;
    r2.xyz = r17.xzy * r16.yyy + r2.xzy;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r2.xyz = r4.xwz * r2.xyz;
    r4.z = ps;
    r9.xyz = r15.xyz * UniformScalar_7.xxx + r9.xzy;
    r2.xyz = r2.xyz * r8.www + UniformVector_0.xzy;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r11.yzw = r11.xyz + float3(0.125, 0.125, 1.25);
    r4.w = ps;
    ps = r6.w;
    r7.w = saturate(r11.w - r14.w);
    ps = r5.x * ps;
    r0.xyz = r7.www * r0.xyz;
    r4.x = ps;
    ps = r6.w;
    r12.xyz = r12.yzw - r0.xyz;
    r0.xyz = r12.xyz * r8.www + r0.xyz;
    r12.xyz = r4.yzw * r0.xyz + r2.xzy;
    ps = r5.y * ps;
    r0.xyz = r0.xyz * r6.yzx;
    r4.y = ps;
    ps = r6.w;
    r2.xyz = r7.zzz * r1.xyz;
    ps = r5.z * ps;
    r6.y = saturate(dot(r14.zxy, r13.wyz));
    r4.z = ps;
    ps = log2(r6.y);
    r6.x = dot(r4.zxy, r7.zxy);
    r6.y = ps;
    r6.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r13.yz = r6.xy + 0.5;
    r6.x = ps;
    r4.xyz = r6.xxx * r1.xzy;
    r6.xyw = abs(r13.yzx) * abs(r13.yzx);
    r7.xyz = r0.xzy * r6.xxx;
    ps = r6.w * r6.w;
    r6.xyz = r0.xzy * r6.yyy;
    r11.x = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r12.xzy;
    r7.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xw = r11.yx * r11.zx;
    r6.xyz = r6.xxx * r10.xyz + ModShadowColor.xyz;
    r1.xyz = r6.www * r9.xyz;
    r1.xyz = r1.xzy * r8.www;
    r7.xyz = r4.xyz * r1.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r8.z + r3.w;
    r6.xyz = r7.xyz * r8.zzz + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
