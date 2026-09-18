// ps_3ef25a6137233fa1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 546 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000888 10000400 00000008 00000000 000050A5 0003001F 00000021 0000F050 0000F156 0000F2A0 0000F3A1 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR1 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000
// NOTE: unhandled fetch opcode 18 at 34
// NOTE: unhandled fetch opcode 18 at 35
// NOTE: unhandled fetch opcode 18 at 36
// NOTE: unhandled control flow cjmp at cf 3
// NOTE: unhandled fetch opcode 18 at 46
// NOTE: unhandled control flow cjmp at cf 6
// NOTE: unhandled fetch opcode 18 at 54
// NOTE: unhandled control flow cjmp at cf 9
// NOTE: unhandled fetch opcode 18 at 62
// NOTE: unhandled control flow cjmp at cf 12
// NOTE: unhandled fetch opcode 18 at 70
// NOTE: unhandled control flow cjmp at cf 15
// NOTE: unhandled fetch opcode 18 at 78
// NOTE: unhandled control flow cjmp at cf 18
// NOTE: unhandled fetch opcode 18 at 86
// NOTE: unhandled control flow cjmp at cf 21
// NOTE: unhandled fetch opcode 18 at 94
// NOTE: unhandled control flow cjmp at cf 24
// NOTE: unhandled fetch opcode 18 at 102
// NOTE: unhandled control flow cjmp at cf 27
// NOTE: unhandled fetch opcode 18 at 110
// NOTE: unhandled control flow cjmp at cf 30
// NOTE: unhandled fetch opcode 18 at 118
// NOTE: unhandled control flow cjmp at cf 33
// NOTE: unhandled fetch opcode 18 at 126
// NOTE: unhandled control flow cjmp at cf 36
// NOTE: unhandled fetch opcode 18 at 134
// NOTE: unhandled control flow cjmp at cf 39
// NOTE: unhandled fetch opcode 18 at 142
// NOTE: unhandled control flow cjmp at cf 42
// NOTE: unhandled fetch opcode 18 at 150
// NOTE: unhandled control flow cjmp at cf 45
// NOTE: unhandled fetch opcode 18 at 158
// NOTE: unhandled fetch opcode 18 at 166

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TextureDensityParameters : register(c5); // float4
float4 TextureLookupInfo[16] : register(c6); // float4[16]
float4 UniformScalar_3 : register(c3); // float
float4 UniformScalar_4 : register(c4); // float
sampler2D Texture2D_1 : register(s0);

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

    r2.x = tex2D(Texture2D_1, r0.xy).w;
    r2.y = UniformScalar_4.x - UniformScalar_3.x;
    r2.w = -UniformScalar_3.x + 1.0;
    r2.z = saturate(r0.z);
    ps = 1.0 / r2.y;
    r2.z = r2.w - r2.z;
    r2.y = ps;
    r2.y = saturate(r2.z * r2.y);
    r2.x = r2.y * r2.x - 0.5;
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
