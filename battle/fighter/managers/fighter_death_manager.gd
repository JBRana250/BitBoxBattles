extends Node

@export var fighter_sprite: Sprite2D

func on_death() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(fighter_sprite.material, "shader_parameter/progress", 1.0, 0.5)
