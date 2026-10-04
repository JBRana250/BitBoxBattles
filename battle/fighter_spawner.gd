extends Marker2D

@export_group("References")
@export var fighter_scene: PackedScene
@export var fighter_manager: FighterManager

@export_group("Properties")
@export var fighter_profile: FighterProfile

func _ready() -> void:
	BattleEventBus.spawn_fighters.connect(_spawn_fighter)

func _spawn_fighter() -> void:
	var fighter_instance: Fighter = fighter_scene.instantiate()
	fighter_profile.init_resource.position = self.position
	fighter_profile.init_resource.rotation = randf_range(0, TAU)
	fighter_instance.init_fighter(fighter_manager, fighter_profile)
	
	fighter_manager.add_child(fighter_instance)
