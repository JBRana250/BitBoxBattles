extends Marker2D

@export_group("References")
@export var fighter_scene: PackedScene
@export var fighter_manager: FighterManager

@export_group("Properties")
@export var init_resource: FighterInitResource
@export var health_resource: FighterHealthResource
@export var contact_resource: FighterContactResource
@export var texture_resource: FighterTextureResource
@export var action_resource: FighterActionResource

func _ready() -> void:
	BattleEventBus.spawn_fighters.connect(_spawn_fighter)

func _spawn_fighter() -> void:
	var fighter_instance: Fighter = fighter_scene.instantiate()
	init_resource.position = self.position
	init_resource.rotation = randf_range(0, TAU)
	fighter_instance.init_fighter(fighter_manager, init_resource, health_resource, contact_resource, texture_resource, action_resource)
	
	fighter_manager.add_child(fighter_instance)
