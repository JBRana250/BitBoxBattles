class_name StateGraphNode extends CompositeGraphNode

@export var state: FighterStateMachine.State

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(_node_res: NodeResource) -> void:
	pass

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {}
