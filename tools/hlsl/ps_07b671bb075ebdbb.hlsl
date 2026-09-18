// ps_07b671bb075ebdbb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 531 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000084C 10000300 00000004 00000000 00002063 00070007 00000021 00003050 00003151 0000F256
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 29
// NOTE: unhandled fetch opcode 18 at 30
// NOTE: unhandled fetch opcode 18 at 31
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled fetch opcode 18 at 41
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled fetch opcode 18 at 49
// NOTE: unhandled control flow cjmp at cf 8
// NOTE: unhandled fetch opcode 18 at 57
// NOTE: unhandled control flow cjmp at cf 11
// NOTE: unhandled fetch opcode 18 at 65
// NOTE: unhandled control flow cjmp at cf 14
// NOTE: unhandled fetch opcode 18 at 73
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled fetch opcode 18 at 81
// NOTE: unhandled control flow cjmp at cf 20
// NOTE: unhandled fetch opcode 18 at 89
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled fetch opcode 18 at 97
// NOTE: unhandled control flow cjmp at cf 26
// NOTE: unhandled fetch opcode 18 at 105
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled fetch opcode 18 at 113
// NOTE: unhandled control flow cjmp at cf 32
// NOTE: unhandled fetch opcode 18 at 121
// NOTE: unhandled control flow cjmp at cf 35
// NOTE: unhandled fetch opcode 18 at 129
// NOTE: unhandled control flow cjmp at cf 38
// NOTE: unhandled fetch opcode 18 at 137
// NOTE: unhandled control flow cjmp at cf 41
// NOTE: unhandled fetch opcode 18 at 145
// NOTE: unhandled control flow cjmp at cf 44
// NOTE: unhandled fetch opcode 18 at 153
// NOTE: unhandled fetch opcode 18 at 161

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TextureDensityParameters : register(c3); // float4
float4 TextureLookupInfo[16] : register(c4); // float4[16]
sampler2D Texture2D_8 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord6 : TEXCOORD6; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord6;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r0.z = tex2D(Texture2D_8, r0.xy).w;
    r0.z = (-0.5) + r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    r2.xy = r0.zz * r3.yw;
    r0.z = r3.x * r3.w;
    r2.zw = r3.zx * r0.ww;
    r0.w = r3.z * r3.y;
    r2.xy = r2.xz - r2.wy;
    r2.z = r0.z - r0.w;
    r0.z = dot(r2.zyx, r2.zyx);
    r1.z = TextureDensityParameters.y;
    ps = sqrt(abs(r0.z));
    r0.w = trunc(TextureDensityParameters.x);
    r0.z = ps;
    p0 = (r0.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.z = max(r0.z, 1e-08);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[0].z);
    r1.w = float((r0.w > 1.0));
    r1.z = ps;
    r2.xy = (r1.zz == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = 1.0 / r0.z;
    r1.z = r2.y - r2.x;
    r0.z = ps;
    r1.z = abs(r1.z) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[1].z);
    r1.w = float((r0.w > 2.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[2].z);
    r1.w = float((r0.w > 3.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[3].z);
    r1.w = float((r0.w > 4.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[4].z);
    r1.w = float((r0.w > 5.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[5].z);
    r1.w = float((r0.w > 6.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[6].z);
    r1.w = float((r0.w > 7.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[7].z);
    r1.w = float((r0.w > 8.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[8].z);
    r1.w = float((r0.w > 9.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[9].z);
    r1.w = float((r0.w > 1e+01));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[10].z);
    r1.w = float((r0.w > 11.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[11].z);
    r1.w = float((r0.w > 12.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[12].z);
    r1.w = float((r0.w > 13.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[13].z);
    r1.w = float((r0.w > 14.0));
    r2.x = ps;
    r2.xy = (r2.xx == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r2.x = ps;
    r2.x = abs(r2.x) * r0.z;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r2.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[14].z);
    r0.w = float((r0.w > 15.0));
    r1.w = ps;
    r2.xy = (r1.ww == 0.0) ? r0.xy : r1.xy;
    r2.xy = r2.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r2.xy = r2.zx * r2.yw;
    ps = r2.y - r2.x;
    r1.w = ps;
    r1.w = abs(r1.w) * r0.z;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r1.z, r1.w);
    if (p0)
    {
        if (p0)
        {
            ps = trunc(TextureLookupInfo[15].z);
            r0.w = ps;
            r0.xy = (r0.ww == 0.0) ? r0.xy : r1.xy;
            r0.xy = r0.xy * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
        if (p0)
        {
            r0.xy = r2.zx * r2.yw;
            ps = r0.y - r0.x;
            r0.x = ps;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r0.x = abs(r0.x) * r0.z;
            r1.z = max(r1.z, r0.x);
        }
    }
    r2.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r2.z;
    r0.x = min(r1.z, TextureDensityParameters.w);
    r0.y = ps;
    ps = 1.0 / r2.w;
    r1.yz = r0.xx - TextureDensityParameters.zy;
    r0.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.y;
    r1.x = float((r0.x > TextureDensityParameters.z));
    r2.x = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.w;
    r0.yz = r1.yz * r0.yw;
    r2.y = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.y;
    r1.yz = r2.zw - r1.yz;
    r0.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.z;
    r0.xy = r2.xy * r1.yz;
    r0.z = ps;
    oC0.y = (r1.x == 0.0) ? r0.z : r0.x;
    oC0.xz = 0.0;
    oC0.w = 1.0;
    oC0.x = (r1.x == 0.0) ? 0.0 : r0.w;
    oC0.z = (r1.x == 0.0) ? r0.y : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
