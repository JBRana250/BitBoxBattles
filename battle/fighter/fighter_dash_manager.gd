class_name FighterDashManager extends Node

@export var accel_dash_timer: Timer

@export var force: float

func init_dash(accel_dash_force: float, accel_dash_cooldown: float) -> void:
	if (accel_dash_force == 0):
		return # no accel dash
	self.force = accel_dash_force
	accel_dash_timer.wait_time = accel_dash_force

func _on_accel_dash_timer_timeout() -> void:
	owner.apply_force(owner.linear_velocity.normalized() * force)
