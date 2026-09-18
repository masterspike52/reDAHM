// vs_8719a80a63b68ac3.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 300 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000004B0 0001000B 00000000 00000000 00001021 00000001 00000005 00000001 00000290 0010000A 0000300B 0000600C 0000500D 0030100E 0000F056 00001062
//   vertex element: instruction 10 -> POSITION0
//   vertex element: instruction 11 -> NORMAL0
//   vertex element: instruction 12 -> TANGENT0
//   vertex element: instruction 13 -> TEXCOORD0
//   vertex element: instruction 14 -> BLENDWEIGHT0
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
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
float4 PrevViewProjectionMatrix[4] : register(c16); // float4x4 (matrix_columns)
float4 StretchTimeScale : register(c20); // float4 // default: 1.0, 0.0, 0.0, 0.0
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
    float4 tangent0 : TANGENT0;
    float4 texcoord0 : TEXCOORD0;
    float4 blendweight0 : BLENDWEIGHT0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
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
    float4 o0 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;

    r3 = In.position0;
    r7 = In.normal0;
    r4.yw = In.tangent0.xy;
    r1.xy = In.texcoord0.xy;
    r0.x = In.blendweight0.x;
    r2 = r7.wwww * LocalToWorld[3].xzyw;
    r0.w = trunc(AxisRotationVectorSourceIndex.x);
    r6.zw = (r0.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r0.x * 0.15915494 + 0.5;
    r5 = r7.zzzz * LocalToWorld[2].xzyw + r2;
    r2 = r3.wwww * LocalToWorld[3];
    r0.x = frac(r0.x);
    r2 = r3.zzzz * LocalToWorld[2] + r2;
    r2 = r3.yyyy * LocalToWorld[1].xzwy + r2.xzwy;
    r5 = r7.yyyy * LocalToWorld[1].xzyw + r5;
    r7 = r7.xxxx * LocalToWorld[0].xzyw + r5;
    r2 = r3.xxxx * LocalToWorld[0].wxyz + r2.zxwy;
    r8.xyz = r2.yzw - r7.xzy;
    r1.z = 6.2831855 * r0.x;
    r0.xyz = r1.zxy + float3(-3.1415927, -0.5, -0.5);
    r4.x = CameraUp.x * (-1.0);
    r3.y = sin(r0.x);
    r6.xy = r0.yz * r4.yw;
    r0.x = cos(r0.x);
    r5 = r3.yyyy * CameraRight.zyxw;
    r1 = r0.xxxx * CameraRight.wzyx;
    r3.x = (-1.0) * r0.x;
    r1 = r3.yyyy * CameraUp.wyzx + r1.xzyw;
    r3 = r3.xxxx * CameraUp.wyzx + r5.wyxz;
    r3 = r3.wyzx * ParticleUpRightResultScalars.xxxx;
    r2.x = r6.x * r3.w + r2.x;
    r11.x = r3.w * r4.y;
    r9.xyz = -r2.wzy + CameraWorldPosition.zyx;
    r10.x = dot(r9.xzy, r9.xzy);
    r10.y = dot(r8.zxy, r8.zxy);
    r4.yz = max(r10.xy, 0.01);
    r1 = r1.xwyz * ParticleUpRightResultScalars.xxxx;
    r11.y = r1.x * r4.w;
    r4.w = rsqrt(abs(r4.y));
    r10.xyz = r9.zyx * r4.www;
    r4.y = rsqrt(abs(r4.z));
    r9.xyz = r8.zyx * r4.yyy;
    r1.yzw = -r9.zyx * ParticleUpRightResultScalars.yyy + r1.yzw;
    a0 = xe_mova(r0.w);
    r8.xyz = r10.zxy * r9.yxz;
    r4.yzw = r10.zxy * AxisRotationVectors[a0].yzx;
    r0.z = dot(r11.yx, r0.zy) + r7.w;
    r4.yzw = r10.xzy * AxisRotationVectors[a0].yxz - r4.wzy;
    r8.xyz = r10.xzy * r9.yzx - r8.zyx;
    r9.x = dot(r8.xzy, r8.xzy);
    r9.y = dot(r4.ywz, r4.ywz);
    r5.xy = max(r9.xy, 0.01);
    r1.x = r6.y * r1.x;
    r0.y = rsqrt(abs(r5.x));
    r8.xyz = r8.zxy * r0.yyy;
    r0.y = rsqrt(abs(r5.y));
    r4 = r4.xwzy * r0.xyyy;
    r8.w = r4.x + r5.z;
    r4.xyz = r4.yzw * AxisRotationVectors[a0].www;
    r0.xyw = (r0.www == 0.0) ? r4.xzy : AxisRotationVectors[a0].xzy;
    r5 = (-abs(r6.zzzw) >= 0.0) ? AxisRotationVectors[a0].xzyz : r4.xzyz;
    r4.xy = (-abs(r6.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r4.yx;
    r4.xy = r4.xy * ParticleUpRightResultScalars.zz + r1.zy;
    r4.z = r5.w * ParticleUpRightResultScalars.z + r1.w;
    r0.xyw = r0.ywx * ParticleUpRightResultScalars.zzz + r1.wzy;
    r8 = r8.xzyw * ParticleUpRightResultScalars.yyyx;
    r1.yzw = r6.yyy * r0.wxy;
    r3.xyz = r3.xzy + r8.xzy;
    r3.w = r8.w + r8.x;
    r5 = r5.yzxx * ParticleUpRightResultScalars.zzzz + r3.yzxw;
    r2.yzw = r6.xxx * r5.zyx + r2.yzw;
    r3.xyz = r5.xyz * r4.xyz;
    r0.xyw = r6.xxx * r5.wyx + r7.xzy;
    r0.xyw = r6.yyy * r4.yxz + r0.xyw;
    r3.xyz = r5.zxy * r4.xyz - r3.yzx;
    r1 = r2.xwzy + r1.xzwy;
    r2.w = dot(r3.xzy, r3.xzy);
    ps = rsqrt(abs(r2.w));
    r2.xyz = r1.yzw - r0.wyx;
    r2.w = ps;
    r3.xyz = r3.xzy * r2.www;
    r2.w = dot(r3.xyz, r2.xzy);
    p0 = (-r2.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r0.xy = float2((-abs(r0.xx) > 0.0));
        r2 = -r2.xxyz * StretchTimeScale.wxxx + r1;
        r1 = r2.xxxx * ViewProjectionMatrix[3].xwzy;
        r1 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r1;
        r1 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r1.xzwy;
        r1 = r2.wwww * ViewProjectionMatrix[0] + r1.xzyw;
    }
    if (!p0)
    {
        r3.xyz = r0.zzz * PrevViewProjectionMatrix[3].xyw;
        r2 = r1.xxxx * ViewProjectionMatrix[3].xwyz;
        r2 = r1.yyyy * ViewProjectionMatrix[2].xwyz + r2;
    }
    if (!p0)
    {
        if (!p0)
        {
            r3.xyz = r0.www * PrevViewProjectionMatrix[2].xyw + r3.xyz;
            r0.yzw = r0.yyy * PrevViewProjectionMatrix[1].xyw + r3.xyz;
            r2 = r1.zzzz * ViewProjectionMatrix[1].xwyz + r2;
            r1 = r1.wwww * ViewProjectionMatrix[0] + r2.xzwy;
            r0.xyz = r0.xxx * PrevViewProjectionMatrix[0].wxy + r0.wyz;
            ps = 1.0 / r0.x;
            r0.x = ps;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = 1.0 / r1.w;
            r0.xy = r0.yz * r0.xx;
            r0.z = ps;
            r0.xy = r1.xy * r0.zz - r0.xy;
        }
    }
    r1.z = r1.w * StretchTimeScale.y + r1.z;
    oPos = r1;
    o0.xy = r0.xy;
    o0.zw = 0.0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord6 = o0;
    return Out;
}
