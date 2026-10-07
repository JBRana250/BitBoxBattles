extends Button

@export var add_event_popup_menu: Control
@export var node_resource: NodeResource

func _on_pressed() -> void:
	add_event_popup_menu.create_node(node_resource)
