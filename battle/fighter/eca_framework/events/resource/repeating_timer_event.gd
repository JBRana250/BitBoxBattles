class_name RepeatingTimerEvent extends Event

#@export var actions: Array[Action] = []
@export var repeating_timer_event_scene: PackedScene = preload("res://battle/fighter/eca_framework/events/repeating_timer_event.tscn")
@export var time: float

func trigger(context: Dictionary = {}) -> void:
	for action in actions:
		if action:
			action.execute(context)

func instance_event(owner: Fighter, event_manager: FighterEventManager) -> void:
	var instance: Node = repeating_timer_event_scene.instantiate()
	instance.init(owner, self)
	event_manager.add_child(instance)
