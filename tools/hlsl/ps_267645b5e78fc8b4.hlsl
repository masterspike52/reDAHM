// ps_267645b5e78fc8b4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 279 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000045C 10000A00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w;
    r6.x = -r0.z + 1.0;
    ps = UniformVector_4.x * ps;
    r1.x = r6.x * UniformVector_4.y;
    r1.y = ps;
    r6.xz = r1.yx - 0.5;
    r6.yw = float2((r1.xy >= 0.5));
    ps = r0.w + r0.w;
    r1.zw = r6.xz - r1.yx;
    r6.x = ps;
    r1.xy = r1.zw * r6.wy + r1.yx;
    ps = r0.z + r0.z;
    r1.xy = r1.xy + r1.xy;
    r6.z = ps;
    r6.z = tex2D(Texture2D_0, r6.xz).w;
    r1 = tex2D(Texture2D_1, r1.xy);
    r6.x = dot(r2.zxy, r2.zxy);
    r8.xyz = r5.xyz * 2.0 - 1.0;
    r4 = r4.wyxz * 2.0 - 1.0;
    r5.x = dot(r4.wzy, r4.wzy);
    ps = rsqrt(abs(r6.x));
    r5.y = dot(r8.zxy, r8.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r7.yzw = r5.zzz * r2.zxy;
    r5.y = ps;
    r6.x = r7.y * 2.0 - r7.y;
    ps = rsqrt(abs(r5.x));
    r9.xyz = r8.xzy * r5.yyy;
    r5.x = ps;
    r8.xyz = r4.ywz * r5.xxx;
    r5.xyz = r8.yzx * r9.zyx;
    r6.y = dot(r6.wyy, float3(1.0, 1.0, 1.0));
    r4.y = (r6.y == 0.0) ? r1.x : r1.y;
    r5.xyz = r8.xzy * r9.yzx - r5.xzy;
    r6.yzw = r6.yyz + float3(-3.0, -2.0, -1.0);
    r5.xyw = r5.xzy * r4.xxx;
    r4.x = dot(r5.wxy, r5.wxy);
    r4.y = (r6.z == 0.0) ? r1.z : r4.y;
    r5.z = (r6.y == 0.0) ? r1.w : r4.y;
    r4.y = max(r5.z, 0.0);
    ps = rsqrt(abs(r4.x));
    r4.y = min(r4.y, 0.3);
    r4.x = ps;
    ps = 3.3333333 * r4.y;
    r10.xyz = r5.xwy * r4.xxx;
    r8.w = ps;
    r1 = r8.zxyw * r6.xxxw;
    r4.xyz = r10.xyz * -r7.www + r1.xzy;
    r4.xyw = r9.zyx * -r7.zzz + r4.zyx;
    r5.xyw = r4.yyy * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.xxx * LocalToWorldMatrix[1].xyz + r5.xyw;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r5.w = r4.w;
    r5.x = ps;
    r5.xy = r4.yx * r5.xx + 1.5;
    r0 = tex2D(Texture2D_2, r0.xy);
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r5.xyw)).xyz;
    r4.w = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    ps = rsqrt(abs(r4.w));
    r6.y = saturate(UniformScalar_6.x);
    r4.w = ps;
    ps = UniformVector_2.x * r4.w;
    r5.x = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = UniformVector_2.y * r4.w;
    r5.xyw = r5.xxx - r4.xyz;
    r6.z = ps;
    r4.xyz = r5.xyw * UniformScalar_2.xxx + r4.xyz;
    r2.yzw = r4.xyz * UniformScalar_3.xxx - UniformScalar_5.xxx;
    ps = UniformVector_2.z * r4.w;
    r4.xyz = r8.yyy * LocalToWorldMatrix[2].xyz;
    r6.w = ps;
    r4.xyz = r8.xxx * LocalToWorldMatrix[1].xyz + r4.xyz;
    r4.xzw = r8.zzz * LocalToWorldMatrix[0].xzy + r4.xzy;
    ps = r4.x + r4.x;
    r4.y = dot(r6.wxz, r4.zxw);
    r5.y = ps;
    ps = r5.y;
    r5.x = max(r7.y, 0.0);
    ps = r4.y * ps;
    r4.xw = r4.yy * r4.wz;
    r7.x = ps;
    ps = r4.x + r4.x;
    r8.xyz = r8.zxy * r7.yyy;
    r7.y = ps;
    r8.xyz = r10.xyz * r7.www + r8.xzy;
    r1.xyz = r9.xzy * r7.zzz + r8.xzy;
    ps = r4.w + r4.w;
    r4.xyz = r1.zzz * LocalToWorldMatrix[2].xzy;
    r7.z = ps;
    r4.yzw = r1.yyy * LocalToWorldMatrix[1].xzy + r4.xyz;
    ps = r1.w;
    r6.xzw = r7.xyz - r6.xzw;
    r4.x = ps;
    r4.yzw = r1.xxx * LocalToWorldMatrix[0].xyz + r4.ywz;
    ps = 1.0 + r4.x;
    r4.y = saturate(dot(r6.wxz, r4.wyz));
    r5.y = ps;
    ps = log2(r4.y);
    r4.xzw = -r5.zxy + 1.0;
    r4.y = ps;
    ps = 0.3 * r4.w;
    r1.xyz = UniformVector_1.xyz * UniformScalar_0.xxx;
    r5.w = ps;
    ps = UniformScalar_1.x * r4.y;
    r7.yzw = r0.xyz - 1.0;
    r6.z = ps;
    ps = log2(abs(r4.z));
    r6.x = r5.y * r4.x;
    r4.y = ps;
    ps = pow(2.0, r6.z);
    r7.x = -r5.w + 1.0;
    r6.z = ps;
    r0.xyz = r7.yzw * r0.www + 1.0;
    r1.w = r7.x * r0.w + r5.w;
    ps = UniformScalar_7.x * r4.y;
    r4.xz = float2((r6.yx >= float2(1.0, 0.8)));
    r4.w = ps;
    r5.w = r1.w * UniformScalar_9.x + UniformScalar_8.x;
    r5.w = (r4.x > 0.0) ? r5.w : UniformScalar_8.x;
    ps = pow(2.0, r4.w);
    r6 = r1 * r6.zzzy;
    r4.w = ps;
    ps = UniformScalar_4.x * r4.y;
    r4.w = r6.x + r4.w;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r2.x = -r4.w + 1.0;
    r4.y = ps;
    r1.xyz = r2.yzw * r4.yyy + UniformScalar_5.xxx;
    r4.y = r2.x * r5.w + r4.w;
    r1.xyz = r1.xyz + r6.xyz;
    r1.xyz = r1.xyz * UniformVector_3.xyz - 0.2;
    r5.yzw = r1.xyz * r5.yyy + 0.2;
    ps = OpacityOverride.x * r4.z;
    r6.xyz = r0.xyz - r5.yzw;
    r5.x = ps;
    r4.xzw = r6.www * r6.xyz + r5.yzw;
    ps = r5.x;
    r4.xzw = r4.xzw + UniformVector_0.xyz;
    r4.xzw = r4.xzw * r3.www + r3.xyz;
    ps = r4.y * ps;
    oC0.xyz = r4.xzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
