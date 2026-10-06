extends Node

@export var fighter_id_line_edit: LineEdit
@export var health_bar: ProgressBar
@export var contact_damage_bar: ProgressBar
@export var contact_cooldown_bar: ProgressBar
@export var mass_bar: ProgressBar
@export var starting_force_bar: ProgressBar

func get_base_stats() -> Dictionary:
	var base_stats: Dictionary = {}
	base_stats["fighter_id"] = fighter_id_line_edit.text
	base_stats["health"] = health_bar.value
	base_stats["contact_damage"] = contact_damage_bar.value
	base_stats["contact_cooldown"] = contact_cooldown_bar.value
	base_stats["mass"] = mass_bar.value
	base_stats["starting_force"] = starting_force_bar.value
	return base_stats
