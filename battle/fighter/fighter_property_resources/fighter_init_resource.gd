class_name FighterInitResource extends Resource

# Battle Init
@export var fighter_id: String
@export var position: Vector2
@export var rotation: float
@export var starting_force: float
@export var fighter_mass: float

# Setup Init
enum SetupAnimType {
	NONE,
	IDLE,
	EXCITED
}

@export var setup_anim_type: SetupAnimType
