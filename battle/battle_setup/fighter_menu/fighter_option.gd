extends PanelContainer

@export var label: Label
@export var texture_button: TextureButton
@export var fighter: Button
@export var fighter_profile: FighterProfile
var fighter_menu: Control

func init_fighter_option(profile: FighterProfile, _fighter: Button, _menu: Control):
	label.text = profile.init_resource.name
	texture_button.texture_normal = StaticData.get_texture(profile.texture_resource.active_image_id)
	self.fighter = _fighter
	self.fighter_profile = profile
	fighter_menu = _menu

func _on_texture_button_pressed() -> void:
	fighter.choose_fighter(fighter_profile)
	fighter_menu.visible = false
