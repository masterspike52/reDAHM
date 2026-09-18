// ps_987e82eb75c97d15.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 645 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000A14 10000500 00000004 00000000 000040A5 001F001F 00000021 00003050 00003151 0000F252 0000F353 0000F456
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 35
// NOTE: unhandled fetch opcode 18 at 36
// NOTE: unhandled fetch opcode 18 at 37
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled fetch opcode 18 at 49
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled fetch opcode 18 at 59
// NOTE: unhandled control flow cjmp at cf 9
// NOTE: unhandled fetch opcode 18 at 69
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled fetch opcode 18 at 79
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled fetch opcode 18 at 89
// NOTE: unhandled control flow cjmp at cf 18
// NOTE: unhandled fetch opcode 18 at 99
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled fetch opcode 18 at 109
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled fetch opcode 18 at 119
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled fetch opcode 18 at 129
// NOTE: unhandled control flow cjmp at cf 30
// NOTE: unhandled fetch opcode 18 at 139
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled fetch opcode 18 at 149
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled fetch opcode 18 at 159
// NOTE: unhandled control flow cjmp at cf 39
// NOTE: unhandled fetch opcode 18 at 169
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled fetch opcode 18 at 179
// NOTE: unhandled control flow cjmp at cf 45
// NOTE: unhandled fetch opcode 18 at 189
// NOTE: unhandled fetch opcode 18 at 199

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TextureDensityParameters : register(c3); // float4
float4 TextureLookupInfo[16] : register(c4); // float4[16]
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord6 : TEXCOORD6; // r4
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
    float4 r4 = In.texcoord6;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r0.z = tex2D(Texture2D_0, r0.xy).w;
    r1.z = tex2D(Texture2D_0, r1.xy).w;
    r1.z = -r0.z + r1.z;
    r0.w = 5.0 * r3.w;
    r0.z = r1.z * r2.x + r0.z;
    r0.z = r0.w * r0.z;
    r0.z = min(r0.z, 1.0);
    r0.z = (-0.5) - -r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    r3.xy = r0.zz * r5.yw;
    r0.z = r5.x * r5.w;
    r3.zw = r5.zx * r0.ww;
    r0.w = r5.z * r5.y;
    r3.xy = r3.xz - r3.wy;
    r3.z = r0.z - r0.w;
    r0.z = dot(r3.zyx, r3.zyx);
    r1.w = TextureDensityParameters.y;
    ps = sqrt(abs(r0.z));
    r0.w = trunc(TextureDensityParameters.x);
    r0.z = ps;
    p0 = (r0.w > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.z = max(r0.z, 1e-08);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[0].z);
    r3.x = float((r0.w > 1.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = 1.0 / r1.z;
    r0.z = r3.z - r3.y;
    r1.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r0.z, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[1].z);
    r3.x = float((r0.w > 2.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[2].z);
    r3.x = float((r0.w > 3.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[3].z);
    r3.x = float((r0.w > 4.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[4].z);
    r3.x = float((r0.w > 5.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[5].z);
    r3.x = float((r0.w > 6.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[6].z);
    r3.x = float((r0.w > 7.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[7].z);
    r3.x = float((r0.w > 8.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[8].z);
    r3.x = float((r0.w > 9.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[9].z);
    r3.x = float((r0.w > 1e+01));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[10].z);
    r3.x = float((r0.w > 11.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[11].z);
    r3.x = float((r0.w > 12.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[12].z);
    r3.x = float((r0.w > 13.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[13].z);
    r3.x = float((r0.w > 14.0));
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.yz = (r0.zz == 0.0) ? r2.xy : r3.yz;
    r3.yz = r3.yz * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r3.yz = r4.zx * r4.yw;
    ps = r3.z - r3.y;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r3.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[14].z);
    r0.w = float((r0.w > 15.0));
    r0.z = ps;
    r3.xy = (r0.zz == 0.0) ? r0.xy : r1.xy;
    ps = (-2.0) + r0.z;
    r0.z = ps;
    r3.xy = (r0.zz == 0.0) ? r2.xy : r3.xy;
    r3.xy = r3.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r3.xy = r3.zx * r3.yw;
    ps = r3.y - r3.x;
    r0.z = ps;
    r0.z = abs(r0.z) * r1.z;
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r1.w = max(r1.w, r0.z);
    if (p0)
    {
        if (p0)
        {
            ps = trunc(TextureLookupInfo[15].z);
            r0.z = ps;
            r0.xy = (r0.zz == 0.0) ? r0.xy : r1.xy;
            ps = (-2.0) + r0.z;
            r0.z = ps;
            r0.xy = (r0.zz == 0.0) ? r2.xy : r0.xy;
            r0.xy = r0.xy * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
    }
    if (p0)
    {
        if (p0)
        {
            r0.xy = r0.zx * r0.yw;
            ps = r0.y - r0.x;
            r0.x = ps;
            r0.x = abs(r0.x) * r1.z;
            r1.w = max(r1.w, r0.x);
        }
    }
    r2.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r2.z;
    r0.x = min(r1.w, TextureDensityParameters.w);
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
