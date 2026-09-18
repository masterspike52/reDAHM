// vs_e5f5b405292b1bc1.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 264 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000420 00410008 00000000 00000000 000048A5 00000001 00000005 00000005 00000290 00100008 00003009 0000500A 0000100B 0021500C 00003050 0001F151 0002F256 0003F3A0 0004F4A1 00001053 00001056 00001052 00001055 00001054
//   vertex element: instruction 8 -> POSITION0
//   vertex element: instruction 9 -> NORMAL0
//   vertex element: instruction 10 -> TEXCOORD0
//   vertex element: instruction 11 -> BLENDWEIGHT0
//   vertex element: instruction 12 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 CameraRight : register(c6); // float4
float4 CameraUp : register(c7); // float4
float4 CameraWorldPosition : register(c5); // float4
float4 LocalToWorld[4] : register(c9); // float4x4 (matrix_columns)
float4 PrevViewProjectionMatrix[4] : register(c13); // float4x4 (matrix_columns)
float4 ScreenAlignment : register(c8); // float4
float4 StretchTimeScale : register(c17); // float4 // default: 1.0, 0.0, 0.0, 0.0
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
    float4 texcoord6 : TEXCOORD6;
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 o3 = 0.0;
    float4 o4 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r2 = In.position0;
    r4 = In.normal0.yzwx;
    r3.zw = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r1 = In.texcoord1;
    r3.x = r0.y * 0.15915494 + 0.5;
    r0 = r2.wwww * LocalToWorld[3];
    ps = frac(r3.x);
    r5.xyz = r4.zzz * LocalToWorld[3].xzy;
    r3.x = ps;
    r5.xyz = r4.yyy * LocalToWorld[2].xyz + r5.xzy;
    r0 = r2.zzzz * LocalToWorld[2] + r0;
    r3.x = r3.x * 6.2831855 - 3.1415927;
    r0 = r2.yyyy * LocalToWorld[1].xzwy + r0.xzwy;
    r4.xyz = r4.xxx * LocalToWorld[1].xzy + r5.xzy;
    r4.xzw = r4.www * LocalToWorld[0].xyz + r4.xzy;
    r2 = r2.xxxx * LocalToWorld[0].wzyx + r0.zywx;
    ps = cos(r3.x);
    r4.y = CameraUp.x * (-1.0);
    r0.x = ps;
    r0.yzw = r0.xxx * CameraRight.zyx;
    r7.xyz = -r2.yzw + CameraWorldPosition.zyx;
    ps = sin(r3.x);
    r5.xyz = r2.wzy - r4.xzw;
    r5.w = ps;
    r0.yzw = r5.www * CameraUp.zyx + r0.yzw;
    ps = (-1.0) * r0.x;
    r3.x = dot(r7.xzy, r7.xzy);
    r4.x = ps;
    ps = r4.y;
    r3.y = dot(r5.zxy, r5.zxy);
    ps = r0.x * ps;
    r4.xyz = r4.xxx * CameraUp.zyx;
    r4.w = ps;
    r4 = r5.wwww * CameraRight.zyxx + r4;
    r6.xw = max(r3.xy, 0.01);
    ps = rsqrt(abs(r6.x));
    r3.x = float((ScreenAlignment.x > 1.5));
    r0.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r7.xyz * r0.xxx;
    r0.x = ps;
    r5.xyz = r5.zyx * r0.xxx;
    r8.xyz = (-abs(r3.xxx) >= 0.0) ? r0.wzy : r5.zyx;
    r0.xyz = r6.xzy * r5.yxz;
    r0.yzw = r6.zxy * r5.yzx - r0.zyx;
    r0.x = dot(r0.ywz, r0.ywz);
    r0.x = max(r0.x, 0.01);
    ps = rsqrt(abs(r0.x));
    r0.x = ps;
    r0.yzw = r0.wzy * r0.xxx;
    r0.x = (-abs(r3.x) >= 0.0) ? r4.w : r0.y;
    r7.xzw = (-abs(r3.xxx) >= 0.0) ? r4.zxy : r0.ywz;
    r5.xyz = r7.xwz * 0.5 + 0.5;
    r3.xy = r0.xx * r8.yz;
    r0.xyz = r7.wxz * r8.xzy;
    r3.y = r7.z * r8.x - r3.y;
    r3.x = r3.x - r0.x;
    r4.xyw = r7.xzw * r8.yxz - r0.xyz;
    r0.x = dot(r4.xwy, r4.xwy);
    r0.w = dot(r3.xy, r3.xy) + 0.0;
    ps = rsqrt(abs(r0.x));
    r7.y = -r7.w;
    r0.x = ps;
    r0.xyz = r4.xyw * -r0.xxx;
    r0.w = r4.w * r4.w + r0.w;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r0.yzz * r8.zzy;
    r0.w = ps;
    r6.xyz = r0.xxy * r8.yxx - r6.xyz;
    ps = r4.w;
    r4.xyz = r2.yzw - r2.yzw;
    ps = r0.w * ps;
    r8.yz = r3.xy * r0.ww;
    r8.x = ps;
    r3.x = dot(-r8.yxz, r4.xzy);
    p0 = (r3.x >= 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = dot(r7.xyz, r6.xyz);
    r0 = r0.zyxw * 0.5 + 0.5;
    if (p0)
    {
        r6.xyz = r2.xxx * PrevViewProjectionMatrix[3].xyw;
        r4 = r2.xxxx * ViewProjectionMatrix[3].xwzy;
        r4 = r2.yyyy * ViewProjectionMatrix[2].xwzy + r4;
        r6.xyz = r2.yyy * PrevViewProjectionMatrix[2].xyw + r6.xyz;
        r6.xyz = r2.zzz * PrevViewProjectionMatrix[1].xyw + r6.xyz;
    }
    if (p0)
    {
        if (p0)
        {
            r4 = r2.zzzz * ViewProjectionMatrix[1].xzyw + r4.xzwy;
            r4 = r2.wwww * ViewProjectionMatrix[0] + r4.xzyw;
            r2.xyz = r2.www * PrevViewProjectionMatrix[0].wxy + r6.zxy;
            ps = 1.0 / r2.x;
            r2.x = ps;
            ps = 1.0 / r4.w;
            r2.xy = r2.yz * r2.xx;
            r2.z = ps;
            r3.xy = r4.xy * r2.zz - r2.xy;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r3.xy = float2((-abs(r0.xx) > 0.0));
            r4 = -r4.xxyz * StretchTimeScale.wxxx + r2;
            r2 = r4.xxxx * ViewProjectionMatrix[3].xwyz;
            r2 = r4.yyyy * ViewProjectionMatrix[2].xwyz + r2;
            r2 = r4.zzzz * ViewProjectionMatrix[1].xwyz + r2;
            r4 = r4.wwww * ViewProjectionMatrix[0] + r2.xzwy;
        }
    }
    r4.z = r4.w * StretchTimeScale.y + r4.z;
    oPos = r4;
    o2.xy = r3.xy;
    o2.zw = 0.0;
    o0.xy = r3.zw;
    o4.xyz = r5.xyz;
    o4.w = 0.0;
    o3 = r0;
    o1 = r1;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    Out.color0 = o3;
    Out.color1 = o4;
    return Out;
}
