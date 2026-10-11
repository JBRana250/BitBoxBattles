extends Node

@export var hitstop_duraction_factor: float
@export var min_time_scale: float = 0.05

func apply_hitstop(duration: float, time_scale: float = min_time_scale) -> void:
	if time_scale < min_time_scale:
		time_scale = min_time_scale
	Engine.time_scale = time_scale
	
	# Create a timer that ignores the global time scale
	var timer := get_tree().create_timer(duration*hitstop_duraction_factor, true, false, true)
	await timer.timeout
	
	Engine.time_scale = 1.0
