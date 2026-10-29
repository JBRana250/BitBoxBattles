extends Control

@export var name_label: Label
@export var fighter_texture: TextureRect
@export var load_workspace_manager: LoadWorkspaceManager
var profile: FighterProfile
var index: int

func init_profile_options(fighter_profile: FighterProfile, _index: int) -> void:
	name_label.text = fighter_profile.init_resource.fighter_id
	fighter_texture.texture = fighter_profile.texture_resource.active_image
	profile = fighter_profile
	self.index = _index
	visible = true


func _on_edit_pressed() -> void:
	load_workspace_manager.init_workspace(profile.workspace_data, index)

func _on_rename_pressed() -> void:
	pass # Replace with function body.

func _on_delete_pressed() -> void:
	pass # Replace with function body.

func _on_leave_menu_pressed() -> void:
	visible = false
