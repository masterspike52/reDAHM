// vs_f7fcf0e56ad2adff.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000040 00000300 0000000D 00000000 00000000 00001021 00000001 0000000E 00000001 00000290 0000000D 0011500E 0002500F 00035010 00245011 00000012 00115013 00025014 00035015 00245016 00003017 00125018 00035019 0024501A 0000F056 0000103E
//   vertex element: instruction 13 -> POSITION0
//   vertex element: instruction 14 -> TEXCOORD1
//   vertex element: instruction 15 -> TEXCOORD2
//   vertex element: instruction 16 -> TEXCOORD3
//   vertex element: instruction 17 -> TEXCOORD4
//   vertex element: instruction 18 -> POSITION0
//   vertex element: instruction 19 -> TEXCOORD1
//   vertex element: instruction 20 -> TEXCOORD2
//   vertex element: instruction 21 -> TEXCOORD3
//   vertex element: instruction 22 -> TEXCOORD4
//   vertex element: instruction 23 -> NORMAL0
//   vertex element: instruction 24 -> TEXCOORD2
//   vertex element: instruction 25 -> TEXCOORD3
//   vertex element: instruction 26 -> TEXCOORD4
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 InvNumVerticesPerInstance : register(c5); // float
float4 NumVerticesPerInstance : register(c6); // float
float4 PrevViewProjectionMatrix[4] : register(c7); // float4x4 (matrix_columns)
float4 StretchTimeScale : register(c11); // float4 // default: 1.0, 0.0, 0.0, 0.0
float4 ViewProjectionMatrix[4] : register(c0); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord1 : TEXCOORD1;
    float4 texcoord2 : TEXCOORD2;
    float4 texcoord3 : TEXCOORD3;
    float4 texcoord4 : TEXCOORD4;
    float4 normal0 : NORMAL0;
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 o0 = 0.0;
    float4 oPos = 0.0;
    bool p0 = false;

    r0.y = r0.x + 0.5;
    r2.w = InvNumVerticesPerInstance.x * r0.y;
    r0.y = trunc(r2.w);
    r0.y = NumVerticesPerInstance.x * r0.y;
    r0.y = trunc(-r0.y);
    r3.x = r0.y + r0.x;
    r1 = In.position0;
    r5.xyz = In.texcoord1.xyz;
    r6.xyz = In.texcoord2.xyz;
    r10.xyz = In.texcoord3.xyz;
    r13.xyz = In.texcoord4.xyz;
    r0 = In.position0;
    r2.xyz = In.texcoord1.xyz;
    r4.xyz = In.texcoord2.xyz;
    r11.xyz = In.texcoord3.xyz;
    r12.xyz = In.texcoord4.xyz;
    r3.xyz = In.normal0.xyz;
    r7.xyz = In.texcoord2.xyz;
    r9.xyz = In.texcoord3.xyz;
    r8.xyz = In.texcoord4.xyz;
    r2.xyz = r2.xyz * r0.www;
    r5.xyz = r5.xzy * r1.www;
    r3.xyw = r3.zyx * 0.007843138 - 1.0;
    r8.xyz = r3.xxx * r8.xyz;
    r5.xyz = r13.xyz * r1.zzz + r5.xzy;
    r2.xyz = r12.xzy * r0.zzz + r2.xzy;
    r2.xyz = r11.xyz * r0.yyy + r2.xzy;
    r5.xyz = r10.xzy * r1.yyy + r5.xzy;
    r3.xyz = r3.yyy * r9.xyz + r8.xyz;
    r3.xyz = r3.www * r7.xzy + r3.xzy;
    r1.xyz = r6.zyx * r1.xxx + r5.yzx;
    r0.xyz = r4.xzy * r0.xxx + r2.xzy;
    r2.xyz = r1.zyx - r0.xzy;
    r2.w = dot(r3.yxz, r2.zxy);
    p0 = (-r2.w > 0.0);
    if (p0)
    {
        r0.xy = float2((-abs(r0.xx) > 0.0));
    }
    if (p0)
    {
        if (p0)
        {
            r3.xyz = -r2.zyx * StretchTimeScale.xxx + r1.xyz;
            r0.z = -r2.z * StretchTimeScale.w + r1.w;
            r1 = r0.zzzz * ViewProjectionMatrix[3].xwzy;
            r1 = r3.xxxx * ViewProjectionMatrix[2].xwzy + r1;
            r1 = r3.yyyy * ViewProjectionMatrix[1].xzyw + r1.xzwy;
            r1 = r3.zzzz * ViewProjectionMatrix[0] + r1.xzyw;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r3.xyz = r0.www * PrevViewProjectionMatrix[3].xyw;
            r2 = r1.wwww * ViewProjectionMatrix[3].xwyz;
            r2 = r1.xxxx * ViewProjectionMatrix[2].xwyz + r2;
            r3.xyz = r0.yyy * PrevViewProjectionMatrix[2].xyw + r3.xyz;
            r0.yzw = r0.zzz * PrevViewProjectionMatrix[1].xyw + r3.xyz;
            r2 = r1.yyyy * ViewProjectionMatrix[1].xwyz + r2;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r1 = r1.zzzz * ViewProjectionMatrix[0] + r2.xzwy;
            r0.xyz = r0.xxx * PrevViewProjectionMatrix[0].wxy + r0.wyz;
            r0.x = 1.0 / r0.x;
            r0.xy = r0.yz * r0.xx;
            r0.z = 1.0 / r1.w;
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
