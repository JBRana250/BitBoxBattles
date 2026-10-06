class_name ImportImageManager extends Node

enum FighterSpriteType {
	ACTIVE,
	INACTIVE
}

@export var fighter_sprite_type: FighterSpriteType
@export var viewport: SubViewport

func capture_and_save_avatar() -> ImageTexture:
	
	# Wait for Godot to complete the current render frame
	await RenderingServer.frame_post_draw
	
	# 1. Grab the rendered texture from the SubViewport
	var viewport_tex = viewport.get_texture()
	var img = viewport_tex.get_image()
	
	# 2. Ensure transparency / alpha channel is preserved
	img.convert(Image.FORMAT_RGBA8)
	
	# 3. Return an ImageTexture if you want to use it directly in-game
	return ImageTexture.create_from_image(img)
