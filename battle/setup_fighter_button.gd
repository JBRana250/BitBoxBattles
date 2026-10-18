extends Button


@export var fighter_menu: Control
@export var fighter_label: Label
@export var fighter_texture_rect: TextureRect
@export var anim_player: AnimationPlayer

@onready var fighter_chosen: bool = false
var fighter_profile: FighterProfile

func _on_pressed() -> void:
	fighter_menu.open_fighter_menu(self)

func choose_fighter(profile: FighterProfile):
	fighter_label.text = profile.init_resource.fighter_id
	if profile.texture_resource.setup_image:
		fighter_texture_rect.texture = profile.texture_resource.setup_image
	else:
		fighter_texture_rect.texture = profile.texture_resource.active_image
	anim_player.play("ready_anim")
	fighter_profile = profile

func get_fighter_profile() -> FighterProfile:
	return fighter_profile
