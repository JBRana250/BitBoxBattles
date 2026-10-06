extends TextureButton


@export var fighter_menu: Control
@export var fighter_label: Label

@onready var fighter_chosen: bool = false
var fighter_profile: FighterProfile

func _on_pressed() -> void:
	fighter_menu.open_fighter_menu(self)

func choose_fighter(profile: FighterProfile):
	fighter_label.text = profile.init_resource.fighter_id
	texture_normal = profile.texture_resource.active_image
	fighter_profile = profile

func get_fighter_profile() -> FighterProfile:
	return fighter_profile
