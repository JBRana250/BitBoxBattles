extends Control

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			get_tree().paused = false
			visible = false
		else:
			get_tree().paused = true
			visible = true
