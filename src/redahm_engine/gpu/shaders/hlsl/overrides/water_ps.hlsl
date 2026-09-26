// Replaces the title's pool water pixel shader (guest hash 0x55CDEE52F6BAB335,
// a UE3 material: three panned samples of one normal map, a reflection cube
// map, a light's specular highlight and a Fresnel term that also sets alpha).
//
// The title's shader leaves black dashes on the water, on the 360 as well:
// where the panned normals tip away from the camera (N.V < 0, common at the far
// side of the pool and at shallow angles) its Fresnel term saturates, making
// the pixel opaque, and the reflection vector points down into the cube map's
// dark lower half. Here the normal is bent back towards the viewer and the
// reflection kept at or above the horizon. Otherwise it computes what the
// title's does, from the same constants and textures.
//
// The cube map is a small, fixed picture of the level, so the water also
// traces its reflection through the scene on screen (Crypto, people, palms,
// buildings within kTraceDistance), falling back to the cube map where the
// ray finds nothing or leaves the screen. The renderer copies the scene and
// passes the view in c32-c43 (draw.cpp, screen-space reflections).
//
// Built like XenosRecomp's own output (ps_6_0 / SPIR-V, REDAHM_RECOMP layout),
// minus the alpha test, which this material never enables.

#include "shader_common.h"

#ifdef __spirv__

#define OpacityOverride vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 288, 0x10)
#define SCENE_COLOR_BIAS_FACTOR vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 0, 0x10)
#define Texture2D_0_Texture2DDescriptorIndex vk::RawBufferLoad<uint>(g_PushConstants.SharedConstants + 0)
#define Texture2D_0_SamplerDescriptorIndex vk::RawBufferLoad<uint>(g_PushConstants.SharedConstants + 192)
#define TextureCube_0_TextureCubeDescriptorIndex vk::RawBufferLoad<uint>(g_PushConstants.SharedConstants + 132)
#define TextureCube_0_SamplerDescriptorIndex vk::RawBufferLoad<uint>(g_PushConstants.SharedConstants + 196)
#define UniformScalar_17 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 208, 0x10)
#define UniformScalar_18 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 224, 0x10)
#define UniformScalar_19 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 240, 0x10)
#define UniformScalar_20 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 256, 0x10)
#define UniformScalar_21 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 272, 0x10)
#define UniformScalar_6 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 192, 0x10)
#define UniformVector_0 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 48, 0x10)
#define UniformVector_2 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 64, 0x10)
#define UniformVector_3 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 80, 0x10)
#define UniformVector_4 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 96, 0x10)
#define UniformVector_5 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 112, 0x10)
#define UniformVector_6 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 128, 0x10)
#define UniformVector_7 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 144, 0x10)
#define UniformVector_8 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 160, 0x10)
#define UniformVector_9 vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 176, 0x10)
#define Reflection_ViewProjection(i) vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 512 + (i) * 16, 0x10)
#define Reflection_InverseViewProjection(i) vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 576 + (i) * 16, 0x10)
#define Reflection_CameraPosition vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 640, 0x10)
#define Reflection_Viewport vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 656, 0x10)
#define Reflection_DepthRange vk::RawBufferLoad<float4>(g_PushConstants.PixelShaderConstants + 672, 0x10)
#define Reflection_Slots vk::RawBufferLoad<uint4>(g_PushConstants.PixelShaderConstants + 688, 0x10)

#else

cbuffer PixelShaderConstants : register(b1, space4)
{
	float4 OpacityOverride : packoffset(c18);
	float4 SCENE_COLOR_BIAS_FACTOR : packoffset(c0);
	float4 UniformScalar_17 : packoffset(c13);
	float4 UniformScalar_18 : packoffset(c14);
	float4 UniformScalar_19 : packoffset(c15);
	float4 UniformScalar_20 : packoffset(c16);
	float4 UniformScalar_21 : packoffset(c17);
	float4 UniformScalar_6 : packoffset(c12);
	float4 UniformVector_0 : packoffset(c3);
	float4 UniformVector_2 : packoffset(c4);
	float4 UniformVector_3 : packoffset(c5);
	float4 UniformVector_4 : packoffset(c6);
	float4 UniformVector_5 : packoffset(c7);
	float4 UniformVector_6 : packoffset(c8);
	float4 UniformVector_7 : packoffset(c9);
	float4 UniformVector_8 : packoffset(c10);
	float4 UniformVector_9 : packoffset(c11);
	// Written by the renderer (draw.cpp, screen-space reflections).
	float4 Reflection_ViewProjectionArr[4] : packoffset(c32);
	float4 Reflection_InverseViewProjectionArr[4] : packoffset(c36);
	float4 Reflection_CameraPosition : packoffset(c40);
	float4 Reflection_Viewport : packoffset(c41);
	float4 Reflection_DepthRange : packoffset(c42);
	uint4 Reflection_Slots : packoffset(c43);
};

