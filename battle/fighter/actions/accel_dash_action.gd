class_name AccelDashAction extends FighterAction

@export var accel_dash_force: float

# Dash in direction already moving in
func execute(context: Dictionary = {}) -> void:
	var actor := context.get("actor") as Fighter
	
	if !(actor is Fighter):
		return
	var accel_dash_vector = actor.linear_velocity.normalized()
	actor.apply_central_impulse(accel_dash_vector * accel_dash_force)
