// vs_52b07dcc9901417e.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 564 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000008D0 00910011 00000000 00000000 0000914A 00000001 00000008 0000000A 00000290 00100010 00003011 00006012 00005013 00001014 00015015 00025016 00235017 00003050 00013151 0002F252 0003F353 0004F454 0005F556 0006F657 0007F758 0008F8A0 0009F9A1 000010B1 000010B2 000010B9 000010BA 000010B5 000010B3 000010B6 000010B7 000010B8 000010B4
//   vertex element: instruction 16 -> POSITION0
//   vertex element: instruction 17 -> NORMAL0
//   vertex element: instruction 18 -> TANGENT0
//   vertex element: instruction 19 -> TEXCOORD0
//   vertex element: instruction 20 -> BLENDWEIGHT0
//   vertex element: instruction 21 -> TEXCOORD1
//   vertex element: instruction 22 -> TEXCOORD2
//   vertex element: instruction 23 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r8 <-> COLOR0 (flags 0xF)
//   interpolator: r9 <-> COLOR1 (flags 0xF)
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
    float4 r17 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 o8 = 0.0;
    float4 o9 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r12 = In.position0;
    r11 = In.normal0;
    r0.yz = In.tangent0.xy;
    r8.zw = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r8.xy = In.texcoord1.xy;
    r2 = In.texcoord2.xzwy;
    r6 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.x = float((LightType.x >= 0.9));
    r0.x = ps;
    r15.xy = (r0.xx == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r1.w = r0.w * 0.15915494 + 0.5;
    r3 = r12.wwww * LocalToWorld[3].xzyw;
    ps = frac(r1.w);
    r1.xyz = r11.www * LocalToWorld[3].xzy;
    r1.w = ps;
    r1.xyz = r11.zzz * LocalToWorld[2].xyz + r1.xzy;
    r3 = r12.zzzz * LocalToWorld[2].xzyw + r3;
    r1.w = r1.w * 6.2831855 - 3.1415927;
    r3 = r12.yyyy * LocalToWorld[1].xzyw + r3;
    r1.xyz = r11.yyy * LocalToWorld[1].xzy + r1.xzy;
    r1.xyz = r11.xxx * LocalToWorld[0].xyz + r1.xzy;
    r10 = r12.xxxx * LocalToWorld[0].xzwy + r3.xywz;
    r4.yzw = -r10.ywx + CameraWorldPosition.zyx;
    r3.xyz = r10.ywx - r1.zyx;
    r1.x = dot(r3.xzy, r3.xzy);
    r1.y = dot(r4.ywz, r4.ywz);
    r1.xy = max(r1.xy, 0.01);
    ps = rsqrt(abs(r1.y));
    r4.x = CameraUp.x * (-1.0);
    r1.z = ps;
    ps = rsqrt(abs(r1.x));
    r4.yzw = r4.yzw * r1.zzz;
    r1.x = ps;
    r1.xyz = r3.zyx * r1.xxx;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r3.xyz = r4.ywz * r1.yzx;
    r5.xyz = r4.ywz * AxisRotationVectors[a0].yzx;
    r7.xyz = r4.wyz * AxisRotationVectors[a0].yxz - r5.zyx;
    r4.yzw = r4.wyz * r1.yxz - r3.zyx;
    r3.x = dot(r4.ywz, r4.ywz);
    ps = sin(r1.w);
    r3.y = dot(r7.xzy, r7.xzy);
    r5.x = ps;
    ps = cos(r1.w);
    r3.xw = max(r3.yx, 0.01);
    r5.y = ps;
    ps = rsqrt(abs(r3.x));
    r5.z = r5.y * (-1.0);
    r1.w = ps;
    ps = rsqrt(abs(r3.w));
    r3.xyz = r7.zyx * r1.www;
    r5.w = ps;
    r14 = r5.xxyy * CameraRight.zxzy;
    r9 = r4.xwyz * r5.ywww;
    r13.yzw = r3.xyz * AxisRotationVectors[a0].www;
    r4 = (-abs(r15.xyxy) >= 0.0) ? AxisRotationVectors[a0].xyyz : r13.yzzw;
    r7.yzw = (r0.xxx == 0.0) ? r13.yzw : AxisRotationVectors[a0].xyz;
    r15.z = r9.x + r14.y;
    r3.xyw = -r1.xyz * ParticleUpRightResultScalars.yyy;
    r1 = r5.xxyy * CameraRight.ywwx;
    r15.xy = (-abs(r15.yx) >= 0.0) ? AxisRotationVectors[a0].xz : r13.yw;
    r15.w = r5.x * CameraUp.y + r14.w;
    r14.xyz = r5.zzx * CameraUp.zxz + r14.xyz;
    r14.w = r5.x * CameraUp.x + r1.w;
    r9.xyz = r9.ywz * ParticleUpRightResultScalars.yyy;
    r1.xyz = r5.zzx * CameraUp.yww + r1.xyz;
    r3.z = r1.x * ParticleUpRightResultScalars.x + r9.y;
    r5.zw = r14.wz * ParticleUpRightResultScalars.xx + r3.xw;
    r15 = r15.yxzw * ParticleUpRightResultScalars.zzxx;
    r5.xy = r14.yx * ParticleUpRightResultScalars.xx + r9.xz;
    r7.x = r5.y + r15.x;
    r14.yz = r7.wy * ParticleUpRightResultScalars.zz + r5.wz;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r3.x = r15.z + r9.x;
    r9.x = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r3.y = r15.w + r3.y;
    r9.y = ps;
    ps = r5.z;
    r9.zw = r2.yz - 0.5;
    ps = r15.y + ps;
    r1 = r9 * r0.yzyz;
    r14.w = ps;
    r3.w = dot(r1.xy, r9.zw) + r10.z;
    r9.x = r1.w * r14.w;
    r14.x = r7.z * ParticleUpRightResultScalars.z + r3.y;
    r7.yz = r4.wx * ParticleUpRightResultScalars.zz + r5.wx;
    r3.xyz = r4.xzy * ParticleUpRightResultScalars.zzz + r3.xzy;
    ps = r7.z * r7.y;
    r4.y = -r3.y;
    r5.w = ps;
    ps = r3.y;
    r5.x = r3.y * r14.z;
    ps = r14.y * ps;
    r9.yzw = r1.zwz * r3.xzy;
    r10.z = ps;
    ps = r3.y;
    r1.xy = r10.wx + r9.wy;
    r4.x = r7.z;
    r4.w = r7.y;
    r4.z = r7.x;
    r1.z = dot(r1.zw, r4.zw) + r10.y;
    ps = r4.w * ps;
    r5.yz = r4.zx * r14.xy;
    r15.x = ps;
    ps = r3.y;
    r15.yz = r4.zx * r3.zz;
    ps = r14.w * ps;
    r1.xy = r1.yx + r9.xz;
    r15.w = ps;
    ps = ViewProjectionMatrix[0].z * r1.x;
    r10.xyw = r4.xzz * r14.xzw;
    r13.z = ps;
    ps = ViewProjectionMatrix[0].w * r1.x;
    r9.yz = r1.yy * ViewProjectionMatrix[1].zw;
    r13.w = ps;
    ps = r15.x - r15.y;
    r5 = r10 - r5.xzyw;
    r10.z = ps;
    ps = r15.z - r15.w;
    r13.y = r5.w * r5.w;
    r10.w = ps;
    r9.x = dot(r10.wz, r10.wz) + 0.0;
    r9.xyz = r13.yzw + r9.xyz;
    ps = rsqrt(abs(r9.x));
    r1.w = dot(r5.xzy, r5.xzy);
    r0.x = ps;
    r7.zw = r1.zz * ViewProjectionMatrix[2].zw + r9.yz;
    r10.xy = r3.ww * ViewProjectionMatrix[3].zw + r7.zw;
    ps = rsqrt(abs(r1.w));
    r7.z = r10.w * r0.x;
    r1.w = ps;
    ps = 0.5 * r3.y;
    r9.xy = r4.xz * 0.5;
    r9.z = ps;
    r9.xyz = r9.xzy + 0.5;
    r5.xyz = r5.xyz * r1.www;
    r3.w = r5.w * r0.x;
    ps = r10.z;
    r13.yzw = r5.yzz * r14.yyx;
    r13.yzw = r5.xxy * r14.xzz - r13.yzw;
    ps = r0.x * ps;
    r5.w = dot(r4.xyz, r13.yzw);
    r1.w = ps;
    r13.yzw = -r1.zyx * CameraPosition.www + CameraPosition.zyx;
    r5 = r5.zyxw * 0.5 + 0.5;
    ps = r14.w;
    r16.xyz = r4.xzw * r13.wyy;
    ps = r13.w * ps;
    r15 = r1.zxyw * r13.xxxw;
    r16.w = ps;
    r10.zw = r3.yz * r13.zz + r16.xw;
    r15.xyz = -r15.xyz + LightPositionAndInvRadius.zxy;
    r0.x = r3.w * r13.z + r15.w;
    r13.z = r7.z * r13.y + r0.x;
    r14.w = r14.w * r15.y;
    ps = r7.z;
    r13.xy = r10.zw + r16.yz;
    ps = r15.x * ps;
    r14.xyz = r4.xzw * r15.yxx;
    r0.x = ps;
    r0.x = r1.w * r15.y + r0.x;
    r1.z = r3.w * r15.z + r0.x;
    r1.xy = r3.yz * r15.zz + r14.xw;
    r1.xy = r1.xy + r14.yz;
    r0.x = r0.w * 0.15915494 + 0.5;
    r3.xyz = r11.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r2.y;
    r4 = r12.wwww * LocalToWorld[3];
    r16.x = ps;
    r3.xyz = r11.zzz * LocalToWorld[2].xzy + r3.xzy;
    r4 = r12.zzzz * LocalToWorld[2] + r4;
    ps = (-0.5) + r2.z;
    r0.x = frac(r0.x);
    r16.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r4 = r12.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r3.xyz = r11.yyy * LocalToWorld[1].xyz + r3.xzy;
    r3.xyz = r11.xxx * LocalToWorld[0].xzy + r3.xzy;
    r4 = r12.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    ps = cos(r0.w);
    r10.zw = r16.xy * r0.yz;
    r0.x = ps;
    r14.xyz = -r4.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r3.xyz = r4.wzx - r3.yzx;
    r3.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r12 = r3.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r11 = r0.xxxx * CameraRight.wzyx;
    r1.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r14.zxy, r14.zxy);
    r0.x = ps;
    r11 = r3.wwww * CameraUp.wxzy + r11.xwyz;
    r12 = r0.xxxx * CameraUp.wxzy + r12.xwyz;
    ps = r1.w;
    r0.z = dot(r3.xzy, r3.xzy);
    ps = r11.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r16.y;
    r1.w = ps;
    ps = rsqrt(abs(r0.z));
    r17.xyz = r14.xyz * r1.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r15.xyz = r3.xyz * r0.yyy;
    r1.w = ps;
    a0 = xe_mova(r1.w);
    ps = r1.w;
    r14.xyz = r17.zxy * r15.yxz;
    r3.xyz = r17.zxy * AxisRotationVectors[a0].yzx;
    r3.yzw = r17.xzy * AxisRotationVectors[a0].yxz - r3.zyx;
    r14.xyz = r17.xzy * r15.yzx - r14.zyx;
    r0.y = dot(r14.xzy, r14.xzy);
    ps = r0.w;
    r0.z = dot(r3.ywz, r3.ywz);
    ps = r12.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r3.x = r0.w * r16.x;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r14.xyz = r14.xzy * r0.www;
    r0.y = ps;
    r0.yzw = r3.yzw * r0.yyy;
    r3.yzw = r0.wzy * AxisRotationVectors[a0].www;
    r0.yzw = (r1.www == 0.0) ? r3.ywz : AxisRotationVectors[a0].xzy;
    r3.yzw = (r1.www == 0.0) ? AxisRotationVectors[a0].xzy : r3.ywz;
    r3.yzw = r3.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r15.xzy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r3.yzw = r14.xzy * ParticleUpRightResultScalars.yyy + r3.zwy;
    r3.yzw = r12.yzw * ParticleUpRightResultScalars.xxx + r3.wyz;
    r0.yzw = r11.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r10.www * r0.yzw;
    r3.yzw = r10.zzz * r3.yzw;
    r3 = r4.ywzx + r3.xzwy;
    r3 = r3.xywz + r0.xwyz;
    r0 = r3.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r3.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r3.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r3.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r8.zw;
    o1.xy = r8.xy;
    o5.zw = r10.xy;
    o5.xy = 1.0;
    o9.xyz = r9.xyz;
    o9.w = 0.0;
    o4.xyz = r1.xyz;
    o4.w = 0.0;
    o6.xyz = r13.xyz;
    o6.w = 0.0;
    o7.xyz = r7.xyz;
    o7.w = 0.0;
    o8 = r5;
    o2 = r2.xwyz;
    o3 = r6;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord4 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    Out.texcoord8 = o7;
    Out.color0 = o8;
    Out.color1 = o9;
    return Out;
}
