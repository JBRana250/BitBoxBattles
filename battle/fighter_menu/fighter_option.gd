extends PanelContainer

@export var label: Label
@export var texture_button: TextureButton
@export var fighter: TextureButton
@export var fighter_profile: FighterProfile
var fighter_menu: Control

func init_fighter_option(profile: FighterProfile, _fighter: TextureButton, _menu: Control):
	label.text = profile.init_resource.fighter_id
	texture_button.texture_normal = profile.texture_resource.active_image
	self.fighter = _fighter
	self.fighter_profile = profile
	fighter_menu = _menu

func _on_texture_button_pressed() -> void:
	fighter.choose_fighter(fighter_profile)
	fighter_menu.visible = false
