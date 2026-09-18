// ps_f8dc3969855dd499.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10000200 00000004 00000000 00001842 00030003 00000001 00003050 0000F156
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 19
// NOTE: unhandled fetch opcode 18 at 20
// NOTE: unhandled fetch opcode 18 at 21
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled fetch opcode 18 at 29
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled fetch opcode 18 at 36
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled fetch opcode 18 at 42
// NOTE: unhandled control flow cjmp at cf 9
// NOTE: unhandled fetch opcode 18 at 48
// NOTE: unhandled control flow cjmp at cf 11
// NOTE: unhandled fetch opcode 18 at 54
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled fetch opcode 18 at 60
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled fetch opcode 18 at 66
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled fetch opcode 18 at 72
// NOTE: unhandled control flow cjmp at cf 19
// NOTE: unhandled fetch opcode 18 at 78
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled fetch opcode 18 at 84
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled fetch opcode 18 at 90
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled fetch opcode 18 at 96
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled fetch opcode 18 at 102
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled fetch opcode 18 at 108
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled fetch opcode 18 at 114
// NOTE: unhandled fetch opcode 18 at 120

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TextureDensityParameters : register(c3); // float4
float4 TextureLookupInfo[16] : register(c4); // float4[16]

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    r1.xy = r0.zz * r2.yw;
    r0.z = r2.x * r2.w;
    r1.zw = r2.zx * r0.ww;
    r0.w = r2.z * r2.y;
    r1.xy = r1.xz - r1.wy;
    r1.z = r0.z - r0.w;
    r0.w = dot(r1.zyx, r1.zyx);
    r1.x = TextureDensityParameters.y;
    ps = sqrt(abs(r0.w));
    r0.z = trunc(TextureDensityParameters.x);
    r0.w = ps;
    p0 = (r0.z > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.w = max(r0.w, 1e-08);
    // UNHANDLED control flow: cjmp
    r1.xy = r0.xy * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r1.y = float((r0.z > 1.0));
    r1.xz = r2.zx * r2.yw;
    ps = 1.0 / r0.w;
    r1.x = r1.z - r1.x;
    r0.w = ps;
    r1.x = abs(r1.x) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 2.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 3.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 4.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 5.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 6.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 7.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 8.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 9.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 1e+01));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 11.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 12.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 13.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r1.zw = r2.zx * r2.yw;
    ps = r1.w - r1.z;
    r1.y = float((r0.z > 14.0));
    r1.z = ps;
    r1.z = abs(r1.z) * r0.w;
    p0 = (r1.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.z);
    // UNHANDLED control flow: cjmp
    r1.yz = r0.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r1.yz = r2.zx * r2.yw;
    ps = r1.z - r1.y;
    r0.z = float((r0.z > 15.0));
    r1.y = ps;
    r1.y = abs(r1.y) * r0.w;
    p0 = (r0.z != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.x = max(r1.x, r1.y);
    if (p0)
    {
        if (p0)
        {
            r0.xy = r0.xy * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
        if (p0)
        {
            r0.xy = r2.zx * r2.yw;
            ps = r0.y - r0.x;
            r0.x = ps;
            r0.x = abs(r0.x) * r0.w;
            r1.x = max(r1.x, r0.x);
        }
    }
    r2.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r2.z;
    r0.x = min(r1.x, TextureDensityParameters.w);
    r0.y = ps;
    ps = 1.0 / r2.w;
    r2.xy = r0.xx - TextureDensityParameters.zy;
    r0.z = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.y;
    r1.z = float((r0.x > TextureDensityParameters.z));
    r1.x = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.z;
    r0.yw = r2.xy * r0.yz;
    r1.y = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.y;
    r0.xz = r2.zw - r2.xy;
    r0.y = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r0.w;
    r1.xy = r1.xy * r0.xz;
    r0.x = ps;
    oC0.y = (r1.z == 0.0) ? r0.x : r1.x;
    oC0.xz = 0.0;
    oC0.w = 1.0;
    oC0.x = (r1.z == 0.0) ? 0.0 : r0.y;
    oC0.z = (r1.z == 0.0) ? r1.y : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
