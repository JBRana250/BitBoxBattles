@abstract class_name CompositeGraphNode extends GraphNode

@export var slot: PackedScene
@export var workspace: Workspace
@export var output_slot_color: Color
var output_nodes: Array[CompositeGraphNode]
var num_slots: int = 0
var recent_port_id: int = 0

func init_node(_workspace: Workspace):
	self.workspace = _workspace

func add_output_node(node_resource: NodeResource, output_node: CompositeGraphNode):
	var slot_name: String = node_resource.graph_node_name
	var slot_instance: PanelContainer = slot.instantiate()
	slot_instance.init_slot(slot_name)
	self.add_child(slot_instance)
	
	var slot_idx = num_slots + 1
	self.move_child(slot_instance, slot_idx)
	set_slot_enabled_right(slot_idx, true)
	set_slot_color_right(slot_idx, output_slot_color)
	
	# minus one to account for fighterslot0
	workspace.connect_node(name, slot_idx - 1, output_node.name, 0, true)
	
	output_nodes.append(output_node)
	recent_port_id = slot_idx
	num_slots += 1

func get_recent_port_id() -> int:
	return recent_port_id
