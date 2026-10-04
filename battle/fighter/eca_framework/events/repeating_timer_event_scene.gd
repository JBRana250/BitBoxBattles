extends Node

var fighter: Fighter
@export var timer: Timer

var repeating_timer_event: RepeatingTimerEvent

func init(_fighter: Fighter, _repeating_timer_event: RepeatingTimerEvent):
	self.fighter = _fighter
	self.repeating_timer_event = _repeating_timer_event
	timer.wait_time = repeating_timer_event.time
	await timer.tree_entered
	timer.start()

func _on_timer_timeout() -> void:
	repeating_timer_event.trigger({
		"actor": fighter
	})
