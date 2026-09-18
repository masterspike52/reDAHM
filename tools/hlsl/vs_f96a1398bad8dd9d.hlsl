// vs_f96a1398bad8dd9d.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 549 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000894 00710010 00000000 00000000 00007908 00000001 00000006 00000008 00000290 00100010 00003011 00006012 00005013 00001014 00215015 00003050 0001F151 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A1 000010AE 000010B5 000010B1 000010AF 000010B2 000010B3 000010B4 000010B0
//   vertex element: instruction 16 -> POSITION0
//   vertex element: instruction 17 -> NORMAL0
//   vertex element: instruction 18 -> TANGENT0
//   vertex element: instruction 19 -> TEXCOORD0
//   vertex element: instruction 20 -> BLENDWEIGHT0
//   vertex element: instruction 21 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c12); // float
float4 AxisRotationVectors[2] : register(c13); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LightPositionAndInvRadius : register(c17); // float4[2]
float4 LightType : register(c16); // float[2]
float4 LocalToWorld[4] : register(c8); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c15); // float3
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 tangent0 : TANGENT0;
    float4 texcoord0 : TEXCOORD0;
    float4 blendweight0 : BLENDWEIGHT0;
    float4 texcoord1 : TEXCOORD1;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord4 : TEXCOORD4;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
    float4 texcoord8 : TEXCOORD8;
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r10 = In.position0;
    r9 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.yz = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r5 = In.texcoord1;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r4.x = CameraUp.x * (-1.0);
    r0.x = ps;
    r1.xw = (r0.xx == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r2.y = r0.w * 0.15915494 + 0.5;
    r3 = r10.wwww * LocalToWorld[3].xzyw;
    ps = frac(r2.y);
    r2.xzw = r9.www * LocalToWorld[3].xzy;
    r2.y = ps;
    r2.xzw = r9.zzz * LocalToWorld[2].xyz + r2.xwz;
    r3 = r10.zzzz * LocalToWorld[2].xzyw + r3;
    r2.y = r2.y * 6.2831855 - 3.1415927;
    r3 = r10.yyyy * LocalToWorld[1].xzyw + r3;
    r2.xzw = r9.yyy * LocalToWorld[1].xzy + r2.xwz;
    r2.xzw = r9.xxx * LocalToWorld[0].xyz + r2.xwz;
    r11 = r10.xxxx * LocalToWorld[0].xzyw + r3;
    r4.yzw = -r11.yzx + CameraWorldPosition.zyx;
    r3.xyz = r11.yzx - r2.wzx;
    r2.x = dot(r3.xzy, r3.xzy);
    r2.z = dot(r4.ywz, r4.ywz);
    r2.xz = max(r2.xz, 0.01);
    ps = rsqrt(abs(r2.z));
    r8.zw = r0.yz - 0.5;
    r2.w = ps;
    ps = rsqrt(abs(r2.x));
    r4.yzw = r4.yzw * r2.www;
    r2.x = ps;
    r3.xyw = r3.zyx * r2.xxx;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r2.xzw = r4.ywz * r3.ywx;
    r6.xyz = r4.ywz * AxisRotationVectors[a0].yzx;
    r7.xyz = r4.wyz * AxisRotationVectors[a0].yxz - r6.zyx;
    r4.yzw = r4.wyz * r3.yxw - r2.wzx;
    r2.x = dot(r4.ywz, r4.ywz);
    ps = sin(r2.y);
    r2.z = dot(r7.xzy, r7.xzy);
    r6.x = ps;
    ps = cos(r2.y);
    r2.xw = max(r2.zx, 0.01);
    r6.y = ps;
    ps = rsqrt(abs(r2.x));
    r6.z = r6.y * (-1.0);
    r2.y = ps;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r7.zyx * r2.yyy;
    r6.w = ps;
    r14 = r6.xxyy * CameraRight.zxzy;
    r12 = r4.xwyz * r6.ywww;
    r13.xyz = r2.xzy * AxisRotationVectors[a0].www;
    r4 = (-abs(r1.xwxw) >= 0.0) ? AxisRotationVectors[a0].xyyz : r13.xzzy;
    r7.xyz = (r0.xxx == 0.0) ? r13.xzy : AxisRotationVectors[a0].xyz;
    r13.z = r12.x + r14.y;
    r2 = r6.xxyy * CameraRight.ywwx;
    r13.xy = (-abs(r1.wx) >= 0.0) ? AxisRotationVectors[a0].xz : r13.xy;
    r13.w = r6.x * CameraUp.y + r14.w;
    r14.xyz = r6.zzx * CameraUp.zxz + r14.xyz;
    r14.w = r6.x * CameraUp.x + r2.w;
    r12.xyz = r12.ywz * ParticleUpRightResultScalars.yyy;
    r2.xyz = r6.zzx * CameraUp.yww + r2.xyz;
    r3.z = r2.x * ParticleUpRightResultScalars.x + r12.y;
    ps = ParticleUpRightResultScalars.x * r2.y;
    r3.xyw = -r3.xyw * ParticleUpRightResultScalars.yyy;
    r8.x = ps;
    r6.zw = r14.wz * ParticleUpRightResultScalars.xx + r3.xw;
    ps = ParticleUpRightResultScalars.x * r2.z;
    r13 = r13.yxzw * ParticleUpRightResultScalars.zzxx;
    r8.y = ps;
    r6.xy = r14.yx * ParticleUpRightResultScalars.xx + r12.xz;
    r12.yz = r7.zx * ParticleUpRightResultScalars.zz + r6.wz;
    ps = r6.y;
    r3.x = r13.z + r12.x;
    ps = r13.x + ps;
    r12.w = r6.z + r13.y;
    r7.x = ps;
    ps = r13.w;
    r2 = r8.xzyw * r1.yyzz;
    r3.w = dot(r2.xz, r8.zw) + r11.w;
    ps = r3.y + ps;
    r8.x = r2.w * r12.w;
    r3.y = ps;
    r12.x = r7.y * ParticleUpRightResultScalars.z + r3.y;
    r7.yz = r4.wx * ParticleUpRightResultScalars.zz + r6.wx;
    r3.xyz = r4.xzy * ParticleUpRightResultScalars.zzz + r3.xzy;
    ps = r7.z * r7.y;
    r4.y = -r3.y;
    r6.w = ps;
    ps = r3.y;
    r6.x = r3.y * r12.z;
    ps = r12.y * ps;
    r8.yzw = r2.ywy * r3.xzy;
    r13.z = ps;
    ps = r3.y;
    r1.xw = r11.zx + r8.wy;
    r4.x = r7.z;
    r4.w = r7.y;
    r4.z = r7.x;
    r2.z = dot(r2.yw, r4.zw) + r11.y;
    ps = r4.w * ps;
    r6.yz = r4.zx * r12.xy;
    r14.x = ps;
    ps = r3.y;
    r14.yz = r4.zx * r3.zz;
    ps = r12.w * ps;
    r2.xy = r1.wx + r8.xz;
    r14.w = ps;
    ps = ViewProjectionMatrix[0].z * r2.x;
    r13.xyw = r4.xzz * r12.xzw;
    r11.y = ps;
    ps = ViewProjectionMatrix[0].w * r2.x;
    r8.yz = r2.yy * ViewProjectionMatrix[1].zw;
    r11.z = ps;
    ps = r14.x - r14.y;
    r6 = r13 - r6.xzyw;
    r13.x = ps;
    ps = r14.z - r14.w;
    r11.x = r6.w * r6.w;
    r13.y = ps;
    r8.x = dot(r13.yx, r13.yx) + 0.0;
    r8.xyz = r11.xyz + r8.xyz;
    ps = rsqrt(abs(r8.x));
    r2.w = dot(r6.xzy, r6.xzy);
    r0.x = ps;
    r1.xw = r2.zz * ViewProjectionMatrix[2].zw + r8.yz;
    r1.xw = r3.ww * ViewProjectionMatrix[3].zw + r1.xw;
    ps = rsqrt(abs(r2.w));
    r7.z = r13.y * r0.x;
    r2.w = ps;
    r15.x = float((LightType.x >= 0.9));
    ps = 0.5 * r3.y;
    r8.xy = r4.xz * 0.5;
    r8.z = ps;
    r8.xyz = r8.xzy + 0.5;
    r6.xyz = r6.xyz * r2.www;
    r3.w = r6.w * r0.x;
    ps = r13.x;
    r11.xyz = r6.yzz * r12.yyx;
    r11.xyz = r6.xxy * r12.xzz - r11.xyz;
    ps = r0.x * ps;
    r6.w = dot(r4.xyz, r11.xyz);
    r2.w = ps;
    r15.yzw = -r2.zyx * CameraPosition.www + CameraPosition.zyx;
    r11 = r6.zyxw * 0.5 + 0.5;
    ps = r12.w;
    r14.xyz = r4.xzw * r15.wyy;
    ps = r15.w * ps;
    r13 = r2.zxyw * r15.xxxw;
    r14.w = ps;
    r6.xy = r3.yz * r15.zz + r14.xw;
    r13.xyz = -r13.xyz + LightPositionAndInvRadius.zxy;
    r0.x = r3.w * r15.z + r13.w;
    r6.z = r7.z * r15.y + r0.x;
    r12.w = r12.w * r13.y;
    ps = r7.z;
    r6.xy = r6.xy + r14.yz;
    ps = r13.x * ps;
    r12.xyz = r4.xzw * r13.yxx;
    r0.x = ps;
    r0.x = r2.w * r13.y + r0.x;
    r2.z = r3.w * r13.z + r0.x;
    r2.xy = r3.yz * r13.zz + r12.xw;
    r2.xy = r2.xy + r12.yz;
    r0.x = r0.w * 0.15915494 + 0.5;
    r3.xyz = r9.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r0.y;
    r4 = r10.wwww * LocalToWorld[3];
    r14.x = ps;
    r3.xyz = r9.zzz * LocalToWorld[2].xzy + r3.xzy;
    r4 = r10.zzzz * LocalToWorld[2] + r4;
    ps = (-0.5) + r0.z;
    r0.x = frac(r0.x);
    r14.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r4 = r10.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r3.xyz = r9.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r9.xxx * LocalToWorld[0].xzy + r3.xzy;
    r9 = r10.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    ps = cos(r0.w);
    r10.xy = r14.xy * r1.yz;
    r0.x = ps;
    r4.xyz = -r9.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r3.yzw = r9.wzx - r3.yzx;
    r3.x = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r13 = r3.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r12 = r0.xxxx * CameraRight.wzyx;
    r2.w = ps;
    ps = (-1.0) * r0.x;
    r1.y = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    r12 = r3.xxxx * CameraUp.wxzy + r12.xwyz;
    r13 = r0.xxxx * CameraUp.wxzy + r13.xwyz;
    ps = r2.w;
    r1.z = dot(r3.ywz, r3.ywz);
    ps = r12.x * ps;
    r1.yz = max(r1.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r3.x = r0.x * r14.y;
    r0.x = ps;
    ps = rsqrt(abs(r1.z));
    r16.xyz = r4.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r15.xyz = r3.yzw * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r4.xyz = r16.zxy * r15.yxz;
    r3.yzw = r16.zxy * AxisRotationVectors[a0].yzx;
    r3.yzw = r16.xzy * AxisRotationVectors[a0].yxz - r3.wzy;
    r4.yzw = r16.xzy * r15.yzx - r4.zyx;
    r1.y = dot(r4.ywz, r4.ywz);
    ps = r0.w;
    r1.z = dot(r3.ywz, r3.ywz);
    ps = r13.x * ps;
    r1.yz = max(r1.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r1.y));
    r4.x = r0.w * r14.x;
    r0.w = ps;
    ps = rsqrt(abs(r1.z));
    r14.xyz = r4.ywz * r0.www;
    r0.w = ps;
    r3.yzw = r3.yzw * r0.www;
    r4.yzw = r3.wzy * AxisRotationVectors[a0].www;
    r3.yzw = (r0.xxx == 0.0) ? r4.ywz : AxisRotationVectors[a0].xzy;
    r4.yzw = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xzy : r4.ywz;
    r4.yzw = r4.yzw * ParticleUpRightResultScalars.zzz;
    r3.yzw = r3.yzw * ParticleUpRightResultScalars.zzz;
    r3.yzw = -r15.xzy * ParticleUpRightResultScalars.yyy + r3.zyw;
    r4.yzw = r14.xzy * ParticleUpRightResultScalars.yyy + r4.zwy;
    r4.yzw = r13.yzw * ParticleUpRightResultScalars.xxx + r4.wyz;
    r3.yzw = r12.ywz * ParticleUpRightResultScalars.xxx + r3.zwy;
    r3.yzw = r10.yyy * r3.yzw;
    r4.yzw = r10.xxx * r4.yzw;
    r4 = r9.ywzx + r4.xzwy;
    r4 = r4.xywz + r3.xwyz;
    r3 = r4.xxxx * ViewProjectionMatrix[3].xwzy;
    r3 = r4.yyyy * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r4.wwww * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    r3 = r4.zzzz * ViewProjectionMatrix[0] + r3.xzyw;
    oPos = r3;
    o0.xy = r0.yz;
    o3.zw = r1.xw;
    o3.xy = 1.0;
    o7.xyz = r8.xyz;
    o7.w = 0.0;
    o2.xyz = r2.xyz;
    o2.w = 0.0;
    o4.xyz = r6.xyz;
    o4.w = 0.0;
    o5.xyz = r7.xyz;
    o5.w = 0.0;
    o6 = r11;
    o1 = r5;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    Out.color0 = o6;
    Out.color1 = o7;
    return Out;
}
