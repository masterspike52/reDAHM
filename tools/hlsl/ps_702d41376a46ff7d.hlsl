// ps_702d41376a46ff7d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 303 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004BC 10000D00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c21); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_2 : register(c13); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformScalar_6 : register(c17); // float
float4 UniformScalar_7 : register(c18); // float
float4 UniformScalar_8 : register(c19); // float
float4 UniformScalar_9 : register(c20); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color1 : COLOR1; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color1;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.wz * 6.0;
    r8.y = tex2D(Texture2D_0, r6.xy).w;
    r13.y = tex2D(Texture2D_0, r0.wz).w;
    r13.x = 1.0;
    ps = r0.w;
    r6.w = -r0.z + 1.0;
    r6.xyz = r5.xyz * 2.0 - 1.0;
    ps = UniformVector_4.x * ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r1.y = ps;
    r4 = r4.yxzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r4.zyx, r4.zyx);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.z = dot(r6.zxy, r6.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r1.x = r6.w * UniformVector_4.y;
    r5.z = ps;
    ps = r6.x;
    r2.xyz = r5.yyy * r2.xyz;
    ps = r5.z * ps;
    r5.xyw = r4.xyz * r5.xxx;
    r7.x = ps;
    ps = r6.z;
    r13.zw = float2((r1.xy >= 0.5));
    r6.x = r2.z * 2.0 - r2.z;
    ps = r5.z * ps;
    r1.zw = r1.yx - 0.5;
    r7.z = ps;
    ps = r6.y;
    r8.zw = r1.zw - r1.yx;
    ps = r5.z * ps;
    r4.xyz = r5.yxw * r6.xxx;
    r7.w = ps;
    r6.xyz = r5.wyx * r7.wzx;
    r6.xyz = r5.xyw * r7.zwx - r6.xzy;
    r1.xy = r8.zw * r13.wz + r1.yx;
    r6.xyz = r6.xzy * r4.www;
    r4.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r4.w));
    r1.xy = r1.xy + r1.xy;
    r4.w = ps;
    r11.xyz = r6.xzy * r4.www;
    r4.xyz = r11.xyz * -r2.yyy + r4.xzy;
    r4.xyw = r7.wzx * -r2.xxx + r4.zyx;
    r6.xyz = r4.yyy * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.xxx * LocalToWorldMatrix[1].xyz + r6.xyz;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r6.z = r4.w;
    r5.z = ps;
    r6.xy = r4.yx * r5.zz + 1.5;
    r0 = tex2D(Texture2D_2, r0.xy);
    r12 = tex2D(Texture2D_1, r1.xy);
    r9.yzw = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    r6.xyz = UniformVector_1.xyz * UniformScalar_0.xxx;
    r4.x = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    ps = rsqrt(abs(r4.x));
    r4.z = dot(r9.wyz, float3(0.11, 0.3, 0.59));
    r4.x = ps;
    ps = UniformScalar_6.x;
    r4.xyw = r4.xxx * UniformVector_2.xyz;
    r7.y = saturate(ps);
    ps = r2.z;
    r10.xyz = r4.zzz - r9.yzw;
    r8.x = ps;
    ps = LocalToWorldMatrix[2].x * r5.w;
    r4.z = dot(r13.wzz, float3(1.0, 1.0, 1.0));
    r1.y = ps;
    ps = LocalToWorldMatrix[2].y * r5.w;
    r6.w = dot(float4(1.0, 1.0, 1.0, -3.0), r13.wzzx);
    r1.z = ps;
    r5.z = (r4.z == 0.0) ? r12.x : r12.y;
    ps = LocalToWorldMatrix[2].z * r5.w;
    r1.x = dot(float4(1.0, 1.0, 1.0, -2.0), r13.wzzx);
    r1.w = ps;
    r1.yzw = r5.xxx * LocalToWorldMatrix[1].xyz + r1.yzw;
    r4.z = r8.y * r13.y - 1.0;
    r1.yzw = r5.yyy * LocalToWorldMatrix[0].zxy + r1.wyz;
    r5.z = (r1.x == 0.0) ? r12.z : r5.z;
    r1.x = (r6.w == 0.0) ? r12.w : r5.z;
    ps = 0.0;
    r6.w = dot(r4.wxy, r1.yzw);
    r8.y = ps;
    ps = max(r8.x, r8.y);
    r2.w = r1.z + r1.z;
    r1.z = ps;
    ps = r2.w;
    r5.xyz = r5.yxw * r2.zzz;
    ps = r6.w * ps;
    r1.yw = r6.ww * r1.wy;
    r8.x = ps;
    ps = r1.y + r1.y;
    r5.w = max(r1.x, 0.0);
    r8.y = ps;
    ps = r1.w + r1.w;
    r10.w = min(r5.w, 0.3);
    r8.z = ps;
    r5.xyz = r11.xyz * r2.yyy + r5.xzy;
    r2.xyw = r7.wzx * r2.xxx + r5.zyx;
    ps = r8.x;
    r5 = r10 * float4(0.8, 0.8, 0.8, 3.3333333);
    r1.y = r5.w * r4.z + 1.0;
    ps = -r4.x + ps;
    r7.xzw = r2.yyy * LocalToWorldMatrix[2].xzy;
    r9.x = ps;
    ps = r8.y;
    r5.yzw = r5.xyz + r9.yzw;
    r7.xzw = r2.xxx * LocalToWorldMatrix[1].xzy + r7.xzw;
    ps = -r4.y + ps;
    r4.z = dot(r5.wyz, float3(0.11, 0.3, 0.59));
    r9.y = ps;
    ps = r8.z;
    r2.xyz = -r5.yzw + r4.zzz;
    r8.xyz = r2.www * LocalToWorldMatrix[0].xyz + r7.xwz;
    ps = -r4.w + ps;
    r4.xyz = -r1.yzx + 1.0;
    r9.z = ps;
    ps = 0.3 * r4.x;
    r7.x = r1.y * r4.z;
    r5.x = ps;
    ps = log2(abs(r4.y));
    r4.w = saturate(dot(r9.zxy, r8.zxy));
    r4.z = ps;
    r5.yzw = r2.xyz * UniformScalar_2.xxx + r5.yzw;
    r2.yzw = r5.yzw * UniformScalar_3.xxx - UniformScalar_5.xxx;
    ps = log2(r4.w);
    r8.x = -r5.x + 1.0;
    r4.y = ps;
    ps = UniformScalar_1.x * r4.y;
    r8.yzw = r0.xyz - 1.0;
    r4.x = ps;
    r0.xyz = r8.yzw * r0.www + 1.0;
    ps = pow(2.0, r4.x);
    r4.w = r4.z * UniformScalar_7.x;
    r7.z = ps;
    r6.w = r8.x * r0.w + r5.x;
    r5.x = r6.w * UniformScalar_9.x + UniformScalar_8.x;
    r6 = r6 * r7.zzzy;
    ps = pow(2.0, r4.w);
    r4.xy = float2((r7.yx >= float2(1.0, 0.8)));
    r4.w = ps;
    r5.w = (r4.x > 0.0) ? r5.x : UniformScalar_8.x;
    ps = UniformScalar_4.x * r4.z;
    r4.w = r6.x + r4.w;
    r4.z = ps;
    ps = pow(2.0, r4.z);
    r2.x = -r4.w + 1.0;
    r4.z = ps;
    r5.xyz = r2.yzw * r4.zzz + UniformScalar_5.xxx;
    r4.z = r2.x * r5.w + r4.w;
    r5.xyz = r5.xyz + r6.xyz;
    r5.xyz = r5.xyz * UniformVector_3.xyz - 0.2;
    r5.yzw = r5.xyz * r1.yyy + 0.2;
    ps = OpacityOverride.x * r4.y;
    r6.xyz = r0.xyz - r5.yzw;
    r5.x = ps;
    r4.xyw = r6.www * r6.xyz + r5.yzw;
    ps = r5.x;
    r4.xyw = r4.xyw + UniformVector_0.xyz;
    r4.xyw = r4.xyw * r3.www + r3.xyz;
    ps = r4.z * ps;
    oC0.xyz = r4.xyw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
