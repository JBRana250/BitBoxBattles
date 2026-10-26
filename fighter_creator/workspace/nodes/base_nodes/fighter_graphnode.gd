class_name FighterGraphNode extends BaseCompositeGraphNode

var base_stats_node
var base_sprites_node
var abilities_node

func add_output_node(_node_resource: NodeResource, output_node: CompositeGraphNode) -> void:
	var slot_idx = num_slots + 1
	set_slot_enabled_right(slot_idx, true)
	set_slot_color_right(slot_idx, output_slot_color)
	
	# minus one to account for fighterslot0
	workspace.connect_node(name, slot_idx - 1, output_node.name, 0, true)
	
	output_nodes[slot_idx - 1] = output_node
	recent_port_id = slot_idx
	num_slots += 1
	
	if output_node is FighterBaseStatsNode:
		base_stats_node = output_node
	elif output_node is FighterBaseSpritesNode:
		base_sprites_node = output_node
	elif output_node is FighterAbilitiesNode:
		abilities_node = output_node
	else:
		print_debug("Error: Wrong Node!")
