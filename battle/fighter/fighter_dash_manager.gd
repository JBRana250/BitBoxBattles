class_name FighterDashManager extends Node2D

@export var accel_dash_timer: Timer
@export var fighter_dash_timer: Timer

@export var accel_dash_force: float
@export var fighter_dash_force: float

var accel_dash_vector: Vector2
var fighter_dash_vector: Vector2

func init_dash(fighter_dash_resource: FighterDashResource) -> void:
	init_accel_dash(fighter_dash_resource)
	init_fighter_dash(fighter_dash_resource)

func init_accel_dash(fighter_dash_resource: FighterDashResource):
	if (fighter_dash_resource.accel_dash_force == 0):
		return # no accel dash
	self.accel_dash_force = fighter_dash_resource.accel_dash_force
	accel_dash_timer.wait_time = fighter_dash_resource.accel_dash_cooldown
	await accel_dash_timer.tree_entered
	accel_dash_timer.start()

func init_fighter_dash(fighter_dash_resource: FighterDashResource):
	if (fighter_dash_resource.fighter_dash_force == 0):
		return # no fighter dash
	self.fighter_dash_force = fighter_dash_resource.fighter_dash_force
	fighter_dash_timer.wait_time = fighter_dash_resource.fighter_dash_cooldown
	await fighter_dash_timer.tree_entered
	
	fighter_dash_timer.start()

# This dash is purely to accelerate the fighter
# in the direction that its already moving
func _on_accel_dash_timer_timeout() -> void:
	accel_dash_vector = owner.linear_velocity.normalized()
	owner.apply_force(accel_dash_vector * accel_dash_force)

# This dash points towards the closest fighter
func _on_fighter_dash_timer_timeout() -> void:
	var closest_fighter: Fighter = owner.fighter_manager.get_closest_fighter_with_exception(owner.position, owner)
	if (closest_fighter == null):
		return
	fighter_dash_vector = (closest_fighter.position - owner.position).normalized()
	owner.apply_force(fighter_dash_vector * fighter_dash_force)
