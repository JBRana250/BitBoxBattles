class_name ImportImageManager extends Node

enum FighterSpriteType {
	ACTIVE,
	INACTIVE,
	SETUP
}

@export var fighter_sprite_type: FighterSpriteType
@export var image: TextureRect
@export var viewport: SubViewport

func get_sprite() -> ImageTexture:
	await RenderingServer.frame_post_draw
	var viewport_tex = viewport.get_texture()
	var img = viewport_tex.get_image()
	
	img.convert(Image.FORMAT_RGBA8)
	
	return ImageTexture.create_from_image(img)

func set_sprite(texture: Texture, position: Vector2, scale: Vector2) -> void:
	image.texture = texture
	image.position = position
	image.scale = scale

func get_properties() -> Dictionary:
	return {
		"texture": image.texture,
		"position": image.position,
		"scale": image.scale
	}
