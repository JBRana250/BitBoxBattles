class_name HealthIncreaseAction extends FighterAction

@export var amount: int

# Dash in direction already moving in
func execute(context: Dictionary = {}) -> void:
	var actor := context.get("actor") as Fighter
	
	if !(pass_conditions(context)):
		return
	
	if !(actor is Fighter):
		return
	
	actor.heal(amount)
