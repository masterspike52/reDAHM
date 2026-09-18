// ps_e79acf5870bab9e8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 582 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000918 10000400 00000008 00000000 000050A5 0003001F 00000021 0000F050 0000F156 0000F2A0 0000F3A1 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 46
// NOTE: unhandled fetch opcode 18 at 47
// NOTE: unhandled fetch opcode 18 at 48
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled fetch opcode 18 at 58
// NOTE: unhandled control flow cjmp at cf 8
// NOTE: unhandled fetch opcode 18 at 66
// NOTE: unhandled control flow cjmp at cf 11
// NOTE: unhandled fetch opcode 18 at 74
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled fetch opcode 18 at 82
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled fetch opcode 18 at 90
// NOTE: unhandled control flow cjmp at cf 20
// NOTE: unhandled fetch opcode 18 at 98
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled fetch opcode 18 at 106
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled fetch opcode 18 at 114
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled fetch opcode 18 at 122
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled fetch opcode 18 at 130
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled fetch opcode 18 at 138
// NOTE: unhandled control flow cjmp at cf 38
// NOTE: unhandled fetch opcode 18 at 146
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled fetch opcode 18 at 154
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled fetch opcode 18 at 162
// NOTE: unhandled control flow cjmp at cf 47
// NOTE: unhandled fetch opcode 18 at 170
// NOTE: unhandled fetch opcode 18 at 178

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TextureDensityParameters : register(c7); // float4
float4 TextureLookupInfo[16] : register(c8); // float4[16]
float4 UniformScalar_12 : register(c3); // float
float4 UniformScalar_13 : register(c4); // float
float4 UniformScalar_14 : register(c5); // float
float4 UniformScalar_15 : register(c6); // float
sampler2D Texture2D_4 : register(s0);
sampler2D Texture2D_7 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 color0 : COLOR0; // r2
    float4 color1 : COLOR1; // r3
    float4 color2 : COLOR2; // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.color0;
    float4 r3 = In.color1;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r2.xw = r0.wz * 3.0;
    r2.z = r4.w * (-0.8) + r2.w;
    r2.y = tex2D(Texture2D_7, r0.xy).w;
    r2.z = tex2D(Texture2D_4, r2.xz).z;
    ps = UniformScalar_13.x - r4.w;
    r2.x = float((UniformScalar_12.x >= 1.0));
    r2.w = ps;
    r2.x = r2.w * r2.x + r4.w;
    r2.x = -r2.x + r4.z;
    r2.x = max(r2.x, UniformScalar_14.x);
    ps = 1.0 / UniformScalar_15.x;
    r2.x = min(r2.x, 1.0);
    r2.w = ps;
    ps = r2.z;
    r2.x = saturate(r2.x * r2.w);
    ps = r4.w * ps;
    r2.x = -r2.x + 1.0;
    r2.z = ps;
    r2.x = r2.z * r2.x;
    r2.x = float((r2.x >= 0.05));
    ps = 1.0 - r2.x;
    r2.x = ps;
    r2.z = (UniformScalar_13.x > 0.0) ? r2.x : 1.0;
    r2.x = (UniformScalar_13.x >= 0.0) ? r2.z : r2.x;
    r2.x = r2.x * r2.y - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.xxxx)) clip(-1.0);
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    ps = r4.x * r4.w;
    r3.xy = r2.zz * r4.yw;
    r2.z = ps;
    ps = r4.z * r4.y;
    r3.zw = r4.zx * r2.xx;
    r2.w = ps;
    ps = r2.z - r2.w;
    r2.xy = r3.xz - r3.wy;
    r2.z = ps;
    ps = TextureDensityParameters.y;
    r2.x = dot(r2.zyx, r2.zyx);
    r2.z = ps;
    ps = sqrt(abs(r2.x));
    r2.y = trunc(TextureDensityParameters.x);
    r2.x = ps;
    p0 = (r2.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.x = max(r2.x, 1e-08);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[0].z);
    r2.w = float((r2.y > 1.0));
    r2.z = ps;
    r3.xy = (r2.zz == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = 1.0 / r2.x;
    r2.z = r3.y - r3.x;
    r2.x = ps;
    r2.z = abs(r2.z) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[1].z);
    r2.w = float((r2.y > 2.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[2].z);
    r2.w = float((r2.y > 3.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[3].z);
    r2.w = float((r2.y > 4.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[4].z);
    r2.w = float((r2.y > 5.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[5].z);
    r2.w = float((r2.y > 6.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[6].z);
    r2.w = float((r2.y > 7.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[7].z);
    r2.w = float((r2.y > 8.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[8].z);
    r2.w = float((r2.y > 9.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[9].z);
    r2.w = float((r2.y > 1e+01));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[10].z);
    r2.w = float((r2.y > 11.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[11].z);
    r2.w = float((r2.y > 12.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[12].z);
    r2.w = float((r2.y > 13.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[13].z);
    r2.w = float((r2.y > 14.0));
    r3.x = ps;
    r3.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r2.x;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[14].z);
    r2.y = float((r2.y > 15.0));
    r2.w = ps;
    r3.xy = (r2.ww == 0.0) ? r0.xy : r0.wz;
    r3.xy = r3.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = ps;
    r2.w = abs(r2.w) * r2.x;
    p0 = (r2.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r2.w);
    if (p0)
    {
        if (p0)
        {
            ps = trunc(TextureLookupInfo[15].z);
            r2.y = ps;
            r2.yw = (r2.yy == 0.0) ? r0.xy : r0.wz;
            r2.yw = r2.yw * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
        if (p0)
        {
            r2.yw = r3.zx * r3.yw;
            ps = r2.w - r2.y;
            r2.y = ps;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r2.x = abs(r2.y) * r2.x;
            r2.z = max(r2.z, r2.x);
        }
    }
    r4.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r4.z;
    r2.x = min(r2.z, TextureDensityParameters.w);
    r2.y = ps;
    ps = 1.0 / r4.w;
    r4.xy = r2.xx - TextureDensityParameters.zy;
    r2.z = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.y;
    r3.y = float((r2.x > TextureDensityParameters.z));
    r3.z = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.z;
    r2.yw = r4.xy * r2.yz;
    r3.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.y;
    r2.xz = r4.zw - r4.xy;
    r3.x = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.w;
    r2.xy = r3.zw * r2.xz;
    r2.z = ps;
    oC0.y = (r3.y == 0.0) ? r2.z : r2.x;
    oC0.xz = 0.0;
    oC0.w = 1.0;
    oC0.x = (r3.y == 0.0) ? 0.0 : r3.x;
    oC0.z = (r3.y == 0.0) ? r2.y : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
