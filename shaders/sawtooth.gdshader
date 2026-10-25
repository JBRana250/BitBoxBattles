shader_type canvas_item;

uniform bool horizontal = true;
uniform bool reverse = false;
uniform float wave_size : hint_range(0.0, 1.0) = 0.09;
uniform float wave_freq : hint_range(0.01, 0.2) = 0.075;
uniform float cutoff : hint_range(0.0, 1.0) = 0.5;
uniform float aspect = 1.0;

void fragment() {
	vec2 uv = UV;
	float dir_uv = horizontal ? uv.x : uv.y;
	float opp_dir_uv = horizontal ? uv.y : uv.x;
	float prim_uv = reverse ? 1.0 - dir_uv : dir_uv;
	float sec_uv = reverse ? 1.0 - opp_dir_uv : opp_dir_uv;
	
	float aspect_wave_size = horizontal ? wave_size * aspect : wave_size;
	float aspect_wave_freq = horizontal ? wave_freq / aspect : wave_freq;
	
	float wave_offset = sin(TIME * 1.5) / 2.0;
	float t = fract((sec_uv + wave_offset) / aspect_wave_freq);
	t = 1.0 - abs(2.0 * t - 1.0);
	
	float cutoff_offset = (cos(TIME) / 2.0) + 0.5;
	float adj_cutoff = (cutoff + cutoff_offset / 10.5) * (1.0 + aspect_wave_size);
	
	float c = (adj_cutoff - prim_uv) / aspect_wave_size;
	float smooth_c = smoothstep(t - .02, t + 0.02, c);
	float alpha = 1.0 - smooth_c;
	
	COLOR.a = alpha;
}