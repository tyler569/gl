#version 330 core

in vec3 normal;
in vec2 uv;
in float textureIndex;

out vec4 color;

uniform sampler2DArray textureSampler;
uniform float time;

void main() {
    color = texture(textureSampler, vec3(uv, textureIndex));

#if 0
    int tstep = int(time) % 12;
    int tex = tstep + 238;
    vec4 blockBreak;
    if (tstep < 3) {
        blockBreak = vec4(1.);
    } else {
        blockBreak = vec4(texture(textureSampler, vec3(uv, tex)).rgb, 1);
    }
    color *= blockBreak;
#endif

    if (color.a == 0) discard;

    if (normal.x != 0) color.rgb *= 0.9;
    if (normal.y < 0) color.rgb *= 0.6;
    if (normal.z != 0) color.rgb *= 0.8;
}
