extends Button

@export var profile_selection_popup: Control
@export var load_workspace_manager: LoadWorkspaceManager
@export var base_workspace: NodeResource

func _on_pressed() -> void:
	load_workspace_manager.init_workspace(base_workspace)
	profile_selection_popup.visible = false
