extends Node

var module_scenes: ModuleScenes
var graphnode_scenes: GraphNodeScenes
var static_textures: StaticTextures

func _ready() -> void:
	module_scenes = ModuleScenes.new()
	graphnode_scenes = GraphNodeScenes.new()
	static_textures = StaticTextures.new()

func get_module_scene(type: Module.ModuleType) -> PackedScene:
	return module_scenes.get_scene(type)

func get_graphnode_scene(type: GraphNodeScenes.SceneType) -> PackedScene:
	return graphnode_scenes.get_scene(type)

func get_texture(id: StaticTextures.ID) -> Texture:
	return static_textures.get_texture(id)
