// https://github.com/loqusion/hyprshade/blob/main/shaders/vibrance.glsl.mustache
// https://github.com/hyprwm/Hyprland/issues/1140#issuecomment-1614863627

#version 300 es

precision mediump float;
uniform sampler2D tex;
in vec2 v_texcoord;
out vec4 fragColor;

const float SATURATION = 1.60;
const vec3 LUMA = vec3(0.2126, 0.7152, 0.0722);

void main() {
  vec4 color = texture(tex, v_texcoord);
  float luma = dot(color.rgb, LUMA);
  vec3 gray = vec3(luma);
  vec3 saturated = mix(gray, color.rgb, SATURATION);
  saturated = clamp(saturated, 0.0, 1.0);
  fragColor = vec4(saturated, color.a);
}
