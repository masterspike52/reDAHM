// vs_fc0591870515b3ed.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 0000036C 00210007 00000000 00000000 00002863 00000001 00000005 00000003 00000290 00100007 00003008 00005009 0000100A 0021500B 00003050 0001F151 0002F256 00001046 00001047 00001045
//   vertex element: instruction 7 -> POSITION0
//   vertex element: instruction 8 -> NORMAL0
//   vertex element: instruction 9 -> TEXCOORD0
//   vertex element: instruction 10 -> BLENDWEIGHT0
//   vertex element: instruction 11 -> TEXCOORD1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 o2 = 0.0;
    float4 oPos = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r4 = In.position0;
    r5 = In.normal0;
    r2.xy = In.texcoord0.xy;
    r0.y = In.blendweight0.x;
    r3 = In.texcoord1;
    r0.y = r0.y * 0.15915494 + 0.5;
    r1 = r4.wwww * LocalToWorld[3].xwzy;
    ps = frac(r0.y);
    r0.xzw = r5.www * LocalToWorld[3].xyz;
    r0.y = ps;
    r0.xzw = r5.zzz * LocalToWorld[2].xzy + r0.xwz;
    r1 = r4.zzzz * LocalToWorld[2].zxwy + r1.zxyw;
    r0.y = r0.y * 6.2831855 - 3.1415927;
    r1 = r4.yyyy * LocalToWorld[1].xzyw + r1.yxwz;
    r0.xzw = r5.yyy * LocalToWorld[1].xyz + r0.xwz;
    r5.xyz = r5.xxx * LocalToWorld[0].xzy + r0.xwz;
    r1 = r4.xxxx * LocalToWorld[0].wzyx + r1.wyzx;
    ps = cos(r0.y);
    r2.w = CameraUp.x * (-1.0);
    r0.x = ps;
    r4.xyz = r0.xxx * CameraRight.zyx;
    r7.xyz = -r1.yzw + CameraWorldPosition.zyx;
    ps = sin(r0.y);
    r6.xyz = r1.wzy - r5.xzy;
    r0.w = ps;
    r4.xyz = r0.www * CameraUp.zyx + r4.xyz;
    ps = (-1.0) * r0.x;
    r0.y = dot(r7.xzy, r7.xzy);
    r2.z = ps;
    ps = r2.w;
    r0.z = dot(r6.zxy, r6.zxy);
    ps = r0.x * ps;
    r5.xy = r2.zz * CameraUp.zy;
    r5.z = ps;
    r5.xyz = r0.www * CameraRight.zyx + r5.xyz;
    r0.xy = max(r0.yz, 0.01);
    ps = rsqrt(abs(r0.x));
    r0.w = float((ScreenAlignment.x > 1.5));
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r7.xyz = r7.xyz * r0.zzz;
    r0.x = ps;
    r6.xyz = r6.zyx * r0.xxx;
    r4.xyz = (-abs(r0.www) >= 0.0) ? r4.zyx : r6.zyx;
    r0.xyz = r7.xzy * r6.yxz;
    r6.xyz = r7.zxy * r6.yzx - r0.zyx;
    r0.x = dot(r6.xzy, r6.xzy);
    r0.x = max(r0.x, 0.01);
    ps = rsqrt(abs(r0.x));
    r0.x = ps;
    r0.xyz = r6.zyx * r0.xxx;
    r5.xyz = (-abs(r0.www) >= 0.0) ? r5.zyx : r0.xyz;
    r0.xyz = r5.yxz * r4.xzy;
    r4.xyz = r5.xzy * r4.yxz - r0.xyz;
    r0.w = dot(r4.xzy, r4.xzy);
    ps = rsqrt(abs(r0.w));
    r0.xyz = r1.wzy - r1.wzy;
    r0.w = ps;
    r4.xyz = r4.xyz * r0.www;
    r0.w = dot(-r4.xzy, r0.zxy);
    p0 = (-r0.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r2.zw = float2((-abs(r0.xx) > 0.0));
        r1 = -r0.zzyx * StretchTimeScale.wxxx + r1;
        r0 = r1.xxxx * ViewProjectionMatrix[3].xwzy;
        r0 = r1.yyyy * ViewProjectionMatrix[2].xwzy + r0;
        r0 = r1.zzzz * ViewProjectionMatrix[1].xzyw + r0.xzwy;
        r0 = r1.wwww * ViewProjectionMatrix[0] + r0.xzyw;
    }
    if (!p0)
    {
        r4.xyz = r1.xxx * PrevViewProjectionMatrix[3].xyw;
        r0 = r1.xxxx * ViewProjectionMatrix[3].xwyz;
        r0 = r1.yyyy * ViewProjectionMatrix[2].xwyz + r0;
        r4.xyz = r1.yyy * PrevViewProjectionMatrix[2].xyw + r4.xyz;
        r4.xyz = r1.zzz * PrevViewProjectionMatrix[1].xyw + r4.xyz;
    }
    if (!p0)
    {
        if (!p0)
        {
            r0 = r1.zzzz * ViewProjectionMatrix[1].xwyz + r0;
            r0 = r1.wwww * ViewProjectionMatrix[0] + r0.xzwy;
            r1.xyz = r1.www * PrevViewProjectionMatrix[0].wxy + r4.zxy;
            ps = 1.0 / r1.x;
            r1.x = ps;
            ps = 1.0 / r0.w;
            r1.xy = r1.yz * r1.xx;
            r1.z = ps;
            r2.zw = r0.xy * r1.zz - r1.xy;
        }
    }
    r0.z = r0.w * StretchTimeScale.y + r0.z;
    oPos = r0;
    o2.xy = r2.zw;
    o2.zw = 0.0;
    o0.xy = r2.xy;
    o1 = r3;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    Out.texcoord6 = o2;
    return Out;
}
