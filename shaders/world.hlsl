
cbuffer WorldCB : register(b0)
{
    float gAngle;
    float gCubeY;
    float gHeld;
    float gEnergy;
};

struct VSIn
{
    float3 pos    : POSITION;
    float4 color  : COLOR0;
    float  weight : TEXCOORD0;
};

struct VSOut
{
    float4 pos   : SV_POSITION;
    float4 color : COLOR0;
};

VSOut VSMain(VSIn i)
{
    VSOut o;

    float sy = sin(gAngle);
    float cy = cos(gAngle);
    float sx = sin(0.55 + gEnergy * 0.25);
    float cx = cos(0.55 + gEnergy * 0.25);

    float3 p = i.pos;
    p.y += gCubeY * i.weight;

    float3 ry;
    ry.x = p.x * cy - p.z * sy;
    ry.y = p.y;
    ry.z = p.x * sy + p.z * cy;

    float3 r;
    r.x = ry.x;
    r.y = ry.y * cx - ry.z * sx;
    r.z = ry.y * sx + ry.z * cx + 3.4f;

    float perspective = 1.35f / max(r.z, 0.25f);

    o.pos = float4(r.x * perspective, r.y * perspective, saturate((r.z - 1.0f) / 4.5f), 1.0f);

    float pulse = 1.0f + gHeld * 0.20f + gEnergy * 0.15f;
    float3 finalColor = i.color.rgb * pulse;
    o.color = float4(saturate(finalColor), i.color.a);
    return o;
}

float4 PSMain(VSOut i) : SV_TARGET
{
    return i.color;
}
