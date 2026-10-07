extends Button

@export var owner_node: GraphNode
@export var add_event_popup_menu: Control

func _on_pressed() -> void:
	add_event_popup_menu.open_menu(owner_node)
