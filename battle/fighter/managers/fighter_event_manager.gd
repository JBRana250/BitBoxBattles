class_name FighterEventManager extends Node

@export var repeating_timer_event: PackedScene

func init_events(action_resource: FighterActionResource):
	var action_events: Array[Event] = action_resource.action_events
	for event: Event in action_events:
		init_event(event)

func init_event(event: Event):
	if (event is RepeatingTimerEvent):
		instance_repeating_timer_event(event)

func instance_repeating_timer_event(event: RepeatingTimerEvent):
	var instance: Node = repeating_timer_event.instantiate()
	instance.init(owner, event)
	self.add_child(instance)
