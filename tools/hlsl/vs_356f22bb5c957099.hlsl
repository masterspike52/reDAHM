// vs_356f22bb5c957099.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 000003CC 0051000B 00000000 00000000 000058C6 00000001 00000005 00000006 00000290 00100008 00003009 0000500A 0000100B 0021500C 00003050 0001F151 0002F254 0003F356 0004F457 0005F558 0000104A 0000104F 0000104C 0000104B 0000104D 0000104E
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> BLENDWEIGHT0
//   vertex element: instruction 12 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraPosition : register(c4); // float4
float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LightPositionAndInvRadius : register(c14); // float4[2]
float4 LightType : register(c13); // float[2]
float4 LocalToWorld[4] : register(c9); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c8); // float4
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 normal0 : NORMAL0;
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
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 o5 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;

    r5 = In.position0;
    r4 = In.normal0;
    r3.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r2 = In.texcoord1;
    r6.w = float((ScreenAlignment.x > 1.5));
    r0.z = r0.y * 0.15915494 + 0.5;
    r0.xyw = r4.www * LocalToWorld[3].xyz;
    r0.xyw = r4.zzz * LocalToWorld[2].xzy + r0.xwy;
    ps = frac(r0.z);
    r1 = r5.wwww * LocalToWorld[3];
    r0.z = ps;
    r1 = r5.zzzz * LocalToWorld[2] + r1;
    r1 = r5.yyyy * LocalToWorld[1] + r1;
    r0.z = r0.z * 6.2831855 - 3.1415927;
    r0.xyw = r4.yyy * LocalToWorld[1].xyz + r0.xwy;
    r4.xyz = r4.xxx * LocalToWorld[0].xzy + r0.xwy;
    ps = cos(r0.z);
    r0.x = float((LightType.x >= 0.9));
    r0.w = ps;
    r1 = r5.xxxx * LocalToWorld[0].yxzw + r1.yxzw;
    r9.xyz = -r1.zxy * CameraPosition.www + CameraPosition.zyx;
    r6.xyz = -r1.zxy * r0.xxx + LightPositionAndInvRadius.zyx;
    r11.xy = r1.yy * ViewProjectionMatrix[0].zw;
    ps = (-1.0) * r0.w;
    r8.xyz = -r1.yxz + CameraWorldPosition.xyz;
    r0.y = ps;
    ps = r1.x;
    r7.xyz = r1.yxz - r4.xzy;
    r0.x = ps;
    ps = ViewProjectionMatrix[1].z * r0.x;
    r3.z = dot(r7.zxy, r7.zxy);
    r10.x = ps;
    ps = sin(r0.z);
    r3.w = dot(r8.zxy, r8.zxy);
    r0.x = ps;
    ps = ViewProjectionMatrix[1].w * r1.x;
    r11.zw = r0.yx * CameraUp.zz;
    r10.y = ps;
    ps = CameraRight.z * r0.x;
    r4 = r0.xwxw * CameraRight.yyxx;
    r10.z = ps;
    r4 = r0.xxyy * CameraUp.yxyx + r4.ywxz;
    ps = CameraRight.z * r0.w;
    r3.zw = max(r3.zw, 0.01);
    r10.w = ps;
    ps = rsqrt(abs(r3.w));
    r0 = r11.xywz + r10.xywz;
    r7.w = ps;
    ps = rsqrt(abs(r3.z));
    r10.xyz = r8.zyx * r7.www;
    r3.z = ps;
    r8.xyz = r7.zyx * r3.zzz;
    r3.zw = r1.zz * ViewProjectionMatrix[2].zw + r0.xy;
    r3.zw = r1.ww * ViewProjectionMatrix[3].zw + r3.zw;
    r1.zw = (-abs(r6.ww) >= 0.0) ? r4.yx : r8.zy;
    r4.y = (-abs(r6.w) >= 0.0) ? r0.z : r8.x;
    r7.xyz = r10.xzy * r8.yxz;
    r7.xyz = r10.zxy * r8.yzx - r7.zyx;
    r1.x = dot(r7.xzy, r7.xzy);
    r1.x = max(r1.x, 0.01);
    ps = rsqrt(abs(r1.x));
    r1.x = ps;
    r0.xyz = r7.zyx * r1.xxx;
    r4.x = (-abs(r6.w) >= 0.0) ? r0.w : r0.z;
    r4.zw = (-abs(r6.ww) >= 0.0) ? r4.wz : r0.xy;
    ps = r4.w;
    r7.xy = r4.xx * r1.zw;
    ps = r4.y * ps;
    r0.zw = r4.zw * r1.wz;
    r7.z = ps;
    ps = r4.z;
    r0.xy = r6.xx * r4.xy;
    ps = r4.y * ps;
    r1.xy = r9.xx * r4.xy;
    r7.w = ps;
    r1.x = dot(r9.zy, r4.zw) + r1.x;
    r1.y = dot(r9.zy, r1.zw) + r1.y;
    r0.x = dot(r6.zy, r4.zw) + r0.x;
    r0.y = dot(r6.zy, r1.zw) + r0.y;
    ps = r0.z - r0.w;
    r8.yz = r7.xz - r7.wy;
    r8.x = ps;
    r0.z = dot(r8.xzy, r8.xzy);
    ps = rsqrt(abs(r0.z));
    r0.w = ps;
    r7.xyz = r8.xyz * r0.www;
    ps = r8.x;
    r1.z = dot(-r7.xzy, r9.xzy);
    ps = -r0.w * ps;
    r0.z = dot(-r7.xzy, r6.xzy);
    r4.z = ps;
    r6 = r5.wwww * LocalToWorld[3].xwzy;
    r6 = r5.zzzz * LocalToWorld[2].xwzy + r6;
    r6 = r5.yyyy * LocalToWorld[1].xzyw + r6.xzwy;
    r6 = r5.xxxx * LocalToWorld[0].xywz + r6.xzwy;
    r5 = r6.zzzz * ViewProjectionMatrix[3].xwzy;
    r5 = r6.wwww * ViewProjectionMatrix[2].xwzy + r5;
    r5 = r6.yyyy * ViewProjectionMatrix[1].xzyw + r5.xzwy;
    r5 = r6.xxxx * ViewProjectionMatrix[0] + r5.xzyw;
    oPos = r5;
    o0.xy = r3.xy;
    o3.zw = r3.zw;
    o3.xy = 1.0;
    o2.xyz = r0.xyz;
    o2.w = 0.0;
    o4.xyz = r1.xyz;
    o4.w = 0.0;
    o5.xyz = r4.xyz;
    o5.w = 0.0;
    o1 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord4 = o2;
    Out.texcoord6 = o3;
    Out.texcoord7 = o4;
    Out.texcoord8 = o5;
    return Out;
}
