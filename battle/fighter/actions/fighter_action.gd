@abstract class_name FighterAction extends Resource

# requires the actor to be a fighter in context
func execute(context: Dictionary = {}) -> void:
	var _actor := context.get("actor") as Fighter
	pass
