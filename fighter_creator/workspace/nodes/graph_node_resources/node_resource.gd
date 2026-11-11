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
	position_offset = str_to_var(init_data.position_offset)
	properties = init_data.properties
	scene_type = init_data.scene_type
	
	for node_properties: Dictionary in init_data.connected_nodes:
		var node = NodeResource.new(node_properties)
		connected_nodes.append(node)

func to_dict() -> Dictionary:
	var output_dict = {}
	output_dict.graph_node_name = graph_node_name
	output_dict.position_offset = var_to_str(position_offset)
	output_dict.properties = properties
	output_dict.scene_type = scene_type
	
	var connected = []
	for node: NodeResource in connected_nodes:
		var connected_dict: Dictionary = node.to_dict()
		connected.append(connected_dict)
	output_dict.connected_nodes = connected
	
	return output_dict
