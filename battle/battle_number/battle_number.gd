extends Label

@export var timer: Timer

func init_battle_number(_amount: int, color: Color, _scale: float, duration: float) -> void:
	scale = Vector2(_scale, _scale)
	label_settings.font_color = color
	#text = str(amount)
	
	timer.wait_time = duration
	timer.start()
	
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, duration)

func _on_timer_timeout() -> void:
	queue_free()
