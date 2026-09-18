// ps_3980d29e065bf7af.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 645 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000A14 10000500 00000008 00000000 000050A5 0007001F 00000021 0000F050 0000F151 0000F256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
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
    float4 r4 = In.color2;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r4.x = tex2D(Texture2D_0, r0.xy).w;
    r4.y = tex2D(Texture2D_0, r0.wz).w;
    ps = 5.0 * r3.w;
    r3.x = -r4.x + r4.y;
    r3.y = ps;
    r3.x = r3.x * r1.x + r4.x;
    r3.x = r3.y * r3.x;
    r3.y = min(r3.x, 1.0);
    ps = (-0.5) - -r3.y;
    r3.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    // unhandled fetch opcode 18
    ps = r5.x * r5.w;
    r4.xy = r3.zz * r5.yw;
    r3.z = ps;
    ps = r5.z * r5.y;
    r4.zw = r5.zx * r3.xx;
    r3.w = ps;
    ps = r3.z - r3.w;
    r3.xy = r4.xz - r4.wy;
    r3.z = ps;
    ps = TextureDensityParameters.y;
    r3.x = dot(r3.zyx, r3.zyx);
    r3.w = ps;
    ps = sqrt(abs(r3.x));
    r3.y = trunc(TextureDensityParameters.x);
    r3.x = ps;
    p0 = (r3.y > 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.z = max(r3.x, 1e-08);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[0].z);
    r4.x = float((r3.y > 1.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r3.xw = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r3.xw = r3.xw * TextureLookupInfo[0].xy;
    // unhandled fetch opcode 18
    r3.xw = r2.zx * r2.yw;
    ps = 1.0 / r3.z;
    r3.x = r3.w - r3.x;
    r3.z = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.x, TextureDensityParameters.y);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[1].z);
    r4.x = float((r3.y > 2.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[1].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[2].z);
    r4.x = float((r3.y > 3.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[2].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[3].z);
    r4.x = float((r3.y > 4.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[3].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[4].z);
    r4.x = float((r3.y > 5.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[4].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[5].z);
    r4.x = float((r3.y > 6.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[5].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[6].z);
    r4.x = float((r3.y > 7.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[6].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[7].z);
    r4.x = float((r3.y > 8.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[7].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[8].z);
    r4.x = float((r3.y > 9.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[8].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[9].z);
    r4.x = float((r3.y > 1e+01));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[9].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[10].z);
    r4.x = float((r3.y > 11.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[10].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[11].z);
    r4.x = float((r3.y > 12.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[11].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[12].z);
    r4.x = float((r3.y > 13.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[12].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[13].z);
    r4.x = float((r3.y > 14.0));
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.yz = (r3.xx == 0.0) ? r1.xy : r4.yz;
    r4.yz = r4.yz * TextureLookupInfo[13].xy;
    // unhandled fetch opcode 18
    r4.yz = r2.zx * r2.yw;
    ps = r4.z - r4.y;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r4.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    // UNHANDLED control flow: cjmp
    ps = trunc(TextureLookupInfo[14].z);
    r3.y = float((r3.y > 15.0));
    r3.x = ps;
    r4.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
    ps = (-2.0) + r3.x;
    r3.x = ps;
    r4.xy = (r3.xx == 0.0) ? r1.xy : r4.xy;
    r4.xy = r4.xy * TextureLookupInfo[14].xy;
    // unhandled fetch opcode 18
    r4.xy = r4.zx * r4.yw;
    ps = r4.y - r4.x;
    r3.x = ps;
    r3.x = abs(r3.x) * r3.z;
    p0 = (r3.y != 0.0);
    ps = p0 ? 0.0 : 1.0;
    r3.w = max(r3.w, r3.x);
    if (p0)
    {
        if (p0)
        {
            ps = trunc(TextureLookupInfo[15].z);
            r3.x = ps;
            r4.xy = (r3.xx == 0.0) ? r0.xy : r0.wz;
            ps = (-2.0) + r3.x;
            r3.x = ps;
            r3.xy = (r3.xx == 0.0) ? r1.xy : r4.xy;
            r3.xy = r3.xy * TextureLookupInfo[15].xy;
        }
        // unhandled fetch opcode 18
    }
    if (p0)
    {
        if (p0)
        {
            r3.xy = r4.zx * r4.yw;
            ps = r3.y - r3.x;
            r3.x = ps;
            r3.x = abs(r3.x) * r3.z;
            r3.w = max(r3.w, r3.x);
        }
    }
    r0.zw = TextureDensityParameters.wz - TextureDensityParameters.zy;
    ps = 1.0 / r0.z;
    r3.x = min(r3.w, TextureDensityParameters.w);
    r3.y = ps;
    ps = 1.0 / r0.w;
    r4.yz = r3.xx - TextureDensityParameters.zy;
    r3.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.y;
    r4.x = float((r3.x > TextureDensityParameters.z));
    r0.x = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.w;
    r3.yz = r4.yz * r3.yw;
    r0.y = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.y;
    r4.yz = r0.zw - r4.yz;
    r3.w = ps;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.z;
    r3.xy = r0.xy * r4.yz;
    r3.z = ps;
    oC0.y = (r4.x == 0.0) ? r3.z : r3.x;
    oC0.xz = 0.0;
    oC0.w = 1.0;
    oC0.x = (r4.x == 0.0) ? 0.0 : r3.w;
    oC0.z = (r4.x == 0.0) ? r3.y : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
