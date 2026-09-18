// ps_53c19024cdcbb418.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 771 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000C0C 10000500 00000004 00000000 00002C63 00070007 00000001 0000F050 0000F151 00007252
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0x7)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled control flow cjmp at cf 4
// NOTE: unhandled control flow cjmp at cf 8
// NOTE: unhandled control flow cjmp at cf 11
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled control flow cjmp at cf 20
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled control flow cjmp at cf 38
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled control flow cjmp at cf 47

#include "xenos_common.hlsli"

float4 NumScarSpheres : register(c4); // float
float4 OnlyScarFrontFaces : register(c2); // float
float4 ScarFalloffPower : register(c6); // float
float4 ScarIntensity : register(c5); // float
float4 ScarLocus : register(c3); // float3
float4 ScarSpheres[16] : register(c7); // float4[16]
float4 WMapChannel : register(c1); // float
float4 WMapSampleOffset : register(c0); // float
sampler2D WMapSampler : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r0.xy = r0.xy + WMapSampleOffset.xx;
    r3 = tex2D(WMapSampler, r0.xy);
    r0.xy = r0.yx * 512.0;
    r0.xy = floor(r0.xy);
    r4.xyz = r0.yyy + float3(-1.0, 1.0, 0.0);
    r0.xyz = r0.xxx + float3(-1.0, 1.0, 0.0);
    r0.yzw = r0.xyz * 0.103515625;
    r0.x = r4.y * 0.001953125 + r0.y;
    r4 = r4.xzxy * 0.001953125 + r0.ywzz;
    r5 = r4.xwyz * 15731.0;
    r4 = r4.xzwy * 1.4930293e+08 + 91097.0;
    r0.xy = r0.xx * float2(1.4930293e+08, 15731.0);
    r4 = r5.xzwy * r4.xwyz + 142231.0;
    r5 = r4.xwyz * 4.656613e-11;
    r0.z = 91097.0 + r0.x;
    r0.x = r0.y * r0.z + 142231.0;
    ps = (-abs(r0.x) > 0.0) ? 1.0 : 0.0;
    r0.x = r0.x * 4.656613e-11;
    r0.z = ps;
    ps = frac(abs(r0.x));
    r4 = frac(abs(r5.xwyz));
    r0.y = ps;
    r4 = saturate((r5.xwyz >= 0.0) ? r4 : -r4);
    r4 = r4.xzwy * 0.7 + 0.3;
    r0.x = saturate((r0.x >= 0.0) ? r0.y : -r0.y);
    r0.y = r0.x * 0.7 + 0.3;
    p0 = (NumScarSpheres.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = dot(r4.zywx, float4(0.6, 0.1, 0.1, 0.1));
    r0.w = r0.y * 0.1 + r0.x;
    // UNHANDLED control flow: cjmp
    ps = r1.y;
    r0.z = ps;
    ps = r1.z;
    r0.y = r1.x;
    r0.x = ps;
    ps = -ScarSpheres[0].x - -r0.y;
    r2.w = float((OnlyScarFrontFaces.x >= 0.5));
    r4.x = ps;
    ps = -ScarSpheres[0].y - -r0.z;
    r5.xyz = -r0.xzy + ScarLocus.zyx;
    r4.y = ps;
    ps = -ScarSpheres[0].z - -r0.x;
    r2.x = dot(r5.xzy, r2.zxy);
    r4.z = ps;
    ps = 1.0 / ScarSpheres[0].w;
    r0.y = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = sqrt(abs(r0.y));
    r0.x = float((r2.x >= 0.05));
    r0.y = ps;
    ps = (-1.0) - -r0.x;
    r0.y = saturate(r0.z * r0.y);
    r0.x = ps;
    r0.x = r0.x * r2.w + 1.0;
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 1.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, 0.0);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[1].xyz;
    ps = 1.0 / ScarSpheres[1].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 2.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[2].xyz;
    ps = 1.0 / ScarSpheres[2].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 3.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[3].xyz;
    ps = 1.0 / ScarSpheres[3].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 4.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[4].xyz;
    ps = 1.0 / ScarSpheres[4].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 5.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[5].xyz;
    ps = 1.0 / ScarSpheres[5].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 6.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[6].xyz;
    ps = 1.0 / ScarSpheres[6].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 7.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[7].xyz;
    ps = 1.0 / ScarSpheres[7].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 8.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[8].xyz;
    ps = 1.0 / ScarSpheres[8].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 9.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[9].xyz;
    ps = 1.0 / ScarSpheres[9].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 1e+01));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[10].xyz;
    ps = 1.0 / ScarSpheres[10].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 11.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[11].xyz;
    ps = 1.0 / ScarSpheres[11].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 12.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[12].xyz;
    ps = 1.0 / ScarSpheres[12].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 13.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[13].xyz;
    ps = 1.0 / ScarSpheres[13].w;
    r2.x = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = sqrt(abs(r2.x));
    r2.x = ps;
    r0.y = saturate(r0.y * r2.x);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 14.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    // UNHANDLED control flow: cjmp
    r2.xyz = r1.xyz - ScarSpheres[14].xyz;
    ps = 1.0 / ScarSpheres[14].w;
    r0.y = dot(r2.zxy, r2.zxy);
    r2.x = ps;
    ps = sqrt(abs(r0.y));
    r0.y = ps;
    r0.y = saturate(r2.x * r0.y);
    r0.y = -r0.y * 2.0 + 2.0;
    ps = log2(abs(r0.y));
    r0.y = ps;
    ps = ScarFalloffPower.x * r0.y;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r2.x = float((NumScarSpheres.x > 15.0));
    r0.y = saturate(ps);
    ps = ScarIntensity.x * r0.y;
    r0.y = ps;
    r0.y = r0.y * r0.w;
    r0.y = max(r0.y, r0.z);
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = r0.x * r0.y;
    if (p0)
    {
        if (p0)
        {
            r1.xyz = r1.xyz - ScarSpheres[15].xyz;
            ps = 1.0 / ScarSpheres[15].w;
            r1.x = dot(r1.zxy, r1.zxy);
            r0.y = ps;
            ps = sqrt(abs(r1.x));
            r1.x = ps;
            r0.y = saturate(r0.y * r1.x);
            r0.y = -r0.y * 2.0 + 2.0;
            ps = log2(abs(r0.y));
            r0.y = ps;
        }
    }
    if (p0)
    {
        if (p0)
        {
            ps = ScarFalloffPower.x * r0.y;
            r0.y = ps;
            ps = pow(2.0, r0.y);
            r0.y = saturate(ps);
            ps = ScarIntensity.x * r0.y;
            r0.y = ps;
            r0.y = r0.y * r0.w;
            r0.y = max(r0.y, r0.z);
            r0.z = r0.x * r0.y;
        }
    }
    r0.x = WMapChannel.x + 0.5;
    ps = floor(r0.x);
    r0.y = ps;
    r0.x = (r0.y == 0.0) ? r3.x : r3.y;
    r1 = r0.yyyy + float4(-1.0, 0.0, -3.0, -2.0);
    r0.x = (r1.w == 0.0) ? r3.z : r0.x;
    r0.x = (r1.z == 0.0) ? r3.w : r0.x;
    r0.x = max(r0.x, r0.z);
    oC0 = (r1.yxwz == 0.0) ? r0.xxxx : r3;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
