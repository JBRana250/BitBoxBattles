class_name TexturePointer extends Pointer

enum Type {
	STATIC,
	USER
}

var id: int
var type: Type

func _init(_id: int = StaticTextures.ID.GODOT, _type: Type = Type.STATIC) -> void:
	self.id = _id
	self.type = _type

static func create_from_dict(dict: Dictionary) -> TexturePointer:
	return TexturePointer.new(dict.id, dict.type)

func execute() -> Texture:
	match (type):
		Type.STATIC:
			return StaticData.get_texture(id)
		Type.USER:
			return UserData.get_texture(id)
	print_debug("invalid texture pointer type!")
	return null

func to_dict() -> Dictionary:
	return {
		"id": id,
		"type": type
	}
