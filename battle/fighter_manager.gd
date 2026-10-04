class_name FighterManager extends Node2D

func _ready() -> void:
	BattleEventBus.clear_fighters.connect(clear_fighters)

func clear_fighters() -> void:
	for fighter: Fighter in get_children():
		fighter.queue_free()

func get_closest_fighter(target_pos: Vector2) -> Fighter:
	var closest_fighter: Fighter = null
	var closest_distance: float = -1
	
	for fighter: Fighter in get_children():
		var distance = fighter.position.distance_squared_to(target_pos)
		if (distance < closest_distance || closest_distance == -1):
			closest_distance = distance
			closest_fighter = fighter
	
	return closest_fighter

func get_closest_fighter_with_exception(target_pos: Vector2, exception: Fighter) -> Fighter:
	var closest_fighter: Fighter = null
	var closest_distance: float = -1
	
	for fighter: Fighter in get_children():
		if (fighter == exception):
			continue
		var distance = fighter.position.distance_squared_to(target_pos)
		if (distance < closest_distance || closest_distance == -1):
			closest_distance = distance
			closest_fighter = fighter
	
	return closest_fighter
