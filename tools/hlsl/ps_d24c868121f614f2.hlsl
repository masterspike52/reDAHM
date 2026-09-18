// ps_d24c868121f614f2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000618 10001700 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
float4 UniformScalar_13 : register(c33); // float
float4 UniformScalar_44 : register(c34); // float
float4 UniformScalar_6 : register(c32); // float
float4 UniformScalar_66 : register(c35); // float
float4 UniformScalar_81 : register(c36); // float
float4 UniformScalar_91 : register(c37); // float
float4 UniformScalar_92 : register(c38); // float
float4 UniformScalar_93 : register(c39); // float
float4 UniformScalar_94 : register(c40); // float
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
float4 UniformVector_19 : register(c21); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_20 : register(c22); // float4
float4 UniformVector_21 : register(c23); // float4
float4 UniformVector_22 : register(c24); // float4
float4 UniformVector_23 : register(c25); // float4
float4 UniformVector_24 : register(c26); // float4
float4 UniformVector_25 : register(c27); // float4
float4 UniformVector_26 : register(c28); // float4
float4 UniformVector_27 : register(c29); // float4
float4 UniformVector_28 : register(c30); // float4
float4 UniformVector_29 : register(c31); // float4
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
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.yz = r0.xy - 0.5;
    ps = UniformVector_7.x * r4.y;
    r6.yw = r4.yz * UniformVector_8.xy;
    r6.x = ps;
    ps = UniformVector_7.y * r4.z;
    r12.xz = r4.yz * UniformVector_9.xy;
    r6.z = ps;
    ps = UniformVector_10.x * r4.y;
    r15.xz = r4.yz * UniformVector_16.xy;
    r12.y = ps;
    ps = UniformVector_10.y * r4.z;
    r15.yw = r4.yz * UniformVector_17.xy;
    r12.w = ps;
    ps = UniformVector_13.x * r4.y;
    r14.yw = r4.yz * UniformVector_14.xy;
    r14.x = ps;
    ps = UniformVector_13.y * r4.z;
    r10.xz = r4.yz * UniformVector_11.xy;
    r14.z = ps;
    ps = UniformVector_12.x * r4.y;
    r7.xz = r4.yz * UniformVector_18.xy;
    r10.y = ps;
    ps = UniformVector_12.y * r4.z;
    r7.yw = r4.yz * UniformVector_19.xy;
    r10.w = ps;
    ps = UniformVector_20.x * r4.y;
    r5.yw = r4.yz * UniformVector_21.xy;
    r5.x = ps;
    ps = UniformVector_20.y * r4.z;
    r8.xz = r4.yz * UniformVector_28.xy;
    r5.z = ps;
    ps = UniformVector_29.x * r4.y;
    r13.xz = r4.yz * UniformVector_25.xy;
    r8.y = ps;
    ps = UniformVector_29.y * r4.z;
    r13.yw = r4.yz * UniformVector_26.xy;
    r8.w = ps;
    ps = UniformVector_23.x * r4.y;
    r9.yw = r4.yz * UniformVector_24.xy;
    r9.x = ps;
    ps = UniformVector_23.y * r4.z;
    r4.xy = r4.zy * UniformScalar_13.xx;
    r9.z = ps;
    ps = UniformVector_3.y * r4.x;
    r17.yw = r4.xy * UniformVector_4.yx;
    r17.x = ps;
    ps = UniformVector_3.x * r4.y;
    r11 = r9.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r17.z = ps;
    ps = r13.z;
    r4 = r8.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    ps = 0.5 + ps;
    r18 = r5.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r16.x = ps;
    ps = r13.w;
    r19 = r7.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    ps = 0.5 + ps;
    r20 = r10.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r16.y = ps;
    ps = r13.x;
    r21 = r14.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    ps = 0.0 + ps;
    r22 = r15.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r16.z = ps;
    ps = r13.y;
    r1 = r12 + float4(0.0, 0.0, 0.5, 0.5);
    ps = 0.0 + ps;
    r23 = r6.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r16.w = ps;
    ps = r17.z + r17.x;
    r2.xy = r17.xy + UniformVector_5.xy;
    r2.z = ps;
    ps = r17.w + r17.y;
    r6 = r23.zwxy + r6.zwxy;
    r2.w = ps;
    ps = r1.x;
    r15 = r22.zwxy + r15.zwxy;
    ps = r12.z + ps;
    r14 = r21.zwxy + r14.zwxy;
    r1.x = ps;
    ps = r1.y;
    r10 = r20.zwxy + r10.zwxy;
    ps = r12.w + ps;
    r7 = r19.zxyw + r7.zxyw;
    r1.y = ps;
    ps = r1.z;
    r5 = r18.zwxy + r5.zwxy;
    ps = r12.x + ps;
    r16 = r16.zwxy + r13.zwxy;
    r1.z = ps;
    ps = r1.w;
    r4 = r4.xzwy + r8.xzwy;
    ps = r12.y + ps;
    r8.zw = r2.zw + UniformVector_5.xy;
    r1.w = ps;
    ps = r4.y;
    r9 = r11.xzwy + r9.xzwy;
    r4.y = ps;
    ps = 0.5 + r4.y;
    r2.zw = r9.yz + 0.5;
    r8.x = ps;
    ps = 0.5 + r4.z;
    r9.yz = r16.xy + 0.5;
    r8.y = ps;
    ps = r5.x;
    r11.xy = r7.xw + 0.5;
    r4.y = ps;
    ps = 0.5 + r4.y;
    r12.xy = r10.xy + 0.5;
    r11.z = ps;
    ps = 0.5 + r5.y;
    r12.zw = r14.xy + 0.5;
    r11.w = ps;
    ps = r1.x;
    r13.xy = r15.xy + 0.5;
    r4.y = ps;
    ps = 0.5 + r4.y;
    r10.xy = r6.xy + 0.5;
    r13.z = ps;
    ps = 0.5 + r1.y;
    r2.xy = r2.xy + r17.zw;
    r13.w = ps;
    r7.w = tex2D(Texture2D_2, r4.xw).w;
    r7.x = tex2D(Texture2D_2, r16.zw).w;
    r6.x = tex2D(Texture2D_2, r9.xw).w;
    r6.y = tex2D(Texture2D_2, r15.zw).w;
    r6.z = tex2D(Texture2D_2, r6.zw).w;
    r9.x = tex2D(Texture2D_2, r5.zw).w;
    r7.y = tex2D(Texture2D_2, r7.yz).w;
    r7.z = tex2D(Texture2D_2, r1.zw).w;
    r14.w = tex2D(Texture2D_2, r14.zw).w;
    r9.w = tex2D(Texture2D_2, r10.zw).w;
    r10 = tex2D(Texture2D_2, r10.xy);
    r16 = tex2D(Texture2D_2, r13.zw);
    r18.xyz = tex2D(Texture2D_2, r13.xy).xyz;
    r20 = tex2D(Texture2D_2, r12.zw);
    r17 = tex2D(Texture2D_2, r12.xy);
    r21.xyz = tex2D(Texture2D_2, r11.zw).xyz;
    r19.xyz = tex2D(Texture2D_2, r11.xy).xyz;
    r22 = tex2D(Texture2D_2, r9.yz);
    r11 = tex2D(Texture2D_2, r2.zw);
    r2.xyw = tex2D(Texture2D_1, r2.xy).xzy;
    r15.xzw = tex2D(Texture2D_1, r8.zw).xyz;
    r5 = tex2D(Texture2D_0, r0.xy).xywz;
    r4.xyz = tex2D(Texture2D_2, r8.xy).yxz;
    ps = UniformScalar_81.x;
    r12.yz = UniformScalar_66.xx * UniformVector_15.yz;
    ps = UniformVector_22.x * ps;
    r13.xyz = UniformScalar_44.xxx * UniformVector_6.xyz;
    r1.y = ps;
    ps = UniformScalar_81.x;
    r1.x = float((UniformScalar_93.x >= 3.0));
    ps = UniformVector_22.y * ps;
    r0.x = float((UniformScalar_92.x >= 1.0));
    r1.z = ps;
    ps = UniformScalar_81.x;
    r0.y = float((UniformScalar_92.x > 1.0));
    ps = UniformVector_22.z * ps;
    r0.z = float((UniformScalar_93.x > 3.0));
    r1.w = ps;
    ps = 0.9 * r4.y;
    r8.yzw = r4.yxz * UniformVector_27.xyz;
    r15.y = ps;
    ps = r5.z;
    r14.xyz = r5.xyw * UniformVector_1.xyz;
    r4.x = ps;
    ps = 3.0 * r4.x;
    r5.xy = r15.zw * r5.zz;
    r4.z = ps;
    ps = 0.7 * r5.z;
    r4.xy = r2.wy * r5.zz;
    r4.w = ps;
    ps = r4.w;
    r11 = r22 + r11;
    ps = r5.w + ps;
    r15.z = r11.w * 0.9;
    r0.w = ps;
    ps = r4.z;
    r19.xyz = r21.xyz + r19.xyz;
    ps = r2.x * ps;
    r2.w = r4.z * r15.x;
    r2.x = ps;
    ps = 3.0 * r4.x;
    r17 = r20 + r17;
    r2.y = ps;
    ps = 3.0 * r4.y;
    r4.xzw = r19.yxz + r18.yxz;
    r2.z = ps;
    ps = 3.0 * r5.x;
    r16 = r17 + r16;
    r9.y = ps;
    ps = 3.0 * r5.y;
    r14.xyz = r14.xzy * UniformScalar_6.xxx;
    r9.z = ps;
    r9.yz = r9.yz * UniformVector_2.yz - r14.zy;
    ps = 0.9 * r4.z;
    r4.y = r4.z * UniformVector_15.x;
    r15.x = ps;
    ps = UniformScalar_66.x * r4.y;
    r10 = r16 + r10;
    r12.x = ps;
    ps = r10.w;
    r12.yz = r12.yz * r4.xw;
    r4.y = ps;
    ps = 0.9 * r4.y;
    r9.yz = r9.zy * r5.zz;
    r15.w = ps;
    r4 = r2 * UniformVector_2.xyzx - r14.xzyx;
    r2 = r4.xzyw * r5.zzzz + r14.xyzx;
    r8.x = r13.x * r10.x - r2.w;
    r8.yzw = r8.ywz * UniformScalar_91.xxx - r2.xyz;
    r11.x = r1.y * r11.x - r2.w;
    r11.w = r12.x * UniformVector_15.x - r2.w;
    r4 = r0.wwww + r15.yzwx;
    r9.yzw = r14.wyz + r9.wyz;
    r4.w = (-abs(r0.z) >= 0.0) ? r4.w : r4.z;
    r10.zw = r13.zy * r10.zy - r9.zw;
    r10.xy = r12.zy * UniformVector_15.zy - r9.zw;
    r11.yz = r1.wz * r11.zy - r9.zw;
    r4.x = (-abs(r0.y) >= 0.0) ? r4.x : r4.y;
    r0.w = (-abs(r0.x) >= 0.0) ? r0.w : r4.x;
    ps = OpacityOverride.x;
    r7.yz = r9.xy + r7.yz;
    ps = UniformScalar_94.x * ps;
    r7.xyz = r7.xyz + r6.xyz;
    r5.x = ps;
    r6.zw = r11.yz * r7.xx + r9.zw;
    r6.xy = r11.xw * r7.xy + r2.ww;
    r9 = r10 * r7.yyzz + r9.zwzw;
    r4.yz = (-abs(r0.zz) >= 0.0) ? r9.xy : r9.zw;
    r7 = r8.yzwx * r7.wwwz + r2;
    r4.x = (-abs(r0.z) >= 0.0) ? r6.y : r7.w;
    r5.yzw = (-abs(r0.yyy) >= 0.0) ? r7.xyz : r6.xzw;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r2.xyz : r5.yzw;
    r4 = (-abs(r1.xxxx) >= 0.0) ? r0 : r4;
    oC0.w = r5.x * r4.w;
    r4.xyz = r4.xyz + UniformVector_0.xzy;
    oC0.xyz = r4.xzy * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
