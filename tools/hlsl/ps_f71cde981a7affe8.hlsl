// ps_f71cde981a7affe8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10000F00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w;
    r6.x = -r0.z + 1.0;
    ps = UniformVector_3.x * ps;
    r6.x = r6.x * UniformVector_3.y;
    r6.y = ps;
    r6.zw = r6.yx - 0.5;
    r1.yz = float2((r6.xy >= 0.5));
    ps = r0.w + r0.w;
    r6.zw = r6.zw - r6.yx;
    r1.x = ps;
    r6.xy = r6.zw * r1.zy + r6.yx;
    ps = r0.z + r0.z;
    r6.xy = r6.xy + r6.xy;
    r1.w = ps;
    r8 = tex2D(Texture2D_0, r6.xy);
    r6 = tex2D(Texture2D_2, r0.xy).yzxw;
    r0.xyz = tex2D(Texture2D_1, r1.xw).wxy;
    r7.xyz = UniformVector_1.xyz * UniformScalar_0.xxx;
    r0.w = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r1.w = dot(r2.zxy, r2.zxy);
    r10.xyz = r5.xyz * 2.0 - 1.0;
    r4 = r4.yxwz * 2.0 - 1.0;
    r5.xy = r0.yz * 2.0 - 1.0;
    ps = UniformScalar_6.x;
    r5.z = dot(r4.wyx, r4.wyx);
    r1.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r5.w = dot(r10.zxy, r10.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r9.xyz = r1.www * r2.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r10.xyz = r10.xzy * r5.www;
    r5.z = ps;
    ps = (-1.0) + r0.x;
    r12.xyz = r4.xwy * r5.zzz;
    r5.z = ps;
    ps = r12.z;
    r0.y = dot(r1.zyy, float3(1.0, 1.0, 1.0));
    ps = r9.z * ps;
    r1.yzw = r12.yzx * r10.zyx;
    r0.x = ps;
    r1.yzw = r12.xzy * r10.yzx - r1.ywz;
    r5.w = (r0.y == 0.0) ? r8.x : r8.y;
    ps = r12.x;
    r4.xy = r0.yy + float2(-2.0, -3.0);
    r4.x = (r4.x == 0.0) ? r8.z : r5.w;
    ps = r9.z * ps;
    r1.yzw = r1.ywz * r4.zzz;
    r0.y = ps;
    ps = r12.y;
    r4.z = dot(r1.wyz, r1.wyz);
    r4.y = (r4.y == 0.0) ? r8.w : r4.x;
    ps = r9.z * ps;
    r4.x = max(r4.y, 0.0);
    r0.z = ps;
    ps = rsqrt(abs(r4.z));
    r4.x = min(r4.x, 0.3);
    r4.z = ps;
    ps = 3.3333333 * r4.x;
    r11.xyz = r1.ywz * r4.zzz;
    r4.x = ps;
    r0.xyz = r11.xzy * r9.yyy + r0.xyz;
    r0.xyz = r10.xyz * r9.xxx + r0.xzy;
    ps = r6.z;
    r1.yzw = r4.xxx * r5.xyz;
    r4.x = ps;
    r9.w = dot(r9.xy, r1.yz) + 0.0;
    ps = 1.0 - r4.y;
    r5.xyw = r0.yyy * LocalToWorldMatrix[2].xzy;
    r5.z = ps;
    ps = rsqrt(abs(r0.w));
    r2.xyz = r1.wyz + float3(1.0, 0.0, 0.0);
    r4.y = ps;
    r4.z = dot(r2.zy, r1.zy) + 1.0;
    r5.xyw = r0.zzz * LocalToWorldMatrix[1].xzy + r5.xyw;
    r0.xyz = r0.xxx * LocalToWorldMatrix[0].xyz + r5.xwy;
    ps = rsqrt(abs(r4.z));
    r5.xw = r9.wz + r9.zz;
    r5.y = ps;
    ps = r5.x;
    r13.xyz = r4.yyy * UniformVector_2.xyz;
    r4.y = ps;
    ps = 0.0;
    r8.xzw = r12.zxy * r5.yyy;
    r4.z = ps;
    ps = max(r4.y, r4.z);
    r1.yzw = r2.xyz * r5.zyy;
    r2.w = ps;
    ps = (-1.0) + r4.x;
    r4.yz = -r2.xw + 1.0;
    r8.y = ps;
    r14.xyz = r11.xzy * r1.www + r8.xzw;
    ps = (-1.0) + r6.x;
    r5.xy = float2((r1.xy >= float2(1.0, 0.8)));
    r8.z = ps;
    r14.xyw = r10.yzx * r1.zzz + r14.zyx;
    ps = (-1.0) + r6.y;
    r4.x = r4.y * 0.3;
    r8.w = ps;
    ps = 1.0 - r4.x;
    r15.xyz = r14.xxx * LocalToWorldMatrix[2].xzy;
    r8.x = ps;
    r14.xyz = r14.yyy * LocalToWorldMatrix[1].xzy + r15.xyz;
    r5.z = r8.x * r6.w + r4.x;
    r14.xyz = r14.www * LocalToWorldMatrix[0].xyz + r14.xzy;
    r4.x = dot(r13.zxy, r14.zxy);
    r4.w = r5.z * UniformScalar_9.x + UniformScalar_8.x;
    r4.y = (r5.x > 0.0) ? r4.w : UniformScalar_8.x;
    r14.xyz = r4.xxx * r14.xyz;
    r13.xyz = r14.xyz * 2.0 - r13.xyz;
    r4.w = saturate(dot(r13.zxy, r0.zxy));
    ps = log2(r4.w);
    r4.x = r5.w - r9.z;
    r4.w = ps;
    ps = log2(abs(r4.z));
    r5.w = r4.w * UniformScalar_1.x;
    r4.z = ps;
    ps = pow(2.0, r5.w);
    r4.w = r4.z * UniformScalar_7.x;
    r5.w = ps;
    ps = pow(2.0, r4.w);
    r7.xyz = r7.xyz * r5.www;
    r4.w = ps;
    r5.x = r7.x + r4.w;
    ps = 1.0 - r5.x;
    r5.w = r4.z * UniformScalar_4.x;
    r12.w = ps;
    r0 = r12.zxyw * r4.xxxy;
    r4.xyz = r11.xyz * -r9.yyy + r0.xzy;
    r4.xyw = r10.zyx * -r9.xxx + r4.zyx;
    r9.xyz = r4.yyy * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.xxx * LocalToWorldMatrix[1].xyz + r9.xyz;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r9.z = r4.w;
    r7.w = ps;
    r9.xy = r4.yx * r7.ww + 1.5;
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r9.xyz)).xyz;
    r4.w = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r9.xyz = r4.www - r4.xyz;
    r4.xyz = r9.xyz * UniformScalar_2.xxx + r4.xyz;
    r4.yzw = r4.xyz * UniformScalar_3.xxx - UniformScalar_5.xxx;
    ps = pow(2.0, r5.w);
    r5.y = r5.y * OpacityOverride.x;
    r4.x = ps;
    r6.xyz = r8.yzw * r6.www + 1.0;
    r4.xyz = r4.yzw * r4.xxx + UniformScalar_5.xxx;
    ps = r5.z;
    r4.xyz = r4.xyz + r7.xyz;
    r4.xyz = r4.xyz * UniformVector_4.xyz - 0.2;
    r4.xyz = r4.xyz * r2.xxx + 0.2;
    ps = r1.x * ps;
    r6.xyz = r6.xyz - r4.xyz;
    r4.w = ps;
    r4.yzw = r4.www * r6.xyz + r4.xyz;
    r4.x = r5.x + r0.w;
    ps = r5.y;
    r4.yzw = r4.yzw + UniformVector_0.xyz;
    r4.yzw = r4.yzw * r3.www + r3.xyz;
    ps = r4.x * ps;
    oC0.xyz = r4.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
