class_name ModuleResource extends Resource

@export var module_type: Module.ModuleType
@export var data: Dictionary

func _init(properties: Dictionary) -> void:
	module_type = properties.module_type
	data = properties.data
