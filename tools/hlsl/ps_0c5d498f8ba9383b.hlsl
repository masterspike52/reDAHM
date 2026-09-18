// ps_0c5d498f8ba9383b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10000800 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A1 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r3 = In.color0;
    float4 r4 = In.color1;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * UniformVector_3.xy;
    r0.w = tex2D(Texture2D_1, r0.xy).w;
    r5.x = tex2D(Texture2D_0, r5.xy).w;
    r1 = r3 * 2.0 - 1.0;
    r6.xyz = r4.xyz * 2.0 - 1.0;
    ps = UniformScalar_13.x;
    r3.y = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    ps = 4.0 * ps;
    r3.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r3.x));
    r4.y = r5.x * UniformScalar_4.x;
    r3.x = ps;
    ps = rsqrt(abs(r3.y));
    r4.z = dot(r6.zxy, r6.zxy);
    r3.w = ps;
    ps = UniformVector_2.x * r3.w;
    r3.y = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = UniformVector_2.y * r3.w;
    r2.xyz = r3.xxx * r2.zxy;
    r0.y = ps;
    ps = rsqrt(abs(r3.y));
    r3.x = max(r2.x, 0.0);
    r3.y = ps;
    ps = UniformVector_2.z * r3.w;
    r7.xyz = r1.xyz * r3.yyy;
    r0.z = ps;
    ps = 1.0 - r3.x;
    r3.yzw = r7.zzz * LocalToWorldMatrix[2].xyz;
    r3.x = ps;
    r8.xyz = r7.yyy * LocalToWorldMatrix[1].xyz + r3.yzw;
    ps = abs(r3.x) * abs(r3.x);
    r5.xyw = r7.xyz * r2.xxx;
    r3.y = ps;
    r1.xyz = r7.xxx * LocalToWorldMatrix[0].xzy + r8.xzy;
    ps = r3.y * r3.y;
    r4.x = dot(r0.zxy, r1.yxz);
    r3.z = ps;
    ps = rsqrt(abs(r4.z));
    r3.yz = r3.yz * abs(r3.xx);
    r3.x = ps;
    r5.z = r3.z * UniformScalar_12.x + UniformScalar_11.x;
    r6 = r6.xzyw * r3.xxxy;
    r3.x = max(r6.w, (-255.0));
    r3.yzw = r7.zxy * r6.zyx;
    r3.x = min(r3.x, 255.0);
    r3.yzw = r7.yxz * r6.yzx - r3.ywz;
    ps = log2(abs(r0.w));
    r7.xyz = r3.ywz * r1.www;
    r3.y = ps;
    r3.xy = r3.xy * float2(0.003921569, 0.3);
    ps = pow(2.0, r3.y);
    r3.z = dot(r7.zxy, r7.zxy);
    r3.w = ps;
    ps = rsqrt(abs(r3.z));
    r3.y = -r4.y + r3.w;
    r3.z = ps;
    ps = UniformScalar_5.x * r3.y;
    r7.xyz = r7.xzy * r3.zzz;
    r4.z = ps;
    r5.xyw = r7.xzy * r2.zzz + r5.xyw;
    r3.yzw = r6.xyz * r2.yyy + r5.xwy;
    r4.xy = r4.xy + r4.xz;
    r5.xyw = r3.zzz * LocalToWorldMatrix[2].xzy;
    r0.xyz = r4.xxx * r1.xzy - r0.xyz;
    r5.xyw = r3.www * LocalToWorldMatrix[1].xzy + r5.xyw;
    r5.xyw = r3.yyy * LocalToWorldMatrix[0].xyz + r5.xwy;
    r3.w = saturate(dot(r0.zxy, r5.wxy));
    ps = log2(r3.w);
    r3.z = min(r3.x, 0.0);
    r3.y = ps;
    ps = UniformScalar_0.x * r3.y;
    r3.w = ps;
    ps = pow(2.0, r3.w);
    r5.x = -r4.y + 1.0;
    r3.y = ps;
    ps = UniformScalar_1.x * r3.y;
    r5.y = ps;
    r3.yw = r5.yx * r5.xz;
    r3.w = r4.y + r3.w;
    r3.y = r3.y * UniformScalar_6.x + r3.w;
    ps = (-0.003921569) - -r3.y;
    r3.w = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.wwww)) clip(-1.0);
    oC0.zw = abs(r3.zz);
    oC0.xy = max(r3.xx, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
