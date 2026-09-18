// ps_eb52210177e669be.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000150 10000C00 00000004 00000000 000060C6 003F003F 00000001 0000F050 0000F151 0000F252 0000F353 0000F454 0000F555
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD5 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleWeights[12] : register(c3); // float4[12]
sampler2D FilterTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord5 : TEXCOORD5; // r5
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
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord5;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;

    r6 = tex2D(FilterTexture, r5.wz);
    r7 = tex2D(FilterTexture, r0.xy);
    r8 = tex2D(FilterTexture, r0.wz);
    r9 = tex2D(FilterTexture, r1.xy);
    r1 = tex2D(FilterTexture, r1.wz);
    r10 = tex2D(FilterTexture, r2.xy);
    r2 = tex2D(FilterTexture, r2.wz);
    r11 = tex2D(FilterTexture, r3.xy);
    r3 = tex2D(FilterTexture, r3.wz);
    r12 = tex2D(FilterTexture, r4.xy);
    r4 = tex2D(FilterTexture, r4.wz);
    r0 = tex2D(FilterTexture, r5.xy);
    r0 = r0 * SampleWeights[10];
    r0 = r4.xywz * SampleWeights[9].xywz + r0.xywz;
    r0 = r12.xwzy * SampleWeights[8].xwzy + r0.xzwy;
    r0 = r3.xzyw * SampleWeights[7].xzyw + r0.xzwy;
    r0 = r11.xywz * SampleWeights[6].xywz + r0.xzwy;
    r0 = r2.xwzy * SampleWeights[5].xwzy + r0.xzwy;
    r0 = r10.xzyw * SampleWeights[4].xzyw + r0.xzwy;
    r0 = r1.xywz * SampleWeights[3].xywz + r0.xzwy;
    r0 = r9.xwzy * SampleWeights[2].xwzy + r0.xzwy;
    r0 = r8.xzyw * SampleWeights[1].xzyw + r0.xzwy;
    r0 = r7.xywz * SampleWeights[0].xywz + r0.xzwy;
    oC0 = r6 * SampleWeights[11] + r0.xywz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
