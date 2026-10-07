extends Control

var parent_node: GraphNode

func open_menu(node: GraphNode) -> void:
	parent_node = node
	visible = true

func create_node(node_resource: NodeResource) -> void:
	visible = false