#define Reflection_ViewProjection(i) Reflection_ViewProjectionArr[i]
#define Reflection_InverseViewProjection(i) Reflection_InverseViewProjectionArr[i]

cbuffer SharedConstants : register(b2, space4)
{
	uint Texture2D_0_Texture2DDescriptorIndex : packoffset(c0.x);
	uint Texture2D_0_SamplerDescriptorIndex : packoffset(c12.x);
	uint TextureCube_0_TextureCubeDescriptorIndex : packoffset(c8.y);
	uint TextureCube_0_SamplerDescriptorIndex : packoffset(c12.y);
	DEFINE_SHARED_CONSTANTS();
};

#endif

// Pan speeds of the three normal map layers, times UniformScalar_6 (time).
static const float3 kPanSpeeds = float3(1.19, 0.973, 1.04);
static const float3 kLuminance = float3(0.3, 0.59, 0.11);
// N.V is kept at least this fraction of a flat surface's (tangent space z).
static const float kMinFacing = 0.5;

float3 SampleNormal(float2 uv)
{
	return tfetch2D(Texture2D_0_Texture2DDescriptorIndex, Texture2D_0_SamplerDescriptorIndex, uv,
	                float2(0, 0)).xyz;
}

// The title's cube map lookup: Xenos cube() face coordinates, then tfetchCube.
float3 SampleReflection(float3 direction)
{
	CubeMapData cubeMapData = (CubeMapData)0;
	float4 face = cube(direction.xyzz, cubeMapData);
	float3 coords;
	coords.z = face.w;
	coords.xy = face.yx * rcp(abs(face.z)) + 1.5;
	return tfetchCube(TextureCube_0_TextureCubeDescriptorIndex, TextureCube_0_SamplerDescriptorIndex,
	                  coords, cubeMapData).xyz;
}

float FresnelPower(float base, float exponent)
{
	return exp2(clamp(log2(abs(base)), FLT_MIN, FLT_MAX) * exponent);
}

//------------------------------------------------------------------------------
// Screen-space reflections, through the renderer's half-size copies of the
// scene colour and depth taken before the water draws.
//------------------------------------------------------------------------------

// How far (world units) reflected rays look for something to reflect.
static const float kTraceDistance = 2500.0;
// Scene surfaces further than this from the camera (view depth, world units)
// count as sky.
static const float kSkyDistance = 30000.0;
static const int kTraceSteps = 64;
static const int kRefineSteps = 8;
// View depth (world units) a crossing may overshoot the scene's surface by,
// beyond the step's own change in depth: slack for the half-size depth copy.
static const float kHitTolerance = 20.0;
// Ripples bend the traced ray less than the cube map lookup, so what is
// reflected stays recognisable.
static const float kTraceRipple = 0.15;
// How much of a traced reflection shows, looking straight down and at a
// grazing angle, and the water's colour cast on it.
static const float2 kReflectionStrength = float2(0.35, 0.8);
static const float3 kReflectionTint = float3(0.85, 0.95, 1.0);

float4 ToClip(float3 world)
{
	return world.x * Reflection_ViewProjection(0) + world.y * Reflection_ViewProjection(1) +
	       world.z * Reflection_ViewProjection(2) + Reflection_ViewProjection(3);
}

float3 FromNdc(float3 ndc)
{
	float4 world = ndc.x * Reflection_InverseViewProjection(0) +
	               ndc.y * Reflection_InverseViewProjection(1) +
	               ndc.z * Reflection_InverseViewProjection(2) + Reflection_InverseViewProjection(3);
	return world.xyz / world.w;
}

// Window depth (as the viewport wrote it) to NDC depth, and back.
float NdcDepth(float windowDepth)
{
	const float range = Reflection_DepthRange.y - Reflection_DepthRange.x;
	return abs(range) > 1e-6 ? (windowDepth - Reflection_DepthRange.x) / range : windowDepth;
}

// NDC xy to the copies' texture coordinates (they cover the whole target).
float2 CopyCoords(float2 ndc)
{
	const float2 pixel = Reflection_Viewport.xy +
	                     (ndc * float2(0.5, -0.5) + 0.5) * Reflection_Viewport.zw;
	return pixel * Reflection_DepthRange.zw;
}

// How far behind the scene's surface at q's pixel q lies, in view depth.
float DepthBehindScene(float4 clip, float2 coords)
{
	Texture2D<float4> depthCopy = g_Texture2DDescriptorHeap[Reflection_Slots.y];
	const float sceneDepth = NdcDepth(
		depthCopy.SampleLevel(g_SamplerDescriptorHeap[Reflection_Slots.z], coords, 0.0).r);
	const float3 ndc = clip.xyz / clip.w;
	const float sceneW = ToClip(FromNdc(float3(ndc.xy, sceneDepth))).w;
	return clip.w - sceneW;
}

