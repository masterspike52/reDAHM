// ps_138a111bcd03003c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000660 10001500 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 BloomScale : register(c5); // float
float4 MinMaxBlurClamp : register(c4); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 PackedParameters : register(c3); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
float4 SceneDepthTexture_TexelSize; // xy = 1 / texture size. Xenos applied the fetch texel offsets natively; SM3 needs it passed in.
float4 SceneColorTexture_TexelSize; // xy = 1 / texture size. Xenos applied the fetch texel offsets natively; SM3 needs it passed in.

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = 0.0;
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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 oC0 = 0.0;

    r4.xyz = tex2D(SceneColorTexture, r0.xy).xyz;
    r1.xyz = tex2D(SceneColorTexture, r0.xy + float2(3.0, 1.0) * SceneColorTexture_TexelSize.xy).xyz;
    r9.xyz = tex2D(SceneColorTexture, r0.xy + float2(2.0, 1.0) * SceneColorTexture_TexelSize.xy).xyz;
    r7.xyz = tex2D(SceneColorTexture, r0.xy + float2(1.0, 1.0) * SceneColorTexture_TexelSize.xy).xyz;
    r5.xyz = tex2D(SceneColorTexture, r0.xy + float2(1.0, 0.0) * SceneColorTexture_TexelSize.xy).xyz;
    r3.xyz = tex2D(SceneColorTexture, r0.xy + float2(0.0, 1.0) * SceneColorTexture_TexelSize.xy).xyz;
    r2.xyz = tex2D(SceneColorTexture, r0.xy + float2(3.0, 0.0) * SceneColorTexture_TexelSize.xy).xyz;
    r10.xyz = tex2D(SceneColorTexture, r0.xy + float2(2.0, 0.0) * SceneColorTexture_TexelSize.xy).xyz;
    r6.x = tex2D(SceneDepthTexture, r0.xy + float2(3.0, 0.0) * SceneDepthTexture_TexelSize.xy).x;
    r6.y = tex2D(SceneDepthTexture, r0.xy + float2(3.0, 1.0) * SceneDepthTexture_TexelSize.xy).x;
    r6.z = tex2D(SceneDepthTexture, r0.xy + float2(2.0, 1.0) * SceneDepthTexture_TexelSize.xy).x;
    r6.w = tex2D(SceneDepthTexture, r0.xy + float2(1.0, 1.0) * SceneDepthTexture_TexelSize.xy).x;
    r8.x = tex2D(SceneDepthTexture, r0.xy + float2(2.0, 0.0) * SceneDepthTexture_TexelSize.xy).x;
    r8.y = tex2D(SceneDepthTexture, r0.xy + float2(1.0, 0.0) * SceneDepthTexture_TexelSize.xy).x;
    r8.z = tex2D(SceneDepthTexture, r0.xy).x;
    r8.w = tex2D(SceneDepthTexture, r0.xy + float2(0.0, 1.0) * SceneDepthTexture_TexelSize.xy).x;
    r11 = r8.xwyz * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    r6 = r6.xzwy * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    r8.x = 1.0 / r6.x;
    r8.y = 1.0 / r11.x;
    r8.z = 1.0 / r11.z;
    r16.xyz = float3((r10.zyx > 1.0));
    r6.x = 1.0 / r6.w;
    r17.xyz = float3((r2.zyx > 1.0));
    r6.y = 1.0 / r6.y;
    r12.yzw = float3((r3.zyx > 1.0));
    r6.z = 1.0 / r6.z;
    r18.xyz = float3((r5.zyx > 1.0));
    r6.w = 1.0 / r11.y;
    r6 = r6 - PackedParameters.xxxx;
    r8.w = 1.0 / r11.w;
    r8 = r8 - PackedParameters.xxxx;
    r13 = (-r8.wyxz > 0.0) ? MinMaxBlurClamp.xxxx : MinMaxBlurClamp.yyyy;
    r15 = (-r6.wyxz > 0.0) ? MinMaxBlurClamp.xxxx : MinMaxBlurClamp.yyyy;
    r11 = r8.xzyw * PackedParameters.yyyy;
    r8 = r6.wxyz * PackedParameters.yyyy;
    r14.x = log2(abs(r11.y));
    r19.xyz = float3((r7.zyx > 1.0));
    r14.y = log2(abs(r8.x));
    r6.yzw = float3((r9.zyx > 1.0));
    r14.z = log2(abs(r11.x));
    r20.xyz = float3((r1.zyx > 1.0));
    r8.x = log2(abs(r11.w));
    r21.xyz = float3((r4.zyx > 1.0));
    r8.y = log2(abs(r8.y));
    r11.x = xe_max4(r21.zyxz);
    r8.z = log2(abs(r8.z));
    r11.y = xe_max4(r20.zyxz);
    r8.w = log2(abs(r8.w));
    r8 = r8.xwzy * PackedParameters.zzzz;
    r14.w = log2(abs(r11.z));
    r14 = r14 * PackedParameters.zzzz;
    r6.x = pow(2.0, r8.x);
    r11.z = xe_max4(r6.wzyw);
    r6.y = pow(2.0, r14.x);
    r11.w = xe_max4(r19.zyxz);
    r6.z = pow(2.0, r14.w);
    r12.x = xe_max4(r18.zyxz);
    r8.x = pow(2.0, r14.y);
    r12.y = xe_max4(r12.wzyw);
    r8.y = pow(2.0, r8.y);
    r12.z = xe_max4(r17.zyxz);
    r8.z = pow(2.0, r8.z);
    r12.w = xe_max4(r16.zyxz);
    r8.w = pow(2.0, r8.w);
    r8 = min(r15.xwyz, r8);
    r6.w = pow(2.0, r14.z);
    r6 = min(r13.xwyz, r6);
    r2.w = dot(r6.wzxy, float4(1.0, 1.0, 1.0, 1.0));
    r1.w = dot(r8.wzxy, float4(1.0, 1.0, 1.0, 1.0));
    r0.z = r12.y * BloomScale.x + r8.x;
    r0.w = r11.x * BloomScale.x + r6.x;
    r6.xyz = r12.xzw * BloomScale.xxx + r6.ywz;
    r8.xyz = r11.wyz * BloomScale.xxx + r8.ywz;
    r1.xyz = r8.yyy * r1.zyx;
    r2.xyz = r6.yyy * r2.zyx;
    r2.xyz = r6.zzz * r10.xzy + r2.zxy;
    r1.xyz = r8.zzz * r9.xzy + r1.zxy;
    r1.xyz = r8.xxx * r7.xzy + r1.xyz;
    r2.xyz = r6.xxx * r5.xzy + r2.xyz;
    r2.xyz = r0.www * r4.xzy + r2.xyz;
    r1.xyz = r0.zzz * r3.xzy + r1.xyz;
    r2 = r2.xzyw + r1.xzyw;
    r0.z = tex2D(SceneDepthTexture, r0.xy + float2(0.0, 2.0) * SceneDepthTexture_TexelSize.xy).x;
    r1.xyz = tex2D(SceneColorTexture, r0.xy + float2(0.0, 2.0) * SceneColorTexture_TexelSize.xy).zyx;
    r11.xyz = tex2D(SceneColorTexture, r0.xy + float2(3.0, 2.0) * SceneColorTexture_TexelSize.xy).xyz;
    r10.xyz = tex2D(SceneColorTexture, r0.xy + float2(2.0, 2.0) * SceneColorTexture_TexelSize.xy).xyz;
    r9.xyz = tex2D(SceneColorTexture, r0.xy + float2(1.0, 2.0) * SceneColorTexture_TexelSize.xy).xyz;
    r3.xyz = tex2D(SceneColorTexture, r0.xy + float2(0.0, 3.0) * SceneColorTexture_TexelSize.xy).xyz;
    r7.xyz = tex2D(SceneColorTexture, r0.xy + float2(3.0, 3.0) * SceneColorTexture_TexelSize.xy).xyz;
    r6.xyz = tex2D(SceneColorTexture, r0.xy + float2(2.0, 3.0) * SceneColorTexture_TexelSize.xy).xyz;
    r8.x = tex2D(SceneDepthTexture, r0.xy + float2(2.0, 2.0) * SceneDepthTexture_TexelSize.xy).x;
    r8.y = tex2D(SceneDepthTexture, r0.xy + float2(1.0, 2.0) * SceneDepthTexture_TexelSize.xy).x;
    r8.z = tex2D(SceneDepthTexture, r0.xy + float2(0.0, 3.0) * SceneDepthTexture_TexelSize.xy).x;
    r5.xyz = tex2D(SceneColorTexture, r0.xy + float2(1.0, 3.0) * SceneColorTexture_TexelSize.xy).xyz;
    r4.x = tex2D(SceneDepthTexture, r0.xy + float2(3.0, 2.0) * SceneDepthTexture_TexelSize.xy).x;
    r4.y = tex2D(SceneDepthTexture, r0.xy + float2(3.0, 3.0) * SceneDepthTexture_TexelSize.xy).x;
    r4.z = tex2D(SceneDepthTexture, r0.xy + float2(2.0, 3.0) * SceneDepthTexture_TexelSize.xy).x;
    r4.w = tex2D(SceneDepthTexture, r0.xy + float2(1.0, 3.0) * SceneDepthTexture_TexelSize.xy).x;
    r4 = r4 * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    r8.w = r0.z * MinZ_MaxZRatio.z;
    r0.x = 1.0 / r4.y;
    r15.xyz = float3((r5.zyx > 1.0));
    r0.y = 1.0 / r4.z;
    r8.xyz = r8.xzy * MinZ_MaxZRatio.zzz;
    r0.z = 1.0 / r4.w;
    r12 = r8 - MinZ_MaxZRatio.wwww;
    r8.x = 1.0 / r4.x;
    r16.xyz = float3((r6.zyx > 1.0));
    r8.y = 1.0 / r12.x;
    r4.yzw = float3((r7.zyx > 1.0));
    r8.z = 1.0 / r12.z;
    r17.xyz = float3((r3.zyx > 1.0));
    r8.w = 1.0 / r12.w;
    r8 = r8 - PackedParameters.xxxx;
    r0.w = 1.0 / r12.y;
    r0 = r0 - PackedParameters.xxxx;
    r13 = (-r0.wyxz > 0.0) ? MinMaxBlurClamp.xxxx : MinMaxBlurClamp.yyyy;
    r14 = (-r8.wyxz > 0.0) ? MinMaxBlurClamp.xxxx : MinMaxBlurClamp.yyyy;
    r8 = r8.wxyz * PackedParameters.yyyy;
    r18.xyz = float3((r9.zyx > 1.0));
    r8.x = log2(abs(r8.x));
    r19.xyz = float3((r10.zyx > 1.0));
    r8.y = log2(abs(r8.y));
    r0 = r0.wxyz * PackedParameters.yyyy;
    r8.z = log2(abs(r8.z));
    r12.yzw = float3((r11.zyx > 1.0));
    r0.x = log2(abs(r0.x));
    r20.xyz = float3((r1.xyz > 1.0));
    r0.y = log2(abs(r0.y));
    r12.x = xe_max4(r20.zyxz);
    r0.z = log2(abs(r0.z));
    r12.y = xe_max4(r12.wzyw);
    r0.w = log2(abs(r0.w));
    r0 = r0.xwzy * PackedParameters.zzzz;
    r8.w = log2(abs(r8.w));
    r12.z = xe_max4(r19.zyxz);
    r0.x = pow(2.0, r0.x);
    r12.w = xe_max4(r18.zyxz);
    r0.y = pow(2.0, r0.y);
    r8 = r8.xwzy * PackedParameters.zzzz;
    r0.z = pow(2.0, r0.z);
    r4.x = xe_max4(r17.zyxz);
    r8.x = pow(2.0, r8.x);
    r4.y = xe_max4(r4.wzyw);
    r8.y = pow(2.0, r8.y);
    r4.z = xe_max4(r16.zyxz);
    r8.z = pow(2.0, r8.z);
    r4.w = xe_max4(r15.zyxz);
    r8.w = pow(2.0, r8.w);
    r8 = min(r14.xwyz, r8);
    r0.w = pow(2.0, r0.w);
    r0 = min(r13.xwyz, r0);
    r4 = r4.xywz * BloomScale.xxxx + r0.xwyz;
    r1.w = dot(r0.wzxy, float4(1.0, 1.0, 1.0, 1.0));
    r0.x = dot(r8.wzxy, float4(1.0, 1.0, 1.0, 1.0));
    r8 = r12.xywz * BloomScale.xxxx + r8.xwyz;
    r0.yzw = r8.yyy * r11.zyx;
    r0.yzw = r8.www * r10.zyx + r0.yzw;
    r0.yzw = r8.zzz * r9.zxy + r0.ywz;
    r0.yzw = r8.xxx * r1.xyz + r0.ywz;
    r0 = r0.wzyx + r2;
    r0.w = r0.w + r1.w;
    r0.xyz = r4.yyy * r7.xyz + r0.xyz;
    r0.xyz = r4.www * r6.zxy + r0.zxy;
    r0.xyz = r4.zzz * r5.zxy + r0.xyz;
    r0.xyz = r4.xxx * r3.xyz + r0.yzx;
    oC0 = r0 * 0.03125;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
