shader_type canvas_item;

// Damage feedback. Two ways to use it:
//  - `pattern` 0 (Manual): drive `flash_amount` yourself (0 = normal, 1 = full flash).
//  - `pattern` 1 to 4: tween `progress` from 0 to 1, linearly, over the length of the
//    flash; the pattern gives it its rhythm. 5 pulses on its own (a buff, a warning).
//      1 Punch  : instant full flash that decays fast (a heavy hit)
//      2 Blink  : one very brief flash (a light hit)
//      3 Double : two quick flashes (a critical)
//      4 Strobe : several blinks that fade out (invincibility frames, a big hit)
//      5 Pulse  : loops by itself at `pulse_speed`

group_uniforms Flash;
uniform vec4 flash_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float flash_amount : hint_range(0.0, 1.0) = 0.75;  // strength (and the whole flash in Manual)
uniform float pattern : hint_range(0.0, 5.0, 1.0) = 0.0;   // 0 Manual 1 Punch 2 Blink 3 Double 4 Strobe 5 Pulse
uniform float progress : hint_range(0.0, 1.0) = 1.0;       // tween from 0 to 1 for patterns 1 to 4
uniform float blinks : hint_range(2.0, 8.0, 1.0) = 4.0;    // Strobe: number of blinks
uniform float pulse_speed : hint_range(0.2, 8.0) = 2.0;    // Pulse: pulses per second
uniform float edge_glow : hint_range(0.0, 1.0) = 0.0;      // brighter rim while flashing

varying vec4 vertex_tint;   // modulate and self_modulate, applied at the end

void vertex() {
	vertex_tint = COLOR;
}

float flash_curve(float p, float pat) {
	p = clamp(p, 0.0, 1.0);
	if (pat < 0.5) { return 1.0; }
	if (pat < 1.5) { return exp(-p * 6.0) * (1.0 - smoothstep(0.85, 1.0, p)); }            // Punch
	if (pat < 2.5) { return 1.0 - smoothstep(0.08, 0.28, p); }                              // Blink
	if (pat < 3.5) {                                                                        // Double
		return max(1.0 - smoothstep(0.05, 0.22, p), 0.8 * smoothstep(0.34, 0.4, p) * (1.0 - smoothstep(0.45, 0.65, p)));
	}
	if (pat < 4.5) {                                                                        // Strobe
		float k = fract(p * blinks);
		return step(k, 0.5) * (1.0 - p * 0.8) * step(p, 0.999);
	}
	return 0.5 + 0.5 * sin(TIME * pulse_speed * TAU);                                      // Pulse
}

void fragment() {
	vec4 col = texture(TEXTURE, UV);
	float f = flash_amount * flash_curve(progress, pattern);
	if (edge_glow > 0.0 && f > 0.0) {
		// the product of the 4 neighbours' alpha drops to 0 near the silhouette edge
		vec2 px = TEXTURE_PIXEL_SIZE * 2.0;
		float around = texture(TEXTURE, UV + vec2(px.x, 0.0)).a * texture(TEXTURE, UV - vec2(px.x, 0.0)).a
			* texture(TEXTURE, UV + vec2(0.0, px.y)).a * texture(TEXTURE, UV - vec2(0.0, px.y)).a;
		f = min(f * (1.0 + edge_glow * (1.0 - around) * 2.0), 1.0);
	}
	col.rgb = mix(col.rgb, flash_color.rgb, f * col.a);
	COLOR = col;
	COLOR *= vertex_tint;
}
