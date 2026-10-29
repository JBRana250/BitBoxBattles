extends Control

@export var name_label: Label
@export var fighter_texture: TextureRect
@export var load_workspace_manager: LoadWorkspaceManager
@export var profile_selection: Control

@export var rename_profile: Control
@export var delete_profile: Control
var profile: FighterProfile
var index: int

func _ready() -> void:
	visible = false

func init_profile_options(fighter_profile: FighterProfile, _index: int) -> void:
	name_label.text = fighter_profile.init_resource.fighter_id
	fighter_texture.texture = fighter_profile.texture_resource.active_image
	profile = fighter_profile
	self.index = _index
	visible = true

func update_name(new_name: String) -> void:
	name_label.text = new_name
	profile_selection.init_profile_selection()

func profile_deleted() -> void:
	profile_selection.init_profile_selection()
	visible = false

func _on_edit_pressed() -> void:
	load_workspace_manager.init_workspace(profile.workspace_data, index)

func _on_rename_pressed() -> void:
	rename_profile.init_rename_profile_menu(profile)

func _on_delete_pressed() -> void:
	delete_profile.init_delete_profile_menu(profile, index)

func _on_leave_menu_pressed() -> void:
	visible = false
