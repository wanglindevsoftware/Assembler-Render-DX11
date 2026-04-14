section .rdata align=16

shaderWorldName db 'embedded_world.hlsl', 0
shaderUiName    db 'embedded_ui.hlsl', 0

shaderWorldSource:
    db 'cbuffer WorldCB : register(b0)', 13, 10
    db '{', 13, 10
    db '    float gAngle;', 13, 10
    db '    float gCubeY;', 13, 10
    db '    float gHeld;', 13, 10
    db '    float gEnergy;', 13, 10
    db '    float3 gCamPos;', 13, 10
    db '    float gCamYaw;', 13, 10
    db '    float gCamPitch;', 13, 10
    db '    float gCamFov;', 13, 10
    db '    float gAspect;', 13, 10
    db '    float gLight;', 13, 10
    db '    float gShaderMode;', 13, 10
    db '    float gCubeHeight01;', 13, 10
    db '    float gPad0;', 13, 10
    db '    float gPad1;', 13, 10
    db '};', 13, 10
    db '', 13, 10
    db 'float3 ModeTint(float mode)', 13, 10
    db '{', 13, 10
    db '    if (mode < 0.5f) return float3(0.34f, 0.55f, 0.95f);', 13, 10
    db '    if (mode < 1.5f) return float3(0.30f, 0.68f, 0.38f);', 13, 10
    db '    return float3(0.96f, 0.56f, 0.32f);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float3 ModeSkyTop(float mode)', 13, 10
    db '{', 13, 10
    db '    if (mode < 0.5f) return float3(0.08f, 0.19f, 0.46f);', 13, 10
    db '    if (mode < 1.5f) return float3(0.08f, 0.20f, 0.22f);', 13, 10
    db '    return float3(0.24f, 0.10f, 0.24f);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float3 ModeSkyHorizon(float mode)', 13, 10
    db '{', 13, 10
    db '    if (mode < 0.5f) return float3(0.72f, 0.82f, 1.00f);', 13, 10
    db '    if (mode < 1.5f) return float3(0.66f, 0.85f, 0.64f);', 13, 10
    db '    return float3(1.00f, 0.70f, 0.42f);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float3 ModeSkyBottom(float mode)', 13, 10
    db '{', 13, 10
    db '    if (mode < 0.5f) return float3(0.48f, 0.58f, 0.72f);', 13, 10
    db '    if (mode < 1.5f) return float3(0.26f, 0.31f, 0.24f);', 13, 10
    db '    return float3(0.40f, 0.26f, 0.18f);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float3 ModeSunColor(float mode)', 13, 10
    db '{', 13, 10
    db '    if (mode < 0.5f) return float3(1.00f, 0.95f, 0.82f);', 13, 10
    db '    if (mode < 1.5f) return float3(1.00f, 0.97f, 0.84f);', 13, 10
    db '    return float3(1.00f, 0.76f, 0.46f);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float Hash21(float2 p)', 13, 10
    db '{', 13, 10
    db '    p = frac(p * float2(123.34f, 345.45f));', 13, 10
    db '    p += dot(p, p + 34.345f);', 13, 10
    db '    return frac(p.x * p.y);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float Noise2(float2 p)', 13, 10
    db '{', 13, 10
    db '    float2 i = floor(p);', 13, 10
    db '    float2 f = frac(p);', 13, 10
    db '    float a = Hash21(i);', 13, 10
    db '    float b = Hash21(i + float2(1,0));', 13, 10
    db '    float c = Hash21(i + float2(0,1));', 13, 10
    db '    float d = Hash21(i + float2(1,1));', 13, 10
    db '    float2 u = f * f * (3.0f - 2.0f * f);', 13, 10
    db '    return lerp(lerp(a,b,u.x), lerp(c,d,u.x), u.y);', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float Fbm(float2 p)', 13, 10
    db '{', 13, 10
    db '    float n = 0.0f;', 13, 10
    db '    float a = 0.5f;', 13, 10
    db '    n += a * Noise2(p); p = p * 2.02f + 17.0f; a *= 0.5f;', 13, 10
    db '    n += a * Noise2(p); p = p * 2.07f - 9.0f; a *= 0.5f;', 13, 10
    db '    n += a * Noise2(p); p = p * 2.11f + 4.0f; a *= 0.5f;', 13, 10
    db '    n += a * Noise2(p);', 13, 10
    db '    return n;', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'struct VSIn', 13, 10
    db '{', 13, 10
    db '    float3 pos    : POSITION;', 13, 10
    db '    float4 color  : COLOR0;', 13, 10
    db '    float  weight : TEXCOORD0;', 13, 10
    db '};', 13, 10
    db '', 13, 10
    db 'struct VSOut', 13, 10
    db '{', 13, 10
    db '    float4 pos      : SV_POSITION;', 13, 10
    db '    float4 color    : COLOR0;', 13, 10
    db '    float3 worldPos : TEXCOORD0;', 13, 10
    db '    float  camZ     : TEXCOORD1;', 13, 10
    db '    float  cubeMask : TEXCOORD2;', 13, 10
    db '};', 13, 10
    db '', 13, 10
    db 'VSOut VSMain(VSIn i)', 13, 10
    db '{', 13, 10
    db '    VSOut o;', 13, 10
    db '    float3 p = i.pos;', 13, 10
    db '', 13, 10
    db '    if (i.weight > 1.5f)', 13, 10
    db '    {', 13, 10
    db '        p += gCamPos;', 13, 10
    db '    }', 13, 10
    db '    else if (i.weight > 0.5f && i.weight < 1.5f)', 13, 10
    db '    {', 13, 10
    db '        p.y += gCubeY;', 13, 10
    db '    }', 13, 10
    db '', 13, 10
    db '    float cp = cos(gCamPitch);', 13, 10
    db '    float sp = sin(gCamPitch);', 13, 10
    db '    float cy = cos(gCamYaw);', 13, 10
    db '    float sy = sin(gCamYaw);', 13, 10
    db '    float3 forward = normalize(float3(-sy * cp, -sp, cy * cp));', 13, 10
    db '    float3 right   = normalize(float3(cy, 0.0f, sy));', 13, 10
    db '    float3 up      = normalize(cross(forward, right));', 13, 10
    db '', 13, 10
    db '    float3 rel = p - gCamPos;', 13, 10
    db '    float3 view;', 13, 10
    db '    view.x = dot(rel, right);', 13, 10
    db '    view.y = dot(rel, up);', 13, 10
    db '    view.z = dot(rel, forward);', 13, 10
    db '', 13, 10
    db '    float nearZ = 0.05f;', 13, 10
    db '    float farZ = 160.0f;', 13, 10
    db '    float yScale = 1.0f / tan(gCamFov * 0.5f);', 13, 10
    db '    float xScale = yScale / max(gAspect, 0.1f);', 13, 10
    db '    float clipZ = view.z * (farZ / (farZ - nearZ)) - (nearZ * farZ / (farZ - nearZ));', 13, 10
    db '', 13, 10
    db '    o.pos = float4(view.x * xScale, view.y * yScale, clipZ, view.z);', 13, 10
    db '    o.color = i.color;', 13, 10
    db '    o.worldPos = p;', 13, 10
    db '    o.camZ = max(view.z, nearZ);', 13, 10
    db '    o.cubeMask = i.weight;', 13, 10
    db '    return o;', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float4 PSMain(VSOut i, bool isFrontFace : SV_IsFrontFace) : SV_TARGET', 13, 10
    db '{', 13, 10
    db '    float3 sunDir = normalize(float3(0.22f, 0.72f, 0.66f));', 13, 10
    db '    float3 sunCol = ModeSunColor(gShaderMode);', 13, 10
    db '', 13, 10
    db '    if (i.cubeMask > 1.5f)', 13, 10
    db '    {', 13, 10
    db '        float3 rayDir = normalize(i.worldPos - gCamPos);', 13, 10
    db '        float3 top = ModeSkyTop(gShaderMode);', 13, 10
    db '        float3 horizon = ModeSkyHorizon(gShaderMode);', 13, 10
    db '        float3 bottom = ModeSkyBottom(gShaderMode);', 13, 10
    db '', 13, 10
    db '        float upness = saturate(rayDir.y * 0.5f + 0.5f);', 13, 10
    db '        float3 col = lerp(bottom, horizon, smoothstep(0.0f, 0.50f, upness));', 13, 10
    db '        col = lerp(col, top, smoothstep(0.55f, 1.00f, upness));', 13, 10
    db '', 13, 10
    db '        float haze = pow(saturate(1.0f - abs(rayDir.y) * 1.9f), 3.0f);', 13, 10
    db '        col += horizon * haze * 0.18f;', 13, 10
    db '', 13, 10
    db '        float sunDot = saturate(dot(rayDir, sunDir));', 13, 10
    db '        float sunDisk = pow(sunDot, 1800.0f);', 13, 10
    db '        float sunGlow = pow(sunDot, 42.0f);', 13, 10
    db '        float sunBloom = pow(sunDot, 8.0f);', 13, 10
    db '        float sunHalo = pow(sunDot, 2.0f);', 13, 10
    db '', 13, 10
    db '        float2 skyUV = rayDir.xz / max(0.25f, rayDir.y + 1.20f);', 13, 10
    db '        float c0 = Fbm(skyUV * 1.10f + float2(gAngle * 0.007f, -gAngle * 0.004f));', 13, 10
    db '        float c1 = Fbm(skyUV * 2.40f - float2(gAngle * 0.010f, gAngle * 0.006f) + 9.2f);', 13, 10
    db '        float c2 = Fbm(skyUV * 4.20f + float2(2.7f, -1.8f));', 13, 10
    db '        float cloudShape = c0 * 0.55f + c1 * 0.30f + c2 * 0.15f;', 13, 10
    db '        float cloudMask = smoothstep(0.56f, 0.78f, cloudShape) * smoothstep(-0.08f, 0.55f, rayDir.y);', 13, 10
    db '        float cloudLight = 0.55f + 0.45f * sunGlow;', 13, 10
    db '        float3 cloudCol = lerp(float3(0.90f, 0.94f, 1.00f), sunCol, 0.18f * sunBloom) * cloudLight;', 13, 10
    db '', 13, 10
    db '        col = lerp(col, cloudCol, cloudMask * 0.45f);', 13, 10
    db '        col += sunCol * sunHalo * 0.05f;', 13, 10
    db '        col += sunCol * sunBloom * (0.22f + 0.10f * gLight);', 13, 10
    db '        col += sunCol * sunGlow * (0.26f + 0.12f * gLight);', 13, 10
    db '        col += sunCol * sunDisk * (1.25f + 0.30f * gLight);', 13, 10
    db '', 13, 10
    db '        return float4(saturate(col), 1.0f);', 13, 10
    db '    }', 13, 10
    db '', 13, 10
    db '    float3 dpdx = ddx(i.worldPos);', 13, 10
    db '    float3 dpdy = ddy(i.worldPos);', 13, 10
    db '    float3 n = normalize(cross(dpdx, dpdy));', 13, 10
    db '    if (!isFrontFace) n = -n;', 13, 10
    db '', 13, 10
    db '    float3 viewDir = normalize(gCamPos - i.worldPos);', 13, 10
    db '    float ndl = saturate(dot(n, sunDir));', 13, 10
    db '    float hemi = saturate(n.y * 0.5f + 0.5f);', 13, 10
    db '    float3 halfVec = normalize(sunDir + viewDir);', 13, 10
    db '    float spec = pow(saturate(dot(n, halfVec)), 42.0f) * (0.10f + 0.20f * saturate(i.cubeMask));', 13, 10
    db '    float rim = pow(1.0f - saturate(dot(n, viewDir)), 2.6f);', 13, 10
    db '    float fog = saturate((i.camZ - 28.0f) / 90.0f);', 13, 10
    db '', 13, 10
    db '    float3 base = i.color.rgb;', 13, 10
    db '    float cubeMask = saturate(i.cubeMask);', 13, 10
    db '    float groundMask = 1.0f - cubeMask;', 13, 10
    db '    float height01 = saturate((i.worldPos.y + 1.4f) * 0.60f);', 13, 10
    db '    float slope = 1.0f - saturate(n.y);', 13, 10
    db '', 13, 10
    db '    float3 terrainA = float3(0.16f, 0.28f, 0.18f);', 13, 10
    db '    float3 terrainB = float3(0.26f, 0.36f, 0.20f);', 13, 10
    db '    float3 terrainC = float3(0.42f, 0.34f, 0.22f);', 13, 10
    db '    float3 terrainCol = lerp(terrainA, terrainB, height01);', 13, 10
    db '    terrainCol = lerp(terrainCol, terrainC, saturate(height01 * 1.3f + slope * 0.8f));', 13, 10
    db '', 13, 10
    db '    float moss = 0.5f + 0.5f * sin(i.worldPos.x * 0.42f + i.worldPos.z * 0.31f);', 13, 10
    db '    float ridge = 0.5f + 0.5f * sin(i.worldPos.x * 1.8f) * cos(i.worldPos.z * 1.5f);', 13, 10
    db '    terrainCol *= 0.88f + 0.16f * moss + 0.12f * ridge;', 13, 10
    db '', 13, 10
    db '    base = lerp(terrainCol, base, cubeMask);', 13, 10
    db '', 13, 10
    db '    float cubePulse = saturate(gEnergy * 0.60f + gHeld * 0.35f);', 13, 10
    db '    float3 modeTint = ModeTint(gShaderMode);', 13, 10
    db '    float3 skyFog = ModeSkyHorizon(gShaderMode) * 0.74f + ModeSkyTop(gShaderMode) * 0.26f;', 13, 10
    db '', 13, 10
    db '    float cubeHalf = 0.55f;', 13, 10
    db '    float shadowDist = max(gCubeY + cubeHalf - i.worldPos.y, 0.0f);', 13, 10
    db '    float2 shadowCenter = -sunDir.xz * (shadowDist / max(sunDir.y, 0.18f));', 13, 10
    db '    float shadowRadius = 0.80f + shadowDist * 0.38f;', 13, 10
    db '    float shadowShape = 1.0f - saturate(length((i.worldPos.xz - shadowCenter) / max(shadowRadius, 0.1f)));', 13, 10
    db '    float softShadow = smoothstep(0.0f, 1.0f, shadowShape);', 13, 10
    db '    softShadow *= groundMask;', 13, 10
    db '    softShadow *= 0.10f + 0.34f * saturate(1.0f - shadowDist * 0.25f);', 13, 10
    db '', 13, 10
    db '    float contactShadow = groundMask * saturate(1.25f - length(i.worldPos.xz) * 0.65f) * (0.10f + 0.20f * gCubeHeight01);', 13, 10
    db '', 13, 10
    db '    float3 ambientGround = lerp(float3(0.10f, 0.12f, 0.10f), float3(0.22f, 0.28f, 0.22f), hemi);', 13, 10
    db '    float3 ambientCube = lerp(float3(0.13f, 0.15f, 0.18f), float3(0.28f, 0.34f, 0.44f), hemi);', 13, 10
    db '    float3 ambient = lerp(ambientGround, ambientCube, cubeMask);', 13, 10
    db '    float3 diffuse = base * (0.30f + ndl * (0.80f + 0.58f * gLight));', 13, 10
    db '    float3 lit = ambient + diffuse;', 13, 10
    db '    lit += spec.xxx * (0.55f + 0.32f * gLight);', 13, 10
    db '    lit += rim * lerp(float3(0.16f, 0.22f, 0.30f), sunCol, 0.38f);', 13, 10
    db '    lit += cubePulse * cubeMask * modeTint * 0.24f;', 13, 10
    db '    lit -= (softShadow + contactShadow).xxx;', 13, 10
    db '    lit = max(lit, 0.03f);', 13, 10
    db '', 13, 10
    db '    float3 finalColor = lerp(lit, skyFog, fog);', 13, 10
    db '    return float4(saturate(finalColor), 1.0f);', 13, 10
    db '}', 13, 10
shaderWorldSourceEnd:
shaderWorldSourceLen equ shaderWorldSourceEnd - shaderWorldSource

shaderUiSource:
    db 'struct VSIn', 13, 10
    db '{', 13, 10
    db '    float2 pos   : POSITION;', 13, 10
    db '    float4 color : COLOR0;', 13, 10
    db '};', 13, 10
    db '', 13, 10
    db 'struct VSOut', 13, 10
    db '{', 13, 10
    db '    float4 pos   : SV_POSITION;', 13, 10
    db '    float4 color : COLOR0;', 13, 10
    db '};', 13, 10
    db '', 13, 10
    db 'VSOut VSMain(VSIn i)', 13, 10
    db '{', 13, 10
    db '    VSOut o;', 13, 10
    db '    o.pos = float4(i.pos, 0.0f, 1.0f);', 13, 10
    db '    o.color = i.color;', 13, 10
    db '    return o;', 13, 10
    db '}', 13, 10
    db '', 13, 10
    db 'float4 PSMain(VSOut i) : SV_TARGET', 13, 10
    db '{', 13, 10
    db '    return i.color;', 13, 10
    db '}', 13, 10
shaderUiSourceEnd:
shaderUiSourceLen equ shaderUiSourceEnd - shaderUiSource
