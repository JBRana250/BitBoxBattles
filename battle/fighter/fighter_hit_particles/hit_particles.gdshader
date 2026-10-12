shader_type particles;

uniform sampler2D sprite : source_color, filter_nearest;
uniform float emitter_size;

// Standard Godot hash function
uint hash(uint x) {
    x = ((x >> uint(16)) ^ x) * uint(73244475);
    x = ((x >> uint(16)) ^ x) * uint(73244475);
    x = (x >> uint(16)) ^ x;
    return x;
}

// Generate a float between 0.0 and 1.0 from a seed
float rand_from_seed(inout uint seed) {
    int k;
    int s = int(seed);
    if (s == 0) s = 305420679;
    k = s / 127773;
    s = 16807 * (s - k * 127773) - 2836 * k;
    if (s < 0) s += 2147483647;
    seed = uint(s);
    return float(seed % uint(65536)) / 65535.0;
}


void start() {
	// track lifetime
	CUSTOM.x = 0.0;
	
	// Create unique random seeds for each axis using the particle's NUMBER and RANDOM_SEED
    uint seed_x = hash(NUMBER + uint(1) + RANDOM_SEED);
    uint seed_y = hash(NUMBER + uint(2) + RANDOM_SEED);
    uint seed_z = hash(NUMBER + uint(3) + RANDOM_SEED);

    float rx = rand_from_seed(seed_x);
    float ry = rand_from_seed(seed_y);
    float rz = rand_from_seed(seed_z);

    // Define your random bounds (e.g., a box from -5 to 5)
    vec3 random_pos = EMISSION_TRANSFORM[3].xyz + (vec3(rx, ry, rz) * emitter_size - vec3(emitter_size/2.0));

    // Assign to the particle's transform translation
    TRANSFORM[3].xyz = random_pos;
	
	vec2 particle_uv = vec2(rx, ry);
	CUSTOM.y = particle_uv.x - 0.5;
	CUSTOM.z = particle_uv.y - 0.5;
	particle_uv = clamp(particle_uv, vec2(0.0), vec2(1.0));
	
	vec4 tex_color = texture(sprite, particle_uv);
	COLOR = tex_color;
}

void process() {
	CUSTOM.x += DELTA / LIFETIME;
	TRANSFORM[3].xy += vec2(CUSTOM.y, CUSTOM.z) * 3.0;
	COLOR.a *= (1.0 - CUSTOM.x);
}
