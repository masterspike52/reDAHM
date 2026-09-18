// vs_dc1438fb03d20c63.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 516 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000810 00610012 00000000 00000000 00005CE7 00000001 00000008 00000007 00000290 0010000F 00003010 00006011 00005012 00001013 00015014 00025015 00235016 00003050 00013151 0002F252 0003F353 0004F455 00057556 0006F657 000010A4 000010A5 000010A7 000010A8 000010A9 000010A6 000010AA
//   vertex element: instruction 15 -> POSITION0
//   vertex element: instruction 16 -> NORMAL0
//   vertex element: instruction 17 -> TANGENT0
//   vertex element: instruction 18 -> TEXCOORD0
//   vertex element: instruction 19 -> BLENDWEIGHT0
//   vertex element: instruction 20 -> TEXCOORD1
//   vertex element: instruction 21 -> TEXCOORD2
//   vertex element: instruction 22 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
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
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r8 = In.position0;
    r7 = In.normal0;
    r0.yz = In.tangent0.xy;
    r4.xy = In.texcoord0.xy;
    r4.z = In.blendweight0.x;
    r2.zw = In.texcoord1.xy;
    r3 = In.texcoord2.xzwy;
    r9 = In.texcoord3;
    r15.x = CameraUp.x * (-1.0);
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r10 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r0.w = ps;
    r17.xy = (r0.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r4.z * 0.15915494 + 0.5;
    r1.xyz = r7.www * LocalToWorld[3].xyz;
    r5.xyz = r7.zzz * LocalToWorld[2].xzy + r1.xzy;
    ps = frac(r0.x);
    r1 = r8.wwww * LocalToWorld[3];
    r0.x = ps;
    r1 = r8.zzzz * LocalToWorld[2] + r1;
    r1 = r8.yyyy * LocalToWorld[1] + r1;
    r0.x = r0.x * 6.2831855 - 3.1415927;
    r5.xyz = r7.yyy * LocalToWorld[1].xyz + r5.xzy;
    r12.xyz = r7.xxx * LocalToWorld[0].xzy + r5.xzy;
    ps = sin(r0.x);
    r11 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    r2.y = ps;
    r1 = r8.xxxx * LocalToWorld[0].yxzw + r1.yxzw;
    ps = cos(r0.x);
    r6.xw = r3.yz - 0.5;
    r2.x = ps;
    ps = r1.z;
    r6.yz = r6.xw * r0.yz;
    r0.x = ps;
    ps = CameraWorldPosition.z - r0.x;
    r13 = r2.yyyy * CameraRight.zywx;
    r14.y = ps;
    ps = CameraWorldPosition.y - r1.x;
    r5 = r2.xxxx * CameraRight.wzyx;
    r14.z = ps;
    ps = CameraWorldPosition.x - r1.y;
    r15.yzw = r1.yxz - r12.xzy;
    r14.w = ps;
    r16.x = dot(r14.ywz, r14.ywz);
    ps = (-1.0) * r2.x;
    r16.y = dot(r15.wyz, r15.wyz);
    r0.x = ps;
    r5 = r2.yyyy * CameraUp.wyzx + r5.xzyw;
    r12 = r0.xxxx * CameraUp.wyzx + r13.zyxw;
    r12 = r12.ywzx * ParticleUpRightResultScalars.xxxx;
    ps = r12.w;
    r5 = r5.xwyz * ParticleUpRightResultScalars.xxxx;
    ps = r0.y * ps;
    r13.xy = max(r16.xy, 0.01);
    r0.x = ps;
    ps = rsqrt(abs(r13.x));
    r14.x = r0.x * r6.x;
    r0.x = ps;
    ps = rsqrt(abs(r13.y));
    r18.xyz = r14.wzy * r0.xxx;
    r2.y = ps;
    a0 = xe_mova(r0.w);
    ps = r0.w;
    r15 = r15.xwzy * r2.xyyy;
    r14.yzw = r18.zxy * AxisRotationVectors[a0].yzx;
    r13.xyz = -r15.wzy * ParticleUpRightResultScalars.yyy + r5.yzw;
    r16.xyz = r18.zxy * r15.zyw;
    r14.yzw = r18.xzy * AxisRotationVectors[a0].yxz - r14.wzy;
    r2.x = dot(r14.ywz, r14.ywz);
    r15.yzw = r18.xzy * r15.zwy - r16.zyx;
    r2.y = dot(r15.ywz, r15.ywz);
    r2.xy = max(r2.xy, 0.01);
    ps = rsqrt(abs(r2.y));
    r15.x = r15.x + r13.w;
    r0.x = ps;
    ps = rsqrt(abs(r2.x));
    r15.yzw = r15.ywz * r0.xxx;
    r0.x = ps;
    r14.yzw = r14.yzw * r0.xxx;
    r5.yzw = r14.wzy * AxisRotationVectors[a0].www;
    r14.yzw = (r0.www == 0.0) ? r5.ywz : AxisRotationVectors[a0].xzy;
    r16 = r15.xzwy * ParticleUpRightResultScalars.xyyy;
    r15 = (-abs(r17.xxxy) >= 0.0) ? AxisRotationVectors[a0].xzyz : r5.ywzw;
    r0.xw = (-abs(r17.yy) >= 0.0) ? AxisRotationVectors[a0].yx : r5.zy;
    r5.yz = r0.wx * ParticleUpRightResultScalars.zz + r13.xy;
    r5.w = r15.w * ParticleUpRightResultScalars.z + r13.z;
    r12.xyz = r12.xzy + r16.zwy;
    r13.xyz = r14.zwy * ParticleUpRightResultScalars.zzz + r13.zyx;
    ps = r16.x + r16.y;
    r13.yzw = r6.zzz * r13.zxy;
    r12.w = ps;
    r12 = r15.yxzx * ParticleUpRightResultScalars.zzzz + r12.yzxw;
    ps = r5.x;
    r14.yzw = r6.yyy * r12.wzx;
    ps = r0.z * ps;
    r15.xyz = r12.xyz * r5.zwy;
    r0.x = ps;
    r6.xyz = r12.yxz * r5.zyw - r15.zyx;
    ps = r0.x;
    r1 = r1.wzxy + r14.xwzy;
    ps = r6.w * ps;
    r0.x = dot(r6.xzy, r6.xzy);
    r13.x = ps;
    ps = rsqrt(abs(r0.x));
    r1 = r1.yxzw + r13.zxwy;
    r0.x = ps;
    r14.xyz = r6.xyz * r0.xxx;
    ps = r1.w;
    r6 = r1.yyyy * ViewProjectionMatrix[3].xwzy;
    r0.w = ps;
    r13.xyz = -r1.xzw * CameraPosition.www + CameraPosition.zyx;
    ps = -CameraPosition.x - -r0.w;
    r5.x = dot(r12.xyz, r13.xzy);
    r12.x = ps;
    ps = -CameraPosition.y - -r1.z;
    r5.y = dot(r5.wyz, r13.xzy);
    r12.y = ps;
    ps = -CameraPosition.z - -r1.x;
    r5.z = dot(r14.xzy, r13.xzy);
    r12.z = ps;
    r6 = r1.xxxx * ViewProjectionMatrix[2].xwzy + r6;
    r0.w = dot(r12.zxy, r12.zxy);
    ps = sqrt(abs(r0.w));
    r0.x = float((0.001 >= abs(r12.z)));
    r0.w = ps;
    r0.x = (r0.x == 0.0) ? r12.z : 0.001;
    r6 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r6.xzwy;
    r6 = r1.wwww * ViewProjectionMatrix[0] + r6.xzyw;
    ps = 1.0 / r0.x;
    r1 = r0.wwww - FogStartDistance.wzyx;
    r0.x = ps;
    r12 = saturate(r11.wzyx * r0.xxxx);
    r10 = saturate(r10.wzyx * r0.xxxx);
    r11 = max(r1, 0.0);
    r1.xyz = r11.xyz * FogDistanceScale.wzy;
    r10 = r12.wzyx - r10.wzyx;
    r1.xyz = r1.xzy * abs(r10.xzy);
    ps = pow(2.0, r1.y);
    r0.x = abs(r10.w) * FogDistanceScale.x;
    r1.y = ps;
    ps = pow(2.0, r1.z);
    r10 = abs(r10) * r11;
    r1.z = ps;
    ps = pow(2.0, r1.x);
    r0.x = r0.x * r11.w;
    r1.w = ps;
    ps = pow(2.0, r0.x);
    r10 = float4((FogExtinctionDistance.wzyx > r10));
    r1.x = ps;
    r11 = r10.wzyx * r1;
    ps = r11.y * r11.x;
    r1 = r11.zwyx - 1.0;
    r13.w = ps;
    ps = r1.x;
    r10.xyz = r1.yyy * FogInScattering[3].xyz;
    r0.w = ps;
    ps = FogInScattering[2].x * r0.w;
    r13.xyz = r1.www * FogInScattering[0].xyz;
    r12.x = ps;
    ps = FogInScattering[2].y * r1.x;
    r13 = r11.yyyz * r13;
    r12.y = ps;
    ps = FogInScattering[2].z * r1.x;
    r1.y = r11.w * r13.w;
    r12.z = ps;
    r1.xzw = r1.zzz * FogInScattering[1].xyz + r13.xyz;
    r1.xzw = r11.zzz * r1.xzw + r12.xyz;
    r1.xzw = r11.www * r1.xzw + r10.xyz;
    r0.x = r4.z * 0.15915494 + 0.5;
    r10.xyz = r7.www * LocalToWorld[3].xzy;
    ps = (-0.5) + r3.y;
    r11 = r8.wwww * LocalToWorld[3];
    r14.x = ps;
    r10.xyz = r7.zzz * LocalToWorld[2].xyz + r10.xzy;
    r11 = r8.zzzz * LocalToWorld[2] + r11;
    ps = (-0.5) + r3.z;
    r0.x = frac(r0.x);
    r14.y = ps;
    r0.w = r0.x * 6.2831855 - 3.1415927;
    r11 = r8.yyyy * LocalToWorld[1] + r11;
    r7.yzw = r7.yyy * LocalToWorld[1].xzy + r10.xzy;
    r10.xyz = r7.xxx * LocalToWorld[0].xyz + r7.ywz;
    r8 = r8.xxxx * LocalToWorld[0] + r11;
    ps = cos(r0.w);
    r2.xy = r14.xy * r0.yz;
    r0.x = ps;
    r7.xyz = -r8.xyz + CameraWorldPosition.xyz;
    ps = sin(r0.w);
    r12.xyz = r8.xyz - r10.xyz;
    r4.z = ps;
    ps = ParticleUpRightResultScalars.x * r0.y;
    r11 = r4.zzzz * CameraRight.wzyx;
    r4.w = ps;
    ps = ParticleUpRightResultScalars.x * r0.z;
    r10 = r0.xxxx * CameraRight.wzyx;
    r0.w = ps;
    ps = (-1.0) * r0.x;
    r0.y = dot(r7.zxy, r7.zxy);
    r0.x = ps;
    r10 = r4.zzzz * CameraUp.wxzy + r10.xwyz;
    r11 = r0.xxxx * CameraUp.wxzy + r11.xwyz;
    ps = r0.w;
    r0.z = dot(r12.zxy, r12.zxy);
    ps = r10.x * ps;
    r0.xy = max(r0.yz, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r0.w = r0.z * r14.y;
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r7.xyz * r0.zzz;
    r0.x = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r13.xyz = r12.zyx * r0.xxx;
    r4.z = ps;
    a0 = xe_mova(r4.z);
    ps = r4.z;
    r12.xyz = r7.zxy * r13.yxz;
    r0.xyz = r7.zxy * AxisRotationVectors[a0].yzx;
    r12.xyz = r7.xzy * r13.yzx - r12.zyx;
    r7.xyz = r7.xzy * AxisRotationVectors[a0].yxz - r0.zyx;
    r0.x = dot(r7.xzy, r7.xzy);
    ps = r4.w;
    r0.y = dot(r12.xzy, r12.xzy);
    ps = r11.x * ps;
    r0.xy = max(r0.xy, 0.01);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r7.w = r0.z * r14.x;
    r0.z = ps;
    ps = rsqrt(abs(r0.x));
    r12.xyz = r12.zyx * r0.zzz;
    r0.x = ps;
    r0.xyz = r7.zyx * r0.xxx;
    r7.xyz = r0.xyz * AxisRotationVectors[a0].www;
    r0.xyz = (r4.zzz == 0.0) ? r7.xyz : AxisRotationVectors[a0].xyz;
    r7.xyz = (r4.zzz == 0.0) ? AxisRotationVectors[a0].xyz : r7.xyz;
    r7.xyz = r7.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.zzz;
    r0.xyz = -r13.xzy * ParticleUpRightResultScalars.yyy + r0.yxz;
    r7.xyz = r12.zxy * ParticleUpRightResultScalars.yyy + r7.yxz;
    r7.xyz = r11.ywz * ParticleUpRightResultScalars.xxx + r7.yzx;
    r0.xyz = r10.ywz * ParticleUpRightResultScalars.xxx + r0.yzx;
    r0.xyz = r2.yyy * r0.xyz;
    r7.xyz = r2.xxx * r7.xyz;
    r7 = r8.xzyw + r7.xzyw;
    r7 = r7.xzyw + r0;
    r0 = r7.wwww * ViewProjectionMatrix[3].xwzy;
    r0 = r7.zzzz * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r7.xxxx * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r4.xy;
    o1.xy = r2.zw;
    o5.xyz = r5.xyz;
    o2 = r3.xwyz;
    o3 = r9;
    o4 = r6;
    o6 = r1.xzwy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    return Out;
}
