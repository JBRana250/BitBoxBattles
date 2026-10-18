class_name FighterInitResource extends Resource

@export var fighter_id: String
@export var position: Vector2
@export var rotation: float
@export var starting_force: float
@export var fighter_mass: float

enum ReadyAnimType {
	EXCITED,
	IDLE
}

@export var ready_anim_type: ReadyAnimType
