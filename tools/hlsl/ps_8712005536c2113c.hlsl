// ps_8712005536c2113c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 531 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000084C 10000500 00000008 00000000 000040A5 0007001F 00000021 00003050 00003151 0000F256 0000F3A0 0000F4A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
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
sampler2D Texture2D_6 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
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
    float4 r3 = In.color0;
    float4 r4 = In.color1;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r3.x = tex2D(Texture2D_6, r0.xy).w;
    r3.x = (-0.5) + r3.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    r4.xy = r3.zz * r5.yw;
    r3.z = r5.x * r5.w;
    r4.zw = r5.zx * r3.xx;
    r3.w = r5.z * r5.y;
    ps = r3.z - r3.w;
    r3.xy = r4.xz - r4.wy;
    r3.z = ps;
    ps = TextureDensityParameters.y;
    r3.x = dot(r3.zyx, r3.zyx);
    r3.z = ps;
    ps = sqrt(abs(r3.x));
    r3.y = trunc(TextureDensityParameters.x);
    r3.x = ps;
    p0 = (r3.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.x = max(r3.x, 1e-08);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[0].z);
    r3.w = float((r3.y > 1.0));
    r3.z = ps;
    r4.xy = (r3.zz == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = 1.0 / r3.x;
    r3.z = r4.y - r4.x;
    r3.x = ps;
    r3.z = abs(r3.z) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[1].z);
    r3.w = float((r3.y > 2.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[2].z);
    r3.w = float((r3.y > 3.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[3].z);
    r3.w = float((r3.y > 4.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[4].z);
    r3.w = float((r3.y > 5.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[5].z);
    r3.w = float((r3.y > 6.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[6].z);
    r3.w = float((r3.y > 7.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[7].z);
    r3.w = float((r3.y > 8.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[8].z);
    r3.w = float((r3.y > 9.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[9].z);
    r3.w = float((r3.y > 1e+01));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[10].z);
    r3.w = float((r3.y > 11.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[11].z);
    r3.w = float((r3.y > 12.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[12].z);
    r3.w = float((r3.y > 13.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[13].z);
    r3.w = float((r3.y > 14.0));
    r4.x = ps;
    r4.xy = (r4.xx == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r4.x = ps;
    r4.x = abs(r4.x) * r3.x;
    p0 = (r3.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r4.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[14].z);
    r3.y = float((r3.y > 15.0));
    r3.w = ps;
    r4.xy = (r3.ww == 0.0) ? r0.xy : r1.xy;
    r4.xy = r4.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r3.w = ps;
    r3.w = abs(r3.w) * r3.x;
    p0 = (r3.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.z, r3.w);
    if (p0)
    {
        if (p0)
        {
            ps = trunc(TextureLookupInfo[15].z);
            r3.y = ps;
            r3.yw = (r3.yy == 0.0) ? r0.xy : r1.xy;
            r3.yw = r3.yw * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
        if (p0)
        {
            r3.yw = r4.zx * r4.yw;
            ps = r3.w - r3.y;
            r3.y = ps;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r3.x = abs(r3.y) * r3.x;
            r3.z = max(r3.z, r3.x);
        }
    }
    r0.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r0.z;
    r3.x = min(r3.z, TextureDensityParameters.w);
    r3.y = ps;
    ps = 1.0 / r0.w;
    r0.xy = r3.xx - TextureDensityParameters.zy;
    r3.z = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.y;
    r4.y = float((r3.x > TextureDensityParameters.z));
    r4.z = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.z;
    r3.yw = r0.xy * r3.yz;
    r4.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.y;
    r3.xz = r0.zw - r0.xy;
    r4.x = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.w;
    r3.xy = r4.zw * r3.xz;
    r3.z = ps;
    oC0.y = (r4.y == 0.0) ? r3.z : r3.x;
    oC0.xz = 0.0;
    oC0.w = 1.0;
    oC0.x = (r4.y == 0.0) ? 0.0 : r4.x;
    oC0.z = (r4.y == 0.0) ? r3.y : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
