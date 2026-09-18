// ps_1a2508f57460a10a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000030C 10000E00 00000004 00000000 00001042 00030003 00000001 00003050 00003151
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 BlurKernelSize : register(c6); // float
float4 BlurTexelSize : register(c9); // float2
float4 FalloffExponent : register(c5); // float
float4 FocusDistance : register(c3); // float
float4 FocusRadius : register(c4); // float
float4 MinMaxBlurClamp : register(c7); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ModulateBlurColor : register(c8); // float4
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D SceneBlurTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r2.xyz = tex2D(SceneColorTexture, r0.xy).xyz;
    r0.x = tex2D(SceneDepthTexture, r0.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.x;
    r0.x = ps;
    ps = 1.0 / FocusRadius.x;
    r0.z = r0.x - FocusDistance.x;
    r0.y = ps;
    r0.y = r0.z * r0.y;
    r0.y = max(r0.y, (-1.0));
    r0.w = min(r0.y, 1.0);
    ps = log2(abs(r0.w));
    r0.z = float((-r0.w > r0.w));
    r0.y = ps;
    ps = FalloffExponent.x * r0.y;
    r0.w = float((r0.w > -r0.w));
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r0.z = r0.w - r0.z;
    r0.y = ps;
    r0.w = float((0.001 >= r0.y));
    p0 = (r0.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r0.yzw = r2.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    }
    if (!p0)
    {
        ps = BlurTexelSize.x;
        r0.yw = min(r0.yy, MinMaxBlurClamp.yx);
        ps = (-0.326212) * ps;
        r3 = BlurTexelSize.xyxy * float4(-0.840144, -0.07358, -0.32194, -0.932615);
        r4.x = ps;
        ps = BlurTexelSize.y;
        r5 = BlurTexelSize.xyxy * float4(-0.695914, 0.457137, 0.89642, 0.412458);
        ps = (-0.40581) * ps;
        r6 = BlurTexelSize.xyxy * float4(-0.203345, 0.620716, 0.507431, 0.064425);
        r4.y = ps;
    }
    if (!p0)
    {
        if (!p0)
        {
            ps = BlurTexelSize.x;
            r7 = BlurTexelSize.xyxy * float4(0.96234, -0.194983, 0.185461, -0.893124);
            ps = (-0.791559) * ps;
            r8 = BlurTexelSize.xyxy * float4(0.473434, -0.480026, 0.519456, 0.767022);
            r4.z = ps;
            r0.y = (-r0.z > 0.0) ? r0.w : r0.y;
            ps = BlurTexelSize.y;
            r0.w = r0.y * BlurKernelSize.x;
            ps = (-0.59771) * ps;
            r0.z = r0.w * r0.z;
            r4.w = ps;
            r10 = r8 * r0.zzzz + r1.xyxy;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r11 = r7 * r0.zzzz + r1.xyxy;
            r12 = r6 * r0.zzzz + r1.xyxy;
            r13 = r5 * r0.zzzz + r1.xyxy;
            r3 = r3 * r0.zzzz + r1.xyxy;
            r1 = r4 * r0.zzzz + r1.xyxy;
            r4.xyz = tex2D(SceneBlurTexture, r1.zw).xyz;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r5.xyz = tex2D(SceneBlurTexture, r3.zw).xyz;
            r6.xyz = tex2D(SceneBlurTexture, r13.zw).xyz;
            r7.xyz = tex2D(SceneBlurTexture, r12.zw).xyz;
            r8.xyz = tex2D(SceneBlurTexture, r11.zw).xyz;
            r9.xyz = tex2D(SceneBlurTexture, r10.zw).xyz;
            r10.xyz = tex2D(SceneBlurTexture, r10.xy).xyz;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r11.xyz = tex2D(SceneBlurTexture, r11.xy).xyz;
            r12.xyz = tex2D(SceneBlurTexture, r12.xy).xyz;
            r13.xyz = tex2D(SceneBlurTexture, r13.xy).xyz;
            r14.xyz = tex2D(SceneBlurTexture, r1.xy).xyz;
            r1.xyz = tex2D(SceneBlurTexture, r3.xy).xyz;
            r3.xyz = ModulateBlurColor.xyz * 0.083333336;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r1.xyz = r1.xyz + r1.xyz;
            r1.xyz = r14.xyz * 2.0 + r1.xyz;
            r1.xyz = r13.xyz * 2.0 + r1.xyz;
            r1.xyz = r12.xyz * 2.0 + r1.xyz;
            r1.xyz = r11.xyz * 2.0 + r1.xyz;
            r1.xyz = r10.xyz * 2.0 + r1.xyz;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r1.xyz = r9.xyz * 2.0 + r1.xyz;
            r1.xyz = r8.xyz * 2.0 + r1.xyz;
            r1.xyz = r7.xyz * 2.0 + r1.xyz;
            r1.xyz = r6.xyz * 2.0 + r1.xyz;
            r1.xyz = r5.xyz * 2.0 + r1.xyz;
            r1.xyz = r4.xyz * 2.0 + r1.xyz;
        }
    }
    if (!p0)
    {
        if (!p0)
        {
            r1.xyz = r3.xyz * r1.xyz - r2.xyz;
            r0.yzw = r1.xyz * r0.yyy + r2.xyz;
            r0.yzw = r0.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
        }
    }
    oC0 = r0.yzwx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
