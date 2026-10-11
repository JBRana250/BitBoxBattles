shader_type particles;

uniform sampler2D sprite;
uniform vec2 emitter_size = vec2(500.0, 500.0); 


void start() {
	TRANSFORM[3].xyz = vec3(50, 5, 0);
	vec3 position = TRANSFORM[3].xyz;
	vec2 particle_uv = (position.xy + (emitter_size * 0.5)) / emitter_size;
	particle_uv = clamp(particle_uv, vec2(0.0), vec2(1.0));
	
	vec4 tex_color = texture(sprite, particle_uv);
	COLOR = tex_color;
}

void process() {
	VELOCITY.x += 1.0;
}
