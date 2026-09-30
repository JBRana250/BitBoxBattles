extends Marker2D

@export var fighter_id: String
@export var contact_damage: int
@export var contact_cooldown: float
@export var fighter_scene: PackedScene
@export var spawn_parent: Node2D
@export var fighter_health_label: Label

func _ready() -> void:
	BattleEventBus.spawn_fighters.connect(_spawn_fighter)

func _spawn_fighter() -> void:
	var fighter_instance: Fighter = fighter_scene.instantiate()
	
	fighter_instance.fighter_id = fighter_id
	fighter_instance.position = position
	fighter_instance.rotation = randf_range(0.0, TAU)
	
	fighter_instance.current_health = 100
	fighter_instance.contact_damage = contact_damage
	fighter_instance.contact_cooldown = contact_cooldown
	
	spawn_parent.add_child(fighter_instance)
	
	fighter_health_label.fighter = fighter_instance
	fighter_health_label.fighter_id = fighter_id
	fighter_health_label.update_text()
