shader_type canvas_item;

uniform float num_checkers;
uniform vec4 checker_color_a : source_color = vec4(0.85, 0.85, 0.85, 1.0);
uniform vec4 checker_color_b : source_color = vec4(1.0);

void fragment() {
	vec2 pixel = floor(UV * num_checkers);
	float checker = mod(pixel.x + pixel.y, 2.0);
	COLOR = checker == 0.0 ? checker_color_a : checker_color_b;
}
