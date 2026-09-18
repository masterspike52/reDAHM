// ps_a2adea1be32ec5da.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 417 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000684 10000400 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 22
// NOTE: unhandled fetch opcode 18 at 23
// NOTE: unhandled fetch opcode 18 at 24
// NOTE: unhandled control flow cjmp at cf 2
// NOTE: unhandled fetch opcode 18 at 32
// NOTE: unhandled control flow cjmp at cf 5
// NOTE: unhandled fetch opcode 18 at 39
// NOTE: unhandled control flow cjmp at cf 7
// NOTE: unhandled fetch opcode 18 at 45
// NOTE: unhandled control flow cjmp at cf 9
// NOTE: unhandled fetch opcode 18 at 51
// NOTE: unhandled control flow cjmp at cf 11
// NOTE: unhandled fetch opcode 18 at 57
// NOTE: unhandled control flow cjmp at cf 13
// NOTE: unhandled fetch opcode 18 at 63
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled fetch opcode 18 at 69
// NOTE: unhandled control flow cjmp at cf 17
// NOTE: unhandled fetch opcode 18 at 75
// NOTE: unhandled control flow cjmp at cf 19
// NOTE: unhandled fetch opcode 18 at 81
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled fetch opcode 18 at 87
// NOTE: unhandled control flow cjmp at cf 23
// NOTE: unhandled fetch opcode 18 at 93
// NOTE: unhandled control flow cjmp at cf 25
// NOTE: unhandled fetch opcode 18 at 99
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled fetch opcode 18 at 105
// NOTE: unhandled control flow cjmp at cf 29
// NOTE: unhandled fetch opcode 18 at 111
// NOTE: unhandled control flow cjmp at cf 31
// NOTE: unhandled fetch opcode 18 at 117
// NOTE: unhandled fetch opcode 18 at 123

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TextureDensityParameters : register(c3); // float4
float4 TextureLookupInfo[16] : register(c4); // float4[16]
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 color0 : COLOR0; // r2
    float4 color2 : COLOR2; // r3
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
    float4 r3 = In.color2;
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r2.x = tex2D(Texture2D_0, r0.xy).w;
    r2.x = (-0.25) + r2.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.xxxx)) clip(-1.0);
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    r3.xy = r2.zz * r4.yw;
    r2.z = r4.x * r4.w;
    r3.zw = r4.zx * r2.xx;
    r2.w = r4.z * r4.y;
    ps = r2.z - r2.w;
    r2.xy = r3.xz - r3.wy;
    r2.z = ps;
    ps = TextureDensityParameters.y;
    r2.y = dot(r2.zyx, r2.zyx);
    r2.z = ps;
    ps = sqrt(abs(r2.y));
    r2.x = trunc(TextureDensityParameters.x);
    r2.y = ps;
    p0 = (r2.x > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.y = max(r2.y, 1e-08);
    // UNHANDLED control flow: cjmp
    r2.zw = r0.xy * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r2.w = float((r2.x > 1.0));
    r3.xy = r3.zx * r3.yw;
    ps = 1.0 / r2.y;
    r2.z = r3.y - r3.x;
    r2.y = ps;
    r2.z = abs(r2.z) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 2.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 3.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 4.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 5.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 6.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 7.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 8.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 9.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 1e+01));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 11.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 12.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 13.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.w = float((r2.x > 14.0));
    r3.x = ps;
    r3.x = abs(r3.x) * r2.y;
    p0 = (r2.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r3.x);
    // UNHANDLED control flow: cjmp
    r3.xy = r0.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r2.x = float((r2.x > 15.0));
    r2.w = ps;
    r2.w = abs(r2.w) * r2.y;
    p0 = (r2.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = max(r2.z, r2.w);
    if (p0)
    {
        if (p0)
        {
            r2.xw = r0.xy * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
        if (p0)
        {
            r2.xw = r3.zx * r3.yw;
            ps = r2.w - r2.x;
            r2.x = ps;
            r2.x = abs(r2.x) * r2.y;
            r2.z = max(r2.z, r2.x);
        }
    }
    r0.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r0.z;
    r2.x = min(r2.z, TextureDensityParameters.w);
    r2.y = ps;
    ps = 1.0 / r0.w;
    r3.yz = r2.xx - TextureDensityParameters.zy;
    r2.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.y;
    r3.x = float((r2.x > TextureDensityParameters.z));
    r0.x = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.w;
    r2.yz = r3.yz * r2.yw;
    r0.y = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.y;
    r3.yz = r0.zw - r3.yz;
    r2.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r2.z;
    r2.xy = r0.xy * r3.yz;
    r2.z = ps;
    oC0.y = (r3.x == 0.0) ? r2.z : r2.x;
    oC0.xz = 0.0;
    oC0.w = 1.0;
    oC0.x = (r3.x == 0.0) ? 0.0 : r2.w;
    oC0.z = (r3.x == 0.0) ? r2.y : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
