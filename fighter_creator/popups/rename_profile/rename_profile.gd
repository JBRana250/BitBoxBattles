extends Control

@export var rename_lineedit: LineEdit
@export var profile_options: Control
var profile: FighterProfile

func init_rename_profile_menu(fighter_profile: FighterProfile) -> void:
	profile = fighter_profile
	rename_lineedit.text = profile.init_resource.fighter_id
	visible = true

func _on_leave_menu_pressed() -> void:
	visible = false

func _on_cancel_pressed() -> void:
	visible = false

func _on_rename_pressed() -> void:
	var new_name: String = rename_lineedit.text
	profile.init_resource.fighter_id = new_name
	profile.workspace_data.connected_nodes[0].properties.fighter_id = new_name
	visible = false
	
	SaveManager.save_fighter_profiles()
	
	profile_options.update_name(new_name)
