// vs_b75852a3a2b691be.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000039C 0041000C 00000000 00000000 000040A5 00000001 00000008 00000005 00000290 00100008 00003009 0000600A 0000500B 0000100C 0001500D 0002500E 0023500F 00003050 00013151 0002F252 0003F353 0004F456 00001047 00001048 00001049 0000104A 0000104B
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> TANGENT0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> BLENDWEIGHT0
//   vertex element: instruction 13 -> TEXCOORD1
//   vertex element: instruction 14 -> TEXCOORD2
//   vertex element: instruction 15 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
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
    float4 texcoord6 : TEXCOORD6;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r5 = In.position0;
    r6 = In.normal0;
    r10.xy = In.tangent0.xy;
    r3.zw = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r3.xy = In.texcoord1.xy;
    r2 = In.texcoord2;
    r1 = In.texcoord3;
    r0.x = r0.y * 0.15915494 + 0.5;
    r4 = r5.wwww * LocalToWorld[3];
    ps = frac(r0.x);
    r0.yzw = r6.www * LocalToWorld[3].zyx;
    r0.x = ps;
    r0.yzw = r6.zzz * LocalToWorld[2].zxy + r0.ywz;
    r4 = r5.zzzz * LocalToWorld[2] + r4;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r4 = r5.yyyy * LocalToWorld[1].xzwy + r4.xzwy;
    r0.yzw = r6.yyy * LocalToWorld[1].zyx + r0.ywz;
    r0.yzw = r6.xxx * LocalToWorld[0].zxy + r0.ywz;
    r5 = r5.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    ps = cos(r0.x);
    r7.w = CameraUp.x * (-1.0);
    r11.z = ps;
    r4.xyz = r11.zzz * CameraRight.xyz;
    r6.xyz = -r5.zwx + CameraWorldPosition.yzx;
    ps = sin(r0.x);
    r0.yzw = r5.wzx - r0.ywz;
    r11.y = ps;
    r8.xyz = r11.yyy * CameraUp.xzy + r4.xzy;
    r4.x = dot(r6.yzx, r6.yzx);
    r4.y = dot(r0.ywz, r0.ywz);
    r4.zw = max(r4.xy, 0.01);
    ps = rsqrt(abs(r4.z));
    r4.xy = r2.wz - 0.5;
    r0.x = ps;
    ps = rsqrt(abs(r4.w));
    r7.xyz = r6.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r0.yzw * r0.xxx;
    r4.z = ps;
    a0 = xe_mova(r4.z);
    ps = r4.z;
    r6.xyz = r7.yxz * r12.yzx;
    r0.xyz = r7.yzx * AxisRotationVectors[a0].yzx;
    r6.yzw = r7.xzy * r12.xyz - r6.xyz;
    r7.xyz = r7.xyz * AxisRotationVectors[a0].zxy - r0.xyz;
    r0.x = dot(r7.zxy, r7.zxy);
    r0.y = dot(r6.zyw, r6.zyw);
    r0.xz = max(r0.xy, 0.01);
    ps = rsqrt(abs(r0.x));
    r11.x = r11.z * (-1.0);
    r11.w = ps;
    r9 = r11.xxxy * CameraUp.yzww;
    r7 = r7 * r11.wwwz;
    r6.x = r11.y * CameraRight.x + r7.w;
    r9.xy = r11.yy * CameraRight.yz + r9.xy;
    r9.zw = r11.yz * CameraRight.ww + r9.zw;
    ps = rsqrt(abs(r0.z));
    r0.xyw = r7.xyz * AxisRotationVectors[a0].www;
    r0.z = ps;
    r7.xyz = (r4.zzz == 0.0) ? AxisRotationVectors[a0].xyz : r0.xyw;
    r0.xyw = (r4.zzz == 0.0) ? r0.xyw : AxisRotationVectors[a0].xyz;
    ps = ParticleUpRightResultScalars.z * r0.x;
    r6.yzw = r6.ywz * r0.zzz;
    r11.x = ps;
    ps = ParticleUpRightResultScalars.z * r0.w;
    r9 = r9 * ParticleUpRightResultScalars.xxxx;
    r11.y = ps;
    ps = ParticleUpRightResultScalars.z * r0.y;
    r6 = r6.xwzy * ParticleUpRightResultScalars.xyyy;
    r11.z = ps;
    r0.xyz = -r12.zyx * ParticleUpRightResultScalars.yyy + r11.xzy;
    r4.zw = r9.wz * r10.yx;
    r0.w = r4.z * r4.x;
    r4.xz = r4.yx * r10.xy;
    ps = r6.x + r6.w;
    r6.yz = r9.xy + r6.zy;
    r6.x = ps;
    r0.xyz = r8.xyz * ParticleUpRightResultScalars.xxx + r0.xzy;
    ps = r4.w;
    r0.xyz = r4.zzz * r0.xyz;
    r6.xyz = r7.xyz * ParticleUpRightResultScalars.zzz + r6.xyz;
    ps = r4.y * ps;
    r4.xzw = r4.xxx * r6.xyz;
    r4.y = ps;
    r4 = r5 + r4;
    r0 = r4.xwzy + r0;
    r4 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r4 = r0.yyyy * ViewProjectionMatrix[2].xwzy + r4;
    r4 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r4.xzyw;
    o0.xy = r3.zw;
    o1.xy = r3.xy;
    o2 = r2;
    o3 = r1;
    o4 = r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord6 = o4;
    return Out;
}
