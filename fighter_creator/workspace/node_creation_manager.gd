class_name GraphNodeCreationManager extends Node

@export var workspace: GraphEdit
@export var child_position_offset: Vector2 = Vector2(650, 0)

func create_node(parent_node: GraphNode, node_resource: NodeResource) -> void:
	var instance: GraphNode = node_resource.graph_node_scene.instantiate()
	instance.position_offset = parent_node.position_offset + child_position_offset
	workspace.add_child(instance)
	parent_node.add_slot(node_resource, instance.name)
