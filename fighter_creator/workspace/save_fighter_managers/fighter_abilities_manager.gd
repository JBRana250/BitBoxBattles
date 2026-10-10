extends Node

@export var fighter_abilities: CompositeGraphNode

func get_abilities() -> Array[Event]:
	var events: Array[Event] = fighter_abilities.get_events()
	return events
