extends EventCompositeGraphNode

@export var time_progbar: ProgressBar

func process_event() -> Event:
	var repeating_timer_event: RepeatingTimerEvent = RepeatingTimerEvent.new()
	repeating_timer_event.time = time_progbar.value
	repeating_timer_event.actions = get_actions()
	return repeating_timer_event
