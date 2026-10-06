class_name FighterHealthManager extends Node

@export var health_gradient: Gradient
@export var health_bar: TextureProgressBar

var max_health: int
var current_health: int

func get_current_health() -> int:
	return current_health

func init_health(_max_health: int) -> void:
	self.max_health = _max_health
	current_health = _max_health
	health_bar.max_value = _max_health
	update_health_values()

func reduce_health(amount: int) -> void:
	current_health -= amount
	update_health_values()

func set_health(health: int) -> void:
	current_health = health
	update_health_values()

func update_health_values() -> void:
	check_death()
	
	health_bar.value = current_health
	
	var health_ratio = float(current_health) / max_health
	var health_color = health_gradient.sample(health_ratio)
	health_bar.tint_progress = health_color

func check_death() -> void:
	if (current_health <= 0):
		BattleEventBus.fighter_death.emit(owner.fighter_id)
		owner.queue_free()
