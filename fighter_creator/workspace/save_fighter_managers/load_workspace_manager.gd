class_name LoadWorkspaceManager extends Node

@export var workspace: Workspace
@export var fighter_save_manager: FighterSaveManager

func init_workspace(rootnode: NodeResource, id: int = -1) -> void:
	for node in workspace.get_children():
		if node is GraphNode:
			node.queue_free()
	workspace.clear_connections()
	
	fighter_save_manager.existing_fighter_id = id
	
	var root_fighter_instance: BaseCompositeGraphNode = instance_graphnode_tree(rootnode)
	fighter_save_manager.fighter = root_fighter_instance

func instance_graphnode_tree(graphnode: NodeResource) -> CompositeGraphNode:
	var root_instance: CompositeGraphNode = graphnode.graph_node_scene.instantiate()
	workspace.add_child(root_instance)
	root_instance.set_workspace(workspace)
	root_instance.position_offset = graphnode.position_offset
	root_instance.title = graphnode.graph_node_name
	root_instance.init_node(graphnode)
	
	var connected_nodes: Array[NodeResource] = graphnode.connected_nodes
	for connected_resource in connected_nodes:
		var instance: CompositeGraphNode = instance_graphnode_tree(connected_resource)
		
		root_instance.add_output_node(connected_resource, instance)
	
	return root_instance
