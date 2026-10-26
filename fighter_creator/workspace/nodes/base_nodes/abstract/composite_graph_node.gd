@abstract class_name CompositeGraphNode extends GraphNode

@export var slot: PackedScene
@export var workspace: Workspace
@export var output_slot_color: Color
var output_nodes: Dictionary[int, CompositeGraphNode]
var num_slots: int = 0
var recent_port_id: int = 0

# Override This
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(_node_res: NodeResource) -> void:
	pass

# Override This
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {}

func set_workspace(_workspace: Workspace) -> void:
	self.workspace = _workspace
	
func get_recent_port_id() -> int:
	return recent_port_id

func add_output_node(_node_resource: NodeResource, output_node: CompositeGraphNode) -> void:
	var slot_name: String = _node_resource.graph_node_name
	var slot_instance: PanelContainer = slot.instantiate()
	slot_instance.init_slot(slot_name)
	self.add_child(slot_instance)
	
	var slot_idx = num_slots + 1
	self.move_child(slot_instance, slot_idx)
	set_slot_enabled_right(slot_idx, true)
	set_slot_color_right(slot_idx, output_slot_color)
	
	# minus one to account for fighterslot0
	workspace.connect_node(name, slot_idx - 1, output_node.name, 0, true)
	
	output_nodes[slot_idx - 1] = output_node
	recent_port_id = slot_idx
	num_slots += 1

func get_node_resource() -> NodeResource:
	var output_node_resource = NodeResource.new()
	output_node_resource.graph_node_scene = load(scene_file_path)
	output_node_resource.graph_node_name = title
	output_node_resource.properties = get_properties()
	
	var connected_nodes = ([] as Array[NodeResource])
	for node in output_nodes.values():
		connected_nodes.append(node.get_node_resource())
	output_node_resource.connected_nodes = connected_nodes
	output_node_resource.position_offset = position_offset
	
	return output_node_resource
