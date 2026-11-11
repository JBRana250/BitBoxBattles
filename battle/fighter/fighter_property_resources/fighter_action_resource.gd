class_name FighterActionResource extends Resource

@export var action_events: Array[Event]

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	#action_events = profile_data.action_events TEMP

func to_dict() -> Dictionary:
	return {
		"action_events": action_events
	}
