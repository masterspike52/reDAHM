// ps_2bdabe53517e3487.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10000E00 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c31); // float
float4 UniformScalar_0 : register(c17); // float
float4 UniformScalar_1 : register(c18); // float
float4 UniformScalar_13 : register(c19); // float
float4 UniformScalar_14 : register(c20); // float
float4 UniformScalar_15 : register(c21); // float
float4 UniformScalar_16 : register(c22); // float
float4 UniformScalar_17 : register(c23); // float
float4 UniformScalar_18 : register(c24); // float
float4 UniformScalar_19 : register(c25); // float
float4 UniformScalar_20 : register(c26); // float
float4 UniformScalar_21 : register(c27); // float
float4 UniformScalar_22 : register(c28); // float
float4 UniformScalar_23 : register(c29); // float
float4 UniformScalar_24 : register(c30); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_10 : register(c12); // float4
float4 UniformVector_11 : register(c13); // float4
float4 UniformVector_12 : register(c14); // float4
float4 UniformVector_13 : register(c15); // float4
float4 UniformVector_14 : register(c16); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UniformVector_9 : register(c11); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
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
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5 = r0.yxxy + float4(-0.5, -0.5, -1.0, -1.0);
    ps = r0.x + r0.x;
    r6.xz = r5.yx * UniformVector_5.xy;
    r1.w = ps;
    ps = r5.y;
    r2.xz = r5.yx * UniformVector_7.xy;
    r4.y = ps;
    ps = UniformVector_6.x * r4.y;
    r2.yw = r5.yx * UniformVector_8.xy;
    r6.y = ps;
    ps = UniformVector_6.y * r5.x;
    r4 = r2.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r6.w = ps;
    ps = r0.y + r0.y;
    r7 = r6.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r1.y = ps;
    ps = r5.z;
    r6 = r7.zwxy + r6.zwxy;
    ps = r0.x + ps;
    r2 = r4.zwxy + r2.zwxy;
    r1.x = ps;
    ps = r5.w;
    r4.xy = r2.xy + 0.5;
    ps = r0.y + ps;
    r4.zw = r6.xy + 0.5;
    r1.z = ps;
    r12.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r14.x = tex2D(Texture2D_2, r6.zw).z;
    r10.x = tex2D(Texture2D_3, r2.zw).z;
    r14.y = tex2D(Texture2D_2, r4.zw).z;
    r10.y = tex2D(Texture2D_3, r4.xy).z;
    r5.x = tex2D(Texture2D_9, r1.xz).y;
    r5.y = tex2D(Texture2D_5, r1.xy).y;
    r5.z = tex2D(Texture2D_7, r1.wy).y;
    r4.xyz = tex2D(Texture2D_0, r0.xy).zxy;
    r13.zw = tex2D(Texture2D_4, r1.xy).xz;
    r10.zw = tex2D(Texture2D_8, r1.xz).xz;
    r13.xy = tex2D(Texture2D_6, r1.wy).xz;
    ps = (UniformScalar_21.x >= 0.0) ? 1.0 : 0.0;
    r11.x = float((UniformScalar_21.x > 0.0));
    r0.z = ps;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r11.y = float((UniformScalar_13.x >= 0.5));
    r4.w = ps;
    ps = (UniformScalar_18.x >= 0.0) ? 1.0 : 0.0;
    r5.w = float((UniformScalar_13.x > 0.5));
    r11.z = ps;
    r0.xyw = UniformVector_10.xyz * UniformScalar_14.xxx - UniformVector_9.xyz;
    r2.xyz = UniformVector_14.xyz * UniformScalar_20.xxx - UniformVector_13.xyz;
    r1.xyz = UniformVector_12.xyz * UniformScalar_17.xxx - UniformVector_11.xyz;
    r1.xyz = r1.xyz * r13.yyy + UniformVector_11.xyz;
    r6.xyz = r2.xyz * r10.www + UniformVector_13.xyz;
    r2.xyz = r0.xyw * r13.www + UniformVector_9.xyz;
    ps = (UniformScalar_15.x >= 0.0) ? 1.0 : 0.0;
    r8.x = float((r5.z >= UniformScalar_19.x));
    r11.w = ps;
    ps = (UniformScalar_18.x > 0.0) ? 1.0 : 0.0;
    r8.y = float((r5.y >= UniformScalar_16.x));
    r0.x = ps;
    ps = (UniformScalar_15.x > 0.0) ? 1.0 : 0.0;
    r8.z = float((r5.x >= UniformScalar_22.x));
    r0.y = ps;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r7.x = float((r5.z > UniformScalar_19.x));
    r1.w = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r7.y = float((r5.y > UniformScalar_16.x));
    r2.w = ps;
    ps = UniformVector_3.x * r4.y;
    r7.z = float((r5.x > UniformScalar_22.x));
    r5.x = ps;
    ps = UniformVector_3.z * r4.x;
    r0.w = float((r14.y >= r10.y));
    r5.y = ps;
    ps = UniformVector_3.y * r4.z;
    r6.w = float((r14.y > r10.y));
    r5.z = ps;
    r4.xyz = (-abs(r2.www) >= 0.0) ? UniformVector_4.xyz : UniformVector_3.xyz;
    r9.xyz = (-abs(r1.www) >= 0.0) ? UniformVector_4.xzy : r4.xzy;
    r4.xy = (r6.ww > 0.0) ? r14.xy : r10.xy;
    r5.xyz = (-abs(r2.www) >= 0.0) ? r12.xzy : r5.xyz;
    r0.xy = (-abs(r0.xy) >= 0.0) ? 0.0 : r13.xz;
    r0.xy = (-abs(r11.zw) >= 0.0) ? 0.0 : r0.xy;
    r5.xyz = (-abs(r1.www) >= 0.0) ? r12.xzy : r5.xyz;
    r4.x = (r0.w > 0.0) ? r4.x : r10.x;
    r10.y = (r0.w > 0.0) ? r4.y : r10.y;
    r10.x = (-abs(r5.w) >= 0.0) ? r4.x : r10.y;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r4.xyz = r5.yyy * UniformVector_2.xyz;
    r5.w = ps;
    r4.xyz = (-abs(r5.www) >= 0.0) ? r5.xzy : r4.xyz;
    r5.xzw = (-abs(r4.www) >= 0.0) ? r5.xyz : r4.xzy;
    r4.xyw = (-abs(r11.xyy) >= 0.0) ? 0.0 : r10.zxy;
    r0.z = (-abs(r0.z) >= 0.0) ? 0.0 : r4.x;
    r9.xyz = r4.yyy * r9.xzy;
    r4.xyz = r5.xzw * UniformVector_1.xzy + r9.xzy;
    r7.xyz = (r7.xyz > 0.0) ? 1.0 : r0.xyz;
    r0.xyw = (r8.yzx > 0.0) ? r7.yzx : r0.yzx;
    r5.w = dot(r0.xwy, float3(1.0, 1.0, 1.0));
    r2.xyz = r2.xzy * r0.xxx - r4.xyz;
    r0.xyz = r6.xyz * r0.yyy + r2.xzy;
    ps = OpacityOverride.x;
    r1.w = r5.w + r5.x;
    ps = UniformScalar_24.x * ps;
    r4.w = r1.w + r4.w;
    r5.x = ps;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    r4.xyz = r0.xzy * r5.www + r4.xyz;
    r4.w = r5.y * UniformScalar_23.x + r4.w;
    oC0.w = r5.x * r4.w;
    r4.xyz = r4.xzy + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
