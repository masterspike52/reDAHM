// vs_75fd97c40be58e46.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 480 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000780 0071000F 00000000 00000000 00007108 00000001 00000008 00000008 00000290 0010000E 0000300F 00006010 00005011 00001012 00015013 00025014 00235015 00003050 00013151 0002F252 0003F353 0004F454 0005F556 0006F657 0007F758 00001097 00001098 0000109D 0000109E 0000109A 00001099 0000109B 0000109C
//   vertex element: instruction 14 -> POSITION0
//   vertex element: instruction 15 -> NORMAL0
//   vertex element: instruction 16 -> TANGENT0
//   vertex element: instruction 17 -> TEXCOORD0
//   vertex element: instruction 18 -> BLENDWEIGHT0
//   vertex element: instruction 19 -> TEXCOORD1
//   vertex element: instruction 20 -> TEXCOORD2
//   vertex element: instruction 21 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD8 (flags 0xF)
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

    r8 = In.position0;
    r7 = In.normal0;
    r0.yz = In.tangent0.xy;
    r9.xy = In.texcoord0.xy;
    r0.w = In.blendweight0.x;
    r3.xy = In.texcoord1.xy;
    r1 = In.texcoord2.zwxy;
    r4 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r2.x = float((LightType.x >= 0.9));
    r2.w = ps;
    r9.zw = (r2.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r0.w * 0.15915494 + 0.5;
    r5 = r8.wwww * LocalToWorld[3];
    ps = frac(r0.x);
    r6.xyz = r7.www * LocalToWorld[3].xyz;
    r0.x = ps;
    r6.xyz = r7.zzz * LocalToWorld[2].xzy + r6.xzy;
    r5 = r8.zzzz * LocalToWorld[2] + r5;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r5 = r8.yyyy * LocalToWorld[1].xzwy + r5.xzwy;
    r6.xyz = r7.yyy * LocalToWorld[1].xyz + r6.xzy;
    r6.xyz = r7.xxx * LocalToWorld[0].xzy + r6.xzy;
    r15 = r8.xxxx * LocalToWorld[0].xwyz + r5.xzwy;
    r5.xyz = -r15.wzx + CameraWorldPosition.zyx;
    r6.yzw = r15.xzw - r6.xzy;
    r2.y = dot(r5.xzy, r5.xzy);
    ps = sin(r0.x);
    r2.z = dot(r6.wyz, r6.wyz);
    r13.x = ps;
    ps = cos(r0.x);
    r2.yz = max(r2.yz, 0.01);
    r13.y = ps;
    ps = rsqrt(abs(r2.y));
    r13.z = r13.y * (-1.0);
    r0.x = ps;
    ps = rsqrt(abs(r2.z));
    r12.yzw = r5.zyx * r0.xxx;
    r13.w = ps;
    ps = CameraUp.x;
    r11 = r13.yyyx * CameraRight.zyxx;
    ps = (-1.0) * ps;
    r5 = r13.xyxx * CameraRight.wwzy;
    r6.x = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r14 = r6.xwzy * r13.ywww;
    ps = r1.x;
    r6.xyz = r12.wyz * AxisRotationVectors[a0].yzx;
    r0.x = ps;
    r12.x = r13.z * CameraUp.z + r5.z;
    r10.yzw = r12.ywz * AxisRotationVectors[a0].yxz - r6.zyx;
    r6.xyz = r13.zxz * CameraUp.wwy + r5.xyw;
    r6.w = r13.z * CameraUp.x + r11.w;
    ps = r14.x;
    r5.xyz = -r14.wyz * ParticleUpRightResultScalars.yyy;
    r13.yzw = r13.xxx * CameraUp.zyx + r11.xyz;
    ps = r11.w + ps;
    r11.xyz = r12.wyz * r14.zyw;
    r13.x = ps;
    r11.xyz = r12.ywz * r14.zwy - r11.zyx;
    r5.yzw = r13.wzy * ParticleUpRightResultScalars.xxx + r5.xzy;
    ps = (-0.5) + r0.x;
    r6 = r6.zxyw * ParticleUpRightResultScalars.xxxx;
    r12.y = ps;
    ps = (-0.5) + r1.y;
    r6.yz = r6.yz * r0.yz;
    r12.z = ps;
    r10.x = r6.z * r12.z;
    r2.yz = r12.yz * r0.yz;
    r3.z = dot(r10.ywz, r10.ywz);
    r3.w = dot(r11.xzy, r11.xzy);
    r3.zw = max(r3.zw, 0.01);
    ps = rsqrt(abs(r3.w));
    r14.x = r6.y * r12.y;
    r0.x = ps;
    ps = rsqrt(abs(r3.z));
    r12.yzw = r11.xzy * r0.xxx;
    r0.x = ps;
    r10.yzw = r10.yzw * r0.xxx;
    r11.xyz = r10.wzy * AxisRotationVectors[a0].www;
    r3.zw = (-abs(r9.zw) >= 0.0) ? AxisRotationVectors[a0].zz : r11.zz;
    r10.yzw = (r2.www == 0.0) ? r11.xzy : AxisRotationVectors[a0].xzy;
    r12 = r12.xzwy * ParticleUpRightResultScalars.xyyy;
    r11 = (-abs(r9.wwzz) >= 0.0) ? AxisRotationVectors[a0].yxxy : r11.yxxy;
    r11.xy = r11.xy * ParticleUpRightResultScalars.zz + r5.zy;
    r6.xy = r6.xw + r12.zy;
    r6.z = r13.x * ParticleUpRightResultScalars.x + r12.y;
    r10.yzw = r10.zyw * ParticleUpRightResultScalars.zzz + r5.wyz;
    ps = r12.x + r12.w;
    r10.yzw = r2.zzz * r10.zwy;
    r5.x = ps;
    r13.xyz = r11.wzz * ParticleUpRightResultScalars.zzz + r6.xyz;
    r5.xy = r3.zw * ParticleUpRightResultScalars.zz + r5.xw;
    r14.yz = r2.yy * r13.zx;
    ps = r2.y;
    r6.xy = r5.xx * r11.yx;
    ps = r5.x * ps;
    r2.yz = r13.yx * r11.xy;
    r14.w = ps;
    ps = r2.y - r2.z;
    r6.zw = r13.xy * r5.yy;
    r12.x = ps;
    ps = r6.x - r6.w;
    r14 = r15 + r14.yxzw;
    r12.y = ps;
    ps = r6.z - r6.y;
    r10 = r14.yxzw + r10;
    r12.z = ps;
    r2.xyw = -r10.zyw * r2.xxx + LightPositionAndInvRadius.yxz;
    r6.xyw = -r10.zyw * CameraPosition.www + CameraPosition.yxz;
    r0.x = dot(r12.xzy, r12.xzy);
    ps = rsqrt(abs(r0.x));
    r3.zw = r10.xx * ViewProjectionMatrix[3].zw;
    r0.x = ps;
    r3.zw = r10.ww * ViewProjectionMatrix[2].zw + r3.zw;
    r5.z = r12.x * r0.x;
    r11.z = r12.y * r0.x;
    r3.zw = r10.zz * ViewProjectionMatrix[1].zw + r3.zw;
    r3.zw = r10.yy * ViewProjectionMatrix[0].zw + r3.zw;
    ps = r12.z;
    r10.yzw = r11.zyx * r6.xyx;
    ps = r0.x * ps;
    r11.xyz = r11.yxz * r2.yxx;
    r13.w = ps;
    ps = r11.x + r11.y;
    r12.xyz = r13.yxw * r2.yxy;
    r6.z = ps;
    ps = r12.x + r12.y;
    r2.xyz = r13.yxw * r6.yxy;
    r6.x = ps;
    ps = r2.x + r2.y;
    r6.y = r12.z + r11.z;
    r10.x = ps;
    ps = r10.z + r10.w;
    r10.y = r2.z + r10.y;
    r10.z = ps;
    r2.xyz = r5.xyz * r6.www + r10.xzy;
    r6.xyz = r5.xyz * r2.www + r6.xzy;
    r0.x = r0.w * 0.15915494 + 0.5;
    r11.xyz = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r1.x;
    r10 = r8.wwww * LocalToWorld[3];
    r14.x = ps;
    r11.xyz = r7.zzz * LocalToWorld[2].xyz + r11.xzy;
    r10 = r8.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r1.y;
    r0.x = frac(r0.x);
    r14.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r10 = r8.yyyy * LocalToWorld[1].xzwy + r10.xzwy;
    r7.yzw = r7.yyy * LocalToWorld[1].xzy + r11.xzy;
    r7.xyz = r7.xxx * LocalToWorld[0].xyz + r7.ywz;
    r8 = r8.xxxx * LocalToWorld[0].xwyz + r10.xzwy;
    ps = cos(r0.w);
    r9.zw = r14.xy * r0.yz;
    r0.x = ps;
    r12.xyz = -r8.xzw + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r7.xyz = r8.wzx - r7.zyx;
    r5.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r11 = r5.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r2.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r12.zxy, r12.zxy);
    r0.x = ps;
    r10 = r5.wwww * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r2.w;
    r0.z = dot(r7.xzy, r7.xzy);
    ps = r10.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x * r14.y;
    r2.w = ps;
    ps = rsqrt(abs(r0.z));
    r15.xyz = r12.xyz * r2.www;
    r0.y = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r7.zyx * r0.yyy;
    r2.w = ps;
    a0 = xe_mova(r2.w);
    ps = r2.w;
    r12.xyz = r15.zxy * r13.yzx;
    r7.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r7.yzw = r15.xzy * AxisRotationVectors[a0].yxz - r7.zyx;
    r12.xyz = r15.xzy * r13.yxz - r12.zyx;
    r0.y = dot(r12.xzy, r12.xzy);
    ps = r0.w;
    r0.z = dot(r7.ywz, r7.ywz);
    ps = r11.x * ps;
    r0.yz = max(r0.yz, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r7.x = r0.w * r14.x;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r12.xyz = r12.zxy * r0.www;
    r0.y = ps;
    r0.yzw = r7.wzy * r0.yyy;
    r7.yzw = r0.yzw * AxisRotationVectors[a0].www;
    r0.yzw = (r2.www == 0.0) ? r7.ywz : AxisRotationVectors[a0].xzy;
    r7.yzw = (r2.www == 0.0) ? AxisRotationVectors[a0].xzy : r7.ywz;
    r7.yzw = r7.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = r0.yzw * ParticleUpRightResultScalars.zzz;
    r0.yzw = -r13.zxy * ParticleUpRightResultScalars.yyy + r0.zyw;
    r7.yzw = r12.yzx * ParticleUpRightResultScalars.yyy + r7.zwy;
    r7.yzw = r11.yzw * ParticleUpRightResultScalars.xxx + r7.wyz;
    r0.yzw = r10.ywz * ParticleUpRightResultScalars.xxx + r0.zwy;
    r0.yzw = r9.www * r0.yzw;
    r7.yzw = r9.zzz * r7.yzw;
    r7 = r8.ywzx + r7.xzwy;
    r7 = r7.xywz + r0.xwyz;
    r0 = r7.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r7.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r9.xy;
    o1.xy = r3.xy;
    o5.zw = r3.zw;
    o5.xy = 1.0;
    o4.xyz = r6.xyz;
    o4.w = 0.0;
    o6.xyz = r2.xyz;
    o6.w = 0.0;
    o7.xyz = r5.xyz;
    o7.w = 0.0;
    o2 = r1.zwxy;
    o3 = r4;

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
    return Out;
}
