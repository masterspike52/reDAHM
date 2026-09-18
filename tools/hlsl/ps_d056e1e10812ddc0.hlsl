// ps_d056e1e10812ddc0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10000A00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
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
float4 OpacityOverride : register(c27); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_21 : register(c19); // float
float4 UniformScalar_22 : register(c20); // float
float4 UniformScalar_29 : register(c21); // float
float4 UniformScalar_30 : register(c22); // float
float4 UniformScalar_31 : register(c23); // float
float4 UniformScalar_32 : register(c24); // float
float4 UniformScalar_33 : register(c25); // float
float4 UniformScalar_34 : register(c26); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_10 : register(c14); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UniformVector_8 : register(c12); // float4
float4 UniformVector_9 : register(c13); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
samplerCUBE TextureCube_0 : register(s2);

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
    bool p0 = false;

    r6.xy = r0.yx * UniformVector_1.yx + UniformVector_2.yx;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.z));
    r1.x = ps;
    r9.xy = r1.xx * float2(0.125, 1.0);
    r1.yzw = r9.yxx * r2.zxy;
    r6.zw = r6.yx + r1.zw;
    r6.xy = r0.yx * UniformVector_1.yx + r1.wz;
    r6.xy = r6.xy + 0.5;
    r6.xy = r6.yx * 1.5 + UniformVector_3.xy;
    r7 = tex2D(Texture2D_0, r6.zw);
    r8 = tex2D(Texture2D_1, r6.xy);
    r6 = r4.wxzy * 2.0 - 1.0;
    r0.xyw = r5.yxz * 2.0 - 1.0;
    r5.xzw = r8.yxz * 2.0 + float3(-2.0, -2.0, -3.0);
    ps = r7.w;
    r4.y = dot(r0.wyx, r0.wyx);
    r4.x = ps;
    ps = 1.0 - r4.x;
    r4.z = dot(r6.zyw, r6.zyw);
    r4.x = ps;
    ps = rsqrt(abs(r4.z));
    r8.x = r4.x * r8.w;
    r5.y = ps;
    ps = rsqrt(abs(r4.y));
    r8.yzw = r5.xzw + r7.yxz;
    r4.w = ps;
    r0.z = dot(r9.yy, r2.zz) - r1.y;
    r4.x = max(r1.y, 0.0);
    ps = 1.0 - r4.x;
    r7 = r8 + r7.wyxz;
    r5.x = ps;
    r4.y = saturate(r7.x * 7e+01 - 2e+01);
    r4.z = r4.y * UniformScalar_34.x + UniformScalar_33.x;
    ps = abs(r5.x) * abs(r5.x);
    r5.yzw = r6.wyz * r5.yyy;
    r10.w = ps;
    ps = r0.x;
    r8.z = r7.x - r10.w;
    ps = r4.w * ps;
    r8.xy = UniformVector_4.yx + float2(1.0, -0.65);
    r0.x = ps;
    ps = r5.z;
    r2.xy = r1.xx * r2.yx;
    ps = r0.x * ps;
    r6.yw = r0.yw * r4.ww;
    r10.z = ps;
    ps = r5.w;
    r10.xy = r5.yw * r6.wy;
    ps = r0.x * ps;
    r9.yz = r5.zy * r6.wy;
    r9.x = ps;
    ps = r7.x;
    r1.xyz = r4.yyy * UniformVector_8.zxy;
    r4.x = ps;
    ps = 1.0 - r4.x;
    r10.xyz = r10.xyz - r9.xyz;
    r0.y = ps;
    ps = 1.0 - r4.y;
    r9.xyw = r7.zwy * r4.yyy;
    r4.w = ps;
    ps = UniformVector_6.x * r4.w;
    r7.yzw = r9.ywx + float3(1.0, 0.0, 0.0);
    r7.x = ps;
    ps = UniformVector_6.y * r4.w;
    r4.x = dot(r7.wzy, r7.wzy);
    r7.y = ps;
    ps = rsqrt(abs(r4.x));
    r9.xyz = r10.xyz * r6.xxx;
    r4.x = ps;
    ps = UniformVector_6.z * r4.w;
    r4.x = r4.x * 0.5;
    r7.z = ps;
    r0.w = r4.x * r9.w + 0.5;
    ps = log2(abs(r0.w));
    r10.z = r1.x + r7.z;
    r4.w = ps;
    ps = UniformScalar_18.x * r4.w;
    r6.x = dot(r9.zxy, r9.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r4.xw = abs(r0.wy) * abs(r0.wy);
    r6.x = ps;
    r4.w = r4.w * UniformScalar_21.x + UniformScalar_20.x;
    ps = pow(2.0, r6.z);
    r0.y = r9.y * r6.x;
    r6.z = ps;
    r4.x = r6.z * UniformScalar_19.x + r4.x;
    r4.x = r4.w * UniformScalar_22.x + r4.x;
    ps = (-1.0) - -r4.x;
    r8.w = ps;
    r10.xy = r8.zw * r4.yy;
    r4.xw = r10.zx + r10.yw;
    ps = UniformScalar_17.x * r4.w;
    r0.w = ps;
    r4.y = r8.y + r0.w;
    r4.y = r4.y * 1.0000007 + 0.5;
    ps = frac(r4.y);
    r4.y = ps;
    r4.y = r4.y * 6.2831855 - 3.1415927;
    ps = cos(r4.y);
    r6.xz = r9.xz * r6.xx;
    r4.y = ps;
    ps = 0.5 * r4.y;
    r4.y = ps;
    r4.xy = r4.yx + float2(0.5, 1.0);
    ps = log2(abs(r4.x));
    r4.y = r4.y + UniformVector_4.z;
    r4.x = ps;
    r1.x = (-r4.y > 0.0) ? 0.0 : r4.y;
    ps = 3e+01 * r4.x;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r4.x = r0.w + UniformVector_4.x;
    r4.y = ps;
    r4.y = r4.y * (-0.3) + r8.x;
    r4.xy = r4.xy + r7.xy;
    r4.xy = r4.yx + r1.zy;
    r4.x = min(r4.x, 1.0);
    ps = OpacityOverride.x * r4.z;
    p0 = (0.0 == 0.0 && -r4.x >= 0.0);
    r4.w = (0.0 == 0.0 && -r4.x >= 0.0) ? 0.0 : 0.0 + 1.0;
    r0.w = ps;
    if (p0)
    {
        r1.yz = r1.xx;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        ps = frac(r4.y);
        r4.y = ps;
        ps = 6.0 * r4.y;
        r4.z = ps;
        ps = floor(r4.z);
        r4.y = ps;
        r1.z = r4.z - r4.y;
        ps = 1.0 - r4.x;
        r1.w = -r1.z + 1.0;
        r1.y = ps;
        r1.zw = -r1.zw * r4.xx + 1.0;
        r1.yzw = r1.wyz * r1.xxx;
    }
    p0 = (r4.w == 0.0 && r4.y != 0.0);
    r4.w = (r4.w == 0.0 && r4.y != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r4.x = float((r4.y == 1.0));
    }
    p0 = (r4.w == 0.0 && r4.x != 0.0);
    r4.w = (r4.w == 0.0 && r4.x != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        ps = r1.x;
        r1.y = ps;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r4.x = float((r4.y == 2.0));
    }
    p0 = (r4.w == 0.0 && r4.x != 0.0);
    r4.w = (r4.w == 0.0 && r4.x != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r1.zw = r1.yz;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r4.x = float((r4.y == 3.0));
    }
    p0 = (r4.w == 0.0 && r4.x != 0.0);
    r4.w = (r4.w == 0.0 && r4.x != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r1.xzw = r1.wxz;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r4.x = float((r4.y == 4.0));
    }
    p0 = (r4.w == 0.0 && r4.x != 0.0);
    r4.w = (r4.w == 0.0 && r4.x != 0.0) ? 0.0 : r4.w + 1.0;
    if (p0)
    {
        r1.xw = r1.yx;
    }
    p0 = (r4.w == 1.0);
    ps = p0 ? 0.0 : ((r4.w == 0.0) ? 1.0 : r4.w);
    r4.w = ps;
    if (p0)
    {
        r1.xw = r1.xw;
    }
    p0 = (r4.w - 1.0 <= 0.0);
    ps = p0 ? 0.0 : (r4.w - 1.0);
    r4.w = ps;
    if (p0)
    {
        r1.xzw = r1.zwx;
    }
    p0 = (r4.w - 1.0 <= 0.0);
    ps = p0 ? 0.0 : (r4.w - 1.0);
    r4.w = ps;
    p0 = (r4.w - 1.0 <= 0.0);
    ps = p0 ? 0.0 : (r4.w - 1.0);
    r4.w = ps;
    if (p0)
    {
        ps = r1.x;
        r1.y = ps;
    }
    p0 = (r4.w - 1.0 <= 0.0);
    ps = p0 ? 0.0 : (r4.w - 1.0);
    r4.w = ps;
    if (p0)
    {
        ps = r1.w;
        r1.x = ps;
    }
    r4.y = dot(r0.xy, -r2.yx) + 0.0;
    ps = log2(abs(r5.x));
    r6 = r6.wzxy * -r2.yxxy;
    r5.x = ps;
    r4.xz = r6.xw + r6.yz;
    r4.xyw = r5.wyz * r0.zzz + r4.xyz;
    r5.yzw = r4.xxx * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r5.yzw;
    r5.yzw = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r5.ywz);
    ps = 1.0 / abs(r4.z);
    r6.z = r4.w;
    r6.x = ps;
    r6.xy = r4.yx * r6.xx + 1.5;
    r6.yzw = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    ps = 1.5 * r5.x;
    r4.z = dot(UniformVector_10.zxy, UniformVector_10.zxy);
    r4.x = ps;
    ps = rsqrt(abs(r4.z));
    r4.y = dot(r6.wyz, float3(0.11, 0.3, 0.59));
    r4.w = ps;
    ps = UniformVector_10.x * r4.w;
    r0.xyz = r4.yyy - r6.yzw;
    r6.x = ps;
    r6.yzw = saturate(r0.xyz * UniformScalar_29.xxx + r6.yzw);
    r0.xyz = -r6.yzw * 2.0 + 3.0;
    ps = UniformVector_10.y * r4.w;
    r2.xyz = r6.yzw * r6.yzw;
    r6.y = ps;
    ps = UniformVector_10.z * r4.w;
    r2.xyz = r2.xyz * UniformScalar_30.xxx;
    r6.z = ps;
    ps = pow(2.0, r4.x);
    r4.yzw = r2.xyz * r0.xyz;
    r4.x = ps;
    r4.xzw = r4.yzw * r4.xxx + r1.xyz;
    r4.y = saturate(dot(r6.zxy, r5.zyw));
    ps = log2(r4.y);
    r4.y = ps;
    ps = UniformScalar_32.x * r4.y;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r5.xyz = UniformVector_9.xyz * UniformScalar_31.xxx;
    r4.y = ps;
    r4.xyz = r5.xyz * r4.yyy + r4.xzw;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    r4.xyz = r4.xyz * r3.www + r3.xyz;
    r0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0 = r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
