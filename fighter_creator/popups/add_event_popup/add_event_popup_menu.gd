class_name AddNodePopupMenu extends Control

var parent_node: CompositeGraphNode

func get_parent_node() -> CompositeGraphNode:
	return parent_node

func option_selected() -> void:
	visible = false

func open_menu(node: CompositeGraphNode) -> void:
	parent_node = node
	visible = true
