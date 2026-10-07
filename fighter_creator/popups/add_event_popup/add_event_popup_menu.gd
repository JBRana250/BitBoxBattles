extends Control

@export var workspace: GraphEdit
@export var child_position_offset: Vector2 = Vector2(650, 0)
var parent_node: GraphNode

func open_menu(node: GraphNode) -> void:
	parent_node = node
	visible = true

func create_node(node_resource: NodeResource) -> void:
	var instance: GraphNode = node_resource.graph_node_scene.instantiate()
	instance.position_offset = parent_node.position_offset + child_position_offset
	workspace.add_child(instance)
	parent_node.add_slot(node_resource, instance.title)
	visible = false
