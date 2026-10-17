extends Node

@export var battle_number_resource: BattleNumberResource
@export var battle_number_scene: PackedScene
@export var battle_number_duration: float
@export var amount_ratio_upper_bound: int

func display_damage_number(amount: int) -> void:
	var number_instance: Label = battle_number_scene.instantiate()
	var amount_ratio: float = get_amount_ratio(amount)
	var scale: float = get_scale(amount_ratio)
	
	owner.particles.add_child(number_instance)
	number_instance.init_battle_number(
		amount, 
		battle_number_resource.damage_number_gradient.sample(amount_ratio),
		scale,
		battle_number_duration
	)
	number_instance.global_position = owner.global_position + Vector2(0, -75)
	

func display_heal_number(amount: int) -> void:
	var number_instance: Label = battle_number_scene.instantiate()
	var amount_ratio: float = get_amount_ratio(amount)
	var scale: float = get_scale(amount_ratio)
	
	owner.particles.add_child(number_instance)
	number_instance.init_battle_number(
		amount, 
		battle_number_resource.heal_number_gradient.sample(amount_ratio),
		scale,
		battle_number_duration
	)
	number_instance.global_position = owner.global_position + Vector2(0, -100)
	
func get_amount_ratio(amount: int) -> float:
	return float(amount) / amount_ratio_upper_bound

func get_scale(amount_ratio: float) -> float:
	return max(1.0, amount_ratio * 3.0)
