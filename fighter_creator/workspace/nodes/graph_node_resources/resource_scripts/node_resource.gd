class_name NodeResource extends Resource

@export var graph_node_scene: PackedScene
@export var graph_node_name: String

# Workspace saving (position and connections)
@export var connected_nodes: Array[NodeResource]
@export var position_offset: Vector2

@export var properties: Dictionary
func save_node_properties(_properties: Dictionary) -> void:
	properties = _properties
