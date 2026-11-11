class_name NodeResource extends Resource

@export var graph_node_name: String
@export var position_offset: Vector2
@export var scene_type: GraphNodeScenes.SceneType
@export var connected_nodes: Array[NodeResource]
@export var properties: Dictionary

func save_node_properties(_properties: Dictionary) -> void:
	properties = _properties

func _init(init_data: Dictionary = {}) -> void:
	if init_data.is_empty():
		return
	graph_node_name = init_data.graph_node_name
	position_offset = init_data.position_offset
	properties = init_data.properties
	
	for node_properties: Dictionary in init_data.connected_nodes:
		var node = NodeResource.new(node_properties)
		connected_nodes.append(node)
