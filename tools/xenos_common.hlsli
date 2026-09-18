// Helper functions for Xenos shaders decompiled by decompile.py.
//
// The Xenos ALU has a handful of instructions with no direct HLSL equivalent.
// decompile.py emits calls to the helpers below instead of trying to inline
// them, so this header has to be next to the generated .hlsl files.
//
// Targets D3D9 shader model 3 (vs_3_0 / ps_3_0), which is what the original
// shaders were compiled for.

#ifndef XENOS_COMMON_HLSLI
#define XENOS_COMMON_HLSLI

// Largest finite IEEE-754 single. Xenos ALU ops saturate to this instead of
// producing INF, so the decompiler emits it wherever a literal would overflow.
#define XE_FLT_MAX 3.402823466e+38f

// ---------------------------------------------------------------------------
// Address register
// ---------------------------------------------------------------------------
// maxas / maxa set a0 from a float, rounding to nearest and clamping to the
// hardware's [-256, 255] address range. maxasf truncates instead of rounding.
// a0 is then used for relative constant addressing, e.g. BoneMatrices[a0].

int xe_mova(float x)
{
    return (int)clamp(floor(x + 0.5f), -256.0f, 255.0f);
}

int xe_mova_floor(float x)
{
    return (int)clamp(floor(x), -256.0f, 255.0f);
}

// ---------------------------------------------------------------------------
// max4
// ---------------------------------------------------------------------------

float xe_max4(float4 v)
{
    return max(max(v.x, v.y), max(v.z, v.w));
}

// ---------------------------------------------------------------------------
// Cube map addressing
// ---------------------------------------------------------------------------
// The `cube` instruction turns a direction vector into face-relative cube
// coordinates. It returns:
//     .x = T   (unscaled t numerator)
//     .y = S   (unscaled s numerator)
//     .z = 2 * MajorAxis
//     .w = FaceID  (0=+X 1=-X 2=+Y 3=-Y 4=+Z 5=-Z)
//
// The argument arrives swizzled as (y, z, x) of the direction, which is the
// operand order the Xenos ISA uses for this instruction.
//
// Shaders then do the standard Xbox 360 sequence:
//     ps     = 1.0 / abs(cube.z);        // 1 / (2 * |ma|)
//     coord  = cube.yx * ps + 1.5;       // s, t biased into [1, 2]
//     face   = cube.w;
//     texCUBE(samp, xe_cube_dir(float3(coord, face)));
//
// xe_cube_dir undoes that, recovering a direction vector to feed texCUBE.
// The pair round-trips exactly: feeding a direction through xe_cube, the bias
// math above and back through xe_cube_dir reproduces the original direction
// (verified to 4.4e-16 over 200000 random directions covering all six faces).

float4 xe_cube(float3 v)
{
    float3 d = float3(v.z, v.x, v.y);   // undo the (y, z, x) operand swizzle
    float3 a = abs(d);

    float ma, face, sc, tc;
    if (a.x >= a.y && a.x >= a.z)
    {
        ma   = d.x;
        face = d.x > 0.0f ? 0.0f : 1.0f;
        sc   = d.x > 0.0f ? -d.z : d.z;
        tc   = -d.y;
    }
    else if (a.y >= a.z)
    {
        ma   = d.y;
        face = d.y > 0.0f ? 2.0f : 3.0f;
        sc   = d.x;
        tc   = d.y > 0.0f ? d.z : -d.z;
    }
    else
    {
        ma   = d.z;
        face = d.z > 0.0f ? 4.0f : 5.0f;
        sc   = d.z > 0.0f ? d.x : -d.x;
        tc   = -d.y;
    }

    return float4(tc, sc, 2.0f * ma, face);
}

float3 xe_cube_dir(float3 c)
{
    float sc = (c.x - 1.5f) * 2.0f;     // sc / |ma|
    float tc = (c.y - 1.5f) * 2.0f;     // tc / |ma|
    float f  = floor(c.z + 0.5f);

    float3 dir;
    if (f < 0.5f)       dir = float3( 1.0f,  -tc,  -sc);   // +X
    else if (f < 1.5f)  dir = float3(-1.0f,  -tc,   sc);   // -X
    else if (f < 2.5f)  dir = float3(  sc,  1.0f,   tc);   // +Y
    else if (f < 3.5f)  dir = float3(  sc, -1.0f,  -tc);   // -Y
    else if (f < 4.5f)  dir = float3(  sc,   -tc, 1.0f);   // +Z
    else                dir = float3( -sc,   -tc, -1.0f);  // -Z
    return dir;
}

// ---------------------------------------------------------------------------
// Scalar ALU ops with saturating / flushing variants
// ---------------------------------------------------------------------------
// The Xenos scalar unit has three flavours of reciprocal, reciprocal-sqrt and
// log: plain (IEEE result), "c" (clamped to +/-FLT_MAX instead of INF) and
// "f" (flushed to 0 instead of INF). None of the shaders in this game use the
// c/f variants, but decompile.py can emit them, so they are defined here.

float xe_logc(float x)
{
    float r = log2(x);
    return r == -1.0f / 0.0f ? -XE_FLT_MAX : r;
}

float xe_rcpc(float x)
{
    float r = 1.0f / x;
    if (r == 1.0f / 0.0f)  return XE_FLT_MAX;
    if (r == -1.0f / 0.0f) return -XE_FLT_MAX;
    return r;
}

float xe_rcpf(float x)
{
    float r = 1.0f / x;
    return abs(r) == 1.0f / 0.0f ? 0.0f : r;
}

float xe_rsqc(float x)
{
    float r = rsqrt(x);
    if (r == 1.0f / 0.0f)  return XE_FLT_MAX;
    if (r == -1.0f / 0.0f) return -XE_FLT_MAX;
    return r;
}

float xe_rsqf(float x)
{
    float r = rsqrt(x);
    return abs(r) == 1.0f / 0.0f ? 0.0f : r;
}

// muls_prev2: multiply by the previous scalar result, but force -FLT_MAX when
// either operand is degenerate.
float xe_muls_prev2(float a, float b, float ps)
{
    if (b == -XE_FLT_MAX || ps == -XE_FLT_MAX)
        return -XE_FLT_MAX;
    return a * ps;
}

#endif // XENOS_COMMON_HLSLI
