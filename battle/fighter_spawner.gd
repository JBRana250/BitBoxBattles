extends Marker2D

@export_group("References")
@export var fighter_scene: PackedScene
@export var spawn_parent: Node2D

@export_group("Properties")
@export var fighter_id: String
@export var contact_damage: int
@export var contact_cooldown: float
@export var starting_health: int
@export var starting_force: float
@export var mass: float
@export var active_image: Texture
@export var inactive_image: Texture

func _ready() -> void:
	BattleEventBus.spawn_fighters.connect(_spawn_fighter)

func _spawn_fighter() -> void:
	var fighter_instance: Fighter = fighter_scene.instantiate()
	fighter_instance.init_fighter(fighter_id, starting_health, contact_damage, contact_cooldown, position, randf_range(0.0, TAU), active_image, inactive_image, starting_force, mass/100)
	
	spawn_parent.add_child(fighter_instance)
