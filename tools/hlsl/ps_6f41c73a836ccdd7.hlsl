// ps_6f41c73a836ccdd7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 282 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000468 10041300 00000A0A 00000000 0000994A 007F03FF 00000001 00003050 0000F151 0000F252 0000F354 0000F456 0000F557 0000F658 0000F7A0 0000F8A1 0000F9A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
//   interpolator: r9 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LightMapScale : register(c15); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UpperSkyColor : register(c12); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D LightMapTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
    float4 color0 : COLOR0; // r7
    float4 color1 : COLOR1; // r8
    float4 color2 : COLOR2; // r9
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = In.color0;
    float4 r8 = In.color1;
    float4 r9 = In.color2;
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

    ps = UniformVector_2.x * r1.w;
    r19.x = ps;
    ps = OpacityOverride.x;
    r9.w = dot(r5.zxy, r5.zxy);
    r8.w = saturate(ps);
    r11.xyz = r8.xyz * 2.0 - 1.0;
    r12 = r7.yxzw * 2.0 - 1.0;
    ps = -r1.z;
    r7.y = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r8.y = dot(r12.zyx, r12.zyx);
    r7.x = ps;
    ps = rsqrt(abs(r7.y));
    r8.z = dot(r11.zxy, r11.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r9.w));
    r9.xyz = r7.yyy * r3.xzy;
    r7.y = ps;
    ps = UniformVector_2.y * r7.x;
    r7.yzw = r7.yyy * r5.zyx;
    r19.y = ps;
    ps = rsqrt(abs(r8.z));
    r8.x = max(r7.y, 0.0);
    r7.x = ps;
    ps = rsqrt(abs(r8.y));
    r11.xyz = r11.xzy * r7.xxx;
    r7.x = ps;
    ps = r9.x;
    r5.yzw = r12.xzy * r7.xxx;
    r3.w = r7.y * 2.0 - r7.y;
    ps = -r7.w * ps;
    r12.xyz = r5.wyz * r3.www;
    r5.x = ps;
    ps = 1.0 - r8.w;
    r3.xyz = r5.zwy * r11.zyx;
    r19.z = ps;
    r3.xyz = r5.yzw * r11.yxz - r3.xyz;
    ps = 1.0 - r8.x;
    r13.xyz = r3.xyz * r12.www;
    r19.w = ps;
    ps = r9.z;
    r8.yz = r19.yx - 0.5;
    ps = -r7.z * ps;
    r3.xyz = float3((r19.xyz >= float3(0.5, 0.5, 0.004)));
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r13.zxy, r13.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r7.x));
    r8.yz = r8.yz - r19.yx;
    r7.x = ps;
    r5.zw = r8.yz * r3.yx + r19.yx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.xyz = r13.xyz * r7.xxx;
    r8.y = ps;
    r7.xyz = r13.xzy * -r7.zzz + r12.xzy;
    ps = r5.x + r5.y;
    r8.xy = r8.xy * abs(r10.xy);
    r16.x = ps;
    r7.xyw = r11.yzx * -r7.www + r7.yzx;
    ps = r5.z + r5.z;
    r10.xyz = r7.xxx * LocalToWorldMatrix[2].xzy;
    r16.y = ps;
    r7.xyz = r7.yyy * LocalToWorldMatrix[1].xzy + r10.xyz;
    r7.xyz = r7.www * LocalToWorldMatrix[0].xyz + r7.xzy;
    ps = r5.w + r5.w;
    r7 = xe_cube(r7.xyz);
    r16.z = ps;
    ps = 1.0 / abs(r7.z);
    r5.z = r7.w;
    r8.z = ps;
    r5.xy = r7.yx * r8.zz + 1.5;
    r14.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyz)).xyz;
    r5.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r10 = tex2D(Texture2D_2, r16.zy);
    r11.zw = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r2.xyz = tex2D(Texture2D_0, r2.xy).xyz;
    r1 = tex2D(Texture2D_1, r1.xy);
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r6.zxy, r6.zxy);
    ps = 1.0 - r1.w;
    r8.xyz = -UniformVector_0.zxy + 1.0;
    r8.w = ps;
    ps = AmbientColorAndSkyFactor.x * r8.y;
    r17.xyz = r2.xyz * 6.0;
    r11.x = ps;
    ps = 0.5 * r7.y;
    r0.xyz = r0.xyz * LightMapScale.xyz;
    r2.x = ps;
    ps = 0.5 * r7.z;
    r12.xyz = r1.xyz * 2e+01;
    r2.y = ps;
    ps = 0.5 * r7.w;
    r15.xyz = r8.www * UniformVector_1.xyz;
    r2.z = ps;
    ps = rsqrt(abs(r7.x));
    r2.xyz = r2.xyz * r1.www;
    r11.y = ps;
    ps = AmbientColorAndSkyFactor.y * r8.z;
    r18 = r11.yyzw * float4(-0.5, 0.5, 0.875, 0.875);
    r11.y = ps;
    r7.xyz = r1.www * UniformScalar_0.xxx + r15.xzy;
    r1.xyz = r2.xyz * UniformScalar_1.xxx + r7.xzy;
    ps = 0.1 - -r9.y;
    r7.yz = r18.xy * r6.zz;
    r7.x = ps;
    ps = 5.0 * r7.x;
    r7.w = dot(r3.xyy, float3(1.0, 1.0, 1.0));
    r6.x = saturate(ps);
    r8.w = (r7.w == 0.0) ? r10.x : r10.y;
    ps = log2(abs(r19.w));
    r7 = r7.yzww + float4(0.5, 0.5, -3.0, -2.0);
    r9.x = ps;
    ps = abs(r7.x) * abs(r7.x);
    r2.xyz = r2.xyz + r12.xyz;
    r0.w = ps;
    r9.w = (r7.w == 0.0) ? r10.z : r8.w;
    r8.w = saturate(r9.y * r3.w + r16.x);
    r6.y = (r7.z == 0.0) ? r10.w : r9.w;
    ps = log2(r8.w);
    r9.yz = -r6.yx + 1.0;
    r9.w = ps;
    ps = ModShadowGroupColor.x * r9.z;
    r6.xyz = r2.xyz - r5.xyz;
    r7.z = ps;
    ps = ModShadowGroupColor.y * r9.z;
    r2.xyz = r9.wxy * float3(15.0, 0.0125, 2.5);
    r7.w = ps;
    ps = pow(2.0, r2.x);
    r8.w = saturate(r2.z - 0.5);
    r9.x = ps;
    r10.xyz = r6.xyz * r8.www + r5.xyz;
    ps = pow(2.0, r2.y);
    r9.xyz = r0.xyz * r9.xxx;
    r7.x = ps;
    ps = abs(r7.y) * abs(r7.y);
    r2.xyz = r9.xzy * r8.www;
    r7.y = ps;
    ps = 1.0 - r7.x;
    r9.xyz = r10.xyz * r8.yzx;
    r16.x = ps;
    ps = 1.0 - r7.z;
    r5.xyz = r9.xzy * r0.www;
    r16.y = ps;
    ps = 1.0 - r7.w;
    r6.xyz = r9.xzy * r7.yyy;
    r16.z = ps;
    r7.xy = r18.zw * r16.yz + 0.125;
    r14.xyz = r17.xzy * r16.xxx + r14.xzy;
    r12.xyz = r15.xyz * r14.xzy + r12.xyz;
    ps = AmbientColorAndSkyFactor.z * r8.x;
    r7.x = r7.x * r7.y;
    r11.z = ps;
    r7.xyz = r7.xxx * r13.xyz + ModShadowColor.xyz;
    r8.xyz = r12.xyz * r8.www + UniformVector_0.xyz;
    r8.xyz = r11.xyz * r10.xyz + r8.xyz;
    r8.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r8.xyz = r5.xzy * LowerSkyColor.xyz + r8.xzy;
    r8.xyz = r2.xyz * r1.xzy + r8.xzy;
    r8.xyz = r0.xyz * r9.xyz + r8.xzy;
    ps = -r4.w;
    r7.xyz = r8.xzy * r7.xzy;
    ps = OpacityOverride.x + ps;
    r8.xyz = r7.xzy - r7.xzy;
    r8.w = ps;
    oC0.w = r8.w * r3.z + r4.w;
    r7.xyz = r8.xyz * r3.zzz + r7.xzy;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
