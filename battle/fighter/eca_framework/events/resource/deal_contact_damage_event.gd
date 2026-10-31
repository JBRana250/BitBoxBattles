class_name DealContactDamageEvent extends Event

#@export var actions: Array[Action] = []
@export var deal_contact_damage_event_scene: PackedScene

func trigger(context: Dictionary = {}) -> void:
	for action in actions:
		if action:
			action.execute(context)

func instance_event(owner: Fighter, event_manager: FighterEventManager) -> void:
	var instance: Node = deal_contact_damage_event_scene.instantiate()
	instance.init(owner, self)
	event_manager.add_child(instance)
