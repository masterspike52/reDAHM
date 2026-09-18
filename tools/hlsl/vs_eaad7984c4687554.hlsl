// vs_eaad7984c4687554.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000360 0021000A 00000000 00000000 00002863 00000001 00000006 00000003 00000290 00100007 00003008 00006009 0000500A 0000100B 0021500C 00003050 0001F151 0002F256 00001044 00001045 00001046
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TANGENT0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> BLENDWEIGHT0
//   vertex element: instruction 12 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
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
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r7 = In.position0;
    r3 = In.normal0.yzwx;
    r5.xy = In.tangent0.xy;
    r2.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r1 = In.texcoord1;
    r6.w = CameraUp.x * (-1.0);
    r4.xyz = r3.zzz * LocalToWorld[3].zyx;
    ps = 0.15915494 * r0.y;
    r8 = r7.wwww * LocalToWorld[3];
    r2.z = ps;
    r0 = r7.zzzz * LocalToWorld[2] + r8;
    r4.xyz = r3.yyy * LocalToWorld[2].zxy + r4.xzy;
    r3.xyz = r3.xxx * LocalToWorld[1].zyx + r4.xzy;
    r4 = r7.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r0.xyw = r2.xzy + float3(-0.5, 0.5, -0.5);
    r5.zw = r0.xw * r5.xy;
    r4 = r7.xxxx * LocalToWorld[0].xwyz + r4.xzwy;
    r3.xyz = r3.www * LocalToWorld[0].zxy + r3.xzy;
    ps = frac(r0.y);
    r6.xyz = r4.wzx - r3.xzy;
    r0.z = ps;
    r0.z = r0.z * 6.2831855 - 3.1415927;
    r3.xyz = -r4.zwx + CameraWorldPosition.yzx;
    r8.x = dot(r3.yzx, r3.yzx);
    ps = cos(r0.z);
    r8.w = dot(r6.xzy, r6.xzy);
    r8.z = ps;
    ps = sin(r0.z);
    r7.xyz = r8.zzz * CameraRight.xyz;
    r8.y = ps;
    r7.xyz = r8.yyy * CameraUp.xzy + r7.xzy;
    r0.yz = max(r8.xw, 0.01);
    ps = rsqrt(abs(r0.y));
    r8.x = r8.z * (-1.0);
    r2.w = ps;
    ps = rsqrt(abs(r0.z));
    r10.yzw = r3.xyz * r2.www;
    r8.w = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r3 = r8.xxxy * CameraUp.yzww;
    r0.z = ps;
    a0 = xe_mova(r0.z);
    ps = r0.z;
    r9 = r6 * r8.wwwz;
    r6.xyz = r10.zwy * AxisRotationVectors[a0].yzx;
    r10.x = r8.y * CameraRight.x + r9.w;
    r3.xy = r8.yy * CameraRight.yz + r3.xy;
    r3.zw = r8.yz * CameraRight.ww + r3.zw;
    r8.xzw = r10.zyw * r9.yzx;
    r6.xyz = r10.yzw * AxisRotationVectors[a0].zxy - r6.xyz;
    r8.y = dot(r6.zxy, r6.zxy);
    r10.yzw = r10.ywz * r9.xyz - r8.xzw;
    r8.x = dot(r10.zyw, r10.zyw);
    r3 = r3.xzyw * ParticleUpRightResultScalars.xxxx;
    r5.xy = r3.yw * r5.xy;
    r8.xy = max(r8.xy, 0.01);
    ps = rsqrt(abs(r8.x));
    r3.y = r5.x * r0.x;
    r2.w = ps;
    ps = rsqrt(abs(r8.y));
    r10.yzw = r10.ywz * r2.www;
    r2.w = ps;
    r6.xyz = r6.xyz * r2.www;
    r6.xyz = r6.xyz * AxisRotationVectors[a0].www;
    r8.xyz = (r0.zzz == 0.0) ? AxisRotationVectors[a0].xyz : r6.xyz;
    r6.xyz = (r0.zzz == 0.0) ? r6.xyz : AxisRotationVectors[a0].xyz;
    r10 = r10.xywz * ParticleUpRightResultScalars.xyyy;
    r6.xyz = r6.xzy * ParticleUpRightResultScalars.zzz;
    ps = r10.x + r10.y;
    r3.zw = r3.xz + r10.wz;
    r3.x = ps;
    r6.xyz = -r9.zyx * ParticleUpRightResultScalars.yyy + r6.xzy;
    r3.xzw = r8.xyz * ParticleUpRightResultScalars.zzz + r3.xzw;
    r6.xyz = r7.xyz * ParticleUpRightResultScalars.xxx + r6.xzy;
    r0.xyz = r5.www * r6.xyz;
    ps = r5.y;
    r3.xzw = r5.zzz * r3.xzw;
    ps = r0.w * ps;
    r3 = r4 + r3;
    r0.w = ps;
    r0 = r3.xwzy + r0;
    r3 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r3 = r0.yyyy * ViewProjectionMatrix[2].xwzy + r3;
    r3 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r3.xzwy;
    oPos = r0.xxxx * ViewProjectionMatrix[0] + r3.xzyw;
    o0.xy = r2.xy;
    o1 = r1;
    o2 = r0.xzyw;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    return Out;
}
