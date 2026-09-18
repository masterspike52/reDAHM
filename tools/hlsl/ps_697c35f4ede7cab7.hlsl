// ps_697c35f4ede7cab7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 291 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000048C 10001600 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c41); // float
float4 UniformScalar_17 : register(c22); // float
float4 UniformScalar_18 : register(c23); // float
float4 UniformScalar_19 : register(c24); // float
float4 UniformScalar_29 : register(c25); // float
float4 UniformScalar_30 : register(c26); // float
float4 UniformScalar_31 : register(c27); // float
float4 UniformScalar_41 : register(c28); // float
float4 UniformScalar_42 : register(c29); // float
float4 UniformScalar_43 : register(c30); // float
float4 UniformScalar_54 : register(c31); // float
float4 UniformScalar_55 : register(c32); // float
float4 UniformScalar_56 : register(c33); // float
float4 UniformScalar_57 : register(c34); // float
float4 UniformScalar_58 : register(c35); // float
float4 UniformScalar_59 : register(c36); // float
float4 UniformScalar_6 : register(c21); // float
float4 UniformScalar_60 : register(c37); // float
float4 UniformScalar_61 : register(c38); // float
float4 UniformScalar_62 : register(c39); // float
float4 UniformScalar_63 : register(c40); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_10 : register(c12); // float4
float4 UniformVector_11 : register(c13); // float4
float4 UniformVector_12 : register(c14); // float4
float4 UniformVector_13 : register(c15); // float4
float4 UniformVector_14 : register(c16); // float4
float4 UniformVector_15 : register(c17); // float4
float4 UniformVector_16 : register(c18); // float4
float4 UniformVector_17 : register(c19); // float4
float4 UniformVector_18 : register(c20); // float4
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.xy = r0.yx - 0.5;
    r7.y = dot(r4.yx, UniformVector_17.xy) + 0.5;
    r2.yz = r4.yx * UniformVector_17.xy;
    r6.xz = r4.yx * UniformVector_3.xy;
    ps = UniformVector_16.x * r4.y;
    r5.xz = r4.yx * UniformVector_12.xy;
    r2.x = ps;
    ps = UniformVector_4.x * r4.y;
    r1.xz = r4.yx * UniformVector_8.xy;
    r6.y = ps;
    ps = UniformVector_13.x * r4.y;
    r1.yw = r4.yx * UniformVector_9.xy;
    r5.y = ps;
    ps = UniformVector_13.y * r4.x;
    r8 = r1.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r5.w = ps;
    ps = UniformVector_4.y * r4.x;
    r9 = r5.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r6.w = ps;
    ps = UniformVector_16.y * r4.x;
    r10 = r6.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r2.w = ps;
    r4 = r2.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r2 = r4.zwyx + r2.wzxy;
    r6 = r10.zwxy + r6.zwxy;
    r5 = r9.zwxy + r5.zwxy;
    r4 = r8.xzwy + r1.xzwy;
    ps = r4.y;
    r1.xy = r5.xy + 0.5;
    r4.y = ps;
    ps = 0.5 + r4.y;
    r5.xy = r6.xy + 0.5;
    r1.z = ps;
    ps = 0.5 + r4.z;
    r7.xz = r2.xy + 0.5;
    r1.w = ps;
    r16.x = tex2D(Texture2D_1, r6.zw).w;
    r8.z = tex2D(Texture2D_3, r4.xw).w;
    r16.z = tex2D(Texture2D_5, r2.zw).w;
    r8.x = tex2D(Texture2D_5, r5.zw).w;
    r6.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r5 = tex2D(Texture2D_1, r5.xy).yzxw;
    r9 = tex2D(Texture2D_3, r1.zw);
    r2 = tex2D(Texture2D_0, r0.xy);
    r17 = tex2D(Texture2D_5, r7.xz);
    r1 = tex2D(Texture2D_5, r1.xy).yzxw;
    r13 = tex2D(Texture2D_4, r0.xy);
    r22 = tex2D(Texture2D_2, r0.xy);
    r12 = tex2D(Texture2D_7, r0.xy);
    r11 = tex2D(Texture2D_6, r0.xy);
    ps = (UniformScalar_54.x >= 0.0) ? 1.0 : 0.0;
    r6.w = float((UniformScalar_29.x >= 0.0));
    r4.w = ps;
    ps = (UniformScalar_41.x >= 0.0) ? 1.0 : 0.0;
    r10.w = float((UniformScalar_41.x > 0.0));
    r7.w = ps;
    ps = (UniformScalar_29.x > 0.0) ? 1.0 : 0.0;
    r4.x = float((UniformScalar_54.x > 0.0));
    r14.w = ps;
    ps = r11.w;
    r8.w = r12.w * UniformScalar_61.x;
    r4.y = ps;
    ps = UniformScalar_60.x * r4.y;
    r16.w = r22.w * UniformScalar_58.x;
    r16.y = ps;
    ps = r13.w;
    r0.w = r17.w + r1.w;
    r4.y = ps;
    ps = UniformScalar_59.x * r4.y;
    r15.xyz = r22.xyz * UniformVector_5.xyz;
    r8.y = ps;
    ps = r1.z;
    r0.xyz = r2.xyz * UniformVector_1.xyz;
    r4.y = ps;
    ps = UniformVector_11.x * r4.y;
    r7.xyz = r9.xyz * UniformVector_7.xyz;
    r10.x = ps;
    ps = UniformVector_11.y * r1.x;
    r18.xyz = r17.xyz * UniformVector_5.xyz;
    r10.y = ps;
    ps = UniformVector_11.z * r1.y;
    r21.xyz = r17.xyz * UniformVector_15.xyz;
    r10.z = ps;
    ps = r5.z;
    r17.xyz = r5.zxy * UniformVector_2.xyz;
    r4.y = ps;
    ps = UniformVector_5.x * r4.y;
    r20.xyz = r1.zxy * UniformVector_5.xyz;
    r14.x = ps;
    ps = UniformVector_5.y * r5.x;
    r1.xyz = r12.xyz * UniformVector_18.xyz;
    r14.y = ps;
    ps = UniformVector_5.z * r5.y;
    r19.xyz = r9.xyz * UniformVector_5.xyz;
    r14.z = ps;
    r2.xyz = r13.xyz * UniformVector_10.xyz + r19.xyz;
    r1.xyz = r6.xyz * UniformVector_5.xyz + r1.xyz;
    r9.xyz = r11.xyz * UniformVector_14.xyz + r20.xyz;
    r6.xyz = r22.xyz * UniformVector_6.xyz + r14.xyz;
    r17.xyz = (UniformScalar_17.xxx > 0.0) ? r17.xyz : r14.xyz;
    r4.xyz = (-abs(r4.xxx) >= 0.0) ? r18.xyz : r21.xyz;
    r7.xyz = (-abs(r14.www) >= 0.0) ? r19.xyz : r7.xyz;
    r10.xyz = (-abs(r10.www) >= 0.0) ? r20.xyz : r10.xyz;
    ps = r0.w;
    r0.xyz = r0.xyz * UniformScalar_6.xxx;
    ps = r9.w + ps;
    r16.zw = r16.zw + r8.xy;
    r0.w = ps;
    r10.xyz = (-abs(r7.www) >= 0.0) ? r20.xyz : r10.xyz;
    r7.xyz = (-abs(r6.www) >= 0.0) ? r19.xyz : r7.xyz;
    r4.yzw = (-abs(r4.www) >= 0.0) ? r18.xyz : r4.xyz;
    r17.xyz = (UniformScalar_17.xxx >= 0.0) ? r17.xyz : r14.xyz;
    r15.xyz = r17.xyz * UniformScalar_18.xxx + r15.xyz;
    ps = UniformScalar_55.x * r4.y;
    r7.xyz = r7.xyz * UniformScalar_30.xxx;
    r8.x = ps;
    ps = UniformScalar_55.x * r4.z;
    r10.xyz = r10.xyz * UniformScalar_42.xxx;
    r8.y = ps;
    ps = UniformScalar_55.x * r4.w;
    r16.zw = r16.zw + r8.zw;
    r8.z = ps;
    r11.xyz = r11.xyz * UniformVector_5.xyz + r10.xyz;
    r12.xyz = r12.xyz * UniformVector_5.xyz + r8.xyz;
    r13.xyz = r13.xyz * UniformVector_5.xyz + r7.xyz;
    ps = r0.w;
    r4.xz = r16.zw + r16.xy;
    r14.xyz = (UniformScalar_19.xxx > 0.0) ? r15.xyz : r14.xyz;
    r6.xyz = (UniformScalar_19.xxx >= 0.0) ? r14.xyz : r6.xyz;
    ps = r5.w + ps;
    r4.w = r4.z + r2.w;
    r4.y = ps;
    r7.xyz = (UniformScalar_31.xxx > 0.0) ? r13.xyz : r7.xyz;
    r8.xyz = (UniformScalar_56.xxx > 0.0) ? r12.xyz : r8.xyz;
    r5.xyz = (UniformScalar_43.xxx > 0.0) ? r11.xyz : r10.xyz;
    r5.xyz = (UniformScalar_43.xxx >= 0.0) ? r5.xyz : r9.xyz;
    r1.xyz = (UniformScalar_56.xxx >= 0.0) ? r8.xyz : r1.xyz;
    r2.xyz = (UniformScalar_31.xxx >= 0.0) ? r7.xyz : r2.xyz;
    r4.xy = r4.xy * UniformScalar_57.xx + r4.zw;
    r2.xyz = r6.xyz + r2.xyz;
    r1.xyz = r2.xyz + r1.xyz;
    ps = UniformScalar_63.x;
    r5.xyz = r1.xyz + r5.xyz;
    ps = UniformScalar_62.x * ps;
    r5.xyz = r5.xyz - r0.xyz;
    r5.w = ps;
    r4 = r5 * r4.xxxy;
    oC0.w = r4.w * OpacityOverride.x;
    r4.xyz = r0.xyz + r4.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
