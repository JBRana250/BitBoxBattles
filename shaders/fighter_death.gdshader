shader_type canvas_item;

uniform float progress: hint_range(0.0, 1.0) = 0.7;
uniform vec4 modulate_color = vec4(1.0, 1.0, 1.0, 1.0);

void fragment() {
	// Called for every pixel the material is visible on.
	
	// line_offset = -1 --> 0% progress
	// line_offset = 0 --> 50% progress
	// line_offset = 1 --> 100% progress
	float line_offset = (progress*2.0 - 1.0);
	
	vec4 original_color = texture(TEXTURE, UV);
	vec4 tinted_color = vec4(0.0, 0.0, 0.0, 0.0);
	
	float split = smoothstep(UV.x + line_offset, UV.x + line_offset + progress, UV.y);
	
	
	COLOR = mix(tinted_color, original_color, split) * modulate_color;
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
