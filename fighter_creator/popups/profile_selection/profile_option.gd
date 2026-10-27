class_name ProfileOption extends PanelContainer

@export var label: Label
@export var texture_rect: TextureRect
@export var fighter_profile: FighterProfile
var profile_selection_manager: Control
var id: int

func init_fighter_option(profile: FighterProfile, _profile_selection_manager: Control, _id: int):
	label.text = profile.init_resource.fighter_id
	texture_rect.texture = profile.texture_resource.active_image
	self.fighter_profile = profile
	self.profile_selection_manager = _profile_selection_manager
	self.id = _id

func _on_button_pressed() -> void:
	profile_selection_manager.choose_fighter(fighter_profile, id)
