extends Node

@export var health_label: Label
@export var health_bar: TextureProgressBar

func update_health(health: int) -> void:
	health_label.text = str(health)
	health_bar.value = health
