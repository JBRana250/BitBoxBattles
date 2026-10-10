extends Button

@export var owner_node: CompositeGraphNode
@export var menu_type: PopupMenuManager.MenuType

func _on_pressed() -> void:
	owner_node.workspace.popup_menu_manager.open_menu(menu_type, owner_node)
