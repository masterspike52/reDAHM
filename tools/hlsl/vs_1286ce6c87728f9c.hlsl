// vs_1286ce6c87728f9c.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 504 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000007E0 00410012 00000000 00000000 000044A5 00000001 00000006 00000005 00000290 0010000F 00003010 00006011 00005012 00001013 00215014 00003050 0001F151 0002F255 00037356 0004F457 000010A2 000010A4 000010A5 000010A3 000010A6
//   vertex element: instruction 15 -> POSITION0
//   vertex element: instruction 16 -> NORMAL0
//   vertex element: instruction 17 -> TANGENT0
//   vertex element: instruction 18 -> TEXCOORD0
//   vertex element: instruction 19 -> BLENDWEIGHT0
//   vertex element: instruction 20 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AxisRotationVectorSourceIndex : register(c21); // float
float4 AxisRotationVectors[2] : register(c22); // float4[2]
float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c15); // float4
float4 CameraUp : register(c16); // float4
float4 CameraWorldPosition : register(c14); // float4
float4 FogDistanceScale : register(c5); // float4
float4 FogExtinctionDistance : register(c6); // float4
float4 FogInScattering[4] : register(c7); // float3[4]
float4 FogMaxHeight : register(c13); // float4
float4 FogMinHeight : register(c12); // float4
float4 FogStartDistance : register(c11); // float4
float4 LocalToWorld[4] : register(c17); // float4x4 (matrix_columns)
float4 ParticleUpRightResultScalars : register(c24); // float3
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
    float4 texcoord5 : TEXCOORD5;
    float4 texcoord6 : TEXCOORD6;
    float4 texcoord7 : TEXCOORD7;
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
    float4 r18 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r6 = In.position0;
    r5 = In.normal0;
    r1.yz = In.tangent0.xy;
    r0.yz = In.texcoord0.xy;
    r3.w = In.blendweight0.x;
    r4 = In.texcoord1;
    r14.x = CameraUp.x * (-1.0);
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.w = ps;
    r16.xy = (r0.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r3.w * 0.15915494 + 0.5;
    r2.xyz = r5.www * LocalToWorld[3].xyz;
    r3.xyz = r5.zzz * LocalToWorld[2].xzy + r2.xzy;
    ps = frac(r0.x);
    r2 = r6.wwww * LocalToWorld[3];
    r0.x = ps;
    r2 = r6.zzzz * LocalToWorld[2] + r2;
    r2 = r6.yyyy * LocalToWorld[1] + r2;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r3.xyz = r5.yyy * LocalToWorld[1].xyz + r3.xzy;
    r12.xyz = r5.xxx * LocalToWorld[0].xzy + r3.xzy;
    ps = sin(r0.x);
    r9 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r1.w = ps;
    r2 = r6.xxxx * LocalToWorld[0].yxzw + r2.yxzw;
    ps = cos(r0.x);
    r7.xy = r0.zy - 0.5;
    r1.x = ps;
    ps = r2.z;
    r3.xy = r7.yx * r1.yz;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r13 = r1.wwww * CameraRight.xzyw;
    r11.y = ps;
    ps = CameraWorldPosition.y - r2.x;
    r10 = r1.xxxx * CameraRight.wzyx;
    r11.z = ps;
    ps = CameraWorldPosition.x - r2.y;
    r14.yzw = r2.yxz - r12.xzy;
    r11.w = ps;
    r7.z = dot(r11.ywz, r11.ywz);
    ps = (-1.0) * r1.x;
    r7.w = dot(r14.wyz, r14.wyz);
    r0.x = ps;
    r10 = r1.wwww * CameraUp.wyzx + r10.xzyw;
    r12 = r0.xxxx * CameraUp.wyzx + r13.wzyx;
    r12 = r12.ywzx * ParticleUpRightResultScalars.xxxx;
    ps = r12.w;
    r10 = r10.xwyz * ParticleUpRightResultScalars.xxxx;
    ps = r1.y * ps;
    r7.zw = max(r7.zw, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r7.z));
    r11.x = r0.x * r7.y;
    r0.x = ps;
    ps = rsqrt(abs(r7.w));
    r18.xyz = r11.wzy * r0.xxx;
    r1.w = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r15 = r14.xwzy * r1.xwww;
    r14.xyz = r18.zxy * AxisRotationVectors[a0].yzx;
    r11.yzw = -r15.wzy * ParticleUpRightResultScalars.yyy + r10.yzw;
    r17.xyz = r18.zxy * r15.zyw;
    r14.xyz = r18.xzy * AxisRotationVectors[a0].yxz - r14.zyx;
    r1.x = dot(r14.xzy, r14.xzy);
    r13.yzw = r18.xzy * r15.zwy - r17.zyx;
    r1.w = dot(r13.ywz, r13.ywz);
    r1.xw = max(r1.xw, 0.01);
    ps = rsqrt(abs(r1.w));
    r13.x = r15.x + r13.x;
    r0.x = ps;
    ps = rsqrt(abs(r1.x));
    r13.yzw = r13.ywz * r0.xxx;
    r0.x = ps;
    r14.xyz = r14.xyz * r0.xxx;
    r7.yzw = r14.zyx * AxisRotationVectors[a0].www;
    r15.xyz = (r0.www == 0.0) ? r7.ywz : AxisRotationVectors[a0].xzy;
    r14 = r13.xzwy * ParticleUpRightResultScalars.xyyy;
    r13 = (-abs(r16.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r7.ywzw;
    r0.xw = (-abs(r16.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r7.zy;
    r10.yz = r0.wx * ParticleUpRightResultScalars.zz + r11.yz;
    r10.w = r13.w * ParticleUpRightResultScalars.z + r11.w;
    r12.xyz = r12.xzy + r14.zwy;
    r11.yzw = r15.yzx * ParticleUpRightResultScalars.zzz + r11.wzy;
    ps = r14.x + r14.y;
    r7.yzw = r3.yyy * r11.wyz;
    r12.w = ps;
    r13 = r13.yxzx * ParticleUpRightResultScalars.zzzz + r12.yzxw;
    ps = r10.x;
    r11.yzw = r3.xxx * r13.wzx;
    ps = r1.z * ps;
    r3.xyz = r13.xyz * r10.zwy;
    r0.x = ps;
    r3.xyz = r13.yxz * r10.zyw - r3.zyx;
    ps = r0.x;
    r2 = r2.wzxy + r11.xwzy;
    ps = r7.x * ps;
    r0.x = dot(r3.xzy, r3.xzy);
    r7.x = ps;
    ps = rsqrt(abs(r0.x));
    r2 = r2.yxzw + r7.zxwy;
    r0.x = ps;
    r12.xyz = r3.xyz * r0.xxx;
    ps = r2.w;
    r7 = r2.yyyy * ViewProjectionMatrix[3].xwzy;
    r0.w = ps;
    r11.xyz = -r2.xzw * CameraPosition.www + CameraPosition.zyx;
    ps = -CameraPosition.x - -r0.w;
    r3.x = dot(r13.xyz, r11.xzy);
    r10.x = ps;
    ps = -CameraPosition.y - -r2.z;
    r3.y = dot(r10.wyz, r11.xzy);
    r10.y = ps;
    ps = -CameraPosition.z - -r2.x;
    r3.z = dot(r12.xzy, r11.xzy);
    r10.z = ps;
    r7 = r2.xxxx * ViewProjectionMatrix[2].xwzy + r7;
    r0.w = dot(r10.zxy, r10.zxy);
    ps = sqrt(abs(r0.w));
    r0.x = float((0.001 >= abs(r10.z)));
    r0.w = ps;
    r0.x = (r0.x == 0.0) ? r10.z : 0.001;
    r7 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r7.xzwy;
    r7 = r2.wwww * ViewProjectionMatrix[0] + r7.xzyw;
    ps = 1.0 / r0.x;
    r2 = r0.wwww - FogStartDistance.wzyx;
    r0.x = ps;
    r10 = saturate(r9.wzyx * r0.xxxx);
    r8 = saturate(r8.wzyx * r0.xxxx);
    r9 = max(r2, 0.0);
    r2.xyz = r9.xyz * FogDistanceScale.wzy;
    r8 = r10.wzyx - r8.wzyx;
    r2.xyz = r2.xzy * abs(r8.xzy);
    ps = pow(2.0, r2.y);
    r0.x = abs(r8.w) * FogDistanceScale.x;
    r2.y = ps;
    ps = pow(2.0, r2.z);
    r8 = abs(r8) * r9;
    r2.z = ps;
    ps = pow(2.0, r2.x);
    r0.x = r0.x * r9.w;
    r2.w = ps;
    ps = pow(2.0, r0.x);
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    r2.x = ps;
    r9 = r8.wzyx * r2;
    ps = r9.y * r9.x;
    r2 = r9.zwyx - 1.0;
    r11.w = ps;
    ps = r2.x;
    r8.xyz = r2.yyy * FogInScattering[3].xyz;
    r0.w = ps;
    ps = FogInScattering[2].x * r0.w;
    r11.xyz = r2.www * FogInScattering[0].xyz;
    r10.x = ps;
    ps = FogInScattering[2].y * r2.x;
    r11 = r9.yyyz * r11;
    r10.y = ps;
    ps = FogInScattering[2].z * r2.x;
    r2.y = r9.w * r11.w;
    r10.z = ps;
    r2.xzw = r2.zzz * FogInScattering[1].xyz + r11.xyz;
    r2.xzw = r9.zzz * r2.xzw + r10.xyz;
    r2.xzw = r9.www * r2.xzw + r8.xyz;
    r0.x = r3.w * 0.15915494 + 0.5;
    r8.xyw = r5.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r0.y;
    r10 = r6.wwww * LocalToWorld[3];
    r8.z = ps;
    r9.xyz = r5.zzz * LocalToWorld[2].xyz + r8.xwy;
    r10 = r6.zzzz * LocalToWorld[2] + r10;
    ps = (-0.5) + r0.z;
    r0.x = frac(r0.x);
    r8.w = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r10 = r6.yyyy * LocalToWorld[1] + r10;
    r5.yzw = r5.yyy * LocalToWorld[1].xzy + r9.xzy;
    r9.xyz = r5.xxx * LocalToWorld[0].xyz + r5.ywz;
    r6 = r6.xxxx * LocalToWorld[0] + r10;
    ps = cos(r0.w);
    r8.xy = r8.zw * r1.yz;
    r0.x = ps;
    r5.xyz = -r6.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r11.xyz = r6.xyz - r9.xyz;
    r1.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.y;
    r10 = r1.wwww * CameraRight.wzyx;
    r0.w = ps;
    ps = ParticleUpRightResultScalars.x * r1.z;
    r9 = r0.xxxx * CameraRight.wzyx;
    r1.z = ps;
    ps = (-1.0) * r0.x;
    r1.x = dot(r5.zxy, r5.zxy);
    r0.x = ps;
    r9 = r1.wwww * CameraUp.wxzy + r9.xwyz;
    r10 = r0.xxxx * CameraUp.wxzy + r10.xwyz;
    ps = r1.z;
    r1.y = dot(r11.zxy, r11.zxy);
    ps = r9.x * ps;
    r1.xy = max(r1.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r1.x));
    r1.w = r0.x * r8.w;
    r0.x = ps;
    ps = rsqrt(abs(r1.y));
    r5.xyz = r5.xyz * r0.xxx;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r12.xyz = r11.zyx * r0.xxx;
    r0.x = ps;
    a0 = xe_mova(r0.x);
    ps = r0.x;
    r11.xyz = r5.zxy * r12.yxz;
    r1.xyz = r5.zxy * AxisRotationVectors[a0].yzx;
    r11.xyz = r5.xzy * r12.yzx - r11.zyx;
    r1.xyz = r5.xzy * AxisRotationVectors[a0].yxz - r1.zyx;
    r5.x = dot(r1.xzy, r1.xzy);
    ps = r0.w;
    r5.y = dot(r11.xzy, r11.xzy);
    ps = r10.x * ps;
    r5.xy = max(r5.xy, 0.01);
    r0.w = ps;
    ps = rsqrt(abs(r5.y));
    r5.w = r0.w * r8.z;
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r11.xyz = r11.zyx * r0.www;
    r0.w = ps;
    r1.xyz = r1.zyx * r0.www;
    r5.xyz = r1.xyz * AxisRotationVectors[a0].www;
    r1.xyz = (r0.xxx == 0.0) ? r5.xyz : AxisRotationVectors[a0].xyz;
    r5.xyz = (r0.xxx == 0.0) ? AxisRotationVectors[a0].xyz : r5.xyz;
    r5.xyz = r5.xzy * ParticleUpRightResultScalars.zzz;
    r1.xyz = r1.xzy * ParticleUpRightResultScalars.zzz;
    r1.xyz = -r12.xzy * ParticleUpRightResultScalars.yyy + r1.yxz;
    r5.xyz = r11.zxy * ParticleUpRightResultScalars.yyy + r5.yxz;
    r5.xyz = r10.ywz * ParticleUpRightResultScalars.xxx + r5.yzx;
    r1.xyz = r9.ywz * ParticleUpRightResultScalars.xxx + r1.yzx;
    r1.xyz = r8.yyy * r1.xyz;
    r5.xyz = r8.xxx * r5.xyz;
    r5 = r6.xzyw + r5.xzyw;
    r5 = r5.xzyw + r1;
    r1 = r5.wwww * ViewProjectionMatrix[3].xwzy;
    r1 = r5.zzzz * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r5.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r5.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r0.yz;
    o3.xyz = r3.xyz;
    o1 = r4;
    o2 = r7;
    o4 = r2.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord5 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    return Out;
}
