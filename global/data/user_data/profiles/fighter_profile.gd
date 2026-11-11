class_name FighterProfile extends Resource

# Battle
@export var init_resource: FighterInitResource
@export var health_resource: FighterHealthResource
@export var contact_resource: FighterContactResource
@export var texture_resource: FighterTextureResource
@export var action_resource: FighterActionResource

# Workspace
@export var workspace_data: NodeResource

func _init(profile_data: Dictionary = {}) -> void:
	if profile_data.is_empty():
		return
	init_resource = FighterInitResource.new(profile_data)
	health_resource = FighterHealthResource.new(profile_data)
	contact_resource = FighterContactResource.new(profile_data)
	texture_resource = FighterTextureResource.new(profile_data)
	action_resource = FighterActionResource.new(profile_data)
	
	if profile_data.has("workspace_data"):
		workspace_data = profile_data.workspace_data

func get_profile_data() -> Dictionary:
	var init = init_resource.to_dict()
	var health = health_resource.to_dict()
	var contact = contact_resource.to_dict()
	var texture = texture_resource.to_dict()
	var action = action_resource.to_dict()
	return init.merged(health).merged(contact).merged(texture).merged(action)