// The sky the ray reaches when nothing on the way stops it. The sky is as good
// as infinitely far, so it lies where the direction itself projects (w = 0,
// the camera's position dropping out); where the screen shows sky there, the
// copy has it.
float3 TraceSky(float3 direction, out float weight)
{
	weight = 0.0;
	const float4 clip = direction.x * Reflection_ViewProjection(0) +
	                    direction.y * Reflection_ViewProjection(1) +
	                    direction.z * Reflection_ViewProjection(2);
	if (clip.w <= 0.0)
		return 0.0;
	const float2 coords = CopyCoords(clip.xy / clip.w);
	if (any(coords < 0.0) || any(coords > 1.0))
		return 0.0;
	// Only where nothing nearer than the sky covers that part of the screen.
	Texture2D<float4> depthCopy = g_Texture2DDescriptorHeap[Reflection_Slots.y];
	const float sceneDepth = NdcDepth(
		depthCopy.SampleLevel(g_SamplerDescriptorHeap[Reflection_Slots.z], coords, 0.0).r);
	const float sceneW = ToClip(FromNdc(float3(clip.xy / clip.w, sceneDepth))).w;
	if (!(sceneW > kSkyDistance))
		return 0.0;
	const float2 edge = saturate(min(coords, 1.0 - coords) * 10.0);
	weight = edge.x * edge.y;
	Texture2D<float4> colorCopy = g_Texture2DDescriptorHeap[Reflection_Slots.x];
	return colorCopy.SampleLevel(g_SamplerDescriptorHeap[Reflection_Slots.w], coords, 0.0).rgb;
}

// The scene colour the ray from `origin` along `direction` meets, or the sky
// behind everything, with how much to trust it (0 when it leaves the screen
// or finds nothing).
float3 TraceScene(float3 origin, float3 direction, out float weight)
{
	weight = 0.0;
	float previous = 0.0;
	float previousW = ToClip(origin).w;
	// The ray starts on the water, in front of whatever lies under it.
	bool previousInFront = true;
	for (int i = 1; i <= kTraceSteps; ++i)
	{
		// Denser steps near the water, where contact matters most.
		const float fraction = float(i) / kTraceSteps;
		const float t = kTraceDistance * fraction * fraction;
		const float4 clip = ToClip(origin + direction * t);
		if (clip.w <= 0.0)
			break;
		const float2 coords = CopyCoords(clip.xy / clip.w);
		if (any(coords < 0.0) || any(coords > 1.0))
			break;
		const float behind = DepthBehindScene(clip, coords);
		// A hit is the ray crossing from in front of the scene's surface to
		// behind it within this step, by no more than the step moved in depth.
		// Samples already behind something (the ray passing behind Crypto)
		// are not hits: they smeared and repeated what was in front.
		const bool crossed = behind > 0.0 && previousInFront &&
		                     behind <= abs(clip.w - previousW) + kHitTolerance;
		previousInFront = behind <= 0.0;
		previousW = clip.w;
		if (crossed)
		{
			// Narrow the crossing down.
			float before = previous, after = t;
			for (int j = 0; j < kRefineSteps; ++j)
			{
				const float middle = 0.5 * (before + after);
				const float4 middleClip = ToClip(origin + direction * middle);
				if (DepthBehindScene(middleClip, CopyCoords(middleClip.xy / middleClip.w)) > 0.0)
					after = middle;
				else
					before = middle;
			}
			const float4 hitClip = ToClip(origin + direction * after);
			const float2 hit = CopyCoords(hitClip.xy / hitClip.w);
			// Fade towards the screen edges and the end of the trace.
			const float2 edge = saturate(min(hit, 1.0 - hit) * 10.0);
			weight = edge.x * edge.y * saturate((1.0 - after / kTraceDistance) * 4.0);
			Texture2D<float4> colorCopy = g_Texture2DDescriptorHeap[Reflection_Slots.x];
			return colorCopy.SampleLevel(g_SamplerDescriptorHeap[Reflection_Slots.w], hit, 0.0).rgb;
		}
		previous = t;
	}
	return TraceSky(direction, weight);
}

