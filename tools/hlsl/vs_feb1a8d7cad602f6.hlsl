// vs_feb1a8d7cad602f6.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 576 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000900 00810013 00000000 00000000 00007D29 00000001 00000008 00000009 00000290 00100011 00003012 00006013 00005014 00001015 00015016 00025017 00235018 00003050 00013151 0002F252 0003F353 0004F455 00057556 0006F657 0007F7A0 0008F8A1 000010B6 000010B7 000010BB 000010BC 000010BD 000010B9 000010BE 000010BA 000010B8
//   vertex element: instruction 17 -> POSITION0
//   vertex element: instruction 18 -> NORMAL0
//   vertex element: instruction 19 -> TANGENT0
//   vertex element: instruction 20 -> TEXCOORD0
//   vertex element: instruction 21 -> BLENDWEIGHT0
//   vertex element: instruction 22 -> TEXCOORD1
//   vertex element: instruction 23 -> TEXCOORD2
//   vertex element: instruction 24 -> TEXCOORD3
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 o6 = 0.0;
    float4 o7 = 0.0;
    float4 o8 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    int a0 = 0;

    r10 = In.position0;
    r9 = In.normal0;
    r4.xy = In.tangent0.xy;
    r6.xy = In.texcoord0.xy;
    r5.w = In.blendweight0.x;
    r4.zw = In.texcoord1.xy;
    r1 = In.texcoord2.zwxy;
    r2 = In.texcoord3;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r0.w = CameraUp.x * (-1.0);
    r7.w = ps;
    r6.zw = (r7.ww == 0.0) ? float2(0.0, 1.0) : float2(1.0, 0.0);
    r0.x = r5.w * 0.15915494 + 0.5;
    r3 = r10.wwww * LocalToWorld[3].xwzy;
    ps = frac(r0.x);
    r5.xyz = r9.www * LocalToWorld[3].xzy;
    r0.x = ps;
    r5.xyz = r9.zzz * LocalToWorld[2].xyz + r5.xzy;
    r3 = r10.zzzz * LocalToWorld[2].xwzy + r3;
    r0.y = r0.x * 6.2831855 - 3.1415927;
    r3 = r10.yyyy * LocalToWorld[1].xzyw + r3.xzwy;
    r5.xyz = r9.yyy * LocalToWorld[1].xzy + r5.xzy;
    r5.xyz = r9.xxx * LocalToWorld[0].xyz + r5.xzy;
    r17 = r10.xxxx * LocalToWorld[0].xywz + r3.xzwy;
    ps = cos(r0.y);
    r18.z = r1.y - 0.5;
    r0.x = ps;
    r3.xyz = r0.xxx * CameraRight.zyx;
    r8.xyz = -r17.wyx + CameraWorldPosition.zyx;
    ps = sin(r0.y);
    r5.xyz = r17.wyx - r5.zyx;
    r0.z = ps;
    r13.xyz = r0.zzz * CameraUp.zxy + r3.xzy;
    r7.x = dot(r8.xzy, r8.xzy);
    ps = (-1.0) * r0.x;
    r7.y = dot(r5.xzy, r5.xzy);
    r0.y = ps;
    ps = r0.w;
    r3.xyz = r0.yyy * CameraUp.zyx;
    ps = r0.x * ps;
    r11.xy = r0.zx * CameraRight.ww;
    r3.w = ps;
    r3 = r0.zzzz * CameraRight.zxyx + r3.xzyw;
    r0.xy = r0.zy * CameraUp.ww + r11.yx;
    r0.zw = max(r7.xy, 0.01);
    ps = rsqrt(abs(r0.z));
    r11.z = r0.y * ParticleUpRightResultScalars.x;
    r7.x = ps;
    ps = rsqrt(abs(r0.w));
    r8.xyz = r8.xyz * r7.xxx;
    r0.z = ps;
    r12.xyz = r5.zyx * r0.zzz;
    r11.xyw = r8.xzy * r12.yzx;
    a0 = xe_mova(r7.w);
    ps = r7.w;
    r5.xyz = -r12.xyz * ParticleUpRightResultScalars.yyy;
    r7.xyz = r8.xzy * AxisRotationVectors[a0].yzx;
    r5.xyz = r13.yxz * ParticleUpRightResultScalars.xxx + r5.xzy;
    r0.yzw = r8.zxy * r12.yxz - r11.wyx;
    r7.xyz = r8.zxy * AxisRotationVectors[a0].yxz - r7.zyx;
    r8.x = dot(r7.xzy, r7.xzy);
    r8.y = dot(r0.ywz, r0.ywz);
    r8.xy = max(r8.xy, 0.01);
    ps = rsqrt(abs(r8.x));
    r18.w = r0.x * ParticleUpRightResultScalars.x;
    r0.x = ps;
    ps = rsqrt(abs(r8.y));
    r7.xyz = r7.zyx * r0.xxx;
    r0.x = ps;
    r0.xyz = r0.wyz * r0.xxx;
    r0.xyz = r0.xzy * ParticleUpRightResultScalars.yyy;
    r7.xyz = r7.xyz * AxisRotationVectors[a0].www;
    r3 = r3.yxzw * ParticleUpRightResultScalars.xxxx + r0.xzyx;
    r0 = (-abs(r6.zzzw) >= 0.0) ? AxisRotationVectors[a0].xyzz : r7.xyzz;
    r6.zw = (-abs(r6.ww) >= 0.0) ? AxisRotationVectors[a0].yx : r7.yx;
    r7.xyz = (r7.www == 0.0) ? r7.xyz : AxisRotationVectors[a0].xyz;
    r16.xyz = r7.yzx * ParticleUpRightResultScalars.zzz + r5.zyx;
    r18.xy = r6.zw * ParticleUpRightResultScalars.zz + r5.zx;
    r0 = r0.yzxw * ParticleUpRightResultScalars.zzzz;
    r16.w = r5.y + r0.w;
    r15.xzw = r3.xyz + r0.zyx;
    r7.xyz = r15.xwz * 0.5 + 0.5;
    r14.yzw = (float3(0.0, 1.0, 1.0) == 0.0) ? r16.www : r18.yyx;
    r0.yw = r18.zw * r4.yy;
    ps = r1.x;
    r13.z = r0.y * r16.w;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r8 = FogMinHeight.wzyx - CameraPosition.zzzz;
    r11.y = ps;
    ps = r3.w;
    r12 = FogMaxHeight.wzyx - CameraPosition.zzzz;
    ps = r0.z + ps;
    r19 = r15.xzzw * r18.xyxy;
    r11.x = ps;
    r5.z = r15.w * r16.w - r19.z;
    r0.xz = r11.zy * r4.xx;
    r3 = r15.zxwx * r16;
    ps = r19.x - r19.w;
    r5.y = r19.y - r3.w;
    r5.x = ps;
    ps = r0.z;
    r13.xyw = r0.yyw * r18.yxz;
    ps = r15.w * ps;
    r0.xw = r0.zx * r11.xy;
    r0.y = ps;
    r11.xyz = r15.xzw * r16.xzy - r3.zyx;
    ps = r0.z;
    r3.x = dot(r11.xzy, r11.xzy);
    ps = r15.z * ps;
    r3.w = dot(r5.xzy, r5.xzy);
    r0.z = ps;
    r0 = r17.xywz + r0;
    ps = rsqrt(abs(r3.x));
    r0 = r0.zxyw + r13.zxyw;
    r3.x = ps;
    r3.xyz = r11.xyz * r3.xxx;
    ps = rsqrt(abs(r3.w));
    r13.xyz = r0.xzy - CameraPosition.zyx;
    r3.w = ps;
    ps = r3.y;
    r18.xyz = r5.xyz * r3.www;
    ps = r16.y * ps;
    r11 = r0.wwww * ViewProjectionMatrix[3].xwzy;
    r14.x = ps;
    r17.xyz = -r0.xzy * CameraPosition.www + CameraPosition.zyx;
    ps = r3.z;
    r5.x = dot(r15.zxw, r17.xzy);
    ps = r16.y * ps;
    r5.y = dot(r14.zwy, r17.zyx);
    r14.y = ps;
    ps = r3.z;
    r5.z = dot(r18.xzy, r17.xzy);
    r11 = r0.xxxx * ViewProjectionMatrix[2].xwzy + r11;
    ps = r16.x * ps;
    r6.z = float((0.001 >= abs(r13.x)));
    r14.z = ps;
    r14.xyz = r3.xxy * r16.xzz - r14.xyz;
    ps = -r15.w;
    r6.w = dot(r13.xzy, r13.xzy);
    r15.y = ps;
    ps = sqrt(abs(r6.w));
    r3.w = dot(r15.xyz, r14.xyz);
    r0.x = ps;
    r6.z = (-abs(r6.z) >= 0.0) ? r13.x : 0.001;
    r11 = r0.zzzz * ViewProjectionMatrix[1].xzyw + r11.xzwy;
    r11 = r0.yyyy * ViewProjectionMatrix[0] + r11.xzyw;
    ps = 1.0 / r6.z;
    r0 = r0.xxxx - FogStartDistance.wzyx;
    r6.z = ps;
    r3 = r3.zyxw * 0.5 + 0.5;
    r13 = saturate(r12.wzyx * r6.zzzz);
    r8 = saturate(r8.wzyx * r6.zzzz);
    r12 = max(r0, 0.0);
    r0.xyz = r12.xyz * FogDistanceScale.wzy;
    r8 = r13.wzyx - r8.wzyx;
    r0.xyw = r0.yzx * abs(r8.yzx);
    ps = pow(2.0, r0.y);
    r6.z = abs(r8.w) * FogDistanceScale.x;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r8 = abs(r8) * r12;
    r0.z = ps;
    ps = pow(2.0, r0.w);
    r0.x = r6.z * r12.w;
    r0.w = ps;
    ps = pow(2.0, r0.x);
    r8 = float4((FogExtinctionDistance.wzyx > r8));
    r0.x = ps;
    r12 = r8.wzyx * r0;
    ps = r12.y * r12.x;
    r0 = r12.zwyx - 1.0;
    r14.w = ps;
    ps = r0.x;
    r8.xyz = r0.yyy * FogInScattering[3].xyz;
    r0.y = ps;
    ps = FogInScattering[2].x * r0.y;
    r14.xyz = r0.www * FogInScattering[0].xyz;
    r13.x = ps;
    ps = FogInScattering[2].y * r0.x;
    r14 = r12.yyyz * r14;
    r13.y = ps;
    ps = FogInScattering[2].z * r0.x;
    r8.w = r12.w * r14.w;
    r13.z = ps;
    r0.xyz = r0.zzz * FogInScattering[1].xyz + r14.xyz;
    r0.xyz = r12.zzz * r0.xyz + r13.xyz;
    r8.xyz = r12.www * r0.xyz + r8.xyz;
    r0.y = r5.w * 0.15915494 + 0.5;
    r0.xzw = r9.www * LocalToWorld[3].xyz;
    ps = (-0.5) + r1.x;
    r13 = r10.wwww * LocalToWorld[3];
    r12.y = ps;
    r0.xzw = r9.zzz * LocalToWorld[2].xzy + r0.xwz;
    r13 = r10.zzzz * LocalToWorld[2] + r13;
    ps = (-0.5) + r1.y;
    r0.y = frac(r0.y);
    r12.z = ps;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r13 = r10.yyyy * LocalToWorld[1].xzwy + r13.xzwy;
    r0.xzw = r9.yyy * LocalToWorld[1].xyz + r0.xwz;
    r9.xyz = r9.xxx * LocalToWorld[0].xzy + r0.xwz;
    r10 = r10.xxxx * LocalToWorld[0].xwyz + r13.xzwy;
    ps = cos(r0.y);
    r6.zw = r12.yz * r4.xy;
    r0.x = ps;
    r14.xyz = -r10.xzw + CameraWorldPosition.xyz;
    r13.xyz = r10.wzx - r9.yzx;
    ps = sin(r0.y);
    r15 = r0.xxxx * CameraRight.wzyx;
    r0.y = ps;
    r9 = r0.yyyy * CameraRight.wzyx;
    ps = (-1.0) * r0.x;
    r12.x = dot(r14.zxy, r14.zxy);
    r0.x = ps;
    r9 = r0.xxxx * CameraUp.wxzy + r9.xwyz;
    r0 = r0.yyyy * CameraUp.wxzy + r15.xwyz;
    r0 = r0.xywz * ParticleUpRightResultScalars.xxxx;
    r9 = r9.xywz * ParticleUpRightResultScalars.xxxx;
    ps = r0.x;
    r12.w = dot(r13.xzy, r13.xzy);
    ps = r4.y * ps;
    r12.xw = max(r12.xw, 0.01);
    r5.w = ps;
    ps = rsqrt(abs(r12.x));
    r0.x = r5.w * r12.z;
    r5.w = ps;
    ps = rsqrt(abs(r12.w));
    r15.xyz = r14.xyz * r5.www;
    r5.w = ps;
    ps = trunc(AxisRotationVectorSourceIndex.x);
    r16.xyz = r13.xyz * r5.www;
    r5.w = ps;
    r0.yzw = -r16.zyx * ParticleUpRightResultScalars.yyy + r0.yzw;
    a0 = xe_mova(r5.w);
    ps = r5.w;
    r13.xyz = r15.zxy * r16.yxz;
    r14.xyz = r15.zxy * AxisRotationVectors[a0].yzx;
    r13.xyz = r15.xzy * r16.yzx - r13.zyx;
    r14.xyz = r15.xzy * AxisRotationVectors[a0].yxz - r14.zyx;
    r12.x = dot(r14.xzy, r14.xzy);
    ps = r9.x;
    r12.w = dot(r13.xzy, r13.xzy);
    ps = r4.x * ps;
    r12.xw = max(r12.xw, 0.01);
    r4.x = ps;
    ps = rsqrt(abs(r12.x));
    r9.x = r4.x * r12.y;
    r4.x = ps;
    ps = rsqrt(abs(r12.w));
    r12.xyz = r14.xyz * r4.xxx;
    r4.x = ps;
    r13.xyz = r13.xzy * r4.xxx;
    r9.yzw = r13.yxz * ParticleUpRightResultScalars.yyy + r9.ywz;
    r13.xyz = r12.zyx * AxisRotationVectors[a0].www;
    r12.xyz = (r5.www == 0.0) ? r13.xzy : AxisRotationVectors[a0].xzy;
    r13.xyz = (r5.www == 0.0) ? AxisRotationVectors[a0].xzy : r13.xzy;
    r9.yzw = r13.yzx * ParticleUpRightResultScalars.zzz + r9.zwy;
    r0.yzw = r12.yzx * ParticleUpRightResultScalars.zzz + r0.wzy;
    r0.yzw = r6.www * r0.wyz;
    r9.yzw = r6.zzz * r9.wyz;
    r9 = r10.ywzx + r9.xzwy;
    r9 = r9.xywz + r0.xzyw;
    r0 = r9.xxxx * ViewProjectionMatrix[3].xwzy;
    r0 = r9.yyyy * ViewProjectionMatrix[2].xwzy + r0;
    r0 = r9.wwww * ViewProjectionMatrix[1].xzyw + r0.xzwy;
    r0 = r9.zzzz * ViewProjectionMatrix[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r6.xy;
    o1.xy = r4.zw;
    o8.xyz = r7.xyz;
    o8.w = 0.0;
    o5.xyz = r5.xyz;
    o7 = r3;
    o2 = r1.zwxy;
    o3 = r2;
    o4 = r11;
    o6 = r8;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord2 = o2;
    Out.texcoord3 = o3;
    Out.texcoord5 = o4;
    Out.texcoord6 = o5;
    Out.texcoord7 = o6;
    Out.color0 = o7;
    Out.color1 = o8;
    return Out;
}
