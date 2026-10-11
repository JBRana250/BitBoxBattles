class_name ScaleDistortionManager extends Node

@export var fighter_sprite: Sprite2D
@export var spring_recovery: float = 10.0

var squash_offset: Vector2

func _process(delta: float) -> void:
	squash_offset = squash_offset.lerp(Vector2.ZERO, spring_recovery * delta)
	fighter_sprite.scale = Vector2(1.0, 1.0) + squash_offset

func add_impact_squash(impact_velocity: float, is_horizontal: bool) -> void:
	var intensity = clamp(abs(impact_velocity) / 400.0, 0.2, 1.5)
	
	if is_horizontal:
		squash_offset += Vector2(-0.25 * intensity, 0.25 * intensity)
	else:
		squash_offset += Vector2(0.25 * intensity, -0.25 * intensity)
