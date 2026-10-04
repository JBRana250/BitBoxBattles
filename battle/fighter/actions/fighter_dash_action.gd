class_name FighterDashAction extends FighterAction

@export var fighter_dash_force: float

# Dash in direction of closest fighter
func execute(context: Dictionary = {}) -> void:
	var actor := context.get("actor") as Fighter

	var closest_fighter: Fighter = actor.fighter_manager.get_closest_fighter_with_exception(actor.position, actor)
	if (closest_fighter == null):
		return
	var fighter_dash_vector = (closest_fighter.position - actor.position).normalized()
	actor.apply_central_impulse(fighter_dash_vector * fighter_dash_force)
