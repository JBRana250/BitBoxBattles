extends Control

@export var profile_options: Control
@export var fighter_profiles: FighterProfiles

@export var title_label: Label
var index: int

func init_delete_profile_menu(profile: FighterProfile, _index: int) -> void:
	title_label.text = "Are you sure you 
	want to delete 
	'" + profile.init_resource.fighter_id + "' ?"
	self.index = _index
	visible = true

func _on_leave_menu_pressed() -> void:
	visible = false

func _on_cancel_pressed() -> void:
	visible = false

func _on_delete_pressed() -> void:
	fighter_profiles.delete_profile(index)
	SaveManager.save_fighter_profiles()
	visible = false
	profile_options.profile_deleted()
