// vs_f2f0064ff00c802e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 441 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000006E4 0061000E 00000000 00000000 000060E7 00000001 00000008 00000007 00000290 0010000D 0000300E 0000600F 00005010 00001011 00015012 00025013 00235014 00003050 00013151 0002F252 0003F353 0004F457 0005F5A0 0006F6A1 0000108C 0000108D 00001090 00001091 0000108B 0000108F 0000108E
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> NORMAL0
//   vertex element: instruction 15 -> TANGENT0
//   vertex element: instruction 16 -> TEXCOORD0
//   vertex element: instruction 17 -> BLENDWEIGHT0
//   vertex element: instruction 18 -> TEXCOORD1
//   vertex element: instruction 19 -> TEXCOORD2
//   vertex element: instruction 20 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c12); // float
float4 AxisRotationVectors[2] : register(c13); // float4[2]
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c8); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c15); // float3
float4 ProjectionMatrix[4] : register(c20); // float4x4 (matrix_columns)
float4 ShadowMatrix[4] : register(c16); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 tangent0 : TANGENT0;
    float4 texcoord0 : TEXCOORD0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord7 : TEXCOORD7;
    float4 color0 : COLOR0;
    float4 color1 : COLOR1;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r8 = In.position0;
    r7 = In.normal0;
    r0.yz = In.tangent0.xy;
    r9.xy = In.texcoord0.xy;
    r2.z = In.blendweight0.x;
    r2.xy = In.texcoord1.xy;
    r1 = In.texcoord2.zxwy;
    r3 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.x = CameraUp.x * (-1.0);
    r2.w = ps;
    r6.zw = (r2.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.w = r2.z * 0.15915494 + 0.5;
    ps = r1.x;
    r4.xyz = r7.www * LocalToWorld[3].xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r5 = r8.wwww * LocalToWorld[3];
    r9.z = ps;
    r4.xyz = r7.zzz * LocalToWorld[2].xzy + r4.xzy;
    r5 = r8.zzzz * LocalToWorld[2] + r5;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.w);
    r9.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r5 = r8.yyyy * LocalToWorld[1] + r5;
    r4.xyz = r7.yyy * LocalToWorld[1].xyz + r4.xzy;
    r4.xyz = r7.xxx * LocalToWorld[0].xzy + r4.xzy;
    r13 = r8.xxxx * LocalToWorld[0] + r5;
    ps = cos(r0.w);
    r6.xy = r9.zw * r0.yz;
    r0.x = ps;
    r12.yzw = -r13.xyz + CameraWorldPosition.xyz;
    r10.xyz = r13.zyx - r4.yzx;
    ps = sin(r0.w);
    r5 = r0.xxxx * CameraRight.zyxw;
    r0.w = ps;
    r4 = r0.wwww * CameraRight.xzyw;
    ps = (-1.0) * r0.x;
    r14.x = dot(r12.wyz, r12.wyz);
    r10.w = ps;
    r11 = r10.wwww * CameraUp.zyxw + r4.yzxw;
    r5 = r0.wwww * CameraUp.zyxw + r5;
    r5 = r5.wzyx * ParticleUpRightResultScalars.xxxx;
    r11 = r11.wzyx * ParticleUpRightResultScalars.xxxx;
    ps = r5.x;
    r14.y = dot(r10.xzy, r10.xzy);
    ps = r0.z * ps;
    r4.yz = max(r14.xy, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r4.y));
    r5.x = r0.w * r9.w;
    r0.w = ps;
    ps = rsqrt(abs(r4.z));
    r14.xyz = r12.yzw * r0.www;
    r0.w = ps;
    r10.xyz = r10.zyx * r0.www;
    r4.yzw = -r10.xyz * ParticleUpRightResultScalars.yyy + r5.yzw;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r5.yzw = r14.zxy * r10.yzx;
    r12.yzw = r14.zxy * AxisRotationVectors[a0].yzx;
    r12.yzw = r14.xzy * AxisRotationVectors[a0].yxz - r12.wzy;
    r10.xyz = r14.xzy * r10.yxz - r5.wzy;
    r5.y = dot(r10.xzy, r10.xzy);
    ps = r11.x;
    r5.z = dot(r12.ywz, r12.ywz);
    ps = r0.y * ps;
    r5.yz = max(r5.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r5.y));
    r11.x = r0.w * r9.z;
    r0.w = ps;
    ps = rsqrt(abs(r5.z));
    r10.xyz = r10.zxy * r0.www;
    r0.w = ps;
    r12 = r12.xwzy * r0.xwww;
    r10.w = r12.x + r4.x;
    r5.yzw = r12.yzw * AxisRotationVectors[a0].www;
    r0.xw = (-abs(r6.zz) >= 0.0) ? AxisRotationVectors[a0].yz : r5.zw;
    r14 = (-abs(r6.zwww) >= 0.0) ? AxisRotationVectors[a0].xzyx : r5.ywzy;
    r5.yzw = (r2.www == 0.0) ? r5.ywz : AxisRotationVectors[a0].xzy;
    r12.xyz = r5.zwy * ParticleUpRightResultScalars.zzz + r4.wzy;
    r10 = r10.xzyw * ParticleUpRightResultScalars.yyyx;
    ps = r10.w + r10.x;
    r5.yzw = r11.ywz + r10.xzy;
    r4.x = ps;
    r10.x = r14.x * ParticleUpRightResultScalars.z + r5.y;
    r10.zw = r0.wx * ParticleUpRightResultScalars.zz + r5.zw;
    ps = -r10.w;
    r11.yw = r6.xx * r10.wz;
    r10.y = ps;
    r4 = r14.ywzx * ParticleUpRightResultScalars.zzzz + r4.wyzx;
    ps = r6.x;
    r5.yzw = r6.yyy * r4.yzx;
    r4.xyz = r10.xwz * 0.5 + 0.5;
    ps = r4.w * ps;
    r6.xyz = r10.zxw * r12.yxz;
    r11.z = ps;
    r11 = r13.wyxz + r11;
    r6.xyz = r10.xzw * r12.yzx - r6.zyx;
    r0.x = dot(r6.xzy, r6.xzy);
    ps = rsqrt(abs(r0.x));
    r5 = r11.xwyz + r5.xwzy;
    r0.x = ps;
    r6.xyz = r6.xyz * r0.xxx;
    r11.xyz = r6.yzz * r12.xxy;
    r11.xyz = r6.xxy * r12.yzz - r11.xyz;
    r6.w = dot(r10.xyz, r11.xyz);
    r6 = r6.zyxw * 0.5 + 0.5;
    r0.x = r2.z * 0.15915494 + 0.5;
    r11.xyz = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r10 = r8.wwww * LocalToWorld[3].xwzy;
    r9.z = ps;
    r11.xyz = r7.zzz * LocalToWorld[2].xyz + r11.xzy;
    r10 = r8.zzzz * LocalToWorld[2].xwzy + r10;
    ps = (-0.5) + r1.z;
    r0.x = frac(r0.x);
    r9.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r10 = r8.yyyy * LocalToWorld[1].xzyw + r10.xzwy;
    r7.yzw = r7.yyy * LocalToWorld[1].xzy + r11.xzy;
    r7.xyz = r7.xxx * LocalToWorld[0].xyz + r7.ywz;
    r8 = r8.xxxx * LocalToWorld[0].xywz + r10.xzwy;
    ps = cos(r0.w);
    r2.zw = r9.zw * r0.yz;
    r0.x = ps;
    r12.xyz = -r8.xyw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r7.xyz = r8.wyx - r7.zyx;
    r7.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r11 = r7.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r4.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r12.zxy, r12.zxy);
    r0.x = ps;
    r10 = r7.wwww * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r4.w;
    r0.z = dot(r7.xzy, r7.xzy);
    ps = r10.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r9.w;
    r4.w = ps;
    ps = rsqrt(abs(r0.z));
    r14.xyz = r12.xyz * r4.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r7.zyx * r0.yyy;
    r4.w = ps;
    a0 = xe_mova(r4.w);
    ps = r4.w;
    r12.xyz = r14.zxy * r13.yzx;
    r7.xyz = r14.zxy * AxisRotationVectors[a0].yzx;
    r7.yzw = r14.xzy * AxisRotationVectors[a0].yxz - r7.zyx;
    r12.xyz = r14.xzy * r13.yxz - r12.zyx;
    r0.y = dot(r12.xzy, r12.xzy);
    ps = r0.w;
    r0.z = dot(r7.ywz, r7.ywz);
    ps = r11.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r7.x = r0.w * r9.z;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r12.xyz = r12.zxy * r0.www;
    r0.y = ps;
    r0.yzw = r7.wzy * r0.yyy;
    r7.yzw = r0.yzw * AxisRotationVectors[a0].www;
    r0.yzw = (r4.www == 0.0) ? r7.ywz : AxisRotationVectors[a0].xzy;
    r7.yzw = (r4.www == 0.0) ? AxisRotationVectors[a0].xzy : r7.ywz;
    r7.yzw = r7.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r13.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r7.yzw = r12.yzx * ParticleUpRightResultScalars.yyy + r7.zwy;
    r7.yzw = r11.yzw * ParticleUpRightResultScalars.xxx + r7.wyz;
    r0.yzw = r10.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r2.www * r0.yzw;
    r7.yzw = r2.zzz * r7.yzw;
    r7 = r8.zwyx + r7.xzwy;
    r7 = r7.xywz + r0.xwyz;
    r0 = r7.xxxx * ProjectionMatrix[3].xwzy;
    r0 = r7.yyyy * ProjectionMatrix[2].xwzy + r0;
    r0 = r7.wwww * ProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.zzzz * ProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    r0 = r5.xxxx * ShadowMatrix[3].xwzy;
    r0 = r5.yyyy * ShadowMatrix[2].xwzy + r0;
    r0 = r5.zzzz * ShadowMatrix[1].xzyw + r0.xzwy;
    o4 = r5.wwww * ShadowMatrix[0] + r0.xzyw;
    o0.xy = r9.xy;
    o1.xy = r2.xy;
    o6.xyz = r4.xyz;
    o6.w = 0.0;
    o5 = r6;
    o2 = r1.ywxz;
    o3 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord7 = o4;
    Out.color0 = o5;
    Out.color1 = o6;
    return Out;
}