#ifndef __spirv__
[shader("pixel")]
#endif
void main(
	in float4 iPos : SV_Position,
	in float4 iTexCoord0 : TEXCOORD0,
	in float4 iTexCoord1 : TEXCOORD1,
	in float4 iTexCoord2 : TEXCOORD2,
	in float4 iTexCoord3 : TEXCOORD3,
	in float4 iTexCoord4 : TEXCOORD4,
	in float4 iTexCoord5 : TEXCOORD5,
	in float4 iTexCoord6 : TEXCOORD6,
	in float4 iTexCoord7 : TEXCOORD7,
	in float4 iTexCoord8 : TEXCOORD8,
	in float4 iTexCoord9 : TEXCOORD9,
	in float4 iTexCoord10 : TEXCOORD10,
	in float4 iTexCoord11 : TEXCOORD11,
	in float4 iTexCoord12 : TEXCOORD12,
	in float4 iTexCoord13 : TEXCOORD13,
	in float4 iTexCoord14 : TEXCOORD14,
	in float4 iTexCoord15 : TEXCOORD15,
	in float4 iColor0 : COLOR0,
	in float4 iColor1 : COLOR1,
	in float4 iColor2 : COLOR2,
#ifdef __spirv__
	in bool iFace : SV_IsFrontFace
#else
	in uint iFace : SV_IsFrontFace
#endif
,
	out float4 oC0 : SV_Target0)
{
	// Three panned layers of the normal map, each in [0, 1], summed back to a
	// signed tangent space normal and scaled per axis.
	const float2 uv = iTexCoord0.xy;
	const float3 speeds = UniformScalar_6.x * kPanSpeeds;
	const float3 layers = SampleNormal(speeds.z * uv + UniformVector_2.xy) +
	                      SampleNormal(speeds.x * uv + UniformVector_4.xy) +
	                      SampleNormal(speeds.y * uv + UniformVector_3.xy);
	float3 normal = normalize((layers * 2.0 - 3.0) * UniformVector_5.xyz);

	// Camera vector (tangent space).
	const float3 view = normalize(iTexCoord6.xyz);

	// Bend normals that face away from the camera back towards it.
	const float minFacing = kMinFacing * saturate(view.z);
	const float facing = dot(normal, view);
	if (facing < minFacing)
		normal = normalize(normal + view * (minFacing - facing));
	const float nDotV = max(dot(normal, view), 0.0);

	// Environment reflection, desaturated and tinted as the material sets.
	float3 reflected = 2.0 * nDotV * normal - view;
	reflected.z = max(reflected.z, 0.0);
	float3 environment = SampleReflection(reflected);
	environment = lerp(environment, dot(environment, kLuminance).xxx, UniformScalar_19.x);
	environment = environment * UniformVector_9.xyz - UniformVector_6.xyz;

	// The light's highlight.
	const float3 light = normalize(UniformVector_8.xyz);
	const float3 lightReflected = 2.0 * dot(light, normal) * normal - light;
	const float highlight = FresnelPower(saturate(dot(view, lightReflected)), UniformScalar_18.x);
	const float3 lit = UniformVector_7.xyz * UniformScalar_17.x * highlight + environment;

	// Fresnel: the reflection's weight and the water's opacity.
	const float fresnel = lerp(FresnelPower(1.0 - nDotV, UniformScalar_20.x), 1.0, UniformScalar_21.x);

	float3 color = lit * fresnel + UniformVector_0.xyz + UniformVector_6.xyz;
	color = color * iTexCoord7.w + iTexCoord7.xyz;  // fog
	float3 outColor = color * SCENE_COLOR_BIAS_FACTOR.x;
	float outAlpha = OpacityOverride.x * fresnel;

	// What really surrounds the water, where the screen shows it: rebuild the
	// pixel's world position and trace the reflection of the camera ray off a
	// flat, gently rippled surface (UE3 is z up).
	const float2 ndcXY = float2((iPos.x - Reflection_Viewport.x) / Reflection_Viewport.z * 2.0 - 1.0,
	                            1.0 - (iPos.y - Reflection_Viewport.y) / Reflection_Viewport.w * 2.0);
	const float3 surface = FromNdc(float3(ndcXY, NdcDepth(iPos.z)));
	const float3 toCamera = normalize(Reflection_CameraPosition.xyz - surface);
	const float3 rippled = normalize(float3(normal.xy * kTraceRipple, 1.0));
	float traceWeight;
	const float3 scene = TraceScene(surface, reflect(-toCamera, rippled), traceWeight);

	// Laid over the finished water rather than through the material's own
	// Fresnel weight, which lets through a fifth of a reflection looking down
	// and left everything but bright highlights invisible. The water blends
	// src * alpha + dest * (1 - alpha); this colour and alpha give
	// lerp(water over dest, reflection, strength).
	const float strength = traceWeight *
	                       lerp(kReflectionStrength.x, kReflectionStrength.y, FresnelPower(1.0 - nDotV, 5.0));
	const float3 reflection = scene * kReflectionTint;
	const float blendedAlpha = 1.0 - (1.0 - outAlpha) * (1.0 - strength);
	if (blendedAlpha > 1e-4)
	{
		outColor = (outColor * outAlpha * (1.0 - strength) + reflection * strength) / blendedAlpha;
		outAlpha = blendedAlpha;
	}
	oC0.xyz = outColor;
	oC0.w = outAlpha;
}
