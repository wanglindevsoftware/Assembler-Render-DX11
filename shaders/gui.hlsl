
struct VSIn
{
    float2 pos   : POSITION;
    float4 color : COLOR0;
};

struct VSOut
{
    float4 pos   : SV_POSITION;
    float4 color : COLOR0;
};

VSOut VSMain(VSIn i)
{
    VSOut o;
    o.pos = float4(i.pos, 0.0f, 1.0f);
    o.color = i.color;
    return o;
}

float4 PSMain(VSOut i) : SV_TARGET
{
    return i.color;
}
