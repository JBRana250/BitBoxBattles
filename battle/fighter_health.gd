extends Node

@export var health_gradient: Gradient
@export var health_label: Label
@export var health_bar: TextureProgressBar

var max_health: int

func init_health(max_health: int) -> void:
	self.max_health = max_health
	health_bar.value = max_health
	var health_color = health_gradient.sample(1)
	health_bar.tint_progress = health_color
	health_bar.value = max_health

func update_health(health: int) -> void:
	health_bar.value = health
	var health_ratio = float(health) / max_health
	var health_color = health_gradient.sample(health_ratio)
	health_bar.tint_progress = health_color
