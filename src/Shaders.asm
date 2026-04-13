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
    db '};', 13, 10
    db 13, 10
    db 'struct VSIn', 13, 10
    db '{', 13, 10
    db '    float3 pos    : POSITION;', 13, 10
    db '    float4 color  : COLOR0;', 13, 10
    db '    float  weight : TEXCOORD0;', 13, 10
    db '};', 13, 10
    db 13, 10
    db 'struct VSOut', 13, 10
    db '{', 13, 10
    db '    float4 pos   : SV_POSITION;', 13, 10
    db '    float4 color : COLOR0;', 13, 10
    db '};', 13, 10
    db 13, 10
    db 'VSOut VSMain(VSIn i)', 13, 10
    db '{', 13, 10
    db '    VSOut o;', 13, 10
    db 13, 10
    db '    float sy = sin(gAngle);', 13, 10
    db '    float cy = cos(gAngle);', 13, 10
    db '    float sx = sin(0.55 + gEnergy * 0.25);', 13, 10
    db '    float cx = cos(0.55 + gEnergy * 0.25);', 13, 10
    db 13, 10
    db '    float3 p = i.pos;', 13, 10
    db '    p.y += gCubeY * i.weight;', 13, 10
    db 13, 10
    db '    float3 ry;', 13, 10
    db '    ry.x = p.x * cy - p.z * sy;', 13, 10
    db '    ry.y = p.y;', 13, 10
    db '    ry.z = p.x * sy + p.z * cy;', 13, 10
    db 13, 10
    db '    float3 r;', 13, 10
    db '    r.x = ry.x;', 13, 10
    db '    r.y = ry.y * cx - ry.z * sx;', 13, 10
    db '    r.z = ry.y * sx + ry.z * cx + 3.4f;', 13, 10
    db 13, 10
    db '    float perspective = 1.35f / max(r.z, 0.25f);', 13, 10
    db 13, 10
    db '    o.pos = float4(r.x * perspective, r.y * perspective, saturate((r.z - 1.0f) / 4.5f), 1.0f);', 13, 10
    db 13, 10
    db '    float pulse = 1.0f + gHeld * 0.20f + gEnergy * 0.15f;', 13, 10
    db '    float3 finalColor = i.color.rgb * pulse;', 13, 10
    db '    o.color = float4(saturate(finalColor), i.color.a);', 13, 10
    db '    return o;', 13, 10
    db '}', 13, 10
    db 13, 10
    db 'float4 PSMain(VSOut i) : SV_TARGET', 13, 10
    db '{', 13, 10
    db '    return i.color;', 13, 10
    db '}', 13, 10
shaderWorldSourceEnd:
shaderWorldSourceLen equ shaderWorldSourceEnd - shaderWorldSource

shaderUiSource:
    db 'struct VSIn', 13, 10
    db '{', 13, 10
    db '    float2 pos   : POSITION;', 13, 10
    db '    float4 color : COLOR0;', 13, 10
    db '};', 13, 10
    db 13, 10
    db 'struct VSOut', 13, 10
    db '{', 13, 10
    db '    float4 pos   : SV_POSITION;', 13, 10
    db '    float4 color : COLOR0;', 13, 10
    db '};', 13, 10
    db 13, 10
    db 'VSOut VSMain(VSIn i)', 13, 10
    db '{', 13, 10
    db '    VSOut o;', 13, 10
    db '    o.pos = float4(i.pos, 0.0f, 1.0f);', 13, 10
    db '    o.color = i.color;', 13, 10
    db '    return o;', 13, 10
    db '}', 13, 10
    db 13, 10
    db 'float4 PSMain(VSOut i) : SV_TARGET', 13, 10
    db '{', 13, 10
    db '    return i.color;', 13, 10
    db '}', 13, 10
shaderUiSourceEnd:
shaderUiSourceLen equ shaderUiSourceEnd - shaderUiSource
