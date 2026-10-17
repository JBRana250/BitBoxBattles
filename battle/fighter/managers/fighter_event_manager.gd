class_name FighterEventManager extends Node

@export var repeating_timer_event: PackedScene

func init_events(action_resource: FighterActionResource):
	var action_events: Array[Event] = action_resource.action_events
	for event: Event in action_events:
		event.instance_event(owner, self)
