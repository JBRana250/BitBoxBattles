extends Button

@export var fighter_save_manager: Node

func _on_pressed() -> void:
	fighter_save_manager.save_fighter()
