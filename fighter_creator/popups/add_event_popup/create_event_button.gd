extends Button

@export var add_event_popup_menu: AddNodePopupMenu
@export var node_creation_manager: GraphNodeCreationManager
@export var node_resource: NodeResource

func _on_pressed() -> void:
	node_creation_manager.create_node(add_event_popup_menu.get_parent_node(), node_resource)
	add_event_popup_menu.option_selected()
