// vs_9f889b75dc6768be.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 282 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000468 0071000C 00000000 00000000 00007908 00000001 00000005 00000008 00000290 00100009 0000300A 0000500B 0000100C 0021500D 00003050 0001F151 0002F254 0003F356 0004F457 0005F558 0006F6A0 0007F7A1 00001055 0000105C 00001058 00001056 00001059 0000105A 0000105B 00001057
//   vertex element: instruction 9 -> POSITION0
//   vertex element: instruction 10 -> NORMAL0
//   vertex element: instruction 11 -> TEXCOORD0
//   vertex element: instruction 12 -> BLENDWEIGHT0
//   vertex element: instruction 13 -> TEXCOORD1
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

    r7 = In.position0;
    r2 = In.normal0;
    r5.zw = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r4 = In.texcoord1;
    r0.w = r0.y * 0.15915494 + 0.5;
    r0.xyz = r2.www * LocalToWorld[3].xyz;
    r0.xyz = r2.zzz * LocalToWorld[2].xzy + r0.xzy;
    ps = frac(r0.w);
    r1 = r7.wwww * LocalToWorld[3];
    r0.w = ps;
    r1 = r7.zzzz * LocalToWorld[2] + r1;
    r1 = r7.yyyy * LocalToWorld[1] + r1;
    r0.w = r0.w * 6.2831855 - 3.1415927;
    r0.xyz = r2.yyy * LocalToWorld[1].xyz + r0.xzy;
    r2.xyz = r2.xxx * LocalToWorld[0].xzy + r0.xzy;
    ps = cos(r0.w);
    r0.x = float((LightType.x >= 0.9));
    r0.y = ps;
    r1 = r7.xxxx * LocalToWorld[0].wxyz + r1.wxyz;
    r9.xyz = -r1.wzy * r0.xxx + LightPositionAndInvRadius.zyx;
    r10.xyz = -r1.wzy * CameraPosition.www + CameraPosition.zyx;
    ps = (-1.0) * r0.y;
    r0.z = ps;
    ps = r1.x;
    r6.xyz = -r1.wzy + CameraWorldPosition.zyx;
    r0.x = ps;
    ps = ViewProjectionMatrix[3].z * r0.x;
    r3.xyz = r1.yzw - r2.xzy;
    r2.x = ps;
    ps = ViewProjectionMatrix[3].w * r1.x;
    r8.x = dot(r6.xzy, r6.xzy);
    r2.y = ps;
    ps = sin(r0.w);
    r8.y = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    r5.xy = r1.ww * ViewProjectionMatrix[2].zw + r2.xy;
    r11.xyz = r0.xyy * CameraRight.yyx;
    r2.xyz = r0.xxy * CameraRight.zxz;
    r5.xy = r1.zz * ViewProjectionMatrix[1].zw + r5.xy;
    r5.xy = r1.yy * ViewProjectionMatrix[0].zw + r5.xy;
    r2.yzw = r0.zzx * CameraUp.zxz + r2.xyz;
    r1.xyz = r0.xzx * CameraUp.yyx + r11.yxz;
    r0.xy = max(r8.xy, 0.01);
    ps = rsqrt(abs(r0.x));
    r2.x = float((ScreenAlignment.x > 1.5));
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r6.xyz = r6.xyz * r0.zzz;
    r0.x = ps;
    r3.xyz = r3.zyx * r0.xxx;
    r0.yzw = r6.xzy * r3.yxz;
    r8.xw = (-abs(r2.xx) >= 0.0) ? r1.zx : r3.zy;
    r0.x = (-abs(r2.x) >= 0.0) ? r2.w : r3.x;
    r1.xzw = (float3(0.0, 0.0, 1.0) == 0.0) ? r8.xww : r0.xxx;
    r3.xyz = r6.zxy * r3.yzx - r0.wzy;
    r0.y = dot(r3.xzy, r3.xzy);
    r0.y = max(r0.y, 0.01);
    ps = rsqrt(abs(r0.y));
    r0.y = ps;
    r0.yzw = r3.zyx * r0.yyy;
    r0.yw = (-abs(r2.xx) >= 0.0) ? r2.yz : r0.wy;
    r1.y = (-abs(r2.x) >= 0.0) ? r1.y : r0.z;
    ps = 0.5 * r1.y;
    r11.z = r1.y * r0.x;
    r6.x = ps;
    ps = r1.y;
    r3.y = dot(r10.zyx, r1.xzw);
    ps = r8.x * ps;
    r6.z = r0.w * r0.x;
    r6.y = ps;
    ps = r0.y;
    r2.y = dot(r9.zyx, r1.xzw);
    r1.x = ps;
    ps = r0.w;
    r11.xy = r0.wy * r8.wx;
    r1.z = ps;
    ps = r0.y;
    r3.x = dot(r10.xzy, r1.xzy);
    ps = r8.w * ps;
    r2.x = dot(r9.xzy, r1.xzy);
    r6.w = ps;
    ps = 0.5 * r0.y;
    r12.xyz = r11.xyz - r6.yzw;
    r6.y = ps;
    ps = 0.5 * r0.w;
    r0.z = dot(r12.xzy, r12.xzy);
    r6.z = ps;
    ps = rsqrt(abs(r0.z));
    r6.xyz = r6.zxy + 0.5;
    r0.z = ps;
    ps = r12.x;
    r11.xyz = r12.xyz * r0.zzz;
    ps = -r0.z * ps;
    r8.yz = r12.yz * -r0.zz;
    r0.z = ps;
    ps = r0.z;
    r3.z = dot(-r11.xzy, r10.xzy);
    ps = r8.w * ps;
    r10.w = r8.y * r0.x;
    r10.x = ps;
    ps = r8.z;
    r2.z = dot(-r11.xzy, r9.xzy);
    ps = r0.x * ps;
    r10.yz = r8.yz * r8.xw;
    r1.w = ps;
    r9.y = r0.z * r8.x - r1.w;
    ps = -r1.y;
    r9.xz = r10.xy - r10.wz;
    r1.y = ps;
    ps = r0.w;
    r1.z = r0.y;
    r1.x = ps;
    r8.x = dot(r1.xyz, r9.xyz);
    ps = 0.5 * r0.z;
    r1.yzw = r8.xzy * 0.5;
    r1.x = ps;
    r8 = r1.zwxy + 0.5;
    r1 = r7.wwww * LocalToWorld[3].xwzy;
    r1 = r7.zzzz * LocalToWorld[2].xwzy + r1;
    r1 = r7.yyyy * LocalToWorld[1].xzyw + r1.xzwy;
    r7 = r7.xxxx * LocalToWorld[0].xywz + r1.xzwy;
    r1 = r7.zzzz * ViewProjectionMatrix[3].xwzy;
    r1 = r7.wwww * ViewProjectionMatrix[2].xwzy + r1;
    r1 = r7.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
    r1 = r7.xxxx * ViewProjectionMatrix[0] + r1.xzyw;
    oPos = r1;
    o0.xy = r5.zw;
    o3.zw = r5.xy;
    o3.xy = 1.0;
    o7.xyz = r6.xyz;
    o7.w = 0.0;
    o2.xyz = r2.xyz;
    o2.w = 0.0;
    o4.xyz = r3.xyz;
    o4.w = 0.0;
    o5.xyz = r0.yxz;
    o5.w = 0.0;
    o6 = r8;
    o1 = r4;

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
